Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4E25B8016
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 06:24:13 +0200 (CEST)
Received: from localhost ([::1]:36028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYJwa-0007RS-IZ
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 00:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1oYJtm-0001sK-8O
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:21:18 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:57126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1oYJtg-0003No-QB
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:21:17 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VPlaulR_1663129266; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VPlaulR_1663129266) by smtp.aliyun-inc.com;
 Wed, 14 Sep 2022 12:21:07 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, kangjie.xu@linux.alibaba.com
Subject: [PATCH v5 10/15] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_reset()
Date: Wed, 14 Sep 2022 12:20:50 +0800
Message-Id: <20220914042055.61939-11-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20220914042055.61939-1-xuanzhuo@linux.alibaba.com>
References: <20220914042055.61939-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 164b406b96
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.57;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-57.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

Introduce vhost_virtqueue_reset(), which can reset the specific
virtqueue in the device. Then it will unmap vrings and the desc
of the virtqueue.

Here we do not reuse the vhost_net_stop_one() or vhost_dev_stop(),
because they work at queue pair level. We do not use
vhost_virtqueue_stop() because it may stop the device in the
backend.

This patch only considers the case of vhost-kernel, when
NetClientDriver is NET_CLIENT_DRIVER_TAP.

Furthermore, we do not need net->nc->info->poll() because
it enables userspace datapath and we want to stop all
datapaths for this reset virtqueue here.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/vhost_net.c      | 25 +++++++++++++++++++++++++
 include/net/vhost_net.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index d28f8b974b..8beecb4d22 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -531,3 +531,28 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
 
     return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
 }
+
+void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
+                               int vq_index)
+{
+    VHostNetState *net = get_vhost_net(nc->peer);
+    const VhostOps *vhost_ops = net->dev.vhost_ops;
+    struct vhost_vring_file file = { .fd = -1 };
+    int idx;
+
+    /* should only be called after backend is connected */
+    assert(vhost_ops);
+
+    idx = vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
+
+    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
+        file.index = idx;
+        int r = vhost_net_set_backend(&net->dev, &file);
+        assert(r >= 0);
+    }
+
+    vhost_virtqueue_stop(&net->dev,
+                         vdev,
+                         net->dev.vqs + idx,
+                         net->dev.vq_index + idx);
+}
diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 387e913e4e..85d85a4957 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -48,4 +48,6 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net);
 
 int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
 
+void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
+                               int vq_index);
 #endif
-- 
2.32.0.3.g01195cf9f


