Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B23B0E7F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 22:19:08 +0200 (CEST)
Received: from localhost ([::1]:59382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvmrT-0003aQ-VF
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 16:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lvmqN-0002ow-3m
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 16:17:59 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lvmqH-0002Uc-5b
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 16:17:58 -0400
Received: by mail-pl1-x62b.google.com with SMTP id c15so10945803pls.13
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 13:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jfw5DDphYgm6Otvo/HwuW8bAeppoFT+UUfRAZKu0zf0=;
 b=scvLzjBui8/dZkzajGExiIn1Xieqt9PkjJi9KK0uEwVKKzuvzJLxIpZmLV+qYpW7aQ
 rgd7bMsltxp35QZXdwqHK232NmONd7vWsLQJpOoU9wHIBigY2yu+hkATFqbyhlx94KqD
 S3aKl2s0slV+A5vsXD29ZNQMbYl1l3ro/4u9x4raPfWyZnUTexWFEelcUbRxqBDTirY4
 7F2FpGwSCeyZPRTWa2bPET6yHQ0gGS+1P5d8YO7ib5QOL2wEK7ZU4k5UtCmx/JDmAH8P
 30dpcedKSYMgttEUiFkmowDLfBWg63mBvHKVYQZH46rg4J8uVoEIICu65cd8w8dBAC27
 zq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jfw5DDphYgm6Otvo/HwuW8bAeppoFT+UUfRAZKu0zf0=;
 b=FlQtdyeMH9BuHRktXgXRLcFiIUfvkmOaE1Yko/icS9oeQNDQezf9SwMrasNaZuWnJ0
 zSKj0uP4zbCsM06FLeScBszli9d9xd2l+9Yf7g3BCBi2bgt4NebtLfprNI8JEE5Bltqa
 BkF7FwsYM7fNEiDPln8w8+Dr+s8hsQibCYUYC2Z6phoL4U/UXkyisRbKEri/stewGtU6
 RXLunu0XtynkliFAWPPS09+bpuavVCIoFf6ySjQb4eEq0TzYwbDqXiU0m8p1R0QxD1ln
 CHcwlfb04HEyUBJjptQP5P4GKWVREOM8aMnXyTELPqOAF0beDaTSxdAio2VXEb3ln/Lb
 H+hA==
X-Gm-Message-State: AOAM531Fzkz5TK5YRA4F4cUAw/TjsM5TPUuKHqGzlaZa60tLAlUjoomY
 uavnBovH1SY64k6tDXKI+t2lZDtoU5Rzbw==
X-Google-Smtp-Source: ABdhPJxIlix717AcJPBImoLQX6B6AT+gDWWI+0Tu9cy8H0NGkkjW4xKiizLqv+9R9F60i6DG55gjZg==
X-Received: by 2002:a17:90a:348e:: with SMTP id
 p14mr4564862pjb.151.1624393070173; 
 Tue, 22 Jun 2021 13:17:50 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:450a:8dfe:8c64:1f5])
 by smtp.gmail.com with ESMTPSA id z9sm176544pfa.2.2021.06.22.13.17.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Jun 2021 13:17:49 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] coreaudio: Lock only the buffer
Date: Wed, 23 Jun 2021 05:17:40 +0900
Message-Id: <20210622201740.38005-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On macOS 11.3.1, Core Audio calls AudioDeviceIOProc after calling an
internal function named HALB_Mutex::Lock(), which locks a mutex in
HALB_IOThread::Entry(void*). HALB_Mutex::Lock() is also called in
AudioObjectGetPropertyData, which is called by coreaudio driver.
Therefore, a deadlock will occur if coreaudio driver calls
AudioObjectGetPropertyData while holding a lock for a mutex and tries
to lock the same mutex in AudioDeviceIOProc.

audioDeviceIOProc, which implements AudioDeviceIOProc in coreaudio
driver, requires an exclusive access for the device configuration and
the buffer. Fortunately, a mutex is necessary only for the buffer in
audioDeviceIOProc because a change for the device configuration occurs
only before setting up AudioDeviceIOProc or after stopping the playback
with AudioDeviceStop.

With this change, the mutex owned by the driver will only be used for
the buffer, and the device configuration change will be protected with
the implicit iothread mutex.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 audio/coreaudio.c | 102 +++++++++++++++++++---------------------------
 1 file changed, 41 insertions(+), 61 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 578ec9b8b2e..c239f756337 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -26,6 +26,7 @@
 #include <CoreAudio/CoreAudio.h>
 #include <pthread.h>            /* pthread_X */
 
+#include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "audio.h"
 
@@ -34,7 +35,7 @@
 
 typedef struct coreaudioVoiceOut {
     HWVoiceOut hw;
-    pthread_mutex_t mutex;
+    pthread_mutex_t buf_mutex;
     AudioDeviceID outputDeviceID;
     int frameSizeSetting;
     uint32_t bufferCount;
@@ -260,11 +261,11 @@ static void GCC_FMT_ATTR (3, 4) coreaudio_logerr2 (
 #define coreaudio_playback_logerr(status, ...) \
     coreaudio_logerr2(status, "playback", __VA_ARGS__)
 
-static int coreaudio_lock (coreaudioVoiceOut *core, const char *fn_name)
+static int coreaudio_buf_lock (coreaudioVoiceOut *core, const char *fn_name)
 {
     int err;
 
-    err = pthread_mutex_lock (&core->mutex);
+    err = pthread_mutex_lock (&core->buf_mutex);
     if (err) {
         dolog ("Could not lock voice for %s\nReason: %s\n",
                fn_name, strerror (err));
@@ -273,11 +274,11 @@ static int coreaudio_lock (coreaudioVoiceOut *core, const char *fn_name)
     return 0;
 }
 
-static int coreaudio_unlock (coreaudioVoiceOut *core, const char *fn_name)
+static int coreaudio_buf_unlock (coreaudioVoiceOut *core, const char *fn_name)
 {
     int err;
 
-    err = pthread_mutex_unlock (&core->mutex);
+    err = pthread_mutex_unlock (&core->buf_mutex);
     if (err) {
         dolog ("Could not unlock voice for %s\nReason: %s\n",
                fn_name, strerror (err));
@@ -292,13 +293,13 @@ static int coreaudio_unlock (coreaudioVoiceOut *core, const char *fn_name)
         coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;     \
         ret_type ret;                                           \
                                                                 \
-        if (coreaudio_lock(core, "coreaudio_" #name)) {         \
+        if (coreaudio_buf_lock(core, "coreaudio_" #name)) {         \
             return 0;                                           \
         }                                                       \
                                                                 \
         ret = glue(audio_generic_, name)args;                   \
                                                                 \
-        coreaudio_unlock(core, "coreaudio_" #name);             \
+        coreaudio_buf_unlock(core, "coreaudio_" #name);             \
         return ret;                                             \
     }
 COREAUDIO_WRAPPER_FUNC(get_buffer_out, void *, (HWVoiceOut *hw, size_t *size),
@@ -310,7 +311,10 @@ COREAUDIO_WRAPPER_FUNC(write, size_t, (HWVoiceOut *hw, void *buf, size_t size),
                        (hw, buf, size))
 #undef COREAUDIO_WRAPPER_FUNC
 
-/* callback to feed audiooutput buffer */
+/*
+ * callback to feed audiooutput buffer. called without iothread lock.
+ * allowed to lock "buf_mutex", but disallowed to have any other locks.
+ */
 static OSStatus audioDeviceIOProc(
     AudioDeviceID inDevice,
     const AudioTimeStamp *inNow,
@@ -326,13 +330,13 @@ static OSStatus audioDeviceIOProc(
     coreaudioVoiceOut *core = (coreaudioVoiceOut *) hwptr;
     size_t len;
 
-    if (coreaudio_lock (core, "audioDeviceIOProc")) {
+    if (coreaudio_buf_lock (core, "audioDeviceIOProc")) {
         inInputTime = 0;
         return 0;
     }
 
     if (inDevice != core->outputDeviceID) {
-        coreaudio_unlock (core, "audioDeviceIOProc(old device)");
+        coreaudio_buf_unlock (core, "audioDeviceIOProc(old device)");
         return 0;
     }
 
@@ -342,7 +346,7 @@ static OSStatus audioDeviceIOProc(
     /* if there are not enough samples, set signal and return */
     if (pending_frames < frameCount) {
         inInputTime = 0;
-        coreaudio_unlock (core, "audioDeviceIOProc(empty)");
+        coreaudio_buf_unlock (core, "audioDeviceIOProc(empty)");
         return 0;
     }
 
@@ -364,7 +368,7 @@ static OSStatus audioDeviceIOProc(
         out += write_len;
     }
 
-    coreaudio_unlock (core, "audioDeviceIOProc");
+    coreaudio_buf_unlock (core, "audioDeviceIOProc");
     return 0;
 }
 
@@ -459,7 +463,16 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
         return status;
     }
 
-    /* set Callback */
+    /*
+     * set Callback.
+     *
+     * On macOS 11.3.1, Core Audio calls AudioDeviceIOProc after calling an
+     * internal function named HALB_Mutex::Lock(), which locks a mutex in
+     * HALB_IOThread::Entry(void*). HALB_Mutex::Lock() is also called in
+     * AudioObjectGetPropertyData, which is called by coreaudio driver.
+     * Therefore, the specified callback must be designed to avoid a deadlock
+     * with the callers of AudioObjectGetPropertyData.
+     */
     core->ioprocid = NULL;
     status = AudioDeviceCreateIOProcID(core->outputDeviceID,
                                        audioDeviceIOProc,
@@ -542,6 +555,7 @@ static void update_device_playback_state(coreaudioVoiceOut *core)
     }
 }
 
+/* called without iothread lock. */
 static OSStatus handle_voice_change(
     AudioObjectID in_object_id,
     UInt32 in_number_addresses,
@@ -551,9 +565,7 @@ static OSStatus handle_voice_change(
     OSStatus status;
     coreaudioVoiceOut *core = in_client_data;
 
-    if (coreaudio_lock(core, __func__)) {
-        abort();
-    }
+    qemu_mutex_lock_iothread();
 
     if (core->outputDeviceID) {
         fini_out_device(core);
@@ -564,7 +576,7 @@ static OSStatus handle_voice_change(
         update_device_playback_state(core);
     }
 
-    coreaudio_unlock (core, __func__);
+    qemu_mutex_unlock_iothread();
     return status;
 }
 
@@ -579,14 +591,10 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
     struct audsettings obt_as;
 
     /* create mutex */
-    err = pthread_mutex_init(&core->mutex, NULL);
+    err = pthread_mutex_init(&core->buf_mutex, NULL);
     if (err) {
         dolog("Could not create mutex\nReason: %s\n", strerror (err));
-        goto mutex_error;
-    }
-
-    if (coreaudio_lock(core, __func__)) {
-        goto lock_error;
+        return -1;
     }
 
     obt_as = *as;
@@ -606,37 +614,21 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
     if (status != kAudioHardwareNoError) {
         coreaudio_playback_logerr (status,
                                    "Could not listen to voice property change\n");
-        goto listener_error;
+        return -1;
     }
 
     if (init_out_device(core)) {
-        goto device_error;
+        status = AudioObjectRemovePropertyListener(kAudioObjectSystemObject,
+                                                   &voice_addr,
+                                                   handle_voice_change,
+                                                   core);
+        if (status != kAudioHardwareNoError) {
+            coreaudio_playback_logerr(status,
+                                      "Could not remove voice property change listener\n");
+        }
     }
 
-    coreaudio_unlock(core, __func__);
     return 0;
-
-device_error:
-    status = AudioObjectRemovePropertyListener(kAudioObjectSystemObject,
-                                               &voice_addr,
-                                               handle_voice_change,
-                                               core);
-    if (status != kAudioHardwareNoError) {
-        coreaudio_playback_logerr(status,
-                                  "Could not remove voice property change listener\n");
-    }
-
-listener_error:
-    coreaudio_unlock(core, __func__);
-
-lock_error:
-    err = pthread_mutex_destroy(&core->mutex);
-    if (err) {
-        dolog("Could not destroy mutex\nReason: %s\n", strerror (err));
-    }
-
-mutex_error:
-    return -1;
 }
 
 static void coreaudio_fini_out (HWVoiceOut *hw)
@@ -645,10 +637,6 @@ static void coreaudio_fini_out (HWVoiceOut *hw)
     int err;
     coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
 
-    if (coreaudio_lock(core, __func__)) {
-        abort();
-    }
-
     status = AudioObjectRemovePropertyListener(kAudioObjectSystemObject,
                                                &voice_addr,
                                                handle_voice_change,
@@ -659,10 +647,8 @@ static void coreaudio_fini_out (HWVoiceOut *hw)
 
     fini_out_device(core);
 
-    coreaudio_unlock(core, __func__);
-
     /* destroy mutex */
-    err = pthread_mutex_destroy(&core->mutex);
+    err = pthread_mutex_destroy(&core->buf_mutex);
     if (err) {
         dolog("Could not destroy mutex\nReason: %s\n", strerror (err));
     }
@@ -672,14 +658,8 @@ static void coreaudio_enable_out(HWVoiceOut *hw, bool enable)
 {
     coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
 
-    if (coreaudio_lock(core, __func__)) {
-        abort();
-    }
-
     core->enabled = enable;
     update_device_playback_state(core);
-
-    coreaudio_unlock(core, __func__);
 }
 
 static void *coreaudio_audio_init(Audiodev *dev)
-- 
2.30.1 (Apple Git-130)


