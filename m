Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65DB5BC5C6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 11:51:32 +0200 (CEST)
Received: from localhost ([::1]:60314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaDR4-0001QQ-Va
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 05:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuhaiwei9699@126.com>)
 id 1oaDFd-00021i-1k
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 05:39:41 -0400
Received: from mail-m965.mail.126.com ([123.126.96.5]:19133)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liuhaiwei9699@126.com>) id 1oaDFX-00062e-Qa
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 05:39:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=n7XzX
 vBjUPSC5THBIW64TTXMlGaFqQBnfYtqv0eW1F8=; b=DmKoIjYUallzbxlEoZN8b
 Q+eRwtUsLLfVjSBt0lEYoNTiyIqOyEMqtU4H3BxTsIhRBpdC0F92AkkwVFNiipcF
 CtAGeHKXxT649cbBQgtH/x22nBUJ4n1Av5nHIog4CbTnkdEnvlYyAxEdDddaVShB
 LXOsLJQebmuycwAG9MULx8=
Received: from localhost.localdomain (unknown [60.208.111.213])
 by smtp10 (Coremail) with SMTP id NuRpCgDHxTXKOChjF9JvCA--.62199S2;
 Mon, 19 Sep 2022 17:39:23 +0800 (CST)
From: liuhaiwei <liuhaiwei9699@126.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	jasowang@redhat.com,
	liuhaiwei <liuhaiwei9699@126.com>
Subject: [PATCH 1/3] virtio-net: fix max vring buf size when set ring num
Date: Mon, 19 Sep 2022 05:39:13 -0400
Message-Id: <20220919093915.33003-1-liuhaiwei9699@126.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgDHxTXKOChjF9JvCA--.62199S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw43Zr1rWw18GFWUtr1xuFg_yoW8GrW8pr
 1DAFWYkF4UtrWfAa4fJF17Wry2kFZ3Gr17A34Iqw1DCF1rtF1UJr1j93yUXrWxZrZYyF4x
 ZF92grW0q3srZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzeHDUUUUU=
X-Originating-IP: [60.208.111.213]
X-CM-SenderInfo: xolxxt5lzhxmqwzzqiyswou0bp/1tbiuAuB1mJVlcMrawAAsF
Received-SPF: pass client-ip=123.126.96.5; envelope-from=liuhaiwei9699@126.com;
 helo=mail-m965.mail.126.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: liuhaiwei <liuhaiwei9699@126.com>
---
 hw/virtio/virtio.c         | 10 +++++++---
 include/hw/virtio/virtio.h |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5d607aeaa0..d93c20d747 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2286,13 +2286,17 @@ void virtio_queue_set_rings(VirtIODevice *vdev, int n, hwaddr desc,
 
 void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
 {
+    int vq_max_size = VIRTQUEUE_MAX_SIZE;
+    if (!strcmp(vdev->name, "virtio-net")) {
+        vq_max_size = VIRTIO_NET_VQ_MAX_SIZE;
+    }
+
     /* Don't allow guest to flip queue between existent and
      * nonexistent states, or to set it to an invalid size.
      */
     if (!!num != !!vdev->vq[n].vring.num ||
-        num > VIRTQUEUE_MAX_SIZE ||
-        num < 0) {
-        return;
+        num > vq_max_size || num < 0) {
+	    return;
     }
     vdev->vq[n].vring.num = num;
 }
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index db1c0ddf6b..1f4d2eb5d7 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -50,6 +50,7 @@ size_t virtio_feature_get_config_size(const VirtIOFeature *features,
 typedef struct VirtQueue VirtQueue;
 
 #define VIRTQUEUE_MAX_SIZE 1024
+#define VIRTIO_NET_VQ_MAX_SIZE (4096)
 
 typedef struct VirtQueueElement
 {
-- 
2.27.0


