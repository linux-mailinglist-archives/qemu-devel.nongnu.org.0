Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDEA6B8215
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 21:02:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pboMu-00015M-F9; Mon, 13 Mar 2023 16:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pboMi-00014k-W4
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pboMh-0004h7-C9
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678737709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4NNc/52APlEVsUfrxs3RhBrzY/pv7Yq9X27evoA0Gi4=;
 b=ZhX9aCJyGs3Tj4f+fKyfCIgtumCNmaFCwsK5DG2TnLf60cvnCMNXC1lZOlJ4oF+tncUdsR
 17gqGryuXTpFB1pwREGDgTXPT09ySaMbvq6oh5Ififkef46+S4dWL+8LS1gzdR85FZ4Y57
 SH/bwM4N84E3DVEA90xHyxuQRJ3SGUE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-yvGjqQZXMLONojTvpS-Xqw-1; Mon, 13 Mar 2023 16:01:46 -0400
X-MC-Unique: yvGjqQZXMLONojTvpS-Xqw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 441D7857A84;
 Mon, 13 Mar 2023 20:01:46 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E12E202701E;
 Mon, 13 Mar 2023 20:01:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL v2 02/18] ui/dbus: unregister clipboard on connection close
Date: Tue, 14 Mar 2023 00:01:18 +0400
Message-Id: <20230313200134.503083-3-marcandre.lureau@redhat.com>
In-Reply-To: <20230313200134.503083-1-marcandre.lureau@redhat.com>
References: <20230313200134.503083-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 ui/dbus-clipboard.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/ui/dbus-clipboard.c b/ui/dbus-clipboard.c
index df9a754a8d..fe7fcdecb6 100644
--- a/ui/dbus-clipboard.c
+++ b/ui/dbus-clipboard.c
@@ -204,15 +204,6 @@ dbus_clipboard_unregister_proxy(DBusDisplay *dpy)
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
@@ -220,6 +211,7 @@ dbus_clipboard_register(
 {
     g_autoptr(GError) err = NULL;
     const char *name = NULL;
+    GDBusConnection *connection = g_dbus_method_invocation_get_connection(invocation);
 
     if (dpy->clipboard_proxy) {
         g_dbus_method_invocation_return_error(
@@ -232,7 +224,7 @@ dbus_clipboard_register(
 
     dpy->clipboard_proxy =
         qemu_dbus_display1_clipboard_proxy_new_sync(
-            g_dbus_method_invocation_get_connection(invocation),
+            connection,
             G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START,
             g_dbus_method_invocation_get_sender(invocation),
             "/org/qemu/Display1/Clipboard",
@@ -252,7 +244,11 @@ dbus_clipboard_register(
 
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
2.39.2


