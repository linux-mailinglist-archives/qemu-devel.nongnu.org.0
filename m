Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A27310546
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 07:58:52 +0100 (CET)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7v4t-0002vZ-Bw
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 01:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v2v-00019w-De
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v2s-00018A-OD
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6aeaFdKFD1NDXgg0nyIAYB++g539Kt7EH3Bafhy3pTM=;
 b=YP8tCFV+7NzohYG79txdjmS3cB1jVSkz9spHIpapfDsoYNk1gDD8zpyp7+16KBY+P/CD2K
 ia3St9LQzu7gg2NlPrTYwR0Gc5mFv0puKN3oFHPt1QGDpMp7sZfeDmSSe4E7YzNcR/WtZB
 j+zyzkLp6lMqt1FSa9k1ipilktzLbFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-NPA-5fEnPy-dqo-MYpneOg-1; Fri, 05 Feb 2021 01:56:44 -0500
X-MC-Unique: NPA-5fEnPy-dqo-MYpneOg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 774F5801965
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8BBF60C9B;
 Fri,  5 Feb 2021 06:56:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1107F18003B8; Fri,  5 Feb 2021 07:56:21 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/24] ui: annotate DCLOps callback requirements
Date: Fri,  5 Feb 2021 07:56:08 +0100
Message-Id: <20210205065620.1726554-13-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210204105232.834642-9-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index ce6c72e37c6b..bea2b6329a92 100644
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
2.29.2


