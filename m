Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6CB2F7CF7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:44:56 +0100 (CET)
Received: from localhost ([::1]:41818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PPL-0004yd-6R
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:44:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3O-00079c-VG
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3B-0003K9-4g
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZTJk/IO1CG0AfYOte8jvRBNHTN1JrAxcVRl8PeAOiJc=;
 b=Rd3jaYYUL/wBizEvS6REaLun296+m6bUEe8MLeZXG6WZwk1cWmcCB/z4abNXq79RrGACxD
 5z3B1Ak/xCWBQ2OdkoFBpIDKv2RwZ57xqCXwgozT0i+kquVwBeWTGx6vDTkyFuhy55fLxM
 OJfTClScJGpsS6qDmjrF1Q7MUUu7rGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-Ns1dOkC3P824tV3QUfupLg-1; Fri, 15 Jan 2021 08:21:56 -0500
X-MC-Unique: Ns1dOkC3P824tV3QUfupLg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE9418030A5;
 Fri, 15 Jan 2021 13:21:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 833E15D9E3;
 Fri, 15 Jan 2021 13:21:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6BD2F180063D; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/30] sdlaudio: replace legacy functions with modern ones
Date: Fri, 15 Jan 2021 14:21:23 +0100
Message-Id: <20210115132146.1443592-8-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

With the modern audio functions it's possible to add new
features like audio recording.

As a side effect this patch fixes a bug where SDL2 can't be used
on Windows. This bug was reported on the qemu-devel mailing list at

https://lists.nongnu.org/archive/html/qemu-devel/2020-01/msg04043.html

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-7-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/sdlaudio.c | 107 ++++++++++++++++++++++-------------------------
 1 file changed, 50 insertions(+), 57 deletions(-)

diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 01ae4c600e80..47968c502027 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -41,15 +41,11 @@
 
 typedef struct SDLVoiceOut {
     HWVoiceOut hw;
-} SDLVoiceOut;
-
-static struct SDLAudioState {
     int exit;
     int initialized;
-    bool driver_created;
     Audiodev *dev;
-} glob_sdl;
-typedef struct SDLAudioState SDLAudioState;
+    SDL_AudioDeviceID devid;
+} SDLVoiceOut;
 
 static void GCC_FMT_ATTR (1, 2) sdl_logerr (const char *fmt, ...)
 {
@@ -155,9 +151,10 @@ static int sdl_to_audfmt(int sdlfmt, AudioFormat *fmt, int *endianness)
     return 0;
 }
 
-static int sdl_open (SDL_AudioSpec *req, SDL_AudioSpec *obt)
+static SDL_AudioDeviceID sdl_open(SDL_AudioSpec *req, SDL_AudioSpec *obt,
+                                  int rec)
 {
-    int status;
+    SDL_AudioDeviceID devid;
 #ifndef _WIN32
     int err;
     sigset_t new, old;
@@ -166,18 +163,19 @@ static int sdl_open (SDL_AudioSpec *req, SDL_AudioSpec *obt)
     err = sigfillset (&new);
     if (err) {
         dolog ("sdl_open: sigfillset failed: %s\n", strerror (errno));
-        return -1;
+        return 0;
     }
     err = pthread_sigmask (SIG_BLOCK, &new, &old);
     if (err) {
         dolog ("sdl_open: pthread_sigmask failed: %s\n", strerror (err));
-        return -1;
+        return 0;
     }
 #endif
 
-    status = SDL_OpenAudio (req, obt);
-    if (status) {
-        sdl_logerr ("SDL_OpenAudio failed\n");
+    devid = SDL_OpenAudioDevice(NULL, rec, req, obt, 0);
+    if (!devid) {
+        sdl_logerr("SDL_OpenAudioDevice for %s failed\n",
+                   rec ? "recording" : "playback");
     }
 
 #ifndef _WIN32
@@ -190,30 +188,32 @@ static int sdl_open (SDL_AudioSpec *req, SDL_AudioSpec *obt)
         exit (EXIT_FAILURE);
     }
 #endif
-    return status;
+    return devid;
 }
 
-static void sdl_close (SDLAudioState *s)
+static void sdl_close_out(SDLVoiceOut *sdl)
 {
-    if (s->initialized) {
-        SDL_LockAudio();
-        s->exit = 1;
-        SDL_UnlockAudio();
-        SDL_PauseAudio (1);
-        SDL_CloseAudio ();
-        s->initialized = 0;
+    if (sdl->initialized) {
+        SDL_LockAudioDevice(sdl->devid);
+        sdl->exit = 1;
+        SDL_UnlockAudioDevice(sdl->devid);
+        SDL_PauseAudioDevice(sdl->devid, 1);
+        sdl->initialized = 0;
+    }
+    if (sdl->devid) {
+        SDL_CloseAudioDevice(sdl->devid);
+        sdl->devid = 0;
     }
 }
 
-static void sdl_callback (void *opaque, Uint8 *buf, int len)
+static void sdl_callback_out(void *opaque, Uint8 *buf, int len)
 {
     SDLVoiceOut *sdl = opaque;
-    SDLAudioState *s = &glob_sdl;
     HWVoiceOut *hw = &sdl->hw;
 
-    if (!s->exit) {
+    if (!sdl->exit) {
 
-        /* dolog("callback: len=%d avail=%zu\n", len, hw->pending_emul); */
+        /* dolog("callback_out: len=%d avail=%zu\n", len, hw->pending_emul); */
 
         while (hw->pending_emul && len) {
             size_t write_len;
@@ -240,43 +240,44 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
     }
 }
 
-#define SDL_WRAPPER_FUNC(name, ret_type, args_decl, args)      \
+#define SDL_WRAPPER_FUNC(name, ret_type, args_decl, args, dir) \
     static ret_type glue(sdl_, name)args_decl                  \
     {                                                          \
         ret_type ret;                                          \
+        glue(SDLVoice, dir) *sdl = (glue(SDLVoice, dir) *)hw;  \
                                                                \
-        SDL_LockAudio();                                       \
+        SDL_LockAudioDevice(sdl->devid);                       \
         ret = glue(audio_generic_, name)args;                  \
-        SDL_UnlockAudio();                                     \
+        SDL_UnlockAudioDevice(sdl->devid);                     \
                                                                \
         return ret;                                            \
     }
 
 SDL_WRAPPER_FUNC(get_buffer_out, void *, (HWVoiceOut *hw, size_t *size),
-                 (hw, size))
+                 (hw, size), Out)
 SDL_WRAPPER_FUNC(put_buffer_out, size_t,
-                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size))
+                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size), Out)
 SDL_WRAPPER_FUNC(write, size_t,
-                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size))
+                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size), Out)
 #undef SDL_WRAPPER_FUNC
 
-static void sdl_fini_out (HWVoiceOut *hw)
+static void sdl_fini_out(HWVoiceOut *hw)
 {
-    (void) hw;
+    SDLVoiceOut *sdl = (SDLVoiceOut *)hw;
 
-    sdl_close (&glob_sdl);
+    sdl_close_out(sdl);
 }
 
 static int sdl_init_out(HWVoiceOut *hw, struct audsettings *as,
                         void *drv_opaque)
 {
-    SDLVoiceOut *sdl = (SDLVoiceOut *) hw;
-    SDLAudioState *s = &glob_sdl;
+    SDLVoiceOut *sdl = (SDLVoiceOut *)hw;
     SDL_AudioSpec req, obt;
     int endianness;
     int err;
     AudioFormat effective_fmt;
-    AudiodevSdlPerDirectionOptions *spdo = s->dev->u.sdl.out;
+    Audiodev *dev = drv_opaque;
+    AudiodevSdlPerDirectionOptions *spdo = dev->u.sdl.out;
     struct audsettings obt_as;
 
     req.freq = as->freq;
@@ -288,16 +289,18 @@ static int sdl_init_out(HWVoiceOut *hw, struct audsettings *as,
      */
     req.samples = audio_buffer_samples(
         qapi_AudiodevSdlPerDirectionOptions_base(spdo), as, 11610);
-    req.callback = sdl_callback;
+    req.callback = sdl_callback_out;
     req.userdata = sdl;
 
-    if (sdl_open (&req, &obt)) {
+    sdl->dev = dev;
+    sdl->devid = sdl_open(&req, &obt, 0);
+    if (!sdl->devid) {
         return -1;
     }
 
     err = sdl_to_audfmt(obt.format, &effective_fmt, &endianness);
     if (err) {
-        sdl_close (s);
+        sdl_close_out(sdl);
         return -1;
     }
 
@@ -310,41 +313,31 @@ static int sdl_init_out(HWVoiceOut *hw, struct audsettings *as,
     hw->samples = (spdo->has_buffer_count ? spdo->buffer_count : 4) *
         obt.samples;
 
-    s->initialized = 1;
-    s->exit = 0;
+    sdl->initialized = 1;
+    sdl->exit = 0;
     return 0;
 }
 
 static void sdl_enable_out(HWVoiceOut *hw, bool enable)
 {
-    SDL_PauseAudio(!enable);
+    SDLVoiceOut *sdl = (SDLVoiceOut *)hw;
+
+    SDL_PauseAudioDevice(sdl->devid, !enable);
 }
 
 static void *sdl_audio_init(Audiodev *dev)
 {
-    SDLAudioState *s = &glob_sdl;
-    if (s->driver_created) {
-        sdl_logerr("Can't create multiple sdl backends\n");
-        return NULL;
-    }
-
     if (SDL_InitSubSystem (SDL_INIT_AUDIO)) {
         sdl_logerr ("SDL failed to initialize audio subsystem\n");
         return NULL;
     }
 
-    s->driver_created = true;
-    s->dev = dev;
-    return s;
+    return dev;
 }
 
 static void sdl_audio_fini (void *opaque)
 {
-    SDLAudioState *s = opaque;
-    sdl_close (s);
     SDL_QuitSubSystem (SDL_INIT_AUDIO);
-    s->driver_created = false;
-    s->dev = NULL;
 }
 
 static struct audio_pcm_ops sdl_pcm_ops = {
-- 
2.29.2


