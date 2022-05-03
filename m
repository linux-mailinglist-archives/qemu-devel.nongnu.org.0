Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412105190C4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:58:35 +0200 (CEST)
Received: from localhost ([::1]:48920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0XS-0004du-7P
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlz5P-0003pC-Or
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:25:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlz5N-0005eA-PB
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651609523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YsouEnbuV9GgcrLCY8Gl7wv7pcLj+IAKuA5BuvZSaFk=;
 b=OHvIHOaleJurCXJWpCnTlsmFzRXZDErAqDlWba0WFRX1/QIBjtq9F0NgdEmst6BGbNuXfM
 tk6w3cowUwR7yQpldmnDumlQ8QBk+jcSPxexSXlicneVtRqKOKj1fltZAaO/IzxDb3Eh3Z
 byVr9UiKhV8xicET9tH13E8v3Ct3I7Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-j76AZ1mUOF6u-eQlJvR5BQ-1; Tue, 03 May 2022 11:42:23 -0400
X-MC-Unique: j76AZ1mUOF6u-eQlJvR5BQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDF9928D791F;
 Tue,  3 May 2022 13:14:41 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C86C6C27EB1;
 Tue,  3 May 2022 13:14:40 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 21/23] net: replace qemu_set_nonblock()
Date: Tue,  3 May 2022 17:12:54 +0400
Message-Id: <20220503131256.187238-22-marcandre.lureau@redhat.com>
In-Reply-To: <20220503131256.187238-1-marcandre.lureau@redhat.com>
References: <20220503131256.187238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
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

Those calls are POSIX-specific. Use the dedicated GLib
API. (qemu_set_nonblock() is for socket-like)

(this is a preliminary patch before renaming qemu_set_nonblock())

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 net/tap.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/net/tap.c b/net/tap.c
index 6190fa699d2f..b3ddfd4a74b1 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -619,7 +619,10 @@ int net_init_bridge(const Netdev *netdev, const char *name,
         return -1;
     }
 
-    qemu_set_nonblock(fd);
+    if (!g_unix_set_fd_nonblocking(fd, true, NULL)) {
+        error_setg_errno(errp, errno, "Failed to set FD nonblocking");
+        return -1;
+    }
     vnet_hdr = tap_probe_vnet_hdr(fd, errp);
     if (vnet_hdr < 0) {
         close(fd);
@@ -716,8 +719,6 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
         }
 
         if (vhostfdname) {
-            int ret;
-
             vhostfd = monitor_fd_param(monitor_cur(), vhostfdname, &err);
             if (vhostfd == -1) {
                 if (tap->has_vhostforce && tap->vhostforce) {
@@ -727,9 +728,8 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
                 }
                 return;
             }
-            ret = qemu_try_set_nonblock(vhostfd);
-            if (ret < 0) {
-                error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
+            if (!g_unix_set_fd_nonblocking(vhostfd, true, NULL)) {
+                error_setg_errno(errp, errno, "%s: Can't use file descriptor %d",
                                  name, fd);
                 return;
             }
@@ -745,7 +745,10 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
                 }
                 return;
             }
-            qemu_set_nonblock(vhostfd);
+            if (!g_unix_set_fd_nonblocking(vhostfd, true, NULL)) {
+                error_setg_errno(errp, errno, "Failed to set FD nonblocking");
+                return;
+            }
         }
         options.opaque = (void *)(uintptr_t)vhostfd;
         options.nvqs = 2;
@@ -832,9 +835,8 @@ int net_init_tap(const Netdev *netdev, const char *name,
             return -1;
         }
 
-        ret = qemu_try_set_nonblock(fd);
-        if (ret < 0) {
-            error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
+        if (!g_unix_set_fd_nonblocking(fd, true, NULL)) {
+            error_setg_errno(errp, errno, "%s: Can't use file descriptor %d",
                              name, fd);
             close(fd);
             return -1;
@@ -889,9 +891,9 @@ int net_init_tap(const Netdev *netdev, const char *name,
                 goto free_fail;
             }
 
-            ret = qemu_try_set_nonblock(fd);
-            if (ret < 0) {
-                error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
+            ret = g_unix_set_fd_nonblocking(fd, true, NULL);
+            if (!ret) {
+                error_setg_errno(errp, errno, "%s: Can't use file descriptor %d",
                                  name, fd);
                 goto free_fail;
             }
@@ -946,7 +948,10 @@ free_fail:
             return -1;
         }
 
-        qemu_set_nonblock(fd);
+        if (!g_unix_set_fd_nonblocking(fd, true, NULL)) {
+            error_setg_errno(errp, errno, "Failed to set FD nonblocking");
+            return -1;
+        }
         vnet_hdr = tap_probe_vnet_hdr(fd, errp);
         if (vnet_hdr < 0) {
             close(fd);
-- 
2.36.0.44.g0f828332d5ac


