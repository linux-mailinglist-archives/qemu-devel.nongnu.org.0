Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824605A26AE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 13:14:53 +0200 (CEST)
Received: from localhost ([::1]:48524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRXIa-00054T-6o
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 07:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oRX0z-0002j8-NZ
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:56:41 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:38930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oRX0q-00018P-RA
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:56:37 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VNIr6si_1661511386; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VNIr6si_1661511386) by smtp.aliyun-inc.com;
 Fri, 26 Aug 2022 18:56:27 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, arei.gonglei@huawei.com,
 hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
Subject: [PATCH 6/8] vhost-net: vhost-user: update
 vhost_net_virtqueue_restart()
Date: Fri, 26 Aug 2022 18:56:18 +0800
Message-Id: <fdc5943bd7389abeeb922718bfef8809e37901a4.1661510725.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1661510725.git.kangjie.xu@linux.alibaba.com>
References: <cover.1661510725.git.kangjie.xu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.57;
 envelope-from=kangjie.xu@linux.alibaba.com;
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

Update vhost_net_virtqueue_restart() for vhost-user scenario.

In order to reuse some functions, we process the idx for
vhost-user case. It is because vhost_get_vq_index behave
differently in vhost-user.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 hw/net/vhost_net.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 8ad5743f7c..13b9c11e68 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -563,6 +563,9 @@ int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
     assert(vhost_ops);
 
     idx = vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
+    if (net->nc->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
+        idx -= net->dev.vq_index;
+    }
 
     r = vhost_virtqueue_start(&net->dev,
                               vdev,
@@ -572,6 +575,15 @@ int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
         goto err_start;
     }
 
+    if (vhost_ops->vhost_set_vring_enable) {
+        r = vhost_ops->vhost_set_vring_enable(&net->dev,
+                                              net->dev.vq_index + idx,
+                                              1);
+        if (r < 0) {
+            goto err_start;
+        }
+    }
+
     if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
         file.index = idx;
         file.fd = net->backend;
-- 
2.32.0


