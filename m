Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81F750F964
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:01:33 +0200 (CEST)
Received: from localhost ([::1]:37612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njI0i-00073V-NL
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHWU-0004fv-Rc
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:30:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHWQ-0006ed-UO
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650965414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d/FkD98lBZQxRLWuhJizunwF6YPqnt5gif6ey06gVJc=;
 b=HSkpgWFzop0bahT0BpXW+xfTNmo6lxvoSLeHxAulcMAgwqZlwJNLSGiHVoEF1E9Y94SmOo
 Rq14kmaWZSIZG6WrSKeh1ZSiHH5+UDu0V0KU1YhfpOHT8pkVM/yoa04PBtFPpygUxTqX5M
 YU9OESxckBmbglWFnhkDmQ/Eg63cTW4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-_aq158E6NsWmGQcHUVFeBg-1; Tue, 26 Apr 2022 05:30:12 -0400
X-MC-Unique: _aq158E6NsWmGQcHUVFeBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 456F61014A67
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:12 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A2F8C15D5C;
 Tue, 26 Apr 2022 09:30:10 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/26] net: replace qemu_set_nonblock()
Date: Tue, 26 Apr 2022 13:27:13 +0400
Message-Id: <20220426092715.3931705-25-marcandre.lureau@redhat.com>
In-Reply-To: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Those calls are POSIX-specific. Use the dedicated GLib
API. (qemu_set_nonblock() is for socket-like)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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
2.36.0


