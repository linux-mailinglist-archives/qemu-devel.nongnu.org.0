Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EE94D85AE
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:06:33 +0100 (CET)
Received: from localhost ([::1]:36930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkPA-0004Mu-Jy
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:06:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nTkIn-0003rb-7H
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 08:59:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nTkIj-0002gU-LU
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 08:59:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647262792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C2YIpCtdcHjni3WzUJsX14EQ+6PQzw597u7Usputo7M=;
 b=gujvLz8GEaDjCa9GHdbTuh4LobjJpdJhoc4dts26R8+dAlUIPj7rH4gv05msjFrs+u0b1X
 V343MQvNycWGBnYt5eto9ow2+lhtzw3lPvZaRlTbpHXMahtN/WjDvIhEaqNGYMvuHlYdS/
 ohy5l0bdOYXLqkB7F2aie1gbfZNstWo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-zW-18vqVPbGkFskrvigyMA-1; Mon, 14 Mar 2022 08:59:51 -0400
X-MC-Unique: zW-18vqVPbGkFskrvigyMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C45D1C05AA9;
 Mon, 14 Mar 2022 12:59:51 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 084CE407EE62;
 Mon, 14 Mar 2022 12:59:49 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 01/12] ui/console: move check for compatible GL context
Date: Mon, 14 Mar 2022 16:59:29 +0400
Message-Id: <20220314125940.1866728-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220314125940.1866728-1-marcandre.lureau@redhat.com>
References: <20220314125940.1866728-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Move GL context compatibility check in dpy_compatible_with(), and use
recommended error reporting.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 365a2c14b809..57e431d9e609 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1482,6 +1482,12 @@ static bool dpy_compatible_with(QemuConsole *con,
 
     flags = con->hw_ops->get_flags ? con->hw_ops->get_flags(con->hw) : 0;
 
+    if (console_has_gl(con) && con->gl->ops->compatible_dcl != dcl->ops) {
+        error_setg(errp, "Display %s is incompatible with the GL context",
+                   dcl->ops->dpy_name);
+        return false;
+    }
+
     if (flags & GRAPHIC_FLAGS_GL &&
         !console_has_gl(con)) {
         error_setg(errp, "The console requires a GL context.");
@@ -1509,27 +1515,12 @@ void qemu_console_set_display_gl_ctx(QemuConsole *con, DisplayGLCtx *gl)
     con->gl = gl;
 }
 
-static bool dpy_gl_compatible_with(QemuConsole *con, DisplayChangeListener *dcl)
-{
-    if (!con->gl) {
-        return true;
-    }
-
-    return con->gl->ops->compatible_dcl == dcl->ops;
-}
-
 void register_displaychangelistener(DisplayChangeListener *dcl)
 {
     QemuConsole *con;
 
     assert(!dcl->ds);
 
-    if (dcl->con && !dpy_gl_compatible_with(dcl->con, dcl)) {
-        error_report("Display %s is incompatible with the GL context",
-                     dcl->ops->dpy_name);
-        exit(1);
-    }
-
     if (dcl->con) {
         dpy_compatible_with(dcl->con, dcl, &error_fatal);
     }
-- 
2.35.1.273.ge6ebfd0e8cbb


