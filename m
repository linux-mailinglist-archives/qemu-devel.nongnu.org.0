Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060083E0099
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 13:57:08 +0200 (CEST)
Received: from localhost ([::1]:41202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBFWF-0005vX-0T
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 07:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFUc-00038k-LZ
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:55:26 -0400
Received: from mail-bn7nam10on2047.outbound.protection.outlook.com
 ([40.107.92.47]:30519 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFUa-00027A-Qn
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:55:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfYHk+Pv/gEQhi/eQQzOk5xoAnd11TpZV2UAWyShIR6eRUc4gaJblWPvGwiJC1qUkLWp6reHspGw9E5jO3HdqUdqCppHLUWdTHaYfPjEADTywRxX/VgTenPf6oqyBiHdCfOrezGHvMfkkWiwtdI9Srg57xYWkAuLVDZmXs2YKffIm3FGfOGBSi8ikQVmussz38mS8wYDLh3oVErhabUs3GueqzhV+AUikKDqEetdzCNI8lRA1dOPujwx+moxVc5VpcCbypkiaWX9ThJKPs8UWu2vJrfaZd6CgPZYPCOR1rS/kwVZyHiEZErRVhux19EdMKoA9JX6hbrOT53m5GknwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wL6VfR5EJV3AY7eiJEnuBlnPI2KUTx/dhEy/4aqiQ6g=;
 b=i+cDoX0FAyCYyKvhtXRxtsBJWysBaz6wtvBkRXOBmeo8K6GuYvwp5yW0wiZc8z2+TUtcUacI9+EEojXW/X15YSknKHygPpuee2DY3LAveup3OkVb5iCqvID2iq9uKxx7cDwManeTn7Zu06DJhReOMN+Yk+RC79gK3xYcd/719eBanhCG4NT4/DKnIgUz3VTuTzJE2RZb7T5eEIWh9xWCuz/IRl232RdwVCSS2Q63DFPlpnHpG8T2/YbgtFeZKNCULWxzmzj96d66tFYGbUtOZNmqJiiLw3/iVUUzgXMp5aFf23Y6rCo/iPdFg0tD7jEA4T4lep26fIwIZObiV425Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wL6VfR5EJV3AY7eiJEnuBlnPI2KUTx/dhEy/4aqiQ6g=;
 b=a/uO/JWbvdDfH809o+zNGQTpRsabDS0yn0bHyZ9JN67ncsdDm0E2fEiLv9YzUKGAlZntIjLZyO2LbzLz2MgHoKYKHF5FTwzHfPmXi5CXIxgonLc4MU0qRVl1Wqe4eo0Xkxh7kZX7DS/7WkeUG8pX+0jumFCVvL0try/1fv5YUdg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 11:55:22 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 11:55:22 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Thomas.Lendacky@amd.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, ehabkost@redhat.com, dovmurik@linux.vnet.ibm.com,
 tobin@ibm.com, jejb@linux.ibm.com
Subject: [PATCH v4 04/14] confidential guest support: introduce
 ConfidentialGuestMemoryEncryptionOps for encrypted VMs
Date: Wed,  4 Aug 2021 11:55:11 +0000
Message-Id: <74fce7be9bd219ce902851c0b27192fdefbf9ef1.1628076205.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1628076205.git.ashish.kalra@amd.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0123.namprd05.prod.outlook.com
 (2603:10b6:803:42::40) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 SN4PR0501CA0123.namprd05.prod.outlook.com (2603:10b6:803:42::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.8 via Frontend
 Transport; Wed, 4 Aug 2021 11:55:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8959b166-6084-4360-94e5-08d9573ebcff
X-MS-TrafficTypeDiagnostic: SA0PR12MB4413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB441336BFBC6243EAF976B10F8EF19@SA0PR12MB4413.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mnqnNSM9rQUFfroXDVovDygLjOX2guusvd+veuGMWNU2+7Xv3hP7t/VXGWrdyZXDpaAhO4RsoztiqmUA3PCdkSyom0N+D9Bf6YrUPFPnoJhM3Cy1Q4LBpEIl9QrN7byAYdAYy72l/6o8VK+J39nc1nU+sln96RTQ+OTwxxoWYfHgzB9BFbbv0kgIb3COL2MjjYhdBKGUTP4tbKmyJOGTOS9lDPBdurxzjtl05d0MOTmfzMOVvsKeFZ00A+mu23f5aq4zxjfEU6aVYXWiiHqUSZzKQfZHcLci54gQcoBZkw5HBRMTWW+Qd8KdISCZwVHVB+jkQgz07Tv29mXxwqas6YOeGoMEIF0O8Yt8JhVsT4bJJ1vxNdS9nKb2N/VdQTZcYaK3tWYUhbQ0DEsMIjgi3/wtr2U03cLoGApkLRn+hdoE5LloKMeiNnLy39XHdRAnZcVR+TbqmHZyUeHxn6QMnGsNsF5j3QyzEyzqT9wW/FQvpDLYnoogCQ1m6d7DPnvQ3wj/wE69Slk6ne4Pj3auub1MnSf8ch3TMVGdzMzHoLoEX2F6tOKPWNMt6pVU1k6zWqsAxKcZhAQ9eW5FO2L2s7mDgXfWtuDLQncFODJ7b20zdItnfVhsj1T8NSX7vKoB1azzdOfxaQjMTEFi8i+QHGnIHm/7P4KgEaUvyLxgsuhp+4o6uIZj1P4MB7bp0laSxZVunxc0wlnoV/Jzp4kqpMvqa75yHoxfx2LYSF4SDfs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(36756003)(38350700002)(2906002)(6486002)(8676002)(38100700002)(86362001)(5660300002)(478600001)(52116002)(7696005)(316002)(66946007)(2616005)(4326008)(186003)(6666004)(6916009)(26005)(66476007)(8936002)(66556008)(956004)(213903007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U2uc4vfuLyRkIAuPzHuqm1dZI3nnK5CcwWPHpzsBPCGlKx8G33LBjTRxBEQe?=
 =?us-ascii?Q?HxJWsRBDvmYY3VneleGGTOlNW1iVY10D24OC3GrZgvmGuGIcBgg66MjeFh52?=
 =?us-ascii?Q?/F9HAZvowrpNXbZbe33gdbsRamt09EOqqkZfFZJBxqei0rFvIlKq+vu7Liwj?=
 =?us-ascii?Q?ZoRglY2zO9vBzXPUPndvVHW6D2JDo7PQxXLh9urmjJkdBdpNqharL4uE67B3?=
 =?us-ascii?Q?ODH8CDO7nB2PM8mu3FXgU1qhJPbBPAiZbuwX8BsIzlhEXboOLZhJwyEmb06s?=
 =?us-ascii?Q?A5eXj56kjsssitnao2uSvF2d/2ByXfKjbQuALYPshe2VVlU31Fa5xreRFV9q?=
 =?us-ascii?Q?1Cyi9WMJS7MdKIF+SM3lsHkduJWDQtOaVWUQoErERyAk8S3sSrzBEPzSSgwe?=
 =?us-ascii?Q?+C+uIL9R5JCs51fzEzPRi69Cs0rDUaapbjymEgbBtlhi6pnwK2mNhRwAIXlc?=
 =?us-ascii?Q?ZPoQYfb2xLZB0JAWmsJ1BTZOkF8CYyFuqjFoT9PZp21WUdLF1OyM9Q6o/sIK?=
 =?us-ascii?Q?67Jg6hU318QLC97ddYQZprOl4qKpJS0cmQ+MJnxAq0eXN6lvBkM9UJc4ybag?=
 =?us-ascii?Q?hp+UyWYsHRg2Qag/k7CZ33IStysIkO45SCZQHlo4VawvkE+qDp5KD4QYzzJy?=
 =?us-ascii?Q?5zV1+TphV8+hk6Kntz67q1TRCHKhiW/4C2U4kkY6PnvYUgDnSp5lWC2j2/Zm?=
 =?us-ascii?Q?OULNtUuXISB7eVjuDD8NFrsSxJHVJwMK9tdVpxcEYCocRDxtOrJHRoPdDXqN?=
 =?us-ascii?Q?mAU3Q5Uj6YrTXW2ZfLyluR//8Z98fWS6YPy1xrA/ZobvfRbcFwxctl1fEKiz?=
 =?us-ascii?Q?fbRkq1DOCfd+LVf8hPKqSnDewMXyx/11c17RqOHRwxt3FH7OqPXkcaNya3br?=
 =?us-ascii?Q?QRYQfJmxX04LF/bIV/RD0IksXInIvWhKO+V2RkijnJHOqqd3spgPZ895X+l0?=
 =?us-ascii?Q?bbJ+Ary7rVETAjqx84O9194bllJG1rMq2O3WDVN5KrzV5daz82HJUJbK0FWR?=
 =?us-ascii?Q?B1/ItqOIPKCu9UwKMemsK5la7h6RM6Bl3CHkBsywRU4YncMfaVPGVP5k+yi7?=
 =?us-ascii?Q?7Nn1sURpU+tJhdTmBe3BDpFq7yvkf4Oe9MzwJXhOq3mF+JXvHmkjypp7CyGj?=
 =?us-ascii?Q?XVrTrIzd2r/H3qgQBvtyOqjsicd2G1ai6aBLQG+CHzK3vgbMc7Z1gFmfyP7V?=
 =?us-ascii?Q?Oi825Q+fFADUzEuNEK4HTNNuajAw7MfQgxWetrMD3PfARNDHAshdKfNPf7hf?=
 =?us-ascii?Q?GdpRcfv7NBvC+TskyGHeN9whrRk+GHfpUBsrjLhW26HmefLKpSjtsa2KF2Ij?=
 =?us-ascii?Q?Hg5ZQ22k2YnCvzJC4R6Ef4gN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8959b166-6084-4360-94e5-08d9573ebcff
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 11:55:22.1410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTWdhxlXCY6ucFj10t+0ocJUU3SD7SYDovUef/iEmdSnGkaV/lJ7zqs29yZkqx+MZ6BlMoYjl/qCOmkeXQGa/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413
Received-SPF: softfail client-ip=40.107.92.47;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brijesh Singh <brijesh.singh@amd.com>

When memory encryption is enabled in VM, the guest RAM will be encrypted
with the guest-specific key, to protect the confidentiality of data while
in transit we need to platform specific hooks to save or migrate the
guest RAM.

Introduce the new ConfidentialGuestMemoryEncryptionOps in this patch
which will be later used by the encrypted guest for migration.

Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Co-developed-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 include/exec/confidential-guest-support.h | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/exec/confidential-guest-support.h b/include/exec/confidential-guest-support.h
index ba2dd4b5df..d8b4bd4c42 100644
--- a/include/exec/confidential-guest-support.h
+++ b/include/exec/confidential-guest-support.h
@@ -20,6 +20,7 @@
 
 #ifndef CONFIG_USER_ONLY
 
+#include <qapi/qapi-types-migration.h>
 #include "qom/object.h"
 
 #define TYPE_CONFIDENTIAL_GUEST_SUPPORT "confidential-guest-support"
@@ -53,8 +54,34 @@ struct ConfidentialGuestSupport {
     bool ready;
 };
 
+/**
+ * The functions registers with ConfidentialGuestMemoryEncryptionOps will be
+ * used during the encrypted guest migration.
+ */
+struct ConfidentialGuestMemoryEncryptionOps {
+    /* Initialize the platform specific state before starting the migration */
+    int (*save_setup)(MigrationParameters *p);
+
+    /* Write the encrypted page and metadata associated with it */
+    int (*save_outgoing_page)(QEMUFile *f, uint8_t *ptr, uint32_t size,
+                              uint64_t *bytes_sent);
+
+    /* Load the incoming encrypted page into guest memory */
+    int (*load_incoming_page)(QEMUFile *f, uint8_t *ptr);
+
+    /* Check if gfn is in shared/unencrypted region */
+    bool (*is_gfn_in_unshared_region)(unsigned long gfn);
+
+    /* Write the shared regions list */
+    int (*save_outgoing_shared_regions_list)(QEMUFile *f);
+
+    /* Load the shared regions list */
+    int (*load_incoming_shared_regions_list)(QEMUFile *f);
+};
+
 typedef struct ConfidentialGuestSupportClass {
     ObjectClass parent;
+    struct ConfidentialGuestMemoryEncryptionOps *memory_encryption_ops;
 } ConfidentialGuestSupportClass;
 
 #endif /* !CONFIG_USER_ONLY */
-- 
2.17.1


