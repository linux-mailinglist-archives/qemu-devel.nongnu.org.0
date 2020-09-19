Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C761A270BD7
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Sep 2020 10:28:50 +0200 (CEST)
Received: from localhost ([::1]:56512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJYEj-0002Xc-CZ
	for lists+qemu-devel@lfdr.de; Sat, 19 Sep 2020 04:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1kJYDc-000288-FL
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 04:27:40 -0400
Received: from mail-m971.mail.163.com ([123.126.97.1]:49914)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liq3ea@163.com>) id 1kJYDV-0005jH-Id
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 04:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=mv9vAiivvmxvCEJBs8
 S/qaz6r9HO4URel5Bho94yIyo=; b=N8VbCIMO8fvcDKCUK4wd1sNAWYjXI0R36B
 3UvIF3vFE6+q5o2KR2+UZBewPZAuMhp1O/zPuqIaURtC4UFW0QS798najU5eqYKT
 ZUZg3dcZg+K8m7EGohIHSRSUAHLrN0FSJb5yGW/2UczIF9ERaroFonjgpxU7L/N0
 IShCetFKo=
Received: from localhost.localdomain (unknown [183.159.201.198])
 by smtp1 (Coremail) with SMTP id GdxpCgBXCGDgwGVfmgOqBw--.284S4;
 Sat, 19 Sep 2020 16:27:14 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: pbonzini@redhat.com,
	mst@redhat.com
Subject: [PATCH] virtio: update MemoryRegionCaches when guest set bad features
Date: Sat, 19 Sep 2020 01:27:06 -0700
Message-Id: <20200919082706.6703-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: GdxpCgBXCGDgwGVfmgOqBw--.284S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar1kXr13GF45Zr4DCF17ZFb_yoW8Ar4Dp3
 4xAFyYvFW2qrnxAan5tF4kWr4rArykGw429w1j9w12k3W8Xr13A34IkrZ2qFZrZ340vF48
 CFW0gryjvrnrZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UOXoxUUUUU=
X-Originating-IP: [183.159.201.198]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbiTwOkbVsGV5aDWwAAsB
Received-SPF: pass client-ip=123.126.97.1; envelope-from=liq3ea@163.com;
 helo=mail-m971.mail.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/19 04:27:18
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Li Qiang <liq3ea@163.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Current the 'virtio_set_features' only update the 'MemorRegionCaches'
when the 'virtio_set_features_nocheck' return '0' which means it is
not bad features. However the guest can still trigger the access of the
used vring after set bad features. In this situation it will cause assert
failure in 'ADDRESS_SPACE_ST_CACHED'.

Buglink: https://bugs.launchpad.net/qemu/+bug/1890333
Fixes: db812c4073c7 ("virtio: update MemoryRegionCaches when guest negotiates features")
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Li Qiang <liq3ea@163.com>
---
 hw/virtio/virtio.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e983025217..4441ae5ed4 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2963,17 +2963,16 @@ int virtio_set_features(VirtIODevice *vdev, uint64_t val)
         return -EINVAL;
     }
     ret = virtio_set_features_nocheck(vdev, val);
-    if (!ret) {
-        if (virtio_vdev_has_feature(vdev, VIRTIO_RING_F_EVENT_IDX)) {
-            /* VIRTIO_RING_F_EVENT_IDX changes the size of the caches.  */
-            int i;
-            for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
-                if (vdev->vq[i].vring.num != 0) {
-                    virtio_init_region_cache(vdev, i);
-                }
+    if (virtio_vdev_has_feature(vdev, VIRTIO_RING_F_EVENT_IDX)) {
+        /* VIRTIO_RING_F_EVENT_IDX changes the size of the caches.  */
+        int i;
+        for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
+            if (vdev->vq[i].vring.num != 0) {
+                virtio_init_region_cache(vdev, i);
             }
         }
-
+    }
+    if (!ret) {
         if (!virtio_device_started(vdev, vdev->status) &&
             !virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
             vdev->start_on_kick = true;
-- 
2.17.1


