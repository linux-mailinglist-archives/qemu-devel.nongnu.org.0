Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25902D6A9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 09:44:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVtFm-0002dM-R2
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 03:44:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hVsuJ-00012M-II
	for qemu-devel@nongnu.org; Wed, 29 May 2019 03:21:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hVsuH-0004yu-M3
	for qemu-devel@nongnu.org; Wed, 29 May 2019 03:21:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51034)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hVsuH-0004yK-9b
	for qemu-devel@nongnu.org; Wed, 29 May 2019 03:21:53 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4421230C1217
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 07:21:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4171C60BDF;
	Wed, 29 May 2019 07:21:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 9244A17512; Wed, 29 May 2019 09:21:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 29 May 2019 09:21:43 +0200
Message-Id: <20190529072144.26737-4-kraxel@redhat.com>
In-Reply-To: <20190529072144.26737-1-kraxel@redhat.com>
References: <20190529072144.26737-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Wed, 29 May 2019 07:21:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 3/4] egl-helpers: add modifier support to
 egl_get_fd_for_texture().
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alex Williamson <alex.williamson@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add modifier parameter to egl_get_fd_for_texture(), to return the used
modifier on dmabuf exports.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/egl-helpers.h | 3 ++-
 ui/egl-helpers.c         | 5 +++--
 ui/spice-display.c       | 7 ++++---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
index b976cb872821..d71412779913 100644
--- a/include/ui/egl-helpers.h
+++ b/include/ui/egl-helpers.h
@@ -36,7 +36,8 @@ extern struct gbm_device *qemu_egl_rn_gbm_dev;
 extern EGLContext qemu_egl_rn_ctx;
 
 int egl_rendernode_init(const char *rendernode, DisplayGLMode mode);
-int egl_get_fd_for_texture(uint32_t tex_id, EGLint *stride, EGLint *fourcc);
+int egl_get_fd_for_texture(uint32_t tex_id, EGLint *stride, EGLint *fourcc,
+                           EGLuint64KHR *modifier);
 
 void egl_dmabuf_import_texture(QemuDmaBuf *dmabuf);
 void egl_dmabuf_release_texture(QemuDmaBuf *dmabuf);
diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index e90eef8c9c3a..0c9716067cfb 100644
--- a/ui/egl-helpers.c
+++ b/ui/egl-helpers.c
@@ -200,7 +200,8 @@ err:
     return -1;
 }
 
-int egl_get_fd_for_texture(uint32_t tex_id, EGLint *stride, EGLint *fourcc)
+int egl_get_fd_for_texture(uint32_t tex_id, EGLint *stride, EGLint *fourcc,
+                           EGLuint64KHR *modifier)
 {
     EGLImageKHR image;
     EGLint num_planes, fd;
@@ -214,7 +215,7 @@ int egl_get_fd_for_texture(uint32_t tex_id, EGLint *stride, EGLint *fourcc)
     }
 
     eglExportDMABUFImageQueryMESA(qemu_egl_display, image, fourcc,
-                                  &num_planes, NULL);
+                                  &num_planes, modifier);
     if (num_planes != 1) {
         eglDestroyImageKHR(qemu_egl_display, image);
         return -1;
diff --git a/ui/spice-display.c b/ui/spice-display.c
index a5e26479a866..104df2302575 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -888,7 +888,8 @@ static void spice_gl_switch(DisplayChangeListener *dcl,
     if (ssd->ds) {
         surface_gl_create_texture(ssd->gls, ssd->ds);
         fd = egl_get_fd_for_texture(ssd->ds->texture,
-                                    &stride, &fourcc);
+                                    &stride, &fourcc,
+                                    NULL);
         if (fd < 0) {
             surface_gl_destroy_texture(ssd->gls, ssd->ds);
             return;
@@ -945,7 +946,7 @@ static void qemu_spice_gl_scanout_texture(DisplayChangeListener *dcl,
     int fd = -1;
 
     assert(tex_id);
-    fd = egl_get_fd_for_texture(tex_id, &stride, &fourcc);
+    fd = egl_get_fd_for_texture(tex_id, &stride, &fourcc, NULL);
     if (fd < 0) {
         fprintf(stderr, "%s: failed to get fd for texture\n", __func__);
         return;
@@ -1063,7 +1064,7 @@ static void qemu_spice_gl_update(DisplayChangeListener *dcl,
                 egl_fb_setup_new_tex(&ssd->blit_fb,
                                      dmabuf->width, dmabuf->height);
                 fd = egl_get_fd_for_texture(ssd->blit_fb.texture,
-                                            &stride, &fourcc);
+                                            &stride, &fourcc, NULL);
                 spice_qxl_gl_scanout(&ssd->qxl, fd,
                                      dmabuf->width, dmabuf->height,
                                      stride, fourcc, false);
-- 
2.18.1


