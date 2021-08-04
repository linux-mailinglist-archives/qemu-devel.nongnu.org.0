Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C682B3E00D2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 14:06:26 +0200 (CEST)
Received: from localhost ([::1]:40918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBFfF-0007vm-QD
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 08:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFYX-0005Tg-7L
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:59:29 -0400
Received: from mail-bn1nam07on2062.outbound.protection.outlook.com
 ([40.107.212.62]:12332 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFYU-0003lt-EL
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:59:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPNyDjM0gJ7JRddX7iS9A3lNBR6fksSXUtAODcjE4ARXHRMKIIF9C3EVaQmJtnomk+dUBeqQizy35I0oriAxlI0NAeFoll6XABxQZyaRCbhrMEJCARASMmgrTUV6WcCan+mNcL6w3j6ik5NjewLD4zjYpcJlYQS/DM9Pkl6VbI9q2wirYZj+hb0C7x/rMdf6J84q/cn09UU6pMVrz6iFEv7XCRsA/2o5oVSKuBCVgg4yN0RVCXTLvBMjguAxcszDBJoqSPPwH27sX9qhKZeQZ1Mc/OAvChPwABOl/ZFixkG1aZ9uVW2ilMZdvtu/w6wWuC24HRFiDA53s4FXqiQuSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOGpuMi48HiTkW/yWG4ZM9K6PccyJKwpksBwxNUWYW8=;
 b=knH9dYCaS+53VyA1udkwYBwU9LyHVDq3b8NBL9RC6eHXogdyDJlCwMwEUUM9Rv4e9Jp/sqbapZyPwTixEYFqFJB0ON1M1zfYaHa6T4r0xRsKyPvYAWGGK7Vn5GHBRpUxJutNoW+2aalR58w0os1oH1A2tJEMLbtUCCjIUA4fGLFgn5USYNgRGpViApACHlscA/M3EIa1BxftJNeAuXDshTSmwPL8vsH4/5ioN3ucqyrgns66Vhf+WcDZxRMhXQ9VIAaSiq9cSIHD7aeXppMN1rk/SRI2rS4F9C9Q55Xl/eWQmgQ1sq6JDzfDIkC8kJ1Pi2OqhtNlNVKST887tX2JYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOGpuMi48HiTkW/yWG4ZM9K6PccyJKwpksBwxNUWYW8=;
 b=WYoWZ+p0Qf3S+3bdE2Ty+gXrw+lHie4AfDsrVfrps9+JhBsV+W65QLLVnJbeNhTrnu4zONCJ6jXjEuG3M0/k/ZVPK4PLp878BUk8N3qLbO2oHf2VI12SGA4dXxNeWYHuhmEDIO+LzHaYSjKbkOwe/gxxDrDldXm3aeUo4bdsmS4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 11:59:21 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 11:59:21 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Thomas.Lendacky@amd.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, ehabkost@redhat.com, dovmurik@linux.vnet.ibm.com,
 tobin@ibm.com, jejb@linux.ibm.com
Subject: [PATCH v4 12/14] migration/ram: Force encrypted status for flash0 &
 flash1 devices.
Date: Wed,  4 Aug 2021 11:59:11 +0000
Message-Id: <803d6a4c8d497bdd191d3789469f7cfb6533a472.1628076205.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1628076205.git.ashish.kalra@amd.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:806:24::25) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 SA9PR13CA0110.namprd13.prod.outlook.com (2603:10b6:806:24::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.4 via Frontend Transport; Wed, 4 Aug 2021 11:59:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cc7a302-1c87-4425-a6a0-08d9573f4b7f
X-MS-TrafficTypeDiagnostic: SN1PR12MB2542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2542F0ED39E753451E22094D8EF19@SN1PR12MB2542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iXiflcPifWn9mszIoptQVEGYVmAo33Ck9/42pr/6Pvxytq9Ye13e2KspJ/8ta629Rj6eZ9xZAaH/tc3FI4FWHhOYtJT+0A/os96wGcg1+ZPq6CMnm8cxkNQBGCd1JW03DOrkcwlexqZVlbWlp8Zz6GquCGJXlSNew1hH8N0vGFDJhRBDKOdKjY7SC72Tca93Z5BgGBK+km/mjHWhv94wV2hh6oAkGRWUBN+eOUct+jAoUpt/hn1FLN7AY2x62+GC3mZWXWCs3toN+b3U/8NGLLOdf9ZYYZd+3e39kCw66sN49sC49W2iSYeK2/nImYPNcA0ckSN/k/VeKwd2gzeF82dapWA207fXRv/vxZEjpPM0ZzHViYoddri45jHjpf3f0YR3avwbK/WRIa2vFLPOReQF+0MJcAIfHLzSEfx5w9cVD4D0gz98eeVazGmrkBL1hkYWieU4O38j1Ns1XbBXdAeJ/NxC17Tw4gHyzMjwrAJZisjoz681bTVdrUtXQAIEzKfYmC7sNEEyzuw4Xt1AhGwlCoMeGsi47RtJt4M5DQ27WVXgVQalUCowzRCypi+ajF0zNPCOoz423DxCAzG+vUd2z77dd70EXeNd330/OTEkWD+9CiWp8RzW001TOlPTaK1l5BSAWx/vcG/zJ0tYna182986nUMPtKziraEIe4SL1PEr0qDeRtprfjL2OR09qgBxkH69At65LtN8BIZ8Cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(39850400004)(366004)(4326008)(83380400001)(66946007)(316002)(2906002)(2616005)(956004)(36756003)(86362001)(6666004)(8936002)(38350700002)(26005)(6916009)(38100700002)(478600001)(5660300002)(8676002)(6486002)(66476007)(66556008)(186003)(7696005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YgEtZPpcuTbswyJCg69XSjEvwAmebqo6KREB8bg5qfuAv9tXxkoRpTSC6bLj?=
 =?us-ascii?Q?sMV0IXs3zYTxfN99RklDGMXM5LxVruU/9pXucdctkzaplj0d2QrTBvY5LeKe?=
 =?us-ascii?Q?uSeznUkiMamDJux6gCAyKjfU2RTYpXfqQdgFufy3IxoHTf/Tfz8bHFQ9cSU2?=
 =?us-ascii?Q?+Xx8gX+yFqSRlIb63yaJaNaxUjwmuKvqu7I+AZNJQkUeiLjwGicxweNrtnLP?=
 =?us-ascii?Q?Ss34eC8QLYyaqx2Kyzs+c/zsqox16472fporuOzBCJz6Pg0h0qHV26TXwbHF?=
 =?us-ascii?Q?pCOCBDTsgWAaItirq+XPhQLBhczr9Ne5Gr/gS+yd7xN/o1ZfuuEQvY7G6L5A?=
 =?us-ascii?Q?tBhXEFG6UP6jpJkutGXTAVmvmgGe4racshjPtGFDm8s6iWz7Hurcy/idhf1K?=
 =?us-ascii?Q?HfcBg6+Lb2Y7xjOtineeV2yK0XL4JL9lTVFthSr0Cl3b/zRsUo0gPqVgqnRf?=
 =?us-ascii?Q?BQUlaE10EqDmjxVGALUxB0DpdLXhOVcBMqFGUYyvdzEBuCDC/5m9iosyuyLR?=
 =?us-ascii?Q?NAXYNQtOusouJErAVAtrbneKz1amRiTCT/4d4GzpqWbJ8Dy4zqWhQ/ZBjTnG?=
 =?us-ascii?Q?cyoEiMWAMcQNYMgVatLi+64P+lSldexE2HdKH0lLesPJy4+rJNUVSzvv2INz?=
 =?us-ascii?Q?WEBl/2k9Xja9JshxczdcLnUM/V0u2WjmX5IDS9te+9HkuHLMBKlukvx3fBsM?=
 =?us-ascii?Q?TulbaS3MhHs55qadJaRTM7MruUEFvWwnNKmYrW8dB/RPycdpQyjsAJM/vBv0?=
 =?us-ascii?Q?qj9eSurvQhSajTZmZfGy8Aft0onHHlW6WZHZCcfntH5Jmkv7CxDa5cZ0xf6o?=
 =?us-ascii?Q?ccF+Ca1oPXk+y2leLxP37jmNHQ9mBat9YEpOCGeyMbb3n/tweO3r0m5HG6fc?=
 =?us-ascii?Q?ugHx8q3+RNHM0eZVn0hOYlF7gdUD/E74U1cdl5K8aZ6E2eSJ3zFw0Q4hg+JJ?=
 =?us-ascii?Q?GV2hyd4Qui0j/ytokplUL6536fTwB1yA3zZTesRDl3kBANvAygrvWRTyn+hy?=
 =?us-ascii?Q?fwCrnfmDAnv1h0GNmJLS1/2TfJS+JGUKFA5pAmS3B02MhTNyzoX4QovJWR53?=
 =?us-ascii?Q?OcDHBn265EoVD7xxNfTg2WoCKXLEZGTuC78boAAxjq+HEZH+CbfXpw7grfTs?=
 =?us-ascii?Q?DYJ6tcCtRi57jzRJ10+RJRNVANhPpWH9hIMokwoO1L1fW7F9ypHxuV1b7YWg?=
 =?us-ascii?Q?33DhqpCwl2+nUFbQTvMbQEecClFIji5ICvBVHl4FQfKHCqPO+m/+fhSHpYL8?=
 =?us-ascii?Q?Hq081yAe29zZrNjPxOMZbAAW7LCkTJBkLEz7DHnxD7PjWfLZv6evaMf/57nr?=
 =?us-ascii?Q?rc5kS6BsgEosTa7tGWOQca6X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc7a302-1c87-4425-a6a0-08d9573f4b7f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 11:59:21.2068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LwxLcU2BDtgaE/TvG5WM2V5Hhh31TOxJTyis8Ys6O9w4rDkmBQBj0gRdY1nyvH4BF9Jo9LrdZOzcm79bwxn9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2542
Received-SPF: softfail client-ip=40.107.212.62;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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

From: Ashish Kalra <ashish.kalra@amd.com>

Currently OVMF clears the C-bit and marks NonExistent memory space
as decrypted in the page encryption bitmap. By marking the
NonExistent memory space as decrypted it gurantees any future MMIO adds
will work correctly, but this marks flash0 device space as decrypted.
At reset the SEV core will be in forced encrypted state, so this
decrypted marking of flash0 device space will cause VCPU reset to fail
as flash0 device pages will be migrated incorrectly.

Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 migration/ram.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 1cb8d57a89..4eca90cceb 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2074,6 +2074,14 @@ static bool encrypted_test_list(RAMState *rs, RAMBlock *block,
         return false;
     }
 
+    if (!strcmp(memory_region_name(block->mr), "system.flash0")) {
+        return true;
+    }
+
+    if (!strcmp(memory_region_name(block->mr), "system.flash1")) {
+        return false;
+    }
+
     /*
      * Translate page in ram_addr_t address space to GPA address
      * space using memory region.
-- 
2.17.1


