Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0093623F2D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 10:58:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4Jk-0005sz-8l; Thu, 10 Nov 2022 04:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1ot4Jh-0005s5-MY
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:57:49 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1ot4Jf-00073e-1F
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:57:49 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0VUSZXiz_1668074259; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VUSZXiz_1668074259) by smtp.aliyun-inc.com;
 Thu, 10 Nov 2022 17:57:40 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH v1] virtio-net: fix for heap-buffer-overflow
Date: Thu, 10 Nov 2022 17:57:39 +0800
Message-Id: <20221110095739.130393-1-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
MIME-Version: 1.0
X-Git-Hash: a0d4629c32
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

Run shell script:

    cat << EOF | valgrind qemu-system-i386 -display none -machine accel=qtest, -m \
    512M -M q35 -nodefaults -device virtio-net,netdev=net0 -netdev \
    user,id=net0 -qtest stdio
    outl 0xcf8 0x80000810
    outl 0xcfc 0xc000
    outl 0xcf8 0x80000804
    outl 0xcfc 0x01
    outl 0xc00d 0x0200
    outl 0xcf8 0x80000890
    outb 0xcfc 0x4
    outl 0xcf8 0x80000889
    outl 0xcfc 0x1c000000
    outl 0xcf8 0x80000893
    outw 0xcfc 0x100
    EOF

Got:
    ==68666== Invalid read of size 8
    ==68666==    at 0x688536: virtio_net_queue_enable (virtio-net.c:575)
    ==68666==    by 0x6E31AE: memory_region_write_accessor (memory.c:492)
    ==68666==    by 0x6E098D: access_with_adjusted_size (memory.c:554)
    ==68666==    by 0x6E4DB3: memory_region_dispatch_write (memory.c:1521)
    ==68666==    by 0x6E31AE: memory_region_write_accessor (memory.c:492)
    ==68666==    by 0x6E098D: access_with_adjusted_size (memory.c:554)
    ==68666==    by 0x6E4DB3: memory_region_dispatch_write (memory.c:1521)
    ==68666==    by 0x6EBCD3: flatview_write_continue (physmem.c:2820)
    ==68666==    by 0x6EBFBF: flatview_write (physmem.c:2862)
    ==68666==    by 0x6EF5E7: address_space_write (physmem.c:2958)
    ==68666==    by 0x6DFDEC: cpu_outw (ioport.c:70)
    ==68666==    by 0x6F6DF0: qtest_process_command (qtest.c:480)
    ==68666==  Address 0x29087fe8 is 24 bytes after a block of size 416 in arena "client"

That is reported by Alexander Bulekov. https://gitlab.com/qemu-project/qemu/-/issues/1309

Here, the queue_index is the index of the cvq, but in some cases cvq
does not have the corresponding NetClientState, so overflow appears.

I add a check here, ignore illegal queue_index and cvq queue_index.

Note the queue_index is below the VIRTIO_QUEUE_MAX but greater or equal
than cvq index could hit this. Other devices are similar.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 hw/net/virtio-net.c        | 18 ++++++++++++++++--
 include/hw/virtio/virtio.h |  2 ++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 975bbc22f9..88f25709d6 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -549,7 +549,14 @@ static RxFilterInfo *virtio_net_query_rxfilter(NetClientState *nc)
 static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
-    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
+    NetClientState *nc;
+
+    /* validate queue_index and skip for cvq */
+    if (queue_index >= n->max_queue_pairs * 2) {
+        return;
+    }
+
+    nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
 
     if (!nc->peer) {
         return;
@@ -566,9 +573,16 @@ static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
 static void virtio_net_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
-    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
+    NetClientState *nc;
     int r;
 
+    /* validate queue_index and skip for cvq */
+    if (queue_index >= n->max_queue_pairs * 2) {
+        return;
+    }
+
+    nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
+
     if (!nc->peer || !vdev->vhost_started) {
         return;
     }
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 1423dba379..6e7c0c09f7 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -148,7 +148,9 @@ struct VirtioDeviceClass {
     void (*set_config)(VirtIODevice *vdev, const uint8_t *config);
     void (*reset)(VirtIODevice *vdev);
     void (*set_status)(VirtIODevice *vdev, uint8_t val);
+    /* Device must validate queue_index.  */
     void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
+    /* Device must validate queue_index.  */
     void (*queue_enable)(VirtIODevice *vdev, uint32_t queue_index);
     /* For transitional devices, this is a bitmap of features
      * that are only exposed on the legacy interface but not
-- 
2.32.0.3.g01195cf9f


