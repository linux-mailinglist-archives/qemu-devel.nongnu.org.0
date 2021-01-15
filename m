Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E852F7CC8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:36:34 +0100 (CET)
Received: from localhost ([::1]:44998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PHF-0002vj-41
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3M-00074z-W5
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003Ir-8V
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fsy0pg4y6bLGVzgqVrfaDRt23dgks7Zl0JvVvVOxET8=;
 b=TLOSRJxnhVfUMJJP9zQY6z1Z4sK/x4c+/GnNJ3T70EhhJPwa2p1ayaXo5P4Cut+Wucl4QJ
 bWXj8BQLmF6IjjoHTjas+i6cxshMIGBJlAtMAodwDXkHMU7Q+aXQsj9XyAVBb8f0rUuPL/
 8uLpZvta7bK3hiIjrrR/19hH3Afml5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-Wd-DqByZPWGCVlT7B5s9Dg-1; Fri, 15 Jan 2021 08:21:54 -0500
X-MC-Unique: Wd-DqByZPWGCVlT7B5s9Dg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0910B180A0A2;
 Fri, 15 Jan 2021 13:21:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9128A5D761;
 Fri, 15 Jan 2021 13:21:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8C1B4180063F; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/30] sdlaudio: add recording functions
Date: Fri, 15 Jan 2021 14:21:25 +0100
Message-Id: <20210115132146.1443592-10-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Add audio recording functions. SDL 2.0.5 or later is required to
use the recording functions. Playback continues to work with
earlier SDL 2.0 versions.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-9-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/sdlaudio.c | 142 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 139 insertions(+), 3 deletions(-)

diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 47968c502027..445cae8de578 100644
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
2.29.2


