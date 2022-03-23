Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F055B4E4ED0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 10:00:55 +0100 (CET)
Received: from localhost ([::1]:56544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWwrN-00032p-Ux
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 05:00:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <08005325@163.com>) id 1nWwox-0002JV-E9
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 04:58:23 -0400
Received: from m12-14.163.com ([220.181.12.14]:17610)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <08005325@163.com>) id 1nWwor-0006WV-Ol
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 04:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=SxoiB44t7WESaK2cTs
 3HAZxhzsgbfVqNLKtQ02sN8UM=; b=jv4GbnVEz7a23cz8G03c17WKqIbd47MsPL
 +o+tCgWzm4OO22DL73cMwFiiXxmNKonHwfg+KPq8fjepkDrBoyIPQYx9gJbxRcDh
 /332L5hoH9t2nJ4iGRJLvzNsB8gS6vbjknD/dA1bdcDj/ETAnWz4XULzg8vLcNhm
 4b2TbGpn0=
Received: from localhost.localdomain.localdomain (unknown [116.228.45.98])
 by smtp10 (Coremail) with SMTP id DsCowADnLoKI3Tpi7p9dCQ--.17066S2;
 Wed, 23 Mar 2022 16:42:48 +0800 (CST)
From: 08005325@163.com
To: qemu-devel@nongnu.org
Subject: [PATCH] vdpa: Avoid reset when stop device
Date: Wed, 23 Mar 2022 04:42:46 -0400
Message-Id: <1648024966-5170-1-git-send-email-08005325@163.com>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: DsCowADnLoKI3Tpi7p9dCQ--.17066S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CryDGF48WFyDCrW8XrWUurg_yoW8tw1rpr
 Z7K3WrKr4DJr4xtrs7CF1ku3s8G3s3t397Ga97Wa129F1UJrWkZ390gayjyry7tFWrAF12
 vF42gr4ru398Zw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYBT5UUUUU=
X-Originating-IP: [116.228.45.98]
X-CM-SenderInfo: qqyqikqtsvqiywtou0bp/1tbivwjMrFWByUi48gAAsI
Received-SPF: pass client-ip=220.181.12.14; envelope-from=08005325@163.com;
 helo=m12-14.163.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jasowang@redhat.com, Michael Qiu <qiudayu@archeros.com>, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Qiu <qiudayu@archeros.com>

Currently, when VM poweroff, it will trigger vdpa
device(such as mlx bluefield2 VF) reset twice, this leads
to below issue:

vhost VQ 2 ring restore failed: -22: Invalid argument (22)

This because in vhost_dev_stop(), qemu tries to stop the device,
then stop the queue: vhost_virtqueue_stop().
In vhost_dev_stop(), it resets the device, which clear some flags
in low level driver, and the driver finds
that the VQ is invalied, this is the root cause.

Actually, device reset will be called within func release()

To solve the issue, vdpa should set vring unready, and
remove reset ops in device stop: vhost_dev_start(hdev, false).

Signed-off-by: Michael Qiu<qiudayu@archeros.com>
---
 hw/virtio/vhost-vdpa.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index c5ed7a3..d858b4f 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -719,14 +719,14 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
     return idx;
 }
 
-static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
+static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, unsigned int ready)
 {
     int i;
     trace_vhost_vdpa_set_vring_ready(dev);
     for (i = 0; i < dev->nvqs; ++i) {
         struct vhost_vring_state state = {
             .index = dev->vq_index + i,
-            .num = 1,
+            .num = ready,
         };
         vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
     }
@@ -1088,8 +1088,9 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         if (unlikely(!ok)) {
             return -1;
         }
-        vhost_vdpa_set_vring_ready(dev);
+        vhost_vdpa_set_vring_ready(dev, 1);
     } else {
+        vhost_vdpa_set_vring_ready(dev, 0);
         ok = vhost_vdpa_svqs_stop(dev);
         if (unlikely(!ok)) {
             return -1;
@@ -1105,7 +1106,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         memory_listener_register(&v->listener, &address_space_memory);
         return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
     } else {
-        vhost_vdpa_reset_device(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
                                    VIRTIO_CONFIG_S_DRIVER);
         memory_listener_unregister(&v->listener);
-- 
1.8.3.1


