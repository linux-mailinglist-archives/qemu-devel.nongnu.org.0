Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3F029ADD4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 14:49:55 +0100 (CET)
Received: from localhost ([::1]:57370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXPMH-00038V-3t
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 09:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kXP9l-0004jD-SK
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:36:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kXP9k-0001KA-0g
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:36:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603805815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wxJHwQmUt1ptprRKBcFuqVmqeEIFTyIvWVyIfcstsk0=;
 b=SJ1cCNTkF4rg1vPnV7LVldUq14V0ppmNJmHguzx7PApIWxBm8GX2kn0FmG9XsMHj01aMuR
 u1VzFDC7+caNjkmZn5tsEWjvsjPFWqXB/s/96q2qs5c/Tb7gSi6EhCeYEDhR2Sc3CrB4BH
 VG6EOSjn9X2ZZE8wYc5br9T9NiWggjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-SxeaxA23N-yLHyMsag3APw-1; Tue, 27 Oct 2020 09:36:53 -0400
X-MC-Unique: SxeaxA23N-yLHyMsag3APw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78B96186DD51
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 13:36:52 +0000 (UTC)
Received: from localhost (unknown [10.36.110.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A287E76662;
 Tue, 27 Oct 2020 13:36:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] console: modify ppm_save to take a pixman image ref
Date: Tue, 27 Oct 2020 17:36:01 +0400
Message-Id: <20201027133602.3038018-3-marcandre.lureau@redhat.com>
In-Reply-To: <20201027133602.3038018-1-marcandre.lureau@redhat.com>
References: <20201027133602.3038018-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kraxel@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The function is going to be called from a coroutine, and may yield.
Let's ensure our image reference doesn't change over time (due to resize
etc) by keeping a ref.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c    | 15 ++++++++-------
 ui/trace-events |  2 +-
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 820e408170..96dd212a5d 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -195,7 +195,6 @@ static void dpy_refresh(DisplayState *s);
 static DisplayState *get_alloc_displaystate(void);
 static void text_console_update_cursor_timer(void);
 static void text_console_update_cursor(void *opaque);
-static bool ppm_save(int fd, DisplaySurface *ds, Error **errp);
 
 static void gui_update(void *opaque)
 {
@@ -311,16 +310,16 @@ void graphic_hw_invalidate(QemuConsole *con)
     }
 }
 
-static bool ppm_save(int fd, DisplaySurface *ds, Error **errp)
+static bool ppm_save(int fd, pixman_image_t *image, Error **errp)
 {
-    int width = pixman_image_get_width(ds->image);
-    int height = pixman_image_get_height(ds->image);
+    int width = pixman_image_get_width(image);
+    int height = pixman_image_get_height(image);
     g_autoptr(Object) ioc = OBJECT(qio_channel_file_new_fd(fd));
     g_autofree char *header = NULL;
     g_autoptr(pixman_image_t) linebuf = NULL;
     int y;
 
-    trace_ppm_save(fd, ds);
+    trace_ppm_save(fd, image);
 
     header = g_strdup_printf("P6\n%d %d\n%d\n", width, height, 255);
     if (qio_channel_write_all(QIO_CHANNEL(ioc),
@@ -330,7 +329,7 @@ static bool ppm_save(int fd, DisplaySurface *ds, Error **errp)
 
     linebuf = qemu_pixman_linebuf_create(PIXMAN_BE_r8g8b8, width);
     for (y = 0; y < height; y++) {
-        qemu_pixman_linebuf_fill(linebuf, ds->image, width, 0, y);
+        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
         if (qio_channel_write_all(QIO_CHANNEL(ioc),
                                   (char *)pixman_image_get_data(linebuf),
                                   pixman_image_get_stride(linebuf), errp) < 0) {
@@ -344,6 +343,7 @@ static bool ppm_save(int fd, DisplaySurface *ds, Error **errp)
 void qmp_screendump(const char *filename, bool has_device, const char *device,
                     bool has_head, int64_t head, Error **errp)
 {
+    g_autoptr(pixman_image_t) image = NULL;
     QemuConsole *con;
     DisplaySurface *surface;
     int fd;
@@ -372,6 +372,7 @@ void qmp_screendump(const char *filename, bool has_device, const char *device,
         error_setg(errp, "no surface");
         return;
     }
+    image = pixman_image_ref(surface->image);
 
     fd = qemu_open_old(filename, O_WRONLY | O_CREAT | O_TRUNC | O_BINARY, 0666);
     if (fd == -1) {
@@ -380,7 +381,7 @@ void qmp_screendump(const char *filename, bool has_device, const char *device,
         return;
     }
 
-    if (!ppm_save(fd, surface, errp)) {
+    if (!ppm_save(fd, image, errp)) {
         qemu_unlink(filename);
     }
 }
diff --git a/ui/trace-events b/ui/trace-events
index b7d7270c02..0ffcdb4408 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -15,7 +15,7 @@ displaysurface_create_pixman(void *display_surface) "surface=%p"
 displaysurface_free(void *display_surface) "surface=%p"
 displaychangelistener_register(void *dcl, const char *name) "%p [ %s ]"
 displaychangelistener_unregister(void *dcl, const char *name) "%p [ %s ]"
-ppm_save(int fd, void *display_surface) "fd=%d surface=%p"
+ppm_save(int fd, void *image) "fd=%d image=%p"
 
 # gtk-egl.c
 # gtk-gl-area.c
-- 
2.29.0


