Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BB35B8043
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 06:26:46 +0200 (CEST)
Received: from localhost ([::1]:36126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYJz3-0004h4-Ht
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 00:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1oYJtm-0001tk-LB
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:21:18 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:54753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1oYJth-0003O4-PD
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:21:18 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VPlXa9B_1663129268; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VPlXa9B_1663129268) by smtp.aliyun-inc.com;
 Wed, 14 Sep 2022 12:21:09 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, kangjie.xu@linux.alibaba.com
Subject: [PATCH v5 12/15] virtio-net: introduce flush_or_purge_queued_packets()
Date: Wed, 14 Sep 2022 12:20:52 +0800
Message-Id: <20220914042055.61939-13-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20220914042055.61939-1-xuanzhuo@linux.alibaba.com>
References: <20220914042055.61939-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 164b406b96
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.56;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-56.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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

Introduce the fucntion flush_or_purge_queued_packets(), it will be
used in device reset and virtqueue reset. Therefore, we extract the
common logic as a new function.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index dd0d056fde..27b59c0ad6 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -118,6 +118,16 @@ static int vq2q(int queue_index)
     return queue_index / 2;
 }
 
+static void flush_or_purge_queued_packets(NetClientState *nc)
+{
+    if (!nc->peer) {
+        return;
+    }
+
+    qemu_flush_or_purge_queued_packets(nc->peer, true);
+    assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
+}
+
 /* TODO
  * - we could suppress RX interrupt if we were so inclined.
  */
@@ -560,12 +570,7 @@ static void virtio_net_reset(VirtIODevice *vdev)
 
     /* Flush any async TX */
     for (i = 0;  i < n->max_queue_pairs; i++) {
-        NetClientState *nc = qemu_get_subqueue(n->nic, i);
-
-        if (nc->peer) {
-            qemu_flush_or_purge_queued_packets(nc->peer, true);
-            assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
-        }
+        flush_or_purge_queued_packets(qemu_get_subqueue(n->nic, i));
     }
 }
 
-- 
2.32.0.3.g01195cf9f


