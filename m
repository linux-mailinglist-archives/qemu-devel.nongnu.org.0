Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705A42FD754
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:43:15 +0100 (CET)
Received: from localhost ([::1]:59920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HVi-0005gs-Gq
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPW-0000Nw-Kj
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:50 -0500
Received: from mail-dm6nam12on2125.outbound.protection.outlook.com
 ([40.107.243.125]:3041 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPU-0002pJ-Vk
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oG1vwjbK63tLDVqq9BMc8GuQxkqudUeRbxtErO9u5veiElv7Gsvxh/I1QE3vbzQim+R+8bad/sT2OQqfvDuixN5qgxgCqhixUX7el+Md0wHGmq0e0JPiVSeu9p8FTSyWl0uFAGn6u2h97fSjw25sUMGXyKX9bl4f1dc8XcQKF8pcflQG7cPYDQ8JiaPr2uZHxeDl5HfOLO1F/v86C7vPb+xCaAHUbfIbxFx1uvFX/jifEskZkbThrPbigOEES+HISvoGU/e5HIFAvvXtJOCh0gAsLn15TyHAaFOR49FkGqdmP/Gz7HFBNc7le2h2PzICmw4m7uT2uHSS/NXVaX3y1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMgma6zdfy74XeHBazPxxmrFc+fcpMct4JJYCFFiUpI=;
 b=DzEAaXmMNMxcpXwRPm8wPVBe5m7HbY8IoCGSEPbsfbNTSdOFkN/OBZudoz6XUJqrystreOiO5O+oWlkuloNoRPTevst+JvI/J3/XQHtGrpSerytefUCbNqS09/orSIpF+Om8bWrV6R7sb6FAEKbwuaCDoTWvOyW172VVfXq/kg5OhRjzpn0lfKbq6XxQMXu+uxD8nO8GVzVxKQsB7CTAjlVQoj7jNy35LJ0uHsWvimDdIoZP/gfjAQ7Gl+PAMCF1RikjHJ4Z94ribbqGM8PA9CR6HN2seo2OEQF4o5vi8xN5azUoDuTQva5kyYIezmBLGnS6qKxvsnFIiST+LLZiBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMgma6zdfy74XeHBazPxxmrFc+fcpMct4JJYCFFiUpI=;
 b=bTtM34xIP3YE1NyPCwy7uHN7hD6WV4/KjteCRSzHCID6lkUGRTvualR7ssvfxbW8vHqYMQTcynRNx5y09yAe/MM/DWUkEfBmG/YSWFqG7FBkmk9+PmHyQhDy8tasnwkm8fQ+n5pU7osRbFZHsk1O+XwGvy25TLJfeDvJN7QeOBk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5530.namprd03.prod.outlook.com (2603:10b6:806:b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Wed, 20 Jan
 2021 17:36:41 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:36:41 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] fuzz: enable dynamic args for generic-fuzz configs
Date: Wed, 20 Jan 2021 12:35:28 -0500
Message-Id: <20210120173536.265601-7-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120173536.265601-1-alxndr@bu.edu>
References: <20210120173536.265601-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL1PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::27) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0142.namprd13.prod.outlook.com (2603:10b6:208:2bb::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.8 via Frontend
 Transport; Wed, 20 Jan 2021 17:36:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86efc7c8-656e-4b19-c125-08d8bd69f226
X-MS-TrafficTypeDiagnostic: SA0PR03MB5530:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB55309DDC91771188D041B7D6BAA20@SA0PR03MB5530.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A5FteP2HhL2EAMclm4NMJmjBAtf9uLyyMfYGUfPSacsbd8eDWDWtil9wjlQNr8BEBAdz2Y+70RardinhcBLXS7VgRp9tD8AItvUBakFbMTW0ouyC8DVVEbpJx4b7LfgFS1qpzZln+4RedYKKzRXf4uGP/8k0lO6crGkUNONwv4p64QfUNBHDeN4wyhlKiaK7h6aahf/ojajPuHv9SnrCAZED/7A3yogCG5HVaZJj07NTd9C+0IiAqVCN0hqW3+5yuqd2gg444rnisFuOdKb3yQm8LJQkqXFGConlreB7Cs6/Ea64iCdJ55REEoP5j/XTggp2tomiEuNobp930gJBJudj6xMkNrHLuAZZf+5spZ2lP/hQczJv8x5b0aMRkmo8VmU+7k1Vpfte4Xljq7KvxjDVgJ2k7vghdB0YbyAAPDhCcwTlSOYKG2la5QhCtN8M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(8936002)(6512007)(66476007)(6486002)(8676002)(956004)(5660300002)(4326008)(2616005)(1076003)(75432002)(2906002)(66556008)(86362001)(83380400001)(6916009)(52116002)(186003)(6506007)(16526019)(498600001)(36756003)(54906003)(66946007)(26005)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Rfhb0Dxt2fZapPW8A0PdWt8B+1Fq4vRqZOyJsQ5g/ZKMn4BJg9x9Di3UbgN2?=
 =?us-ascii?Q?i2eIBWI96CRlGo3nBsgbKP0UVekVwIUQZuMzkSOWKDr2AmCJ9N77jKysOuil?=
 =?us-ascii?Q?FWiJMD3GeACrjTnfJYSkEw/YPLdLoH4MDfKT6MGWXWFQb2SUEXTTnQg2fxXl?=
 =?us-ascii?Q?Fngs9FfPp3sW7/lLUHmxDl/eEg+ejO8UfqOW3ynN8uUnNtatbrBjU6bQmXZP?=
 =?us-ascii?Q?UhNkJfMc7DEUJ0yqSJfX8UZsN9NO7b/d6HQEBPNcoJHTYVyBW8lnVRZgGBNJ?=
 =?us-ascii?Q?jxWnkhn0JfrkBCVJdKP4CkzUokgkRx4MgPfsi1yigxB958PlNExgb6wdz0HT?=
 =?us-ascii?Q?e9hEqC7M7s8e/q+8bz6BTgQvctYGrz2UIdFuD/59DdGSx32kUFSdBuvjqKYl?=
 =?us-ascii?Q?bzIzrk7s9SdzFl+NX/LhZV392AdL1imyQrqC9NYDT3zFToPi6f8gZBqzB3gj?=
 =?us-ascii?Q?uO8sdXrqxyUqZwKQvglZVERmoZMU3hno/URXL50RRyGCfUEGxw8AhPpaprbt?=
 =?us-ascii?Q?VsHaLdmP597OrK0rtPZz3jKzgOFH5d8zTJrh2FT+hl488JQTqUMvO+tvaItn?=
 =?us-ascii?Q?VI5LgIlYYqCvd++ZMLySMuqWE2ir6g24xBCFH28d4Lo5PNxyESvYfZ3yPeho?=
 =?us-ascii?Q?+19iWeN+8fnEb3A2wHZ5EzJQMMuPOhRnzR82X+/AIOLfWjLUC6OAQrk7LKak?=
 =?us-ascii?Q?l4un+ZZcRr+i5YghSyBP1Oeov45+6VI0EKR6HckcVt9hX1RUerNe5MJkM7Y+?=
 =?us-ascii?Q?nYwO6yqgryPd2Vy7RxBhUxVdfhHsidV/5ikHXAvi3+4AtGxu6IHMvPEokgGF?=
 =?us-ascii?Q?/AvYPQNmg9m1Y2bM6C3TBx2dJJpTT858LbvVrxLmz/CSFtcByop6oUB37ng9?=
 =?us-ascii?Q?CPHXEFdgLYAvM7pC0HD/Si1tG7cGKCiN5cpTjuc88BEnaJ2Jyxbsj4+v8zqf?=
 =?us-ascii?Q?bkfjG3vDyYO/9l09GDRGrQAnjvBR8FwQJ47au2n5iRbrCeBuGeEyr0gXwfJu?=
 =?us-ascii?Q?ScbZ?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 86efc7c8-656e-4b19-c125-08d8bd69f226
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:36:40.8594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgTUhKFWfo6M2qusfTLS86p/RqigeY6uObkm6SGCQc0ZE6PskF9AGkPmSDxdazva
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5530
Received-SPF: pass client-ip=40.107.243.125; envelope-from=alxndr@bu.edu;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some device configurations, it is useful to configure some
resources, and adjust QEMU arguments at runtime, prior to fuzzing. This
patch adds an "argfunc" to generic the generic_fuzz_config. When
specified, it is responsible for configuring the resources and returning
a string containing the corresponding QEMU arguments. This can be useful
for targets that rely on e.g.:
 * a temporary qcow2 image
 * a temporary directory
 * an unused TCP port used to bind the VNC server

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz.c         | 10 +++++++++-
 tests/qtest/fuzz/generic_fuzz_configs.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index be76d47d2d..6adf62a5be 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -936,12 +936,20 @@ static GString *generic_fuzz_cmdline(FuzzTarget *t)
 
 static GString *generic_fuzz_predefined_config_cmdline(FuzzTarget *t)
 {
+    gchar *args;
     const generic_fuzz_config *config;
     g_assert(t->opaque);
 
     config = t->opaque;
     setenv("QEMU_AVOID_DOUBLE_FETCH", "1", 1);
-    setenv("QEMU_FUZZ_ARGS", config->args, 1);
+    if (config->argfunc) {
+        args = config->argfunc();
+        setenv("QEMU_FUZZ_ARGS", args, 1);
+        g_free(args);
+    } else {
+        g_assert_nonnull(config->args);
+        setenv("QEMU_FUZZ_ARGS", config->args, 1);
+    }
     setenv("QEMU_FUZZ_OBJECTS", config->objects, 1);
     return generic_fuzz_cmdline(t);
 }
diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 7fed035345..1a133655ee 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -16,6 +16,7 @@
 
 typedef struct generic_fuzz_config {
     const char *name, *args, *objects;
+    gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
 } generic_fuzz_config;
 
 const generic_fuzz_config predefined_configs[] = {
-- 
2.28.0


