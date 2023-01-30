Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AB2680BDB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:25:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSHJ-0006Oz-CE; Mon, 30 Jan 2023 06:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMSHD-0006OJ-QR
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:24:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMSHC-00080L-Dn
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675077881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tw2K9JhMxJEb5gwCYrrPtpeAU7EAE0x2nXmzZQ7oltA=;
 b=GG80lK+99iY+/MAkkuvyil9nhirOOhhP+MjoCawXRhSShO+3kzpWocPHN13l1TK4tmInWg
 CxoUcUqYS6kpjq7JlyDmG4m7YfxtJpobMvM1lwJtjqWwZsPPPXp7o596YanoePLa+4iDD1
 hsKy1i6+ddCpBQEBuhwDzs9h77/Mgoc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-BVK3Lf4ROtS75wtkUL_uSw-1; Mon, 30 Jan 2023 06:24:39 -0500
X-MC-Unique: BVK3Lf4ROtS75wtkUL_uSw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BB8618E0A61
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 11:24:39 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 542DD492B01;
 Mon, 30 Jan 2023 11:24:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 01/11] ui/dbus: unregister clipboard on connection close
Date: Mon, 30 Jan 2023 15:24:21 +0400
Message-Id: <20230130112431.69559-2-marcandre.lureau@redhat.com>
In-Reply-To: <20230130112431.69559-1-marcandre.lureau@redhat.com>
References: <20230130112431.69559-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fixes unregistration with p2p connections, since they don't have an
associated name owner.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/dbus-clipboard.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/ui/dbus-clipboard.c b/ui/dbus-clipboard.c
index 5843d26cd2..d78f9db18f 100644
--- a/ui/dbus-clipboard.c
+++ b/ui/dbus-clipboard.c
@@ -203,15 +203,6 @@ dbus_clipboard_unregister_proxy(DBusDisplay *dpy)
     g_clear_object(&dpy->clipboard_proxy);
 }
 
-static void
-dbus_on_clipboard_proxy_name_owner_changed(
-    DBusDisplay *dpy,
-    GObject *object,
-    GParamSpec *pspec)
-{
-    dbus_clipboard_unregister_proxy(dpy);
-}
-
 static gboolean
 dbus_clipboard_register(
     DBusDisplay *dpy,
@@ -219,6 +210,7 @@ dbus_clipboard_register(
 {
     g_autoptr(GError) err = NULL;
     const char *name = NULL;
+    GDBusConnection *connection = g_dbus_method_invocation_get_connection(invocation);
 
     if (dpy->clipboard_proxy) {
         g_dbus_method_invocation_return_error(
@@ -231,7 +223,7 @@ dbus_clipboard_register(
 
     dpy->clipboard_proxy =
         qemu_dbus_display1_clipboard_proxy_new_sync(
-            g_dbus_method_invocation_get_connection(invocation),
+            connection,
             G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START,
             g_dbus_method_invocation_get_sender(invocation),
             "/org/qemu/Display1/Clipboard",
@@ -251,7 +243,11 @@ dbus_clipboard_register(
 
     g_object_connect(dpy->clipboard_proxy,
                      "swapped-signal::notify::g-name-owner",
-                     dbus_on_clipboard_proxy_name_owner_changed, dpy,
+                     dbus_clipboard_unregister_proxy, dpy,
+                     NULL);
+    g_object_connect(connection,
+                     "swapped-signal::closed",
+                     dbus_clipboard_unregister_proxy, dpy,
                      NULL);
     qemu_clipboard_reset_serial();
 
-- 
2.39.1


