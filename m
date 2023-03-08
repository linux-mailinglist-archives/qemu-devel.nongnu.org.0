Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B36256B0FA4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:03:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx8c-0004t2-1p; Wed, 08 Mar 2023 11:59:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8S-0004iz-QY; Wed, 08 Mar 2023 11:59:28 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8M-00047o-8f; Wed, 08 Mar 2023 11:59:28 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 58DA7400E9;
 Wed,  8 Mar 2023 19:58:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 01F021FD;
 Wed,  8 Mar 2023 19:58:55 +0300 (MSK)
Received: (nullmailer pid 2098373 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:55 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 39/47] vdpa: stop all svq on device deletion
Date: Wed,  8 Mar 2023 19:57:42 +0300
Message-Id: <20230308165815.2098148-39-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Eugenio Pérez <eperezma@redhat.com>

Not stopping them leave the device in a bad state when virtio-net
fronted device is unplugged with device_del monitor command.

This is not triggable in regular poweroff or qemu forces shutdown
because cleanup is called right after vhost_vdpa_dev_start(false).  But
devices hot unplug does not call vdpa device cleanups.  This lead to all
the vhost_vdpa devices without stop the SVQ but the last.

Fix it and clean the code, making it symmetric with
vhost_vdpa_svqs_start.

Fixes: dff4426fa656 ("vhost: Add Shadow VirtQueue kick forwarding capabilities")
Reported-by: Lei Yang <leiyang@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20230209170004.899472-1-eperezma@redhat.com>
Tested-by: Laurent Vivier <lvivier@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
(cherry picked from commit 2e1a9de96b487cf818a22d681cad8d3f5d18dcca)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Mjt: this required manual edit for stable-7.2
---
 hw/virtio/vhost-vdpa.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 7468e44b87..03c78d25d8 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -707,26 +707,11 @@ static int vhost_vdpa_get_device_id(struct vhost_dev *dev,
     return ret;
 }
 
-static void vhost_vdpa_reset_svq(struct vhost_vdpa *v)
-{
-    if (!v->shadow_vqs_enabled) {
-        return;
-    }
-
-    for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
-        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
-        vhost_svq_stop(svq);
-    }
-}
-
 static int vhost_vdpa_reset_device(struct vhost_dev *dev)
 {
-    struct vhost_vdpa *v = dev->opaque;
     int ret;
     uint8_t status = 0;
 
-    vhost_vdpa_reset_svq(v);
-
     ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
     trace_vhost_vdpa_reset_device(dev, status);
     return ret;
@@ -1088,6 +1073,8 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
 
     for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
         VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
+
+        vhost_svq_stop(svq);
         vhost_vdpa_svq_unmap_rings(dev, svq);
     }
 }
-- 
2.30.2


