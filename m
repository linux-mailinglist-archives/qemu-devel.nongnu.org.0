Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A0C474F27
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:26:26 +0100 (CET)
Received: from localhost ([::1]:53332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxI7l-0004eA-3T
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:26:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHqg-00088G-4g; Tue, 14 Dec 2021 19:08:46 -0500
Received: from mail-mw2nam12on2056.outbound.protection.outlook.com
 ([40.107.244.56]:22737 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHqd-0005J1-Kc; Tue, 14 Dec 2021 19:08:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ja1I3OhfiMWIG1x7st8Ix5b7IRs4K0zOkujdTuMQa2fQ9aC93sorzCjTiFm/vgJbCTTqy3YxrKgbHG88GpYeHKw/8nVj6hLqt2qQisO9bla1886Z875apCfdYyEifu+0DDhWgaWXyaar+Dg7QyysaiDwipXo/PJfLVkFrrQhCfncepK7H6jEY5MO1b8ufo1WmyZTGlnwuiSfDa6M02xNZeoxVpEahxprcBBqkk73Duzfs3mrWaAumExzgJm/tA1pFwv8SMqpzyUx4nKEPOAvXEICmPf9FijZBXfxRnImzMSBywsuaUTfs2EMp5y4JS70Ig2OD6UIhHI6IiYsR455Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWsFGujV6wZzyGQ51qVHla/QaxHpusuYgK5meW5BNJM=;
 b=a96W/AiyZphiUqJ3MKOqwh1yDooR8BrUf8+0nFFOCPKi/RyiOhAI0Or0sb9qWS5cSgm77yi5DevSBVOD1yB/+thAMWoyJPZiB4IyKXYcUud2FVIhYM6YXsDxZCdRzT49dFjRt6PyHaxMFaJwuHH1VQA7enTKf1g5z6ZIB4Vm9hX24Sliim5hvzjdzoGi54a2/srXHW9cdyORIFKfSI3zencoHpbHNha05ZKkX7sepb3FrNtosIibnrmGj5VAk0TxEpNGNftLirmKJAQR5GR1cRj8GgAQYeI41xaGtbQ6SBRMBIgBLMNTJH4/FLbfT6+pRg3E2Yr80cXYT13/u5aN/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWsFGujV6wZzyGQ51qVHla/QaxHpusuYgK5meW5BNJM=;
 b=xUEWj4P52YZ/vMoKrH8o6wmLfHcCrHIUZLVf+sQuqWkcHmRgeiy0ZhQLLpb92BeEp72Esxivfc2FYosYFz4d/WZL8SP1mUZ4/4T1k2eahNXSJ5LkOTIlb3QzI5p8orte/uitZO8UqlX5jY7+M/D3BSKOK/q9cQCCtbrKe5MO2QU=
Received: from MW4PR04CA0167.namprd04.prod.outlook.com (2603:10b6:303:85::22)
 by DM5PR12MB2423.namprd12.prod.outlook.com (2603:10b6:4:b3::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Wed, 15 Dec
 2021 00:08:39 +0000
Received: from CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::43) by MW4PR04CA0167.outlook.office365.com
 (2603:10b6:303:85::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Wed, 15 Dec 2021 00:08:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT034.mail.protection.outlook.com (10.13.174.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:08:39 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:08:37 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Hanna Reitz <hreitz@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, <qemu-block@nongnu.org>
Subject: [PATCH 22/47] block: introduce max_hw_iov for use in scsi-generic
Date: Tue, 14 Dec 2021 18:01:00 -0600
Message-ID: <20211215000125.378126-23-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0ef2db9-cafc-45fd-4225-08d9bf5f0c3f
X-MS-TrafficTypeDiagnostic: DM5PR12MB2423:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB2423BCE0D5F2FFDAA69E867D95769@DM5PR12MB2423.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V+6moM+u8xzIvkC31+So+n8EAZKdvbd7PwqyKwRycIL3Ef8CKJW7/L6o/R121xZxU+Ps2DwMSPAgmC1wnGz5yDEn967iWDd3W7NDivVwUpDeu/qLnzfPZ9C1twCFaWs0NPblsCAO9CFitNFo0DTMX1+NhPDu47JhQPxP5NISRkyC3/cb7p7IFepVBwXfW+xNDivrh8GnjS0IjgFALyvhRFpIHIMj6xJw+sdJr5Hl5wGrCTm9+LHtk645X3ATpSjKiCwUZ9BPVa8sI23Yt47hAHklD7RX8WhZ+QAXHC5HYt3NQlCztLBn80UVcr8Tw8yhrywVym6RGI+L9ZiDetDq2JKDTW0k1Qx9WY/dnrsq96RYYXppNuHsWnjbPSRm8/DNkfakFJwdnWsjGBETemlrDWsDtPZwbokhpM8n/375rE2JjCqfmK78mukod0TSPJskCkb+of7oH7u4B0LW6NsoEypEpwNbs9isLDtAlKCDRlHlhtpTffZ8f1evQ4PruOmjKkidzOvdtcmKRaqWXB7cIYEq0Bc36zSObv3Np7rv6ITcdm2HsuCrxm0+DD9yIWwJIecTRyKga0sTf5z+pHeT5on3Ot8vqBx2jJaVlQDYLattfuaYqgoJarHA7plHrSMxQkG+ICe5wo6smprmEjlJhPvvCkFNM1w5AmlMfkfzuj0VGXk6bDG9kVcf7W7HkVVQ+wPj+/tKg1/ndXeJqLEeK22bILQbHfii7s5b1ceWHvQazWgbkLWvye5DqkG60Ea3jNjTu6f91/NBhnRS3St0dMFyT2IMO5yF44zHn1mClBXc4HukEY/Zi8jcZFIJtR+C9i2EQI/OwMDXZJPTm+GO0w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(426003)(40460700001)(2906002)(508600001)(44832011)(6916009)(8936002)(54906003)(83380400001)(2616005)(81166007)(36860700001)(5660300002)(8676002)(82310400004)(316002)(356005)(26005)(1076003)(36756003)(6666004)(86362001)(186003)(4326008)(16526019)(47076005)(336012)(70206006)(70586007)(41533002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:08:39.6284 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ef2db9-cafc-45fd-4225-08d9bf5f0c3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2423
Received-SPF: softfail client-ip=40.107.244.56;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Linux limits the size of iovecs to 1024 (UIO_MAXIOV in the kernel
sources, IOV_MAX in POSIX).  Because of this, on some host adapters
requests with many iovecs are rejected with -EINVAL by the
io_submit() or readv()/writev() system calls.

In fact, the same limit applies to SG_IO as well.  To fix both the
EINVAL and the possible performance issues from using fewer iovecs
than allowed by Linux (some HBAs have max_segments as low as 128),
introduce a separate entry in BlockLimits to hold the max_segments
value from sysfs.  This new limit is used only for SG_IO and clamped
to bs->bl.max_iov anyway, just like max_hw_transfer is clamped to
bs->bl.max_transfer.

Reported-by: Halil Pasic <pasic@linux.ibm.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org
Cc: qemu-stable@nongnu.org
Fixes: 18473467d5 ("file-posix: try BLKSECTGET on block devices too, do not round to power of 2", 2021-06-25)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210923130436.1187591-1-pbonzini@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
(cherry picked from commit cc071629539dc1f303175a7e2d4ab854c0a8b20f)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 block/block-backend.c          | 6 ++++++
 block/file-posix.c             | 2 +-
 block/io.c                     | 1 +
 hw/scsi/scsi-generic.c         | 2 +-
 include/block/block_int.h      | 7 +++++++
 include/sysemu/block-backend.h | 1 +
 6 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index deb55c272e..6320752aa2 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1978,6 +1978,12 @@ uint32_t blk_get_max_transfer(BlockBackend *blk)
     return ROUND_DOWN(max, blk_get_request_alignment(blk));
 }
 
+int blk_get_max_hw_iov(BlockBackend *blk)
+{
+    return MIN_NON_ZERO(blk->root->bs->bl.max_hw_iov,
+                        blk->root->bs->bl.max_iov);
+}
+
 int blk_get_max_iov(BlockBackend *blk)
 {
     return blk->root->bs->bl.max_iov;
diff --git a/block/file-posix.c b/block/file-posix.c
index cb9bffe047..1567edb3d5 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1273,7 +1273,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 
         ret = hdev_get_max_segments(s->fd, &st);
         if (ret > 0) {
-            bs->bl.max_iov = ret;
+            bs->bl.max_hw_iov = ret;
         }
     }
 }
diff --git a/block/io.c b/block/io.c
index a19942718b..f38e7f81d8 100644
--- a/block/io.c
+++ b/block/io.c
@@ -136,6 +136,7 @@ static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
     dst->min_mem_alignment = MAX(dst->min_mem_alignment,
                                  src->min_mem_alignment);
     dst->max_iov = MIN_NON_ZERO(dst->max_iov, src->max_iov);
+    dst->max_hw_iov = MIN_NON_ZERO(dst->max_hw_iov, src->max_hw_iov);
 }
 
 typedef struct BdrvRefreshLimitsState {
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 665baf900e..0306ccc7b1 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -180,7 +180,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)
         page = r->req.cmd.buf[2];
         if (page == 0xb0) {
             uint64_t max_transfer = blk_get_max_hw_transfer(s->conf.blk);
-            uint32_t max_iov = blk_get_max_iov(s->conf.blk);
+            uint32_t max_iov = blk_get_max_hw_iov(s->conf.blk);
 
             assert(max_transfer);
             max_transfer = MIN_NON_ZERO(max_transfer, max_iov * qemu_real_host_page_size)
diff --git a/include/block/block_int.h b/include/block/block_int.h
index f1a54db0f8..c31cbd034a 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -702,6 +702,13 @@ typedef struct BlockLimits {
      */
     uint64_t max_hw_transfer;
 
+    /* Maximal number of scatter/gather elements allowed by the hardware.
+     * Applies whenever transfers to the device bypass the kernel I/O
+     * scheduler, for example with SG_IO.  If larger than max_iov
+     * or if zero, blk_get_max_hw_iov will fall back to max_iov.
+     */
+    int max_hw_iov;
+
     /* memory alignment, in bytes so that no bounce buffer is needed */
     size_t min_mem_alignment;
 
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 9ac5f7bbd3..5daec61f6e 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -210,6 +210,7 @@ uint32_t blk_get_request_alignment(BlockBackend *blk);
 uint32_t blk_get_max_transfer(BlockBackend *blk);
 uint64_t blk_get_max_hw_transfer(BlockBackend *blk);
 int blk_get_max_iov(BlockBackend *blk);
+int blk_get_max_hw_iov(BlockBackend *blk);
 void blk_set_guest_block_size(BlockBackend *blk, int align);
 void *blk_try_blockalign(BlockBackend *blk, size_t size);
 void *blk_blockalign(BlockBackend *blk, size_t size);
-- 
2.25.1


