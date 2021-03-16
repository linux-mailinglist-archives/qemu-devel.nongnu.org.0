Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D40033CD6F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 06:41:16 +0100 (CET)
Received: from localhost ([::1]:44270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM2SB-0007y2-Al
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 01:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM2Pj-0006Ff-U6
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM2PX-0004nM-Je
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615873110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=anE2ivEZrOaAsrwcDX5OEL5gPRBQCj53cB0m7iPzBPI=;
 b=Ikt/MnB/QJhYxYsUeO7iQgp5QzVo8rFmw9e1Eb+DCBMxCVmEM259+FtZad+5J+wPj7ZgQz
 rF5KoI8aiewaeV7bwjH9HNHfMkOKDn/Cr+mMRO2zZRdfXUtteIXrIhLLPN7PHD5RbIb5ZJ
 Fh00hXElyVd+MRze4/3MhgC3aYTGnLk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-G5KHtW_XNeWMeXp0kwGV5g-1; Tue, 16 Mar 2021 01:38:27 -0400
X-MC-Unique: G5KHtW_XNeWMeXp0kwGV5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BA63107ACCD;
 Tue, 16 Mar 2021 05:38:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE52861F5C;
 Tue, 16 Mar 2021 05:38:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6DA0718007BF; Tue, 16 Mar 2021 06:38:13 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/11] ui: avoid sending framebuffer updates outside client
 desktop bounds
Date: Tue, 16 Mar 2021 06:38:09 +0100
Message-Id: <20210316053813.1719442-8-kraxel@redhat.com>
In-Reply-To: <20210316053813.1719442-1-kraxel@redhat.com>
References: <20210316053813.1719442-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We plan framebuffer update rects based on the VNC server surface. If the
client doesn't support desktop resize, then the client bounds may differ
from the server surface bounds. VNC clients may become upset if we then
send an update message outside the bounds of the client desktop.

This takes the approach of clamping the rectangles from the worker
thread immediately before sending them. This may sometimes results in
sending a framebuffer update message with zero rectangles.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210311182957.486939-3-berrange@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc-jobs.c   | 44 ++++++++++++++++++++++++++++++++++++++++----
 ui/trace-events |  5 +++++
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/ui/vnc-jobs.c b/ui/vnc-jobs.c
index dbbfbefe5619..4562bf89288e 100644
--- a/ui/vnc-jobs.c
+++ b/ui/vnc-jobs.c
@@ -32,6 +32,7 @@
 #include "qemu/sockets.h"
 #include "qemu/main-loop.h"
 #include "block/aio.h"
+#include "trace.h"
 
 /*
  * Locking:
@@ -94,6 +95,8 @@ int vnc_job_add_rect(VncJob *job, int x, int y, int w, int h)
 {
     VncRectEntry *entry = g_new0(VncRectEntry, 1);
 
+    trace_vnc_job_add_rect(job->vs, job, x, y, w, h);
+
     entry->rect.x = x;
     entry->rect.y = y;
     entry->rect.w = w;
@@ -190,6 +193,8 @@ static void vnc_async_encoding_start(VncState *orig, VncState *local)
     local->zlib = orig->zlib;
     local->hextile = orig->hextile;
     local->zrle = orig->zrle;
+    local->client_width = orig->client_width;
+    local->client_height = orig->client_height;
 }
 
 static void vnc_async_encoding_end(VncState *orig, VncState *local)
@@ -202,6 +207,34 @@ static void vnc_async_encoding_end(VncState *orig, VncState *local)
     orig->lossy_rect = local->lossy_rect;
 }
 
+static bool vnc_worker_clamp_rect(VncState *vs, VncJob *job, VncRect *rect)
+{
+    trace_vnc_job_clamp_rect(vs, job, rect->x, rect->y, rect->w, rect->h);
+
+    if (rect->x >= vs->client_width) {
+        goto discard;
+    }
+    rect->w = MIN(vs->client_width - rect->x, rect->w);
+    if (rect->w == 0) {
+        goto discard;
+    }
+
+    if (rect->y >= vs->client_height) {
+        goto discard;
+    }
+    rect->h = MIN(vs->client_height - rect->y, rect->h);
+    if (rect->h == 0) {
+        goto discard;
+    }
+
+    trace_vnc_job_clamped_rect(vs, job, rect->x, rect->y, rect->w, rect->h);
+    return true;
+
+ discard:
+    trace_vnc_job_discard_rect(vs, job, rect->x, rect->y, rect->w, rect->h);
+    return false;
+}
+
 static int vnc_worker_thread_loop(VncJobQueue *queue)
 {
     VncJob *job;
@@ -260,14 +293,17 @@ static int vnc_worker_thread_loop(VncJobQueue *queue)
             goto disconnected;
         }
 
-        n = vnc_send_framebuffer_update(&vs, entry->rect.x, entry->rect.y,
-                                        entry->rect.w, entry->rect.h);
+        if (vnc_worker_clamp_rect(&vs, job, &entry->rect)) {
+            n = vnc_send_framebuffer_update(&vs, entry->rect.x, entry->rect.y,
+                                            entry->rect.w, entry->rect.h);
 
-        if (n >= 0) {
-            n_rectangles += n;
+            if (n >= 0) {
+                n_rectangles += n;
+            }
         }
         g_free(entry);
     }
+    trace_vnc_job_nrects(&vs, job, n_rectangles);
     vnc_unlock_display(job->vs->vd);
 
     /* Put n_rectangles at the beginning of the message */
diff --git a/ui/trace-events b/ui/trace-events
index bd8f8a9d186a..3838ae2d849a 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -59,6 +59,11 @@ vnc_client_throttle_audio(void *state, void *ioc, size_t offset) "VNC client thr
 vnc_client_unthrottle_forced(void *state, void *ioc) "VNC client unthrottle forced offset state=%p ioc=%p"
 vnc_client_unthrottle_incremental(void *state, void *ioc, size_t offset) "VNC client unthrottle incremental state=%p ioc=%p offset=%zu"
 vnc_client_output_limit(void *state, void *ioc, size_t offset, size_t threshold) "VNC client output limit state=%p ioc=%p offset=%zu threshold=%zu"
+vnc_job_add_rect(void *state, void *job, int x, int y, int w, int h) "VNC add rect state=%p job=%p offset=%d,%d size=%dx%d"
+vnc_job_discard_rect(void *state, void *job, int x, int y, int w, int h) "VNC job discard rect state=%p job=%p offset=%d,%d size=%dx%d"
+vnc_job_clamp_rect(void *state, void *job, int x, int y, int w, int h) "VNC job clamp rect state=%p job=%p offset=%d,%d size=%dx%d"
+vnc_job_clamped_rect(void *state, void *job, int x, int y, int w, int h) "VNC job clamp rect state=%p job=%p offset=%d,%d size=%dx%d"
+vnc_job_nrects(void *state, void *job, int nrects) "VNC job state=%p job=%p nrects=%d"
 vnc_auth_init(void *display, int websock, int auth, int subauth) "VNC auth init state=%p websock=%d auth=%d subauth=%d"
 vnc_auth_start(void *state, int method) "VNC client auth start state=%p method=%d"
 vnc_auth_pass(void *state, int method) "VNC client auth passed state=%p method=%d"
-- 
2.29.2


