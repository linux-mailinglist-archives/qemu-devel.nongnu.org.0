Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CB533CD7E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 06:46:54 +0100 (CET)
Received: from localhost ([::1]:59964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM2Xd-0006Eo-3l
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 01:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM2Pm-0006Fr-WF
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM2Pf-0004pB-H1
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615873116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3h+DkWCO2qWsmDungvo9al4+6SMrY9LNYHI4IYztbVU=;
 b=Sxg18lqXfffWX9kTRoQZc6G+0tDKaUSxqrhpq11nB/3DXyYnKxNPJoWhr59ARhm0GySa/c
 +S5wKa53Cts7w0PmjNYSKam1uLxavCKp4NfrgDn56sabVJvO/NoplMvGEQWLnwxPR3gWdz
 pLgItm4rUXXgDHw4cG0V3fpRBvH6wLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-0CQ6v-3TNkW6sEUpefrgMw-1; Tue, 16 Mar 2021 01:38:34 -0400
X-MC-Unique: 0CQ6v-3TNkW6sEUpefrgMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 870FB801817;
 Tue, 16 Mar 2021 05:38:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D66DB100164C;
 Tue, 16 Mar 2021 05:38:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6078518007BE; Tue, 16 Mar 2021 06:38:13 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/11] ui: add more trace points for VNC client/server messages
Date: Tue, 16 Mar 2021 06:38:08 +0100
Message-Id: <20210316053813.1719442-7-kraxel@redhat.com>
In-Reply-To: <20210316053813.1719442-1-kraxel@redhat.com>
References: <20210316053813.1719442-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

This adds trace points for desktop size and audio related messages.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210311182957.486939-2-berrange@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc.c        | 21 +++++++++++++++++++--
 ui/trace-events |  9 +++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index e8e3426a65c4..7291429c04cf 100644
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
diff --git a/ui/trace-events b/ui/trace-events
index 0ffcdb4408a6..bd8f8a9d186a 100644
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
-- 
2.29.2


