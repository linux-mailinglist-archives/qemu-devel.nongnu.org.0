Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025CF67767E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:41:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJsND-0000vN-Cl; Mon, 23 Jan 2023 03:40:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pJsN9-0000sf-8F
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:40:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pJsN6-000809-Ph
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674463208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lf50fMqsdsenHOayp4duSmO+bdAcZAvBUKgVwGMHp6I=;
 b=SlbMV2HvkHjvC12QWoUis59pmRrQz4uP+wX+blSVY9gnbNobkpUlsuzRxU7uBU1YYBiKC6
 xguUHvkpGaoSlzroU8QeypoD5kwFc7bSftGQ0mQ/+iB6kd7fCfvsl2L02eRZVR93kFGTlj
 nsn04JOt47yEFpcUW4B24ajlkiPkq64=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-rm3sWbarPL6RP08gO6XG2w-1; Mon, 23 Jan 2023 03:40:04 -0500
X-MC-Unique: rm3sWbarPL6RP08gO6XG2w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5169D3806078;
 Mon, 23 Jan 2023 08:40:04 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBC06175A2;
 Mon, 23 Jan 2023 08:40:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: [PATCH v2 2/2] qapi,
 audio: Make introspection reflect build configuration more closely
Date: Mon, 23 Jan 2023 09:39:57 +0100
Message-Id: <20230123083957.20349-3-thuth@redhat.com>
In-Reply-To: <20230123083957.20349-1-thuth@redhat.com>
References: <20230123083957.20349-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel P. Berrangé <berrange@redhat.com>

Currently the -audiodev accepts any audiodev type regardless of what is
built in to QEMU. An error only occurs later at runtime when a sound
device tries to use the audio backend.

With this change QEMU will immediately reject -audiodev args that are
not compiled into the binary. The QMP schema will also be introspectable
to identify what is compiled in.

This also helps to avoid compiling code that is not required in the
binary. Note: When building the audiodevs as modules, the patch only
compiles out code for modules that we don't build at all.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
[thuth: Rebase, take sndio and dbus devices into account]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qapi/audio.json        | 44 ++++++++++++++++++++++++++++++------------
 audio/audio_template.h | 20 +++++++++++++++++++
 audio/audio.c          | 20 +++++++++++++++++++
 audio/audio_legacy.c   | 41 ++++++++++++++++++++++++++++++++++++++-
 4 files changed, 112 insertions(+), 13 deletions(-)

diff --git a/qapi/audio.json b/qapi/audio.json
index c7aafa2763..4e54c00f51 100644
--- a/qapi/audio.json
+++ b/qapi/audio.json
@@ -408,8 +408,18 @@
 # Since: 4.0
 ##
 { 'enum': 'AudiodevDriver',
-  'data': [ 'none', 'alsa', 'coreaudio', 'dbus', 'dsound', 'jack', 'oss', 'pa',
-            'sdl', 'sndio', 'spice', 'wav' ] }
+  'data': [ 'none',
+            { 'name': 'alsa', 'if': 'CONFIG_AUDIO_ALSA' },
+            { 'name': 'coreaudio', 'if': 'CONFIG_AUDIO_COREAUDIO' },
+            { 'name': 'dbus', 'if': 'CONFIG_DBUS_DISPLAY' },
+            { 'name': 'dsound', 'if': 'CONFIG_AUDIO_DSOUND' },
+            { 'name': 'jack', 'if': 'CONFIG_AUDIO_JACK' },
+            { 'name': 'oss', 'if': 'CONFIG_AUDIO_OSS' },
+            { 'name': 'pa', 'if': 'CONFIG_AUDIO_PA' },
+            { 'name': 'sdl', 'if': 'CONFIG_AUDIO_SDL' },
+            { 'name': 'sndio', 'if': 'CONFIG_AUDIO_SNDIO' },
+            { 'name': 'spice', 'if': 'CONFIG_SPICE' },
+            'wav' ] }
 
 ##
 # @Audiodev:
@@ -432,16 +442,26 @@
   'discriminator': 'driver',
   'data': {
     'none':      'AudiodevGenericOptions',
-    'alsa':      'AudiodevAlsaOptions',
-    'coreaudio': 'AudiodevCoreaudioOptions',
-    'dbus':      'AudiodevGenericOptions',
-    'dsound':    'AudiodevDsoundOptions',
-    'jack':      'AudiodevJackOptions',
-    'oss':       'AudiodevOssOptions',
-    'pa':        'AudiodevPaOptions',
-    'sdl':       'AudiodevSdlOptions',
-    'sndio':     'AudiodevSndioOptions',
-    'spice':     'AudiodevGenericOptions',
+    'alsa':      { 'type': 'AudiodevAlsaOptions',
+                   'if': 'CONFIG_AUDIO_ALSA' },
+    'coreaudio': { 'type': 'AudiodevCoreaudioOptions',
+                   'if': 'CONFIG_AUDIO_COREAUDIO' },
+    'dbus':      { 'type': 'AudiodevGenericOptions',
+                   'if': 'CONFIG_DBUS_DISPLAY' },
+    'dsound':    { 'type': 'AudiodevDsoundOptions',
+                   'if': 'CONFIG_AUDIO_DSOUND' },
+    'jack':      { 'type': 'AudiodevJackOptions',
+                   'if': 'CONFIG_AUDIO_JACK' },
+    'oss':       { 'type': 'AudiodevOssOptions',
+                   'if': 'CONFIG_AUDIO_OSS' },
+    'pa':        { 'type': 'AudiodevPaOptions',
+                   'if': 'CONFIG_AUDIO_PA' },
+    'sdl':       { 'type': 'AudiodevSdlOptions',
+                   'if': 'CONFIG_AUDIO_SDL' },
+    'sndio':     { 'type': 'AudiodevSndioOptions',
+                   'if': 'CONFIG_AUDIO_SNDIO' },
+    'spice':     { 'type': 'AudiodevGenericOptions',
+                   'if': 'CONFIG_SPICE' },
     'wav':       'AudiodevWavOptions' } }
 
 ##
diff --git a/audio/audio_template.h b/audio/audio_template.h
index 720a32e57e..42b4712acb 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -326,27 +326,47 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
     switch (dev->driver) {
     case AUDIODEV_DRIVER_NONE:
         return dev->u.none.TYPE;
+#ifdef CONFIG_AUDIO_ALSA
     case AUDIODEV_DRIVER_ALSA:
         return qapi_AudiodevAlsaPerDirectionOptions_base(dev->u.alsa.TYPE);
+#endif
+#ifdef CONFIG_AUDIO_COREAUDIO
     case AUDIODEV_DRIVER_COREAUDIO:
         return qapi_AudiodevCoreaudioPerDirectionOptions_base(
             dev->u.coreaudio.TYPE);
+#endif
+#ifdef CONFIG_DBUS_DISPLAY
     case AUDIODEV_DRIVER_DBUS:
         return dev->u.dbus.TYPE;
+#endif
+#ifdef CONFIG_AUDIO_DSOUND
     case AUDIODEV_DRIVER_DSOUND:
         return dev->u.dsound.TYPE;
+#endif
+#ifdef CONFIG_AUDIO_JACK
     case AUDIODEV_DRIVER_JACK:
         return qapi_AudiodevJackPerDirectionOptions_base(dev->u.jack.TYPE);
+#endif
+#ifdef CONFIG_AUDIO_OSS
     case AUDIODEV_DRIVER_OSS:
         return qapi_AudiodevOssPerDirectionOptions_base(dev->u.oss.TYPE);
+#endif
+#ifdef CONFIG_AUDIO_PA
     case AUDIODEV_DRIVER_PA:
         return qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE);
+#endif
+#ifdef CONFIG_AUDIO_SDL
     case AUDIODEV_DRIVER_SDL:
         return qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.TYPE);
+#endif
+#ifdef CONFIG_AUDIO_SNDIO
     case AUDIODEV_DRIVER_SNDIO:
         return dev->u.sndio.TYPE;
+#endif
+#ifdef CONFIG_SPICE
     case AUDIODEV_DRIVER_SPICE:
         return dev->u.spice.TYPE;
+#endif
     case AUDIODEV_DRIVER_WAV:
         return dev->u.wav.TYPE;
 
diff --git a/audio/audio.c b/audio/audio.c
index 6f270c07b7..4290309d18 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -2048,16 +2048,36 @@ void audio_create_pdos(Audiodev *dev)
         break
 
         CASE(NONE, none, );
+#ifdef CONFIG_AUDIO_ALSA
         CASE(ALSA, alsa, Alsa);
+#endif
+#ifdef CONFIG_AUDIO_COREAUDIO
         CASE(COREAUDIO, coreaudio, Coreaudio);
+#endif
+#ifdef CONFIG_DBUS_DISPLAY
         CASE(DBUS, dbus, );
+#endif
+#ifdef CONFIG_AUDIO_DSOUND
         CASE(DSOUND, dsound, );
+#endif
+#ifdef CONFIG_AUDIO_JACK
         CASE(JACK, jack, Jack);
+#endif
+#ifdef CONFIG_AUDIO_OSS
         CASE(OSS, oss, Oss);
+#endif
+#ifdef CONFIG_AUDIO_PA
         CASE(PA, pa, Pa);
+#endif
+#ifdef CONFIG_AUDIO_SDL
         CASE(SDL, sdl, Sdl);
+#endif
+#ifdef CONFIG_AUDIO_SNDIO
         CASE(SNDIO, sndio, );
+#endif
+#ifdef CONFIG_SPICE
         CASE(SPICE, spice, );
+#endif
         CASE(WAV, wav, );
 
     case AUDIODEV_DRIVER__MAX:
diff --git a/audio/audio_legacy.c b/audio/audio_legacy.c
index 18a89ffffb..b848001ff7 100644
--- a/audio/audio_legacy.c
+++ b/audio/audio_legacy.c
@@ -90,6 +90,7 @@ static void get_fmt(const char *env, AudioFormat *dst, bool *has_dst)
 }
 
 
+#if defined(CONFIG_AUDIO_ALSA) || defined(CONFIG_AUDIO_DSOUND)
 static void get_millis_to_usecs(const char *env, uint32_t *dst, bool *has_dst)
 {
     const char *val = getenv(env);
@@ -98,15 +99,20 @@ static void get_millis_to_usecs(const char *env, uint32_t *dst, bool *has_dst)
         *has_dst = true;
     }
 }
+#endif
 
+#if defined(CONFIG_AUDIO_ALSA) || defined(CONFIG_AUDIO_COREAUDIO) || \
+    defined(CONFIG_AUDIO_PA) || defined(CONFIG_AUDIO_SDL) || \
+    defined(CONFIG_AUDIO_DSOUND) || defined(CONFIG_AUDIO_OSS)
 static uint32_t frames_to_usecs(uint32_t frames,
                                 AudiodevPerDirectionOptions *pdo)
 {
     uint32_t freq = pdo->has_frequency ? pdo->frequency : 44100;
     return (frames * 1000000 + freq / 2) / freq;
 }
+#endif
 
-
+#ifdef CONFIG_AUDIO_COREAUDIO
 static void get_frames_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
                                 AudiodevPerDirectionOptions *pdo)
 {
@@ -116,14 +122,19 @@ static void get_frames_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
         *has_dst = true;
     }
 }
+#endif
 
+#if defined(CONFIG_AUDIO_PA) || defined(CONFIG_AUDIO_SDL) || \
+    defined(CONFIG_AUDIO_DSOUND) || defined(CONFIG_AUDIO_OSS)
 static uint32_t samples_to_usecs(uint32_t samples,
                                  AudiodevPerDirectionOptions *pdo)
 {
     uint32_t channels = pdo->has_channels ? pdo->channels : 2;
     return frames_to_usecs(samples / channels, pdo);
 }
+#endif
 
+#if defined(CONFIG_AUDIO_PA) || defined(CONFIG_AUDIO_SDL)
 static void get_samples_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
                                  AudiodevPerDirectionOptions *pdo)
 {
@@ -133,7 +144,9 @@ static void get_samples_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
         *has_dst = true;
     }
 }
+#endif
 
+#if defined(CONFIG_AUDIO_DSOUND) || defined(CONFIG_AUDIO_OSS)
 static uint32_t bytes_to_usecs(uint32_t bytes, AudiodevPerDirectionOptions *pdo)
 {
     AudioFormat fmt = pdo->has_format ? pdo->format : AUDIO_FORMAT_S16;
@@ -150,8 +163,11 @@ static void get_bytes_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
         *has_dst = true;
     }
 }
+#endif
 
 /* backend specific functions */
+
+#ifdef CONFIG_AUDIO_ALSA
 /* ALSA */
 static void handle_alsa_per_direction(
     AudiodevAlsaPerDirectionOptions *apdo, const char *prefix)
@@ -197,7 +213,9 @@ static void handle_alsa(Audiodev *dev)
     get_millis_to_usecs("QEMU_ALSA_THRESHOLD",
                         &aopt->threshold, &aopt->has_threshold);
 }
+#endif
 
+#ifdef CONFIG_AUDIO_COREAUDIO
 /* coreaudio */
 static void handle_coreaudio(Audiodev *dev)
 {
@@ -210,7 +228,9 @@ static void handle_coreaudio(Audiodev *dev)
             &dev->u.coreaudio.out->buffer_count,
             &dev->u.coreaudio.out->has_buffer_count);
 }
+#endif
 
+#ifdef CONFIG_AUDIO_DSOUND
 /* dsound */
 static void handle_dsound(Audiodev *dev)
 {
@@ -225,7 +245,9 @@ static void handle_dsound(Audiodev *dev)
                        &dev->u.dsound.in->has_buffer_length,
                        dev->u.dsound.in);
 }
+#endif
 
+#ifdef CONFIG_AUDIO_OSS
 /* OSS */
 static void handle_oss_per_direction(
     AudiodevOssPerDirectionOptions *opdo, const char *try_poll_env,
@@ -253,7 +275,9 @@ static void handle_oss(Audiodev *dev)
     get_bool("QEMU_OSS_EXCLUSIVE", &oopt->exclusive, &oopt->has_exclusive);
     get_int("QEMU_OSS_POLICY", &oopt->dsp_policy, &oopt->has_dsp_policy);
 }
+#endif
 
+#ifdef CONFIG_AUDIO_PA
 /* pulseaudio */
 static void handle_pa_per_direction(
     AudiodevPaPerDirectionOptions *ppdo, const char *env)
@@ -277,7 +301,9 @@ static void handle_pa(Audiodev *dev)
 
     get_str("QEMU_PA_SERVER", &dev->u.pa.server);
 }
+#endif
 
+#ifdef CONFIG_AUDIO_SDL
 /* SDL */
 static void handle_sdl(Audiodev *dev)
 {
@@ -286,6 +312,7 @@ static void handle_sdl(Audiodev *dev)
         &dev->u.sdl.out->has_buffer_length,
         qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.out));
 }
+#endif
 
 /* wav */
 static void handle_wav(Audiodev *dev)
@@ -345,29 +372,41 @@ static AudiodevListEntry *legacy_opt(const char *drvname)
     }
 
     switch (e->dev->driver) {
+#ifdef CONFIG_AUDIO_ALSA
     case AUDIODEV_DRIVER_ALSA:
         handle_alsa(e->dev);
         break;
+#endif
 
+#ifdef CONFIG_AUDIO_COREAUDIO
     case AUDIODEV_DRIVER_COREAUDIO:
         handle_coreaudio(e->dev);
         break;
+#endif
 
+#ifdef CONFIG_AUDIO_DSOUND
     case AUDIODEV_DRIVER_DSOUND:
         handle_dsound(e->dev);
         break;
+#endif
 
+#ifdef CONFIG_AUDIO_OSS
     case AUDIODEV_DRIVER_OSS:
         handle_oss(e->dev);
         break;
+#endif
 
+#ifdef CONFIG_AUDIO_PA
     case AUDIODEV_DRIVER_PA:
         handle_pa(e->dev);
         break;
+#endif
 
+#ifdef CONFIG_AUDIO_SDL
     case AUDIODEV_DRIVER_SDL:
         handle_sdl(e->dev);
         break;
+#endif
 
     case AUDIODEV_DRIVER_WAV:
         handle_wav(e->dev);
-- 
2.31.1


