Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A036850DBCD
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 10:57:43 +0200 (CEST)
Received: from localhost ([::1]:60460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuXO-0004RX-Ks
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 04:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu0H-0006m1-2x
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu0A-0002kC-4C
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650875001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RNMCFsdt1DfVphZXSznWDAJKRd268N5F4URsC76WAsg=;
 b=CjtelYpu9DYapbzsI7BNxKPdDRNC626t9YcG1ytujj3v8sXU6F68wEClrEE4/jfRTNh9OM
 cpMRaGqqt5G+0Pabr8ksL4rDeYipe8R29i86YihYGbg2AbsZ2mE1DnNYFVvb9rL1PQI8tc
 gezSgjeJNXnOMTZUPT4ArAkUyhMv81g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-JpLUWNKGOoiqgu3X6PcqQw-1; Mon, 25 Apr 2022 04:22:08 -0400
X-MC-Unique: JpLUWNKGOoiqgu3X6PcqQw-1
Received: by mail-wr1-f70.google.com with SMTP id
 t15-20020adfdc0f000000b001ef93643476so3063398wri.2
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RNMCFsdt1DfVphZXSznWDAJKRd268N5F4URsC76WAsg=;
 b=Q2vMnfhP7cp53eg3mjI5AxLAQTUka2nc8+I4E7i0W3FnCti84qVMb7lFxcqRWQR7ed
 +el0tUD4HLI43N0ItJlUHYCNaezHGU44EQe9NCSxTJqb1jDIF6SBoIG7Lh0CczwFmz+X
 /mDnKGMGldXIWPZTztasq0hs1IvMz79nDv4GshqhmD4rGTmIzPPRXAOQGqFF+qkzv3pO
 FDWy6wHWF9mPi30DqEj5V9YDdzyUHoDqGuci4M101iQ7AYvL0tubSd95lP4GRwt0000H
 qciOnJcmBfvVMUexuN8zoSgzd+rr5Wp+RTcAq7H1BhsZOQmHN8ojLpl96ixDOW1AGQOG
 31DQ==
X-Gm-Message-State: AOAM532R/+S82Fvtt+doWpiEwzrWcyqfebWB+DH9OMrzzZkAVLkxOa4F
 gL8dwQ0+w9dc+yaekzX8mMwaNmMA/54zCbEtUbE0AjO2UscKHtHkVzjPWqLUJioTq+cqyedOmt5
 glyltQ+D8dKYECgQ=
X-Received: by 2002:a5d:4fca:0:b0:20a:cf56:a894 with SMTP id
 h10-20020a5d4fca000000b0020acf56a894mr9298191wrw.528.1650874926947; 
 Mon, 25 Apr 2022 01:22:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+f/2SVdHUly0vy5r/Hl7JL7WORn5lIVFTyZ0TioUZEj7Zl6cNy8EfBhjEkf0JCtk+xrBUqg==
X-Received: by 2002:a5d:4fca:0:b0:20a:cf56:a894 with SMTP id
 h10-20020a5d4fca000000b0020acf56a894mr9298165wrw.528.1650874926539; 
 Mon, 25 Apr 2022 01:22:06 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d6482000000b0020a96536fcdsm8850332wri.57.2022.04.25.01.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 87D8D67B1B65;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/18] audio: Remove legacy audio environment variables and
 options
Date: Mon, 25 Apr 2022 10:21:59 +0200
Message-Id: <c88cdd6f3b6d0d8e94753f36a154217a10fd4625.1650874791.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 audio/audio.c                   |  13 -
 audio/audio.h                   |   1 -
 audio/audio_legacy.c            | 555 --------------------------------
 audio/meson.build               |   1 -
 docs/about/deprecated.rst       |   7 -
 docs/about/removed-features.rst |   9 +
 qemu-options.hx                 |  10 -
 softmmu/vl.c                    |   4 -
 8 files changed, 9 insertions(+), 591 deletions(-)
 delete mode 100644 audio/audio_legacy.c

diff --git a/audio/audio.c b/audio/audio.c
index c944cf817cf9..b3ecc8fa6508 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -49,19 +49,6 @@
 
 #define SW_NAME(sw) (sw)->name ? (sw)->name : "unknown"
 
-
-/* Order of CONFIG_AUDIO_DRIVERS is import.
-   The 1st one is the one used by default, that is the reason
-    that we generate the list.
-*/
-const char *audio_prio_list[] = {
-    "spice",
-    CONFIG_AUDIO_DRIVERS
-    "none",
-    "wav",
-    NULL
-};
-
 static QLIST_HEAD(, audio_driver) audio_drivers;
 static AudiodevListHead audiodevs = QSIMPLEQ_HEAD_INITIALIZER(audiodevs);
 
diff --git a/audio/audio.h b/audio/audio.h
index 9deed8ed6830..ae10a7f0fa81 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -170,7 +170,6 @@ void audio_sample_from_uint64(void *samples, int pos,
 
 void audio_parse_option(const char *opt);
 void audio_init_audiodevs(void);
-void audio_legacy_help(void);
 
 AudioState *audio_state_by_name(const char *name);
 const char *audio_get_id(QEMUSoundCard *card);
diff --git a/audio/audio_legacy.c b/audio/audio_legacy.c
deleted file mode 100644
index 595949f52cd4..000000000000
--- a/audio/audio_legacy.c
+++ /dev/null
@@ -1,555 +0,0 @@
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
-static void get_str(const char *env, char **dst, bool *has_dst)
-{
-    const char *val = getenv(env);
-    if (val) {
-        if (*has_dst) {
-            g_free(*dst);
-        }
-        *dst = g_strdup(val);
-        *has_dst = true;
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
-    get_str(buf, &apdo->dev, &apdo->has_dev);
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
-    get_str(dev_env, &opdo->dev, &opdo->has_dev);
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
-    get_str(env, &ppdo->name, &ppdo->has_name);
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
-    get_str("QEMU_PA_SERVER", &dev->u.pa.server, &dev->u.pa.has_server);
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
-    get_str("QEMU_WAV_PATH", &dev->u.wav.path, &dev->u.wav.has_path);
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
index 94dab16891d5..d73155d2f2ae 100644
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
index b2255319e347..7cc44e611ebe 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -23,13 +23,6 @@ deprecated.
 System emulator command line arguments
 --------------------------------------
 
-``QEMU_AUDIO_`` environment variables and ``-audio-help`` (since 4.0)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The ``-audiodev`` argument is now the preferred way to specify audio
-backend settings instead of environment variables.  To ease migration to
-the new format, the ``-audiodev-help`` option can be used to convert
-the current values of the environment variables to ``-audiodev`` options.
 
 ``-chardev`` backend aliases ``tty`` and ``parport`` (since 6.0)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index f9eea4dda327..e2a95baf9031 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -354,6 +354,15 @@ should specify an ``audiodev=`` property.  Additionally, when using
 vnc, you should specify an ``audiodev=`` property if you plan to
 transmit audio through the VNC protocol.
 
+``QEMU_AUDIO_`` environment variables and ``-audio-help`` (removed in 7.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``-audiodev`` argument is now the preferred way to specify audio
+backend settings instead of environment variables.  To ease migration to
+the new format, the ``-audio-help`` option can be used with older QEMU
+binaries to convert some of the old values of the environment variables
+to new ``-audiodev`` options.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/qemu-options.hx b/qemu-options.hx
index 47bbd86a4533..b45d488440fc 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -651,16 +651,6 @@ SRST
 ERST
 
 
-HXCOMM Deprecated by -audiodev
-DEF("audio-help", 0, QEMU_OPTION_audio_help,
-    "-audio-help     show -audiodev equivalent of the currently specified audio settings\n",
-    QEMU_ARCH_ALL)
-SRST
-``-audio-help``
-    Will show the -audiodev equivalent of the currently specified
-    (deprecated) environment variables.
-ERST
-
 DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
     "-audiodev [driver=]driver,id=id[,prop[=value][,...]]\n"
     "                specifies the audio backend to use\n"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 2f7158574e4f..248bf8f66c4c 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3008,10 +3008,6 @@ void qemu_init(int argc, char **argv, char **envp)
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
-- 
2.35.1


