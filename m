Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494AC69AE22
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 15:35:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT1o0-00077c-79; Fri, 17 Feb 2023 09:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pT1nx-00077M-Hs
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:33:41 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pT1ns-0005AD-Sx
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=mI7omVXqmbPkldLWolqDWAN9USh9ozsRMTnxhEod3HE=; b=lzSJJz39O2Rtcg0U79vj1v/P2t
 l75eVPf6WzXmUAl5ewMWuzquKHTU9fm6duKzrIvKZObn4zV642E9lxVlRuuPgrllzk2pl27sSKWyi
 OAkhtlzaF3eSI1hNuadye9AJOvHrFHulSt7a59eMBJp3QbhuS5Cajd75h9uUBZCKsSu4yYAiyU8n0
 B0R/xXtL5uUq38Hxs059uAafeBTxruRkkOjjkwqklf2gfrkfZk8x/tXmYyDbHjDvP0iIc2V8nDnm5
 wQSoA2mbRFKlfAeWhdM8m0mPKOsTNrJh5lh5MzK0Iq7pqmpXdLykmArllRYhViGYKHvsSL/AF6zlY
 tvl6FnkIhfp4ONjlkRyGEx9ZwCHYX7UKh7iPA2OxOC6ledoYvcQ4TXssLzb6yGhIfDPs4RM1f6PBN
 eIlCMdNrOO2sOqd5WLbnIV6+wH92l5Q8Wgwm6tX6Wx0j1xVsOE4Qh2MpvNSeJww55NO5hkbbm7U69
 bYTph7lLJhDWOE2pnCxi5z0umqUCMUgd7UjotbXUzzuyaPA78nVxyFfFuIK1y24G+55olPiloiioy
 zFeIebCWNseWzDzkfN4NSr84am1qcfdZq0oOI33OHYGmjRKTVgyZOdZ2QiZqyXW98nXPJr7lm3Ebs
 b2mFj7ok7FJFCR9b4vvHUU23beYoCVFll6Y6kSMUk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, armbru@redhat.com, pbonzini@redhat.com,
 wtaymans@redhat.com, Dorinda Bassey <dbassey@redhat.com>,
 Dorinda Bassey <dbassey@redhat.com>
Subject: Re: [PATCH v3] audio/pwaudio.c: Add Pipewire audio backend for QEMU
Date: Fri, 17 Feb 2023 15:33:31 +0100
Message-ID: <59881618.nq915uMESp@silver>
In-Reply-To: <20230217071143.198377-1-dbassey@redhat.com>
References: <20230217071143.198377-1-dbassey@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

On Friday, February 17, 2023 8:11:43 AM CET Dorinda Bassey wrote:
> This commit adds a new audiodev backend to allow QEMU to use Pipewire as
> both an audio sink and source. This backend is available on most systems
>=20
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
>=20
> Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
> ---
> v3:
> Wrap commit log
> add checks for v->stream
> use constants instead of literals
> fix typo error
>=20
>  audio/audio.c                 |   3 +
>  audio/audio_template.h        |   4 +
>  audio/meson.build             |   1 +
>  audio/pwaudio.c               | 827 ++++++++++++++++++++++++++++++++++
>  meson.build                   |   7 +
>  meson_options.txt             |   4 +-
>  qapi/audio.json               |  45 ++
>  qemu-options.hx               |  17 +
>  scripts/meson-buildoptions.sh |   8 +-
>  9 files changed, 913 insertions(+), 3 deletions(-)
>  create mode 100644 audio/pwaudio.c
>=20
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
> @@ -355,6 +355,10 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TY=
PE)(Audiodev *dev)
>      case AUDIODEV_DRIVER_PA:
>          return qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE);
>  #endif
> +#ifdef CONFIG_AUDIO_PIPEWIRE
> +    case AUDIODEV_DRIVER_PIPEWIRE:
> +        return qapi_AudiodevPipewirePerDirectionOptions_base(dev->u.pipe=
wire.TYPE);
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
> index 0000000000..05a00b0859
> --- /dev/null
> +++ b/audio/pwaudio.c
> @@ -0,0 +1,827 @@
> +/*
> + * QEMU Pipewire audio driver
> + *
> + * Copyright (c) 2023 Red Hat Inc.
> + *
> + * Author: Dorinda Bassey       <dbassey@redhat.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this software and associated documentation files (the "Software"),=
 to deal
> + * in the Software without restriction, including without limitation the=
 rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
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
> +#define BUFFER_SAMPLES    512
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
> +    PWVoice *v =3D (PWVoice *) data;
> +    spa_hook_remove(&v->stream_listener);
> +    v->stream =3D NULL;
> +}
> +
> +/* output data processing function to read stuffs from the buffer */
> +static void
> +playback_on_process(void *data)
> +{
> +    PWVoice *v =3D (PWVoice *) data;
> +    void *p;
> +    struct pw_buffer *b;
> +    struct spa_buffer *buf;
> +    uint32_t n_frames, req, index, n_bytes;
> +    int32_t avail;
> +
> +    if (!v->stream) {
> +        return;
> +    }
> +
> +    /* obtain a buffer to read from */
> +    b =3D pw_stream_dequeue_buffer(v->stream);
> +    if (b =3D=3D NULL) {
> +        pw_log_warn("out of buffers: %m");
> +        return;
> +    }
> +
> +    buf =3D b->buffer;
> +    p =3D buf->datas[0].data;
> +    if (p =3D=3D NULL) {
> +        return;
> +    }
> +    req =3D b->requested * v->frame_size;
> +    if (req =3D=3D 0) {
> +        req =3D 4096 * v->frame_size;
> +    }
> +    n_frames =3D SPA_MIN(req, buf->datas[0].maxsize);
> +    n_bytes =3D n_frames * v->frame_size;
> +
> +    /* get no of available bytes to read data from buffer */
> +
> +    avail =3D spa_ringbuffer_get_read_index(&v->ring, &index);
> +
> +    if (!v->enabled) {
> +        avail =3D 0;
> +    }
> +
> +    if (avail =3D=3D 0) {
> +        memset(p, 0, n_bytes);
> +    } else {
> +        if (avail < (int32_t) n_bytes) {
> +            n_bytes =3D avail;
> +        }
> +
> +        spa_ringbuffer_read_data(&v->ring,
> +                                    v->buffer, RINGBUFFER_SIZE,
> +                                    index & RINGBUFFER_MASK, p, n_bytes);
> +
> +        index +=3D n_bytes;
> +        spa_ringbuffer_read_update(&v->ring, index);
> +    }
> +
> +    buf->datas[0].chunk->offset =3D 0;
> +    buf->datas[0].chunk->stride =3D v->frame_size;
> +    buf->datas[0].chunk->size =3D n_bytes;
> +
> +    /* queue the buffer for playback */
> +    pw_stream_queue_buffer(v->stream, b);
> +}
> +
> +/* output data processing function to generate stuffs in the buffer */
> +static void
> +capture_on_process(void *data)
> +{
> +    PWVoice *v =3D (PWVoice *) data;
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
> +    b =3D pw_stream_dequeue_buffer(v->stream);
> +    if (b =3D=3D NULL) {
> +        pw_log_warn("out of buffers: %m");
> +        return;
> +    }
> +
> +    /* Write data into buffer */
> +    buf =3D b->buffer;
> +    p =3D buf->datas[0].data;
> +    if (p =3D=3D NULL) {
> +        return;
> +    }
> +    offs =3D SPA_MIN(buf->datas[0].chunk->offset, buf->datas[0].maxsize);
> +    n_bytes =3D SPA_MIN(buf->datas[0].chunk->size, buf->datas[0].maxsize=
 - offs);
> +
> +    filled =3D spa_ringbuffer_get_write_index(&v->ring, &index);
> +
> +    if (!v->enabled) {
> +        n_bytes =3D 0;
> +    }
> +
> +    if (filled < 0) {
> +        pw_log_warn("%p: underrun write:%u filled:%d", p, index, filled);
> +    } else {
> +        if ((uint32_t) filled + n_bytes > RINGBUFFER_SIZE) {
> +            pw_log_warn("%p: overrun write:%u filled:%d + size:%u > max:=
%u",
> +            p, index, filled, n_bytes, RINGBUFFER_SIZE);
> +        }
> +    }
> +    spa_ringbuffer_write_data(&v->ring,
> +                                v->buffer, RINGBUFFER_SIZE,
> +                                index & RINGBUFFER_MASK,
> +                                SPA_PTROFF(p, offs, void), n_bytes);
> +    index +=3D n_bytes;
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
> +    PWVoice *v =3D (PWVoice *) _data;
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
> +static const struct pw_stream_events capture_stream_events =3D {
> +    PW_VERSION_STREAM_EVENTS,
> +    .destroy =3D stream_destroy,
> +    .state_changed =3D on_stream_state_changed,
> +    .process =3D capture_on_process
> +};
> +
> +static const struct pw_stream_events playback_stream_events =3D {
> +    PW_VERSION_STREAM_EVENTS,
> +    .destroy =3D stream_destroy,
> +    .state_changed =3D on_stream_state_changed,
> +    .process =3D playback_on_process
> +};
> +
> +static size_t
> +qpw_read(HWVoiceIn *hw, void *data, size_t len)
> +{
> +    PWVoiceIn *pw =3D (PWVoiceIn *) hw;
> +    PWVoice *v =3D &pw->v;
> +    pwaudio *c =3D v->g;
> +    const char *error =3D NULL;
> +    size_t l;
> +    int32_t avail;
> +    uint32_t index;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +    if (pw_stream_get_state(v->stream, &error) !=3D PW_STREAM_STATE_STRE=
AMING) {
> +        /* wait for stream to become ready */
> +        l =3D 0;
> +        goto done_unlock;
> +    }
> +    /* get no of available bytes to read data from buffer */
> +    avail =3D spa_ringbuffer_get_read_index(&v->ring, &index);
> +
> +    if (avail < (int32_t) len) {
> +        len =3D avail;
> +    }
> +
> +    spa_ringbuffer_read_data(&v->ring,
> +                             v->buffer, RINGBUFFER_SIZE,
> +                             index & RINGBUFFER_MASK, data, len);
> +    index +=3D len;
> +    spa_ringbuffer_read_update(&v->ring, index);
> +    l =3D len;
> +
> +done_unlock:
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return l;
> +}
> +
> +static size_t
> +qpw_write(HWVoiceOut *hw, void *data, size_t len)
> +{
> +    PWVoiceOut *pw =3D (PWVoiceOut *) hw;
> +    PWVoice *v =3D &pw->v;
> +    pwaudio *c =3D v->g;
> +    const char *error =3D NULL;
> +    const int period =3D 3;

Better `periods`, plural?

> +    size_t l;
> +    int32_t filled, avail;
> +    uint32_t index;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +    if (pw_stream_get_state(v->stream, &error) !=3D PW_STREAM_STATE_STRE=
AMING) {
> +        /* wait for stream to become ready */
> +        l =3D 0;
> +        goto done_unlock;
> +    }
> +    filled =3D spa_ringbuffer_get_write_index(&v->ring, &index);
> +
> +    avail =3D BUFFER_SAMPLES * v->frame_size * period - filled;
> +
> +    pw_log_debug("%u %u %u %zu", filled, avail, index, len);
> +
> +    if (len > avail) {
> +        len =3D avail;
> +    }
> +
> +    if (filled < 0) {
> +        pw_log_warn("%p: underrun write:%u filled:%d", pw, index, filled=
);
> +    } else {
> +        if ((uint32_t) filled + len > RINGBUFFER_SIZE) {
> +            pw_log_warn("%p: overrun write:%u filled:%d + size:%zu > max=
:%u",
> +            pw, index, filled, len, RINGBUFFER_SIZE);
> +        }
> +    }
> +
> +    spa_ringbuffer_write_data(&v->ring,
> +                                v->buffer, RINGBUFFER_SIZE,
> +                                index & RINGBUFFER_MASK, data, len);
> +    index +=3D len;
> +    spa_ringbuffer_write_update(&v->ring, index);
> +    l =3D len;
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
> +        format =3D SPA_AUDIO_FORMAT_S8;
> +        break;
> +    case AUDIO_FORMAT_U8:
> +        format =3D SPA_AUDIO_FORMAT_U8;
> +        break;
> +    case AUDIO_FORMAT_S16:
> +        format =3D endianness ? SPA_AUDIO_FORMAT_S16_BE : SPA_AUDIO_FORM=
AT_S16_LE;
> +        break;
> +    case AUDIO_FORMAT_U16:
> +        format =3D endianness ? SPA_AUDIO_FORMAT_U16_BE : SPA_AUDIO_FORM=
AT_U16_LE;
> +        break;
> +    case AUDIO_FORMAT_S32:
> +        format =3D endianness ? SPA_AUDIO_FORMAT_S32_BE : SPA_AUDIO_FORM=
AT_S32_LE;
> +        break;
> +    case AUDIO_FORMAT_U32:
> +        format =3D endianness ? SPA_AUDIO_FORMAT_U32_BE : SPA_AUDIO_FORM=
AT_U32_LE;
> +        break;
> +    case AUDIO_FORMAT_F32:
> +        format =3D endianness ? SPA_AUDIO_FORMAT_F32_BE : SPA_AUDIO_FORM=
AT_F32_LE;
> +        break;
> +    default:
> +        dolog("Internal logic error: Bad audio format %d\n", fmt);
> +        format =3D SPA_AUDIO_FORMAT_U8;
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
> +        *frame_size =3D 1;
> +        return AUDIO_FORMAT_S8;
> +    case SPA_AUDIO_FORMAT_U8:
> +        *frame_size =3D 1;
> +        return AUDIO_FORMAT_U8;
> +    case SPA_AUDIO_FORMAT_S16_BE:
> +        *frame_size =3D 2;
> +        *endianness =3D 1;
> +        return AUDIO_FORMAT_S16;
> +    case SPA_AUDIO_FORMAT_S16_LE:
> +        *frame_size =3D 2;
> +        *endianness =3D 0;
> +        return AUDIO_FORMAT_S16;
> +    case SPA_AUDIO_FORMAT_U16_BE:
> +        *frame_size =3D 2;
> +        *endianness =3D 1;
> +        return AUDIO_FORMAT_U16;
> +    case SPA_AUDIO_FORMAT_U16_LE:
> +        *frame_size =3D 2;
> +        *endianness =3D 0;
> +        return AUDIO_FORMAT_U16;
> +    case SPA_AUDIO_FORMAT_S32_BE:
> +        *frame_size =3D 4;
> +        *endianness =3D 1;
> +        return AUDIO_FORMAT_S32;
> +    case SPA_AUDIO_FORMAT_S32_LE:
> +        *frame_size =3D 4;
> +        *endianness =3D 0;
> +        return AUDIO_FORMAT_S32;
> +    case SPA_AUDIO_FORMAT_U32_BE:
> +        *frame_size =3D 4;
> +        *endianness =3D 1;
> +        return AUDIO_FORMAT_U32;
> +    case SPA_AUDIO_FORMAT_U32_LE:
> +        *frame_size =3D 4;
> +        *endianness =3D 0;
> +        return AUDIO_FORMAT_U32;
> +    case SPA_AUDIO_FORMAT_F32_BE:
> +        *frame_size =3D 4;
> +        *endianness =3D 1;
> +        return AUDIO_FORMAT_F32;
> +    case SPA_AUDIO_FORMAT_F32_LE:
> +        *frame_size =3D 4;
> +        *endianness =3D 0;
> +        return AUDIO_FORMAT_F32;
> +    default:
> +        *frame_size =3D 1;
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
> +    v->stream =3D pw_stream_new(c->core, name, NULL);
> +
> +    if (v->stream =3D=3D NULL) {
> +        res =3D -errno;
> +        goto error;
> +    }
> +
> +    if (v->mode =3D=3D MODE_SOURCE) {
> +        pw_stream_add_listener(v->stream,
> +                            &v->stream_listener, &capture_stream_events,=
 v);
> +    } else {
> +        pw_stream_add_listener(v->stream,
> +                            &v->stream_listener, &playback_stream_events=
, v);
> +    }
> +
> +    n_params =3D 0;
> +    spa_pod_builder_init(&b, buffer, sizeof(buffer));
> +    params[n_params++] =3D spa_format_audio_raw_build(&b,
> +                            SPA_PARAM_EnumFormat,
> +                            &v->info);
> +
> +    /* connect the stream to a sink or source */
> +    res =3D pw_stream_connect(v->stream,
> +                            v->mode =3D=3D
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
> +    g_free(c);
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
> +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> +        v->info.position[2] =3D SPA_AUDIO_CHANNEL_FC;
> +        v->info.position[3] =3D SPA_AUDIO_CHANNEL_LFE;
> +        v->info.position[4] =3D SPA_AUDIO_CHANNEL_RL;
> +        v->info.position[5] =3D SPA_AUDIO_CHANNEL_RR;
> +        v->info.position[6] =3D SPA_AUDIO_CHANNEL_SL;
> +        v->info.position[7] =3D SPA_AUDIO_CHANNEL_SR;
> +        break;
> +    case 6:
> +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> +        v->info.position[2] =3D SPA_AUDIO_CHANNEL_FC;
> +        v->info.position[3] =3D SPA_AUDIO_CHANNEL_LFE;
> +        v->info.position[4] =3D SPA_AUDIO_CHANNEL_RL;
> +        v->info.position[5] =3D SPA_AUDIO_CHANNEL_RR;
> +        break;
> +    case 5:
> +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> +        v->info.position[2] =3D SPA_AUDIO_CHANNEL_FC;
> +        v->info.position[3] =3D SPA_AUDIO_CHANNEL_LFE;
> +        v->info.position[4] =3D SPA_AUDIO_CHANNEL_RC;
> +        break;
> +    case 4:
> +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> +        v->info.position[2] =3D SPA_AUDIO_CHANNEL_FC;
> +        v->info.position[3] =3D SPA_AUDIO_CHANNEL_RC;
> +        break;
> +    case 3:
> +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> +        v->info.position[2] =3D SPA_AUDIO_CHANNEL_LFE;
> +        break;
> +    case 2:
> +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> +        break;
> +    case 1:
> +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_MONO;
> +        break;
> +    default:
> +        for (size_t i =3D 0; i < v->info.channels; i++) {
> +            v->info.position[i] =3D SPA_AUDIO_CHANNEL_UNKNOWN;
> +        }
> +        break;
> +    }
> +
> +    /* create a new unconnected pwstream */
> +    r =3D create_stream(c, v, name);
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
> +    PWVoiceOut *pw =3D (PWVoiceOut *) hw;
> +    PWVoice *v =3D &pw->v;
> +    struct audsettings obt_as =3D *as;
> +    pwaudio *c =3D v->g =3D drv_opaque;
> +    AudiodevPipewireOptions *popts =3D &c->dev->u.pipewire;
> +    AudiodevPipewirePerDirectionOptions *ppdo =3D popts->out;
> +    int r;
> +    v->enabled =3D false;
> +
> +    v->mode =3D MODE_SINK;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +
> +    v->info.format =3D audfmt_to_pw(as->fmt, as->endianness);
> +    v->info.channels =3D as->nchannels;
> +    v->info.rate =3D as->freq;
> +
> +    obt_as.fmt =3D
> +        pw_to_audfmt(v->info.format, &obt_as.endianness, &v->frame_size);
> +    v->frame_size *=3D as->nchannels;
> +
> +    /* call the function that creates a new stream for playback */
> +    r =3D qpw_stream_new(c, v, ppdo->stream_name ? : c->dev->id);
> +    if (r < 0) {
> +        pw_log_error("qpw_stream_new for playback failed\n ");
> +        goto fail;
> +    }
> +
> +    /* report the audio format we support */
> +    audio_pcm_init_info(&hw->info, &obt_as);
> +
> +    /* report the buffer size to qemu */
> +    hw->samples =3D BUFFER_SAMPLES;
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
> +    PWVoiceIn *pw =3D (PWVoiceIn *) hw;
> +    PWVoice *v =3D &pw->v;
> +    struct audsettings obt_as =3D *as;
> +    pwaudio *c =3D v->g =3D drv_opaque;
> +    AudiodevPipewireOptions *popts =3D &c->dev->u.pipewire;
> +    AudiodevPipewirePerDirectionOptions *ppdo =3D popts->in;
> +    int r;
> +    v->enabled =3D false;
> +
> +    v->mode =3D MODE_SOURCE;
> +    pw_thread_loop_lock(c->thread_loop);
> +
> +    v->info.format =3D audfmt_to_pw(as->fmt, as->endianness);
> +    v->info.channels =3D as->nchannels;
> +    v->info.rate =3D as->freq;
> +
> +    obt_as.fmt =3D
> +        pw_to_audfmt(v->info.format, &obt_as.endianness, &v->frame_size);
> +    v->frame_size *=3D as->nchannels;
> +
> +    /* call the function that creates a new stream for recording */
> +    r =3D qpw_stream_new(c, v, ppdo->stream_name ? : c->dev->id);
> +    if (r < 0) {
> +        pw_log_error("qpw_stream_new for recording failed\n ");
> +        goto fail;
> +    }
> +
> +    /* report the audio format we support */
> +    audio_pcm_init_info(&hw->info, &obt_as);
> +
> +    /* report the buffer size to qemu */
> +    hw->samples =3D BUFFER_SAMPLES;
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
> +    PWVoiceOut *pw =3D (PWVoiceOut *) hw;
> +    PWVoice *v =3D &pw->v;
> +
> +    if (v->stream) {
> +        pwaudio *c =3D v->g;
> +        pw_thread_loop_lock(c->thread_loop);
> +        pw_stream_destroy(v->stream);
> +        v->stream =3D NULL;
> +        pw_thread_loop_unlock(c->thread_loop);
> +    }
> +}
> +
> +static void
> +qpw_fini_in(HWVoiceIn *hw)
> +{
> +    PWVoiceIn *pw =3D (PWVoiceIn *) hw;
> +    PWVoice *v =3D &pw->v;
> +
> +    if (v->stream) {
> +        pwaudio *c =3D v->g;
> +        pw_thread_loop_lock(c->thread_loop);
> +        pw_stream_destroy(v->stream);
> +        v->stream =3D NULL;
> +        pw_thread_loop_unlock(c->thread_loop);
> +    }
> +}
> +
> +static void
> +qpw_enable_out(HWVoiceOut *hw, bool enable)
> +{
> +    PWVoiceOut *po =3D (PWVoiceOut *) hw;
> +    PWVoice *v =3D &po->v;
> +    v->enabled =3D enable;
> +}
> +
> +static void
> +qpw_enable_in(HWVoiceIn *hw, bool enable)
> +{
> +    PWVoiceIn *pi =3D (PWVoiceIn *) hw;
> +    PWVoice *v =3D &pi->v;
> +    v->enabled =3D enable;
> +}
> +
> +static void
> +on_core_error(void *data, uint32_t id, int seq, int res, const char *mes=
sage)
> +{
> +    pwaudio *pw =3D data;
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
> +    pwaudio *pw =3D data;
> +    if (id =3D=3D PW_ID_CORE) {
> +        pw->seq =3D seq;
> +        pw_thread_loop_signal(pw->thread_loop, FALSE);
> +    }
> +}
> +
> +static const struct pw_core_events core_events =3D {
> +    PW_VERSION_CORE_EVENTS,
> +    .done =3D on_core_done,
> +    .error =3D on_core_error,
> +};
> +
> +static void *
> +qpw_audio_init(Audiodev *dev)
> +{
> +    pwaudio *pw;
> +    pw =3D g_new0(pwaudio, 1);
> +    pw_init(NULL, NULL);
> +
> +    AudiodevPipewireOptions *popts;
> +    AUD_log(AUDIO_CAP, "Initialize PW context\n");
> +    assert(dev->driver =3D=3D AUDIODEV_DRIVER_PIPEWIRE);
> +    popts =3D &dev->u.pipewire;
> +
> +    if (!popts->has_latency) {
> +        popts->has_latency =3D true;
> +        popts->latency =3D 15000;
> +    }
> +
> +    pw->dev =3D dev;
> +    pw->thread_loop =3D pw_thread_loop_new("Pipewire thread loop", NULL);
> +    if (pw->thread_loop =3D=3D NULL) {
> +        goto fail;
> +    }
> +    pw->context =3D
> +        pw_context_new(pw_thread_loop_get_loop(pw->thread_loop), NULL, 0=
);
> +
> +    if (pw_thread_loop_start(pw->thread_loop) < 0) {
> +        goto fail;
> +    }
> +
> +    pw_thread_loop_lock(pw->thread_loop);
> +
> +    pw->core =3D pw_context_connect(pw->context, NULL, 0);
> +    if (pw->core =3D=3D NULL) {
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
> +    pwaudio *pw =3D opaque;
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
> +static struct audio_pcm_ops qpw_pcm_ops =3D {
> +    .init_out =3D qpw_init_out,
> +    .fini_out =3D qpw_fini_out,
> +    .write =3D qpw_write,
> +    .buffer_get_free =3D audio_generic_buffer_get_free,
> +    .run_buffer_out =3D audio_generic_run_buffer_out,
> +    .enable_out =3D qpw_enable_out,
> +
> +    .init_in =3D qpw_init_in,
> +    .fini_in =3D qpw_fini_in,
> +    .read =3D qpw_read,
> +    .run_buffer_in =3D audio_generic_run_buffer_in,
> +    .enable_in =3D qpw_enable_in
> +};
> +
> +static struct audio_driver pw_audio_driver =3D {
> +    .name =3D "pipewire",
> +    .descr =3D "http://www.pipewire.org/",
> +    .init =3D qpw_audio_init,
> +    .fini =3D qpw_audio_fini,
> +    .pcm_ops =3D &qpw_pcm_ops,
> +    .can_be_default =3D 1,
> +    .max_voices_out =3D INT_MAX,
> +    .max_voices_in =3D INT_MAX,
> +    .voice_size_out =3D sizeof(PWVoiceOut),
> +    .voice_size_in =3D sizeof(PWVoiceIn),
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
>    jack =3D dependency('jack', required: get_option('jack'),
>                      method: 'pkg-config', kwargs: static_kwargs)
>  endif
> +pipewire =3D not_found
> +if not get_option('pipewire').auto() or (targetos =3D=3D 'linux' and hav=
e_system)
> +  pipewire =3D dependency('libpipewire-0.3', required: get_option('pipew=
ire'),
> +                    method: 'pkg-config', kwargs: static_kwargs)
> +endif

Doesn't compile for me with libpipewire-0.3.19:

=2E./audio/pwaudio.c: In function =E2=80=98playback_on_process=E2=80=99:
=2E./audio/pwaudio.c:118:12: error: =E2=80=98struct pw_buffer=E2=80=99 has =
no member named =E2=80=98requested=E2=80=99
  118 |     req =3D b->requested * v->frame_size;
      |            ^~

^- Requires libpipewire-0.3.50

=2E./audio/pwaudio.c: In function =E2=80=98capture_on_process=E2=80=99:
=2E./audio/pwaudio.c:204:33: error: implicit declaration of function =E2=80=
=98SPA_PTROFF=E2=80=99; did you mean =E2=80=98SPA_PTRDIFF=E2=80=99? [-Werro=
r=3Dimplicit-function-declaration]
  204 |                                 SPA_PTROFF(p, offs, void), n_bytes);
      |                                 ^~~~~~~~~~
      |                                 SPA_PTRDIFF
=2E./audio/pwaudio.c:204:33: error: nested extern declaration of =E2=80=98S=
PA_PTROFF=E2=80=99 [-Werror=3Dnested-externs]
=2E./audio/pwaudio.c:204:53: error: expected expression before =E2=80=98voi=
d=E2=80=99
  204 |                                 SPA_PTROFF(p, offs, void), n_bytes);
      |

^- Requires libpipewire-0.3.28

So you probably want to raise the version dependency in meson.build, or adj=
ust
the demanding code.

>  sndio =3D not_found
>  if not get_option('sndio').auto() or have_system
>    sndio =3D dependency('sndio', required: get_option('sndio'),
> @@ -1671,6 +1676,7 @@ if have_system
>      'jack': jack.found(),
>      'oss': oss.found(),
>      'pa': pulse.found(),
> +    'pipewire': pipewire.found(),
>      'sdl': sdl.found(),
>      'sndio': sndio.found(),
>    }
> @@ -3949,6 +3955,7 @@ endif
>  if targetos =3D=3D 'linux'
>    summary_info +=3D {'ALSA support':    alsa}
>    summary_info +=3D {'PulseAudio support': pulse}
> +  summary_info +=3D {'Pipewire support':   pipewire}
>  endif
>  summary_info +=3D {'JACK support':      jack}
>  summary_info +=3D {'brlapi support':    brlapi}
> diff --git a/meson_options.txt b/meson_options.txt
> index 7e5801db90..1b7847250d 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -21,7 +21,7 @@ option('tls_priority', type : 'string', value : 'NORMAL=
',
>  option('default_devices', type : 'boolean', value : true,
>         description: 'Include a default selection of devices in emulators=
')
>  option('audio_drv_list', type: 'array', value: ['default'],
> -       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss'=
, 'pa', 'sdl', 'sndio'],
> +       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss'=
, 'pa', 'pipewire', 'sdl', 'sndio'],
>         description: 'Set audio driver list')
>  option('block_drv_rw_whitelist', type : 'string', value : '',
>         description: 'set block driver read-write whitelist (by default a=
ffects only QEMU, not tools like qemu-img)')
> @@ -255,6 +255,8 @@ option('oss', type: 'feature', value: 'auto',
>         description: 'OSS sound support')
>  option('pa', type: 'feature', value: 'auto',
>         description: 'PulseAudio sound support')
> +option('pipewire', type: 'feature', value: 'auto',
> +       description: 'Pipewire sound support')
>  option('sndio', type: 'feature', value: 'auto',
>         description: 'sndio sound support')
> =20
> diff --git a/qapi/audio.json b/qapi/audio.json
> index 4e54c00f51..b872e9f10d 100644
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -324,6 +324,48 @@
>      '*out':    'AudiodevPaPerDirectionOptions',
>      '*server': 'str' } }
> =20
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
> index cafd8be8ed..95ed5e5c2d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -779,6 +779,11 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
>      "                in|out.name=3D source/sink device name\n"
>      "                in|out.latency=3D desired latency in microseconds\n"
>  #endif
> +#ifdef CONFIG_AUDIO_PIPEWIRE
> +    "-audiodev pipewire,id=3Did[,prop[=3Dvalue][,...]]\n"
> +    "                in|out.name=3D source/sink device name\n"
> +    "                latency=3D desired latency in microseconds\n"
> +#endif
>  #ifdef CONFIG_AUDIO_SDL
>      "-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]\n"
>      "                in|out.buffer-count=3D number of buffers\n"
> @@ -942,6 +947,18 @@ SRST
>          Desired latency in microseconds. The PulseAudio server will try
>          to honor this value but actual latencies may be lower or higher.
> =20
> +``-audiodev pipewire,id=3Did[,prop[=3Dvalue][,...]]``
> +    Creates a backend using Pipewire. This backend is available on
> +    most systems.
> +
> +    Pipewire specific options are:
> +
> +    ``latency=3Dlatency``
> +        Add extra latency to playback in microseconds
> +
> +    ``in|out.name=3Dsink``
> +        Use the specified source/sink for recording/playback.
> +
>  ``-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]``
>      Creates a backend using SDL. This backend is available on most
>      systems, but you should use your platform's native backend if
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 939cc114dd..05c0090118 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -1,7 +1,8 @@
>  # This file is generated by meson-buildoptions.py, do not edit!
>  meson_options_help() {
> -  printf "%s\n" '  --audio-drv-list=3DCHOICES Set audio driver list [def=
ault] (choices: alsa/co'
> -  printf "%s\n" '                           reaudio/default/dsound/jack/=
oss/pa/sdl/sndio)'
> +  printf "%s\n" '  --audio-drv-list=3DCHOICES Set audio driver list [def=
ault] (choices: al'
> +  printf "%s\n" '                           sa/coreaudio/default/dsound/=
jack/oss/pa/'
> +  printf "%s\n" '                           pipewire/sdl/sndio)'
>    printf "%s\n" '  --block-drv-ro-whitelist=3DVALUE'
>    printf "%s\n" '                           set block driver read-only w=
hitelist (by default'
>    printf "%s\n" '                           affects only QEMU, not tools=
 like qemu-img)'
> @@ -135,6 +136,7 @@ meson_options_help() {
>    printf "%s\n" '  oss             OSS sound support'
>    printf "%s\n" '  pa              PulseAudio sound support'
>    printf "%s\n" '  parallels       parallels image format support'
> +  printf "%s\n" '  pipewire        Pipewire sound support'
>    printf "%s\n" '  png             PNG support with libpng'
>    printf "%s\n" '  pvrdma          Enable PVRDMA support'
>    printf "%s\n" '  qcow1           qcow1 image format support'
> @@ -370,6 +372,8 @@ _meson_option_parse() {
>      --disable-pa) printf "%s" -Dpa=3Ddisabled ;;
>      --enable-parallels) printf "%s" -Dparallels=3Denabled ;;
>      --disable-parallels) printf "%s" -Dparallels=3Ddisabled ;;
> +    --enable-pipewire) printf "%s" -Dpipewire=3Denabled ;;
> +    --disable-pipewire) printf "%s" -Dpipewire=3Ddisabled ;;
>      --with-pkgversion=3D*) quote_sh "-Dpkgversion=3D$2" ;;
>      --enable-png) printf "%s" -Dpng=3Denabled ;;
>      --disable-png) printf "%s" -Dpng=3Ddisabled ;;
>=20



