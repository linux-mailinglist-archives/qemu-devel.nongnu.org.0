Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905DF669E2B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:32:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMoo-0006nR-H2; Fri, 13 Jan 2023 11:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGMom-0006hC-AK
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGMoj-0005mX-C3
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673626927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kbrmk52uqo30F4UpTtTeImHrBkxUwIvXkcoxIAqgaes=;
 b=GV1HybMd4DgMOlUEHqnrTiqpT9XdwQ8LutdxFlbiQZd8S0BKGIAsviXYRXSAazpmLMQM4L
 5KkyE4ka5gv03M7hgMHNzcrOQL8OnAIlvejXGwqlai+pD8qcSThqKw6iOXdrxAtky4ynGI
 1b7msDhkfLb687xmyqZ9gmBgLY2hOdo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-G5n2thAYPT6saHtTHQbelQ-1; Fri, 13 Jan 2023 11:22:06 -0500
X-MC-Unique: G5n2thAYPT6saHtTHQbelQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7EBD29324A4;
 Fri, 13 Jan 2023 16:22:05 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4214640C2009;
 Fri, 13 Jan 2023 16:22:05 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 9/9] audio: remove support for QEMU_AUDIO_ env variables
Date: Fri, 13 Jan 2023 11:22:00 -0500
Message-Id: <20230113162200.3010804-10-berrange@redhat.com>
In-Reply-To: <20230113162200.3010804-1-berrange@redhat.com>
References: <20230113162200.3010804-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

All user created devices and the builtin pcspk can be given
a audiodev property. A few devices using audiodevs though
cannot be configured directly as they are built-in devices
created programmatically by the machine type.

To enable those to continue to be used we leave in the
logic that picks the first audiodev if none is set
explicitly. Ideally this will be removed once there is
a way to configure all built-in devices.

Even for devices which can be configured explicitly,
though, if the 'audiodev' property is mandated to be
set to a valid ID at time of realize(), it will break
several of our test suites which expect to be able to
instantiate any device without setting any properties.

So as a final fallback, we have logic that creates an
audiodev with the 'none' backend type, which will be used
in no -audiodev devices are present at all.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 audio/audio.c                   |  26 +-
 audio/audio.h                   |   1 -
 audio/audio_legacy.c            | 552 --------------------------------
 audio/meson.build               |   1 -
 docs/about/deprecated.rst       |   8 -
 docs/about/removed-features.rst |   8 +
 softmmu/vl.c                    |   4 -
 tests/qtest/libqtest.c          |   3 -
 8 files changed, 14 insertions(+), 589 deletions(-)
 delete mode 100644 audio/audio_legacy.c

diff --git a/audio/audio.c b/audio/audio.c
index 64b75cdf94..f70075c7e4 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -108,8 +108,6 @@ const struct mixeng_volume nominal_volume = {
 #endif
 };
 
-static bool legacy_config = true;
-
 int audio_bug (const char *funcname, int cond)
 {
     if (cond) {
@@ -1684,7 +1682,7 @@ static AudiodevListEntry *audiodev_find(
  * if we have dev, this function was called because of an -audiodev argument =>
  *   initialize a new state with it
  * if dev == NULL => legacy implicit initialization, return the already created
- *   state or create a new one
+ *   state or create a new no-op one.
  */
 static AudioState *audio_init(Audiodev *dev, const char *name)
 {
@@ -1716,27 +1714,15 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
 
     if (dev) {
         /* -audiodev option */
-        legacy_config = false;
         drvname = AudiodevDriver_str(dev->driver);
     } else if (!QTAILQ_EMPTY(&audio_states)) {
-        if (!legacy_config) {
-            dolog("Device %s: audiodev default parameter is deprecated, please "
-                  "specify audiodev=%s\n", name,
-                  QTAILQ_FIRST(&audio_states)->dev->id);
-        }
         return QTAILQ_FIRST(&audio_states);
     } else {
-        /* legacy implicit initialization */
-        head = audio_handle_legacy_opts();
-        /*
-         * In case of legacy initialization, all Audiodevs in the list will have
-         * the same configuration (except the driver), so it doesn't matter which
-         * one we chose.  We need an Audiodev to set up AudioState before we can
-         * init a driver.  Also note that dev at this point is still in the
-         * list.
-         */
-        dev = QSIMPLEQ_FIRST(&head)->dev;
-        audio_validate_opts(dev, &error_abort);
+        dev = g_new0(Audiodev, 1);
+        dev->id = g_strdup("none");
+        dev->driver = AUDIODEV_DRIVER_NONE;
+
+        audio_create_pdos(dev);
     }
 
     s = g_new0(AudioState, 1);
diff --git a/audio/audio.h b/audio/audio.h
index 8ee0e2159a..9f7ad056da 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -169,7 +169,6 @@ void audio_define(Audiodev *audio);
 void audio_parse_option(const char *opt);
 bool audio_init_audiodevs(void);
 void audio_help(void);
-void audio_legacy_help(void);
 
 AudioState *audio_state_by_name(const char *name);
 const char *audio_get_id(QEMUSoundCard *card);
diff --git a/audio/audio_legacy.c b/audio/audio_legacy.c
deleted file mode 100644
index 18a89ffffb..0000000000
--- a/audio/audio_legacy.c
+++ /dev/null
@@ -1,552 +0,0 @@
-/*
- * QEMU Audio subsystem: legacy configuration handling
- *
- * Copyright (c) 2015-2019 Zoltán Kővágó <DirtY.iCE.hu@gmail.com>
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- */
-#include "qemu/osdep.h"
-#include "audio.h"
-#include "audio_int.h"
-#include "qemu/cutils.h"
-#include "qemu/timer.h"
-#include "qapi/error.h"
-#include "qapi/qapi-visit-audio.h"
-#include "qapi/visitor-impl.h"
-
-#define AUDIO_CAP "audio-legacy"
-#include "audio_int.h"
-
-static uint32_t toui32(const char *str)
-{
-    unsigned long long ret;
-    if (parse_uint_full(str, &ret, 10) || ret > UINT32_MAX) {
-        dolog("Invalid integer value `%s'\n", str);
-        exit(1);
-    }
-    return ret;
-}
-
-/* helper functions to convert env variables */
-static void get_bool(const char *env, bool *dst, bool *has_dst)
-{
-    const char *val = getenv(env);
-    if (val) {
-        *dst = toui32(val) != 0;
-        *has_dst = true;
-    }
-}
-
-static void get_int(const char *env, uint32_t *dst, bool *has_dst)
-{
-    const char *val = getenv(env);
-    if (val) {
-        *dst = toui32(val);
-        *has_dst = true;
-    }
-}
-
-static void get_str(const char *env, char **dst)
-{
-    const char *val = getenv(env);
-    if (val) {
-        g_free(*dst);
-        *dst = g_strdup(val);
-    }
-}
-
-static void get_fmt(const char *env, AudioFormat *dst, bool *has_dst)
-{
-    const char *val = getenv(env);
-    if (val) {
-        size_t i;
-        for (i = 0; AudioFormat_lookup.size; ++i) {
-            if (strcasecmp(val, AudioFormat_lookup.array[i]) == 0) {
-                *dst = i;
-                *has_dst = true;
-                return;
-            }
-        }
-
-        dolog("Invalid audio format `%s'\n", val);
-        exit(1);
-    }
-}
-
-
-static void get_millis_to_usecs(const char *env, uint32_t *dst, bool *has_dst)
-{
-    const char *val = getenv(env);
-    if (val) {
-        *dst = toui32(val) * 1000;
-        *has_dst = true;
-    }
-}
-
-static uint32_t frames_to_usecs(uint32_t frames,
-                                AudiodevPerDirectionOptions *pdo)
-{
-    uint32_t freq = pdo->has_frequency ? pdo->frequency : 44100;
-    return (frames * 1000000 + freq / 2) / freq;
-}
-
-
-static void get_frames_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
-                                AudiodevPerDirectionOptions *pdo)
-{
-    const char *val = getenv(env);
-    if (val) {
-        *dst = frames_to_usecs(toui32(val), pdo);
-        *has_dst = true;
-    }
-}
-
-static uint32_t samples_to_usecs(uint32_t samples,
-                                 AudiodevPerDirectionOptions *pdo)
-{
-    uint32_t channels = pdo->has_channels ? pdo->channels : 2;
-    return frames_to_usecs(samples / channels, pdo);
-}
-
-static void get_samples_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
-                                 AudiodevPerDirectionOptions *pdo)
-{
-    const char *val = getenv(env);
-    if (val) {
-        *dst = samples_to_usecs(toui32(val), pdo);
-        *has_dst = true;
-    }
-}
-
-static uint32_t bytes_to_usecs(uint32_t bytes, AudiodevPerDirectionOptions *pdo)
-{
-    AudioFormat fmt = pdo->has_format ? pdo->format : AUDIO_FORMAT_S16;
-    uint32_t bytes_per_sample = audioformat_bytes_per_sample(fmt);
-    return samples_to_usecs(bytes / bytes_per_sample, pdo);
-}
-
-static void get_bytes_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
-                               AudiodevPerDirectionOptions *pdo)
-{
-    const char *val = getenv(env);
-    if (val) {
-        *dst = bytes_to_usecs(toui32(val), pdo);
-        *has_dst = true;
-    }
-}
-
-/* backend specific functions */
-/* ALSA */
-static void handle_alsa_per_direction(
-    AudiodevAlsaPerDirectionOptions *apdo, const char *prefix)
-{
-    char buf[64];
-    size_t len = strlen(prefix);
-    bool size_in_usecs = false;
-    bool dummy;
-
-    memcpy(buf, prefix, len);
-    strcpy(buf + len, "TRY_POLL");
-    get_bool(buf, &apdo->try_poll, &apdo->has_try_poll);
-
-    strcpy(buf + len, "DEV");
-    get_str(buf, &apdo->dev);
-
-    strcpy(buf + len, "SIZE_IN_USEC");
-    get_bool(buf, &size_in_usecs, &dummy);
-
-    strcpy(buf + len, "PERIOD_SIZE");
-    get_int(buf, &apdo->period_length, &apdo->has_period_length);
-    if (apdo->has_period_length && !size_in_usecs) {
-        apdo->period_length = frames_to_usecs(
-            apdo->period_length,
-            qapi_AudiodevAlsaPerDirectionOptions_base(apdo));
-    }
-
-    strcpy(buf + len, "BUFFER_SIZE");
-    get_int(buf, &apdo->buffer_length, &apdo->has_buffer_length);
-    if (apdo->has_buffer_length && !size_in_usecs) {
-        apdo->buffer_length = frames_to_usecs(
-            apdo->buffer_length,
-            qapi_AudiodevAlsaPerDirectionOptions_base(apdo));
-    }
-}
-
-static void handle_alsa(Audiodev *dev)
-{
-    AudiodevAlsaOptions *aopt = &dev->u.alsa;
-    handle_alsa_per_direction(aopt->in, "QEMU_ALSA_ADC_");
-    handle_alsa_per_direction(aopt->out, "QEMU_ALSA_DAC_");
-
-    get_millis_to_usecs("QEMU_ALSA_THRESHOLD",
-                        &aopt->threshold, &aopt->has_threshold);
-}
-
-/* coreaudio */
-static void handle_coreaudio(Audiodev *dev)
-{
-    get_frames_to_usecs(
-        "QEMU_COREAUDIO_BUFFER_SIZE",
-        &dev->u.coreaudio.out->buffer_length,
-        &dev->u.coreaudio.out->has_buffer_length,
-        qapi_AudiodevCoreaudioPerDirectionOptions_base(dev->u.coreaudio.out));
-    get_int("QEMU_COREAUDIO_BUFFER_COUNT",
-            &dev->u.coreaudio.out->buffer_count,
-            &dev->u.coreaudio.out->has_buffer_count);
-}
-
-/* dsound */
-static void handle_dsound(Audiodev *dev)
-{
-    get_millis_to_usecs("QEMU_DSOUND_LATENCY_MILLIS",
-                        &dev->u.dsound.latency, &dev->u.dsound.has_latency);
-    get_bytes_to_usecs("QEMU_DSOUND_BUFSIZE_OUT",
-                       &dev->u.dsound.out->buffer_length,
-                       &dev->u.dsound.out->has_buffer_length,
-                       dev->u.dsound.out);
-    get_bytes_to_usecs("QEMU_DSOUND_BUFSIZE_IN",
-                       &dev->u.dsound.in->buffer_length,
-                       &dev->u.dsound.in->has_buffer_length,
-                       dev->u.dsound.in);
-}
-
-/* OSS */
-static void handle_oss_per_direction(
-    AudiodevOssPerDirectionOptions *opdo, const char *try_poll_env,
-    const char *dev_env)
-{
-    get_bool(try_poll_env, &opdo->try_poll, &opdo->has_try_poll);
-    get_str(dev_env, &opdo->dev);
-
-    get_bytes_to_usecs("QEMU_OSS_FRAGSIZE",
-                       &opdo->buffer_length, &opdo->has_buffer_length,
-                       qapi_AudiodevOssPerDirectionOptions_base(opdo));
-    get_int("QEMU_OSS_NFRAGS", &opdo->buffer_count,
-            &opdo->has_buffer_count);
-}
-
-static void handle_oss(Audiodev *dev)
-{
-    AudiodevOssOptions *oopt = &dev->u.oss;
-    handle_oss_per_direction(oopt->in, "QEMU_AUDIO_ADC_TRY_POLL",
-                             "QEMU_OSS_ADC_DEV");
-    handle_oss_per_direction(oopt->out, "QEMU_AUDIO_DAC_TRY_POLL",
-                             "QEMU_OSS_DAC_DEV");
-
-    get_bool("QEMU_OSS_MMAP", &oopt->try_mmap, &oopt->has_try_mmap);
-    get_bool("QEMU_OSS_EXCLUSIVE", &oopt->exclusive, &oopt->has_exclusive);
-    get_int("QEMU_OSS_POLICY", &oopt->dsp_policy, &oopt->has_dsp_policy);
-}
-
-/* pulseaudio */
-static void handle_pa_per_direction(
-    AudiodevPaPerDirectionOptions *ppdo, const char *env)
-{
-    get_str(env, &ppdo->name);
-}
-
-static void handle_pa(Audiodev *dev)
-{
-    handle_pa_per_direction(dev->u.pa.in, "QEMU_PA_SOURCE");
-    handle_pa_per_direction(dev->u.pa.out, "QEMU_PA_SINK");
-
-    get_samples_to_usecs(
-        "QEMU_PA_SAMPLES", &dev->u.pa.in->buffer_length,
-        &dev->u.pa.in->has_buffer_length,
-        qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.in));
-    get_samples_to_usecs(
-        "QEMU_PA_SAMPLES", &dev->u.pa.out->buffer_length,
-        &dev->u.pa.out->has_buffer_length,
-        qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.out));
-
-    get_str("QEMU_PA_SERVER", &dev->u.pa.server);
-}
-
-/* SDL */
-static void handle_sdl(Audiodev *dev)
-{
-    /* SDL is output only */
-    get_samples_to_usecs("QEMU_SDL_SAMPLES", &dev->u.sdl.out->buffer_length,
-        &dev->u.sdl.out->has_buffer_length,
-        qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.out));
-}
-
-/* wav */
-static void handle_wav(Audiodev *dev)
-{
-    get_int("QEMU_WAV_FREQUENCY",
-            &dev->u.wav.out->frequency, &dev->u.wav.out->has_frequency);
-    get_fmt("QEMU_WAV_FORMAT", &dev->u.wav.out->format,
-            &dev->u.wav.out->has_format);
-    get_int("QEMU_WAV_DAC_FIXED_CHANNELS",
-            &dev->u.wav.out->channels, &dev->u.wav.out->has_channels);
-    get_str("QEMU_WAV_PATH", &dev->u.wav.path);
-}
-
-/* general */
-static void handle_per_direction(
-    AudiodevPerDirectionOptions *pdo, const char *prefix)
-{
-    char buf[64];
-    size_t len = strlen(prefix);
-
-    memcpy(buf, prefix, len);
-    strcpy(buf + len, "FIXED_SETTINGS");
-    get_bool(buf, &pdo->fixed_settings, &pdo->has_fixed_settings);
-
-    strcpy(buf + len, "FIXED_FREQ");
-    get_int(buf, &pdo->frequency, &pdo->has_frequency);
-
-    strcpy(buf + len, "FIXED_FMT");
-    get_fmt(buf, &pdo->format, &pdo->has_format);
-
-    strcpy(buf + len, "FIXED_CHANNELS");
-    get_int(buf, &pdo->channels, &pdo->has_channels);
-
-    strcpy(buf + len, "VOICES");
-    get_int(buf, &pdo->voices, &pdo->has_voices);
-}
-
-static AudiodevListEntry *legacy_opt(const char *drvname)
-{
-    AudiodevListEntry *e = g_new0(AudiodevListEntry, 1);
-    e->dev = g_new0(Audiodev, 1);
-    e->dev->id = g_strdup(drvname);
-    e->dev->driver = qapi_enum_parse(
-        &AudiodevDriver_lookup, drvname, -1, &error_abort);
-
-    audio_create_pdos(e->dev);
-
-    handle_per_direction(audio_get_pdo_in(e->dev), "QEMU_AUDIO_ADC_");
-    handle_per_direction(audio_get_pdo_out(e->dev), "QEMU_AUDIO_DAC_");
-
-    /* Original description: Timer period in HZ (0 - use lowest possible) */
-    get_int("QEMU_AUDIO_TIMER_PERIOD",
-            &e->dev->timer_period, &e->dev->has_timer_period);
-    if (e->dev->has_timer_period && e->dev->timer_period) {
-        e->dev->timer_period = NANOSECONDS_PER_SECOND / 1000 /
-                               e->dev->timer_period;
-    }
-
-    switch (e->dev->driver) {
-    case AUDIODEV_DRIVER_ALSA:
-        handle_alsa(e->dev);
-        break;
-
-    case AUDIODEV_DRIVER_COREAUDIO:
-        handle_coreaudio(e->dev);
-        break;
-
-    case AUDIODEV_DRIVER_DSOUND:
-        handle_dsound(e->dev);
-        break;
-
-    case AUDIODEV_DRIVER_OSS:
-        handle_oss(e->dev);
-        break;
-
-    case AUDIODEV_DRIVER_PA:
-        handle_pa(e->dev);
-        break;
-
-    case AUDIODEV_DRIVER_SDL:
-        handle_sdl(e->dev);
-        break;
-
-    case AUDIODEV_DRIVER_WAV:
-        handle_wav(e->dev);
-        break;
-
-    default:
-        break;
-    }
-
-    return e;
-}
-
-AudiodevListHead audio_handle_legacy_opts(void)
-{
-    const char *drvname = getenv("QEMU_AUDIO_DRV");
-    AudiodevListHead head = QSIMPLEQ_HEAD_INITIALIZER(head);
-
-    if (drvname) {
-        AudiodevListEntry *e;
-        audio_driver *driver = audio_driver_lookup(drvname);
-        if (!driver) {
-            dolog("Unknown audio driver `%s'\n", drvname);
-            exit(1);
-        }
-        e = legacy_opt(drvname);
-        QSIMPLEQ_INSERT_TAIL(&head, e, next);
-    } else {
-        for (int i = 0; audio_prio_list[i]; i++) {
-            audio_driver *driver = audio_driver_lookup(audio_prio_list[i]);
-            if (driver && driver->can_be_default) {
-                AudiodevListEntry *e = legacy_opt(driver->name);
-                QSIMPLEQ_INSERT_TAIL(&head, e, next);
-            }
-        }
-        if (QSIMPLEQ_EMPTY(&head)) {
-            dolog("Internal error: no default audio driver available\n");
-            exit(1);
-        }
-    }
-
-    return head;
-}
-
-/* visitor to print -audiodev option */
-typedef struct {
-    Visitor visitor;
-
-    bool comma;
-    GList *path;
-} LegacyPrintVisitor;
-
-static bool lv_start_struct(Visitor *v, const char *name, void **obj,
-                            size_t size, Error **errp)
-{
-    LegacyPrintVisitor *lv = (LegacyPrintVisitor *) v;
-    lv->path = g_list_append(lv->path, g_strdup(name));
-    return true;
-}
-
-static void lv_end_struct(Visitor *v, void **obj)
-{
-    LegacyPrintVisitor *lv = (LegacyPrintVisitor *) v;
-    lv->path = g_list_delete_link(lv->path, g_list_last(lv->path));
-}
-
-static void lv_print_key(Visitor *v, const char *name)
-{
-    GList *e;
-    LegacyPrintVisitor *lv = (LegacyPrintVisitor *) v;
-    if (lv->comma) {
-        putchar(',');
-    } else {
-        lv->comma = true;
-    }
-
-    for (e = lv->path; e; e = e->next) {
-        if (e->data) {
-            printf("%s.", (const char *) e->data);
-        }
-    }
-
-    printf("%s=", name);
-}
-
-static bool lv_type_int64(Visitor *v, const char *name, int64_t *obj,
-                          Error **errp)
-{
-    lv_print_key(v, name);
-    printf("%" PRIi64, *obj);
-    return true;
-}
-
-static bool lv_type_uint64(Visitor *v, const char *name, uint64_t *obj,
-                           Error **errp)
-{
-    lv_print_key(v, name);
-    printf("%" PRIu64, *obj);
-    return true;
-}
-
-static bool lv_type_bool(Visitor *v, const char *name, bool *obj, Error **errp)
-{
-    lv_print_key(v, name);
-    printf("%s", *obj ? "on" : "off");
-    return true;
-}
-
-static bool lv_type_str(Visitor *v, const char *name, char **obj, Error **errp)
-{
-    const char *str = *obj;
-    lv_print_key(v, name);
-
-    while (*str) {
-        if (*str == ',') {
-            putchar(',');
-        }
-        putchar(*str++);
-    }
-    return true;
-}
-
-static void lv_complete(Visitor *v, void *opaque)
-{
-    LegacyPrintVisitor *lv = (LegacyPrintVisitor *) v;
-    assert(lv->path == NULL);
-}
-
-static void lv_free(Visitor *v)
-{
-    LegacyPrintVisitor *lv = (LegacyPrintVisitor *) v;
-
-    g_list_free_full(lv->path, g_free);
-    g_free(lv);
-}
-
-static Visitor *legacy_visitor_new(void)
-{
-    LegacyPrintVisitor *lv = g_new0(LegacyPrintVisitor, 1);
-
-    lv->visitor.start_struct = lv_start_struct;
-    lv->visitor.end_struct = lv_end_struct;
-    /* lists not supported */
-    lv->visitor.type_int64 = lv_type_int64;
-    lv->visitor.type_uint64 = lv_type_uint64;
-    lv->visitor.type_bool = lv_type_bool;
-    lv->visitor.type_str = lv_type_str;
-
-    lv->visitor.type = VISITOR_OUTPUT;
-    lv->visitor.complete = lv_complete;
-    lv->visitor.free = lv_free;
-
-    return &lv->visitor;
-}
-
-void audio_legacy_help(void)
-{
-    AudiodevListHead head;
-    AudiodevListEntry *e;
-
-    printf("Environment variable based configuration deprecated.\n");
-    printf("Please use the new -audiodev option.\n");
-
-    head = audio_handle_legacy_opts();
-    printf("\nEquivalent -audiodev to your current environment variables:\n");
-    if (!getenv("QEMU_AUDIO_DRV")) {
-        printf("(Since you didn't specify QEMU_AUDIO_DRV, I'll list all "
-               "possibilities)\n");
-    }
-
-    QSIMPLEQ_FOREACH(e, &head, next) {
-        Visitor *v;
-        Audiodev *dev = e->dev;
-        printf("-audiodev ");
-
-        v = legacy_visitor_new();
-        visit_type_Audiodev(v, NULL, &dev, &error_abort);
-        visit_free(v);
-
-        printf("\n");
-    }
-    audio_free_audiodev_list(&head);
-}
diff --git a/audio/meson.build b/audio/meson.build
index 34aed78342..95cacc20db 100644
--- a/audio/meson.build
+++ b/audio/meson.build
@@ -1,6 +1,5 @@
 softmmu_ss.add([spice_headers, files('audio.c')])
 softmmu_ss.add(files(
-  'audio_legacy.c',
   'mixeng.c',
   'noaudio.c',
   'wavaudio.c',
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 09269f55e6..f118105652 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -23,14 +23,6 @@ deprecated.
 System emulator command line arguments
 --------------------------------------
 
-``QEMU_AUDIO_`` environment variables and ``-audio-help`` (since 4.0)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The ``-audiodev`` argument is now the preferred way to specify audio
-backend settings instead of environment variables.  To ease migration to
-the new format, the ``-audiodev-help`` option can be used to convert
-the current values of the environment variables to ``-audiodev`` options.
-
 Creating sound card devices without ``audiodev=`` property (since 4.2)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 8a8e0faff0..ffdd4a6d5d 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -428,6 +428,14 @@ Supporting audio transfer over vnc without ``audiodev=`` property (removed in 8.
 When using vnc, you should specify an ``audiodev=`` property if you
 intend to allow clients to request audio transfer through the VNC protocol.
 
+``QEMU_AUDIO_`` environment variables and ``-audio-help`` (rwemoved in 8.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``-audiodev`` argument is now the preferred way to specify audio
+backend settings instead of environment variables.  To ease migration to
+the new format, the ``-audiodev-help`` option can be used to convert
+the current values of the environment variables to ``-audiodev`` options.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 9bd0e52d01..f7759ce367 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2852,10 +2852,6 @@ void qemu_init(int argc, char **argv)
                 }
                 break;
 #endif
-            case QEMU_OPTION_audio_help:
-                audio_legacy_help();
-                exit (0);
-                break;
             case QEMU_OPTION_audiodev:
                 audio_parse_option(optarg);
                 break;
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 5cb38f90da..24bae43bed 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -413,9 +413,6 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
          */
         prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
 #endif /* __linux__ */
-        if (!g_setenv("QEMU_AUDIO_DRV", "none", true)) {
-            exit(1);
-        }
         execlp("/bin/sh", "sh", "-c", command, NULL);
         exit(1);
     }
-- 
2.38.1


