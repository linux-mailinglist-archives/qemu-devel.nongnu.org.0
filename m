Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48295EA05F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:36:52 +0200 (CEST)
Received: from localhost ([::1]:39610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oclTn-0007ap-V6
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpu-0005fR-Pi
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpr-0003oJ-Hr
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IaAIzLnv6j0oElP8sw877kHAdtnTXggNHIKJP/nbolc=;
 b=ieATp5igfroibtWHigMt13yCB9LkpyqZndtuJsjyJ/naq2gFnwBijLHyEM1OjahF2OF19r
 cEkY+IDJ7MPlHraurebr+5S5fxalCZ3Eu/5dVvcZriGK4+NEEzhLNHMrrhdjlhp6alQwLv
 AoX7loLeNaY2fq6W6tcEC/qBE5nElRc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-GHJKgt-oPj-9BdvGQzSM_Q-1; Mon, 26 Sep 2022 05:55:31 -0400
X-MC-Unique: GHJKgt-oPj-9BdvGQzSM_Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F12573810781;
 Mon, 26 Sep 2022 09:55:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AFD4492CA2;
 Mon, 26 Sep 2022 09:55:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3DE8D180A403; Mon, 26 Sep 2022 11:55:11 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexandre Ratchov <alex@caoua.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 21/25] audio: Add sndio backend
Date: Mon, 26 Sep 2022 11:55:05 +0200
Message-Id: <20220926095509.3759409-22-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexandre Ratchov <alex@caoua.org>

sndio is the native API used by OpenBSD, although it has been ported to
other *BSD's and Linux (packages for Ubuntu, Debian, Void, Arch, etc.).

Signed-off-by: Brad Smith <brad@comstyle.com>
Signed-off-by: Alexandre Ratchov <alex@caoua.org>
Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>
Tested-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <YxibXrWsrS3XYQM3@vm1.arverb.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson_options.txt             |   4 +-
 audio/audio_template.h        |   2 +
 audio/audio.c                 |   1 +
 audio/sndioaudio.c            | 565 ++++++++++++++++++++++++++++++++++
 MAINTAINERS                   |   7 +
 audio/meson.build             |   1 +
 meson.build                   |   9 +-
 qapi/audio.json               |  25 +-
 qemu-options.hx               |  16 +
 scripts/meson-buildoptions.sh |   7 +-
 10 files changed, 632 insertions(+), 5 deletions(-)
 create mode 100644 audio/sndioaudio.c

diff --git a/meson_options.txt b/meson_options.txt
index 63f072517427..9df9e86d7d35 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -21,7 +21,7 @@ option('tls_priority', type : 'string', value : 'NORMAL',
 option('default_devices', type : 'boolean', value : true,
        description: 'Include a default selection of devices in emulators')
 option('audio_drv_list', type: 'array', value: ['default'],
-       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'sdl'],
+       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'sdl', 'sndio'],
        description: 'Set audio driver list')
 option('block_drv_rw_whitelist', type : 'string', value : '',
        description: 'set block driver read-write whitelist (by default affects only QEMU, not tools like qemu-img)')
@@ -240,6 +240,8 @@ option('oss', type: 'feature', value: 'auto',
        description: 'OSS sound support')
 option('pa', type: 'feature', value: 'auto',
        description: 'PulseAudio sound support')
+option('sndio', type: 'feature', value: 'auto',
+       description: 'sndio sound support')
 
 option('vhost_kernel', type: 'feature', value: 'auto',
        description: 'vhost kernel backend support')
diff --git a/audio/audio_template.h b/audio/audio_template.h
index 7192b19e7390..81860cea6202 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -336,6 +336,8 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
         return qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE);
     case AUDIODEV_DRIVER_SDL:
         return qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.TYPE);
+    case AUDIODEV_DRIVER_SNDIO:
+        return dev->u.sndio.TYPE;
     case AUDIODEV_DRIVER_SPICE:
         return dev->u.spice.TYPE;
     case AUDIODEV_DRIVER_WAV:
diff --git a/audio/audio.c b/audio/audio.c
index cfa4119c0598..5600593da043 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -2030,6 +2030,7 @@ void audio_create_pdos(Audiodev *dev)
         CASE(OSS, oss, Oss);
         CASE(PA, pa, Pa);
         CASE(SDL, sdl, Sdl);
+        CASE(SNDIO, sndio, );
         CASE(SPICE, spice, );
         CASE(WAV, wav, );
 
diff --git a/audio/sndioaudio.c b/audio/sndioaudio.c
new file mode 100644
index 000000000000..7c45276d36ce
--- /dev/null
+++ b/audio/sndioaudio.c
@@ -0,0 +1,565 @@
+/*
+ * SPDX-License-Identifier: ISC
+ *
+ * Copyright (c) 2019 Alexandre Ratchov <alex@caoua.org>
+ */
+
+/*
+ * TODO :
+ *
+ * Use a single device and open it in full-duplex rather than
+ * opening it twice (once for playback once for recording).
+ *
+ * This is the only way to ensure that playback doesn't drift with respect
+ * to recording, which is what guest systems expect.
+ */
+
+#include <poll.h>
+#include <sndio.h>
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "audio.h"
+#include "trace.h"
+
+#define AUDIO_CAP "sndio"
+#include "audio_int.h"
+
+/* default latency in microseconds if no option is set */
+#define SNDIO_LATENCY_US   50000
+
+typedef struct SndioVoice {
+    union {
+        HWVoiceOut out;
+        HWVoiceIn in;
+    } hw;
+    struct sio_par par;
+    struct sio_hdl *hdl;
+    struct pollfd *pfds;
+    struct pollindex {
+        struct SndioVoice *self;
+        int index;
+    } *pindexes;
+    unsigned char *buf;
+    size_t buf_size;
+    size_t sndio_pos;
+    size_t qemu_pos;
+    unsigned int mode;
+    unsigned int nfds;
+    bool enabled;
+} SndioVoice;
+
+typedef struct SndioConf {
+    const char *devname;
+    unsigned int latency;
+} SndioConf;
+
+/* needed for forward reference */
+static void sndio_poll_in(void *arg);
+static void sndio_poll_out(void *arg);
+
+/*
+ * stop polling descriptors
+ */
+static void sndio_poll_clear(SndioVoice *self)
+{
+    struct pollfd *pfd;
+    int i;
+
+    for (i = 0; i < self->nfds; i++) {
+        pfd = &self->pfds[i];
+        qemu_set_fd_handler(pfd->fd, NULL, NULL, NULL);
+    }
+
+    self->nfds = 0;
+}
+
+/*
+ * write data to the device until it blocks or
+ * all of our buffered data is written
+ */
+static void sndio_write(SndioVoice *self)
+{
+    size_t todo, n;
+
+    todo = self->qemu_pos - self->sndio_pos;
+
+    /*
+     * transfer data to device, until it blocks
+     */
+    while (todo > 0) {
+        n = sio_write(self->hdl, self->buf + self->sndio_pos, todo);
+        if (n == 0) {
+            break;
+        }
+        self->sndio_pos += n;
+        todo -= n;
+    }
+
+    if (self->sndio_pos == self->buf_size) {
+        /*
+         * we complete the block
+         */
+        self->sndio_pos = 0;
+        self->qemu_pos = 0;
+    }
+}
+
+/*
+ * read data from the device until it blocks or
+ * there no room any longer
+ */
+static void sndio_read(SndioVoice *self)
+{
+    size_t todo, n;
+
+    todo = self->buf_size - self->sndio_pos;
+
+    /*
+     * transfer data from the device, until it blocks
+     */
+    while (todo > 0) {
+        n = sio_read(self->hdl, self->buf + self->sndio_pos, todo);
+        if (n == 0) {
+            break;
+        }
+        self->sndio_pos += n;
+        todo -= n;
+    }
+}
+
+/*
+ * Set handlers for all descriptors libsndio needs to
+ * poll
+ */
+static void sndio_poll_wait(SndioVoice *self)
+{
+    struct pollfd *pfd;
+    int events, i;
+
+    events = 0;
+    if (self->mode == SIO_PLAY) {
+        if (self->sndio_pos < self->qemu_pos) {
+            events |= POLLOUT;
+        }
+    } else {
+        if (self->sndio_pos < self->buf_size) {
+            events |= POLLIN;
+        }
+    }
+
+    /*
+     * fill the given array of descriptors with the events sndio
+     * wants, they are different from our 'event' variable because
+     * sndio may use descriptors internally.
+     */
+    self->nfds = sio_pollfd(self->hdl, self->pfds, events);
+
+    for (i = 0; i < self->nfds; i++) {
+        pfd = &self->pfds[i];
+        if (pfd->fd < 0) {
+            continue;
+        }
+        qemu_set_fd_handler(pfd->fd,
+            (pfd->events & POLLIN) ? sndio_poll_in : NULL,
+            (pfd->events & POLLOUT) ? sndio_poll_out : NULL,
+            &self->pindexes[i]);
+        pfd->revents = 0;
+    }
+}
+
+/*
+ * call-back called when one of the descriptors
+ * became readable or writable
+ */
+static void sndio_poll_event(SndioVoice *self, int index, int event)
+{
+    int revents;
+
+    /*
+     * ensure we're not called twice this cycle
+     */
+    sndio_poll_clear(self);
+
+    /*
+     * make self->pfds[] look as we're returning from poll syscal,
+     * this is how sio_revents expects events to be.
+     */
+    self->pfds[index].revents = event;
+
+    /*
+     * tell sndio to handle events and return whether we can read or
+     * write without blocking.
+     */
+    revents = sio_revents(self->hdl, self->pfds);
+    if (self->mode == SIO_PLAY) {
+        if (revents & POLLOUT) {
+            sndio_write(self);
+        }
+
+        if (self->qemu_pos < self->buf_size) {
+            audio_run(self->hw.out.s, "sndio_out");
+        }
+    } else {
+        if (revents & POLLIN) {
+            sndio_read(self);
+        }
+
+        if (self->qemu_pos < self->sndio_pos) {
+            audio_run(self->hw.in.s, "sndio_in");
+        }
+    }
+
+    /*
+     * audio_run() may have changed state
+     */
+    if (self->enabled) {
+        sndio_poll_wait(self);
+    }
+}
+
+/*
+ * return the upper limit of the amount of free play buffer space
+ */
+static size_t sndio_buffer_get_free(HWVoiceOut *hw)
+{
+    SndioVoice *self = (SndioVoice *) hw;
+
+    return self->buf_size - self->qemu_pos;
+}
+
+/*
+ * return a buffer where data to play can be stored,
+ * its size is stored in the location pointed by the size argument.
+ */
+static void *sndio_get_buffer_out(HWVoiceOut *hw, size_t *size)
+{
+    SndioVoice *self = (SndioVoice *) hw;
+
+    *size = self->buf_size - self->qemu_pos;
+    return self->buf + self->qemu_pos;
+}
+
+/*
+ * put back to sndio back-end a buffer returned by sndio_get_buffer_out()
+ */
+static size_t sndio_put_buffer_out(HWVoiceOut *hw, void *buf, size_t size)
+{
+    SndioVoice *self = (SndioVoice *) hw;
+
+    self->qemu_pos += size;
+    sndio_poll_wait(self);
+    return size;
+}
+
+/*
+ * return a buffer from where recorded data is available,
+ * its size is stored in the location pointed by the size argument.
+ * it may not exceed the initial value of "*size".
+ */
+static void *sndio_get_buffer_in(HWVoiceIn *hw, size_t *size)
+{
+    SndioVoice *self = (SndioVoice *) hw;
+    size_t todo, max_todo;
+
+    /*
+     * unlike the get_buffer_out() method, get_buffer_in()
+     * must return a buffer of at most the given size, see audio.c
+     */
+    max_todo = *size;
+
+    todo = self->sndio_pos - self->qemu_pos;
+    if (todo > max_todo) {
+        todo = max_todo;
+    }
+
+    *size = todo;
+    return self->buf + self->qemu_pos;
+}
+
+/*
+ * discard the given amount of recorded data
+ */
+static void sndio_put_buffer_in(HWVoiceIn *hw, void *buf, size_t size)
+{
+    SndioVoice *self = (SndioVoice *) hw;
+
+    self->qemu_pos += size;
+    if (self->qemu_pos == self->buf_size) {
+        self->qemu_pos = 0;
+        self->sndio_pos = 0;
+    }
+    sndio_poll_wait(self);
+}
+
+/*
+ * call-back called when one of our descriptors becomes writable
+ */
+static void sndio_poll_out(void *arg)
+{
+    struct pollindex *pindex = (struct pollindex *) arg;
+
+    sndio_poll_event(pindex->self, pindex->index, POLLOUT);
+}
+
+/*
+ * call-back called when one of our descriptors becomes readable
+ */
+static void sndio_poll_in(void *arg)
+{
+    struct pollindex *pindex = (struct pollindex *) arg;
+
+    sndio_poll_event(pindex->self, pindex->index, POLLIN);
+}
+
+static void sndio_fini(SndioVoice *self)
+{
+    if (self->hdl) {
+        sio_close(self->hdl);
+        self->hdl = NULL;
+    }
+
+    g_free(self->pfds);
+    g_free(self->pindexes);
+    g_free(self->buf);
+}
+
+static int sndio_init(SndioVoice *self,
+                      struct audsettings *as, int mode, Audiodev *dev)
+{
+    AudiodevSndioOptions *opts = &dev->u.sndio;
+    unsigned long long latency;
+    const char *dev_name;
+    struct sio_par req;
+    unsigned int nch;
+    int i, nfds;
+
+    dev_name = opts->has_dev ? opts->dev : SIO_DEVANY;
+    latency = opts->has_latency ? opts->latency : SNDIO_LATENCY_US;
+
+    /* open the device in non-blocking mode */
+    self->hdl = sio_open(dev_name, mode, 1);
+    if (self->hdl == NULL) {
+        dolog("failed to open device\n");
+        return -1;
+    }
+
+    self->mode = mode;
+
+    sio_initpar(&req);
+
+    switch (as->fmt) {
+    case AUDIO_FORMAT_S8:
+        req.bits = 8;
+        req.sig = 1;
+        break;
+    case AUDIO_FORMAT_U8:
+        req.bits = 8;
+        req.sig = 0;
+        break;
+    case AUDIO_FORMAT_S16:
+        req.bits = 16;
+        req.sig = 1;
+        break;
+    case AUDIO_FORMAT_U16:
+        req.bits = 16;
+        req.sig = 0;
+        break;
+    case AUDIO_FORMAT_S32:
+        req.bits = 32;
+        req.sig = 1;
+        break;
+    case AUDIO_FORMAT_U32:
+        req.bits = 32;
+        req.sig = 0;
+        break;
+    default:
+        dolog("unknown audio sample format\n");
+        return -1;
+    }
+
+    if (req.bits > 8) {
+        req.le = as->endianness ? 0 : 1;
+    }
+
+    req.rate = as->freq;
+    if (mode == SIO_PLAY) {
+        req.pchan = as->nchannels;
+    } else {
+        req.rchan = as->nchannels;
+    }
+
+    /* set on-device buffer size */
+    req.appbufsz = req.rate * latency / 1000000;
+
+    if (!sio_setpar(self->hdl, &req)) {
+        dolog("failed set audio params\n");
+        goto fail;
+    }
+
+    if (!sio_getpar(self->hdl, &self->par)) {
+        dolog("failed get audio params\n");
+        goto fail;
+    }
+
+    nch = (mode == SIO_PLAY) ? self->par.pchan : self->par.rchan;
+
+    /*
+     * With the default setup, sndio supports any combination of parameters
+     * so these checks are mostly to catch configuration errors.
+     */
+    if (self->par.bits != req.bits || self->par.bps != req.bits / 8 ||
+        self->par.sig != req.sig || (req.bits > 8 && self->par.le != req.le) ||
+        self->par.rate != as->freq || nch != as->nchannels) {
+        dolog("unsupported audio params\n");
+        goto fail;
+    }
+
+    /*
+     * we use one block as buffer size; this is how
+     * transfers get well aligned
+     */
+    self->buf_size = self->par.round * self->par.bps * nch;
+
+    self->buf = g_malloc(self->buf_size);
+    if (self->buf == NULL) {
+        dolog("failed to allocate audio buffer\n");
+        goto fail;
+    }
+
+    nfds = sio_nfds(self->hdl);
+
+    self->pfds = g_malloc_n(nfds, sizeof(struct pollfd));
+    if (self->pfds == NULL) {
+        dolog("failed to allocate pollfd structures\n");
+        goto fail;
+    }
+
+    self->pindexes = g_malloc_n(nfds, sizeof(struct pollindex));
+    if (self->pindexes == NULL) {
+        dolog("failed to allocate pollindex structures\n");
+        goto fail;
+    }
+
+    for (i = 0; i < nfds; i++) {
+        self->pindexes[i].self = self;
+        self->pindexes[i].index = i;
+    }
+
+    return 0;
+fail:
+    sndio_fini(self);
+    return -1;
+}
+
+static void sndio_enable(SndioVoice *self, bool enable)
+{
+    if (enable) {
+        sio_start(self->hdl);
+        self->enabled = true;
+        sndio_poll_wait(self);
+    } else {
+        self->enabled = false;
+        sndio_poll_clear(self);
+        sio_stop(self->hdl);
+    }
+}
+
+static void sndio_enable_out(HWVoiceOut *hw, bool enable)
+{
+    SndioVoice *self = (SndioVoice *) hw;
+
+    sndio_enable(self, enable);
+}
+
+static void sndio_enable_in(HWVoiceIn *hw, bool enable)
+{
+    SndioVoice *self = (SndioVoice *) hw;
+
+    sndio_enable(self, enable);
+}
+
+static int sndio_init_out(HWVoiceOut *hw, struct audsettings *as, void *opaque)
+{
+    SndioVoice *self = (SndioVoice *) hw;
+
+    if (sndio_init(self, as, SIO_PLAY, opaque) == -1) {
+        return -1;
+    }
+
+    audio_pcm_init_info(&hw->info, as);
+    hw->samples = self->par.round;
+    return 0;
+}
+
+static int sndio_init_in(HWVoiceIn *hw, struct audsettings *as, void *opaque)
+{
+    SndioVoice *self = (SndioVoice *) hw;
+
+    if (sndio_init(self, as, SIO_REC, opaque) == -1) {
+        return -1;
+    }
+
+    audio_pcm_init_info(&hw->info, as);
+    hw->samples = self->par.round;
+    return 0;
+}
+
+static void sndio_fini_out(HWVoiceOut *hw)
+{
+    SndioVoice *self = (SndioVoice *) hw;
+
+    sndio_fini(self);
+}
+
+static void sndio_fini_in(HWVoiceIn *hw)
+{
+    SndioVoice *self = (SndioVoice *) hw;
+
+    sndio_fini(self);
+}
+
+static void *sndio_audio_init(Audiodev *dev)
+{
+    assert(dev->driver == AUDIODEV_DRIVER_SNDIO);
+    return dev;
+}
+
+static void sndio_audio_fini(void *opaque)
+{
+}
+
+static struct audio_pcm_ops sndio_pcm_ops = {
+    .init_out        = sndio_init_out,
+    .fini_out        = sndio_fini_out,
+    .enable_out      = sndio_enable_out,
+    .write           = audio_generic_write,
+    .buffer_get_free = sndio_buffer_get_free,
+    .get_buffer_out  = sndio_get_buffer_out,
+    .put_buffer_out  = sndio_put_buffer_out,
+    .init_in         = sndio_init_in,
+    .fini_in         = sndio_fini_in,
+    .read            = audio_generic_read,
+    .enable_in       = sndio_enable_in,
+    .get_buffer_in   = sndio_get_buffer_in,
+    .put_buffer_in   = sndio_put_buffer_in,
+};
+
+static struct audio_driver sndio_audio_driver = {
+    .name           = "sndio",
+    .descr          = "sndio https://sndio.org",
+    .init           = sndio_audio_init,
+    .fini           = sndio_audio_fini,
+    .pcm_ops        = &sndio_pcm_ops,
+    .can_be_default = 1,
+    .max_voices_out = INT_MAX,
+    .max_voices_in  = INT_MAX,
+    .voice_size_out = sizeof(SndioVoice),
+    .voice_size_in  = sizeof(SndioVoice)
+};
+
+static void register_audio_sndio(void)
+{
+    audio_driver_register(&sndio_audio_driver);
+}
+
+type_init(register_audio_sndio);
diff --git a/MAINTAINERS b/MAINTAINERS
index 738c4eb647c8..269e07cf4777 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2438,6 +2438,7 @@ X: audio/jackaudio.c
 X: audio/ossaudio.c
 X: audio/paaudio.c
 X: audio/sdlaudio.c
+X: audio/sndioaudio.c
 X: audio/spiceaudio.c
 F: qapi/audio.json
 
@@ -2482,6 +2483,12 @@ R: Thomas Huth <huth@tuxfamily.org>
 S: Odd Fixes
 F: audio/sdlaudio.c
 
+Sndio Audio backend
+M: Gerd Hoffmann <kraxel@redhat.com>
+R: Alexandre Ratchov <alex@caoua.org>
+S: Odd Fixes
+F: audio/sndioaudio.c
+
 Block layer core
 M: Kevin Wolf <kwolf@redhat.com>
 M: Hanna Reitz <hreitz@redhat.com>
diff --git a/audio/meson.build b/audio/meson.build
index 3abee908602a..34aed7834223 100644
--- a/audio/meson.build
+++ b/audio/meson.build
@@ -17,6 +17,7 @@ foreach m : [
   ['pa', pulse, files('paaudio.c')],
   ['sdl', sdl, files('sdlaudio.c')],
   ['jack', jack, files('jackaudio.c')],
+  ['sndio', sndio, files('sndioaudio.c')],
   ['spice', spice, files('spiceaudio.c')]
 ]
   if m[1].found()
diff --git a/meson.build b/meson.build
index d9ac91ff3659..13db89c65af1 100644
--- a/meson.build
+++ b/meson.build
@@ -675,6 +675,11 @@ if not get_option('jack').auto() or have_system
   jack = dependency('jack', required: get_option('jack'),
                     method: 'pkg-config', kwargs: static_kwargs)
 endif
+sndio = not_found
+if not get_option('sndio').auto() or have_system
+  sndio = dependency('sndio', required: get_option('sndio'),
+                    method: 'pkg-config', kwargs: static_kwargs)
+endif
 
 spice_protocol = not_found
 if not get_option('spice_protocol').auto() or have_system
@@ -1591,6 +1596,7 @@ if have_system
     'oss': oss.found(),
     'pa': pulse.found(),
     'sdl': sdl.found(),
+    'sndio': sndio.found(),
   }
   foreach k, v: audio_drivers_available
     config_host_data.set('CONFIG_AUDIO_' + k.to_upper(), v)
@@ -1598,7 +1604,7 @@ if have_system
 
   # Default to native drivers first, OSS second, SDL third
   audio_drivers_priority = \
-    [ 'pa', 'coreaudio', 'dsound', 'oss' ] + \
+    [ 'pa', 'coreaudio', 'dsound', 'sndio', 'oss' ] + \
     (targetos == 'linux' ? [] : [ 'sdl' ])
   audio_drivers_default = []
   foreach k: audio_drivers_priority
@@ -3922,6 +3928,7 @@ if vnc.found()
 endif
 if targetos not in ['darwin', 'haiku', 'windows']
   summary_info += {'OSS support':     oss}
+  summary_info += {'sndio support':   sndio}
 elif targetos == 'darwin'
   summary_info += {'CoreAudio support': coreaudio}
 elif targetos == 'windows'
diff --git a/qapi/audio.json b/qapi/audio.json
index 8099e3d7f13b..1e0a24bdfc40 100644
--- a/qapi/audio.json
+++ b/qapi/audio.json
@@ -106,6 +106,28 @@
     '*out':       'AudiodevAlsaPerDirectionOptions',
     '*threshold': 'uint32' } }
 
+##
+# @AudiodevSndioOptions:
+#
+# Options of the sndio audio backend.
+#
+# @in: options of the capture stream
+#
+# @out: options of the playback stream
+#
+# @dev: the name of the sndio device to use (default 'default')
+#
+# @latency: play buffer size (in microseconds)
+#
+# Since: 7.2
+##
+{ 'struct': 'AudiodevSndioOptions',
+  'data': {
+    '*in':        'AudiodevPerDirectionOptions',
+    '*out':       'AudiodevPerDirectionOptions',
+    '*dev':       'str',
+    '*latency':   'uint32'} }
+
 ##
 # @AudiodevCoreaudioPerDirectionOptions:
 #
@@ -387,7 +409,7 @@
 ##
 { 'enum': 'AudiodevDriver',
   'data': [ 'none', 'alsa', 'coreaudio', 'dbus', 'dsound', 'jack', 'oss', 'pa',
-            'sdl', 'spice', 'wav' ] }
+            'sdl', 'sndio', 'spice', 'wav' ] }
 
 ##
 # @Audiodev:
@@ -418,5 +440,6 @@
     'oss':       'AudiodevOssOptions',
     'pa':        'AudiodevPaOptions',
     'sdl':       'AudiodevSdlOptions',
+    'sndio':     'AudiodevSndioOptions',
     'spice':     'AudiodevGenericOptions',
     'wav':       'AudiodevWavOptions' } }
diff --git a/qemu-options.hx b/qemu-options.hx
index d8b5ce5b4354..2ff06884f42d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -769,6 +769,9 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
     "-audiodev sdl,id=id[,prop[=value][,...]]\n"
     "                in|out.buffer-count= number of buffers\n"
 #endif
+#ifdef CONFIG_AUDIO_SNDIO
+    "-audiodev sndio,id=id[,prop[=value][,...]]\n"
+#endif
 #ifdef CONFIG_SPICE
     "-audiodev spice,id=id[,prop[=value][,...]]\n"
 #endif
@@ -935,6 +938,19 @@ SRST
     ``in|out.buffer-count=count``
         Sets the count of the buffers.
 
+``-audiodev sndio,id=id[,prop[=value][,...]]``
+    Creates a backend using SNDIO. This backend is available on
+    OpenBSD and most other Unix-like systems.
+
+    Sndio specific options are:
+
+    ``in|out.dev=device``
+        Specify the sndio device to use for input and/or output. Default
+        is ``default``.
+
+    ``in|out.latency=usecs``
+        Sets the desired period length in microseconds.
+
 ``-audiodev spice,id=id[,prop[=value][,...]]``
     Creates a backend that sends audio through SPICE. This backend
     requires ``-spice`` and automatically selected in that case, so
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 359b04e0e6d3..f08e3a8a7e02 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -1,7 +1,7 @@
 # This file is generated by meson-buildoptions.py, do not edit!
 meson_options_help() {
-  printf "%s\n" '  --audio-drv-list=CHOICES Set audio driver list [default] (choices:'
-  printf "%s\n" '                           alsa/coreaudio/default/dsound/jack/oss/pa/sdl)'
+  printf "%s\n" '  --audio-drv-list=CHOICES Set audio driver list [default] (choices: alsa/co'
+  printf "%s\n" '                           reaudio/default/dsound/jack/oss/pa/sdl/sndio)'
   printf "%s\n" '  --block-drv-ro-whitelist=VALUE'
   printf "%s\n" '                           set block driver read-only whitelist (by default'
   printf "%s\n" '                           affects only QEMU, not tools like qemu-img)'
@@ -144,6 +144,7 @@ meson_options_help() {
   printf "%s\n" '  slirp-smbd      use smbd (at path --smbd=*) in slirp networking'
   printf "%s\n" '  smartcard       CA smartcard emulation support'
   printf "%s\n" '  snappy          snappy compression support'
+  printf "%s\n" '  sndio           sndio sound support'
   printf "%s\n" '  sparse          sparse checker'
   printf "%s\n" '  spice           Spice server support'
   printf "%s\n" '  spice-protocol  Spice protocol support'
@@ -393,6 +394,8 @@ _meson_option_parse() {
     --disable-smartcard) printf "%s" -Dsmartcard=disabled ;;
     --enable-snappy) printf "%s" -Dsnappy=enabled ;;
     --disable-snappy) printf "%s" -Dsnappy=disabled ;;
+    --enable-sndio) printf "%s" -Dsndio=enabled ;;
+    --disable-sndio) printf "%s" -Dsndio=disabled ;;
     --enable-sparse) printf "%s" -Dsparse=enabled ;;
     --disable-sparse) printf "%s" -Dsparse=disabled ;;
     --sphinx-build=*) quote_sh "-Dsphinx_build=$2" ;;
-- 
2.37.3


