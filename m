Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518612BA1A1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 06:04:36 +0100 (CET)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfyb4-0003O3-Tz
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 00:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <RockCui-oc@zhaoxin.com>)
 id 1kfyZx-0002wJ-Kk
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 00:03:25 -0500
Received: from zxshcas1.zhaoxin.com ([203.148.12.81]:51856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <RockCui-oc@zhaoxin.com>)
 id 1kfyZu-00076p-Gx
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 00:03:25 -0500
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS1.zhaoxin.com
 (10.28.252.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 13:03:12 +0800
Received: from zhaoxin-ubuntu20.04 (124.64.17.38) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 13:03:10 +0800
From: "zhaoxin\\RockCuioc" <RockCui-oc@zhaoxin.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2] virtio-blk: seg_max do not subtract 2 if host has
 VIRTIO_RING_F_INDIRECT_DESC feature
Date: Fri, 20 Nov 2020 13:03:03 +0800
Message-ID: <20201120050303.5769-1-RockCui-oc@zhaoxin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [124.64.17.38]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
Received-SPF: pass client-ip=203.148.12.81;
 envelope-from=RockCui-oc@zhaoxin.com; helo=ZXSHCAS1.zhaoxin.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: RockCui@zhaoxin.com, CobeChen@zhaoxin.com, flyfan@zhaoxin.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1 -> v2:
    fix codestyle checked by checkpatch.pl

This patch modify virtio-blk seg_max when host has VIRTIO_RING_F_INDIRECT_DESC feature, when read/write virtio-blk disk in direct mode, 
this patch can make the bio reach 512k but not 504k if the user buffer physical segments are all discontinuous,when use ceph the size of 504k 
will affect performance.This patch should be used in guest kernel version>=4.14, kernel after this version virtio driver does not judge 
total_sg and vring num if the host supports indirect descriptor tables.  

Signed-off-by: zhaoxin\RockCuioc <RockCui-oc@zhaoxin.com>
---
 hw/block/virtio-blk.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index bac2d6f..40bbbd7 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -932,7 +932,11 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
     blk_get_geometry(s->blk, &capacity);
     memset(&blkcfg, 0, sizeof(blkcfg));
     virtio_stq_p(vdev, &blkcfg.capacity, capacity);
-    virtio_stl_p(vdev, &blkcfg.seg_max,
+    if virtio_host_has_feature(vdev, VIRTIO_RING_F_INDIRECT_DESC)
+        virtio_stl_p(vdev, &blkcfg.seg_max,
+                 s->conf.seg_max_adjust ? s->conf.queue_size : 128);
+    else
+        virtio_stl_p(vdev, &blkcfg.seg_max,
                  s->conf.seg_max_adjust ? s->conf.queue_size - 2 : 128 - 2);
     virtio_stw_p(vdev, &blkcfg.geometry.cylinders, conf->cyls);
     virtio_stl_p(vdev, &blkcfg.blk_size, blk_size);
-- 
2.10.1.windows.1


