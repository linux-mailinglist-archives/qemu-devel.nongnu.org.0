Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3763F3B2ECA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 14:18:23 +0200 (CEST)
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwOJK-000717-0o
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 08:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwOHy-0005bE-JT
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:16:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwOHv-0000uU-AF
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624537014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ij0ZiclhwksvEuzThA4RHDEzS88gsZn8BQsZB24KrGU=;
 b=PWIjP1HJJ8ayBKLXOGfToE4xO0kAoyPrwUcFYVWlIicnhndEqZAMCkZf0nYEv9ALmAsexv
 jg+KSNGRB0r8YPQZVC1ZNtDALkIcRXcHv952QblLwjTyfN+7+llqPvvldGVh/anaTu5Wk4
 BuaubfPsocyNTvocMxKHpeEsFUj7CLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-PzfKZzGLNKihwhCkA9Mksg-1; Thu, 24 Jun 2021 08:16:53 -0400
X-MC-Unique: PzfKZzGLNKihwhCkA9Mksg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7281100C661;
 Thu, 24 Jun 2021 12:16:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 182595D6A1;
 Thu, 24 Jun 2021 12:16:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 79196180079D; Thu, 24 Jun 2021 14:16:39 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] coreaudio: Lock only the buffer
Date: Thu, 24 Jun 2021 14:16:38 +0200
Message-Id: <20210624121639.2422367-2-kraxel@redhat.com>
In-Reply-To: <20210624121639.2422367-1-kraxel@redhat.com>
References: <20210624121639.2422367-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

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
Message-id: 20210622201740.38005-1-akihiko.odaki@gmail.com
Message-Id: <20210622201740.38005-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/coreaudio.c | 102 +++++++++++++++++++---------------------------
 1 file changed, 41 insertions(+), 61 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index f570e1ee60ef..d8a21d3e5075 100644
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
@@ -241,11 +242,11 @@ static void GCC_FMT_ATTR (3, 4) coreaudio_logerr2 (
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
@@ -254,11 +255,11 @@ static int coreaudio_lock (coreaudioVoiceOut *core, const char *fn_name)
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
@@ -273,13 +274,13 @@ static int coreaudio_unlock (coreaudioVoiceOut *core, const char *fn_name)
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
@@ -291,7 +292,10 @@ COREAUDIO_WRAPPER_FUNC(write, size_t, (HWVoiceOut *hw, void *buf, size_t size),
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
@@ -307,13 +311,13 @@ static OSStatus audioDeviceIOProc(
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
 
@@ -323,7 +327,7 @@ static OSStatus audioDeviceIOProc(
     /* if there are not enough samples, set signal and return */
     if (pending_frames < frameCount) {
         inInputTime = 0;
-        coreaudio_unlock (core, "audioDeviceIOProc(empty)");
+        coreaudio_buf_unlock (core, "audioDeviceIOProc(empty)");
         return 0;
     }
 
@@ -345,7 +349,7 @@ static OSStatus audioDeviceIOProc(
         out += write_len;
     }
 
-    coreaudio_unlock (core, "audioDeviceIOProc");
+    coreaudio_buf_unlock (core, "audioDeviceIOProc");
     return 0;
 }
 
@@ -438,7 +442,16 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
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
@@ -521,6 +534,7 @@ static void update_device_playback_state(coreaudioVoiceOut *core)
     }
 }
 
+/* called without iothread lock. */
 static OSStatus handle_voice_change(
     AudioObjectID in_object_id,
     UInt32 in_number_addresses,
@@ -530,9 +544,7 @@ static OSStatus handle_voice_change(
     OSStatus status;
     coreaudioVoiceOut *core = in_client_data;
 
-    if (coreaudio_lock(core, __func__)) {
-        abort();
-    }
+    qemu_mutex_lock_iothread();
 
     if (core->outputDeviceID) {
         fini_out_device(core);
@@ -543,7 +555,7 @@ static OSStatus handle_voice_change(
         update_device_playback_state(core);
     }
 
-    coreaudio_unlock (core, __func__);
+    qemu_mutex_unlock_iothread();
     return status;
 }
 
@@ -558,14 +570,10 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
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
@@ -584,37 +592,21 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
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
@@ -623,10 +615,6 @@ static void coreaudio_fini_out (HWVoiceOut *hw)
     int err;
     coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
 
-    if (coreaudio_lock(core, __func__)) {
-        abort();
-    }
-
     status = AudioObjectRemovePropertyListener(kAudioObjectSystemObject,
                                                &voice_addr,
                                                handle_voice_change,
@@ -637,10 +625,8 @@ static void coreaudio_fini_out (HWVoiceOut *hw)
 
     fini_out_device(core);
 
-    coreaudio_unlock(core, __func__);
-
     /* destroy mutex */
-    err = pthread_mutex_destroy(&core->mutex);
+    err = pthread_mutex_destroy(&core->buf_mutex);
     if (err) {
         dolog("Could not destroy mutex\nReason: %s\n", strerror (err));
     }
@@ -650,14 +636,8 @@ static void coreaudio_enable_out(HWVoiceOut *hw, bool enable)
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
2.31.1


