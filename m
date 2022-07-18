Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FFE5784C8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:06:35 +0200 (CEST)
Received: from localhost ([::1]:42688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDROM-00036F-S9
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oDOpn-0007We-Oj
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:22:43 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:55022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oDOph-0000iv-N4
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:22:43 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R841e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VJidZvx_1658143045; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VJidZvx_1658143045) by smtp.aliyun-inc.com;
 Mon, 18 Jul 2022 19:17:25 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
Subject: [PATCH 12/16] vhost-net: introduce restart and stop for vhost_net's
 vqs
Date: Mon, 18 Jul 2022 19:17:09 +0800
Message-Id: <67cdafe53cfd096060957426c307d1580f3fd2e4.1658141552.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Jul 2022 09:49:05 -0400
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

Introduce vhost_virtqueue_restart(), which can restart the
virtqueue when the vhost net started running before.

Introduce vhost_virtqueue_stop(), which can disable the vq
and unmap vrings and the desc of the vq. When disabling the
vq, the function is blocked and waits for a reply.

Combining the two functions, we can reset a virtqueue with a
started vhost net.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 hw/net/vhost_net.c      | 55 +++++++++++++++++++++++++++++++++++++++++
 include/net/vhost_net.h |  5 ++++
 2 files changed, 60 insertions(+)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index ccac5b7a64..4f5f034c11 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -514,3 +514,58 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
 
     return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
 }
+
+void vhost_virtqueue_stop(VirtIODevice *vdev, NetClientState *nc,
+                          int vq_index)
+{
+    VHostNetState *net = get_vhost_net(nc->peer);
+    const VhostOps *vhost_ops = net->dev.vhost_ops;
+    int r;
+
+    assert(vhost_ops);
+
+    r = vhost_ops->vhost_set_single_vring_enable(&net->dev, vq_index, 0, true);
+    if (r < 0) {
+        goto err_queue_disable;
+    }
+
+    vhost_dev_virtqueue_release(&net->dev, vdev, vq_index);
+
+    return;
+
+err_queue_disable:
+    error_report("Error when releasing the qeuue.");
+}
+
+int vhost_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
+                            int vq_index)
+{
+    VHostNetState *net = get_vhost_net(nc->peer);
+    const VhostOps *vhost_ops = net->dev.vhost_ops;
+    int r;
+
+    if (!net->dev.started) {
+        return 0;
+    }
+
+    assert(vhost_ops);
+
+    r = vhost_dev_virtqueue_restart(&net->dev, vdev, vq_index);
+    if (r < 0) {
+        goto err_start;
+    }
+
+    r = vhost_ops->vhost_set_single_vring_enable(&net->dev, vq_index, 1,
+                                                 false);
+    if (r < 0) {
+        goto err_start;
+    }
+
+    return 0;
+
+err_start:
+    error_report("Error when restarting the queue.");
+    vhost_dev_stop(&net->dev, vdev);
+
+    return r;
+}
diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 387e913e4e..fcb09e36ef 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -48,4 +48,9 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net);
 
 int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
 
+void vhost_virtqueue_stop(VirtIODevice *vdev, NetClientState *nc,
+                          int vq_index);
+int vhost_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
+                            int vq_index);
+
 #endif
-- 
2.32.0


