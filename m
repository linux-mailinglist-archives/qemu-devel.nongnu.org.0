Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB0B44F40E
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 16:56:43 +0100 (CET)
Received: from localhost ([::1]:47136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlvOT-000795-R4
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 10:56:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mlvNB-0006PC-5m
 for qemu-devel@nongnu.org; Sat, 13 Nov 2021 10:55:21 -0500
Received: from mailout01.t-online.de ([194.25.134.80]:43484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mlvN2-00050u-At
 for qemu-devel@nongnu.org; Sat, 13 Nov 2021 10:55:19 -0500
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout01.t-online.de (Postfix) with SMTP id D1E8E6FC1;
 Sat, 13 Nov 2021 16:55:08 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd71.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mlvMr-2lqBur0; Sat, 13 Nov 2021 16:55:01 +0100
Message-ID: <eb4a76b8-77e5-7ff4-40c4-ac55026cc0c2@t-online.de>
Date: Sat, 13 Nov 2021 16:55:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH] audio: Add sndio backend
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
References: <YYdh3l1HTh+kpONa@humpty.home.comstyle.com>
Content-Language: en-US
In-Reply-To: <YYdh3l1HTh+kpONa@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1636818901-00001441-EA836EB5/0/0 CLEAN NORMAL
X-TOI-MSGID: 121da8f6-b3f1-417a-82af-14e769a38ed2
Received-SPF: none client-ip=194.25.134.80; envelope-from=vr_qemu@t-online.de;
 helo=mailout01.t-online.de
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.852, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Brad,

> audio: Add sndio backend
>
> Add a sndio backend.
>
> sndio is the native API used by OpenBSD, although it has been ported to
> other *BSD's and Linux (packages for Ubuntu, Debian, Void, Arch, etc.).
>
> The C code is from Alexandre Ratchov<alex@caoua.org>  and the rest of
> the bits are from me.
> ---
>   audio/audio.c          |   1 +
>   audio/audio_template.h |   2 +
>   audio/meson.build      |   1 +
>   audio/sndioaudio.c     | 555 +++++++++++++++++++++++++++++++++++++++++
>   meson.build            |   7 +
>   meson_options.txt      |   4 +-
>   qapi/audio.json        |  25 +-
>   qemu-options.hx        |   8 +
>   tests/vm/freebsd       |   3 +
>   9 files changed, 604 insertions(+), 2 deletions(-)
>   create mode 100644 audio/sndioaudio.c
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 54a153c0ef..bad1ceb69e 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -2005,6 +2005,7 @@ void audio_create_pdos(Audiodev *dev)
>           CASE(OSS, oss, Oss);
>           CASE(PA, pa, Pa);
>           CASE(SDL, sdl, Sdl);
> +        CASE(SNDIO, sndio, );
>           CASE(SPICE, spice, );
>           CASE(WAV, wav, );
>   
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index c6714946aa..ecc5a0bc6d 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -337,6 +337,8 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
>           return qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE);
>       case AUDIODEV_DRIVER_SDL:
>           return qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.TYPE);
> +    case AUDIODEV_DRIVER_SNDIO:
> +        return dev->u.sndio.TYPE;
>       case AUDIODEV_DRIVER_SPICE:
>           return dev->u.spice.TYPE;
>       case AUDIODEV_DRIVER_WAV:
> diff --git a/audio/meson.build b/audio/meson.build
> index 462533bb8c..e24c86e7e6 100644
> --- a/audio/meson.build
> +++ b/audio/meson.build
> @@ -17,6 +17,7 @@ foreach m : [
>     ['pa', pulse, files('paaudio.c')],
>     ['sdl', sdl, files('sdlaudio.c')],
>     ['jack', jack, files('jackaudio.c')],
> +  ['sndio', sndio, files('sndioaudio.c')],
>     ['spice', spice, files('spiceaudio.c')]
>   ]
>     if m[1].found()
> diff --git a/audio/sndioaudio.c b/audio/sndioaudio.c
> new file mode 100644
> index 0000000000..204af07781
> --- /dev/null
> +++ b/audio/sndioaudio.c
> @@ -0,0 +1,555 @@
> +/*
> + * Copyright (c) 2019 Alexandre Ratchov<alex@caoua.org>
> + *
> + * Permission to use, copy, modify, and distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
> + * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
> + * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
> + * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
> + * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
> + * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
> + * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
> + */
> +
> +/*
> + * TODO :
> + *
> + * Use a single device and open it in full-duplex rather than
> + * opening it twice (once for playback once for recording).
> + *
> + * This is the only way to ensure that playback doesn't drift with respect
> + * to recording, which is what guest systems expect.
> + */
> +
> +#include <poll.h>
> +#include <sndio.h>
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "qemu/main-loop.h"
> +#include "audio.h"
> +#include "trace.h"
> +
> +#define AUDIO_CAP "sndio"
> +#include "audio_int.h"
> +
> +/* default latency in ms if no option is set */
> +#define SNDIO_LATENCY_US   50000
> +
> +typedef struct SndioVoice {
> +    union {
> +        HWVoiceOut out;
> +        HWVoiceIn in;
> +    } hw;
> +    struct sio_par par;
> +    struct sio_hdl *hdl;
> +    struct pollfd *pfds;
> +    struct pollindex {
> +        struct SndioVoice *self;
> +        int index;
> +    } *pindexes;
> +    unsigned char *buf;
> +    size_t buf_size;
> +    size_t sndio_pos;
> +    size_t qemu_pos;
> +    unsigned int mode;
> +    unsigned int nfds;
> +} SndioVoice;
> +
> +typedef struct SndioConf {
> +    const char *devname;
> +    unsigned int latency;
> +} SndioConf;
> +
> +/* needed for forward reference */
> +static void sndio_poll_in(void *arg);
> +static void sndio_poll_out(void *arg);
> +
> +/*
> + * stop polling descriptors
> + */
> +static void sndio_poll_clear(SndioVoice *self)
> +{
> +    struct pollfd *pfd;
> +    int i;
> +
> +    for (i = 0; i < self->nfds; i++) {
> +        pfd = &self->pfds[i];
> +        qemu_set_fd_handler (pfd->fd, NULL, NULL, NULL);
> +    }
> +
> +    self->nfds = 0;
> +}
> +
> +/*
> + * write data to the device until it blocks or
> + * all of our buffered data is written
> + */
> +static void sndio_write(SndioVoice *self)
> +{
> +    size_t todo, n;
> +
> +    todo = self->qemu_pos - self->sndio_pos;
> +
> +    /*
> +     * transfer data to device, until it blocks
> +     */
> +    while (todo > 0) {
> +        n = sio_write(self->hdl, self->buf + self->sndio_pos, todo);
> +        if (n == 0) {
> +            break;
> +        }
> +        self->sndio_pos += n;
> +        todo -= n;
> +    }
> +
> +    if (self->sndio_pos == self->buf_size) {
> +        /*
> +         * we complete the block
> +         */
> +        self->sndio_pos = 0;
> +        self->qemu_pos = 0;
> +    }
> +}
> +
> +/*
> + * read data from the device until it blocks or
> + * there no room any longer
> + */
> +static void sndio_read(SndioVoice *self)
> +{
> +    size_t todo, n;
> +
> +    todo = self->buf_size - self->sndio_pos;
> +
> +    /*
> +     * transfer data from the device, until it blocks
> +     */
> +    while (todo > 0) {
> +        n = sio_read(self->hdl, self->buf + self->sndio_pos, todo);
> +        if (n == 0) {
> +            break;
> +        }
> +        self->sndio_pos += n;
> +        todo -= n;
> +    }
> +}
> +
> +/*
> + * Set handlers for all descriptors libsndio needs to
> + * poll
> + */
> +static void sndio_poll_wait(SndioVoice *self)
> +{
> +    struct pollfd *pfd;
> +    int events, i;
> +
> +    events = 0;
> +    if (self->mode == SIO_PLAY) {
> +        if (self->sndio_pos < self->qemu_pos) {
> +            events |= POLLOUT;
> +        }
> +    } else {
> +        if (self->sndio_pos < self->buf_size) {
> +            events |= POLLIN;
> +        }
> +    }
> +
> +    /*
> +     * fill the given array of descriptors with the events sndio
> +     * wants, they are different from our 'event' variable because
> +     * sndio may use descriptors internally.
> +     */
> +    self->nfds = sio_pollfd(self->hdl, self->pfds, events);
> +
> +    for (i = 0; i < self->nfds; i++) {
> +        pfd = &self->pfds[i];
> +        if (pfd->fd < 0) {
> +                continue;
> +        }
> +        qemu_set_fd_handler(pfd->fd,
> +                (pfd->events & POLLIN) ? sndio_poll_in : NULL,
> +                (pfd->events & POLLOUT) ? sndio_poll_out : NULL,
> +                &self->pindexes[i]);
> +        pfd->revents = 0;
> +    }
> +}
> +
> +/*
> + * call-back called when one of the descriptors
> + * became readable or writable
> + */
> +static void sndio_poll_event(SndioVoice *self, int index, int event)
> +{
> +    int revents;
> +
> +    /*
> +     * ensure we're not called twice this cycle
> +     */
> +    sndio_poll_clear(self);
> +
> +    /*
> +     * make self->pfds[] look as we're returning from poll syscal,
> +     * this is how sio_revents expects events to be.
> +     */
> +    self->pfds[index].revents = event;
> +
> +    /*
> +     * tell sndio to handle events and return whether we can read or
> +     * write without blocking.
> +     */
> +    revents = sio_revents(self->hdl, self->pfds);
> +    if (self->mode == SIO_PLAY) {
> +        if (revents & POLLOUT) {
> +            sndio_write(self);
> +        }
> +
> +        if (self->qemu_pos < self->buf_size) {
> +            audio_run(self->hw.out.s, "sndio_out");
> +        }
> +    } else {
> +        if (revents & POLLIN) {
> +            sndio_read(self);
> +        }
> +
> +        if (self->qemu_pos < self->sndio_pos) {
> +            audio_run(self->hw.in.s, "sndio_in");
> +        }
> +    }
> +
> +    sndio_poll_wait(self);
> +}
> +
> +/*
> + * return a buffer where data to play can be stored,
> + * its size is stored in the location pointed by the size argument.
> + */
> +static void *sndio_get_buffer_out(HWVoiceOut *hw, size_t *size)
> +{
> +    SndioVoice *self = (SndioVoice *) hw;
> +
> +    /* size is not set by the caller */

This is an outdated comment. Size is set by the caller, but the backend 
is still free to ignore the size.

> +    *size = self->buf_size - self->qemu_pos;
> +    return self->buf + self->qemu_pos;
> +}
> +
> +/*
> + * return a buffer where data to play can be stored
> + */
> +static size_t sndio_put_buffer_out(HWVoiceOut *hw, void *buf, size_t size)
> +{
> +    SndioVoice *self = (SndioVoice *) hw;
> +
> +    self->qemu_pos += size;
> +    sndio_poll_wait(self);
> +    return size;
> +}
> +
> +/*
> + * return a buffer from where recorded data is available,
> + * its size is stored in the location pointed by the size argument.
> + * it may not exceed the initial value of "*size".
> + */
> +static void *sndio_get_buffer_in(HWVoiceIn *hw, size_t *size)
> +{
> +    SndioVoice *self = (SndioVoice *) hw;
> +    size_t todo, max_todo;
> +
> +    /*
> +     * unlike the get_buffer_out() method, get_buffer_in()
> +     * must return a buffer of at most the given size, see audio.c
> +     */
> +    max_todo = *size;
> +
> +    todo = self->sndio_pos - self->qemu_pos;
> +    if (todo > max_todo) {
> +        todo = max_todo;
> +    }
> +
> +    *size = todo;
> +    return self->buf + self->qemu_pos;
> +}
> +
> +/*
> + * discard the given amount of recorded data
> + */
> +static void sndio_put_buffer_in(HWVoiceIn *hw, void *buf, size_t size)
> +{
> +    SndioVoice *self = (SndioVoice *) hw;
> +
> +    self->qemu_pos += size;
> +    if (self->qemu_pos == self->buf_size) {
> +        self->qemu_pos = 0;
> +        self->sndio_pos = 0;
> +    }
> +    sndio_poll_wait(self);
> +}
> +
> +/*
> + * call-back called when one of our descriptors becomes writable
> + */
> +static void sndio_poll_out(void *arg)
> +{
> +    struct pollindex *pindex = (struct pollindex *) arg;
> +
> +    sndio_poll_event(pindex->self, pindex->index, POLLOUT);
> +}
> +
> +/*
> + * call-back called when one of our descriptors becomes readable
> + */
> +static void sndio_poll_in(void *arg)
> +{
> +    struct pollindex *pindex = (struct pollindex *) arg;
> +
> +    sndio_poll_event(pindex->self, pindex->index, POLLIN);
> +}
> +
> +static void sndio_fini(SndioVoice *self)
> +{
> +    if (self->hdl) {
> +        sio_close(self->hdl);
> +        self->hdl = NULL;
> +    }
> +
> +    g_free(self->pfds);
> +    g_free(self->pindexes);
> +    g_free(self->buf);
> +}
> +
> +static int sndio_init(SndioVoice *self,
> +                      struct audsettings *as, int mode, Audiodev *dev)
> +{
> +    AudiodevSndioOptions *opts = &dev->u.sndio;
> +    unsigned long long latency;
> +    const char *dev_name;
> +    struct sio_par req;
> +    unsigned int nch;
> +    int i, nfds;
> +
> +    dev_name = opts->has_dev ? opts->dev : SIO_DEVANY;
> +    latency = opts->has_latency ? opts->latency : SNDIO_LATENCY_US;
> +
> +    /* open the device in non-blocking mode */
> +    self->hdl = sio_open(dev_name, mode, 1);
> +    if (self->hdl == NULL) {
> +        dolog("failed to open device\n");
> +        return -1;
> +    }
> +
> +    self->mode = mode;
> +
> +    sio_initpar(&req);
> +
> +    switch (as->fmt) {
> +    case AUDIO_FORMAT_S8:
> +        req.bits = 8;
> +        req.sig = 1;
> +        break;
> +    case AUDIO_FORMAT_U8:
> +        req.bits = 8;
> +        req.sig = 0;
> +        break;
> +    case AUDIO_FORMAT_S16:
> +        req.bits = 16;
> +        req.sig = 1;
> +        break;
> +    case AUDIO_FORMAT_U16:
> +        req.bits = 16;
> +        req.sig = 0;
> +        break;
> +    case AUDIO_FORMAT_S32:
> +        req.bits = 32;
> +        req.sig = 1;
> +        break;
> +    case AUDIO_FORMAT_U32:
> +        req.bits = 32;
> +        req.sig = 0;

../qemu-master/audio/sndioaudio.c: In function ‘sndio_init’:
../qemu-master/audio/sndioaudio.c:369:17: error: this statement may fall 
through [-Werror=implicit-fallthrough=]
          req.sig = 0;
          ~~~~~~~~^~~
../qemu-master/audio/sndioaudio.c:370:5: note: here
      default:
      ^~~~~~~
cc1: all warnings being treated as errors

> +    default:
> +        dolog("unknown audio sample format\n");
> +        return -1;
> +    }
> +
> +    if (req.bits > 8) {
> +        req.le = as->endianness ? 0 : 1;
> +    }
> +
> +    req.rate = as->freq;
> +    if (mode == SIO_PLAY) {
> +            req.pchan = as->nchannels;
> +    } else {
> +            req.rchan = as->nchannels;
> +    }
> +
> +    /* set on-device buffer size */
> +    req.appbufsz = req.rate * latency / 1000000;
> +
> +    if (!sio_setpar(self->hdl, &req)) {
> +        dolog("failed set audio params\n");
> +        goto fail;
> +    }
> +
> +    if (!sio_getpar(self->hdl, &self->par)) {
> +        dolog("failed get audio params\n");
> +        goto fail;
> +    }
> +
> +    nch = (mode == SIO_PLAY) ? self->par.pchan : self->par.rchan;
> +
> +    /*
> +     * With the default setup, sndio supports any combination of parameters
> +     * so these checks are mostly to catch configuration errors.
> +     */
> +    if (self->par.bits != req.bits || self->par.bps != req.bits / 8 ||
> +        self->par.sig != req.sig || (req.bits > 8 && self->par.le != req.le) ||
> +        self->par.rate != as->freq || nch != as->nchannels) {
> +        dolog("unsupported audio params\n");
> +        goto fail;
> +    }
> +
> +    /*
> +     * we use one block as buffer size; this is how
> +     * transfers get well aligned
> +     */
> +    self->buf_size = self->par.round * self->par.bps * nch;
> +
> +    self->buf = g_malloc(self->buf_size);
> +    if (self->buf == NULL) {
> +        dolog("failed to allocate audio buffer\n");
> +        goto fail;
> +    }
> +
> +    nfds = sio_nfds(self->hdl);
> +
> +    self->pfds = g_malloc_n(nfds, sizeof(struct pollfd));
> +    if (self->pfds == NULL) {
> +        dolog("failed to allocate pollfd structures\n");
> +        goto fail;
> +    }
> +
> +    self->pindexes = g_malloc_n(nfds, sizeof(struct pollindex));
> +    if (self->pindexes == NULL) {
> +        dolog("failed to allocate pollindex structures\n");
> +        goto fail;
> +    }
> +
> +    for (i = 0; i < nfds; i++) {
> +        self->pindexes[i].self = self;
> +        self->pindexes[i].index = i;
> +    }
> +
> +    return 0;
> +fail:
> +    sndio_fini(self);
> +    return -1;
> +}
> +
> +static void sndio_enable(SndioVoice *self, bool enable)
> +{
> +    if (enable) {
> +        sio_start(self->hdl);
> +        sndio_poll_wait(self);
> +    } else {
> +        sndio_poll_clear(self);
> +        sio_stop(self->hdl);
> +    }
> +}
> +
> +static void sndio_enable_out(HWVoiceOut *hw, bool enable)
> +{
> +    SndioVoice *self = (SndioVoice *) hw;
> +
> +    return sndio_enable(self, enable);
> +}
> +
> +static void sndio_enable_in(HWVoiceIn *hw, bool enable)
> +{
> +    SndioVoice *self = (SndioVoice *) hw;
> +
> +    return sndio_enable(self, enable);
> +}
> +
> +static int sndio_init_out(HWVoiceOut *hw, struct audsettings *as, void *opaque)
> +{
> +    SndioVoice *self = (SndioVoice *) hw;
> +
> +    if (sndio_init(self, as, SIO_PLAY, opaque) == -1) {
> +        return -1;
> +    }
> +
> +    audio_pcm_init_info(&hw->info, as);
> +    hw->samples = self->par.round;
> +    return 0;
> +}
> +
> +static int sndio_init_in(HWVoiceIn *hw, struct audsettings *as, void *opaque)
> +{
> +    SndioVoice *self = (SndioVoice *) hw;
> +
> +    if (sndio_init(self, as, SIO_REC, opaque) == -1) {
> +        return -1;
> +    }
> +
> +    audio_pcm_init_info(&hw->info, as);
> +    hw->samples = self->par.round;
> +    return 0;
> +}
> +
> +static void sndio_fini_out(HWVoiceOut *hw)
> +{
> +    SndioVoice *self = (SndioVoice *) hw;
> +
> +    return sndio_fini(self);
> +}
> +
> +static void sndio_fini_in(HWVoiceIn *hw)
> +{
> +    SndioVoice *self = (SndioVoice *) hw;
> +
> +    return sndio_fini(self);
> +}
> +
> +static void *sndio_audio_init(Audiodev *dev)
> +{
> +    assert(dev->driver == AUDIODEV_DRIVER_SNDIO);
> +    return dev;
> +}
> +
> +static void sndio_audio_fini(void *opaque)
> +{
> +}
> +
> +static struct audio_pcm_ops sndio_pcm_ops = {
> +    .init_out       = sndio_init_out,
> +    .fini_out       = sndio_fini_out,

+    .write          = audio_generic_write,

> +    .enable_out     = sndio_enable_out,
> +    .get_buffer_out = sndio_get_buffer_out,
> +    .put_buffer_out = sndio_put_buffer_out,
> +    .init_in        = sndio_init_in,
> +    .fini_in        = sndio_fini_in,

+    .read           = audio_generic_read,

With . write = NULL and .read = NULL and -audiodev 
sndio,id=audio0,in.mixing-engine=off,out.mixing-engine=off you will see
Program terminated with signal SIGSEGV, Segmentation fault.

> +    .enable_in      = sndio_enable_in,
> +    .get_buffer_in  = sndio_get_buffer_in,
> +    .put_buffer_in  = sndio_put_buffer_in,
> +};
> +
> +static struct audio_driver sndio_audio_driver = {
> +    .name           = "sndio",
> +    .descr          ="https://man.openbsd.org/sndio",
> +    .init           = sndio_audio_init,
> +    .fini           = sndio_audio_fini,
> +    .pcm_ops        = &sndio_pcm_ops,
> +    .can_be_default = 1,
> +    .max_voices_out = INT_MAX,
> +    .max_voices_in  = INT_MAX,
> +    .voice_size_out = sizeof(SndioVoice),
> +    .voice_size_in  = sizeof(SndioVoice)
> +};
> +
> +static void register_audio_sndio(void)
> +{
> +    audio_driver_register(&sndio_audio_driver);
> +}
> +
> +type_init(register_audio_sndio);
> diff --git a/meson.build b/meson.build
> index 47df10afc2..551e8e3549 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -546,6 +546,11 @@ if not get_option('jack').auto() or have_system
>     jack = dependency('jack', required: get_option('jack'),
>                       method: 'pkg-config', kwargs: static_kwargs)
>   endif
> +sndio = not_found
> +if not get_option('sndio').auto() or have_system
> +  sndio = dependency('sndio', required: get_option('sndio'),
> +                    method: 'pkg-config', kwargs: static_kwargs)
> +endif
>   
>   spice_protocol = not_found
>   if not get_option('spice_protocol').auto() or have_system
> @@ -1301,6 +1306,7 @@ if have_system
>       'oss': oss.found(),
>       'pa': pulse.found(),
>       'sdl': sdl.found(),
> +    'sndio': sndio.found(),
>     }
>     foreach k, v: audio_drivers_available
>       config_host_data.set('CONFIG_AUDIO_' + k.to_upper(), v)
> @@ -3367,6 +3373,7 @@ if vnc.found()
>   endif
>   if targetos not in ['darwin', 'haiku', 'windows']
>     summary_info += {'OSS support':     oss}
> +  summary_info += {'sndio support':   sndio}
>   elif targetos == 'darwin'
>     summary_info += {'CoreAudio support': coreaudio}
>   elif targetos == 'windows'
> diff --git a/meson_options.txt b/meson_options.txt
> index e740dce2a5..0f67c0a27b 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -13,7 +13,7 @@ option('sphinx_build', type : 'string', value : '',
>   option('default_devices', type : 'boolean', value : true,
>          description: 'Include a default selection of devices in emulators')
>   option('audio_drv_list', type: 'array', value: ['default'],
> -       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'sdl'],
> +       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'sdl', 'sndio'],
>          description: 'Set audio driver list')
>   option('fuzzing_engine', type : 'string', value : '',
>          description: 'fuzzing engine library for OSS-Fuzz')
> @@ -184,6 +184,8 @@ option('oss', type: 'feature', value: 'auto',
>          description: 'OSS sound support')
>   option('pa', type: 'feature', value: 'auto',
>          description: 'PulseAudio sound support')
> +option('sndio', type: 'feature', value: 'auto',
> +       description: 'sndio sound support')
>   
>   option('vhost_user_blk_server', type: 'feature', value: 'auto',
>          description: 'build vhost-user-blk server')
> diff --git a/qapi/audio.json b/qapi/audio.json
> index 9cba0df8a4..99c5c68ba6 100644
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -105,6 +105,28 @@
>       '*out':       'AudiodevAlsaPerDirectionOptions',
>       '*threshold': 'uint32' } }
>   
> +##
> +# @AudiodevSndioOptions:
> +#
> +# Options of the sndio audio backend.
> +#
> +# @in: options of the capture stream
> +#
> +# @out: options of the playback stream
> +#
> +# @dev: the name of the sndio device to use (default 'default')
> +#
> +# @latency: play buffer size (in microseconds)
> +#
> +# Since: 6.2

I don't think this patch will be accepted for 6.2. See 
https://wiki.qemu.org/Planning/6.2
Since: 7.0 is probably correct.

> +##
> +{ 'struct': 'AudiodevSndioOptions',
> +  'data': {
> +    '*in':        'AudiodevPerDirectionOptions',
> +    '*out':       'AudiodevPerDirectionOptions',
> +    '*dev':       'str',
> +    '*latency':   'uint32'} }
> +
>   ##
>   # @AudiodevCoreaudioPerDirectionOptions:
>   #
> @@ -387,7 +409,7 @@
>   ##
>   { 'enum': 'AudiodevDriver',
>     'data': [ 'none', 'alsa', 'coreaudio', 'dsound', 'jack', 'oss', 'pa',
> -            'sdl', 'spice', 'wav' ] }
> +            'sdl', 'sndio', 'spice', 'wav' ] }
>   
>   ##
>   # @Audiodev:
> @@ -417,5 +439,6 @@
>       'oss':       'AudiodevOssOptions',
>       'pa':        'AudiodevPaOptions',
>       'sdl':       'AudiodevSdlOptions',
> +    'sndio':     'AudiodevSndioOptions',
>       'spice':     'AudiodevGenericOptions',
>       'wav':       'AudiodevWavOptions' } }
> diff --git a/qemu-options.hx b/qemu-options.hx
> index f051536b63..4a027b1abc 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -657,6 +657,9 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
>       "-audiodev sdl,id=id[,prop[=value][,...]]\n"
>       "                in|out.buffer-count= number of buffers\n"
>   #endif
> +#ifdef CONFIG_AUDIO_SNDIO
> +    "-audiodev sndio,id=id[,prop[=value][,...]]\n"
> +#endif
>   #ifdef CONFIG_SPICE
>       "-audiodev spice,id=id[,prop[=value][,...]]\n"
>   #endif
> @@ -820,6 +823,11 @@ SRST
>       ``in|out.buffer-count=count``
>           Sets the count of the buffers.
>   
> +``-audiodev sndio,id=id[,prop[=value][,...]]``
> +    Creates a backend using SNDIO. This backend is available on
> +    OpenBSD and most other Unix-like systems. This backend has no
> +    backend specific properties.

The properties latency and dev are backend specific properties.

> +
>   ``-audiodev spice,id=id[,prop[=value][,...]]``
>       Creates a backend that sends audio through SPICE. This backend
>       requires ``-spice`` and automatically selected in that case, so
> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> index 6e20e84322..a387f5c9df 100755
> --- a/tests/vm/freebsd
> +++ b/tests/vm/freebsd
> @@ -63,6 +63,9 @@ class FreeBSDVM(basevm.BaseVM):
>   
>           # libs: migration
>           "zstd",
> +
> +        # libs: sndio
> +        "sndio",
>       ]
>   
>       # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed

I think the rest of the code looks good. Don't forget to use 
./scripts/get_maintainer.pl 0001-audio-Add-sndio-backend.patch to cc all 
maintainers.

With best regards,
Volker

