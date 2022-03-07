Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7917E4CF2FB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:53:01 +0100 (CET)
Received: from localhost ([::1]:46780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8Au-0003bz-HR
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:53:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nR86H-0006Wq-RF
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:48:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nR86G-0007GN-3C
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646639291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bPU5GmWX719Wgzp+GY3oy0cCFuJ27eC5uJYk1WnikOA=;
 b=HYWadGZeCYQ0i+WIqJTZsRrYdodfptW+TihwWntkwQE+YotDwYnyAQTaolkoOi+UZZT6B/
 BM85NI2Viu5KC2wnFDbr6hM95Hdj9I1IPytNTnW2HLgevWpRtKb+nZJx/VDGYAz06oL+qk
 3vArnmBaP51Pzh/yTvcTBPDbPBqIA2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-P_10eDSbOQSoft--Ey_j0Q-1; Mon, 07 Mar 2022 02:48:08 -0500
X-MC-Unique: P_10eDSbOQSoft--Ey_j0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A6EA1091DA0;
 Mon,  7 Mar 2022 07:48:07 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B0CA67658;
 Mon,  7 Mar 2022 07:48:05 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/12] ui/console: move console compatibility check to
 dcl_display_console()
Date: Mon,  7 Mar 2022 11:46:25 +0400
Message-Id: <20220307074632.238049-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220307074632.238049-1-marcandre.lureau@redhat.com>
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, akihiko.odaki@gmail.com
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


