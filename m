Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038BD1BE30D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 17:47:36 +0200 (CEST)
Received: from localhost ([::1]:39296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTovv-0006SR-0m
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 11:47:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34550)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1jTot3-0003yK-OE
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 11:44:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1jTosz-00022P-VO
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 11:44:37 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:53116)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1jToXY-0001eT-Rv
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 11:22:25 -0400
Received: from aeryn.lan.ktmba (office.hostfission.com [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTP id D4B554F065;
 Thu, 30 Apr 2020 01:22:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1588173742;
 bh=IsZ51maj3WE2v75EqDamsNq9V/AQu8FiiL46BBh+RYY=;
 h=From:Date:Subject:To:From;
 b=CsQqYulySSpT6B5YGHej71jOd2f8bx8anteUWHVPnZiBtDHenWKWU1MJpk255G5DI
 O/tbdgD50c1dHY8LMXC1C2gyOy1DuXb9cL0/6I4tXS/NxT/n/vBYqm8dv6qdNP0hya
 wYIVWt2c8yD2Rz9E3xT+PjM3IppwE1kq5PhaTqEk=
Received: by aeryn.lan.ktmba (Postfix, from userid 1000)
 id BB4023C1190; Thu, 30 Apr 2020 01:22:22 +1000 (AEST)
From: Geoffrey McRae <geoff@hostfission.com>
Date: Wed, 29 Apr 2020 15:53:58 +1000
Subject: [PATCH v4] audio/jack: add JACK client audiodev
To: <qemu-devel@nongnu.org>
X-Mailer: mail (GNU Mailutils 3.5)
Message-Id: <20200429152222.BB4023C1190@aeryn.lan.ktmba>
Received-SPF: pass client-ip=139.99.139.48; envelope-from=geoff@hostfission.com;
 helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 11:13:45
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Received-From: 139.99.139.48
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit adds a new audiodev backend to allow QEMU to use JACK as
both an audio sink and source.

Signed-off-by: Geoffrey McRae <geoff@hostfission.com>
---
 audio/Makefile.objs    |   5 +
 audio/audio.c          |   1 +
 audio/audio_template.h |   2 +
 audio/jackaudio.c      | 615 +++++++++++++++++++++++++++++++++++++++++
 configure              |  17 ++
 qapi/audio.json        |  52 +++-
 6 files changed, 690 insertions(+), 2 deletions(-)
 create mode 100644 audio/jackaudio.c

diff --git a/audio/Makefile.objs b/audio/Makefile.objs
index d7490a379f..b4a4c11f31 100644
--- a/audio/Makefile.objs
+++ b/audio/Makefile.objs
@@ -28,3 +28,8 @@ common-obj-$(CONFIG_AUDIO_SDL) += sdl.mo
 sdl.mo-objs = sdlaudio.o
 sdl.mo-cflags := $(SDL_CFLAGS)
 sdl.mo-libs := $(SDL_LIBS)
+
+# jack module
+common-obj-$(CONFIG_AUDIO_JACK) += jack.mo
+jack.mo-objs = jackaudio.o
+jack.mo-libs := $(JACK_LIBS)
diff --git a/audio/audio.c b/audio/audio.c
index 7a9e680355..95d9fb16ca 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1969,6 +1969,7 @@ void audio_create_pdos(Audiodev *dev)
         CASE(ALSA, alsa, Alsa);
         CASE(COREAUDIO, coreaudio, Coreaudio);
         CASE(DSOUND, dsound, );
+        CASE(JACK, jack, Jack);
         CASE(OSS, oss, Oss);
         CASE(PA, pa, Pa);
         CASE(SDL, sdl, );
diff --git a/audio/audio_template.h b/audio/audio_template.h
index 7013d3041f..8dd48ce14e 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -330,6 +330,8 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
             dev->u.coreaudio.TYPE);
     case AUDIODEV_DRIVER_DSOUND:
         return dev->u.dsound.TYPE;
+    case AUDIODEV_DRIVER_JACK:
+        return qapi_AudiodevJackPerDirectionOptions_base(dev->u.jack.TYPE);
     case AUDIODEV_DRIVER_OSS:
         return qapi_AudiodevOssPerDirectionOptions_base(dev->u.oss.TYPE);
     case AUDIODEV_DRIVER_PA:
diff --git a/audio/jackaudio.c b/audio/jackaudio.c
new file mode 100644
index 0000000000..a93d361ac4
--- /dev/null
+++ b/audio/jackaudio.c
@@ -0,0 +1,615 @@
+/*
+ * QEMU JACK Audio Connection Kit Client
+ *
+ * Copyright (c) 2020 Geoffrey McRae (gnif)
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
+#include "qemu/module.h"
+#include "qemu/fifo8.h"
+#include "qemu-common.h"
+#include "audio.h"
+
+#define AUDIO_CAP "jack"
+#include "audio_int.h"
+
+#include <stdatomic.h>
+#include <jack/jack.h>
+#include <jack/thread.h>
+
+struct QJack;
+
+typedef enum QJackState {
+  QJACK_STATE_DISCONNECTED,
+  QJACK_STATE_CONNECTED,
+  QJACK_STATE_IDLE,
+  QJACK_STATE_RUNNING,
+  QJACK_STATE_STOPPING,
+  QJACK_STATE_STOPPED,
+}
+QJackState;
+
+typedef struct QJackBuffer {
+  int          channels;
+  int          frames;
+  _Atomic(int) used;
+  int          rptr, wptr;
+  float      **data;
+}
+QJackBuffer;
+
+typedef struct QJackClient {
+  bool            out;
+  QJackState      state;
+  jack_client_t  *client;
+  jack_nframes_t  freq;
+
+  struct QJack   *j;
+  int             nchannels;
+  int             buffersize;
+  jack_port_t   **port;
+  QJackBuffer     fifo;
+}
+QJackClient;
+
+typedef struct QJackOut {
+    HWVoiceOut  hw;
+    QJackClient c;
+}
+QJackOut;
+
+typedef struct QJackIn {
+    HWVoiceIn   hw;
+    QJackClient c;
+}
+QJackIn;
+
+static void qjack_buffer_create(QJackBuffer *buffer, int channels, int frames)
+{
+    buffer->channels = channels;
+    buffer->frames   = frames;
+    buffer->used     = 0;
+    buffer->rptr     = 0;
+    buffer->wptr     = 0;
+    buffer->data     = g_malloc(channels * sizeof(float *));
+    for (int i = 0; i < channels; ++i) {
+        buffer->data[i] = g_malloc(frames * sizeof(float));
+    }
+}
+
+static void qjack_buffer_clear(QJackBuffer *buffer)
+{
+    atomic_store_explicit(&buffer->used, 0, memory_order_relaxed);
+    buffer->rptr = 0;
+    buffer->wptr = 0;
+}
+
+static void qjack_buffer_free(QJackBuffer *buffer)
+{
+    for (int i = 0; i < buffer->channels; ++i) {
+        g_free(buffer->data[i]);
+    }
+
+    g_free(buffer->data);
+    buffer->data = NULL;
+}
+
+static inline int qjack_buffer_used(QJackBuffer *buffer)
+{
+    return atomic_load_explicit(&buffer->used, memory_order_relaxed);
+}
+
+/* write PCM interleaved */
+static int qjack_buffer_write(QJackBuffer *buffer, float *data, int size)
+{
+    const int samples = size / sizeof(float);
+    int frames        = samples / buffer->channels;
+    const int avail   = buffer->frames -
+        atomic_load_explicit(&buffer->used, memory_order_acquire);
+
+    if (frames > avail) {
+        frames = avail;
+    }
+
+    int copy = frames;
+    int wptr = buffer->wptr;
+
+    while (copy) {
+
+        for (int c = 0; c < buffer->channels; ++c) {
+            buffer->data[c][wptr] = *data++;
+        }
+
+        if (++wptr == buffer->frames) {
+            wptr = 0;
+        }
+
+        --copy;
+    }
+
+    buffer->wptr = wptr;
+
+    atomic_fetch_add_explicit(&buffer->used, frames, memory_order_release);
+    return frames * buffer->channels * sizeof(float);
+};
+
+/* write PCM linear */
+static int qjack_buffer_write_l(QJackBuffer *buffer, float **dest, int frames)
+{
+    const int avail   = buffer->frames -
+        atomic_load_explicit(&buffer->used, memory_order_acquire);
+    int wptr = buffer->wptr;
+
+    if (frames > avail) {
+        frames = avail;
+    }
+
+    int right = buffer->frames - wptr;
+    if (right > frames) {
+        right = frames;
+    }
+
+    const int left = frames - right;
+    for (int c = 0; c < buffer->channels; ++c) {
+        memcpy(buffer->data[c] + wptr, dest[c]        , right * sizeof(float));
+        memcpy(buffer->data[c]       , dest[c] + right, left  * sizeof(float));
+    }
+
+    wptr += frames;
+    if (wptr >= buffer->frames) {
+        wptr -= buffer->frames;
+    }
+    buffer->wptr = wptr;
+
+    atomic_fetch_add_explicit(&buffer->used, frames, memory_order_release);
+    return frames;
+}
+
+/* read PCM interleaved */
+static int qjack_buffer_read(QJackBuffer *buffer, float *dest, int size)
+{
+    const int samples = size / sizeof(float);
+    int frames        = samples / buffer->channels;
+    const int avail   =
+        atomic_load_explicit(&buffer->used, memory_order_acquire);
+
+    if (frames > avail) {
+        frames = avail;
+    }
+
+    int copy = frames;
+    int rptr = buffer->rptr;
+
+    while (copy) {
+
+        for (int c = 0; c < buffer->channels; ++c) {
+            *dest++ = buffer->data[c][rptr];
+        }
+
+        if (++rptr == buffer->frames) {
+            rptr = 0;
+        }
+
+        --copy;
+    }
+
+    buffer->rptr = rptr;
+
+    atomic_fetch_sub_explicit(&buffer->used, frames, memory_order_release);
+    return frames * buffer->channels * sizeof(float);
+}
+
+/* read PCM linear */
+static int qjack_buffer_read_l(QJackBuffer *buffer, float **dest, int frames)
+{
+    int copy       = frames;
+    const int used = atomic_load_explicit(&buffer->used, memory_order_acquire);
+    int rptr       = buffer->rptr;
+
+    if (copy > used) {
+        copy = used;
+    }
+
+    int right = buffer->frames - rptr;
+    if (right > copy) {
+        right = copy;
+    }
+
+    const int left = copy - right;
+    for (int c = 0; c < buffer->channels; ++c) {
+        memcpy(dest[c]        , buffer->data[c] + rptr, right * sizeof(float));
+        memcpy(dest[c] + right, buffer->data[c]       , left  * sizeof(float));
+    }
+
+    rptr += copy;
+    if (rptr >= buffer->frames) {
+        rptr -= buffer->frames;
+    }
+    buffer->rptr = rptr;
+
+    atomic_fetch_sub_explicit(&buffer->used, copy, memory_order_release);
+    return copy;
+}
+
+static int qjack_process(jack_nframes_t nframes, void *arg)
+{
+    QJackClient *c = (QJackClient *)arg;
+    jack_transport_state_t ts = jack_transport_query(c->client, NULL);
+
+    if (ts == JackTransportRolling) {
+
+        if (c->state != QJACK_STATE_RUNNING) {
+            return 0;
+        }
+
+        /* get the buffers for the ports */
+        float *buffers[c->nchannels];
+        for (int i = 0; i < c->nchannels; ++i) {
+            buffers[i] = jack_port_get_buffer(c->port[i], nframes);
+        }
+
+        if (c->out) {
+            qjack_buffer_read_l(&c->fifo, buffers, nframes);
+        } else {
+            qjack_buffer_write_l(&c->fifo, buffers, nframes);
+        }
+
+    } else if (ts == JackTransportStopped) {
+
+        if (c->state == QJACK_STATE_RUNNING) {
+            c->state = QJACK_STATE_STOPPED;
+        }
+
+    }
+
+    return 0;
+}
+
+static int qjack_xrun(void *arg)
+{
+    QJackClient *c = (QJackClient *)arg;
+
+    if (c->state != QJACK_STATE_RUNNING) {
+        return 0;
+    }
+
+    qjack_buffer_clear(&c->fifo);
+    return 0;
+}
+
+static void qjack_shutdown(void *arg)
+{
+    QJackClient *c = (QJackClient *)arg;
+
+    switch (c->state) {
+    case QJACK_STATE_RUNNING:
+        jack_transport_stop(c->client);
+        /* fallthrough */
+
+    case QJACK_STATE_STOPPED:
+        /* fallthrough */
+
+    case QJACK_STATE_IDLE:
+        jack_deactivate(c->client);
+        /* fallthrough */
+
+    default:
+        jack_client_close(c->client);
+        c->state = QJACK_STATE_DISCONNECTED;
+        dolog("shutdown\n");
+        break;
+
+    case QJACK_STATE_DISCONNECTED:
+        break;
+    }
+}
+
+static size_t qjack_write(HWVoiceOut *hw, void *buf, size_t len)
+{
+    QJackOut *jo = (QJackOut *)hw;
+
+    if (jo->c.state != QJACK_STATE_RUNNING) {
+        return len;
+    }
+
+    return qjack_buffer_write(&jo->c.fifo, buf, len);
+}
+
+static size_t qjack_read(HWVoiceIn *hw, void *buf, size_t len)
+{
+    QJackIn *ji = (QJackIn *)hw;
+
+    if (ji->c.state != QJACK_STATE_RUNNING) {
+        return len;
+    }
+
+    return qjack_buffer_read(&ji->c.fifo, buf, len);
+}
+
+static int qjack_client_init(QJackClient *c,
+    AudiodevJackPerDirectionOptions *opt, bool out, struct audsettings *as)
+{
+    jack_status_t status;
+    char client_name[jack_client_name_size()];
+    jack_options_t options = JackNullOption;
+
+    c->out = out;
+
+    snprintf(client_name, sizeof(client_name), "%s-%s",
+        out ? "out" : "in",
+        opt->client_name ? opt->client_name : qemu_get_vm_name());
+
+    if (opt->exact_name) {
+        options |= JackUseExactName;
+    }
+
+    if (!opt->start_server) {
+        options |= JackNoStartServer;
+    }
+
+    if (opt->server_name) {
+        options |= JackServerName;
+    }
+
+    c->client = jack_client_open(client_name, options, &status,
+      opt->server_name);
+
+    if (c->client == NULL) {
+        dolog("jack_client_open failed: status = 0x%2.0x\n", status);
+        if (status & JackServerFailed) {
+            dolog("unable to connect to JACK server\n");
+        }
+        return -1;
+    }
+
+    c->freq = jack_get_sample_rate(c->client);
+
+    if (status & JackServerStarted) {
+        dolog("JACK server started\n");
+    }
+
+    if (status & JackNameNotUnique) {
+        dolog("JACK unique name assigned %s\n",
+          jack_get_client_name(c->client));
+    }
+
+    jack_set_process_callback(c->client, qjack_process , c);
+    jack_set_xrun_callback(c->client, qjack_xrun    , c);
+    jack_on_shutdown(c->client, qjack_shutdown, c);
+
+    c->state = QJACK_STATE_CONNECTED;
+
+    /* activate the session */
+    jack_activate(c->client);
+
+    c->nchannels  = as->nchannels;
+    c->buffersize = jack_get_buffer_size(c->client);
+
+    /*
+     * ensure the buffersize is no smaller then 512 samples, some (all?) qemu
+     * virtual devices do not work correctly otherwise
+     */
+    if (c->buffersize < 512) {
+        c->buffersize = 512;
+    }
+
+    /* create a 2 period buffer */
+    qjack_buffer_create(&c->fifo, c->nchannels, c->buffersize * 2);
+
+    /* allocate and register the ports */
+    c->port = g_malloc(sizeof(jack_port_t *) * c->nchannels);
+    for (int i = 0; i < c->nchannels; ++i) {
+
+        char port_name[16];
+        snprintf(
+            port_name,
+            sizeof(port_name),
+            out ? "output %d" : "input %d",
+            i);
+
+        c->port[i] = jack_port_register(
+            c->client,
+            port_name,
+            JACK_DEFAULT_AUDIO_TYPE,
+            out ? JackPortIsOutput : JackPortIsInput,
+            0);
+    }
+
+    c->state = QJACK_STATE_IDLE;
+    return 0;
+}
+
+static int qjack_init_out(HWVoiceOut *hw, struct audsettings *as,
+    void *drv_opaque)
+{
+    QJackOut *jo  = (QJackOut *)hw;
+    Audiodev *dev = (Audiodev *)drv_opaque;
+
+    if (jo->c.state != QJACK_STATE_DISCONNECTED) {
+        return 0;
+    }
+
+    int ret = qjack_client_init(&jo->c, dev->u.jack.out, true, as);
+    if (ret != 0) {
+        return ret;
+    }
+
+    /* report the buffer size to qemu */
+    hw->samples = jo->c.buffersize;
+
+    /* report the audio format we support */
+    struct audsettings os = {
+        .freq       = jo->c.freq,
+        .nchannels  = jo->c.nchannels,
+        .fmt        = AUDIO_FORMAT_F32,
+        .endianness = 0
+    };
+    audio_pcm_init_info(&hw->info, &os);
+
+    dolog("JACK output configured for %dHz (%d samples)\n",
+        jo->c.freq, jo->c.buffersize);
+
+    return 0;
+}
+
+static int qjack_init_in(HWVoiceIn *hw, struct audsettings *as,
+    void *drv_opaque)
+{
+    QJackIn  *ji  = (QJackIn *)hw;
+    Audiodev *dev = (Audiodev *)drv_opaque;
+
+    if (ji->c.state != QJACK_STATE_DISCONNECTED) {
+        return 0;
+    }
+
+    int ret = qjack_client_init(&ji->c, dev->u.jack.in, false, as);
+    if (ret != 0) {
+        return ret;
+    }
+
+    /* report the buffer size to qemu */
+    hw->samples = ji->c.buffersize;
+
+    /* report the audio format we support */
+    struct audsettings is = {
+        .freq       = ji->c.freq,
+        .nchannels  = ji->c.nchannels,
+        .fmt        = AUDIO_FORMAT_F32,
+        .endianness = 0
+    };
+    audio_pcm_init_info(&hw->info, &is);
+
+    dolog("JACK input configured for %dHz (%d samples)\n",
+        ji->c.freq, ji->c.buffersize);
+
+    return 0;
+}
+
+
+static void qjack_client_fini(QJackClient *c)
+{
+    qjack_shutdown(c);
+
+    qjack_buffer_free(&c->fifo);
+    for (int i = 0; i < c->nchannels; ++i) {
+        jack_port_unregister(c->client, c->port[i]);
+    }
+    g_free(c->port);
+}
+
+static void qjack_fini_out(HWVoiceOut *hw)
+{
+    QJackOut *jo = (QJackOut *)hw;
+    qjack_client_fini(&jo->c);
+}
+
+static void qjack_fini_in(HWVoiceIn *hw)
+{
+    QJackIn *ji = (QJackIn *)hw;
+    qjack_client_fini(&ji->c);
+}
+
+static void qjack_enable(QJackClient *c, bool enable)
+{
+    if (c->state != QJACK_STATE_IDLE) {
+        return;
+    }
+
+    if (enable) {
+        jack_transport_start(c->client);
+        c->state = QJACK_STATE_RUNNING;
+    } else {
+        jack_transport_stop(c->client);
+        c->state = QJACK_STATE_IDLE;
+    }
+}
+
+static void qjack_enable_out(HWVoiceOut *hw, bool enable)
+{
+    QJackOut *jo = (QJackOut *)hw;
+    qjack_enable(&jo->c, enable);
+}
+
+static void qjack_enable_in(HWVoiceIn *hw, bool enable)
+{
+    QJackIn *ji = (QJackIn *)hw;
+    qjack_enable(&ji->c, enable);
+}
+
+static int qjack_thread_creator(jack_native_thread_t *thread,
+    const pthread_attr_t *attr, void *(*function)(void *), void *arg)
+{
+    int ret = pthread_create(thread, attr, function, arg);
+    if (ret != 0) {
+        return ret;
+    }
+
+    /* set the name of the thread */
+    pthread_setname_np(*thread, "jack-client");
+
+    return ret;
+}
+
+static void *qjack_init(Audiodev *dev)
+{
+    assert(dev->driver == AUDIODEV_DRIVER_JACK);
+
+    dev->u.jack.has_in = false;
+
+    return dev;
+}
+
+static void qjack_fini(void *opaque)
+{
+}
+
+static struct audio_pcm_ops jack_pcm_ops = {
+    .init_out       = qjack_init_out,
+    .fini_out       = qjack_fini_out,
+    .write          = qjack_write,
+    .run_buffer_out = audio_generic_run_buffer_out,
+    .enable_out     = qjack_enable_out,
+
+    .init_in        = qjack_init_in,
+    .fini_in        = qjack_fini_in,
+    .read           = qjack_read,
+    .enable_in      = qjack_enable_in
+};
+
+static struct audio_driver jack_driver = {
+    .name           = "jack",
+    .descr          = "JACK Audio Connection Kit Client",
+    .init           = qjack_init,
+    .fini           = qjack_fini,
+    .pcm_ops        = &jack_pcm_ops,
+    .can_be_default = 1,
+    .max_voices_out = INT_MAX,
+    .max_voices_in  = INT_MAX,
+    .voice_size_out = sizeof(QJackOut),
+    .voice_size_in  = sizeof(QJackIn)
+};
+
+static void register_audio_jack(void)
+{
+    audio_driver_register(&jack_driver);
+    jack_set_thread_creator(qjack_thread_creator);
+}
+type_init(register_audio_jack);
diff --git a/configure b/configure
index 23b5e93752..004502c775 100755
--- a/configure
+++ b/configure
@@ -3629,6 +3629,22 @@ for drv in $audio_drv_list; do
       oss_libs="$oss_lib"
     ;;
 
+    jack | try-jack)
+    if $pkg_config jack --exists; then
+        jack_libs=$($pkg_config jack --libs)
+        if test "$drv" = "try-jack"; then
+            audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-jack/jack/')
+        fi
+    else
+        if test "$drv" = "try-jack"; then
+            audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-jack//')
+        else
+            error_exit "$drv check failed" \
+                "Make sure to have the $drv libs and headers installed."
+        fi
+    fi
+    ;;
+
     *)
     echo "$audio_possible_drivers" | grep -q "\<$drv\>" || {
         error_exit "Unknown driver '$drv' selected" \
@@ -6904,6 +6920,7 @@ echo "PULSE_LIBS=$pulse_libs" >> $config_host_mak
 echo "COREAUDIO_LIBS=$coreaudio_libs" >> $config_host_mak
 echo "DSOUND_LIBS=$dsound_libs" >> $config_host_mak
 echo "OSS_LIBS=$oss_libs" >> $config_host_mak
+echo "JACK_LIBS=$jack_libs" >> $config_host_mak
 if test "$audio_win_int" = "yes" ; then
   echo "CONFIG_AUDIO_WIN_INT=y" >> $config_host_mak
 fi
diff --git a/qapi/audio.json b/qapi/audio.json
index c31251f45b..8134dc681b 100644
--- a/qapi/audio.json
+++ b/qapi/audio.json
@@ -152,6 +152,51 @@
     '*out':     'AudiodevPerDirectionOptions',
     '*latency': 'uint32' } }
 
+##
+# @AudiodevJackPerDirectionOptions:
+#
+# Options of the JACK backend that are used for both playback and
+# recording.
+#
+# @server-name: select from among several possible concurrent server instances.
+# If unspecified, use "default" unless $JACK_DEFAULT_SERVER is defined in the
+# process environment.
+#
+# @client-name: the client name to use. The server will modify this name to
+# create a unique variant, if needed unless @exact_name is true.
+#
+# @start-server: set to true to start a jack server instance if one is not
+# present.
+#
+# @exact-name: use the exact name requested otherwise JACK automatically
+# generates a unique one, if needed.
+#
+# Since: 5.1
+##
+{ 'struct': 'AudiodevJackPerDirectionOptions',
+  'base': 'AudiodevPerDirectionOptions',
+  'data': {
+    '*server-name':  'str',
+    '*client-name':  'str',
+    '*start-server': 'bool',
+    '*exact-name':   'bool' } }
+
+##
+# @AudiodevJackOptions:
+#
+# Options of the JACK audio backend.
+#
+# @in: options of the capture stream
+#
+# @out: options of the playback stream
+#
+# Since: 5.1
+##
+{ 'struct': 'AudiodevJackOptions',
+  'data': {
+    '*in':  'AudiodevJackPerDirectionOptions',
+    '*out': 'AudiodevJackPerDirectionOptions' } }
+
 ##
 # @AudiodevOssPerDirectionOptions:
 #
@@ -297,11 +342,13 @@
 #
 # An enumeration of possible audio backend drivers.
 #
+# @jack: JACK audio backend (since 5.1)
+#
 # Since: 4.0
 ##
 { 'enum': 'AudiodevDriver',
-  'data': [ 'none', 'alsa', 'coreaudio', 'dsound', 'oss', 'pa', 'sdl',
-            'spice', 'wav' ] }
+  'data': [ 'none', 'alsa', 'coreaudio', 'dsound', 'jack', 'oss', 'pa',
+            'sdl', 'spice', 'wav' ] }
 
 ##
 # @Audiodev:
@@ -327,6 +374,7 @@
     'alsa':      'AudiodevAlsaOptions',
     'coreaudio': 'AudiodevCoreaudioOptions',
     'dsound':    'AudiodevDsoundOptions',
+    'jack':      'AudiodevJackOptions',
     'oss':       'AudiodevOssOptions',
     'pa':        'AudiodevPaOptions',
     'sdl':       'AudiodevGenericOptions',
-- 
2.20.1


