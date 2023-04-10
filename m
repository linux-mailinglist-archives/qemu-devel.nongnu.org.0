Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6283D6DC39B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 08:41:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pllCB-00028u-Np; Mon, 10 Apr 2023 02:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pllC8-00028j-Dx
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 02:40:04 -0400
Received: from mailout02.t-online.de ([194.25.134.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pllC5-0008Oe-Ez
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 02:40:04 -0400
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout02.t-online.de (Postfix) with SMTP id 5606327B34;
 Mon, 10 Apr 2023 08:39:54 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.29.86]) by fwd70.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pllBx-3MBOfB0; Mon, 10 Apr 2023 08:39:53 +0200
Message-ID: <df9bb162-1e50-e0ca-49b6-54ba8bc3e3e3@t-online.de>
Date: Mon, 10 Apr 2023 08:39:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v10] audio/pwaudio.c: Add Pipewire audio backend for QEMU
Content-Language: en-US
To: Dorinda Bassey <dbassey@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@gmail.com, kraxel@redhat.com, armbru@redhat.com,
 qemu_oss@crudebyte.com, pbonzini@redhat.com, wtaymans@redhat.com
References: <20230403202053.80737-1-dbassey@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20230403202053.80737-1-dbassey@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1681108793-DE542C15-92B13D7D/0/0 CLEAN NORMAL
X-TOI-MSGID: 7c31e862-a1bc-4af4-8337-919d1ad5b918
Received-SPF: none client-ip=194.25.134.17; envelope-from=vr_qemu@t-online.de;
 helo=mailout02.t-online.de
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.888, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi Dorinda,

> This commit adds a new audiodev backend to allow QEMU to use Pipewire as
> both an audio sink and source. This backend is available on most systems
>
> Add Pipewire entry points for QEMU Pipewire audio backend
> Add wrappers for QEMU Pipewire audio backend in qpw_pcm_ops()
> qpw_write function returns the current state of the stream to pwaudio
> and Writes some data to the server for playback streams using pipewire
> spa_ringbuffer implementation.
> qpw_read function returns the current state of the stream to pwaudio and
> reads some data from the server for capture streams using pipewire
> spa_ringbuffer implementation. These functions qpw_write and qpw_read
> are called during playback and capture.
> Added some functions that convert pw audio formats to QEMU audio format
> and vice versa which would be needed in the pipewire audio sink and
> source functions qpw_init_in() & qpw_init_out().
> These methods that implement playback and recording will create streams
> for playback and capture that will start processing and will result in
> the on_process callbacks to be called.
> Built a connection to the Pipewire sound system server in the
> qpw_audio_init() method.
>
> Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
> ---
> v10:
> improve error handling
> fix volume functions
> add locks in enable_in out functions
> cleanup in reverse order of intialization
> add triggers for the sync method on the core object
> add waiting function for pw_thread_loop_signal
> improve trace
>
>   audio/audio.c                 |   3 +
>   audio/audio_template.h        |   4 +
>   audio/meson.build             |   1 +
>   audio/pwaudio.c               | 906 ++++++++++++++++++++++++++++++++++
>   audio/trace-events            |   8 +
>   meson.build                   |   8 +
>   meson_options.txt             |   4 +-
>   qapi/audio.json               |  44 ++
>   qemu-options.hx               |  21 +
>   scripts/meson-buildoptions.sh |   8 +-
>   10 files changed, 1004 insertions(+), 3 deletions(-)
>   create mode 100644 audio/pwaudio.c
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 70b096713c..90c7c49d11 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -2061,6 +2061,9 @@ void audio_create_pdos(Audiodev *dev)
>   #ifdef CONFIG_AUDIO_PA
>           CASE(PA, pa, Pa);
>   #endif
> +#ifdef CONFIG_AUDIO_PIPEWIRE
> +        CASE(PIPEWIRE, pipewire, Pipewire);
> +#endif
>   #ifdef CONFIG_AUDIO_SDL
>           CASE(SDL, sdl, Sdl);
>   #endif
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index e42326c20d..dc0c74aa74 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -362,6 +362,10 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
>       case AUDIODEV_DRIVER_PA:
>           return qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE);
>   #endif
> +#ifdef CONFIG_AUDIO_PIPEWIRE
> +    case AUDIODEV_DRIVER_PIPEWIRE:
> +        return qapi_AudiodevPipewirePerDirectionOptions_base(dev->u.pipewire.TYPE);
> +#endif
>   #ifdef CONFIG_AUDIO_SDL
>       case AUDIODEV_DRIVER_SDL:
>           return qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.TYPE);
> diff --git a/audio/meson.build b/audio/meson.build
> index 0722224ba9..65a49c1a10 100644
> --- a/audio/meson.build
> +++ b/audio/meson.build
> @@ -19,6 +19,7 @@ foreach m : [
>     ['sdl', sdl, files('sdlaudio.c')],
>     ['jack', jack, files('jackaudio.c')],
>     ['sndio', sndio, files('sndioaudio.c')],
> +  ['pipewire', pipewire, files('pwaudio.c')],
>     ['spice', spice, files('spiceaudio.c')]
>   ]
>     if m[1].found()
> diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> new file mode 100644
> index 0000000000..f9da86059f
> --- /dev/null
> +++ b/audio/pwaudio.c
> @@ -0,0 +1,906 @@
> +/*
> + * QEMU Pipewire audio driver
> + *
> + * Copyright (c) 2023 Red Hat Inc.
> + *
> + * Author: Dorinda Bassey       <dbassey@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/module.h"
> +#include "audio.h"
> +#include <errno.h>
> +#include "qemu/error-report.h"
> +#include <spa/param/audio/format-utils.h>
> +#include <spa/utils/ringbuffer.h>
> +#include <spa/utils/result.h>
> +#include <spa/param/props.h>
> +
> +#include <pipewire/pipewire.h>
> +#include "trace.h"
> +
> +#define AUDIO_CAP "pipewire"
> +#define RINGBUFFER_SIZE    (1u << 22)
> +#define RINGBUFFER_MASK    (RINGBUFFER_SIZE - 1)
> +
> +#include "audio_int.h"
> +
> +typedef struct pwvolume {
> +    uint32_t channels;
> +    float values[SPA_AUDIO_MAX_CHANNELS];
> +} pwvolume;
> +
> +typedef struct pwaudio {
> +    Audiodev *dev;
> +    struct pw_thread_loop *thread_loop;
> +    struct pw_context *context;
> +
> +    struct pw_core *core;
> +    struct spa_hook core_listener;
> +    int last_seq, pending_seq, error;
> +} pwaudio;
> +
> +typedef struct PWVoice {
> +    pwaudio *g;
> +    struct pw_stream *stream;
> +    struct spa_hook stream_listener;
> +    struct spa_audio_info_raw info;
> +    uint32_t highwater_mark;
> +    uint32_t frame_size, req;
> +    struct spa_ringbuffer ring;
> +    uint8_t buffer[RINGBUFFER_SIZE];
> +
> +    struct pw_properties *props;
> +    pwvolume volume;
> +    bool muted;
> +} PWVoice;
> +
> +typedef struct PWVoiceOut {
> +    HWVoiceOut hw;
> +    PWVoice v;
> +} PWVoiceOut;
> +
> +typedef struct PWVoiceIn {
> +    HWVoiceIn hw;
> +    PWVoice v;
> +} PWVoiceIn;
> +
> +static void
> +stream_destroy(void *data)
> +{
> +    PWVoice *v = (PWVoice *) data;
> +    spa_hook_remove(&v->stream_listener);
> +    v->stream = NULL;
> +}
> +
> +/* output data processing function to read stuffs from the buffer */
> +static void
> +playback_on_process(void *data)
> +{
> +    PWVoice *v = (PWVoice *) data;
> +    void *p;
> +    struct pw_buffer *b;
> +    struct spa_buffer *buf;
> +    uint32_t req, index, n_bytes;
> +    int32_t avail;
> +
> +    assert(v->stream);
> +
> +    /* obtain a buffer to read from */
> +    b = pw_stream_dequeue_buffer(v->stream);
> +    if (b == NULL) {
> +        error_report("out of buffers: %s", strerror(errno));
> +        return;
> +    }
> +
> +    buf = b->buffer;
> +    p = buf->datas[0].data;
> +    if (p == NULL) {
> +        return;
> +    }
> +    /* calculate the total no of bytes to read data from buffer */
> +    req = b->requested * v->frame_size;
> +    if (req == 0) {
> +        req = v->req;
> +    }
> +    n_bytes = SPA_MIN(req, buf->datas[0].maxsize);
> +
> +    /* get no of available bytes to read data from buffer */
> +
> +    avail = spa_ringbuffer_get_read_index(&v->ring, &index);

As I wrote in another email, the code should handle buffer underflows. 
The code in v7 is correct if you replace memset(p, 0, n_bytes) with 
audio_pcm_info_clear_buf().

> +
> +    if (avail < (int32_t) n_bytes) {
> +        n_bytes = avail;
> +    }
> +
> +    spa_ringbuffer_read_data(&v->ring,
> +                                v->buffer, RINGBUFFER_SIZE,
> +                                index & RINGBUFFER_MASK, p, n_bytes);
> +
> +    index += n_bytes;
> +    spa_ringbuffer_read_update(&v->ring, index);
> +
> +    buf->datas[0].chunk->offset = 0;
> +    buf->datas[0].chunk->stride = v->frame_size;
> +    buf->datas[0].chunk->size = n_bytes;
> +
> +    /* queue the buffer for playback */
> +    pw_stream_queue_buffer(v->stream, b);
> +}
> +
> +/* output data processing function to generate stuffs in the buffer */
> +static void
> +capture_on_process(void *data)
> +{
> +    PWVoice *v = (PWVoice *) data;
> +    void *p;
> +    struct pw_buffer *b;
> +    struct spa_buffer *buf;
> +    int32_t filled;
> +    uint32_t index, offs, n_bytes;
> +
> +    assert(v->stream);
> +
> +    /* obtain a buffer */
> +    b = pw_stream_dequeue_buffer(v->stream);
> +    if (b == NULL) {
> +        error_report("out of buffers: %s", strerror(errno));
> +        return;
> +    }
> +
> +    /* Write data into buffer */
> +    buf = b->buffer;
> +    p = buf->datas[0].data;
> +    if (p == NULL) {
> +        return;
> +    }
> +    offs = SPA_MIN(buf->datas[0].chunk->offset, buf->datas[0].maxsize);
> +    n_bytes = SPA_MIN(buf->datas[0].chunk->size, buf->datas[0].maxsize - offs);
> +
> +    filled = spa_ringbuffer_get_write_index(&v->ring, &index);
> +
> +
> +    if (filled < 0) {
> +        error_report("%p: underrun write:%u filled:%d", p, index, filled);
> +    } else {
> +        if ((uint32_t) filled + n_bytes > RINGBUFFER_SIZE) {
> +            error_report("%p: overrun write:%u filled:%d + size:%u > max:%u",
> +            p, index, filled, n_bytes, RINGBUFFER_SIZE);
> +        }
> +    }
> +    spa_ringbuffer_write_data(&v->ring,
> +                                v->buffer, RINGBUFFER_SIZE,
> +                                index & RINGBUFFER_MASK,
> +                                SPA_PTROFF(p, offs, void), n_bytes);
> +    index += n_bytes;
> +    spa_ringbuffer_write_update(&v->ring, index);
> +
> +    /* queue the buffer for playback */
> +    pw_stream_queue_buffer(v->stream, b);
> +}
> +
> +static void
> +on_stream_state_changed(void *data, enum pw_stream_state old,
> +                        enum pw_stream_state state, const char *error)
> +{
> +    PWVoice *v = (PWVoice *) data;
> +
> +    trace_pw_state_changed(pw_stream_get_node_id(v->stream),
> +                           pw_stream_state_as_string(state));
> +
> +    switch (state) {
> +    case PW_STREAM_STATE_ERROR:
> +    case PW_STREAM_STATE_UNCONNECTED:
> +        break;
> +    case PW_STREAM_STATE_PAUSED:
> +    case PW_STREAM_STATE_CONNECTING:
> +    case PW_STREAM_STATE_STREAMING:
> +        break;
> +    }
> +}
> +
> +static const struct pw_stream_events capture_stream_events = {
> +    PW_VERSION_STREAM_EVENTS,
> +    .destroy = stream_destroy,
> +    .state_changed = on_stream_state_changed,
> +    .process = capture_on_process
> +};
> +
> +static const struct pw_stream_events playback_stream_events = {
> +    PW_VERSION_STREAM_EVENTS,
> +    .destroy = stream_destroy,
> +    .state_changed = on_stream_state_changed,
> +    .process = playback_on_process
> +};
> +
> +static size_t
> +qpw_read(HWVoiceIn *hw, void *data, size_t len)
> +{
> +    PWVoiceIn *pw = (PWVoiceIn *) hw;
> +    PWVoice *v = &pw->v;
> +    pwaudio *c = v->g;
> +    const char *error = NULL;
> +    size_t l;
> +    int32_t avail;
> +    uint32_t index;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +    if (pw_stream_get_state(v->stream, &error) != PW_STREAM_STATE_STREAMING) {
> +        /* wait for stream to become ready */
> +        l = 0;
> +        goto done_unlock;
> +    }
> +    /* get no of available bytes to read data from buffer */
> +    avail = spa_ringbuffer_get_read_index(&v->ring, &index);
> +
> +    trace_pw_read(avail, index, len);
> +
> +    if (avail < (int32_t) len) {
> +        len = avail;
> +    }
> +
> +    spa_ringbuffer_read_data(&v->ring,
> +                             v->buffer, RINGBUFFER_SIZE,
> +                             index & RINGBUFFER_MASK, data, len);
> +    index += len;
> +    spa_ringbuffer_read_update(&v->ring, index);
> +    l = len;
> +
> +done_unlock:
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return l;
> +}
> +
> +static size_t qpw_buffer_get_free(HWVoiceOut *hw)
> +{
> +    PWVoiceOut *pw = (PWVoiceOut *)hw;
> +    PWVoice *v = &pw->v;
> +    pwaudio *c = v->g;
> +    const char *error = NULL;
> +    int32_t filled, avail;
> +    uint32_t index;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +    if (pw_stream_get_state(v->stream, &error) != PW_STREAM_STATE_STREAMING) {
> +        /* wait for stream to become ready */
> +        avail = 0;
> +        goto done_unlock;
> +    }
> +
> +    filled = spa_ringbuffer_get_write_index(&v->ring, &index);
> +    avail = v->highwater_mark - filled;
> +
> +done_unlock:
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return avail;
> +}
> +
> +static size_t
> +qpw_write(HWVoiceOut *hw, void *data, size_t len)
> +{
> +    PWVoiceOut *pw = (PWVoiceOut *) hw;
> +    PWVoice *v = &pw->v;
> +    pwaudio *c = v->g;
> +    const char *error = NULL;
> +    int32_t filled, avail;
> +    uint32_t index;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +    if (pw_stream_get_state(v->stream, &error) != PW_STREAM_STATE_STREAMING) {
> +        /* wait for stream to become ready */
> +        len = 0;
> +        goto done_unlock;
> +    }
> +    filled = spa_ringbuffer_get_write_index(&v->ring, &index);
> +    avail = v->highwater_mark - filled;
> +
> +    trace_pw_write(filled, avail, index, len);
> +
> +    if (len > avail) {
> +        len = avail;
> +    }
> +
> +    if (filled < 0) {
> +        error_report("%p: underrun write:%u filled:%d", pw, index, filled);
> +    } else {
> +        if ((uint32_t) filled + len > RINGBUFFER_SIZE) {
> +            error_report("%p: overrun write:%u filled:%d + size:%zu > max:%u",
> +            pw, index, filled, len, RINGBUFFER_SIZE);
> +        }
> +    }
> +
> +    spa_ringbuffer_write_data(&v->ring,
> +                                v->buffer, RINGBUFFER_SIZE,
> +                                index & RINGBUFFER_MASK, data, len);
> +    index += len;
> +    spa_ringbuffer_write_update(&v->ring, index);
> +
> +done_unlock:
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return len;
> +}
> +
> +static int
> +audfmt_to_pw(AudioFormat fmt, int endianness)
> +{
> +    int format;
> +
> +    switch (fmt) {
> +    case AUDIO_FORMAT_S8:
> +        format = SPA_AUDIO_FORMAT_S8;
> +        break;
> +    case AUDIO_FORMAT_U8:
> +        format = SPA_AUDIO_FORMAT_U8;
> +        break;
> +    case AUDIO_FORMAT_S16:
> +        format = endianness ? SPA_AUDIO_FORMAT_S16_BE : SPA_AUDIO_FORMAT_S16_LE;
> +        break;
> +    case AUDIO_FORMAT_U16:
> +        format = endianness ? SPA_AUDIO_FORMAT_U16_BE : SPA_AUDIO_FORMAT_U16_LE;
> +        break;
> +    case AUDIO_FORMAT_S32:
> +        format = endianness ? SPA_AUDIO_FORMAT_S32_BE : SPA_AUDIO_FORMAT_S32_LE;
> +        break;
> +    case AUDIO_FORMAT_U32:
> +        format = endianness ? SPA_AUDIO_FORMAT_U32_BE : SPA_AUDIO_FORMAT_U32_LE;
> +        break;
> +    case AUDIO_FORMAT_F32:
> +        format = endianness ? SPA_AUDIO_FORMAT_F32_BE : SPA_AUDIO_FORMAT_F32_LE;
> +        break;
> +    default:
> +        dolog("Internal logic error: Bad audio format %d\n", fmt);
> +        format = SPA_AUDIO_FORMAT_U8;
> +        break;
> +    }
> +    return format;
> +}
> +
> +static AudioFormat
> +pw_to_audfmt(enum spa_audio_format fmt, int *endianness,
> +             uint32_t *frame_size)

The parameter name frame_size is not correct. The function 
pw_to_audiofmt() returns the sample size.

> +{
> +    switch (fmt) {
> +    case SPA_AUDIO_FORMAT_S8:
> +        *frame_size = 1;
> +        return AUDIO_FORMAT_S8;
> +    case SPA_AUDIO_FORMAT_U8:
> +        *frame_size = 1;
> +        return AUDIO_FORMAT_U8;
> +    case SPA_AUDIO_FORMAT_S16_BE:
> +        *frame_size = 2;
> +        *endianness = 1;
> +        return AUDIO_FORMAT_S16;
> +    case SPA_AUDIO_FORMAT_S16_LE:
> +        *frame_size = 2;
> +        *endianness = 0;
> +        return AUDIO_FORMAT_S16;
> +    case SPA_AUDIO_FORMAT_U16_BE:
> +        *frame_size = 2;
> +        *endianness = 1;
> +        return AUDIO_FORMAT_U16;
> +    case SPA_AUDIO_FORMAT_U16_LE:
> +        *frame_size = 2;
> +        *endianness = 0;
> +        return AUDIO_FORMAT_U16;
> +    case SPA_AUDIO_FORMAT_S32_BE:
> +        *frame_size = 4;
> +        *endianness = 1;
> +        return AUDIO_FORMAT_S32;
> +    case SPA_AUDIO_FORMAT_S32_LE:
> +        *frame_size = 4;
> +        *endianness = 0;
> +        return AUDIO_FORMAT_S32;
> +    case SPA_AUDIO_FORMAT_U32_BE:
> +        *frame_size = 4;
> +        *endianness = 1;
> +        return AUDIO_FORMAT_U32;
> +    case SPA_AUDIO_FORMAT_U32_LE:
> +        *frame_size = 4;
> +        *endianness = 0;
> +        return AUDIO_FORMAT_U32;
> +    case SPA_AUDIO_FORMAT_F32_BE:
> +        *frame_size = 4;
> +        *endianness = 1;
> +        return AUDIO_FORMAT_F32;
> +    case SPA_AUDIO_FORMAT_F32_LE:
> +        *frame_size = 4;
> +        *endianness = 0;
> +        return AUDIO_FORMAT_F32;
> +    default:
> +        *frame_size = 1;
> +        dolog("Internal logic error: Bad spa_audio_format %d\n", fmt);
> +        return AUDIO_FORMAT_U8;
> +    }
> +}
> +
> +static int
> +create_stream(pwaudio *c, PWVoice *v, const char *stream_name,
> +              const char *name, enum spa_direction dir)
> +{
> +    int res;
> +    uint32_t n_params;
> +    const struct spa_pod *params[2];
> +    uint8_t buffer[1024];
> +    struct spa_pod_builder b;
> +    uint64_t buf_samples;
> +
> +    v->props = pw_properties_new(NULL, NULL);

Why do you use v->props instead of a local variable props? 
pw_stream_new() takes the ownership of the properties and after the call 
the properties pointer is no longer useful.

With best regards,
Volker

> +
> +    /* 75% of the timer period for faster updates */
> +    buf_samples = (uint64_t)v->g->dev->timer_period * v->info.rate
> +                    * 3 / 4 / 1000000;
> +    trace_pw_timer(buf_samples);
> +    pw_properties_setf(v->props, PW_KEY_NODE_LATENCY, "%" PRIu64 "/%u",
> +                       buf_samples, v->info.rate);
> +
> +    if (name) {
> +        pw_properties_set(v->props, PW_KEY_TARGET_OBJECT, name);
> +    }
> +    v->stream = pw_stream_new(c->core, stream_name, v->props);
> +
> +    if (v->stream == NULL) {
> +        return -1;
> +    }
> +
> +    if (dir == SPA_DIRECTION_INPUT) {
> +        pw_stream_add_listener(v->stream,
> +                            &v->stream_listener, &capture_stream_events, v);
> +    } else {
> +        pw_stream_add_listener(v->stream,
> +                            &v->stream_listener, &playback_stream_events, v);
> +    }
> +
> +    n_params = 0;
> +    spa_pod_builder_init(&b, buffer, sizeof(buffer));
> +    params[n_params++] = spa_format_audio_raw_build(&b,
> +                            SPA_PARAM_EnumFormat,
> +                            &v->info);
> +
> +    /* connect the stream to a sink or source */
> +    res = pw_stream_connect(v->stream,
> +                            dir ==
> +                            SPA_DIRECTION_INPUT ? PW_DIRECTION_INPUT :
> +                            PW_DIRECTION_OUTPUT, PW_ID_ANY,
> +                            PW_STREAM_FLAG_AUTOCONNECT |
> +                            PW_STREAM_FLAG_INACTIVE |
> +                            PW_STREAM_FLAG_MAP_BUFFERS |
> +                            PW_STREAM_FLAG_RT_PROCESS, params, n_params);
> +    if (res < 0) {
> +        pw_stream_destroy(v->stream);
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
>


