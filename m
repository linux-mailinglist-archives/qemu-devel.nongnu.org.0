Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCB82F7CF5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:44:40 +0100 (CET)
Received: from localhost ([::1]:40116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PP5-0004GU-B3
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3K-0006xw-1P
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003Ht-6u
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aeDg4125dizdq5rxpU5rsLCl6t7va00pdbEznyBm+wc=;
 b=OATSxc5B6NxluMQemkAg8byLnpZ6okiz5CszvCnQDxfk5gDsfMifrg9+utTtXPS9Ht6/i9
 ceam3Sh9sccci6vo19C2S5akm+ENeG5V0Bj6oW9wziFpgl2nDms4ifsOdaH6LgezlolfPT
 BWLhUAhnZA8d7dGbMqIY6rpGNvtHNQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-9f2-nUg1NFi5TC162wEGjg-1; Fri, 15 Jan 2021 08:21:52 -0500
X-MC-Unique: 9f2-nUg1NFi5TC162wEGjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E4A48030A2;
 Fri, 15 Jan 2021 13:21:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1C74648A1;
 Fri, 15 Jan 2021 13:21:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 40B901800612; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/30] sdlaudio: add -audiodev sdl,out.buffer-count option
Date: Fri, 15 Jan 2021 14:21:19 +0100
Message-Id: <20210115132146.1443592-4-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Currently there is a crackling noise with SDL2 audio playback.
Commit bcf19777df: "audio/sdlaudio: Allow audio playback with
SDL2" already mentioned the crackling noise.

Add an out.buffer-count option to give users a chance to select
sane settings for glitch free audio playback. The idea was taken
from the coreaudio backend.

The in.buffer-count option will be used with one of the next
patches.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-3-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_template.h |  2 +-
 audio/audio.c          |  2 +-
 audio/audio_legacy.c   |  3 ++-
 audio/sdlaudio.c       | 11 +++++++++--
 qapi/audio.json        | 33 ++++++++++++++++++++++++++++++++-
 qemu-options.hx        |  8 +++++++-
 6 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index 8dd48ce14e9d..434df5d5e750 100644
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
diff --git a/audio/audio.c b/audio/audio.c
index b48471bb3f64..d048d262835e 100644
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
index ffdbd0bcce8c..0fe827b05735 100644
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
diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 00cd12ba66a0..431bfcfddd97 100644
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
index 072ed79def50..9cba0df8a4e9 100644
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
index 1698a0c751ff..4e02e9bd7604 100644
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
2.29.2


