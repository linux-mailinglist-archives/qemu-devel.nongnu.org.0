Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E86B69935B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:41:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pScdb-000836-Df; Thu, 16 Feb 2023 06:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pScdZ-00082p-NY
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:41:18 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pScdV-00010X-Fj
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:41:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=v20GT8s1spN/hLmfxoXNgHbLIpF++HaqRNeT9324ybs=; b=Cpl0ZuO3z54bCSaTtYiYcHmlQX
 DU645gaJcLFqam3Fd9y/IyZtErTwXFK6GTE0TDiOJCvh6bigc5aEmAdiylxj60570MTDDzBvvu6UG
 6Mr7Cdw3H/K6coMHWin6twi4RCQCqITiCeil8uAvDQUaF3xh5+QzkSnFfEWlbrW8rbYNRcsBM4SkP
 ZaOCn8Bt2GjCUhIWTZpzpiuSM0swTUZ0HrqZICOTxlVieHvmp6l4dsest/6Bvb8o1+Y6uHeywXzYV
 JWNoubZGjIVBIeG+O5MtIDavY5hxNiBrHgLDSzQU9Ax47UyEy06XV17Ze9w4g8cphwF1wcCSUGbc6
 oa4CussdD8hUwae9PcaTC8/ggW2K7LODMQ13JnwunbM2hfbmuHxhbcn/TPYyPoLouIDpZzEDWAPVk
 eeRcE8LIufsgGuNL98auQMshL7CNf5VaRFYFdlkZHU/hdPi1JjoGB8KVouGOVmMyvOOP3+/NcIymb
 rAB6IyeJJWa1UGMcSY5QGz0A7VDJJPd1aNXz6r8Nh6KhD42IoZ9xDzLUIITd058XV9lHQeO0iQRq9
 7BELuQUNOWbGW3kim2STr6mgUhEx1aZYmNXENhahmOwuK2IbD0cS8mPa14yKLOXK8XaMEg7g2nWkf
 Rg2S3nyaxd9ufohTVpeS+PMUI7iT1J374rf8dcSEk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, armbru@redhat.com, pbonzini@redhat.com,
 wtaymans@redhat.com, Dorinda Bassey <dbassey@redhat.com>
Subject: Re: [PATCH v2] audio/pwaudio.c: Add Pipewire audio backend for QEMU
Date: Thu, 16 Feb 2023 12:41:10 +0100
Message-ID: <3927829.46xv3xUdxJ@silver>
In-Reply-To: <20230216082544.119313-1-dbassey@redhat.com>
References: <20230216082544.119313-1-dbassey@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thursday, February 16, 2023 9:25:44 AM CET Dorinda Bassey wrote:
> This commit adds a new audiodev backend to allow QEMU to use Pipewire as both an audio sink and source.
> 

Please wrap commit log.

> Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
> ---
> v2:
> * Shorten commit message
> * fix copyright ownership and authour
> * use QEMU standard of 4 space indentation
> * verbose use of pipewire instead pf pw
> 
>  audio/audio.c                 |   3 +
>  audio/audio_template.h        |   4 +
>  audio/meson.build             |   1 +
>  audio/pwaudio.c               | 818 ++++++++++++++++++++++++++++++++++
>  meson.build                   |   7 +
>  meson_options.txt             |   4 +-
>  qapi/audio.json               |  45 ++
>  qemu-options.hx               |  17 +
>  scripts/meson-buildoptions.sh |   8 +-
>  9 files changed, 904 insertions(+), 3 deletions(-)
>  create mode 100644 audio/pwaudio.c
> 
> diff --git a/audio/audio.c b/audio/audio.c
> index 4290309d18..aa55e41ad8 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -2069,6 +2069,9 @@ void audio_create_pdos(Audiodev *dev)
>  #ifdef CONFIG_AUDIO_PA
>          CASE(PA, pa, Pa);
>  #endif
> +#ifdef CONFIG_AUDIO_PIPEWIRE
> +        CASE(PIPEWIRE, pipewire, Pipewire);
> +#endif
>  #ifdef CONFIG_AUDIO_SDL
>          CASE(SDL, sdl, Sdl);
>  #endif
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index 42b4712acb..0f02afb921 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -355,6 +355,10 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
>      case AUDIODEV_DRIVER_PA:
>          return qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE);
>  #endif
> +#ifdef CONFIG_AUDIO_PIPEWIRE
> +    case AUDIODEV_DRIVER_PIPEWIRE:
> +        return qapi_AudiodevPipewirePerDirectionOptions_base(dev->u.pipewire.TYPE);
> +#endif
>  #ifdef CONFIG_AUDIO_SDL
>      case AUDIODEV_DRIVER_SDL:
>          return qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.TYPE);
> diff --git a/audio/meson.build b/audio/meson.build
> index 0722224ba9..65a49c1a10 100644
> --- a/audio/meson.build
> +++ b/audio/meson.build
> @@ -19,6 +19,7 @@ foreach m : [
>    ['sdl', sdl, files('sdlaudio.c')],
>    ['jack', jack, files('jackaudio.c')],
>    ['sndio', sndio, files('sndioaudio.c')],
> +  ['pipewire', pipewire, files('pwaudio.c')],
>    ['spice', spice, files('spiceaudio.c')]
>  ]
>    if m[1].found()
> diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> new file mode 100644
> index 0000000000..bb25133414
> --- /dev/null
> +++ b/audio/pwaudio.c
> @@ -0,0 +1,818 @@
> +/*
> + * QEMU Pipewire audio driver
> + *
> + * Copyright (c) 2023 Red Hat Inc.
> + *
> + * Author: Dorinda Bassey       <dbassey@redhat.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/module.h"
> +#include "audio.h"
> +#include <errno.h>
> +#include <spa/param/audio/format-utils.h>
> +#include <spa/utils/ringbuffer.h>
> +#include <spa/utils/result.h>
> +
> +#include <pipewire/pipewire.h>
> +
> +#define AUDIO_CAP "pipewire"
> +#define RINGBUFFER_SIZE    (1u << 22)
> +#define RINGBUFFER_MASK    (RINGBUFFER_SIZE - 1)
> +#define BUFFER_SAMPLES    128

BUFFER_SAMPLES is not used anywhere, and in code you are using 512 as literals
instead.

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
> +    uint32_t frame_size;
> +    struct spa_ringbuffer ring;
> +    uint8_t buffer[RINGBUFFER_SIZE];

s/buffer/ringbuffer/ maybe?

> +
> +    uint32_t mode;
> +    struct pw_properties *props;
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
> +    uint32_t n_frames, req, index, n_bytes;
> +    int32_t avail;
> +

if (!v->stream) {
    return;
}

As pw_stream_dequeue_buffer() apparently can't cope with NULL.

> +    /* obtain a buffer to read from */
> +    b = pw_stream_dequeue_buffer(v->stream);
> +    if (b == NULL) {
> +        pw_log_warn("out of buffers: %m");
> +        return;
> +    }
> +
> +    buf = b->buffer;
> +    p = buf->datas[0].data;
> +    if (p == NULL) {
> +        return;
> +    }
> +    req = b->requested * v->frame_size;
> +    if (req == 0) {
> +        req = 4096 * v->frame_size;
> +    }

Why exactly 4k?

> +    n_frames = SPA_MIN(req, buf->datas[0].maxsize);
> +    n_bytes = n_frames * v->frame_size;
> +
> +    /* get no of available bytes to read data from buffer */
> +
> +    avail = spa_ringbuffer_get_read_index(&v->ring, &index);
> +
> +    if (!v->enabled) {
> +        avail = 0;
> +    }
> +
> +    if (avail == 0) {
> +        memset(p, 0, n_bytes);
> +    } else {
> +        if (avail < (int32_t) n_bytes) {
> +            n_bytes = avail;
> +        }
> +
> +        spa_ringbuffer_read_data(&v->ring,
> +                                    v->buffer, RINGBUFFER_SIZE,
> +                                    index & RINGBUFFER_MASK, p, n_bytes);
> +
> +        index += n_bytes;
> +        spa_ringbuffer_read_update(&v->ring, index);
> +    }
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

if (!v->stream) {
    return;
}

> +    /* obtain a buffer */
> +    b = pw_stream_dequeue_buffer(v->stream);
> +    if (b == NULL) {
> +        pw_log_warn("out of buffers: %m");
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
> +        pw_log_warn("%p: underrun write:%u filled:%d", p, index, filled);
> +    } else {
> +        if ((uint32_t) filled + n_bytes > RINGBUFFER_SIZE) {
> +            pw_log_warn("%p: overrun write:%u filled:%d + size:%u > max:%u",
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
> +    printf("stream state: \"%s\"\n", pw_stream_state_as_string(state));
> +
> +    switch (state) {
> +    case PW_STREAM_STATE_ERROR:
> +    case PW_STREAM_STATE_UNCONNECTED:
> +        {
> +            break;
> +        }
> +    case PW_STREAM_STATE_PAUSED:
> +        printf("node id: %d\n", pw_stream_get_node_id(v->stream));
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
> +static size_t
> +qpw_write(HWVoiceOut *hw, void *data, size_t len)
> +{
> +    PWVoiceOut *pw = (PWVoiceOut *) hw;
> +    PWVoice *v = &pw->v;
> +    pwaudio *c = v->g;
> +    const char *error = NULL;
> +    size_t l;
> +    int32_t filled, avail;
> +    uint32_t index;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +    if (pw_stream_get_state(v->stream, &error) != PW_STREAM_STATE_STREAMING) {
> +        /* wait for stream to become ready */
> +        l = 0;
> +        goto done_unlock;
> +    }
> +    filled = spa_ringbuffer_get_write_index(&v->ring, &index);
> +
> +    avail = 512 * v->frame_size * 3 - filled;

I would not use literals for period size and number of periods directly in
code. Better use macros or constants instead.

> +
> +    pw_log_debug("%u %u %u %zu", filled, avail, index, len);
> +
> +    if (len > avail) {
> +        len = avail;
> +    }
> +
> +    if (filled < 0) {
> +        pw_log_warn("%p: underrun write:%u filled:%d", pw, index, filled);
> +    } else {
> +        if ((uint32_t) filled + len > RINGBUFFER_SIZE) {
> +            pw_log_warn("%p: overrun write:%u filled:%d + size:%zu > max:%u",
> +            pw, index, filled, len, RINGBUFFER_SIZE);
> +        }
> +    }
> +
> +    spa_ringbuffer_write_data(&v->ring,
> +                                v->buffer, RINGBUFFER_SIZE,
> +                                index & RINGBUFFER_MASK, data, len);
> +    index += len;
> +    spa_ringbuffer_write_update(&v->ring, index);
> +    l = len;
> +
> +done_unlock:
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return l;
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
> +
> +    v->stream = pw_stream_new(c->core, name, NULL);
> +
> +    if (v->stream == NULL) {
> +        res = -errno;
> +        goto error;
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
> +        goto error;
> +    }
> +
> +    return 0;
> +error:
> +    return res;
> +}
> +
> +static void
> +pw_destroy(pwaudio *c)
> +{
> +    if (c->thread_loop) {
> +        pw_thread_loop_stop(c->thread_loop);
> +    }
> +    if (c->core) {
> +        pw_core_disconnect(c->core);
> +    }
> +
> +    free(c);

g_free(c);

> +}
> +
> +static int
> +qpw_stream_new(pwaudio *c, PWVoice *v, const char *name)
> +{
> +    int r;
> +
> +    pw_thread_loop_lock(c->thread_loop);
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
> +        goto error;
> +    }
> +
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return r;
> +
> +error:
> +    AUD_log(AUDIO_CAP, "Failed to create stream.");
> +    pw_thread_loop_unlock(c->thread_loop);
> +    pw_destroy(c);
> +    return -1;
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
> +        pw_log_error("qpw_stream_new for playback failed\n ");
> +        goto fail;
> +    }
> +
> +    /* report the audio format we support */
> +    audio_pcm_init_info(&hw->info, &obt_as);
> +
> +    /* report the buffer size to qemu */
> +    hw->samples = 512;
> +
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return 0;
> +fail:
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return -1;
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
> +        pw_log_error("qpw_stream_new for recording failed\n ");
> +        goto fail;
> +    }
> +
> +    /* report the audio format we support */
> +    audio_pcm_init_info(&hw->info, &obt_as);
> +
> +    /* report the buffer size to qemu */
> +    hw->samples = 512;
> +
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return 0;
> +fail:
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return -1;
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
> +
> +static void
> +on_core_error(void *data, uint32_t id, int seq, int res, const char *message)
> +{
> +    pwaudio *pw = data;
> +
> +    pw_log_warn("error id:%u seq:%d res:%d (%s): %s",
> +                id, seq, res, spa_strerror(res), message);
> +
> +    pw_thread_loop_signal(pw->thread_loop, FALSE);
> +}
> +
> +static void
> +on_core_done(void *data, uint32_t id, int seq)
> +{
> +    pwaudio *pw = data;
> +    if (id == PW_ID_CORE) {
> +        pw->seq = seq;
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
> +    pwaudio *pw;
> +    pw = g_new0(pwaudio, 1);
> +    pw_init(NULL, NULL);
> +
> +    AudiodevPipewireOptions *popts;
> +    AUD_log(AUDIO_CAP, "Initialize PW context\n");
> +    assert(dev->driver == AUDIODEV_DRIVER_PIPEWIRE);
> +    popts = &dev->u.pipewire;
> +
> +    if (!popts->has_latency) {
> +        popts->has_latency = true;
> +        popts->latency = 44100;
> +    }

Why 44ms?

> +
> +    pw->dev = dev;
> +    pw->thread_loop = pw_thread_loop_new("Pipewire thread loop", NULL);
> +    if (pw->thread_loop == NULL) {
> +        goto fail;
> +    }
> +    pw->context =
> +        pw_context_new(pw_thread_loop_get_loop(pw->thread_loop), NULL, 0);
> +
> +    if (pw_thread_loop_start(pw->thread_loop) < 0) {
> +        goto fail;
> +    }
> +
> +    pw_thread_loop_lock(pw->thread_loop);
> +
> +    pw->core = pw_context_connect(pw->context, NULL, 0);
> +    if (pw->core == NULL) {
> +        goto fail;
> +    }
> +
> +    pw_core_add_listener(pw->core, &pw->core_listener, &core_events, pw);
> +
> +    pw_thread_loop_unlock(pw->thread_loop);
> +
> +    return pw;
> +
> +fail:
> +    AUD_log(AUDIO_CAP, "Failed to initialize PW context");
> +    pw_thread_loop_unlock(pw->thread_loop);
> +    pw_context_destroy(pw->context);
> +    pw_thread_loop_destroy(pw->thread_loop);
> +    g_free(pw);
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
> +    .buffer_get_free = audio_generic_buffer_get_free,
> +    .run_buffer_out = audio_generic_run_buffer_out,
> +    .enable_out = qpw_enable_out,
> +
> +    .init_in = qpw_init_in,
> +    .fini_in = qpw_fini_in,
> +    .read = qpw_read,
> +    .run_buffer_in = audio_generic_run_buffer_in,
> +    .enable_in = qpw_enable_in
> +};
> +
> +static struct audio_driver pw_audio_driver = {
> +    .name = "pipewire",
> +    .descr = "http://www.pipewire.org/",
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
> diff --git a/meson.build b/meson.build
> index a76c855312..686fdd5b81 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -734,6 +734,11 @@ if not get_option('jack').auto() or have_system
>    jack = dependency('jack', required: get_option('jack'),
>                      method: 'pkg-config', kwargs: static_kwargs)
>  endif
> +pipewire = not_found
> +if not get_option('pipewire').auto() or (targetos == 'linux' and have_system)
> +  pipewire = dependency('libpipewire-0.3', required: get_option('pipewire'),
> +                    method: 'pkg-config', kwargs: static_kwargs)
> +endif
>  sndio = not_found
>  if not get_option('sndio').auto() or have_system
>    sndio = dependency('sndio', required: get_option('sndio'),
> @@ -1671,6 +1676,7 @@ if have_system
>      'jack': jack.found(),
>      'oss': oss.found(),
>      'pa': pulse.found(),
> +    'pipewire': pipewire.found(),
>      'sdl': sdl.found(),
>      'sndio': sndio.found(),
>    }
> @@ -3949,6 +3955,7 @@ endif
>  if targetos == 'linux'
>    summary_info += {'ALSA support':    alsa}
>    summary_info += {'PulseAudio support': pulse}
> +  summary_info += {'Pipewire support':   pipewire}
>  endif
>  summary_info += {'JACK support':      jack}
>  summary_info += {'brlapi support':    brlapi}
> diff --git a/meson_options.txt b/meson_options.txt
> index 7e5801db90..1b7847250d 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -21,7 +21,7 @@ option('tls_priority', type : 'string', value : 'NORMAL',
>  option('default_devices', type : 'boolean', value : true,
>         description: 'Include a default selection of devices in emulators')
>  option('audio_drv_list', type: 'array', value: ['default'],
> -       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'sdl', 'sndio'],
> +       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'pipewire', 'sdl', 'sndio'],
>         description: 'Set audio driver list')
>  option('block_drv_rw_whitelist', type : 'string', value : '',
>         description: 'set block driver read-write whitelist (by default affects only QEMU, not tools like qemu-img)')
> @@ -255,6 +255,8 @@ option('oss', type: 'feature', value: 'auto',
>         description: 'OSS sound support')
>  option('pa', type: 'feature', value: 'auto',
>         description: 'PulseAudio sound support')
> +option('pipewire', type: 'feature', value: 'auto',
> +       description: 'Pipewire sound support')
>  option('sndio', type: 'feature', value: 'auto',
>         description: 'sndio sound support')
>  
> diff --git a/qapi/audio.json b/qapi/audio.json
> index 4e54c00f51..b872e9f10d 100644
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -324,6 +324,48 @@
>      '*out':    'AudiodevPaPerDirectionOptions',
>      '*server': 'str' } }
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
> +#               instances (default: audiodev's id, since 7.1)
> +#
> +#
> +# Since: 7.2
> +##
> +{ 'struct': 'AudiodevPipewirePerDirectionOptions',
> +  'base': 'AudiodevPerDirectionOptions',
> +  'data': {
> +    '*name': 'str',
> +    '*stream-name': 'str' } }
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
> +# @latency: add latency to playback in microseconds
> +#           (default 44100)
> +#
> +# Since: 7.2
> +##
> +{ 'struct': 'AudiodevPipewireOptions',
> +  'data': {
> +    '*in':     'AudiodevPipewirePerDirectionOptions',
> +    '*out':    'AudiodevPipewirePerDirectionOptions',
> +    '*latency': 'uint32' } }
> +
>  ##
>  # @AudiodevSdlPerDirectionOptions:
>  #
> @@ -416,6 +458,7 @@
>              { 'name': 'jack', 'if': 'CONFIG_AUDIO_JACK' },
>              { 'name': 'oss', 'if': 'CONFIG_AUDIO_OSS' },
>              { 'name': 'pa', 'if': 'CONFIG_AUDIO_PA' },
> +            { 'name': 'pipewire', 'if': 'CONFIG_AUDIO_PIPEWIRE' },
>              { 'name': 'sdl', 'if': 'CONFIG_AUDIO_SDL' },
>              { 'name': 'sndio', 'if': 'CONFIG_AUDIO_SNDIO' },
>              { 'name': 'spice', 'if': 'CONFIG_SPICE' },
> @@ -456,6 +499,8 @@
>                     'if': 'CONFIG_AUDIO_OSS' },
>      'pa':        { 'type': 'AudiodevPaOptions',
>                     'if': 'CONFIG_AUDIO_PA' },
> +    'pipewire':  { 'type': 'AudiodevPipewireOptions',
> +                   'if': 'CONFIG_AUDIO_PIPEWIRE' },
>      'sdl':       { 'type': 'AudiodevSdlOptions',
>                     'if': 'CONFIG_AUDIO_SDL' },
>      'sndio':     { 'type': 'AudiodevSndioOptions',
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 88e93c6103..bde4830fab 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -779,6 +779,11 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
>      "                in|out.name= source/sink device name\n"
>      "                in|out.latency= desired latency in microseconds\n"
>  #endif
> +#ifdef CONFIG_AUDIO_PIPEWIRE
> +    "-audiodev pipewire,id=id[,prop[=value][,...]]\n"
> +    "                in|out.name= source/sink device name\n"
> +    "                latency= desired latency in microseconds\n"
> +#endif
>  #ifdef CONFIG_AUDIO_SDL
>      "-audiodev sdl,id=id[,prop[=value][,...]]\n"
>      "                in|out.buffer-count= number of buffers\n"
> @@ -942,6 +947,18 @@ SRST
>          Desired latency in microseconds. The PulseAudio server will try
>          to honor this value but actual latencies may be lower or higher.
>  
> +``-audiodev pipewire,id=id[,prop[=value][,...]]``
> +    Creates a backend using Pipewire. This backend is available on
> +    most systems.
> +
> +    Pipewire specific options are:
> +
> +    ``latency=latency``
> +        Add extra latency to playback in microseconds
> +
> +    ``in|out.name=sink``
> +        Use the specified source/sink for recording/playback.
> +
>  ``-audiodev sdl,id=id[,prop[=value][,...]]``
>      Creates a backend using SDL. This backend is available on most
>      systems, but you should use your platform's native backend if
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 180c11665a..d9f6525346 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -1,7 +1,8 @@
>  # This file is generated by meson-buildoptions.py, do not edit!
>  meson_options_help() {
> -  printf "%s\n" '  --audio-drv-list=CHOICES Set audio driver list [default] (choices: alsa/co'
> -  printf "%s\n" '                           reaudio/default/dsound/jack/oss/pa/sdl/sndio)'
> +  printf "%s\n" '  --audio-drv-list=CHOICES Set audio driver list [default] (choices: al'
> +  printf "%s\n" '                           sa/coreaudio/default/dsound/jack/oss/pa/'
> +  printf "%s\n" '                           pipewire/sdl/sndio)'
>    printf "%s\n" '  --block-drv-ro-whitelist=VALUE'
>    printf "%s\n" '                           set block driver read-only whitelist (by default'
>    printf "%s\n" '                           affects only QEMU, not tools like qemu-img)'
> @@ -135,6 +136,7 @@ meson_options_help() {
>    printf "%s\n" '  oss             OSS sound support'
>    printf "%s\n" '  pa              PulseAudio sound support'
>    printf "%s\n" '  parallels       parallels image format support'
> +  printf "%s\n" '  pipewire        Pipewire sound support'
>    printf "%s\n" '  png             PNG support with libpng'
>    printf "%s\n" '  pvrdma          Enable PVRDMA support'
>    printf "%s\n" '  qcow1           qcow1 image format support'
> @@ -370,6 +372,8 @@ _meson_option_parse() {
>      --disable-pa) printf "%s" -Dpa=disabled ;;
>      --enable-parallels) printf "%s" -Dparallels=enabled ;;
>      --disable-parallels) printf "%s" -Dparallels=disabled ;;
> +    --enable-pipewire) printf "%s" -Dpipewire=enabled ;;
> +    --disable-pipewire) printf "%s" -Dpipewire=disabled ;;
>      --with-pkgversion=*) quote_sh "-Dpkgversion=$2" ;;
>      --enable-png) printf "%s" -Dpng=enabled ;;
>      --disable-png) printf "%s" -Dpng=disabled ;;
> 



