Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DD764C54D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 09:51:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MUR-0003Wr-7L; Wed, 14 Dec 2022 02:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUI-0003Q2-5E
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUF-0003dQ-7F
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671004050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1/feZTs5+GMYRba9vkIZ13umGQ/sRXQWUIrd8lcce9w=;
 b=gjwRJ6lSP9Yitl0XSNLGDkpv5RLcx5FqiBCpjH11r6ghuG8tpQnh0FuIJnC397D7ZU+R/0
 Q9uLvUgmtUyeBymwDR7thI3is5ZwX78KiMvbqGo1Yp2LPVULO3nEwObdcM7l8ILRh8EWO6
 p7x3Q92p81T2/SxeFcJXoavF7DrjF7M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-uGBj5BqNNsmsrDjbBH7vUw-1; Wed, 14 Dec 2022 02:47:28 -0500
X-MC-Unique: uGBj5BqNNsmsrDjbBH7vUw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54027811E6E;
 Wed, 14 Dec 2022 07:47:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09E72C15BAD;
 Wed, 14 Dec 2022 07:47:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 60B0621E6496; Wed, 14 Dec 2022 08:47:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 07/30] qapi audio: Elide redundant has_FOO in generated C
Date: Wed, 14 Dec 2022 08:46:58 +0100
Message-Id: <20221214074721.731441-10-armbru@redhat.com>
In-Reply-To: <20221214074721.731441-1-armbru@redhat.com>
References: <20221214074721.731441-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/audio.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Additionally, helper get_str() loses its @has_dst parameter.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221104160712.3005652-8-armbru@redhat.com>
---
 audio/alsaaudio.c      |  2 +-
 audio/audio.c          |  6 ++----
 audio/audio_legacy.c   | 17 +++++++----------
 audio/ossaudio.c       |  8 +++-----
 audio/paaudio.c        | 12 ++++++------
 audio/sndioaudio.c     |  2 +-
 audio/wavaudio.c       |  2 +-
 scripts/qapi/schema.py |  1 -
 8 files changed, 21 insertions(+), 29 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 7a2a94cd42..714bfb6453 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -449,7 +449,7 @@ static int alsa_open(bool in, struct alsa_params_req *req,
     snd_pcm_hw_params_t *hw_params;
     int err;
     unsigned int freq, nchannels;
-    const char *pcm_name = apdo->has_dev ? apdo->dev : "default";
+    const char *pcm_name = apdo->dev ?: "default";
     snd_pcm_uframes_t obt_buffer_size;
     const char *typ = in ? "ADC" : "DAC";
     snd_pcm_format_t obtfmt;
diff --git a/audio/audio.c b/audio/audio.c
index 065602ce1b..d849a94a81 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -2035,15 +2035,13 @@ void audio_create_pdos(Audiodev *dev)
     switch (dev->driver) {
 #define CASE(DRIVER, driver, pdo_name)                              \
     case AUDIODEV_DRIVER_##DRIVER:                                  \
-        if (!dev->u.driver.has_in) {                                \
+        if (!dev->u.driver.in) {                                    \
             dev->u.driver.in = g_malloc0(                           \
                 sizeof(Audiodev##pdo_name##PerDirectionOptions));   \
-            dev->u.driver.has_in = true;                            \
         }                                                           \
-        if (!dev->u.driver.has_out) {                               \
+        if (!dev->u.driver.out) {                                   \
             dev->u.driver.out = g_malloc0(                          \
                 sizeof(Audiodev##pdo_name##PerDirectionOptions));   \
-            dev->u.driver.has_out = true;                           \
         }                                                           \
         break
 
diff --git a/audio/audio_legacy.c b/audio/audio_legacy.c
index 595949f52c..18a89ffffb 100644
--- a/audio/audio_legacy.c
+++ b/audio/audio_legacy.c
@@ -62,15 +62,12 @@ static void get_int(const char *env, uint32_t *dst, bool *has_dst)
     }
 }
 
-static void get_str(const char *env, char **dst, bool *has_dst)
+static void get_str(const char *env, char **dst)
 {
     const char *val = getenv(env);
     if (val) {
-        if (*has_dst) {
-            g_free(*dst);
-        }
+        g_free(*dst);
         *dst = g_strdup(val);
-        *has_dst = true;
     }
 }
 
@@ -169,7 +166,7 @@ static void handle_alsa_per_direction(
     get_bool(buf, &apdo->try_poll, &apdo->has_try_poll);
 
     strcpy(buf + len, "DEV");
-    get_str(buf, &apdo->dev, &apdo->has_dev);
+    get_str(buf, &apdo->dev);
 
     strcpy(buf + len, "SIZE_IN_USEC");
     get_bool(buf, &size_in_usecs, &dummy);
@@ -235,7 +232,7 @@ static void handle_oss_per_direction(
     const char *dev_env)
 {
     get_bool(try_poll_env, &opdo->try_poll, &opdo->has_try_poll);
-    get_str(dev_env, &opdo->dev, &opdo->has_dev);
+    get_str(dev_env, &opdo->dev);
 
     get_bytes_to_usecs("QEMU_OSS_FRAGSIZE",
                        &opdo->buffer_length, &opdo->has_buffer_length,
@@ -261,7 +258,7 @@ static void handle_oss(Audiodev *dev)
 static void handle_pa_per_direction(
     AudiodevPaPerDirectionOptions *ppdo, const char *env)
 {
-    get_str(env, &ppdo->name, &ppdo->has_name);
+    get_str(env, &ppdo->name);
 }
 
 static void handle_pa(Audiodev *dev)
@@ -278,7 +275,7 @@ static void handle_pa(Audiodev *dev)
         &dev->u.pa.out->has_buffer_length,
         qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.out));
 
-    get_str("QEMU_PA_SERVER", &dev->u.pa.server, &dev->u.pa.has_server);
+    get_str("QEMU_PA_SERVER", &dev->u.pa.server);
 }
 
 /* SDL */
@@ -299,7 +296,7 @@ static void handle_wav(Audiodev *dev)
             &dev->u.wav.out->has_format);
     get_int("QEMU_WAV_DAC_FIXED_CHANNELS",
             &dev->u.wav.out->channels, &dev->u.wav.out->has_channels);
-    get_str("QEMU_WAV_PATH", &dev->u.wav.path, &dev->u.wav.has_path);
+    get_str("QEMU_WAV_PATH", &dev->u.wav.path);
 }
 
 /* general */
diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 8e075edb70..e8d732b612 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -252,7 +252,7 @@ static int oss_open(int in, struct oss_params *req, audsettings *as,
     audio_buf_info abinfo;
     int fmt, freq, nchannels;
     int setfragment = 1;
-    const char *dspname = opdo->has_dev ? opdo->dev : "/dev/dsp";
+    const char *dspname = opdo->dev ?: "/dev/dsp";
     const char *typ = in ? "ADC" : "DAC";
 #ifdef USE_DSP_POLICY
     int policy = oopts->has_dsp_policy ? oopts->dsp_policy : 5;
@@ -745,10 +745,8 @@ static void *oss_audio_init(Audiodev *dev)
     oss_init_per_direction(oopts->in);
     oss_init_per_direction(oopts->out);
 
-    if (access(oopts->in->has_dev ? oopts->in->dev : "/dev/dsp",
-               R_OK | W_OK) < 0 ||
-        access(oopts->out->has_dev ? oopts->out->dev : "/dev/dsp",
-               R_OK | W_OK) < 0) {
+    if (access(oopts->in->dev ?: "/dev/dsp", R_OK | W_OK) < 0 ||
+        access(oopts->out->dev ?: "/dev/dsp", R_OK | W_OK) < 0) {
         return NULL;
     }
     return dev;
diff --git a/audio/paaudio.c b/audio/paaudio.c
index e91116f239..529b39daac 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -536,9 +536,9 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
 
     pa->stream = qpa_simple_new (
         c,
-        ppdo->has_stream_name ? ppdo->stream_name : g->dev->id,
+        ppdo->stream_name ?: g->dev->id,
         PA_STREAM_PLAYBACK,
-        ppdo->has_name ? ppdo->name : NULL,
+        ppdo->name,
         &ss,
         &ba,                    /* buffering attributes */
         &error
@@ -585,9 +585,9 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
 
     pa->stream = qpa_simple_new (
         c,
-        ppdo->has_stream_name ? ppdo->stream_name : g->dev->id,
+        ppdo->stream_name ?: g->dev->id,
         PA_STREAM_RECORD,
-        ppdo->has_name ? ppdo->name : NULL,
+        ppdo->name,
         &ss,
         &ba,                    /* buffering attributes */
         &error
@@ -827,7 +827,7 @@ static void *qpa_audio_init(Audiodev *dev)
 
     assert(dev->driver == AUDIODEV_DRIVER_PA);
 
-    if (!popts->has_server) {
+    if (!popts->server) {
         char pidfile[64];
         char *runtime;
         struct stat st;
@@ -850,7 +850,7 @@ static void *qpa_audio_init(Audiodev *dev)
     }
 
     g = g_new0(paaudio, 1);
-    server = popts->has_server ? popts->server : NULL;
+    server = popts->server;
 
     g->dev = dev;
 
diff --git a/audio/sndioaudio.c b/audio/sndioaudio.c
index 7c45276d36..632b0e3825 100644
--- a/audio/sndioaudio.c
+++ b/audio/sndioaudio.c
@@ -333,7 +333,7 @@ static int sndio_init(SndioVoice *self,
     unsigned int nch;
     int i, nfds;
 
-    dev_name = opts->has_dev ? opts->dev : SIO_DEVANY;
+    dev_name = opts->dev ?: SIO_DEVANY;
     latency = opts->has_latency ? opts->latency : SNDIO_LATENCY_US;
 
     /* open the device in non-blocking mode */
diff --git a/audio/wavaudio.c b/audio/wavaudio.c
index 3e1d84db83..6445a2cb90 100644
--- a/audio/wavaudio.c
+++ b/audio/wavaudio.c
@@ -78,7 +78,7 @@ static int wav_init_out(HWVoiceOut *hw, struct audsettings *as,
     Audiodev *dev = drv_opaque;
     AudiodevWavOptions *wopts = &dev->u.wav;
     struct audsettings wav_as = audiodev_to_audsettings(dev->u.wav.out);
-    const char *wav_path = wopts->has_path ? wopts->path : "qemu.wav";
+    const char *wav_path = wopts->path ?: "qemu.wav";
 
     stereo = wav_as.nchannels == 2;
     switch (wav_as.fmt) {
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index ad7634de58..8db1c2caef 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/audio.json',
             'qapi/block-core.json',
             'qapi/block-export.json',
             'qapi/block.json',
-- 
2.37.3


