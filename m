Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866D030F192
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:07:26 +0100 (CET)
Received: from localhost ([::1]:36518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cTt-0007cm-Kd
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:07:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cHW-0007XQ-9K
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:54:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cHU-00087W-Fz
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612436075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eb2CGzD3TyOgBuW3soHR73dC4rDlZH0FmrocXLTMxhI=;
 b=aE59vPKuzaq3ir6h52JnCiuw6bvjVk1X86+GZATNI8zGhMWprq0Zx4mTWwLIliFudKy0XK
 PRWwd4kY/r0mUiYAYLh8XZaP6OIQCS+xOs7NcdkQqnam/X+aVhXrPZM4b8uBQkFnG2VAkf
 e0TzqHDXCkkkorxHZSkakDzwral3jhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-Sv5vAkHkMiiUGgSvgjavPg-1; Thu, 04 Feb 2021 05:54:34 -0500
X-MC-Unique: Sv5vAkHkMiiUGgSvgjavPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54918195D562
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 10:54:33 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 547EF60C78;
 Thu,  4 Feb 2021 10:54:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/20] ui: remove console_has_gl_dmabuf()
Date: Thu,  4 Feb 2021 14:52:21 +0400
Message-Id: <20210204105232.834642-10-marcandre.lureau@redhat.com>
In-Reply-To: <20210204105232.834642-1-marcandre.lureau@redhat.com>
References: <20210204105232.834642-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This check is currently limited. It only is used by vhost-user-gpu (not
by vfio-display), and will print an error repeatedly during run-time.

We are going to dissociate the GL context from the
DisplayChangeListener, and listeners may come and go. The following
patches will address this differently.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h        | 1 -
 hw/display/vhost-user-gpu.c | 5 -----
 ui/console.c                | 5 -----
 3 files changed, 11 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index bea2b6329a..ac989fdf70 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -323,7 +323,6 @@ void dpy_gl_ctx_destroy(QemuConsole *con, QEMUGLContext ctx);
 int dpy_gl_ctx_make_current(QemuConsole *con, QEMUGLContext ctx);
 
 bool console_has_gl(QemuConsole *con);
-bool console_has_gl_dmabuf(QemuConsole *con);
 
 static inline int surface_stride(DisplaySurface *s)
 {
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 55b0ed15f2..dd587436ff 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -224,11 +224,6 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
             close(dmabuf->fd);
             dmabuf->fd = -1;
         }
-        if (!console_has_gl_dmabuf(con)) {
-            /* it would be nice to report that error earlier */
-            error_report("console doesn't support dmabuf!");
-            break;
-        }
         dpy_gl_release_dmabuf(con, dmabuf);
         if (fd == -1) {
             dpy_gl_scanout_disable(con);
diff --git a/ui/console.c b/ui/console.c
index ab9224429e..b5bc3f7699 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1463,11 +1463,6 @@ bool console_has_gl(QemuConsole *con)
     return con->gl != NULL;
 }
 
-bool console_has_gl_dmabuf(QemuConsole *con)
-{
-    return con->gl != NULL && con->gl->ops->dpy_gl_scanout_dmabuf != NULL;
-}
-
 void register_displaychangelistener(DisplayChangeListener *dcl)
 {
     static const char nodev[] =
-- 
2.29.0


