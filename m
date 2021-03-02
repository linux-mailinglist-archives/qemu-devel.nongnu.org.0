Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA3532A8A5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:57:55 +0100 (CET)
Received: from localhost ([::1]:51464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9HO-0001HT-GJ
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH9FH-00084n-9Z
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:55:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH9FE-0007Ig-5q
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614707739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h5wgqQ2MKFsH6SKvQh9dI8OWHwiMyOOhm9YG0anuJPw=;
 b=UNIdYjvS5UFbLwk5XSNhRhaFEBlRaNqDNAMbjkIAnnWvD+OMZMsj1FlPyDfpWjODJHmqbd
 HAyRJVTigSU98J12ufMYaGn9heBGJ+HTy4wcbov2rdf3yz65WbdXolJwSw98jWPRwWpSNG
 ZnsRWE70vEE4QT/JYdFSoFYp9MBtidE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-UPXuV7-yNWG-Wfaxr_V1mA-1; Tue, 02 Mar 2021 12:55:36 -0500
X-MC-Unique: UPXuV7-yNWG-Wfaxr_V1mA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CBDB107ACC7;
 Tue,  2 Mar 2021 17:55:35 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-132.ams2.redhat.com
 [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52BBE62665;
 Tue,  2 Mar 2021 17:55:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] qapi, audio: respect build time conditions in audio schema
Date: Tue,  2 Mar 2021 17:55:23 +0000
Message-Id: <20210302175524.1290840-3-berrange@redhat.com>
In-Reply-To: <20210302175524.1290840-1-berrange@redhat.com>
References: <20210302175524.1290840-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the -audiodev accepts any audiodev type regardless of what is
built in to QEMU. An error only occurs later at runtime when a sound
device tries to use the audio backend.

With this change QEMU will immediately reject -audiodev args that are
not compiled into the binary. The QMP schema will also be introspectable
to identify what is compiled in.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 audio/audio.c          | 16 +++++++++++++++
 audio/audio_legacy.c   | 41 ++++++++++++++++++++++++++++++++++++++-
 audio/audio_template.h | 16 +++++++++++++++
 qapi/audio.json        | 44 ++++++++++++++++++++++++++++++++----------
 4 files changed, 106 insertions(+), 11 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 40a4bbd7ce..53434fc674 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1989,14 +1989,30 @@ void audio_create_pdos(Audiodev *dev)
         break
 
         CASE(NONE, none, );
+#ifdef CONFIG_AUDIO_ALSA
         CASE(ALSA, alsa, Alsa);
+#endif
+#ifdef CONFIG_AUDIO_COREAUDIO
         CASE(COREAUDIO, coreaudio, Coreaudio);
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
+#ifdef CONFIG_SPICE
         CASE(SPICE, spice, );
+#endif
         CASE(WAV, wav, );
 
     case AUDIODEV_DRIVER__MAX:
diff --git a/audio/audio_legacy.c b/audio/audio_legacy.c
index 0fe827b057..bb2268f2b2 100644
--- a/audio/audio_legacy.c
+++ b/audio/audio_legacy.c
@@ -93,6 +93,7 @@ static void get_fmt(const char *env, AudioFormat *dst, bool *has_dst)
 }
 
 
+#if defined(CONFIG_AUDIO_ALSA) || defined(CONFIG_AUDIO_DSOUND)
 static void get_millis_to_usecs(const char *env, uint32_t *dst, bool *has_dst)
 {
     const char *val = getenv(env);
@@ -101,15 +102,20 @@ static void get_millis_to_usecs(const char *env, uint32_t *dst, bool *has_dst)
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
@@ -119,14 +125,19 @@ static void get_frames_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
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
@@ -136,7 +147,9 @@ static void get_samples_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
         *has_dst = true;
     }
 }
+#endif
 
+#if defined(CONFIG_AUDIO_DSOUND) || defined(CONFIG_AUDIO_OSS)
 static uint32_t bytes_to_usecs(uint32_t bytes, AudiodevPerDirectionOptions *pdo)
 {
     AudioFormat fmt = pdo->has_format ? pdo->format : AUDIO_FORMAT_S16;
@@ -153,8 +166,11 @@ static void get_bytes_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
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
@@ -200,7 +216,9 @@ static void handle_alsa(Audiodev *dev)
     get_millis_to_usecs("QEMU_ALSA_THRESHOLD",
                         &aopt->threshold, &aopt->has_threshold);
 }
+#endif
 
+#ifdef CONFIG_AUDIO_COREAUDIO
 /* coreaudio */
 static void handle_coreaudio(Audiodev *dev)
 {
@@ -213,7 +231,9 @@ static void handle_coreaudio(Audiodev *dev)
             &dev->u.coreaudio.out->buffer_count,
             &dev->u.coreaudio.out->has_buffer_count);
 }
+#endif
 
+#ifdef CONFIG_AUDIO_DSOUND
 /* dsound */
 static void handle_dsound(Audiodev *dev)
 {
@@ -228,7 +248,9 @@ static void handle_dsound(Audiodev *dev)
                        &dev->u.dsound.in->has_buffer_length,
                        dev->u.dsound.in);
 }
+#endif
 
+#ifdef CONFIG_AUDIO_OSS
 /* OSS */
 static void handle_oss_per_direction(
     AudiodevOssPerDirectionOptions *opdo, const char *try_poll_env,
@@ -256,7 +278,9 @@ static void handle_oss(Audiodev *dev)
     get_bool("QEMU_OSS_EXCLUSIVE", &oopt->exclusive, &oopt->has_exclusive);
     get_int("QEMU_OSS_POLICY", &oopt->dsp_policy, &oopt->has_dsp_policy);
 }
+#endif
 
+#ifdef CONFIG_AUDIO_PA
 /* pulseaudio */
 static void handle_pa_per_direction(
     AudiodevPaPerDirectionOptions *ppdo, const char *env)
@@ -280,7 +304,9 @@ static void handle_pa(Audiodev *dev)
 
     get_str("QEMU_PA_SERVER", &dev->u.pa.server, &dev->u.pa.has_server);
 }
+#endif
 
+#ifdef CONFIG_AUDIO_SDL
 /* SDL */
 static void handle_sdl(Audiodev *dev)
 {
@@ -289,6 +315,7 @@ static void handle_sdl(Audiodev *dev)
         &dev->u.sdl.out->has_buffer_length,
         qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.out));
 }
+#endif
 
 /* wav */
 static void handle_wav(Audiodev *dev)
@@ -348,29 +375,41 @@ static AudiodevListEntry *legacy_opt(const char *drvname)
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
diff --git a/audio/audio_template.h b/audio/audio_template.h
index c6714946aa..0847b643be 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -322,23 +322,39 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
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
+#ifdef CONFIG_SPICE
     case AUDIODEV_DRIVER_SPICE:
         return dev->u.spice.TYPE;
+#endif
     case AUDIODEV_DRIVER_WAV:
         return dev->u.wav.TYPE;
 
diff --git a/qapi/audio.json b/qapi/audio.json
index d7b91230d7..9af1b8140c 100644
--- a/qapi/audio.json
+++ b/qapi/audio.json
@@ -386,8 +386,24 @@
 # Since: 4.0
 ##
 { 'enum': 'AudiodevDriver',
-  'data': [ 'none', 'alsa', 'coreaudio', 'dsound', 'jack', 'oss', 'pa',
-            'sdl', 'spice', 'wav' ] }
+  'data': [ 'none',
+            { 'name': 'alsa',
+              'if': 'defined(CONFIG_AUDIO_ALSA)' },
+            { 'name': 'coreaudio',
+              'if': 'defined(CONFIG_AUDIO_COREAUDIO)' },
+            { 'name': 'dsound',
+              'if': 'defined(CONFIG_AUDIO_DSOUND)' },
+            { 'name': 'jack',
+              'if': 'defined(CONFIG_AUDIO_JACK)' },
+            { 'name': 'oss',
+              'if': 'defined(CONFIG_AUDIO_OSS)' },
+            { 'name': 'pa',
+              'if': 'defined(CONFIG_AUDIO_PA)' },
+            { 'name': 'sdl',
+              'if': 'defined(CONFIG_AUDIO_SDL)' },
+            { 'name': 'spice',
+              'if': 'defined(CONFIG_SPICE)' },
+            'wav' ] }
 
 ##
 # @Audiodev:
@@ -410,14 +426,22 @@
   'discriminator': 'driver',
   'data': {
     'none':      'AudiodevGenericOptions',
-    'alsa':      'AudiodevAlsaOptions',
-    'coreaudio': 'AudiodevCoreaudioOptions',
-    'dsound':    'AudiodevDsoundOptions',
-    'jack':      'AudiodevJackOptions',
-    'oss':       'AudiodevOssOptions',
-    'pa':        'AudiodevPaOptions',
-    'sdl':       'AudiodevSdlOptions',
-    'spice':     'AudiodevGenericOptions',
+    'alsa':      { 'type': 'AudiodevAlsaOptions',
+                   'if': 'defined(CONFIG_AUDIO_ALSA)' },
+    'coreaudio': { 'type': 'AudiodevCoreaudioOptions',
+                   'if': 'defined(CONFIG_AUDIO_COREAUDIO)' },
+    'dsound':    { 'type': 'AudiodevDsoundOptions',
+                   'if': 'defined(CONFIG_AUDIO_DSOUND)' },
+    'jack':      { 'type': 'AudiodevJackOptions',
+                   'if': 'defined(CONFIG_AUDIO_JACK)' },
+    'oss':       { 'type': 'AudiodevOssOptions',
+                   'if': 'defined(CONFIG_AUDIO_OSS)' },
+    'pa':        { 'type': 'AudiodevPaOptions',
+                   'if': 'defined(CONFIG_AUDIO_PA)' },
+    'sdl':       { 'type': 'AudiodevSdlOptions',
+                   'if': 'defined(CONFIG_AUDIO_SDL)' },
+    'spice':     { 'type': 'AudiodevGenericOptions',
+                   'if': 'defined(CONFIG_SPICE)' },
     'wav':       'AudiodevWavOptions' } }
 
 ##
-- 
2.29.2


