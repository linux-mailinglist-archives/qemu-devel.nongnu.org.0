Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C022C53DAEC
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 10:59:30 +0200 (CEST)
Received: from localhost ([::1]:52628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxm6b-0000te-T1
	for lists+qemu-devel@lfdr.de; Sun, 05 Jun 2022 04:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nxlyz-0004Wc-Ti
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 04:51:41 -0400
Received: from mailout01.t-online.de ([194.25.134.80]:39910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nxlyy-0003OM-4D
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 04:51:37 -0400
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout01.t-online.de (Postfix) with SMTP id 3B8D05880;
 Sun,  5 Jun 2022 10:51:33 +0200 (CEST)
Received: from linpower.localnet ([84.175.233.215]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nxlyu-4Ngav30; Sun, 5 Jun 2022 10:51:32 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 038ED20045D; Sun,  5 Jun 2022 10:51:32 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 1/2] ui/gtk-gl-area: implement GL context destruction
Date: Sun,  5 Jun 2022 10:51:30 +0200
Message-Id: <20220605085131.7711-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <e0db9981-fe2f-67ec-63df-ff0c8e4cd690@t-online.de>
References: <e0db9981-fe2f-67ec-63df-ff0c8e4cd690@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1654419092-014391E0-0FC7D4E6/0/0 CLEAN NORMAL
X-TOI-MSGID: ce0fad68-09bf-4995-b371-946da1060563
Received-SPF: none client-ip=194.25.134.80;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout01.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The counterpart function for gd_gl_area_create_context() is
currently empty. Implement the gd_gl_area_destroy_context()
function to avoid GL context leaks.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 ui/gtk-gl-area.c | 8 +++++++-
 ui/trace-events  | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index fc5a082eb8..0e20ea031d 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -201,7 +201,13 @@ QEMUGLContext gd_gl_area_create_context(DisplayGLCtx *dgc,
 
 void gd_gl_area_destroy_context(DisplayGLCtx *dgc, QEMUGLContext ctx)
 {
-    /* FIXME */
+    GdkGLContext *current_ctx = gdk_gl_context_get_current();
+
+    trace_gd_gl_area_destroy_context(ctx, current_ctx);
+    if (ctx == current_ctx) {
+        gdk_gl_context_clear_current();
+    }
+    g_clear_object(&ctx);
 }
 
 void gd_gl_area_scanout_texture(DisplayChangeListener *dcl,
diff --git a/ui/trace-events b/ui/trace-events
index f78b5e6606..1040ba0f88 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -26,6 +26,7 @@ gd_key_event(const char *tab, int gdk_keycode, int qkeycode, const char *action)
 gd_grab(const char *tab, const char *device, const char *reason) "tab=%s, dev=%s, reason=%s"
 gd_ungrab(const char *tab, const char *device) "tab=%s, dev=%s"
 gd_keymap_windowing(const char *name) "backend=%s"
+gd_gl_area_destroy_context(void *ctx, void *current_ctx) "ctx=%p, current_ctx=%p"
 
 # vnc-auth-sasl.c
 # vnc-auth-vencrypt.c
-- 
2.35.3


