Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837A24787EF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 10:41:09 +0100 (CET)
Received: from localhost ([::1]:41372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my9jg-0007TC-Ls
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 04:41:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex@caoua.org>) id 1my9hT-0006f0-5p
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 04:38:51 -0500
Received: from moule.caoua.org ([109.190.1.44]:64028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <alex@caoua.org>) id 1my9hP-0006FP-2v
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 04:38:50 -0500
Received: from localhost (moule.localdomain [local])
 by moule.localdomain (OpenSMTPD) with ESMTPA id 99934342;
 Fri, 17 Dec 2021 10:38:32 +0100 (CET)
Date: Fri, 17 Dec 2021 10:38:32 +0100
From: Alexandre Ratchov <alex@caoua.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] audio: Add sndio backend
Message-ID: <YbxamMLKHp3IbtlW@moule.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=109.190.1.44; envelope-from=alex@caoua.org;
 helo=moule.caoua.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Brad <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

sndio is the native API used by OpenBSD, although it has been ported to
other *BSD's and Linux (packages for Ubuntu, Debian, Void, Arch, etc.).

Signed-off-by: Brad Smith <brad@comstyle.com>
Signed-off-by: Alexandre Ratchov <alex@caoua.org>
---

Thank you for the reviews and all the comments. Here's a second diff
with all the suggested changes:

- Replace ISC license by SPDX-License-Identifier header
- Fix units (milli- vs micro-) in comment about SNDIO_LATENCY_US
- Drop outdated comment about the "size" argument of sndio_get_buffer_out()
- Fix AUDIO_FORMAT_U32 handling (missing "break" statement)
- Set {read,write] methods to audio_generic_{read,write} (fixes craches)
- Check if backend is enabled in sndio_poll_event()
- Use https://sndio.org in description
- Mark options as available after 7.0 release (instead of 6.2)
- Describe sndio-specific options (dev, latency) in qemu-options.hx
- Add myself as reviewer to MAINTAINERS
- Style fixes: no space after function names, use 4-space indent
- Don't use "return foo()" if foo() returns void
- Include backend to audio_drivers_priority[]

Tested on OpenBSD, works as expected!

 MAINTAINERS            |   5 +
 audio/audio.c          |   1 +
 audio/audio_template.h |   2 +
 audio/meson.build      |   1 +
 audio/sndioaudio.c     | 555 +++++++++++++++++++++++++++++++++++++++++
 meson.build            |   9 +-
 meson_options.txt      |   4 +-
 qapi/audio.json        |  25 +-
 qemu-options.hx        |  16 ++
 tests/vm/freebsd       |   3 +
 10 files changed, 618 insertions(+), 3 deletions(-)
 create mode 100644 audio/sndioaudio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7543eb4d59..76bdad064f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2307,6 +2307,7 @@ X: audio/jackaudio.c
 X: audio/ossaudio.c
 X: audio/paaudio.c
 X: audio/sdlaudio.c
+X: audio/sndio.c
 X: audio/spiceaudio.c
 F: qapi/audio.json
 
@@ -2349,6 +2350,10 @@ R: Thomas Huth <huth@tuxfamily.org>
 S: Odd Fixes
 F: audio/sdlaudio.c
 
+Sndio Audio backend
+R: Alexandre Ratchov <alex@caoua.org>
+F: audio/sndio.c
+
 Block layer core
 M: Kevin Wolf <kwolf@redhat.com>
 M: Hanna Reitz <hreitz@redhat.com>
diff --git a/audio/audio.c b/audio/audio.c
index 54a153c0ef..bad1ceb69e 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -2005,6 +2005,7 @@ void audio_create_pdos(Audiodev *dev)
         CASE(OSS, oss, Oss);
         CASE(PA, pa, Pa);
         CASE(SDL, sdl, Sdl);
+        CASE(SNDIO, sndio, );
         CASE(SPICE, spice, );
         CASE(WAV, wav, );
 
diff --git a/audio/audio_template.h b/audio/audio_template.h
index c6714946aa..ecc5a0bc6d 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -337,6 +337,8 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
         return qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE);
     case AUDIODEV_DRIVER_SDL:
         return qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.TYPE);
+    case AUDIODEV_DRIVER_SNDIO:
+        return dev->u.sndio.TYPE;
     case AUDIODEV_DRIVER_SPICE:
         return dev->u.spice.TYPE;
     case AUDIODEV_DRIVER_WAV:
diff --git a/audio/meson.build b/audio/meson.build
index 462533bb8c..e24c86e7e6 100644
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
diff --git a/audio/sndioaudio.c b/audio/sndioaudio.c
new file mode 100644
index 0000000000..ab2e80decf
--- /dev/null
+++ b/audio/sndioaudio.c
@@ -0,0 +1,555 @@
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
+#include "qemu-common.h"
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
+ * return a buffer where data to play can be stored
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
+    .init_out       = sndio_init_out,
+    .fini_out       = sndio_fini_out,
+    .enable_out     = sndio_enable_out,
+    .write          = audio_generic_write,
+    .get_buffer_out = sndio_get_buffer_out,
+    .put_buffer_out = sndio_put_buffer_out,
+    .init_in        = sndio_init_in,
+    .fini_in        = sndio_fini_in,
+    .read           = audio_generic_read,
+    .enable_in      = sndio_enable_in,
+    .get_buffer_in  = sndio_get_buffer_in,
+    .put_buffer_in  = sndio_put_buffer_in,
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
diff --git a/meson.build b/meson.build
index 96de1a6ef9..92dc9e3973 100644
--- a/meson.build
+++ b/meson.build
@@ -554,6 +554,11 @@ if not get_option('jack').auto() or have_system
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
@@ -1311,6 +1316,7 @@ if have_system
     'oss': oss.found(),
     'pa': pulse.found(),
     'sdl': sdl.found(),
+    'sndio': sndio.found(),
   }
   foreach k, v: audio_drivers_available
     config_host_data.set('CONFIG_AUDIO_' + k.to_upper(), v)
@@ -1318,7 +1324,7 @@ if have_system
 
   # Default to native drivers first, OSS second, SDL third
   audio_drivers_priority = \
-    [ 'pa', 'coreaudio', 'dsound', 'oss' ] + \
+    [ 'pa', 'coreaudio', 'dsound', 'sndio', 'oss' ] + \
     (targetos == 'linux' ? [] : [ 'sdl' ])
   audio_drivers_default = []
   foreach k: audio_drivers_priority
@@ -3385,6 +3391,7 @@ if vnc.found()
 endif
 if targetos not in ['darwin', 'haiku', 'windows']
   summary_info += {'OSS support':     oss}
+  summary_info += {'sndio support':   sndio}
 elif targetos == 'darwin'
   summary_info += {'CoreAudio support': coreaudio}
 elif targetos == 'windows'
diff --git a/meson_options.txt b/meson_options.txt
index e392323732..7334ced291 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -13,7 +13,7 @@ option('sphinx_build', type : 'string', value : '',
 option('default_devices', type : 'boolean', value : true,
        description: 'Include a default selection of devices in emulators')
 option('audio_drv_list', type: 'array', value: ['default'],
-       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'sdl'],
+       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'sdl', 'sndio'],
        description: 'Set audio driver list')
 option('fuzzing_engine', type : 'string', value : '',
        description: 'fuzzing engine library for OSS-Fuzz')
@@ -184,6 +184,8 @@ option('oss', type: 'feature', value: 'auto',
        description: 'OSS sound support')
 option('pa', type: 'feature', value: 'auto',
        description: 'PulseAudio sound support')
+option('sndio', type: 'feature', value: 'auto',
+       description: 'sndio sound support')
 
 option('vhost_user_blk_server', type: 'feature', value: 'auto',
        description: 'build vhost-user-blk server')
diff --git a/qapi/audio.json b/qapi/audio.json
index 9cba0df8a4..b97a6de3be 100644
--- a/qapi/audio.json
+++ b/qapi/audio.json
@@ -105,6 +105,28 @@
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
+# Since: 7.0
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
   'data': [ 'none', 'alsa', 'coreaudio', 'dsound', 'jack', 'oss', 'pa',
-            'sdl', 'spice', 'wav' ] }
+            'sdl', 'sndio', 'spice', 'wav' ] }
 
 ##
 # @Audiodev:
@@ -417,5 +439,6 @@
     'oss':       'AudiodevOssOptions',
     'pa':        'AudiodevPaOptions',
     'sdl':       'AudiodevSdlOptions',
+    'sndio':     'AudiodevSndioOptions',
     'spice':     'AudiodevGenericOptions',
     'wav':       'AudiodevWavOptions' } }
diff --git a/qemu-options.hx b/qemu-options.hx
index ae2c6dbbfc..699c7c42bf 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -657,6 +657,9 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
     "-audiodev sdl,id=id[,prop[=value][,...]]\n"
     "                in|out.buffer-count= number of buffers\n"
 #endif
+#ifdef CONFIG_AUDIO_SNDIO
+    "-audiodev sndio,id=id[,prop[=value][,...]]\n"
+#endif
 #ifdef CONFIG_SPICE
     "-audiodev spice,id=id[,prop[=value][,...]]\n"
 #endif
@@ -820,6 +823,19 @@ SRST
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
diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 6e20e84322..a387f5c9df 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -63,6 +63,9 @@ class FreeBSDVM(basevm.BaseVM):
 
         # libs: migration
         "zstd",
+
+        # libs: sndio
+        "sndio",
     ]
 
     # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
-- 
2.34.0


