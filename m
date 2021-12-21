Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B01147BA6E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:06:03 +0100 (CET)
Received: from localhost ([::1]:32908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZDm-0006yL-Ml
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:06:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZA0-0003pR-JJ
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:02:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZ9v-00021U-2p
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hE9YWsmTm38tqLhb1PCblibvG6EgJPixnrLwcacfk3s=;
 b=IZZs3ElGUnLJJ1VOop5yDtG6A+npK08WOdWePiVYG+gjbFdi/cA/7OwPf3ni5B6y6h++Y7
 80z4KS1qS2gGKHyVbijl5C+FTvYA6vzmR4xYOPt8qg8Kd1dYEq4JaNjNvodTFSSnoj5+uh
 PviGR0PVoi1E3idLucSrqEbx8/8MGv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-g8UtPxARPmmHg4cOAdNKjA-1; Tue, 21 Dec 2021 02:01:56 -0500
X-MC-Unique: g8UtPxARPmmHg4cOAdNKjA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 918551006AA5;
 Tue, 21 Dec 2021 07:01:55 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D484838E4;
 Tue, 21 Dec 2021 07:01:54 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 09/36] ui: do not delay further remote resize
Date: Tue, 21 Dec 2021 10:58:28 +0400
Message-Id: <20211221065855.142578-10-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

A remote client, such as Spice, will already avoid flooding the stream
by delaying the resize requests.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h | 2 +-
 ui/console.c         | 5 +++--
 ui/gtk.c             | 2 +-
 ui/sdl2.c            | 2 +-
 ui/spice-display.c   | 2 +-
 ui/vnc.c             | 2 +-
 ui/cocoa.m           | 2 +-
 7 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 6d678924f6fd..65e6bbcab8ae 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -292,7 +292,7 @@ void unregister_displaychangelistener(DisplayChangeListener *dcl);
 
 bool dpy_ui_info_supported(QemuConsole *con);
 const QemuUIInfo *dpy_get_ui_info(const QemuConsole *con);
-int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info);
+int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info, bool delay);
 
 void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h);
 void dpy_gfx_update_full(QemuConsole *con);
diff --git a/ui/console.c b/ui/console.c
index 29a3e3f0f51c..dcc21eb5b244 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1538,7 +1538,7 @@ const QemuUIInfo *dpy_get_ui_info(const QemuConsole *con)
     return &con->ui_info;
 }
 
-int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info)
+int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info, bool delay)
 {
     if (con == NULL) {
         con = active_console;
@@ -1558,7 +1558,8 @@ int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info)
      * go notify the guest.
      */
     con->ui_info = *info;
-    timer_mod(con->ui_timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + 1000);
+    timer_mod(con->ui_timer,
+              qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + (delay ? 1000 : 0));
     return 0;
 }
 
diff --git a/ui/gtk.c b/ui/gtk.c
index 428f02f2dfe1..c0d8a9f061ee 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -698,7 +698,7 @@ static void gd_set_ui_info(VirtualConsole *vc, gint width, gint height)
     memset(&info, 0, sizeof(info));
     info.width = width;
     info.height = height;
-    dpy_set_ui_info(vc->gfx.dcl.con, &info);
+    dpy_set_ui_info(vc->gfx.dcl.con, &info, true);
 }
 
 #if defined(CONFIG_OPENGL)
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 17c0ec30ebff..9ba3bc49e798 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -561,7 +561,7 @@ static void handle_windowevent(SDL_Event *ev)
             memset(&info, 0, sizeof(info));
             info.width = ev->window.data1;
             info.height = ev->window.data2;
-            dpy_set_ui_info(scon->dcl.con, &info);
+            dpy_set_ui_info(scon->dcl.con, &info, true);
         }
         sdl2_redraw(scon);
         break;
diff --git a/ui/spice-display.c b/ui/spice-display.c
index f59c69882d91..52d9f3260aab 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -692,7 +692,7 @@ static int interface_client_monitors_config(QXLInstance *sin,
     }
 
     trace_qemu_spice_ui_info(ssd->qxl.id, info.width, info.height);
-    dpy_set_ui_info(ssd->dcl.con, &info);
+    dpy_set_ui_info(ssd->dcl.con, &info, false);
     return 1;
 }
 
diff --git a/ui/vnc.c b/ui/vnc.c
index 9b603382e75e..1ed1c7efc688 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2596,7 +2596,7 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
             memset(&info, 0, sizeof(info));
             info.width = w;
             info.height = h;
-            dpy_set_ui_info(vs->vd->dcl.con, &info);
+            dpy_set_ui_info(vs->vd->dcl.con, &info, false);
             vnc_desktop_resize_ext(vs, 4 /* Request forwarded */);
         } else {
             vnc_desktop_resize_ext(vs, 3 /* Invalid screen layout */);
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 7ca429fa8078..69745c483b45 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -552,7 +552,7 @@ QemuCocoaView *cocoaView;
     info.width = frameSize.width;
     info.height = frameSize.height;
 
-    dpy_set_ui_info(dcl.con, &info);
+    dpy_set_ui_info(dcl.con, &info, TRUE);
 }
 
 - (void)viewDidMoveToWindow
-- 
2.34.1.8.g35151cf07204


