Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AD730F152
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:57:54 +0100 (CET)
Received: from localhost ([::1]:34938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cKf-0003UN-8S
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cHJ-00072t-27
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:54:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cHH-0007zn-BP
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:54:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612436062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cUzDXpRqEv5VZgfSoKIGtEVGT6KJtVlzOdFvjwVT2vE=;
 b=alETCbFCuekOoBHwSCMHpDspR2oI8TQnGNi3W2U3eu2oY2rTJ0tZZQYyGy/dE8AjtsYFgt
 3HSrLiG9s3WHSEYu0XfuRPSRoBYWukWfnldRAS9Y171elw6oULuMdzJDP3D4oeRTeAlwO9
 YH1PYLXcDNre/ewARkE2m7Z2UD/jE8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-QebEVOLEPnOoHe-IJTYOxg-1; Thu, 04 Feb 2021 05:54:21 -0500
X-MC-Unique: QebEVOLEPnOoHe-IJTYOxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3679A107ACE3
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 10:54:20 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4659E722CF;
 Thu,  4 Feb 2021 10:54:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/20] ui: annotate DCLOps callback requirements
Date: Thu,  4 Feb 2021 14:52:20 +0400
Message-Id: <20210204105232.834642-9-marcandre.lureau@redhat.com>
In-Reply-To: <20210204105232.834642-1-marcandre.lureau@redhat.com>
References: <20210204105232.834642-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index ce6c72e37c..bea2b6329a 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -174,35 +174,49 @@ typedef struct DisplayState DisplayState;
 typedef struct DisplayChangeListenerOps {
     const char *dpy_name;
 
+    /* optional */
     void (*dpy_refresh)(DisplayChangeListener *dcl);
 
+    /* optional */
     void (*dpy_gfx_update)(DisplayChangeListener *dcl,
                            int x, int y, int w, int h);
+    /* optional */
     void (*dpy_gfx_switch)(DisplayChangeListener *dcl,
                            struct DisplaySurface *new_surface);
+    /* optional */
     bool (*dpy_gfx_check_format)(DisplayChangeListener *dcl,
                                  pixman_format_code_t format);
 
+    /* optional */
     void (*dpy_text_cursor)(DisplayChangeListener *dcl,
                             int x, int y);
+    /* optional */
     void (*dpy_text_resize)(DisplayChangeListener *dcl,
                             int w, int h);
+    /* optional */
     void (*dpy_text_update)(DisplayChangeListener *dcl,
                             int x, int y, int w, int h);
 
+    /* optional */
     void (*dpy_mouse_set)(DisplayChangeListener *dcl,
                           int x, int y, int on);
+    /* optional */
     void (*dpy_cursor_define)(DisplayChangeListener *dcl,
                               QEMUCursor *cursor);
 
+    /* required if GL */
     QEMUGLContext (*dpy_gl_ctx_create)(DisplayChangeListener *dcl,
                                        QEMUGLParams *params);
+    /* required if GL */
     void (*dpy_gl_ctx_destroy)(DisplayChangeListener *dcl,
                                QEMUGLContext ctx);
+    /* required if GL */
     int (*dpy_gl_ctx_make_current)(DisplayChangeListener *dcl,
                                    QEMUGLContext ctx);
 
+    /* required if GL */
     void (*dpy_gl_scanout_disable)(DisplayChangeListener *dcl);
+    /* required if GL */
     void (*dpy_gl_scanout_texture)(DisplayChangeListener *dcl,
                                    uint32_t backing_id,
                                    bool backing_y_0_top,
@@ -210,15 +224,20 @@ typedef struct DisplayChangeListenerOps {
                                    uint32_t backing_height,
                                    uint32_t x, uint32_t y,
                                    uint32_t w, uint32_t h);
+    /* optional */
     void (*dpy_gl_scanout_dmabuf)(DisplayChangeListener *dcl,
                                   QemuDmaBuf *dmabuf);
+    /* optional */
     void (*dpy_gl_cursor_dmabuf)(DisplayChangeListener *dcl,
                                  QemuDmaBuf *dmabuf, bool have_hot,
                                  uint32_t hot_x, uint32_t hot_y);
+    /* optional */
     void (*dpy_gl_cursor_position)(DisplayChangeListener *dcl,
                                    uint32_t pos_x, uint32_t pos_y);
+    /* optional */
     void (*dpy_gl_release_dmabuf)(DisplayChangeListener *dcl,
                                   QemuDmaBuf *dmabuf);
+    /* required if GL */
     void (*dpy_gl_update)(DisplayChangeListener *dcl,
                           uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 
-- 
2.29.0


