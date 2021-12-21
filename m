Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7E347BB42
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:44:37 +0100 (CET)
Received: from localhost ([::1]:59284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZp6-0003r3-6A
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:44:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZFI-0002S0-O4
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:07:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZFF-0002Ub-9q
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uZmHqPJwF3GSSjNUX5ebugjGeisqMy1vI7MNbYpokPw=;
 b=b08Jk3+Ex3GJoMbuunpT9BCZkLyJitK6i9DaWi4E0BgErtF3aFxOGQizVDW0/5okWdvWSm
 D9RkQ74L1b7Gxhe9ujEt9uCjj4x663C5nHxsaBm+Vi9MSM6eIzUrlo8CuAVqQNIxqcnViQ
 o1oKbtJwxlhngvBnaDdyHdOxEQIMH1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-Ybsm6vWLPCyKzOr4D5FHIQ-1; Tue, 21 Dec 2021 02:07:30 -0500
X-MC-Unique: Ybsm6vWLPCyKzOr4D5FHIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71EC48042E2;
 Tue, 21 Dec 2021 07:07:29 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69A79105B20B;
 Tue, 21 Dec 2021 07:07:02 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 29/36] audio: add "dbus" audio backend
Date: Tue, 21 Dec 2021 10:58:48 +0400
Message-Id: <20211221065855.142578-30-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Add a new -audio backend that accepts D-Bus clients/listeners to handle
playback & recording, to be exported via the -display dbus.

Example usage:
-audiodev dbus,in.mixing-engine=off,out.mixing-engine=off,id=dbus
-display dbus,audiodev=dbus

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qapi/audio.json        |   3 +-
 qapi/ui.json           |   5 +-
 audio/audio_int.h      |   7 +
 audio/audio_template.h |   2 +
 ui/dbus.h              |   1 +
 audio/audio.c          |   1 +
 audio/dbusaudio.c      | 654 +++++++++++++++++++++++++++++++++++++++++
 ui/dbus.c              |  35 +++
 audio/meson.build      |   6 +
 audio/trace-events     |   5 +
 qemu-options.hx        |   3 +
 ui/dbus-display1.xml   | 211 +++++++++++++
 12 files changed, 931 insertions(+), 2 deletions(-)
 create mode 100644 audio/dbusaudio.c

diff --git a/qapi/audio.json b/qapi/audio.json
index 9cba0df8a4e9..693e327c6b6a 100644
--- a/qapi/audio.json
+++ b/qapi/audio.json
@@ -386,7 +386,7 @@
 # Since: 4.0
 ##
 { 'enum': 'AudiodevDriver',
-  'data': [ 'none', 'alsa', 'coreaudio', 'dsound', 'jack', 'oss', 'pa',
+  'data': [ 'none', 'alsa', 'coreaudio', 'dbus', 'dsound', 'jack', 'oss', 'pa',
             'sdl', 'spice', 'wav' ] }
 
 ##
@@ -412,6 +412,7 @@
     'none':      'AudiodevGenericOptions',
     'alsa':      'AudiodevAlsaOptions',
     'coreaudio': 'AudiodevCoreaudioOptions',
+    'dbus':      'AudiodevGenericOptions',
     'dsound':    'AudiodevDsoundOptions',
     'jack':      'AudiodevJackOptions',
     'oss':       'AudiodevOssOptions',
diff --git a/qapi/ui.json b/qapi/ui.json
index d435e9472264..2b4371da3777 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1134,13 +1134,16 @@
 # @p2p: Whether to use peer-to-peer connections (accepted through
 #       ``add_client``).
 #
+# @audiodev: Use the specified DBus audiodev to export audio.
+#
 # Since: 7.0
 #
 ##
 { 'struct'  : 'DisplayDBus',
   'data'    : { '*rendernode' : 'str',
                 '*addr': 'str',
-                '*p2p': 'bool' } }
+                '*p2p': 'bool',
+                '*audiodev': 'str' } }
 
  ##
  # @DisplayGLMode:
diff --git a/audio/audio_int.h b/audio/audio_int.h
index 6d685e24a388..428a091d05e5 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -31,6 +31,10 @@
 #endif
 #include "mixeng.h"
 
+#ifdef CONFIG_GIO
+#include <gio/gio.h>
+#endif
+
 struct audio_pcm_ops;
 
 struct audio_callback {
@@ -140,6 +144,9 @@ struct audio_driver {
     const char *descr;
     void *(*init) (Audiodev *);
     void (*fini) (void *);
+#ifdef CONFIG_GIO
+    void (*set_dbus_server) (AudioState *s, GDBusObjectManagerServer *manager);
+#endif
     struct audio_pcm_ops *pcm_ops;
     int can_be_default;
     int max_voices_out;
diff --git a/audio/audio_template.h b/audio/audio_template.h
index c6714946aaed..d2d348638b8c 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -327,6 +327,8 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
     case AUDIODEV_DRIVER_COREAUDIO:
         return qapi_AudiodevCoreaudioPerDirectionOptions_base(
             dev->u.coreaudio.TYPE);
+    case AUDIODEV_DRIVER_DBUS:
+        return dev->u.dbus.TYPE;
     case AUDIODEV_DRIVER_DSOUND:
         return dev->u.dsound.TYPE;
     case AUDIODEV_DRIVER_JACK:
diff --git a/ui/dbus.h b/ui/dbus.h
index 4698d324632e..ca1f0f4ab94f 100644
--- a/ui/dbus.h
+++ b/ui/dbus.h
@@ -36,6 +36,7 @@ struct DBusDisplay {
     DisplayGLMode gl_mode;
     bool p2p;
     char *dbus_addr;
+    char *audiodev;
     DisplayGLCtx glctx;
 
     GDBusConnection *bus;
diff --git a/audio/audio.c b/audio/audio.c
index 54a153c0ef07..dc28685d226d 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -2000,6 +2000,7 @@ void audio_create_pdos(Audiodev *dev)
         CASE(NONE, none, );
         CASE(ALSA, alsa, Alsa);
         CASE(COREAUDIO, coreaudio, Coreaudio);
+        CASE(DBUS, dbus, );
         CASE(DSOUND, dsound, );
         CASE(JACK, jack, Jack);
         CASE(OSS, oss, Oss);
diff --git a/audio/dbusaudio.c b/audio/dbusaudio.c
new file mode 100644
index 000000000000..f178b47deec1
--- /dev/null
+++ b/audio/dbusaudio.c
@@ -0,0 +1,654 @@
+/*
+ * QEMU DBus audio
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qemu/host-utils.h"
+#include "qemu/module.h"
+#include "qemu/timer.h"
+#include "qemu/dbus.h"
+
+#include <gio/gunixfdlist.h>
+#include "ui/dbus-display1.h"
+
+#define AUDIO_CAP "dbus"
+#include "audio.h"
+#include "audio_int.h"
+#include "trace.h"
+
+#define DBUS_DISPLAY1_AUDIO_PATH DBUS_DISPLAY1_ROOT "/Audio"
+
+#define DBUS_AUDIO_NSAMPLES 1024 /* could be configured? */
+
+typedef struct DBusAudio {
+    GDBusObjectManagerServer *server;
+    GDBusObjectSkeleton *audio;
+    QemuDBusDisplay1Audio *iface;
+    GHashTable *out_listeners;
+    GHashTable *in_listeners;
+} DBusAudio;
+
+typedef struct DBusVoiceOut {
+    HWVoiceOut hw;
+    bool enabled;
+    RateCtl rate;
+
+    void *buf;
+    size_t buf_pos;
+    size_t buf_size;
+
+    bool has_volume;
+    Volume volume;
+} DBusVoiceOut;
+
+typedef struct DBusVoiceIn {
+    HWVoiceIn hw;
+    bool enabled;
+    RateCtl rate;
+
+    bool has_volume;
+    Volume volume;
+} DBusVoiceIn;
+
+static void *dbus_get_buffer_out(HWVoiceOut *hw, size_t *size)
+{
+    DBusVoiceOut *vo = container_of(hw, DBusVoiceOut, hw);
+
+    if (!vo->buf) {
+        vo->buf_size = hw->samples * hw->info.bytes_per_frame;
+        vo->buf = g_malloc(vo->buf_size);
+        vo->buf_pos = 0;
+    }
+
+    *size = MIN(vo->buf_size - vo->buf_pos, *size);
+    *size = audio_rate_get_bytes(&hw->info, &vo->rate, *size);
+
+    return vo->buf + vo->buf_pos;
+
+}
+
+static size_t dbus_put_buffer_out(HWVoiceOut *hw, void *buf, size_t size)
+{
+    DBusAudio *da = (DBusAudio *)hw->s->drv_opaque;
+    DBusVoiceOut *vo = container_of(hw, DBusVoiceOut, hw);
+    GHashTableIter iter;
+    QemuDBusDisplay1AudioOutListener *listener = NULL;
+    g_autoptr(GBytes) bytes = NULL;
+    g_autoptr(GVariant) v_data = NULL;
+
+    assert(buf == vo->buf + vo->buf_pos && vo->buf_pos + size <= vo->buf_size);
+    vo->buf_pos += size;
+
+    trace_dbus_audio_put_buffer_out(size);
+
+    if (vo->buf_pos < vo->buf_size) {
+        return size;
+    }
+
+    bytes = g_bytes_new_take(g_steal_pointer(&vo->buf), vo->buf_size);
+    v_data = g_variant_new_from_bytes(G_VARIANT_TYPE("ay"), bytes, TRUE);
+    g_variant_ref_sink(v_data);
+
+    g_hash_table_iter_init(&iter, da->out_listeners);
+    while (g_hash_table_iter_next(&iter, NULL, (void **)&listener)) {
+        qemu_dbus_display1_audio_out_listener_call_write(
+            listener,
+            (uintptr_t)hw,
+            v_data,
+            G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+    }
+
+    return size;
+}
+
+#ifdef HOST_WORDS_BIGENDIAN
+#define AUDIO_HOST_BE TRUE
+#else
+#define AUDIO_HOST_BE FALSE
+#endif
+
+static void
+dbus_init_out_listener(QemuDBusDisplay1AudioOutListener *listener,
+                       HWVoiceOut *hw)
+{
+    qemu_dbus_display1_audio_out_listener_call_init(
+        listener,
+        (uintptr_t)hw,
+        hw->info.bits,
+        hw->info.is_signed,
+        hw->info.is_float,
+        hw->info.freq,
+        hw->info.nchannels,
+        hw->info.bytes_per_frame,
+        hw->info.bytes_per_second,
+        hw->info.swap_endianness ? !AUDIO_HOST_BE : AUDIO_HOST_BE,
+        G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+}
+
+static int
+dbus_init_out(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque)
+{
+    DBusAudio *da = (DBusAudio *)hw->s->drv_opaque;
+    DBusVoiceOut *vo = container_of(hw, DBusVoiceOut, hw);
+    GHashTableIter iter;
+    QemuDBusDisplay1AudioOutListener *listener = NULL;
+
+    audio_pcm_init_info(&hw->info, as);
+    hw->samples = DBUS_AUDIO_NSAMPLES;
+    audio_rate_start(&vo->rate);
+
+    g_hash_table_iter_init(&iter, da->out_listeners);
+    while (g_hash_table_iter_next(&iter, NULL, (void **)&listener)) {
+        dbus_init_out_listener(listener, hw);
+    }
+    return 0;
+}
+
+static void
+dbus_fini_out(HWVoiceOut *hw)
+{
+    DBusAudio *da = (DBusAudio *)hw->s->drv_opaque;
+    DBusVoiceOut *vo = container_of(hw, DBusVoiceOut, hw);
+    GHashTableIter iter;
+    QemuDBusDisplay1AudioOutListener *listener = NULL;
+
+    g_hash_table_iter_init(&iter, da->out_listeners);
+    while (g_hash_table_iter_next(&iter, NULL, (void **)&listener)) {
+        qemu_dbus_display1_audio_out_listener_call_fini(
+            listener,
+            (uintptr_t)hw,
+            G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+    }
+
+    g_clear_pointer(&vo->buf, g_free);
+}
+
+static void
+dbus_enable_out(HWVoiceOut *hw, bool enable)
+{
+    DBusAudio *da = (DBusAudio *)hw->s->drv_opaque;
+    DBusVoiceOut *vo = container_of(hw, DBusVoiceOut, hw);
+    GHashTableIter iter;
+    QemuDBusDisplay1AudioOutListener *listener = NULL;
+
+    vo->enabled = enable;
+    if (enable) {
+        audio_rate_start(&vo->rate);
+    }
+
+    g_hash_table_iter_init(&iter, da->out_listeners);
+    while (g_hash_table_iter_next(&iter, NULL, (void **)&listener)) {
+        qemu_dbus_display1_audio_out_listener_call_set_enabled(
+            listener, (uintptr_t)hw, enable,
+            G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+    }
+}
+
+static void
+dbus_volume_out_listener(HWVoiceOut *hw,
+                         QemuDBusDisplay1AudioOutListener *listener)
+{
+    DBusVoiceOut *vo = container_of(hw, DBusVoiceOut, hw);
+    Volume *vol = &vo->volume;
+    g_autoptr(GBytes) bytes = NULL;
+    GVariant *v_vol = NULL;
+
+    if (!vo->has_volume) {
+        return;
+    }
+
+    assert(vol->channels < sizeof(vol->vol));
+    bytes = g_bytes_new(vol->vol, vol->channels);
+    v_vol = g_variant_new_from_bytes(G_VARIANT_TYPE("ay"), bytes, TRUE);
+    qemu_dbus_display1_audio_out_listener_call_set_volume(
+        listener, (uintptr_t)hw, vol->mute, v_vol,
+        G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+}
+
+static void
+dbus_volume_out(HWVoiceOut *hw, Volume *vol)
+{
+    DBusAudio *da = (DBusAudio *)hw->s->drv_opaque;
+    DBusVoiceOut *vo = container_of(hw, DBusVoiceOut, hw);
+    GHashTableIter iter;
+    QemuDBusDisplay1AudioOutListener *listener = NULL;
+
+    vo->has_volume = true;
+    vo->volume = *vol;
+
+    g_hash_table_iter_init(&iter, da->out_listeners);
+    while (g_hash_table_iter_next(&iter, NULL, (void **)&listener)) {
+        dbus_volume_out_listener(hw, listener);
+    }
+}
+
+static void
+dbus_init_in_listener(QemuDBusDisplay1AudioInListener *listener, HWVoiceIn *hw)
+{
+    qemu_dbus_display1_audio_in_listener_call_init(
+        listener,
+        (uintptr_t)hw,
+        hw->info.bits,
+        hw->info.is_signed,
+        hw->info.is_float,
+        hw->info.freq,
+        hw->info.nchannels,
+        hw->info.bytes_per_frame,
+        hw->info.bytes_per_second,
+        hw->info.swap_endianness ? !AUDIO_HOST_BE : AUDIO_HOST_BE,
+        G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+}
+
+static int
+dbus_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
+{
+    DBusAudio *da = (DBusAudio *)hw->s->drv_opaque;
+    DBusVoiceIn *vo = container_of(hw, DBusVoiceIn, hw);
+    GHashTableIter iter;
+    QemuDBusDisplay1AudioInListener *listener = NULL;
+
+    audio_pcm_init_info(&hw->info, as);
+    hw->samples = DBUS_AUDIO_NSAMPLES;
+    audio_rate_start(&vo->rate);
+
+    g_hash_table_iter_init(&iter, da->in_listeners);
+    while (g_hash_table_iter_next(&iter, NULL, (void **)&listener)) {
+        dbus_init_in_listener(listener, hw);
+    }
+    return 0;
+}
+
+static void
+dbus_fini_in(HWVoiceIn *hw)
+{
+    DBusAudio *da = (DBusAudio *)hw->s->drv_opaque;
+    GHashTableIter iter;
+    QemuDBusDisplay1AudioInListener *listener = NULL;
+
+    g_hash_table_iter_init(&iter, da->in_listeners);
+    while (g_hash_table_iter_next(&iter, NULL, (void **)&listener)) {
+        qemu_dbus_display1_audio_in_listener_call_fini(
+            listener,
+            (uintptr_t)hw,
+            G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+    }
+}
+
+static void
+dbus_volume_in_listener(HWVoiceIn *hw,
+                         QemuDBusDisplay1AudioInListener *listener)
+{
+    DBusVoiceIn *vo = container_of(hw, DBusVoiceIn, hw);
+    Volume *vol = &vo->volume;
+    g_autoptr(GBytes) bytes = NULL;
+    GVariant *v_vol = NULL;
+
+    if (!vo->has_volume) {
+        return;
+    }
+
+    assert(vol->channels < sizeof(vol->vol));
+    bytes = g_bytes_new(vol->vol, vol->channels);
+    v_vol = g_variant_new_from_bytes(G_VARIANT_TYPE("ay"), bytes, TRUE);
+    qemu_dbus_display1_audio_in_listener_call_set_volume(
+        listener, (uintptr_t)hw, vol->mute, v_vol,
+        G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+}
+
+static void
+dbus_volume_in(HWVoiceIn *hw, Volume *vol)
+{
+    DBusAudio *da = (DBusAudio *)hw->s->drv_opaque;
+    DBusVoiceIn *vo = container_of(hw, DBusVoiceIn, hw);
+    GHashTableIter iter;
+    QemuDBusDisplay1AudioInListener *listener = NULL;
+
+    vo->has_volume = true;
+    vo->volume = *vol;
+
+    g_hash_table_iter_init(&iter, da->in_listeners);
+    while (g_hash_table_iter_next(&iter, NULL, (void **)&listener)) {
+        dbus_volume_in_listener(hw, listener);
+    }
+}
+
+static size_t
+dbus_read(HWVoiceIn *hw, void *buf, size_t size)
+{
+    DBusAudio *da = (DBusAudio *)hw->s->drv_opaque;
+    /* DBusVoiceIn *vo = container_of(hw, DBusVoiceIn, hw); */
+    GHashTableIter iter;
+    QemuDBusDisplay1AudioInListener *listener = NULL;
+
+    trace_dbus_audio_read(size);
+
+    /* size = audio_rate_get_bytes(&hw->info, &vo->rate, size); */
+
+    g_hash_table_iter_init(&iter, da->in_listeners);
+    while (g_hash_table_iter_next(&iter, NULL, (void **)&listener)) {
+        g_autoptr(GVariant) v_data = NULL;
+        const char *data;
+        gsize n = 0;
+
+        if (qemu_dbus_display1_audio_in_listener_call_read_sync(
+                listener,
+                (uintptr_t)hw,
+                size,
+                G_DBUS_CALL_FLAGS_NONE, -1,
+                &v_data, NULL, NULL)) {
+            data = g_variant_get_fixed_array(v_data, &n, 1);
+            g_warn_if_fail(n <= size);
+            size = MIN(n, size);
+            memcpy(buf, data, size);
+            break;
+        }
+    }
+
+    return size;
+}
+
+static void
+dbus_enable_in(HWVoiceIn *hw, bool enable)
+{
+    DBusAudio *da = (DBusAudio *)hw->s->drv_opaque;
+    DBusVoiceIn *vo = container_of(hw, DBusVoiceIn, hw);
+    GHashTableIter iter;
+    QemuDBusDisplay1AudioInListener *listener = NULL;
+
+    vo->enabled = enable;
+    if (enable) {
+        audio_rate_start(&vo->rate);
+    }
+
+    g_hash_table_iter_init(&iter, da->in_listeners);
+    while (g_hash_table_iter_next(&iter, NULL, (void **)&listener)) {
+        qemu_dbus_display1_audio_in_listener_call_set_enabled(
+            listener, (uintptr_t)hw, enable,
+            G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+    }
+}
+
+static void *
+dbus_audio_init(Audiodev *dev)
+{
+    DBusAudio *da = g_new0(DBusAudio, 1);
+
+    da->out_listeners = g_hash_table_new_full(g_str_hash, g_str_equal,
+                                                g_free, g_object_unref);
+    da->in_listeners = g_hash_table_new_full(g_str_hash, g_str_equal,
+                                               g_free, g_object_unref);
+    return da;
+}
+
+static void
+dbus_audio_fini(void *opaque)
+{
+    DBusAudio *da = opaque;
+
+    if (da->server) {
+        g_dbus_object_manager_server_unexport(da->server,
+                                              DBUS_DISPLAY1_AUDIO_PATH);
+    }
+    g_clear_object(&da->audio);
+    g_clear_object(&da->iface);
+    g_clear_pointer(&da->in_listeners, g_hash_table_unref);
+    g_clear_pointer(&da->out_listeners, g_hash_table_unref);
+    g_clear_object(&da->server);
+    g_free(da);
+}
+
+static void
+listener_out_vanished_cb(GDBusConnection *connection,
+                         gboolean remote_peer_vanished,
+                         GError *error,
+                         DBusAudio *da)
+{
+    char *name = g_object_get_data(G_OBJECT(connection), "name");
+
+    g_hash_table_remove(da->out_listeners, name);
+}
+
+static void
+listener_in_vanished_cb(GDBusConnection *connection,
+                        gboolean remote_peer_vanished,
+                        GError *error,
+                        DBusAudio *da)
+{
+    char *name = g_object_get_data(G_OBJECT(connection), "name");
+
+    g_hash_table_remove(da->in_listeners, name);
+}
+
+static gboolean
+dbus_audio_register_listener(AudioState *s,
+                             GDBusMethodInvocation *invocation,
+                             GUnixFDList *fd_list,
+                             GVariant *arg_listener,
+                             bool out)
+{
+    DBusAudio *da = s->drv_opaque;
+    const char *sender = g_dbus_method_invocation_get_sender(invocation);
+    g_autoptr(GDBusConnection) listener_conn = NULL;
+    g_autoptr(GError) err = NULL;
+    g_autoptr(GSocket) socket = NULL;
+    g_autoptr(GSocketConnection) socket_conn = NULL;
+    g_autofree char *guid = g_dbus_generate_guid();
+    GHashTable *listeners = out ? da->out_listeners : da->in_listeners;
+    GObject *listener;
+    int fd;
+
+    trace_dbus_audio_register(sender, out ? "out" : "in");
+
+    if (g_hash_table_contains(listeners, sender)) {
+        g_dbus_method_invocation_return_error(invocation,
+                                              DBUS_DISPLAY_ERROR,
+                                              DBUS_DISPLAY_ERROR_INVALID,
+                                              "`%s` is already registered!",
+                                              sender);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    fd = g_unix_fd_list_get(fd_list, g_variant_get_handle(arg_listener), &err);
+    if (err) {
+        g_dbus_method_invocation_return_error(invocation,
+                                              DBUS_DISPLAY_ERROR,
+                                              DBUS_DISPLAY_ERROR_FAILED,
+                                              "Couldn't get peer fd: %s",
+                                              err->message);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    socket = g_socket_new_from_fd(fd, &err);
+    if (err) {
+        g_dbus_method_invocation_return_error(invocation,
+                                              DBUS_DISPLAY_ERROR,
+                                              DBUS_DISPLAY_ERROR_FAILED,
+                                              "Couldn't make a socket: %s",
+                                              err->message);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+    socket_conn = g_socket_connection_factory_create_connection(socket);
+    if (out) {
+        qemu_dbus_display1_audio_complete_register_out_listener(
+            da->iface, invocation, NULL);
+    } else {
+        qemu_dbus_display1_audio_complete_register_in_listener(
+            da->iface, invocation, NULL);
+    }
+
+    listener_conn =
+        g_dbus_connection_new_sync(
+            G_IO_STREAM(socket_conn),
+            guid,
+            G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER,
+            NULL, NULL, &err);
+    if (err) {
+        error_report("Failed to setup peer connection: %s", err->message);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    listener = out ?
+        G_OBJECT(qemu_dbus_display1_audio_out_listener_proxy_new_sync(
+            listener_conn,
+            G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START,
+            NULL,
+            "/org/qemu/Display1/AudioOutListener",
+            NULL,
+            &err)) :
+        G_OBJECT(qemu_dbus_display1_audio_in_listener_proxy_new_sync(
+            listener_conn,
+            G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START,
+            NULL,
+            "/org/qemu/Display1/AudioInListener",
+            NULL,
+            &err));
+    if (!listener) {
+        error_report("Failed to setup proxy: %s", err->message);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    if (out) {
+        HWVoiceOut *hw;
+
+        QLIST_FOREACH(hw, &s->hw_head_out, entries) {
+            DBusVoiceOut *vo = container_of(hw, DBusVoiceOut, hw);
+            QemuDBusDisplay1AudioOutListener *l =
+                QEMU_DBUS_DISPLAY1_AUDIO_OUT_LISTENER(listener);
+
+            dbus_init_out_listener(l, hw);
+            qemu_dbus_display1_audio_out_listener_call_set_enabled(
+                l, (uintptr_t)hw, vo->enabled,
+                G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+        }
+    } else {
+        HWVoiceIn *hw;
+
+        QLIST_FOREACH(hw, &s->hw_head_in, entries) {
+            DBusVoiceIn *vo = container_of(hw, DBusVoiceIn, hw);
+            QemuDBusDisplay1AudioInListener *l =
+                QEMU_DBUS_DISPLAY1_AUDIO_IN_LISTENER(listener);
+
+            dbus_init_in_listener(
+                QEMU_DBUS_DISPLAY1_AUDIO_IN_LISTENER(listener), hw);
+            qemu_dbus_display1_audio_in_listener_call_set_enabled(
+                l, (uintptr_t)hw, vo->enabled,
+                G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+        }
+    }
+
+    g_object_set_data_full(G_OBJECT(listener_conn), "name",
+                           g_strdup(sender), g_free);
+    g_hash_table_insert(listeners, g_strdup(sender), listener);
+    g_object_connect(listener_conn,
+                     "signal::closed",
+                     out ? listener_out_vanished_cb : listener_in_vanished_cb,
+                     da,
+                     NULL);
+
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static gboolean
+dbus_audio_register_out_listener(AudioState *s,
+                                 GDBusMethodInvocation *invocation,
+                                 GUnixFDList *fd_list,
+                                 GVariant *arg_listener)
+{
+    return dbus_audio_register_listener(s, invocation,
+                                        fd_list, arg_listener, true);
+
+}
+
+static gboolean
+dbus_audio_register_in_listener(AudioState *s,
+                                GDBusMethodInvocation *invocation,
+                                GUnixFDList *fd_list,
+                                GVariant *arg_listener)
+{
+    return dbus_audio_register_listener(s, invocation,
+                                        fd_list, arg_listener, false);
+}
+
+static void
+dbus_audio_set_server(AudioState *s, GDBusObjectManagerServer *server)
+{
+    DBusAudio *da = s->drv_opaque;
+
+    g_assert(da);
+    g_assert(!da->server);
+
+    da->server = g_object_ref(server);
+
+    da->audio = g_dbus_object_skeleton_new(DBUS_DISPLAY1_AUDIO_PATH);
+    da->iface = qemu_dbus_display1_audio_skeleton_new();
+    g_object_connect(da->iface,
+                     "swapped-signal::handle-register-in-listener",
+                     dbus_audio_register_in_listener, s,
+                     "swapped-signal::handle-register-out-listener",
+                     dbus_audio_register_out_listener, s,
+                     NULL);
+
+    g_dbus_object_skeleton_add_interface(G_DBUS_OBJECT_SKELETON(da->audio),
+                                         G_DBUS_INTERFACE_SKELETON(da->iface));
+    g_dbus_object_manager_server_export(da->server, da->audio);
+}
+
+static struct audio_pcm_ops dbus_pcm_ops = {
+    .init_out = dbus_init_out,
+    .fini_out = dbus_fini_out,
+    .write    = audio_generic_write,
+    .get_buffer_out = dbus_get_buffer_out,
+    .put_buffer_out = dbus_put_buffer_out,
+    .enable_out = dbus_enable_out,
+    .volume_out = dbus_volume_out,
+
+    .init_in  = dbus_init_in,
+    .fini_in  = dbus_fini_in,
+    .read     = dbus_read,
+    .run_buffer_in = audio_generic_run_buffer_in,
+    .enable_in = dbus_enable_in,
+    .volume_in = dbus_volume_in,
+};
+
+static struct audio_driver dbus_audio_driver = {
+    .name            = "dbus",
+    .descr           = "Timer based audio exposed with DBus interface",
+    .init            = dbus_audio_init,
+    .fini            = dbus_audio_fini,
+    .set_dbus_server = dbus_audio_set_server,
+    .pcm_ops         = &dbus_pcm_ops,
+    .can_be_default  = 1,
+    .max_voices_out  = INT_MAX,
+    .max_voices_in   = INT_MAX,
+    .voice_size_out  = sizeof(DBusVoiceOut),
+    .voice_size_in   = sizeof(DBusVoiceIn)
+};
+
+static void register_audio_dbus(void)
+{
+    audio_driver_register(&dbus_audio_driver);
+}
+type_init(register_audio_dbus);
+
+module_dep("ui-dbus")
diff --git a/ui/dbus.c b/ui/dbus.c
index 847a66782116..d24f704d4662 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -30,6 +30,8 @@
 #include "ui/dbus-module.h"
 #include "ui/egl-helpers.h"
 #include "ui/egl-context.h"
+#include "audio/audio.h"
+#include "audio/audio_int.h"
 #include "qapi/error.h"
 #include "trace.h"
 
@@ -84,6 +86,7 @@ dbus_display_finalize(Object *o)
     g_clear_object(&dd->bus);
     g_clear_object(&dd->iface);
     g_free(dd->dbus_addr);
+    g_free(dd->audiodev);
     dbus_display = NULL;
 }
 
@@ -140,6 +143,19 @@ dbus_display_complete(UserCreatable *uc, Error **errp)
         return;
     }
 
+    if (dd->audiodev && *dd->audiodev) {
+        AudioState *audio_state = audio_state_by_name(dd->audiodev);
+        if (!audio_state) {
+            error_setg(errp, "Audiodev '%s' not found", dd->audiodev);
+            return;
+        }
+        if (!g_str_equal(audio_state->drv->name, "dbus")) {
+            error_setg(errp, "Audiodev '%s' is not compatible with DBus",
+                       dd->audiodev);
+            return;
+        }
+        audio_state->drv->set_dbus_server(audio_state, dd->server);
+    }
 
     consoles = g_array_new(FALSE, FALSE, sizeof(guint32));
     for (idx = 0;; idx++) {
@@ -261,6 +277,23 @@ set_dbus_addr(Object *o, const char *str, Error **errp)
     dd->dbus_addr = g_strdup(str);
 }
 
+static char *
+get_audiodev(Object *o, Error **errp)
+{
+    DBusDisplay *dd = DBUS_DISPLAY(o);
+
+    return g_strdup(dd->audiodev);
+}
+
+static void
+set_audiodev(Object *o, const char *str, Error **errp)
+{
+    DBusDisplay *dd = DBUS_DISPLAY(o);
+
+    g_free(dd->audiodev);
+    dd->audiodev = g_strdup(str);
+}
+
 static int
 get_gl_mode(Object *o, Error **errp)
 {
@@ -285,6 +318,7 @@ dbus_display_class_init(ObjectClass *oc, void *data)
     ucc->complete = dbus_display_complete;
     object_class_property_add_bool(oc, "p2p", get_dbus_p2p, set_dbus_p2p);
     object_class_property_add_str(oc, "addr", get_dbus_addr, set_dbus_addr);
+    object_class_property_add_str(oc, "audiodev", get_audiodev, set_audiodev);
     object_class_property_add_enum(oc, "gl-mode",
                                    "DisplayGLMode", &DisplayGLMode_lookup,
                                    get_gl_mode, set_gl_mode);
@@ -321,6 +355,7 @@ dbus_init(DisplayState *ds, DisplayOptions *opts)
                           object_get_objects_root(),
                           "dbus-display", &error_fatal,
                           "addr", opts->u.dbus.addr ?: "",
+                          "audiodev", opts->u.dbus.audiodev ?: "",
                           "gl-mode", DisplayGLMode_str(mode),
                           "p2p", yes_no(opts->u.dbus.p2p),
                           NULL);
diff --git a/audio/meson.build b/audio/meson.build
index 462533bb8c22..0ac3791d0bd1 100644
--- a/audio/meson.build
+++ b/audio/meson.build
@@ -26,4 +26,10 @@ foreach m : [
   endif
 endforeach
 
+if dbus_display
+    module_ss = ss.source_set()
+    module_ss.add(when: gio, if_true: files('dbusaudio.c'))
+    audio_modules += {'dbus': module_ss}
+endif
+
 modules += {'audio': audio_modules}
diff --git a/audio/trace-events b/audio/trace-events
index 957c92337bee..e1ab643add39 100644
--- a/audio/trace-events
+++ b/audio/trace-events
@@ -13,6 +13,11 @@ alsa_resume_out(void) "Resuming suspended output stream"
 # ossaudio.c
 oss_version(int version) "OSS version = 0x%x"
 
+# dbusaudio.c
+dbus_audio_register(const char *s, const char *dir) "sender = %s, dir = %s"
+dbus_audio_put_buffer_out(size_t len) "len = %zu"
+dbus_audio_read(size_t len) "len = %zu"
+
 # audio.c
 audio_timer_start(int interval) "interval %d ms"
 audio_timer_stop(void) ""
diff --git a/qemu-options.hx b/qemu-options.hx
index 977e0873a12c..7d4751094783 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -659,6 +659,9 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
 #endif
 #ifdef CONFIG_SPICE
     "-audiodev spice,id=id[,prop[=value][,...]]\n"
+#endif
+#ifdef CONFIG_DBUS_DISPLAY
+    "-audiodev dbus,id=id[,prop[=value][,...]]\n"
 #endif
     "-audiodev wav,id=id[,prop[=value][,...]]\n"
     "                path= path of wav file to record\n",
diff --git a/ui/dbus-display1.xml b/ui/dbus-display1.xml
index 0f0ae92e4d57..aff645220c88 100644
--- a/ui/dbus-display1.xml
+++ b/ui/dbus-display1.xml
@@ -375,4 +375,215 @@
       </arg>
     </method>
   </interface>
+
+  <!--
+      org.qemu.Display1.Audio:
+
+      Audio backend may be available on ``/org/qemu/Display1/Audio``.
+  -->
+  <interface name="org.qemu.Display1.Audio">
+    <!--
+        RegisterOutListener:
+        @listener: a Unix socket FD, for peer-to-peer D-Bus communication.
+
+        Register an audio backend playback handler.
+
+        Multiple listeners may be registered simultaneously.
+
+        The listener is expected to implement the
+        :dbus:iface:`org.qemu.Display1.AudioOutListener` interface.
+    -->
+    <method name="RegisterOutListener">
+      <arg type="h" name="listener" direction="in"/>
+    </method>
+
+    <!--
+        RegisterInListener:
+        @listener: a Unix socket FD, for peer-to-peer D-Bus communication.
+
+        Register an audio backend record handler.
+
+        Multiple listeners may be registered simultaneously.
+
+        The listener is expected to implement the
+        :dbus:iface:`org.qemu.Display1.AudioInListener` interface.
+    -->
+    <method name="RegisterInListener">
+      <arg type="h" name="listener" direction="in"/>
+    </method>
+  </interface>
+
+  <!--
+      org.qemu.Display1.AudioOutListener:
+
+      This client-side interface must be available on
+      ``/org/qemu/Display1/AudioOutListener`` when registering the peer-to-peer
+      connection with :dbus:meth:`~org.qemu.Display1.Audio.RegisterOutListener`.
+  -->
+  <interface name="org.qemu.Display1.AudioOutListener">
+    <!--
+        Init:
+        @id: the stream ID.
+        @bits: PCM bits per sample.
+        @is_signed: whether the PCM data is signed.
+        @is_float: PCM floating point format.
+        @freq: the PCM frequency in Hz.
+        @nchannels: the number of channels.
+        @bytes_per_frame: the bytes per frame.
+        @bytes_per_second: the bytes per second.
+        @be: whether using big-endian format.
+
+        Initializes a PCM playback stream.
+    -->
+    <method name="Init">
+      <arg name="id" type="t" direction="in"/>
+      <arg name="bits" type="y" direction="in"/>
+      <arg name="is_signed" type="b" direction="in"/>
+      <arg name="is_float" type="b" direction="in"/>
+      <arg name="freq" type="u" direction="in"/>
+      <arg name="nchannels" type="y" direction="in"/>
+      <arg name="bytes_per_frame" type="u" direction="in"/>
+      <arg name="bytes_per_second" type="u" direction="in"/>
+      <arg name="be" type="b" direction="in"/>
+    </method>
+
+    <!--
+        Fini:
+        @id: the stream ID.
+
+        Finish & close a playback stream.
+    -->
+    <method name="Fini">
+      <arg name="id" type="t" direction="in"/>
+    </method>
+
+    <!--
+        SetEnabled:
+        @id: the stream ID.
+
+        Resume or suspend the playback stream.
+    -->
+    <method name="SetEnabled">
+      <arg name="id" type="t" direction="in"/>
+      <arg name="enabled" type="b" direction="in"/>
+    </method>
+
+    <!--
+        SetVolume:
+        @id: the stream ID.
+        @mute: whether the stream is muted.
+        @volume: the volume per-channel.
+
+        Set the stream volume and mute state (volume without unit, 0-255).
+    -->
+    <method name="SetVolume">
+      <arg name="id" type="t" direction="in"/>
+      <arg name="mute" type="b" direction="in"/>
+      <arg name="volume" type="ay" direction="in">
+        <annotation name="org.gtk.GDBus.C.ForceGVariant" value="true"/>
+      </arg>
+    </method>
+
+    <!--
+        Write:
+        @id: the stream ID.
+        @data: the PCM data.
+
+        PCM stream to play.
+    -->
+    <method name="Write">
+      <arg name="id" type="t" direction="in"/>
+      <arg type="ay" name="data" direction="in">
+        <annotation name="org.gtk.GDBus.C.ForceGVariant" value="true"/>
+      </arg>
+    </method>
+  </interface>
+
+  <!--
+      org.qemu.Display1.AudioInListener:
+
+      This client-side interface must be available on
+      ``/org/qemu/Display1/AudioInListener`` when registering the peer-to-peer
+      connection with :dbus:meth:`~org.qemu.Display1.Audio.RegisterInListener`.
+  -->
+  <interface name="org.qemu.Display1.AudioInListener">
+    <!--
+        Init:
+        @id: the stream ID.
+        @bits: PCM bits per sample.
+        @is_signed: whether the PCM data is signed.
+        @is_float: PCM floating point format.
+        @freq: the PCM frequency in Hz.
+        @nchannels: the number of channels.
+        @bytes_per_frame: the bytes per frame.
+        @bytes_per_second: the bytes per second.
+        @be: whether using big-endian format.
+
+        Initializes a PCM record stream.
+    -->
+    <method name="Init">
+      <arg name="id" type="t" direction="in"/>
+      <arg name="bits" type="y" direction="in"/>
+      <arg name="is_signed" type="b" direction="in"/>
+      <arg name="is_float" type="b" direction="in"/>
+      <arg name="freq" type="u" direction="in"/>
+      <arg name="nchannels" type="y" direction="in"/>
+      <arg name="bytes_per_frame" type="u" direction="in"/>
+      <arg name="bytes_per_second" type="u" direction="in"/>
+      <arg name="be" type="b" direction="in"/>
+    </method>
+
+    <!--
+        Fini:
+        @id: the stream ID.
+
+        Finish & close a record stream.
+    -->
+    <method name="Fini">
+      <arg name="id" type="t" direction="in"/>
+    </method>
+
+    <!--
+        SetEnabled:
+        @id: the stream ID.
+
+        Resume or suspend the record stream.
+    -->
+    <method name="SetEnabled">
+      <arg name="id" type="t" direction="in"/>
+      <arg name="enabled" type="b" direction="in"/>
+    </method>
+
+    <!--
+        SetVolume:
+        @id: the stream ID.
+        @mute: whether the stream is muted.
+        @volume: the volume per-channel.
+
+        Set the stream volume and mute state (volume without unit, 0-255).
+    -->
+    <method name="SetVolume">
+      <arg name="id" type="t" direction="in"/>
+      <arg name="mute" type="b" direction="in"/>
+      <arg name="volume" type="ay" direction="in">
+        <annotation name="org.gtk.GDBus.C.ForceGVariant" value="true"/>
+      </arg>
+    </method>
+
+    <!--
+        Read:
+        @id: the stream ID.
+        @size: the amount to read, in bytes.
+        @data: the recorded data (which may be less than requested).
+
+        Read "size" bytes from the record stream.
+    -->
+    <method name="Read">
+      <arg name="id" type="t" direction="in"/>
+      <arg name="size" type="t" direction="in"/>
+      <arg type="ay" name="data" direction="out">
+        <annotation name="org.gtk.GDBus.C.ForceGVariant" value="true"/>
+      </arg>
+    </method>
+  </interface>
 </node>
-- 
2.34.1.8.g35151cf07204


