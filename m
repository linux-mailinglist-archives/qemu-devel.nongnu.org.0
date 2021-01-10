Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF72F064E
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:12:27 +0100 (CET)
Received: from localhost ([::1]:45782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXhy-00029E-S5
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:12:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYy-0001eO-HM
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:09 -0500
Received: from mailout02.t-online.de ([194.25.134.17]:47530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYw-0005OX-6t
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:08 -0500
Received: from fwd24.aul.t-online.de (fwd24.aul.t-online.de [172.20.26.129])
 by mailout02.t-online.de (Postfix) with SMTP id 4DFCA41E6F16;
 Sun, 10 Jan 2021 11:03:04 +0100 (CET)
Received: from linpower.localnet
 (TlWkeiZEohU29xyeIn2SauYaNY4ilCVq2kijrcTGwRmiLgJCC4d2tVCiw6x0lpRZvu@[93.236.152.29])
 by fwd24.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXYr-4Omn320; Sun, 10 Jan 2021 11:03:01 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id EE9E8200633; Sun, 10 Jan 2021 11:02:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 09/23] sdlaudio: add recording functions
Date: Sun, 10 Jan 2021 11:02:25 +0100
Message-Id: <20210110100239.27588-9-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: TlWkeiZEohU29xyeIn2SauYaNY4ilCVq2kijrcTGwRmiLgJCC4d2tVCiw6x0lpRZvu
X-TOI-EXPURGATEID: 150726::1610272981-00005513-6D7F08C5/0/0 CLEAN NORMAL
X-TOI-MSGID: 3296169b-f124-4822-99a7-22f125d5dbbb
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Add audio recording functions. SDL 2.0.5 or later is required to
use the recording functions. Playback continues to work with
earlier SDL 2.0 versions.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/sdlaudio.c | 142 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 139 insertions(+), 3 deletions(-)

diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 47968c5020..445cae8de5 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -47,6 +47,14 @@ typedef struct SDLVoiceOut {
     SDL_AudioDeviceID devid;
 } SDLVoiceOut;
 
+typedef struct SDLVoiceIn {
+    HWVoiceIn hw;
+    int exit;
+    int initialized;
+    Audiodev *dev;
+    SDL_AudioDeviceID devid;
+} SDLVoiceIn;
+
 static void GCC_FMT_ATTR (1, 2) sdl_logerr (const char *fmt, ...)
 {
     va_list ap;
@@ -240,6 +248,45 @@ static void sdl_callback_out(void *opaque, Uint8 *buf, int len)
     }
 }
 
+static void sdl_close_in(SDLVoiceIn *sdl)
+{
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
+    }
+}
+
+static void sdl_callback_in(void *opaque, Uint8 *buf, int len)
+{
+    SDLVoiceIn *sdl = opaque;
+    HWVoiceIn *hw = &sdl->hw;
+
+    if (sdl->exit) {
+        return;
+    }
+
+    /* dolog("callback_in: len=%d pending=%zu\n", len, hw->pending_emul); */
+
+    while (hw->pending_emul < hw->size_emul && len) {
+        size_t read_len = MIN(len, MIN(hw->size_emul - hw->pos_emul,
+                                       hw->size_emul - hw->pending_emul));
+
+        memcpy(hw->buf_emul + hw->pos_emul, buf, read_len);
+
+        hw->pending_emul += read_len;
+        hw->pos_emul = (hw->pos_emul + read_len) % hw->size_emul;
+        len -= read_len;
+        buf += read_len;
+    }
+}
+
 #define SDL_WRAPPER_FUNC(name, ret_type, args_decl, args, dir) \
     static ret_type glue(sdl_, name)args_decl                  \
     {                                                          \
@@ -253,13 +300,30 @@ static void sdl_callback_out(void *opaque, Uint8 *buf, int len)
         return ret;                                            \
     }
 
+#define SDL_WRAPPER_VOID_FUNC(name, args_decl, args, dir)      \
+    static void glue(sdl_, name)args_decl                      \
+    {                                                          \
+        glue(SDLVoice, dir) *sdl = (glue(SDLVoice, dir) *)hw;  \
+                                                               \
+        SDL_LockAudioDevice(sdl->devid);                       \
+        glue(audio_generic_, name)args;                        \
+        SDL_UnlockAudioDevice(sdl->devid);                     \
+    }
+
 SDL_WRAPPER_FUNC(get_buffer_out, void *, (HWVoiceOut *hw, size_t *size),
                  (hw, size), Out)
 SDL_WRAPPER_FUNC(put_buffer_out, size_t,
                  (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size), Out)
 SDL_WRAPPER_FUNC(write, size_t,
                  (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size), Out)
+SDL_WRAPPER_FUNC(read, size_t, (HWVoiceIn *hw, void *buf, size_t size),
+                 (hw, buf, size), In)
+SDL_WRAPPER_FUNC(get_buffer_in, void *, (HWVoiceIn *hw, size_t *size),
+                 (hw, size), In)
+SDL_WRAPPER_VOID_FUNC(put_buffer_in, (HWVoiceIn *hw, void *buf, size_t size),
+                      (hw, buf, size), In)
 #undef SDL_WRAPPER_FUNC
+#undef SDL_WRAPPER_VOID_FUNC
 
 static void sdl_fini_out(HWVoiceOut *hw)
 {
@@ -325,6 +389,69 @@ static void sdl_enable_out(HWVoiceOut *hw, bool enable)
     SDL_PauseAudioDevice(sdl->devid, !enable);
 }
 
+static void sdl_fini_in(HWVoiceIn *hw)
+{
+    SDLVoiceIn *sdl = (SDLVoiceIn *)hw;
+
+    sdl_close_in(sdl);
+}
+
+static int sdl_init_in(HWVoiceIn *hw, audsettings *as, void *drv_opaque)
+{
+    SDLVoiceIn *sdl = (SDLVoiceIn *)hw;
+    SDL_AudioSpec req, obt;
+    int endianness;
+    int err;
+    AudioFormat effective_fmt;
+    Audiodev *dev = drv_opaque;
+    AudiodevSdlPerDirectionOptions *spdo = dev->u.sdl.in;
+    struct audsettings obt_as;
+
+    req.freq = as->freq;
+    req.format = aud_to_sdlfmt(as->fmt);
+    req.channels = as->nchannels;
+    /* SDL samples are QEMU frames */
+    req.samples = audio_buffer_frames(
+        qapi_AudiodevSdlPerDirectionOptions_base(spdo), as, 11610);
+    req.callback = sdl_callback_in;
+    req.userdata = sdl;
+
+    sdl->dev = dev;
+    sdl->devid = sdl_open(&req, &obt, 1);
+    if (!sdl->devid) {
+        return -1;
+    }
+
+    err = sdl_to_audfmt(obt.format, &effective_fmt, &endianness);
+    if (err) {
+        sdl_close_in(sdl);
+        return -1;
+    }
+
+    obt_as.freq = obt.freq;
+    obt_as.nchannels = obt.channels;
+    obt_as.fmt = effective_fmt;
+    obt_as.endianness = endianness;
+
+    audio_pcm_init_info(&hw->info, &obt_as);
+    hw->samples = (spdo->has_buffer_count ? spdo->buffer_count : 4) *
+        obt.samples;
+    hw->size_emul = hw->samples * hw->info.bytes_per_frame;
+    hw->buf_emul = g_malloc(hw->size_emul);
+    hw->pos_emul = hw->pending_emul = 0;
+
+    sdl->initialized = 1;
+    sdl->exit = 0;
+    return 0;
+}
+
+static void sdl_enable_in(HWVoiceIn *hw, bool enable)
+{
+    SDLVoiceIn *sdl = (SDLVoiceIn *)hw;
+
+    SDL_PauseAudioDevice(sdl->devid, !enable);
+}
+
 static void *sdl_audio_init(Audiodev *dev)
 {
     if (SDL_InitSubSystem (SDL_INIT_AUDIO)) {
@@ -350,6 +477,15 @@ static struct audio_pcm_ops sdl_pcm_ops = {
   /* wrapper for audio_generic_put_buffer_out */
     .put_buffer_out = sdl_put_buffer_out,
     .enable_out = sdl_enable_out,
+    .init_in = sdl_init_in,
+    .fini_in = sdl_fini_in,
+  /* wrapper for audio_generic_read */
+    .read = sdl_read,
+  /* wrapper for audio_generic_get_buffer_in */
+    .get_buffer_in = sdl_get_buffer_in,
+  /* wrapper for audio_generic_put_buffer_in */
+    .put_buffer_in = sdl_put_buffer_in,
+    .enable_in = sdl_enable_in,
 };
 
 static struct audio_driver sdl_audio_driver = {
@@ -360,9 +496,9 @@ static struct audio_driver sdl_audio_driver = {
     .pcm_ops        = &sdl_pcm_ops,
     .can_be_default = 1,
     .max_voices_out = 1,
-    .max_voices_in  = 0,
-    .voice_size_out = sizeof (SDLVoiceOut),
-    .voice_size_in  = 0
+    .max_voices_in  = 1,
+    .voice_size_out = sizeof(SDLVoiceOut),
+    .voice_size_in  = sizeof(SDLVoiceIn),
 };
 
 static void register_audio_sdl(void)
-- 
2.26.2


