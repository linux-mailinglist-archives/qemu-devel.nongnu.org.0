Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CE32F0647
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:09:10 +0100 (CET)
Received: from localhost ([::1]:37406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXen-0006on-6c
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYr-0001VT-DL
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:01 -0500
Received: from mailout07.t-online.de ([194.25.134.83]:59598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYp-0005Lt-2s
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:01 -0500
Received: from fwd23.aul.t-online.de (fwd23.aul.t-online.de [172.20.26.128])
 by mailout07.t-online.de (Postfix) with SMTP id 0C5AA4247837;
 Sun, 10 Jan 2021 11:02:57 +0100 (CET)
Received: from linpower.localnet
 (T5t2MiZBghFEvzwSUpQxdi9SERm6HEmwO7HHWODV6EjD0UvsWQEawFcWlzcE3H0w9a@[93.236.152.29])
 by fwd23.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXYl-0H7hpY0; Sun, 10 Jan 2021 11:02:55 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id EA2D4200631; Sun, 10 Jan 2021 11:02:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 07/23] sdlaudio: replace legacy functions with modern ones
Date: Sun, 10 Jan 2021 11:02:23 +0100
Message-Id: <20210110100239.27588-7-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: T5t2MiZBghFEvzwSUpQxdi9SERm6HEmwO7HHWODV6EjD0UvsWQEawFcWlzcE3H0w9a
X-TOI-EXPURGATEID: 150726::1610272976-00017F06-29458977/0/0 CLEAN NORMAL
X-TOI-MSGID: e212f7f5-b999-43c4-a68b-8b005ccbeb71
Received-SPF: none client-ip=194.25.134.83;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout07.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the modern audio functions it's possible to add new
features like audio recording.

As a side effect this patch fixes a bug where SDL2 can't be used
on Windows. This bug was reported on the qemu-devel mailing list at

https://lists.nongnu.org/archive/html/qemu-devel/2020-01/msg04043.html

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/sdlaudio.c | 107 ++++++++++++++++++++++-------------------------
 1 file changed, 50 insertions(+), 57 deletions(-)

diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 01ae4c600e..47968c5020 100644
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
2.26.2


