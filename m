Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258064CF305
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:56:15 +0100 (CET)
Received: from localhost ([::1]:53608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8E2-00086p-7n
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:56:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nR85K-0004wi-Et
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:47:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nR85I-0007Ca-Ub
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646639231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qpf+lf+PFKpC5s464WIYH3cB63UGdxcXzs4mJq2AZBI=;
 b=AD+IFzumD/It2h8gSvBF23Cs/0MY2AMD80i99MBaFwGWO/PXxVIz2YHjQximsxj6X+QDfr
 IV7nAHY1FEYUQklB54a5lqOmU1Wb05LEbEXBFE090xsRphaTJtlAfxcyrHft+La7Z+clWb
 1L7USfNRzXrjo4/JyH1uk9eVv3AFQbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-zHcIHrMVMZqMlBkjXdXWtA-1; Mon, 07 Mar 2022 02:47:08 -0500
X-MC-Unique: zHcIHrMVMZqMlBkjXdXWtA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7684E801AFC;
 Mon,  7 Mar 2022 07:47:07 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB8001F424;
 Mon,  7 Mar 2022 07:46:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/12] ui/console: move check for compatible GL context
Date: Mon,  7 Mar 2022 11:46:21 +0400
Message-Id: <20220307074632.238049-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220307074632.238049-1-marcandre.lureau@redhat.com>
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Move GL context compatibility check in dpy_compatible_with(), and use
recommended error reporting.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


