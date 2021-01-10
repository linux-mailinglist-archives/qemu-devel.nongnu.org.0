Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3052F0648
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:09:14 +0100 (CET)
Received: from localhost ([::1]:37866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXer-000703-6c
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:09:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYt-0001ZK-VJ
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:04 -0500
Received: from mailout08.t-online.de ([194.25.134.20]:33082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYr-0005MJ-AR
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:03 -0500
Received: from fwd26.aul.t-online.de (fwd26.aul.t-online.de [172.20.26.131])
 by mailout08.t-online.de (Postfix) with SMTP id 8D1B441E6B15;
 Sun, 10 Jan 2021 11:02:59 +0100 (CET)
Received: from linpower.localnet
 (bdeIpwZ6rhZJpIutZrIYnjIo40nnG1I+vfuiVDsGjdz4AX-Ly+pK2ADyTZQWNU4QPi@[93.236.152.29])
 by fwd26.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXYb-3qbE4O0; Sun, 10 Jan 2021 11:02:45 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id E196120062D; Sun, 10 Jan 2021 11:02:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 03/23] sdlaudio: add -audiodev sdl,out.buffer-count option
Date: Sun, 10 Jan 2021 11:02:19 +0100
Message-Id: <20210110100239.27588-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: bdeIpwZ6rhZJpIutZrIYnjIo40nnG1I+vfuiVDsGjdz4AX-Ly+pK2ADyTZQWNU4QPi
X-TOI-EXPURGATEID: 150726::1610272965-0000FB7B-2AF666C2/0/0 CLEAN NORMAL
X-TOI-MSGID: bfdc5d63-1419-4a83-a1c8-3fcfe3d9497e
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
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
Cc: Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently there is a crackling noise with SDL2 audio playback.
Commit bcf19777df: "audio/sdlaudio: Allow audio playback with
SDL2" already mentioned the crackling noise.

Add an out.buffer-count option to give users a chance to select
sane settings for glitch free audio playback. The idea was taken
from the coreaudio backend.

The in.buffer-count option will be used with one of the next
patches.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c          |  2 +-
 audio/audio_legacy.c   |  3 ++-
 audio/audio_template.h |  2 +-
 audio/sdlaudio.c       | 11 +++++++++--
 qapi/audio.json        | 33 ++++++++++++++++++++++++++++++++-
 qemu-options.hx        |  8 +++++++-
 6 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index b48471bb3f..d048d26283 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -2003,7 +2003,7 @@ void audio_create_pdos(Audiodev *dev)
         CASE(JACK, jack, Jack);
         CASE(OSS, oss, Oss);
         CASE(PA, pa, Pa);
-        CASE(SDL, sdl, );
+        CASE(SDL, sdl, Sdl);
         CASE(SPICE, spice, );
         CASE(WAV, wav, );
 
diff --git a/audio/audio_legacy.c b/audio/audio_legacy.c
index ffdbd0bcce..0fe827b057 100644
--- a/audio/audio_legacy.c
+++ b/audio/audio_legacy.c
@@ -286,7 +286,8 @@ static void handle_sdl(Audiodev *dev)
 {
     /* SDL is output only */
     get_samples_to_usecs("QEMU_SDL_SAMPLES", &dev->u.sdl.out->buffer_length,
-                         &dev->u.sdl.out->has_buffer_length, dev->u.sdl.out);
+        &dev->u.sdl.out->has_buffer_length,
+        qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.out));
 }
 
 /* wav */
diff --git a/audio/audio_template.h b/audio/audio_template.h
index 8dd48ce14e..434df5d5e7 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -337,7 +337,7 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
     case AUDIODEV_DRIVER_PA:
         return qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE);
     case AUDIODEV_DRIVER_SDL:
-        return dev->u.sdl.TYPE;
+        return qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.TYPE);
     case AUDIODEV_DRIVER_SPICE:
         return dev->u.spice.TYPE;
     case AUDIODEV_DRIVER_WAV:
diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 00cd12ba66..431bfcfddd 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -276,12 +276,18 @@ static int sdl_init_out(HWVoiceOut *hw, struct audsettings *as,
     int endianness;
     int err;
     AudioFormat effective_fmt;
+    AudiodevSdlPerDirectionOptions *spdo = s->dev->u.sdl.out;
     struct audsettings obt_as;
 
     req.freq = as->freq;
     req.format = aud_to_sdlfmt (as->fmt);
     req.channels = as->nchannels;
-    req.samples = audio_buffer_samples(s->dev->u.sdl.out, as, 11610);
+    /*
+     * This is wrong. SDL samples are QEMU frames. The buffer size will be
+     * the requested buffer size multiplied by the number of channels.
+     */
+    req.samples = audio_buffer_samples(
+        qapi_AudiodevSdlPerDirectionOptions_base(spdo), as, 11610);
     req.callback = sdl_callback;
     req.userdata = sdl;
 
@@ -301,7 +307,8 @@ static int sdl_init_out(HWVoiceOut *hw, struct audsettings *as,
     obt_as.endianness = endianness;
 
     audio_pcm_init_info (&hw->info, &obt_as);
-    hw->samples = obt.samples;
+    hw->samples = (spdo->has_buffer_count ? spdo->buffer_count : 4) *
+        obt.samples;
 
     s->initialized = 1;
     s->exit = 0;
diff --git a/qapi/audio.json b/qapi/audio.json
index 072ed79def..9cba0df8a4 100644
--- a/qapi/audio.json
+++ b/qapi/audio.json
@@ -301,6 +301,37 @@
     '*out':    'AudiodevPaPerDirectionOptions',
     '*server': 'str' } }
 
+##
+# @AudiodevSdlPerDirectionOptions:
+#
+# Options of the SDL audio backend that are used for both playback and
+# recording.
+#
+# @buffer-count: number of buffers (default 4)
+#
+# Since: 6.0
+##
+{ 'struct': 'AudiodevSdlPerDirectionOptions',
+  'base': 'AudiodevPerDirectionOptions',
+  'data': {
+    '*buffer-count': 'uint32' } }
+
+##
+# @AudiodevSdlOptions:
+#
+# Options of the SDL audio backend.
+#
+# @in: options of the recording stream
+#
+# @out: options of the playback stream
+#
+# Since: 6.0
+##
+{ 'struct': 'AudiodevSdlOptions',
+  'data': {
+    '*in':  'AudiodevSdlPerDirectionOptions',
+    '*out': 'AudiodevSdlPerDirectionOptions' } }
+
 ##
 # @AudiodevWavOptions:
 #
@@ -385,6 +416,6 @@
     'jack':      'AudiodevJackOptions',
     'oss':       'AudiodevOssOptions',
     'pa':        'AudiodevPaOptions',
-    'sdl':       'AudiodevGenericOptions',
+    'sdl':       'AudiodevSdlOptions',
     'spice':     'AudiodevGenericOptions',
     'wav':       'AudiodevWavOptions' } }
diff --git a/qemu-options.hx b/qemu-options.hx
index 1698a0c751..4e02e9bd76 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -588,6 +588,7 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
 #endif
 #ifdef CONFIG_AUDIO_SDL
     "-audiodev sdl,id=id[,prop[=value][,...]]\n"
+    "                in|out.buffer-count= number of buffers\n"
 #endif
 #ifdef CONFIG_SPICE
     "-audiodev spice,id=id[,prop[=value][,...]]\n"
@@ -745,7 +746,12 @@ SRST
 ``-audiodev sdl,id=id[,prop[=value][,...]]``
     Creates a backend using SDL. This backend is available on most
     systems, but you should use your platform's native backend if
-    possible. This backend has no backend specific properties.
+    possible.
+
+    SDL specific options are:
+
+    ``in|out.buffer-count=count``
+        Sets the count of the buffers.
 
 ``-audiodev spice,id=id[,prop[=value][,...]]``
     Creates a backend that sends audio through SPICE. This backend
-- 
2.26.2


