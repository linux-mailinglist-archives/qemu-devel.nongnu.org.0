Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A0230C1B4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:32:58 +0100 (CET)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wjh-00065d-E7
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6wf3-0000XW-BV
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:28:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6wf1-0003LN-IO
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cUzDXpRqEv5VZgfSoKIGtEVGT6KJtVlzOdFvjwVT2vE=;
 b=dY4xZvvOHIih7DQd8SpZBgWp0pvjm3DDET8PUEaGLBb/NIQ3osmxFN2Q+K2r4GP2M0JHIs
 ER/BtweVm1TMX9ugGIDCGxffgpqzWcsz5Gw1rvduLXtK8w15s1uUknKX63PmibBNyY5C1p
 t46SViy+9OIVf/2xZPaynZ/+owqqPLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-Txr_ROVdPEyntqwShOjWuw-1; Tue, 02 Feb 2021 09:28:05 -0500
X-MC-Unique: Txr_ROVdPEyntqwShOjWuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53A87801B13
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:28:04 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 743D01F6;
 Tue,  2 Feb 2021 14:27:57 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 08/20] ui: annotate DCLOps callback requirements
Date: Tue,  2 Feb 2021 18:26:13 +0400
Message-Id: <20210202142625.609070-9-marcandre.lureau@redhat.com>
In-Reply-To: <20210202142625.609070-1-marcandre.lureau@redhat.com>
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
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


