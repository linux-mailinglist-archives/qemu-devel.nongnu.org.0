Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A273569FA6C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:51:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtFh-0000Hb-T3; Wed, 22 Feb 2023 12:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtFg-0000HH-0Z
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:00 -0500
Received: from mail-bn8nam11on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::600]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtFe-0004GD-28
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:49:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W42HO2cOtMpeWuFrM7EG8DEMRRpXOQBqWIz2qFRO6BV5jvKt4m00skk8aNcQLejHFPVPdy+qBNMPvvqUMlddUcEWQIPrF7fm57csw6mzTLJp9EAS3pfYx0P5lRUUyrPq3zKrkaTIj+exCSGCVBDKZVsj1pAxL1ac7ogD3+X00wBpvB5vLJ7T32d7KRv9e3DaNrC9GPYbVanOfxWoKJ9BVWa/5F5JqDafAEeaPuovItPy90DJH4BAkqbWHhe1UZvz4kVJOwFXFoec2+I4pg9L/XUmcOVBZ86Y+hooC9hNgKtQNojIXz0DUnrNGqcmX883+PmdF9UUrJBZQaqZeIR3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdyRRTetDwxFgF/Olcd3F36AuidHyC6CwLsxd6C+c2Q=;
 b=RzI/EEiq09xw5g281q7LVSa50U+HwXPDy9s0a6MFm4EWaPg+m0ph+1ywyCttaoyNPpDry6CSzh0GaK/cSEBFMm6Zoci8rpiin+1pAj1rz2M6g1YmlyqKOqSWxVXHaxbdAqmQaeldn8HanZbwv5r+wW3DKbNYAhA/pqcwa7lmBXkge0Yb96rjnProbJ0Oz5yHWaglwSNIhlgap5JnBhlXUKkt3nLBXxcdiFHQNFZy0EbaVaIhsrIdTa2WlZxRNsgoQYw4H3kmfZMsr5d/WKI9hgIMHAWFpGSMDITfw2oThK+NE1aEbxN4SCOz6a/1PEMXLY7VxClDwhItaWazcu1DUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdyRRTetDwxFgF/Olcd3F36AuidHyC6CwLsxd6C+c2Q=;
 b=hxNjG27Eui/ZL01VttUVFCrFsioiw9UCDZKJz5VzbbZssjT0GJDDfLFANn1AsCyvIkxSI7SdDfNxaZjPPYE72cfbPii4jff7VXfSpb/lUI4Vwij5RSFMsnGgLLRJDrBhDp4gLTVlJIwrOvaV2NtOPkRjxv5MyjARd9D4M1mQYV/Wj8UHo9gcWVX0uZ63BuDxjVGOSH0RCQBWl4VMiyTmznM9K+xJ6P0FAiucckTubyWc53yVk/V+Nta9P+YkxArXdJHCpIbHHuvIo6KmRoDt7I/U8m1Q0LJ0pfhA7x2WmLiYgwoFrMo+0XkQsZfBrCx2eEZhPXvpfeBZ8emxp49I8A==
Received: from BN0PR04CA0062.namprd04.prod.outlook.com (2603:10b6:408:ea::7)
 by MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 17:49:51 +0000
Received: from BL02EPF0000C405.namprd05.prod.outlook.com
 (2603:10b6:408:ea:cafe::c) by BN0PR04CA0062.outlook.office365.com
 (2603:10b6:408:ea::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21 via Frontend
 Transport; Wed, 22 Feb 2023 17:49:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0000C405.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.14 via Frontend Transport; Wed, 22 Feb 2023 17:49:50 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:49:33 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:49:32 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:49:27 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, "Jason
 Wang" <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v2 02/20] vfio/migration: Refactor vfio_save_block() to return
 saved data size
Date: Wed, 22 Feb 2023 19:48:57 +0200
Message-ID: <20230222174915.5647-3-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C405:EE_|MW3PR12MB4553:EE_
X-MS-Office365-Filtering-Correlation-Id: 327923af-0b8c-48e4-7dee-08db14fd3224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JDodYKwK9z/WSRLevFDTR5WYCBONJlGsu3uppR8mJV8QdAiS3i+aiwDtFqZGU8pGu3cP9agy9neANfMCQ1Di0uka0bWggZxL5F9xvmekLPYva8asCQgHL6Poti4rkW8XYnH3QvqCSJHBmAqXGRQxC+ufbbabLEwynklReaLYgsF3aEfNNDr2Sgv+lUry6WJVTvCpy431BaHFFJveDIel8VanP5p2c4QSm7A71mt0OxpkBTUNIKRSvfIBFSYOdNLCgowPTB3T5AS0oePOXBTR+bMsv/D7y4ZsQpo3VyTo+nveA1Hc7qoTrqE8SPGfHRIRWnpm8vZjNsAGAZ1+U6G79cBEk8o9COtA6Xfn8b9Q7e8NjFoS/mUbMfaWzRU6nIMDY5GKXg8+5p4wrE9XjgONcUl7y8/je66SovjRIokBfCM/p3T/WiRlkegW8Q9qCM9ddBAY/VCP8ftE2HMkElHeUIu2aY9X0ip2AQGpg6yk6AnvMJ/4Dkeny8bBWMpX/bx6dtubobH1MqvfQg0hFydEvJTBQdYZTu785aTw5vM5PM0ED6AkWElVOPjbFw0s9qXIT9wwxk67GqDWckCcQIm9eBr1m/WutMGF2WXAsJCyR/JXxTP4nn741dVUrSWbP39MTqyXdqlK+2vnH/hvkUD9QkAm5SFsqv305Fssk7Tpi0hBDUu2z27eSBIFJiRMw8qqIVoCcsNLmlNIKCdszbmqYQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199018)(40470700004)(46966006)(36840700001)(86362001)(82310400005)(2616005)(316002)(54906003)(40460700003)(36860700001)(2906002)(70206006)(70586007)(7416002)(8676002)(4326008)(6916009)(5660300002)(41300700001)(1076003)(47076005)(6666004)(186003)(26005)(478600001)(426003)(40480700001)(36756003)(7696005)(336012)(82740400003)(7636003)(356005)(8936002)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:49:50.1559 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 327923af-0b8c-48e4-7dee-08db14fd3224
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C405.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4553
Received-SPF: softfail client-ip=2a01:111:f400:7eae::600;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Refactor vfio_save_block() to return the size of saved data on success
and -errno on error.

This will be used in next patch to implement VFIO migration pre-copy
support.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/migration.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 4fb7d01532..94a4df73d0 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -240,8 +240,8 @@ static int vfio_query_stop_copy_size(VFIODevice *vbasedev,
     return 0;
 }
 
-/* Returns 1 if end-of-stream is reached, 0 if more data and -errno if error */
-static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
+/* Returns the size of saved data on success and -errno on error */
+static ssize_t vfio_save_block(QEMUFile *f, VFIOMigration *migration)
 {
     ssize_t data_size;
 
@@ -251,7 +251,7 @@ static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
         return -errno;
     }
     if (data_size == 0) {
-        return 1;
+        return 0;
     }
 
     qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
@@ -261,7 +261,7 @@ static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
 
     trace_vfio_save_block(migration->vbasedev->name, data_size);
 
-    return qemu_file_get_error(f);
+    return qemu_file_get_error(f) ?: data_size;
 }
 
 /* ---------------------------------------------------------------------- */
@@ -335,6 +335,7 @@ static void vfio_state_pending_exact(void *opaque, uint64_t threshold_size,
 static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
+    ssize_t data_size;
     int ret;
 
     /* We reach here with device state STOP only */
@@ -345,11 +346,11 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     }
 
     do {
-        ret = vfio_save_block(f, vbasedev->migration);
-        if (ret < 0) {
-            return ret;
+        data_size = vfio_save_block(f, vbasedev->migration);
+        if (data_size < 0) {
+            return data_size;
         }
-    } while (!ret);
+    } while (data_size);
 
     qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
     ret = qemu_file_get_error(f);
-- 
2.26.3


