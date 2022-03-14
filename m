Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FC54D8599
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:03:45 +0100 (CET)
Received: from localhost ([::1]:58154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkMS-0007Xi-G1
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:03:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nTkJ7-0004Ja-89
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:00:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nTkJ5-0002xk-EB
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647262814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QR1CwZ64IIIxQL/lJwTdtyD/ZBJy8+qjCBYnTNCFmZo=;
 b=dc1BLGbNmtXc1nhB0prWMcqXaguh5DYumWOjlfcPOAJVXGG6dZWUOBs0VLpigQjUK8Xh1A
 5NOiVbX9OXjErhWMzHLoT/enuoPcT6F+1D8z26pRcWgqZCJ1/m3wen8Y8KFTBrJucX97Tv
 B/iVKhI+eCdEvmehEU+hdGsWM9Blabk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-vCIaZXn6MaKozqjfIjtTKA-1; Mon, 14 Mar 2022 09:00:13 -0400
X-MC-Unique: vCIaZXn6MaKozqjfIjtTKA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68139802319;
 Mon, 14 Mar 2022 13:00:13 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C039674C68;
 Mon, 14 Mar 2022 13:00:11 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 05/12] ui/console: move console compatibility check to
 dcl_display_console()
Date: Mon, 14 Mar 2022 16:59:33 +0400
Message-Id: <20220314125940.1866728-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220314125940.1866728-1-marcandre.lureau@redhat.com>
References: <20220314125940.1866728-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The current checks are done at registration time only. However, if a DCL
has no specific console specified, it may be switched dynamically with
console_select() later on.

Let's move the checks when displaychangelistener_display_console() is
called, which includes registration time and remains fatal if the
specified console is incompatible.

Note: we may want to display the compatibility error to the DCL, this is
left for a future improvement.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index c9318552871b..d3ecbb215736 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -148,6 +148,8 @@ static DisplayState *get_alloc_displaystate(void);
 static void text_console_update_cursor_timer(void);
 static void text_console_update_cursor(void *opaque);
 static bool displaychangelistener_has_dmabuf(DisplayChangeListener *dcl);
+static bool console_compatible_with(QemuConsole *con,
+                                    DisplayChangeListener *dcl, Error **errp);
 
 static void gui_update(void *opaque)
 {
@@ -1057,13 +1059,14 @@ static void console_putchar(QemuConsole *s, int ch)
 }
 
 static void displaychangelistener_display_console(DisplayChangeListener *dcl,
-                                                  QemuConsole *con)
+                                                  QemuConsole *con,
+                                                  Error **errp)
 {
     static const char nodev[] =
         "This VM has no graphic display device.";
     static DisplaySurface *dummy;
 
-    if (!con) {
+    if (!con || !console_compatible_with(con, dcl, errp)) {
         if (!dcl->ops->dpy_gfx_switch) {
             return;
         }
@@ -1114,7 +1117,7 @@ void console_select(unsigned int index)
                 if (dcl->con != NULL) {
                     continue;
                 }
-                displaychangelistener_display_console(dcl, s);
+                displaychangelistener_display_console(dcl, s, NULL);
             }
         }
         if (ds->have_text) {
@@ -1475,8 +1478,8 @@ static bool displaychangelistener_has_dmabuf(DisplayChangeListener *dcl)
     return false;
 }
 
-static bool dpy_compatible_with(QemuConsole *con,
-                                DisplayChangeListener *dcl, Error **errp)
+static bool console_compatible_with(QemuConsole *con,
+                                    DisplayChangeListener *dcl, Error **errp)
 {
     int flags;
 
@@ -1522,10 +1525,6 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
 
     assert(!dcl->ds);
 
-    if (dcl->con) {
-        dpy_compatible_with(dcl->con, dcl, &error_fatal);
-    }
-
     trace_displaychangelistener_register(dcl, dcl->ops->dpy_name);
     dcl->ds = get_alloc_displaystate();
     QLIST_INSERT_HEAD(&dcl->ds->listeners, dcl, next);
@@ -1536,7 +1535,7 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
     } else {
         con = active_console;
     }
-    displaychangelistener_display_console(dcl, con);
+    displaychangelistener_display_console(dcl, con, dcl->con ? &error_fatal : NULL);
     text_console_update_cursor(NULL);
 }
 
-- 
2.35.1.273.ge6ebfd0e8cbb


