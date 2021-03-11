Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4E9337CD4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:44:09 +0100 (CET)
Received: from localhost ([::1]:33212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQI4-0004MG-6R
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKQ4d-0001h3-Je
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:30:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKQ4Z-0004Z6-UX
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615487411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IsCuMUVxeZbUK1mv/tgKGIYXFIqVMXFcAD00/Y/nfIc=;
 b=T8X+XiAY7mQeb6yg/jwMLdd9x6kLChv1PueP8eTJc3VurKgN6Pg8vf7bYMOrYnRQhn2ymF
 PTe+RZb36dnkCzLDs+pkwx7JXmmCGMZXHEh1jkM7aT/SByeBMDEPI/uO2zp2Pt0exhDQLT
 NT/vZyz4W2x9YdBfm78zikUBBNy/oCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-fDpQLiCQMrCjXsVu3b3ZBg-1; Thu, 11 Mar 2021 13:30:09 -0500
X-MC-Unique: fDpQLiCQMrCjXsVu3b3ZBg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4579100C661
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 18:30:08 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-85.ams2.redhat.com
 [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69C872C15A;
 Thu, 11 Mar 2021 18:30:04 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] ui: add more trace points for VNC client/server messages
Date: Thu, 11 Mar 2021 18:29:54 +0000
Message-Id: <20210311182957.486939-2-berrange@redhat.com>
In-Reply-To: <20210311182957.486939-1-berrange@redhat.com>
References: <20210311182957.486939-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds trace points for desktop size and audio related messages.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 ui/trace-events |  9 +++++++++
 ui/vnc.c        | 21 +++++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/ui/trace-events b/ui/trace-events
index 0ffcdb4408..bd8f8a9d18 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -37,6 +37,15 @@ vnc_key_event_ext(bool down, int sym, int keycode, const char *name) "down %d, s
 vnc_key_event_map(bool down, int sym, int keycode, const char *name) "down %d, sym 0x%x -> keycode 0x%x [%s]"
 vnc_key_sync_numlock(bool on) "%d"
 vnc_key_sync_capslock(bool on) "%d"
+vnc_msg_server_audio_begin(void *state, void *ioc) "VNC server msg audio begin state=%p ioc=%p"
+vnc_msg_server_audio_end(void *state, void *ioc) "VNC server msg audio end state=%p ioc=%p"
+vnc_msg_server_audio_data(void *state, void *ioc, const void *buf, size_t len) "VNC server msg audio data state=%p ioc=%p buf=%p len=%zd"
+vnc_msg_server_desktop_resize(void *state, void *ioc, int width, int height) "VNC server msg ext resize state=%p ioc=%p size=%dx%d"
+vnc_msg_server_ext_desktop_resize(void *state, void *ioc, int width, int height, int reason) "VNC server msg ext resize state=%p ioc=%p size=%dx%d reason=%d"
+vnc_msg_client_audio_enable(void *state, void *ioc) "VNC client msg audio enable state=%p ioc=%p"
+vnc_msg_client_audio_disable(void *state, void *ioc) "VNC client msg audio disable state=%p ioc=%p"
+vnc_msg_client_audio_format(void *state, void *ioc, int fmt, int channels, int freq) "VNC client msg audio format state=%p ioc=%p fmt=%d channels=%d freq=%d"
+vnc_msg_client_set_desktop_size(void *state, void *ioc, int width, int height, int screens) "VNC client msg set desktop size  state=%p ioc=%p size=%dx%d screens=%d"
 vnc_client_eof(void *state, void *ioc) "VNC client EOF state=%p ioc=%p"
 vnc_client_io_error(void *state, void *ioc, const char *msg) "VNC client I/O error state=%p ioc=%p errmsg=%s"
 vnc_client_connect(void *state, void *ioc) "VNC client connect state=%p ioc=%p"
diff --git a/ui/vnc.c b/ui/vnc.c
index e8e3426a65..7291429c04 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -659,6 +659,9 @@ void vnc_framebuffer_update(VncState *vs, int x, int y, int w, int h,
 
 static void vnc_desktop_resize_ext(VncState *vs, int reject_reason)
 {
+    trace_vnc_msg_server_ext_desktop_resize(
+        vs, vs->ioc, vs->client_width, vs->client_height, reject_reason);
+
     vnc_lock_output(vs);
     vnc_write_u8(vs, VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
     vnc_write_u8(vs, 0);
@@ -705,6 +708,9 @@ static void vnc_desktop_resize(VncState *vs)
         return;
     }
 
+    trace_vnc_msg_server_desktop_resize(
+        vs, vs->ioc, vs->client_width, vs->client_height);
+
     vnc_lock_output(vs);
     vnc_write_u8(vs, VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
     vnc_write_u8(vs, 0);
@@ -1182,6 +1188,7 @@ static void audio_capture_notify(void *opaque, audcnotification_e cmd)
     assert(vs->magic == VNC_MAGIC);
     switch (cmd) {
     case AUD_CNOTIFY_DISABLE:
+        trace_vnc_msg_server_audio_end(vs, vs->ioc);
         vnc_lock_output(vs);
         vnc_write_u8(vs, VNC_MSG_SERVER_QEMU);
         vnc_write_u8(vs, VNC_MSG_SERVER_QEMU_AUDIO);
@@ -1191,6 +1198,7 @@ static void audio_capture_notify(void *opaque, audcnotification_e cmd)
         break;
 
     case AUD_CNOTIFY_ENABLE:
+        trace_vnc_msg_server_audio_begin(vs, vs->ioc);
         vnc_lock_output(vs);
         vnc_write_u8(vs, VNC_MSG_SERVER_QEMU);
         vnc_write_u8(vs, VNC_MSG_SERVER_QEMU_AUDIO);
@@ -1210,6 +1218,7 @@ static void audio_capture(void *opaque, const void *buf, int size)
     VncState *vs = opaque;
 
     assert(vs->magic == VNC_MAGIC);
+    trace_vnc_msg_server_audio_data(vs, vs->ioc, buf, size);
     vnc_lock_output(vs);
     if (vs->output.offset < vs->throttle_output_offset) {
         vnc_write_u8(vs, VNC_MSG_SERVER_QEMU);
@@ -2454,9 +2463,11 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
 
             switch (read_u16 (data, 2)) {
             case VNC_MSG_CLIENT_QEMU_AUDIO_ENABLE:
+                trace_vnc_msg_client_audio_enable(vs, vs->ioc);
                 audio_add(vs);
                 break;
             case VNC_MSG_CLIENT_QEMU_AUDIO_DISABLE:
+                trace_vnc_msg_client_audio_disable(vs, vs->ioc);
                 audio_del(vs);
                 break;
             case VNC_MSG_CLIENT_QEMU_AUDIO_SET_FORMAT:
@@ -2492,6 +2503,8 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
                     break;
                 }
                 vs->as.freq = freq;
+                trace_vnc_msg_client_audio_format(
+                    vs, vs->ioc, vs->as.fmt, vs->as.nchannels, vs->as.freq);
                 break;
             default:
                 VNC_DEBUG("Invalid audio message %d\n", read_u8(data, 4));
@@ -2510,6 +2523,7 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
     {
         size_t size;
         uint8_t screens;
+        int w, h;
 
         if (len < 8) {
             return 8;
@@ -2520,12 +2534,15 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
         if (len < size) {
             return size;
         }
+        w = read_u16(data, 2);
+        h = read_u16(data, 4);
 
+        trace_vnc_msg_client_set_desktop_size(vs, vs->ioc, w, h, screens);
         if (dpy_ui_info_supported(vs->vd->dcl.con)) {
             QemuUIInfo info;
             memset(&info, 0, sizeof(info));
-            info.width = read_u16(data, 2);
-            info.height = read_u16(data, 4);
+            info.width = w;
+            info.height = h;
             dpy_set_ui_info(vs->vd->dcl.con, &info);
             vnc_desktop_resize_ext(vs, 4 /* Request forwarded */);
         } else {
-- 
2.29.2


