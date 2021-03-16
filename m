Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D153C33CD75
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 06:44:26 +0100 (CET)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM2VF-00037c-Se
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 01:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM2PZ-0006De-Tc
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:38:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM2PX-0004nG-8x
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615873110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eT73Zv6nbeUUWWKYtRetEVwL1cjukwGLaIyWzLuBOoM=;
 b=TlLSs9bN2MyY/epaNsRJbDkqj8nX9oeLi3kQo9MnLTBk4+OqkUSHWVam150OyfPyRrzEiD
 zddkBhRdp1LgNfFTnxfCgwFp5AqWPQTeRR5n3mgPyHBuEo7xiVAV/DO1WZiby5vfmxaD5d
 hpFUXXrNO6+QnOXN1YZlvWuMEJm0fls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-2YmAlSglOE6dJJeA5cXBug-1; Tue, 16 Mar 2021 01:38:27 -0400
X-MC-Unique: 2YmAlSglOE6dJJeA5cXBug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2EAD363A1;
 Tue, 16 Mar 2021 05:38:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA2B91F04E;
 Tue, 16 Mar 2021 05:38:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 871891800841; Tue, 16 Mar 2021 06:38:13 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/11] ui: honour the actual guest display dimensions without
 rounding
Date: Tue, 16 Mar 2021 06:38:11 +0100
Message-Id: <20210316053813.1719442-10-kraxel@redhat.com>
In-Reply-To: <20210316053813.1719442-1-kraxel@redhat.com>
References: <20210316053813.1719442-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

A long time ago the VNC server code had some memory corruption
fixes done in:

  commit bea60dd7679364493a0d7f5b54316c767cf894ef
  Author: Peter Lieven <pl@kamp.de>
  Date:   Mon Jun 30 10:57:51 2014 +0200

    ui/vnc: fix potential memory corruption issues

One of the implications of the fix was that the VNC server would have a
thin black bad down the right hand side if the guest desktop width was
not a multiple of 16. In practice this was a non-issue since the VNC
server was always honouring a guest specified resolution and guests
essentially always pick from a small set of sane resolutions likely in
real world hardware.

We recently introduced support for the extended desktop resize extension
and as a result the VNC client has ability to specify an arbitrary
desktop size and the guest OS may well honour it exactly. As a result we
no longer have any guarantee that the width will be a multiple of 16,
and so when resizing the desktop we have a 93% chance of getting the
black bar on the right hand size.

The VNC server maintains three different desktop dimensions

 1. The guest surface
 2. The server surface
 3. The client desktop

The requirement for the width to be a multiple of 16 only applies to
item 2, the server surface, for the purpose of doing dirty bitmap
tracking.

Normally we will set the client desktop size to always match the server
surface size, but that's not a strict requirement. In order to cope with
clients that don't support the desktop size encoding, we already allow
for the client desktop to be a different size that the server surface.

Thus we can trivially eliminate the black bar, but setting the client
desktop size to be the un-rounded server surface size - the so called
"true width".

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210311182957.486939-5-berrange@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc.h        |  1 +
 ui/vnc.c        | 23 +++++++++++++++++++----
 ui/trace-events |  2 ++
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/ui/vnc.h b/ui/vnc.h
index 116463d5f099..d4f3e1555809 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -164,6 +164,7 @@ struct VncDisplay
 
     struct VncSurface guest;   /* guest visible surface (aka ds->surface) */
     pixman_image_t *server;    /* vnc server surface */
+    int true_width; /* server surface width before rounding up */
 
     const char *id;
     QTAILQ_ENTRY(VncDisplay) next;
diff --git a/ui/vnc.c b/ui/vnc.c
index 8c9890b3cdc4..9c004a11f495 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -608,6 +608,11 @@ static int vnc_width(VncDisplay *vd)
                                        VNC_DIRTY_PIXELS_PER_BIT));
 }
 
+static int vnc_true_width(VncDisplay *vd)
+{
+    return MIN(VNC_MAX_WIDTH, surface_width(vd->ds));
+}
+
 static int vnc_height(VncDisplay *vd)
 {
     return MIN(VNC_MAX_HEIGHT, surface_height(vd->ds));
@@ -691,16 +696,16 @@ static void vnc_desktop_resize(VncState *vs)
                             !vnc_has_feature(vs, VNC_FEATURE_RESIZE_EXT))) {
         return;
     }
-    if (vs->client_width == pixman_image_get_width(vs->vd->server) &&
+    if (vs->client_width == vs->vd->true_width &&
         vs->client_height == pixman_image_get_height(vs->vd->server)) {
         return;
     }
 
-    assert(pixman_image_get_width(vs->vd->server) < 65536 &&
-           pixman_image_get_width(vs->vd->server) >= 0);
+    assert(vs->vd->true_width < 65536 &&
+           vs->vd->true_width >= 0);
     assert(pixman_image_get_height(vs->vd->server) < 65536 &&
            pixman_image_get_height(vs->vd->server) >= 0);
-    vs->client_width = pixman_image_get_width(vs->vd->server);
+    vs->client_width = vs->vd->true_width;
     vs->client_height = pixman_image_get_height(vs->vd->server);
 
     if (vnc_has_feature(vs, VNC_FEATURE_RESIZE_EXT)) {
@@ -774,6 +779,7 @@ static void vnc_update_server_surface(VncDisplay *vd)
 
     width = vnc_width(vd);
     height = vnc_height(vd);
+    vd->true_width = vnc_true_width(vd);
     vd->server = pixman_image_create_bits(VNC_SERVER_FB_FORMAT,
                                           width, height,
                                           NULL, 0);
@@ -809,13 +815,22 @@ static void vnc_dpy_switch(DisplayChangeListener *dcl,
     vd->guest.fb = pixman_image_ref(surface->image);
     vd->guest.format = surface->format;
 
+
     if (pageflip) {
+        trace_vnc_server_dpy_pageflip(vd,
+                                      surface_width(surface),
+                                      surface_height(surface),
+                                      surface_format(surface));
         vnc_set_area_dirty(vd->guest.dirty, vd, 0, 0,
                            surface_width(surface),
                            surface_height(surface));
         return;
     }
 
+    trace_vnc_server_dpy_recreate(vd,
+                                  surface_width(surface),
+                                  surface_height(surface),
+                                  surface_format(surface));
     /* server surface */
     vnc_update_server_surface(vd);
 
diff --git a/ui/trace-events b/ui/trace-events
index 3838ae2d849a..5d1da6f23668 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -59,6 +59,8 @@ vnc_client_throttle_audio(void *state, void *ioc, size_t offset) "VNC client thr
 vnc_client_unthrottle_forced(void *state, void *ioc) "VNC client unthrottle forced offset state=%p ioc=%p"
 vnc_client_unthrottle_incremental(void *state, void *ioc, size_t offset) "VNC client unthrottle incremental state=%p ioc=%p offset=%zu"
 vnc_client_output_limit(void *state, void *ioc, size_t offset, size_t threshold) "VNC client output limit state=%p ioc=%p offset=%zu threshold=%zu"
+vnc_server_dpy_pageflip(void *dpy, int w, int h, int fmt) "VNC server dpy pageflip dpy=%p size=%dx%d fmt=%d"
+vnc_server_dpy_recreate(void *dpy, int w, int h, int fmt) "VNC server dpy recreate dpy=%p size=%dx%d fmt=%d"
 vnc_job_add_rect(void *state, void *job, int x, int y, int w, int h) "VNC add rect state=%p job=%p offset=%d,%d size=%dx%d"
 vnc_job_discard_rect(void *state, void *job, int x, int y, int w, int h) "VNC job discard rect state=%p job=%p offset=%d,%d size=%dx%d"
 vnc_job_clamp_rect(void *state, void *job, int x, int y, int w, int h) "VNC job clamp rect state=%p job=%p offset=%d,%d size=%dx%d"
-- 
2.29.2


