Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAD746158C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 13:53:40 +0100 (CET)
Received: from localhost ([::1]:56598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrgA7-0005fD-6l
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 07:53:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1mrg8s-00047Y-JJ
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 07:52:22 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:32776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1mrg8n-0000lR-Vu
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 07:52:20 -0500
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 019E12E137F;
 Mon, 29 Nov 2021 15:52:10 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 pxfBpztvKs-q9s4j4qP; Mon, 29 Nov 2021 15:52:09 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1638190329; bh=5BIuo744LL/YmD3zadXnCCh1FhdUOI1/vMwfxTDTUW0=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=WJsAzfHzTT+MbbqOEM2qWeFm1Dn7iZYc+1QKoxpviWNPpL7+0Gti1TZDKc5qnarNi
 CdX1vITNbR52rDkrRM1m7khJz/Q/LcES/pN7hXDNsXBqFkVDX3IpLK2pYh63lWZm6o
 CbWJGjibt0LtNQEIXvZUC6E1jjiUvlni9fKjJHXs=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from d-tatianin-nix.yandex-team.ru (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1216::1:11])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 5suqrE3mlG-q9wOjTeg; Mon, 29 Nov 2021 15:52:09 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] virtio/vhost-vsock: don't double close vhostfd,
 remove redundant cleanup
Date: Mon, 29 Nov 2021 15:52:04 +0300
Message-Id: <20211129125204.1108088-1-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yc-core@yandex-team.ru, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In case of an error during initialization in vhost_dev_init, vhostfd is
closed in vhost_dev_cleanup. Remove close from err_virtio as it's both
redundant and causes a double close on vhostfd.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 hw/virtio/vhost-vsock.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 478c0c9a87..433d42d897 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -171,6 +171,10 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
     if (ret < 0) {
+        /*
+         * vhostfd is closed by vhost_dev_cleanup, which is called
+         * by vhost_dev_init on initialization error.
+         */
         goto err_virtio;
     }
 
@@ -183,15 +187,10 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
     return;
 
 err_vhost_dev:
-    vhost_dev_cleanup(&vvc->vhost_dev);
     /* vhost_dev_cleanup() closes the vhostfd passed to vhost_dev_init() */
-    vhostfd = -1;
+    vhost_dev_cleanup(&vvc->vhost_dev);
 err_virtio:
     vhost_vsock_common_unrealize(vdev);
-    if (vhostfd >= 0) {
-        close(vhostfd);
-    }
-    return;
 }
 
 static void vhost_vsock_device_unrealize(DeviceState *dev)
-- 
2.25.1


