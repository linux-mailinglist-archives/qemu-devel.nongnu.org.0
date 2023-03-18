Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C956BFC0F
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 18:56:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdalY-0007aU-5u; Sat, 18 Mar 2023 13:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pdalU-0007aK-DF
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 13:54:48 -0400
Received: from mailout08.t-online.de ([194.25.134.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pdalN-0000L0-QT
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 13:54:47 -0400
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout08.t-online.de (Postfix) with SMTP id 9975C1FF71;
 Sat, 18 Mar 2023 18:54:32 +0100 (CET)
Received: from [192.168.211.200] ([79.208.29.86]) by fwd74.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pdal6-1x9PxB0; Sat, 18 Mar 2023 18:54:25 +0100
Message-ID: <834dcfd8-ca29-e5f6-413c-dcaa3dcc1288@t-online.de>
Date: Sat, 18 Mar 2023 18:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH v8] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: Dorinda Bassey <dbassey@redhat.com>
Cc: marcandre.lureau@gmail.com, kraxel@redhat.com, armbru@redhat.com,
 qemu_oss@crudebyte.com, pbonzini@redhat.com, wtaymans@redhat.com,
 qemu-devel@nongnu.org
References: <20230315164633.60924-1-dbassey@redhat.com>
Content-Language: en-US
In-Reply-To: <20230315164633.60924-1-dbassey@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1679162065-B202B007-91132D96/0/0 CLEAN NORMAL
X-TOI-MSGID: ff95cd5a-fd1c-4c8b-86b2-1c681c6bf51d
Received-SPF: none client-ip=194.25.134.20; envelope-from=vr_qemu@t-online.de;
 helo=mailout08.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
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
> Signed-off-by: Dorinda Bassey<dbassey@redhat.com>
> ---
> v8:
> Improve error handling
> Improve code documentation
> Improve latency handling
> Refactor playback process
> Add qpw_buffer_get_free method
> Change latency options
> Fix typo
>
>   audio/audio.c                 |   3 +
>   audio/audio_template.h        |   4 +
>   audio/meson.build             |   1 +
>   audio/pwaudio.c               | 820 ++++++++++++++++++++++++++++++++++
>   audio/trace-events            |   7 +
>   meson.build                   |   8 +
>   meson_options.txt             |   4 +-
>   qapi/audio.json               |  42 ++
>   qemu-options.hx               |  17 +
>   scripts/meson-buildoptions.sh |   8 +-
>   10 files changed, 911 insertions(+), 3 deletions(-)
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
> index 0000000000..8d11bbb92b
> --- /dev/null
> +++ b/audio/pwaudio.c
> @@ -0,0 +1,820 @@
> +/*
> + * QEMU Pipewire audio driver
> + *
> + * Copyright (c) 2023 Red Hat Inc.
> + *
> + * Author: Dorinda Bassey<dbassey@redhat.com>
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
> +enum {
> +    MODE_SINK,
> +    MODE_SOURCE
> +};
> +
> +typedef struct pwaudio {
> +    Audiodev *dev;
> +    struct pw_thread_loop *thread_loop;
> +    struct pw_context *context;
> +
> +    struct pw_core *core;
> +    struct spa_hook core_listener;
> +    int seq;
> +} pwaudio;
> +
> +typedef struct PWVoice {
> +    pwaudio *g;
> +    bool enabled;
> +    struct pw_stream *stream;
> +    struct spa_hook stream_listener;
> +    struct spa_audio_info_raw info;
> +    uint32_t highwater_mark;
> +    uint32_t frame_size;
> +    struct spa_ringbuffer ring;
> +    uint8_t buffer[RINGBUFFER_SIZE];
> +
> +    uint32_t mode;
> +    struct pw_properties *props;

props is unused.

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
> +    if (!v->stream) {
> +        return;
> +    }
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
> +        req = (uint64_t)v->g->dev->timer_period * v->info.rate
> +                * 1 / 2 / 1000000 * v->frame_size;

This term is constant for the lifetime of the playback stream. It could 
be precalculated in qpw_init_out().

> +    }
> +    n_bytes = SPA_MIN(req, buf->datas[0].maxsize);
> +
> +    /* get no of available bytes to read data from buffer */
> +
> +    avail = spa_ringbuffer_get_read_index(&v->ring, &index);
> +
> +    if (!v->enabled) {
> +        avail = 0;
> +    }

The if (!v->enabled) block isn't needed. When the guest stops the 
playback stream, it won't write new samples. After the pipewire 
ringbuffer is drained, avail is always 0. It's better to drain the 
ringbuffer, otherwise the first thing you will hear after playback 
starts again will be stale audio samples.

You removed the code to play silence on a buffer underrun. I suggest to 
add it again. Use a trace point with the "simple" trace backend to see 
how often pipewire now calls the callback in short succession for a 
disabled stream before giving up.

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
> +    if (!v->stream) {
> +        return;
> +    }
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
> +    if (!v->enabled) {
> +        n_bytes = 0;
> +    }
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
> +on_stream_state_changed(void *_data, enum pw_stream_state old,
> +                        enum pw_stream_state state, const char *error)
> +{
> +    PWVoice *v = (PWVoice *) _data;
> +
> +    trace_pw_state_changed(pw_stream_state_as_string(state));
> +
> +    switch (state) {
> +    case PW_STREAM_STATE_ERROR:
> +    case PW_STREAM_STATE_UNCONNECTED:
> +        {
> +            break;
> +        }
> +    case PW_STREAM_STATE_PAUSED:
> +        trace_pw_node(pw_stream_get_node_id(v->stream));
> +        break;
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
> +create_stream(pwaudio *c, PWVoice *v, const char *name)
> +{
> +    int res;
> +    uint32_t n_params;
> +    const struct spa_pod *params[2];
> +    uint8_t buffer[1024];
> +    struct spa_pod_builder b;
> +    struct pw_properties *props;
> +
> +    props = pw_properties_new(NULL, NULL);
> +    pw_properties_setf(props, PW_KEY_NODE_LATENCY, "%" PRIu64 "/%u",
> +                       (uint64_t)v->g->dev->timer_period * v->info.rate
> +                       * 3 / 4 / 1000000, v->info.rate);
> +    v->stream = pw_stream_new(c->core, name, props);
> +
> +    if (v->stream == NULL) {
> +        return -1;
> +    }
> +
> +    if (v->mode == MODE_SOURCE) {
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
> +                            v->mode ==
> +                            MODE_SOURCE ? PW_DIRECTION_INPUT :
> +                            PW_DIRECTION_OUTPUT, PW_ID_ANY,
> +                            PW_STREAM_FLAG_AUTOCONNECT |
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
> +static int
> +qpw_stream_new(pwaudio *c, PWVoice *v, const char *name)
> +{
> +    int r;
> +
> +    switch (v->info.channels) {
> +    case 8:
> +        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> +        v->info.position[2] = SPA_AUDIO_CHANNEL_FC;
> +        v->info.position[3] = SPA_AUDIO_CHANNEL_LFE;
> +        v->info.position[4] = SPA_AUDIO_CHANNEL_RL;
> +        v->info.position[5] = SPA_AUDIO_CHANNEL_RR;
> +        v->info.position[6] = SPA_AUDIO_CHANNEL_SL;
> +        v->info.position[7] = SPA_AUDIO_CHANNEL_SR;
> +        break;
> +    case 6:
> +        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> +        v->info.position[2] = SPA_AUDIO_CHANNEL_FC;
> +        v->info.position[3] = SPA_AUDIO_CHANNEL_LFE;
> +        v->info.position[4] = SPA_AUDIO_CHANNEL_RL;
> +        v->info.position[5] = SPA_AUDIO_CHANNEL_RR;
> +        break;
> +    case 5:
> +        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> +        v->info.position[2] = SPA_AUDIO_CHANNEL_FC;
> +        v->info.position[3] = SPA_AUDIO_CHANNEL_LFE;
> +        v->info.position[4] = SPA_AUDIO_CHANNEL_RC;
> +        break;
> +    case 4:
> +        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> +        v->info.position[2] = SPA_AUDIO_CHANNEL_FC;
> +        v->info.position[3] = SPA_AUDIO_CHANNEL_RC;
> +        break;
> +    case 3:
> +        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> +        v->info.position[2] = SPA_AUDIO_CHANNEL_LFE;
> +        break;
> +    case 2:
> +        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> +        break;
> +    case 1:
> +        v->info.position[0] = SPA_AUDIO_CHANNEL_MONO;
> +        break;
> +    default:
> +        for (size_t i = 0; i < v->info.channels; i++) {
> +            v->info.position[i] = SPA_AUDIO_CHANNEL_UNKNOWN;
> +        }
> +        break;
> +    }
> +
> +    /* create a new unconnected pwstream */
> +    r = create_stream(c, v, name);
> +    if (r < 0) {
> +        AUD_log(AUDIO_CAP, "Failed to create stream.");
> +        return -1;
> +    }
> +
> +    return r;
> +}
> +
> +static int
> +qpw_init_out(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque)
> +{
> +    PWVoiceOut *pw = (PWVoiceOut *) hw;
> +    PWVoice *v = &pw->v;
> +    struct audsettings obt_as = *as;
> +    pwaudio *c = v->g = drv_opaque;
> +    AudiodevPipewireOptions *popts = &c->dev->u.pipewire;
> +    AudiodevPipewirePerDirectionOptions *ppdo = popts->out;
> +    int r;
> +    v->enabled = false;
> +
> +    v->mode = MODE_SINK;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +
> +    v->info.format = audfmt_to_pw(as->fmt, as->endianness);
> +    v->info.channels = as->nchannels;
> +    v->info.rate = as->freq;
> +
> +    obt_as.fmt =
> +        pw_to_audfmt(v->info.format, &obt_as.endianness, &v->frame_size);
> +    v->frame_size *= as->nchannels;
> +
> +    /* call the function that creates a new stream for playback */
> +    r = qpw_stream_new(c, v, ppdo->stream_name ? : c->dev->id);
> +    if (r < 0) {
> +        error_report("qpw_stream_new for playback failed");
> +        pw_thread_loop_unlock(c->thread_loop);
> +        return -1;
> +    }
> +
> +    /* report the audio format we support */
> +    audio_pcm_init_info(&hw->info, &obt_as);
> +
> +    /* report the buffer size to qemu */
> +    hw->samples = audio_buffer_frames(
> +        qapi_AudiodevPipewirePerDirectionOptions_base(ppdo), &obt_as, 46440);
> +    v->highwater_mark = MIN(RINGBUFFER_SIZE,
> +                            (ppdo->has_latency ? ppdo->latency : 46440)
> +                            * (uint64_t)v->info.rate / 1000000 * v->frame_size);
> +
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return 0;
> +}
> +
> +static int
> +qpw_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
> +{
> +    PWVoiceIn *pw = (PWVoiceIn *) hw;
> +    PWVoice *v = &pw->v;
> +    struct audsettings obt_as = *as;
> +    pwaudio *c = v->g = drv_opaque;
> +    AudiodevPipewireOptions *popts = &c->dev->u.pipewire;
> +    AudiodevPipewirePerDirectionOptions *ppdo = popts->in;
> +    int r;
> +    v->enabled = false;
> +
> +    v->mode = MODE_SOURCE;
> +    pw_thread_loop_lock(c->thread_loop);
> +
> +    v->info.format = audfmt_to_pw(as->fmt, as->endianness);
> +    v->info.channels = as->nchannels;
> +    v->info.rate = as->freq;
> +
> +    obt_as.fmt =
> +        pw_to_audfmt(v->info.format, &obt_as.endianness, &v->frame_size);
> +    v->frame_size *= as->nchannels;
> +
> +    /* call the function that creates a new stream for recording */
> +    r = qpw_stream_new(c, v, ppdo->stream_name ? : c->dev->id);
> +    if (r < 0) {
> +        error_report("qpw_stream_new for recording failed");
> +        pw_thread_loop_unlock(c->thread_loop);
> +        return -1;
> +    }
> +
> +    /* report the audio format we support */
> +    audio_pcm_init_info(&hw->info, &obt_as);
> +
> +    /* report the buffer size to qemu */
> +    hw->samples = audio_buffer_frames(
> +        qapi_AudiodevPipewirePerDirectionOptions_base(ppdo), &obt_as, 46440);
> +
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return 0;
> +}
> +
> +static void
> +qpw_fini_out(HWVoiceOut *hw)
> +{
> +    PWVoiceOut *pw = (PWVoiceOut *) hw;
> +    PWVoice *v = &pw->v;
> +
> +    if (v->stream) {
> +        pwaudio *c = v->g;
> +        pw_thread_loop_lock(c->thread_loop);
> +        pw_stream_destroy(v->stream);
> +        v->stream = NULL;
> +        pw_thread_loop_unlock(c->thread_loop);
> +    }
> +}
> +
> +static void
> +qpw_fini_in(HWVoiceIn *hw)
> +{
> +    PWVoiceIn *pw = (PWVoiceIn *) hw;
> +    PWVoice *v = &pw->v;
> +
> +    if (v->stream) {
> +        pwaudio *c = v->g;
> +        pw_thread_loop_lock(c->thread_loop);
> +        pw_stream_destroy(v->stream);
> +        v->stream = NULL;
> +        pw_thread_loop_unlock(c->thread_loop);
> +    }
> +}
> +
> +static void
> +qpw_enable_out(HWVoiceOut *hw, bool enable)
> +{
> +    PWVoiceOut *po = (PWVoiceOut *) hw;
> +    PWVoice *v = &po->v;
> +    v->enabled = enable;
> +}
> +
> +static void
> +qpw_enable_in(HWVoiceIn *hw, bool enable)
> +{
> +    PWVoiceIn *pi = (PWVoiceIn *) hw;
> +    PWVoice *v = &pi->v;
> +    v->enabled = enable;
> +}

Please read again Marc-André's comments for the v7 version of the 
pipewire backend. When the guest enables/disables an audio stream, 
pipewire should know this. It's unnecessary that pipewire calls the 
callback code for disabled streams. Don't forget to connect the stream 
with the flag PW_STREAM_FLAG_INACTIVE. Every QEMU audio device enables 
the stream before playback/recording starts.

> +
> +static void
> +on_core_error(void *data, uint32_t id, int seq, int res, const char *message)
> +{
> +    pwaudio *pw = data;
> +
> +    error_report("error id:%u seq:%d res:%d (%s): %s",
> +                id, seq, res, spa_strerror(res), message);
> +
> +    /* stop and exit the thread loop */
> +    pw_thread_loop_signal(pw->thread_loop, FALSE);
> +}
> +
> +static void
> +on_core_done(void *data, uint32_t id, int seq)
> +{
> +    pwaudio *pw = data;
> +    if (id == PW_ID_CORE) {
> +        pw->seq = seq;
> +        /* stop and exit the thread loop */
> +        pw_thread_loop_signal(pw->thread_loop, FALSE);
> +    }
> +}
> +
> +static const struct pw_core_events core_events = {
> +    PW_VERSION_CORE_EVENTS,
> +    .done = on_core_done,
> +    .error = on_core_error,
> +};
> +
> +static void *
> +qpw_audio_init(Audiodev *dev)
> +{
> +    g_autofree pwaudio *pw = g_new0(pwaudio, 1);
> +    pw_init(NULL, NULL);
> +
> +    trace_pw_audio_init();
> +    assert(dev->driver == AUDIODEV_DRIVER_PIPEWIRE);
> +
> +    pw->dev = dev;
> +    pw->thread_loop = pw_thread_loop_new("Pipewire thread loop", NULL);
> +    if (pw->thread_loop == NULL) {
> +        error_report("Could not create Pipewire loop");
> +        goto fail;
> +    }
> +
> +    pw->context =
> +        pw_context_new(pw_thread_loop_get_loop(pw->thread_loop), NULL, 0);
> +    if (pw->context == NULL) {
> +        error_report("Could not create Pipewire context");
> +        goto fail;
> +    }
> +
> +    if (pw_thread_loop_start(pw->thread_loop) < 0) {
> +        error_report("Could not start Pipewire loop");
> +        goto fail;
> +    }
> +
> +    pw_thread_loop_lock(pw->thread_loop);
> +
> +    pw->core = pw_context_connect(pw->context, NULL, 0);
> +    if (pw->core == NULL) {
> +        pw_thread_loop_unlock(pw->thread_loop);
> +        goto fail;
> +    }
> +
> +    pw_core_add_listener(pw->core, &pw->core_listener, &core_events, pw);
> +
> +    pw_thread_loop_unlock(pw->thread_loop);
> +
> +    return g_steal_pointer(&pw);
> +
> +fail:
> +    AUD_log(AUDIO_CAP, "Failed to initialize PW context");
> +    if (pw->thread_loop) {
> +        pw_thread_loop_stop(pw->thread_loop);
> +        g_clear_pointer(&pw->thread_loop, pw_thread_loop_destroy);
> +    }
> +    if (pw->context) {
> +        g_clear_pointer(&pw->context, pw_context_destroy);
> +    }
> +    return NULL;
> +}
> +
> +static void
> +qpw_audio_fini(void *opaque)
> +{
> +    pwaudio *pw = opaque;
> +
> +    pw_thread_loop_stop(pw->thread_loop);
> +
> +    if (pw->core) {
> +        spa_hook_remove(&pw->core_listener);
> +        spa_zero(pw->core_listener);
> +        pw_core_disconnect(pw->core);
> +    }
> +
> +    if (pw->context) {
> +        pw_context_destroy(pw->context);
> +    }
> +    pw_thread_loop_destroy(pw->thread_loop);
> +
> +    g_free(pw);
> +}
> +
> +static struct audio_pcm_ops qpw_pcm_ops = {
> +    .init_out = qpw_init_out,
> +    .fini_out = qpw_fini_out,
> +    .write = qpw_write,
> +    .buffer_get_free = qpw_buffer_get_free,
> +    .run_buffer_out = audio_generic_run_buffer_out,
> +    .enable_out = qpw_enable_out,
> +
> +    .init_in = qpw_init_in,
> +    .fini_in = qpw_fini_in,
> +    .read = qpw_read,
> +    .run_buffer_in = audio_generic_run_buffer_in,
> +    .enable_in = qpw_enable_in
> +};

The pcm_ops functions volume_out and volume_in are missing. Probably 
SPA_PROP_channelVolumes can be used to adjust the stream volumes. 
Without these functions the guest can adjust the stream volume and the 
host has an independent way to adjust the stream volume. This is 
sometimes irritating.

> +
> +static struct audio_driver pw_audio_driver = {
> +    .name = "pipewire",
> +    .descr ="http://www.pipewire.org/",
> +    .init = qpw_audio_init,
> +    .fini = qpw_audio_fini,
> +    .pcm_ops = &qpw_pcm_ops,
> +    .can_be_default = 1,
> +    .max_voices_out = INT_MAX,
> +    .max_voices_in = INT_MAX,
> +    .voice_size_out = sizeof(PWVoiceOut),
> +    .voice_size_in = sizeof(PWVoiceIn),
> +};
> +
> +static void
> +register_audio_pw(void)
> +{
> +    audio_driver_register(&pw_audio_driver);
> +}
> +
> +type_init(register_audio_pw);
> diff --git a/audio/trace-events b/audio/trace-events
> index e1ab643add..e0acf9ac56 100644
> --- a/audio/trace-events
> +++ b/audio/trace-events
> @@ -18,6 +18,13 @@ dbus_audio_register(const char *s, const char *dir) "sender = %s, dir = %s"
>   dbus_audio_put_buffer_out(size_t len) "len = %zu"
>   dbus_audio_read(size_t len) "len = %zu"
>   
> +# pwaudio.c
> +pw_state_changed(const char *s) "stream state: %s"
> +pw_node(int nodeid) "node id: %d"
> +pw_read(int32_t avail, uint32_t index, size_t len) "avail=%u index=%u len=%zu"
> +pw_write(int32_t filled, int32_t avail, uint32_t index, size_t len) "filled=%u avail=%u index=%u len=%zu"
> +pw_audio_init(void) "Initialize Pipewire context"
> +
>   # audio.c
>   audio_timer_start(int interval) "interval %d ms"
>   audio_timer_stop(void) ""
> diff --git a/meson.build b/meson.build
> index 29f8644d6d..31bf280c0d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -730,6 +730,12 @@ if not get_option('jack').auto() or have_system
>     jack = dependency('jack', required: get_option('jack'),
>                       method: 'pkg-config', kwargs: static_kwargs)
>   endif
> +pipewire = not_found
> +if not get_option('pipewire').auto() or (targetos == 'linux' and have_system)
> +  pipewire = dependency('libpipewire-0.3', version: '>=0.3.60',
> +                    required: get_option('pipewire'),
> +                    method: 'pkg-config', kwargs: static_kwargs)
> +endif
>   sndio = not_found
>   if not get_option('sndio').auto() or have_system
>     sndio = dependency('sndio', required: get_option('sndio'),
> @@ -1667,6 +1673,7 @@ if have_system
>       'jack': jack.found(),
>       'oss': oss.found(),
>       'pa': pulse.found(),
> +    'pipewire': pipewire.found(),
>       'sdl': sdl.found(),
>       'sndio': sndio.found(),
>     }
> @@ -3980,6 +3987,7 @@ if targetos == 'linux'
>     summary_info += {'ALSA support':    alsa}
>     summary_info += {'PulseAudio support': pulse}
>   endif
> +summary_info += {'Pipewire support':   pipewire}
>   summary_info += {'JACK support':      jack}
>   summary_info += {'brlapi support':    brlapi}
>   summary_info += {'vde support':       vde}
> diff --git a/meson_options.txt b/meson_options.txt
> index fc9447d267..9ae1ec7f47 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -21,7 +21,7 @@ option('tls_priority', type : 'string', value : 'NORMAL',
>   option('default_devices', type : 'boolean', value : true,
>          description: 'Include a default selection of devices in emulators')
>   option('audio_drv_list', type: 'array', value: ['default'],
> -       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'sdl', 'sndio'],
> +       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'pipewire', 'sdl', 'sndio'],
>          description: 'Set audio driver list')
>   option('block_drv_rw_whitelist', type : 'string', value : '',
>          description: 'set block driver read-write whitelist (by default affects only QEMU, not tools like qemu-img)')
> @@ -255,6 +255,8 @@ option('oss', type: 'feature', value: 'auto',
>          description: 'OSS sound support')
>   option('pa', type: 'feature', value: 'auto',
>          description: 'PulseAudio sound support')
> +option('pipewire', type: 'feature', value: 'auto',
> +       description: 'Pipewire sound support')
>   option('sndio', type: 'feature', value: 'auto',
>          description: 'sndio sound support')
>   
> diff --git a/qapi/audio.json b/qapi/audio.json
> index 4e54c00f51..60be24857b 100644
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -324,6 +324,45 @@
>       '*out':    'AudiodevPaPerDirectionOptions',
>       '*server': 'str' } }
>   
> +##
> +# @AudiodevPipewirePerDirectionOptions:
> +#
> +# Options of the Pipewire backend that are used for both playback and
> +# recording.
> +#
> +# @name: name of the sink/source to use
> +#
> +# @stream-name: name of the Pipewire stream created by qemu.  Can be
> +#               used to identify the stream in Pipewire when you
> +#               create multiple Pipewire devices or run multiple qemu
> +#               instances (default: audiodev's id)
> +#

@latency: is missing.

> +#
> +# Since: 8.0
> +##

I don't think the pipewire backend will be accepted for the 8.0 release 
in three weeks. It's probably Since: 8.1

> +{ 'struct': 'AudiodevPipewirePerDirectionOptions',
> +  'base': 'AudiodevPerDirectionOptions',
> +  'data': {
> +    '*name': 'str',
> +    '*stream-name': 'str',
> +    '*latency': 'uint32' } }
> +
> +##
> +# @AudiodevPipewireOptions:
> +#
> +# Options of the Pipewire audio backend.
> +#
> +# @in: options of the capture stream
> +#
> +# @out: options of the playback stream
> +#
> +# Since: 8.0
> +##

Since: 8.1

> +{ 'struct': 'AudiodevPipewireOptions',
> +  'data': {
> +    '*in':     'AudiodevPipewirePerDirectionOptions',
> +    '*out':    'AudiodevPipewirePerDirectionOptions' } }
> +
>   ##
>   # @AudiodevSdlPerDirectionOptions:
>   #
> @@ -416,6 +455,7 @@
>               { 'name': 'jack', 'if': 'CONFIG_AUDIO_JACK' },
>               { 'name': 'oss', 'if': 'CONFIG_AUDIO_OSS' },
>               { 'name': 'pa', 'if': 'CONFIG_AUDIO_PA' },
> +            { 'name': 'pipewire', 'if': 'CONFIG_AUDIO_PIPEWIRE' },
>               { 'name': 'sdl', 'if': 'CONFIG_AUDIO_SDL' },
>               { 'name': 'sndio', 'if': 'CONFIG_AUDIO_SNDIO' },
>               { 'name': 'spice', 'if': 'CONFIG_SPICE' },
> @@ -456,6 +496,8 @@
>                      'if': 'CONFIG_AUDIO_OSS' },
>       'pa':        { 'type': 'AudiodevPaOptions',
>                      'if': 'CONFIG_AUDIO_PA' },
> +    'pipewire':  { 'type': 'AudiodevPipewireOptions',
> +                   'if': 'CONFIG_AUDIO_PIPEWIRE' },
>       'sdl':       { 'type': 'AudiodevSdlOptions',
>                      'if': 'CONFIG_AUDIO_SDL' },
>       'sndio':     { 'type': 'AudiodevSndioOptions',
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 59bdf67a2c..17e1b7ad24 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -779,6 +779,11 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
>       "                in|out.name= source/sink device name\n"
>       "                in|out.latency= desired latency in microseconds\n"
>   #endif
> +#ifdef CONFIG_AUDIO_PIPEWIRE
> +    "-audiodev pipewire,id=id[,prop[=value][,...]]\n"
> +    "                in|out.name= source/sink device name\n"

The in|out.stream-name options are missing.

> +    "                latency= desired latency in microseconds\n"
> +#endif
>   #ifdef CONFIG_AUDIO_SDL
>       "-audiodev sdl,id=id[,prop[=value][,...]]\n"
>       "                in|out.buffer-count= number of buffers\n"
> @@ -942,6 +947,18 @@ SRST
>           Desired latency in microseconds. The PulseAudio server will try
>           to honor this value but actual latencies may be lower or higher.
>   
> +``-audiodev pipewire,id=id[,prop[=value][,...]]``
> +    Creates a backend using Pipewire. This backend is available on
> +    most systems.
> +
> +    Pipewire specific options are:
> +
> +    ``in|out.latency=usecs``
> +        Desired latency in microseconds.
> +
> +    ``in|out.name=sink``
> +        Use the specified source/sink for recording/playback.

The in|out.stream-name options are missing.

The pipewire backend code doesn't use the in|out.name options. Please 
either remove the name options or add code to connect to the specified 
source/sink. I would prefer the latter. PW_KEY_TARGET_OBJECT looks 
promising.

With best regards,
Volker

> +
>   ``-audiodev sdl,id=id[,prop[=value][,...]]``
>       Creates a backend using SDL. This backend is available on most
>       systems, but you should use your platform's native backend if
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 009fab1515..ba1057b62c 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -1,7 +1,8 @@
>   # This file is generated by meson-buildoptions.py, do not edit!
>   meson_options_help() {
> -  printf "%s\n" '  --audio-drv-list=CHOICES Set audio driver list [default] (choices: alsa/co'
> -  printf "%s\n" '                           reaudio/default/dsound/jack/oss/pa/sdl/sndio)'
> +  printf "%s\n" '  --audio-drv-list=CHOICES Set audio driver list [default] (choices: al'
> +  printf "%s\n" '                           sa/coreaudio/default/dsound/jack/oss/pa/'
> +  printf "%s\n" '                           pipewire/sdl/sndio)'
>     printf "%s\n" '  --block-drv-ro-whitelist=VALUE'
>     printf "%s\n" '                           set block driver read-only whitelist (by default'
>     printf "%s\n" '                           affects only QEMU, not tools like qemu-img)'
> @@ -136,6 +137,7 @@ meson_options_help() {
>     printf "%s\n" '  oss             OSS sound support'
>     printf "%s\n" '  pa              PulseAudio sound support'
>     printf "%s\n" '  parallels       parallels image format support'
> +  printf "%s\n" '  pipewire        Pipewire sound support'
>     printf "%s\n" '  png             PNG support with libpng'
>     printf "%s\n" '  pvrdma          Enable PVRDMA support'
>     printf "%s\n" '  qcow1           qcow1 image format support'
> @@ -370,6 +372,8 @@ _meson_option_parse() {
>       --disable-pa) printf "%s" -Dpa=disabled ;;
>       --enable-parallels) printf "%s" -Dparallels=enabled ;;
>       --disable-parallels) printf "%s" -Dparallels=disabled ;;
> +    --enable-pipewire) printf "%s" -Dpipewire=enabled ;;
> +    --disable-pipewire) printf "%s" -Dpipewire=disabled ;;
>       --with-pkgversion=*) quote_sh "-Dpkgversion=$2" ;;
>       --enable-png) printf "%s" -Dpng=enabled ;;
>       --disable-png) printf "%s" -Dpng=disabled ;;


