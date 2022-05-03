Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBBE519070
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:51:02 +0200 (CEST)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0Q9-000147-Or
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlyyG-0006nV-RT
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:18:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlyyB-0003fY-Vt
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651609083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yS1MNt2tjqds9d74XEhJAshMqa8W7jCZ4EhHL0jutdM=;
 b=QHCuuNML28d2STe+PRTWsYVGNjRusTp5qBX0wvrbLfOyuWyd3sTZe7dUtWSdceNnYyj9Td
 r2nimktGzUkrTHTE53m0IqQliZPkYjEqTpgiyY1VZb29HOnNbWtC72o2suff6NZTdijHZ1
 qpSWrUzrJomJXVl1La4HQEkv6v6U/3k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-9Ha06Z59P5uqnz4RR9aACA-1; Tue, 03 May 2022 11:37:17 -0400
X-MC-Unique: 9Ha06Z59P5uqnz4RR9aACA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76183984B56;
 Tue,  3 May 2022 13:02:07 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85386428F05;
 Tue,  3 May 2022 13:02:06 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 19/23] hw: replace qemu_set_nonblock()
Date: Tue,  3 May 2022 17:00:19 +0400
Message-Id: <20220503130023.180544-20-marcandre.lureau@redhat.com>
In-Reply-To: <20220503130023.180544-1-marcandre.lureau@redhat.com>
References: <20220503130023.180544-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Those calls are non-socket fd, or are POSIX-specific. Use the dedicated
GLib API. (qemu_set_nonblock() is for socket-like)

(this is a preliminary patch before renaming qemu_set_nonblock())

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/input/virtio-input-host.c |  5 ++++-
 hw/virtio/vhost-vsock.c      | 11 +++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/input/virtio-input-host.c b/hw/input/virtio-input-host.c
index 137efba57b0f..fea7139382a1 100644
--- a/hw/input/virtio-input-host.c
+++ b/hw/input/virtio-input-host.c
@@ -114,7 +114,10 @@ static void virtio_input_host_realize(DeviceState *dev, Error **errp)
         error_setg_file_open(errp, errno, vih->evdev);
         return;
     }
-    qemu_set_nonblock(vih->fd);
+    if (!g_unix_set_fd_nonblocking(vih->fd, true, NULL)) {
+        error_setg_errno(errp, errno, "Failed to set FD nonblocking");
+        goto err_close;
+    }
 
     rc = ioctl(vih->fd, EVIOCGVERSION, &ver);
     if (rc < 0) {
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 433d42d897df..714046210bd3 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -149,9 +149,8 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        ret = qemu_try_set_nonblock(vhostfd);
-        if (ret < 0) {
-            error_setg_errno(errp, -ret,
+        if (!g_unix_set_fd_nonblocking(vhostfd, true, NULL)) {
+            error_setg_errno(errp, errno,
                              "vhost-vsock: unable to set non-blocking mode");
             return;
         }
@@ -163,7 +162,11 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        qemu_set_nonblock(vhostfd);
+        if (!g_unix_set_fd_nonblocking(vhostfd, true, NULL)) {
+            error_setg_errno(errp, errno,
+                             "Failed to set FD nonblocking");
+            return;
+        }
     }
 
     vhost_vsock_common_realize(vdev, "vhost-vsock");
-- 
2.36.0.44.g0f828332d5ac


