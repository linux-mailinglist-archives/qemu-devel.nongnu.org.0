Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2AA3AFAB8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 03:51:51 +0200 (CEST)
Received: from localhost ([::1]:46782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvVZu-0001sG-4s
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 21:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lvVZ2-0001DM-HE
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 21:50:56 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lvVZ0-0002rv-K9
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 21:50:56 -0400
Received: by mail-pf1-x42a.google.com with SMTP id a127so4621792pfa.10
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 18:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jM0wP6pUa3jOTqtgp5haKJ3AVu0QTggeSeAqfAf0Vjg=;
 b=MfRoDjW6LWzlvOeN0H4/7EW0OMSqiizixJLwPK/irPklSqEUm/cdMifHO/djog/Az6
 rSeAz4gsFljEJCce8NvYd4xWfS5PaXTPSw+ODG/TXwXbfuyatWh5YY7GbTkHv2fh7uTW
 TPTrb4C/HUeXSIaxKy9wtARZXopxEBnpZjp4c7cE3lPqO4amw7sOvXzE+wZVRVpMowgS
 3xr8XpIHgGSbnC/l+YI+v5e1IxNEuk1ZKRpE3dfoCmS7JR6P+xsXBCtA90RkZKBZFEtA
 9adbDyluZV13V54GADIMG5MxBi8s6s9ZoO+1ANZoVZAD3kfqQch1duRR/ZOFAvRJp+iH
 uwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jM0wP6pUa3jOTqtgp5haKJ3AVu0QTggeSeAqfAf0Vjg=;
 b=sG6aQEPtKT4TqW0tVPtCsy62ZOzI8X6u2P1bNuPK5fBvDhNlUTUaFCoIWAE6pl3f4z
 LjqfgZzqE83kqe/uUHaL3o93CDIAnTboNVbsddac81eduHqDLgUl9yuw/PRAGnuLUTN2
 BK5gi54QHccQHu7Xmu/8pBXd2FukLHOdvkpektHtTLRBv5I3femPv+EjRw/NppynLyoX
 vf+i0D9mat6Gl21RAKxPBQYXipqxAUNQcKdKOjKNMN2mIzdb78PNzKFEqJBC/BT0cfTd
 l5aXKKZ25wmC/GTKYJzuNuFkD69TDyw0CUjTnZTZSKKlrJd13TKykPNf+FYV06WaxFyE
 l21Q==
X-Gm-Message-State: AOAM531x2yDBfez59zU4CdFXvBuaAgLwYTrrpFO0H7inlh7UniwlbdWm
 fH+pZC0PVoDPJJdItUwKSzUNfTl4UEFrMA==
X-Google-Smtp-Source: ABdhPJx13wZRDjalffqAJ19NmQyan2D0ZgLIaKuBa4l4V7RV0ujKKUZDhBcVe8DApK4BxU+5NlOlVg==
X-Received: by 2002:a63:801:: with SMTP id 1mr1343709pgi.75.1624326651520;
 Mon, 21 Jun 2021 18:50:51 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:fcbe:8996:131c:c45b])
 by smtp.gmail.com with ESMTPSA id b133sm16989540pfb.36.2021.06.21.18.50.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Jun 2021 18:50:50 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] coreaudio: Lock only the buffer
Date: Tue, 22 Jun 2021 10:50:43 +0900
Message-Id: <20210622015043.41997-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42a.google.com
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
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
 audio/coreaudio.c | 59 +++++++++++------------------------------------
 1 file changed, 13 insertions(+), 46 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 578ec9b8b2e..c8d9f01d275 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -26,6 +26,7 @@
 #include <CoreAudio/CoreAudio.h>
 #include <pthread.h>            /* pthread_X */
 
+#include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "audio.h"
 
@@ -551,9 +552,7 @@ static OSStatus handle_voice_change(
     OSStatus status;
     coreaudioVoiceOut *core = in_client_data;
 
-    if (coreaudio_lock(core, __func__)) {
-        abort();
-    }
+    qemu_mutex_lock_iothread();
 
     if (core->outputDeviceID) {
         fini_out_device(core);
@@ -564,7 +563,7 @@ static OSStatus handle_voice_change(
         update_device_playback_state(core);
     }
 
-    coreaudio_unlock (core, __func__);
+    qemu_mutex_unlock_iothread();
     return status;
 }
 
@@ -582,11 +581,7 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
     err = pthread_mutex_init(&core->mutex, NULL);
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
@@ -606,37 +601,21 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
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
@@ -645,10 +624,6 @@ static void coreaudio_fini_out (HWVoiceOut *hw)
     int err;
     coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
 
-    if (coreaudio_lock(core, __func__)) {
-        abort();
-    }
-
     status = AudioObjectRemovePropertyListener(kAudioObjectSystemObject,
                                                &voice_addr,
                                                handle_voice_change,
@@ -659,8 +634,6 @@ static void coreaudio_fini_out (HWVoiceOut *hw)
 
     fini_out_device(core);
 
-    coreaudio_unlock(core, __func__);
-
     /* destroy mutex */
     err = pthread_mutex_destroy(&core->mutex);
     if (err) {
@@ -672,14 +645,8 @@ static void coreaudio_enable_out(HWVoiceOut *hw, bool enable)
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


