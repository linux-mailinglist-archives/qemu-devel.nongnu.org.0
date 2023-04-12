Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E376DF7DF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 16:00:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmb0c-00031G-Mi; Wed, 12 Apr 2023 09:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pmb0a-00030r-9g
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:59:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pmb0T-0001Az-VB
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681307969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vFSBaMTUioE8Dtk+4jsXtNcWYGFl3UuE8wtJd7EjCPA=;
 b=J+5OMC8Cybvy27EPTJgII9iJwDliXgG3BaB26+rLK+h8EgJGAGhq+MFcsTw/rN9fqyNAqD
 QFpoK+OREl0GFi+ggKwNG2TTfFCNPtcVZ1p5MN3fSrB6KuTYODuAdZhzxBKC+2j60ROZ+a
 3uLEo7A+RFwV+VmwwC3sUSIig50RGNg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-K2EmxqlTNum7x4_FFDIBiQ-1; Wed, 12 Apr 2023 09:59:26 -0400
X-MC-Unique: K2EmxqlTNum7x4_FFDIBiQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 l20-20020a05622a051400b003e6d92a606bso4178170qtx.14
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 06:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681307966; x=1683899966;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vFSBaMTUioE8Dtk+4jsXtNcWYGFl3UuE8wtJd7EjCPA=;
 b=PIDPTTMCZVmSSVhtUsyoMycNX8GeHmOjI0ArNoh1RlCmgCkfvsGRAXk+i5Xp8vVOr3
 +KG5qSVdS4/7u/uHddnza8LfUPtRp8b/5TOdSwDHwv/uNFJ7lr48CbyUpNJkW8FtHz/t
 LoHGbNjVKoeo4r1qs1qBLWiRj1wCEY14BP4vwxBrQ1UhsM/edSZk+2bO+HnLF2IydC/H
 ePSa95JUjOw0eJNz+KPZK9x6mVN0icp4WderQMrhtI7D0iTRpm/DIaeYe06oI4v5Is5O
 5f1T5iKcb+/qgL1lNEaUEsqnY9nauj7BEyOXX86gsU/ADG349n1JoUUnFGKH98BWoIrZ
 OO5g==
X-Gm-Message-State: AAQBX9f2F22HILbr+ThljAtXcAhTqaArMowKmTm4aPvXzBq13nGluhDW
 AxqB7Z7a8VrMU5mVFzUHHkDILpHB7O6vmAi4cSoswkqy+KXTBBoTxWlmhJljgHAoIx7ve/ayMQ/
 uS1UXy0DQNRK/hCbzds+pJvOOFHKKG6Iv0YPAjnqg+PyR
X-Received: by 2002:a05:622a:1cf:b0:3de:748e:fd30 with SMTP id
 t15-20020a05622a01cf00b003de748efd30mr2192633qtw.10.1681307965850; 
 Wed, 12 Apr 2023 06:59:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZGutxF8YGqpfOS6NamlvqvbxeVEP4On2k82xp1jy6LBKEPRpAljJ3gnCrPmPR2HC2D3BDatCLtisx8LbfQASQ=
X-Received: by 2002:a05:622a:1cf:b0:3de:748e:fd30 with SMTP id
 t15-20020a05622a01cf00b003de748efd30mr2192617qtw.10.1681307965248; Wed, 12
 Apr 2023 06:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230412135730.51012-1-dbassey@redhat.com>
In-Reply-To: <20230412135730.51012-1-dbassey@redhat.com>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Wed, 12 Apr 2023 15:59:13 +0200
Message-ID: <CACzuRywAxttzMCB=8D_Lq+V-ZgTxAJs1azaB3Xxa+zN2zbufMA@mail.gmail.com>
Subject: Re: [PATCH v11] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: qemu-devel@nongnu.org
Cc: vr_qemu@t-online.de, marcandre.lureau@gmail.com, kraxel@redhat.com, 
 armbru@redhat.com, qemu_oss@crudebyte.com, pbonzini@redhat.com, 
 wtaymans@redhat.com
Content-Type: multipart/alternative; boundary="00000000000006e81d05f92404c6"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dbassey@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000006e81d05f92404c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volker,

It seems that for some unknown reason using audio_pcm_info_clear_buf in
playback_process causes segmentation fault. Hence I moved the handling of
buffer underruns from the playback process to the qpw_write process because
that is the underlying cause of buffer underrun.

Regards,
Dorinda.

On Wed, Apr 12, 2023 at 3:57=E2=80=AFPM Dorinda Bassey <dbassey@redhat.com>=
 wrote:

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
> v11:
> handle buffer underruns in qpw_write
> use local variable
> change param name frame_size
> fix format specifier
> change trace value to trace quantum
>
>  audio/audio.c                 |   3 +
>  audio/audio_template.h        |   4 +
>  audio/meson.build             |   1 +
>  audio/pwaudio.c               | 913 ++++++++++++++++++++++++++++++++++
>  audio/trace-events            |   8 +
>  meson.build                   |   8 +
>  meson_options.txt             |   4 +-
>  qapi/audio.json               |  44 ++
>  qemu-options.hx               |  21 +
>  scripts/meson-buildoptions.sh |   8 +-
>  10 files changed, 1011 insertions(+), 3 deletions(-)
>  create mode 100644 audio/pwaudio.c
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 70b096713c..90c7c49d11 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -2061,6 +2061,9 @@ void audio_create_pdos(Audiodev *dev)
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
> index e42326c20d..dc0c74aa74 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -362,6 +362,10 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_,
> TYPE)(Audiodev *dev)
>      case AUDIODEV_DRIVER_PA:
>          return qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE);
>  #endif
> +#ifdef CONFIG_AUDIO_PIPEWIRE
> +    case AUDIODEV_DRIVER_PIPEWIRE:
> +        return
> qapi_AudiodevPipewirePerDirectionOptions_base(dev->u.pipewire.TYPE);
> +#endif
>  #ifdef CONFIG_AUDIO_SDL
>      case AUDIODEV_DRIVER_SDL:
>          return qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.TYPE)=
;
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
> index 0000000000..adf1a538c0
> --- /dev/null
> +++ b/audio/pwaudio.c
> @@ -0,0 +1,913 @@
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
> +    uint32_t sample_size, req;
> +    struct spa_ringbuffer ring;
> +    uint8_t buffer[RINGBUFFER_SIZE];
> +
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
> +    uint32_t req, index, n_bytes;
> +    int32_t avail;
> +
> +    assert(v->stream);
> +
> +    /* obtain a buffer to read from */
> +    b =3D pw_stream_dequeue_buffer(v->stream);
> +    if (b =3D=3D NULL) {
> +        error_report("out of buffers: %s", strerror(errno));
> +        return;
> +    }
> +
> +    buf =3D b->buffer;
> +    p =3D buf->datas[0].data;
> +    if (p =3D=3D NULL) {
> +        return;
> +    }
> +    /* calculate the total no of bytes to read data from buffer */
> +    req =3D b->requested * v->sample_size;
> +    if (req =3D=3D 0) {
> +        req =3D v->req;
> +    }
> +    n_bytes =3D SPA_MIN(req, buf->datas[0].maxsize);
> +
> +    /* get no of available bytes to read data from buffer */
> +
> +    avail =3D spa_ringbuffer_get_read_index(&v->ring, &index);
> +
> +    if (avail <=3D 0) {
> +        /* underrun, can't really happen but if it does we */
> +        /* do nothing and wait for more data */
> +        error_report("%p: underrun read:%u avail:%d", p, index, avail);
> +    } else {
> +        if (avail < (int32_t) n_bytes) {
> +            n_bytes =3D avail;
> +        }
> +
> +        spa_ringbuffer_read_data(&v->ring,
> +                                    v->buffer, RINGBUFFER_SIZE,
> +                                    index & RINGBUFFER_MASK, p, n_bytes)=
;
> +
> +        index +=3D n_bytes;
> +        spa_ringbuffer_read_update(&v->ring, index);
> +
> +    }
> +    buf->datas[0].chunk->offset =3D 0;
> +    buf->datas[0].chunk->stride =3D v->sample_size;
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
> +    assert(v->stream);
> +
> +    /* obtain a buffer */
> +    b =3D pw_stream_dequeue_buffer(v->stream);
> +    if (b =3D=3D NULL) {
> +        error_report("out of buffers: %s", strerror(errno));
> +        return;
> +    }
> +
> +    /* Write data into buffer */
> +    buf =3D b->buffer;
> +    p =3D buf->datas[0].data;
> +    if (p =3D=3D NULL) {
> +        return;
> +    }
> +    offs =3D SPA_MIN(buf->datas[0].chunk->offset, buf->datas[0].maxsize)=
;
> +    n_bytes =3D SPA_MIN(buf->datas[0].chunk->size, buf->datas[0].maxsize=
 -
> offs);
> +
> +    filled =3D spa_ringbuffer_get_write_index(&v->ring, &index);
> +
> +
> +    if (filled < 0) {
> +        error_report("%p: underrun write:%u filled:%d", p, index, filled=
);
> +    } else {
> +        if ((uint32_t) filled + n_bytes > RINGBUFFER_SIZE) {
> +            error_report("%p: overrun write:%u filled:%d + size:%u >
> max:%u",
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
> +on_stream_state_changed(void *data, enum pw_stream_state old,
> +                        enum pw_stream_state state, const char *error)
> +{
> +    PWVoice *v =3D (PWVoice *) data;
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
> +    if (pw_stream_get_state(v->stream, &error) !=3D
> PW_STREAM_STATE_STREAMING) {
> +        /* wait for stream to become ready */
> +        l =3D 0;
> +        goto done_unlock;
> +    }
> +    /* get no of available bytes to read data from buffer */
> +    avail =3D spa_ringbuffer_get_read_index(&v->ring, &index);
> +
> +    trace_pw_read(avail, index, len);
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
> +static size_t qpw_buffer_get_free(HWVoiceOut *hw)
> +{
> +    PWVoiceOut *pw =3D (PWVoiceOut *)hw;
> +    PWVoice *v =3D &pw->v;
> +    pwaudio *c =3D v->g;
> +    const char *error =3D NULL;
> +    int32_t filled, avail;
> +    uint32_t index;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +    if (pw_stream_get_state(v->stream, &error) !=3D
> PW_STREAM_STATE_STREAMING) {
> +        /* wait for stream to become ready */
> +        avail =3D 0;
> +        goto done_unlock;
> +    }
> +
> +    filled =3D spa_ringbuffer_get_write_index(&v->ring, &index);
> +    avail =3D v->highwater_mark - filled;
> +
> +done_unlock:
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return avail;
> +}
> +
> +static size_t
> +qpw_write(HWVoiceOut *hw, void *data, size_t len)
> +{
> +    PWVoiceOut *pw =3D (PWVoiceOut *) hw;
> +    PWVoice *v =3D &pw->v;
> +    pwaudio *c =3D v->g;
> +    const char *error =3D NULL;
> +    int32_t filled, avail;
> +    uint32_t index;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +    if (pw_stream_get_state(v->stream, &error) !=3D
> PW_STREAM_STATE_STREAMING) {
> +        /* wait for stream to become ready */
> +        len =3D 0;
> +        goto done_unlock;
> +    }
> +    filled =3D spa_ringbuffer_get_write_index(&v->ring, &index);
> +    avail =3D v->highwater_mark - filled;
> +
> +    trace_pw_write(filled, avail, index, len);
> +
> +    if (len > avail) {
> +        len =3D avail;
> +    }
> +
> +    if (filled < 0) {
> +        audio_pcm_info_clear_buf(&hw->info, data, len /
> hw->info.bytes_per_frame);
> +        error_report("%p: underrun write:%u filled:%d", pw, index,
> filled);
> +    } else {
> +        if ((uint32_t) filled + len > RINGBUFFER_SIZE) {
> +            error_report("%p: overrun write:%u filled:%d + size:%zu >
> max:%u",
> +            pw, index, filled, len, RINGBUFFER_SIZE);
> +        }
> +    }
> +
> +    spa_ringbuffer_write_data(&v->ring,
> +                                v->buffer, RINGBUFFER_SIZE,
> +                                index & RINGBUFFER_MASK, data, len);
> +    index +=3D len;
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
> +        format =3D SPA_AUDIO_FORMAT_S8;
> +        break;
> +    case AUDIO_FORMAT_U8:
> +        format =3D SPA_AUDIO_FORMAT_U8;
> +        break;
> +    case AUDIO_FORMAT_S16:
> +        format =3D endianness ? SPA_AUDIO_FORMAT_S16_BE :
> SPA_AUDIO_FORMAT_S16_LE;
> +        break;
> +    case AUDIO_FORMAT_U16:
> +        format =3D endianness ? SPA_AUDIO_FORMAT_U16_BE :
> SPA_AUDIO_FORMAT_U16_LE;
> +        break;
> +    case AUDIO_FORMAT_S32:
> +        format =3D endianness ? SPA_AUDIO_FORMAT_S32_BE :
> SPA_AUDIO_FORMAT_S32_LE;
> +        break;
> +    case AUDIO_FORMAT_U32:
> +        format =3D endianness ? SPA_AUDIO_FORMAT_U32_BE :
> SPA_AUDIO_FORMAT_U32_LE;
> +        break;
> +    case AUDIO_FORMAT_F32:
> +        format =3D endianness ? SPA_AUDIO_FORMAT_F32_BE :
> SPA_AUDIO_FORMAT_F32_LE;
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
> +             uint32_t *sample_size)
> +{
> +    switch (fmt) {
> +    case SPA_AUDIO_FORMAT_S8:
> +        *sample_size =3D 1;
> +        return AUDIO_FORMAT_S8;
> +    case SPA_AUDIO_FORMAT_U8:
> +        *sample_size =3D 1;
> +        return AUDIO_FORMAT_U8;
> +    case SPA_AUDIO_FORMAT_S16_BE:
> +        *sample_size =3D 2;
> +        *endianness =3D 1;
> +        return AUDIO_FORMAT_S16;
> +    case SPA_AUDIO_FORMAT_S16_LE:
> +        *sample_size =3D 2;
> +        *endianness =3D 0;
> +        return AUDIO_FORMAT_S16;
> +    case SPA_AUDIO_FORMAT_U16_BE:
> +        *sample_size =3D 2;
> +        *endianness =3D 1;
> +        return AUDIO_FORMAT_U16;
> +    case SPA_AUDIO_FORMAT_U16_LE:
> +        *sample_size =3D 2;
> +        *endianness =3D 0;
> +        return AUDIO_FORMAT_U16;
> +    case SPA_AUDIO_FORMAT_S32_BE:
> +        *sample_size =3D 4;
> +        *endianness =3D 1;
> +        return AUDIO_FORMAT_S32;
> +    case SPA_AUDIO_FORMAT_S32_LE:
> +        *sample_size =3D 4;
> +        *endianness =3D 0;
> +        return AUDIO_FORMAT_S32;
> +    case SPA_AUDIO_FORMAT_U32_BE:
> +        *sample_size =3D 4;
> +        *endianness =3D 1;
> +        return AUDIO_FORMAT_U32;
> +    case SPA_AUDIO_FORMAT_U32_LE:
> +        *sample_size =3D 4;
> +        *endianness =3D 0;
> +        return AUDIO_FORMAT_U32;
> +    case SPA_AUDIO_FORMAT_F32_BE:
> +        *sample_size =3D 4;
> +        *endianness =3D 1;
> +        return AUDIO_FORMAT_F32;
> +    case SPA_AUDIO_FORMAT_F32_LE:
> +        *sample_size =3D 4;
> +        *endianness =3D 0;
> +        return AUDIO_FORMAT_F32;
> +    default:
> +        *sample_size =3D 1;
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
> +    struct pw_properties *props;
> +
> +    props =3D pw_properties_new(NULL, NULL);
> +
> +    /* 75% of the timer period for faster updates */
> +    buf_samples =3D (uint64_t)v->g->dev->timer_period * v->info.rate
> +                    * 3 / 4 / 1000000;
> +    trace_pw_timer(v->g->dev->timer_period);
> +    pw_properties_setf(props, PW_KEY_NODE_LATENCY, "%" PRIu64 "/%u",
> +                       buf_samples, v->info.rate);
> +
> +    if (name) {
> +        pw_properties_set(props, PW_KEY_TARGET_OBJECT, name);
> +    }
> +    v->stream =3D pw_stream_new(c->core, stream_name, props);
> +
> +    if (v->stream =3D=3D NULL) {
> +        return -1;
> +    }
> +
> +    if (dir =3D=3D SPA_DIRECTION_INPUT) {
> +        pw_stream_add_listener(v->stream,
> +                            &v->stream_listener, &capture_stream_events,
> v);
> +    } else {
> +        pw_stream_add_listener(v->stream,
> +                            &v->stream_listener, &playback_stream_events=
,
> v);
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
> +                            dir =3D=3D
> +                            SPA_DIRECTION_INPUT ? PW_DIRECTION_INPUT :
> +                            PW_DIRECTION_OUTPUT, PW_ID_ANY,
> +                            PW_STREAM_FLAG_AUTOCONNECT |
> +                            PW_STREAM_FLAG_INACTIVE |
> +                            PW_STREAM_FLAG_MAP_BUFFERS |
> +                            PW_STREAM_FLAG_RT_PROCESS, params, n_params)=
;
> +    if (res < 0) {
> +        pw_stream_destroy(v->stream);
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +static int
> +qpw_stream_new(pwaudio *c, PWVoice *v, const char *stream_name,
> +               const char *name, enum spa_direction dir)
> +{
> +    int r;
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
> +    r =3D create_stream(c, v, stream_name, name, dir);
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
> +    PWVoiceOut *pw =3D (PWVoiceOut *) hw;
> +    PWVoice *v =3D &pw->v;
> +    struct audsettings obt_as =3D *as;
> +    pwaudio *c =3D v->g =3D drv_opaque;
> +    AudiodevPipewireOptions *popts =3D &c->dev->u.pipewire;
> +    AudiodevPipewirePerDirectionOptions *ppdo =3D popts->out;
> +    int r;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +
> +    v->info.format =3D audfmt_to_pw(as->fmt, as->endianness);
> +    v->info.channels =3D as->nchannels;
> +    v->info.rate =3D as->freq;
> +
> +    obt_as.fmt =3D
> +        pw_to_audfmt(v->info.format, &obt_as.endianness, &v->sample_size=
);
> +    v->sample_size *=3D as->nchannels;
> +
> +    v->req =3D (uint64_t)c->dev->timer_period * v->info.rate
> +        * 1 / 2 / 1000000 * v->sample_size;
> +
> +    /* call the function that creates a new stream for playback */
> +    r =3D qpw_stream_new(c, v, ppdo->stream_name ? : c->dev->id,
> +                       ppdo->name, SPA_DIRECTION_OUTPUT);
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
> +    hw->samples =3D audio_buffer_frames(
> +        qapi_AudiodevPipewirePerDirectionOptions_base(ppdo), &obt_as,
> 46440);
> +    v->highwater_mark =3D MIN(RINGBUFFER_SIZE,
> +                            (ppdo->has_latency ? ppdo->latency : 46440)
> +                            * (uint64_t)v->info.rate / 1000000 *
> v->sample_size);
> +
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return 0;
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
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +
> +    v->info.format =3D audfmt_to_pw(as->fmt, as->endianness);
> +    v->info.channels =3D as->nchannels;
> +    v->info.rate =3D as->freq;
> +
> +    obt_as.fmt =3D
> +        pw_to_audfmt(v->info.format, &obt_as.endianness, &v->sample_size=
);
> +    v->sample_size *=3D as->nchannels;
> +
> +    /* call the function that creates a new stream for recording */
> +    r =3D qpw_stream_new(c, v, ppdo->stream_name ? : c->dev->id,
> +                       ppdo->name, SPA_DIRECTION_INPUT);
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
> +    hw->samples =3D audio_buffer_frames(
> +        qapi_AudiodevPipewirePerDirectionOptions_base(ppdo), &obt_as,
> 46440);
> +
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return 0;
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
> +    pwaudio *c =3D v->g;
> +    pw_thread_loop_lock(c->thread_loop);
> +    pw_stream_set_active(v->stream, enable);
> +    pw_thread_loop_unlock(c->thread_loop);
> +}
> +
> +static void
> +qpw_enable_in(HWVoiceIn *hw, bool enable)
> +{
> +    PWVoiceIn *pi =3D (PWVoiceIn *) hw;
> +    PWVoice *v =3D &pi->v;
> +    pwaudio *c =3D v->g;
> +    pw_thread_loop_lock(c->thread_loop);
> +    pw_stream_set_active(v->stream, enable);
> +    pw_thread_loop_unlock(c->thread_loop);
> +}
> +
> +static void
> +qpw_volume_out(HWVoiceOut *hw, Volume *vol)
> +{
> +    PWVoiceOut *pw =3D (PWVoiceOut *) hw;
> +    PWVoice *v =3D &pw->v;
> +    pwaudio *c =3D v->g;
> +    int i, ret;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +    v->volume.channels =3D vol->channels;
> +
> +    for (i =3D 0; i < vol->channels; ++i) {
> +        v->volume.values[i] =3D (float)vol->vol[i] / 255;
> +    }
> +
> +    ret =3D pw_stream_set_control(v->stream,
> +        SPA_PROP_channelVolumes, v->volume.channels, v->volume.values, 0=
);
> +    trace_pw_vol(ret =3D=3D 0 ? "success" : "failed");
> +
> +    v->muted =3D vol->mute;
> +    float val =3D v->muted ? 1.f : 0.f;
> +    ret =3D pw_stream_set_control(v->stream, SPA_PROP_mute, 1, &val, 0);
> +    pw_thread_loop_unlock(c->thread_loop);
> +}
> +
> +static void
> +qpw_volume_in(HWVoiceIn *hw, Volume *vol)
> +{
> +    PWVoiceIn *pw =3D (PWVoiceIn *) hw;
> +    PWVoice *v =3D &pw->v;
> +    pwaudio *c =3D v->g;
> +    int i, ret;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +    v->volume.channels =3D vol->channels;
> +
> +    for (i =3D 0; i < vol->channels; ++i) {
> +        v->volume.values[i] =3D (float)vol->vol[i] / 255;
> +    }
> +
> +    ret =3D pw_stream_set_control(v->stream,
> +        SPA_PROP_channelVolumes, v->volume.channels, v->volume.values, 0=
);
> +    trace_pw_vol(ret =3D=3D 0 ? "success" : "failed");
> +
> +    v->muted =3D vol->mute;
> +    float val =3D v->muted ? 1.f : 0.f;
> +    ret =3D pw_stream_set_control(v->stream, SPA_PROP_mute, 1, &val, 0);
> +    pw_thread_loop_unlock(c->thread_loop);
> +}
> +
> +static int wait_resync(pwaudio *pw)
> +{
> +    int res;
> +    pw->pending_seq =3D pw_core_sync(pw->core, PW_ID_CORE, pw->pending_s=
eq);
> +
> +    while (true) {
> +        pw_thread_loop_wait(pw->thread_loop);
> +
> +        res =3D pw->error;
> +        if (res < 0) {
> +            pw->error =3D 0;
> +            return res;
> +        }
> +        if (pw->pending_seq =3D=3D pw->last_seq) {
> +            break;
> +        }
> +    }
> +    return 0;
> +}
> +static void
> +on_core_error(void *data, uint32_t id, int seq, int res, const char
> *message)
> +{
> +    pwaudio *pw =3D data;
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
> +    pwaudio *pw =3D data;
> +    assert(id =3D=3D PW_ID_CORE);
> +    pw->last_seq =3D seq;
> +    if (pw->pending_seq =3D=3D seq) {
> +        /* stop and exit the thread loop */
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
> +    g_autofree pwaudio *pw =3D g_new0(pwaudio, 1);
> +    pw_init(NULL, NULL);
> +
> +    trace_pw_audio_init();
> +    assert(dev->driver =3D=3D AUDIODEV_DRIVER_PIPEWIRE);
> +
> +    pw->dev =3D dev;
> +    pw->thread_loop =3D pw_thread_loop_new("Pipewire thread loop", NULL)=
;
> +    if (pw->thread_loop =3D=3D NULL) {
> +        error_report("Could not create Pipewire loop");
> +        goto fail;
> +    }
> +
> +    pw->context =3D
> +        pw_context_new(pw_thread_loop_get_loop(pw->thread_loop), NULL, 0=
);
> +    if (pw->context =3D=3D NULL) {
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
> +    pw->core =3D pw_context_connect(pw->context, NULL, 0);
> +    if (pw->core =3D=3D NULL) {
> +        pw_thread_loop_unlock(pw->thread_loop);
> +        goto fail;
> +    }
> +
> +    if (pw_core_add_listener(pw->core, &pw->core_listener,
> +                             &core_events, pw) < 0) {
> +        pw_thread_loop_unlock(pw->thread_loop);
> +        goto fail;
> +    }
> +    if (wait_resync(pw) < 0) {
> +        pw_thread_loop_unlock(pw->thread_loop);
> +    }
> +
> +    pw_thread_loop_unlock(pw->thread_loop);
> +
> +    return g_steal_pointer(&pw);
> +
> +fail:
> +    AUD_log(AUDIO_CAP, "Failed to initialize PW context");
> +    if (pw->thread_loop) {
> +        pw_thread_loop_stop(pw->thread_loop);
> +    }
> +    if (pw->context) {
> +        g_clear_pointer(&pw->context, pw_context_destroy);
> +    }
> +    if (pw->thread_loop) {
> +        g_clear_pointer(&pw->thread_loop, pw_thread_loop_destroy);
> +    }
> +    return NULL;
> +}
> +
> +static void
> +qpw_audio_fini(void *opaque)
> +{
> +    pwaudio *pw =3D opaque;
> +
> +    if (pw->thread_loop) {
> +        pw_thread_loop_stop(pw->thread_loop);
> +    }
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
> +    .buffer_get_free =3D qpw_buffer_get_free,
> +    .run_buffer_out =3D audio_generic_run_buffer_out,
> +    .enable_out =3D qpw_enable_out,
> +    .volume_out =3D qpw_volume_out,
> +    .volume_in =3D qpw_volume_in,
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
> diff --git a/audio/trace-events b/audio/trace-events
> index e1ab643add..c764e5641b 100644
> --- a/audio/trace-events
> +++ b/audio/trace-events
> @@ -18,6 +18,14 @@ dbus_audio_register(const char *s, const char *dir)
> "sender =3D %s, dir =3D %s"
>  dbus_audio_put_buffer_out(size_t len) "len =3D %zu"
>  dbus_audio_read(size_t len) "len =3D %zu"
>
> +# pwaudio.c
> +pw_state_changed(int nodeid, const char *s) "node id: %d stream state: %=
s"
> +pw_read(int32_t avail, uint32_t index, size_t len) "avail=3D%d index=3D%=
u
> len=3D%zu"
> +pw_write(int32_t filled, int32_t avail, uint32_t index, size_t len)
> "filled=3D%d avail=3D%d index=3D%u len=3D%zu"
> +pw_vol(const char *ret) "set volume: %s"
> +pw_timer(uint64_t buf_samples) "timer period =3D %" PRIu64
> +pw_audio_init(void) "Initialize Pipewire context"
> +
>  # audio.c
>  audio_timer_start(int interval) "interval %d ms"
>  audio_timer_stop(void) ""
> diff --git a/meson.build b/meson.build
> index 29f8644d6d..31bf280c0d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -730,6 +730,12 @@ if not get_option('jack').auto() or have_system
>    jack =3D dependency('jack', required: get_option('jack'),
>                      method: 'pkg-config', kwargs: static_kwargs)
>  endif
> +pipewire =3D not_found
> +if not get_option('pipewire').auto() or (targetos =3D=3D 'linux' and
> have_system)
> +  pipewire =3D dependency('libpipewire-0.3', version: '>=3D0.3.60',
> +                    required: get_option('pipewire'),
> +                    method: 'pkg-config', kwargs: static_kwargs)
> +endif
>  sndio =3D not_found
>  if not get_option('sndio').auto() or have_system
>    sndio =3D dependency('sndio', required: get_option('sndio'),
> @@ -1667,6 +1673,7 @@ if have_system
>      'jack': jack.found(),
>      'oss': oss.found(),
>      'pa': pulse.found(),
> +    'pipewire': pipewire.found(),
>      'sdl': sdl.found(),
>      'sndio': sndio.found(),
>    }
> @@ -3980,6 +3987,7 @@ if targetos =3D=3D 'linux'
>    summary_info +=3D {'ALSA support':    alsa}
>    summary_info +=3D {'PulseAudio support': pulse}
>  endif
> +summary_info +=3D {'Pipewire support':   pipewire}
>  summary_info +=3D {'JACK support':      jack}
>  summary_info +=3D {'brlapi support':    brlapi}
>  summary_info +=3D {'vde support':       vde}
> diff --git a/meson_options.txt b/meson_options.txt
> index fc9447d267..9ae1ec7f47 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -21,7 +21,7 @@ option('tls_priority', type : 'string', value : 'NORMAL=
',
>  option('default_devices', type : 'boolean', value : true,
>         description: 'Include a default selection of devices in emulators=
')
>  option('audio_drv_list', type: 'array', value: ['default'],
> -       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss'=
,
> 'pa', 'sdl', 'sndio'],
> +       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss'=
,
> 'pa', 'pipewire', 'sdl', 'sndio'],
>         description: 'Set audio driver list')
>  option('block_drv_rw_whitelist', type : 'string', value : '',
>         description: 'set block driver read-write whitelist (by default
> affects only QEMU, not tools like qemu-img)')
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
> index 4e54c00f51..e03396a7bc 100644
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -324,6 +324,47 @@
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
> +#               instances (default: audiodev's id)
> +#
> +# @latency: latency you want Pipewire to achieve in microseconds
> +#           (default 46000)
> +#
> +# Since: 8.1
> +##
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
> +# Since: 8.1
> +##
> +{ 'struct': 'AudiodevPipewireOptions',
> +  'data': {
> +    '*in':     'AudiodevPipewirePerDirectionOptions',
> +    '*out':    'AudiodevPipewirePerDirectionOptions' } }
> +
>  ##
>  # @AudiodevSdlPerDirectionOptions:
>  #
> @@ -416,6 +457,7 @@
>              { 'name': 'jack', 'if': 'CONFIG_AUDIO_JACK' },
>              { 'name': 'oss', 'if': 'CONFIG_AUDIO_OSS' },
>              { 'name': 'pa', 'if': 'CONFIG_AUDIO_PA' },
> +            { 'name': 'pipewire', 'if': 'CONFIG_AUDIO_PIPEWIRE' },
>              { 'name': 'sdl', 'if': 'CONFIG_AUDIO_SDL' },
>              { 'name': 'sndio', 'if': 'CONFIG_AUDIO_SNDIO' },
>              { 'name': 'spice', 'if': 'CONFIG_SPICE' },
> @@ -456,6 +498,8 @@
>                     'if': 'CONFIG_AUDIO_OSS' },
>      'pa':        { 'type': 'AudiodevPaOptions',
>                     'if': 'CONFIG_AUDIO_PA' },
> +    'pipewire':  { 'type': 'AudiodevPipewireOptions',
> +                   'if': 'CONFIG_AUDIO_PIPEWIRE' },
>      'sdl':       { 'type': 'AudiodevSdlOptions',
>                     'if': 'CONFIG_AUDIO_SDL' },
>      'sndio':     { 'type': 'AudiodevSndioOptions',
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 59bdf67a2c..2d908717bd 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -779,6 +779,12 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
>      "                in|out.name=3D source/sink device name\n"
>      "                in|out.latency=3D desired latency in microseconds\n=
"
>  #endif
> +#ifdef CONFIG_AUDIO_PIPEWIRE
> +    "-audiodev pipewire,id=3Did[,prop[=3Dvalue][,...]]\n"
> +    "                in|out.name=3D source/sink device name\n"
> +    "                in|out.stream-name=3D name of pipewire stream\n"
> +    "                in|out.latency=3D desired latency in microseconds\n=
"
> +#endif
>  #ifdef CONFIG_AUDIO_SDL
>      "-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]\n"
>      "                in|out.buffer-count=3D number of buffers\n"
> @@ -942,6 +948,21 @@ SRST
>          Desired latency in microseconds. The PulseAudio server will try
>          to honor this value but actual latencies may be lower or higher.
>
> +``-audiodev pipewire,id=3Did[,prop[=3Dvalue][,...]]``
> +    Creates a backend using Pipewire. This backend is available on
> +    most systems.
> +
> +    Pipewire specific options are:
> +
> +    ``in|out.latency=3Dusecs``
> +        Desired latency in microseconds.
> +
> +    ``in|out.name=3Dsink``
> +        Use the specified source/sink for recording/playback.
> +
> +    ``in|out.stream-name``
> +        Specify the name of pipewire stream.
> +
>  ``-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]``
>      Creates a backend using SDL. This backend is available on most
>      systems, but you should use your platform's native backend if
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index 009fab1515..ba1057b62c 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -1,7 +1,8 @@
>  # This file is generated by meson-buildoptions.py, do not edit!
>  meson_options_help() {
> -  printf "%s\n" '  --audio-drv-list=3DCHOICES Set audio driver list
> [default] (choices: alsa/co'
> -  printf "%s\n" '
>  reaudio/default/dsound/jack/oss/pa/sdl/sndio)'
> +  printf "%s\n" '  --audio-drv-list=3DCHOICES Set audio driver list
> [default] (choices: al'
> +  printf "%s\n" '
>  sa/coreaudio/default/dsound/jack/oss/pa/'
> +  printf "%s\n" '                           pipewire/sdl/sndio)'
>    printf "%s\n" '  --block-drv-ro-whitelist=3DVALUE'
>    printf "%s\n" '                           set block driver read-only
> whitelist (by default'
>    printf "%s\n" '                           affects only QEMU, not tools
> like qemu-img)'
> @@ -136,6 +137,7 @@ meson_options_help() {
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
> --
> 2.39.1
>
>

--00000000000006e81d05f92404c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Volker,</div><div><br></div><div>It seems that for=
 some unknown reason using audio_pcm_info_clear_buf in playback_process cau=
ses segmentation fault. Hence I moved the handling of buffer underruns from=
 the playback process to the qpw_write process because that is the underlyi=
ng cause of buffer underrun.</div><div><br></div><div>Regards,</div><div>Do=
rinda.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Apr 12, 2023 at 3:57=E2=80=AFPM Dorinda Bassey &lt;=
<a href=3D"mailto:dbassey@redhat.com">dbassey@redhat.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">This commit adds a =
new audiodev backend to allow QEMU to use Pipewire as<br>
both an audio sink and source. This backend is available on most systems<br=
>
<br>
Add Pipewire entry points for QEMU Pipewire audio backend<br>
Add wrappers for QEMU Pipewire audio backend in qpw_pcm_ops()<br>
qpw_write function returns the current state of the stream to pwaudio<br>
and Writes some data to the server for playback streams using pipewire<br>
spa_ringbuffer implementation.<br>
qpw_read function returns the current state of the stream to pwaudio and<br=
>
reads some data from the server for capture streams using pipewire<br>
spa_ringbuffer implementation. These functions qpw_write and qpw_read<br>
are called during playback and capture.<br>
Added some functions that convert pw audio formats to QEMU audio format<br>
and vice versa which would be needed in the pipewire audio sink and<br>
source functions qpw_init_in() &amp; qpw_init_out().<br>
These methods that implement playback and recording will create streams<br>
for playback and capture that will start processing and will result in<br>
the on_process callbacks to be called.<br>
Built a connection to the Pipewire sound system server in the<br>
qpw_audio_init() method.<br>
<br>
Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dbassey@redhat.com" tar=
get=3D"_blank">dbassey@redhat.com</a>&gt;<br>
---<br>
v11:<br>
handle buffer underruns in qpw_write<br>
use local variable<br>
change param name frame_size<br>
fix format specifier<br>
change trace value to trace quantum<br>
<br>
=C2=A0audio/audio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0audio/audio_template.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<b=
r>
=C2=A0audio/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
=C2=A0audio/pwaudio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 913 ++++++++++++++++++++++++++++++++++<br>
=C2=A0audio/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A08 +<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A08 +<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A04 +-<br>
=C2=A0qapi/audio.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 44 ++<br>
=C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 21 +<br>
=C2=A0scripts/meson-buildoptions.sh |=C2=A0 =C2=A08 +-<br>
=C2=A010 files changed, 1011 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 audio/pwaudio.c<br>
<br>
diff --git a/audio/audio.c b/audio/audio.c<br>
index 70b096713c..90c7c49d11 100644<br>
--- a/audio/audio.c<br>
+++ b/audio/audio.c<br>
@@ -2061,6 +2061,9 @@ void audio_create_pdos(Audiodev *dev)<br>
=C2=A0#ifdef CONFIG_AUDIO_PA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CASE(PA, pa, Pa);<br>
=C2=A0#endif<br>
+#ifdef CONFIG_AUDIO_PIPEWIRE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CASE(PIPEWIRE, pipewire, Pipewire);<br>
+#endif<br>
=C2=A0#ifdef CONFIG_AUDIO_SDL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CASE(SDL, sdl, Sdl);<br>
=C2=A0#endif<br>
diff --git a/audio/audio_template.h b/audio/audio_template.h<br>
index e42326c20d..dc0c74aa74 100644<br>
--- a/audio/audio_template.h<br>
+++ b/audio/audio_template.h<br>
@@ -362,6 +362,10 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE=
)(Audiodev *dev)<br>
=C2=A0 =C2=A0 =C2=A0case AUDIODEV_DRIVER_PA:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return qapi_AudiodevPaPerDirectionOptions=
_base(dev-&gt;u.pa.TYPE);<br>
=C2=A0#endif<br>
+#ifdef CONFIG_AUDIO_PIPEWIRE<br>
+=C2=A0 =C2=A0 case AUDIODEV_DRIVER_PIPEWIRE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qapi_AudiodevPipewirePerDirectionOption=
s_base(dev-&gt;u.pipewire.TYPE);<br>
+#endif<br>
=C2=A0#ifdef CONFIG_AUDIO_SDL<br>
=C2=A0 =C2=A0 =C2=A0case AUDIODEV_DRIVER_SDL:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return qapi_AudiodevSdlPerDirectionOption=
s_base(dev-&gt;u.sdl.TYPE);<br>
diff --git a/audio/meson.build b/audio/meson.build<br>
index 0722224ba9..65a49c1a10 100644<br>
--- a/audio/meson.build<br>
+++ b/audio/meson.build<br>
@@ -19,6 +19,7 @@ foreach m : [<br>
=C2=A0 =C2=A0[&#39;sdl&#39;, sdl, files(&#39;sdlaudio.c&#39;)],<br>
=C2=A0 =C2=A0[&#39;jack&#39;, jack, files(&#39;jackaudio.c&#39;)],<br>
=C2=A0 =C2=A0[&#39;sndio&#39;, sndio, files(&#39;sndioaudio.c&#39;)],<br>
+=C2=A0 [&#39;pipewire&#39;, pipewire, files(&#39;pwaudio.c&#39;)],<br>
=C2=A0 =C2=A0[&#39;spice&#39;, spice, files(&#39;spiceaudio.c&#39;)]<br>
=C2=A0]<br>
=C2=A0 =C2=A0if m[1].found()<br>
diff --git a/audio/pwaudio.c b/audio/pwaudio.c<br>
new file mode 100644<br>
index 0000000000..adf1a538c0<br>
--- /dev/null<br>
+++ b/audio/pwaudio.c<br>
@@ -0,0 +1,913 @@<br>
+/*<br>
+ * QEMU Pipewire audio driver<br>
+ *<br>
+ * Copyright (c) 2023 Red Hat Inc.<br>
+ *<br>
+ * Author: Dorinda Bassey=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:=
dbassey@redhat.com" target=3D"_blank">dbassey@redhat.com</a>&gt;<br>
+ *<br>
+ * SPDX-License-Identifier: GPL-2.0-or-later<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;audio.h&quot;<br>
+#include &lt;errno.h&gt;<br>
+#include &quot;qemu/error-report.h&quot;<br>
+#include &lt;spa/param/audio/format-utils.h&gt;<br>
+#include &lt;spa/utils/ringbuffer.h&gt;<br>
+#include &lt;spa/utils/result.h&gt;<br>
+#include &lt;spa/param/props.h&gt;<br>
+<br>
+#include &lt;pipewire/pipewire.h&gt;<br>
+#include &quot;trace.h&quot;<br>
+<br>
+#define AUDIO_CAP &quot;pipewire&quot;<br>
+#define RINGBUFFER_SIZE=C2=A0 =C2=A0 (1u &lt;&lt; 22)<br>
+#define RINGBUFFER_MASK=C2=A0 =C2=A0 (RINGBUFFER_SIZE - 1)<br>
+<br>
+#include &quot;audio_int.h&quot;<br>
+<br>
+typedef struct pwvolume {<br>
+=C2=A0 =C2=A0 uint32_t channels;<br>
+=C2=A0 =C2=A0 float values[SPA_AUDIO_MAX_CHANNELS];<br>
+} pwvolume;<br>
+<br>
+typedef struct pwaudio {<br>
+=C2=A0 =C2=A0 Audiodev *dev;<br>
+=C2=A0 =C2=A0 struct pw_thread_loop *thread_loop;<br>
+=C2=A0 =C2=A0 struct pw_context *context;<br>
+<br>
+=C2=A0 =C2=A0 struct pw_core *core;<br>
+=C2=A0 =C2=A0 struct spa_hook core_listener;<br>
+=C2=A0 =C2=A0 int last_seq, pending_seq, error;<br>
+} pwaudio;<br>
+<br>
+typedef struct PWVoice {<br>
+=C2=A0 =C2=A0 pwaudio *g;<br>
+=C2=A0 =C2=A0 struct pw_stream *stream;<br>
+=C2=A0 =C2=A0 struct spa_hook stream_listener;<br>
+=C2=A0 =C2=A0 struct spa_audio_info_raw info;<br>
+=C2=A0 =C2=A0 uint32_t highwater_mark;<br>
+=C2=A0 =C2=A0 uint32_t sample_size, req;<br>
+=C2=A0 =C2=A0 struct spa_ringbuffer ring;<br>
+=C2=A0 =C2=A0 uint8_t buffer[RINGBUFFER_SIZE];<br>
+<br>
+=C2=A0 =C2=A0 pwvolume volume;<br>
+=C2=A0 =C2=A0 bool muted;<br>
+} PWVoice;<br>
+<br>
+typedef struct PWVoiceOut {<br>
+=C2=A0 =C2=A0 HWVoiceOut hw;<br>
+=C2=A0 =C2=A0 PWVoice v;<br>
+} PWVoiceOut;<br>
+<br>
+typedef struct PWVoiceIn {<br>
+=C2=A0 =C2=A0 HWVoiceIn hw;<br>
+=C2=A0 =C2=A0 PWVoice v;<br>
+} PWVoiceIn;<br>
+<br>
+static void<br>
+stream_destroy(void *data)<br>
+{<br>
+=C2=A0 =C2=A0 PWVoice *v =3D (PWVoice *) data;<br>
+=C2=A0 =C2=A0 spa_hook_remove(&amp;v-&gt;stream_listener);<br>
+=C2=A0 =C2=A0 v-&gt;stream =3D NULL;<br>
+}<br>
+<br>
+/* output data processing function to read stuffs from the buffer */<br>
+static void<br>
+playback_on_process(void *data)<br>
+{<br>
+=C2=A0 =C2=A0 PWVoice *v =3D (PWVoice *) data;<br>
+=C2=A0 =C2=A0 void *p;<br>
+=C2=A0 =C2=A0 struct pw_buffer *b;<br>
+=C2=A0 =C2=A0 struct spa_buffer *buf;<br>
+=C2=A0 =C2=A0 uint32_t req, index, n_bytes;<br>
+=C2=A0 =C2=A0 int32_t avail;<br>
+<br>
+=C2=A0 =C2=A0 assert(v-&gt;stream);<br>
+<br>
+=C2=A0 =C2=A0 /* obtain a buffer to read from */<br>
+=C2=A0 =C2=A0 b =3D pw_stream_dequeue_buffer(v-&gt;stream);<br>
+=C2=A0 =C2=A0 if (b =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;out of buffers: %s&quot;, s=
trerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 buf =3D b-&gt;buffer;<br>
+=C2=A0 =C2=A0 p =3D buf-&gt;datas[0].data;<br>
+=C2=A0 =C2=A0 if (p =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /* calculate the total no of bytes to read data from buffer =
*/<br>
+=C2=A0 =C2=A0 req =3D b-&gt;requested * v-&gt;sample_size;<br>
+=C2=A0 =C2=A0 if (req =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 req =3D v-&gt;req;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 n_bytes =3D SPA_MIN(req, buf-&gt;datas[0].maxsize);<br>
+<br>
+=C2=A0 =C2=A0 /* get no of available bytes to read data from buffer */<br>
+<br>
+=C2=A0 =C2=A0 avail =3D spa_ringbuffer_get_read_index(&amp;v-&gt;ring, &am=
p;index);<br>
+<br>
+=C2=A0 =C2=A0 if (avail &lt;=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* underrun, can&#39;t really happen but if it=
 does we */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* do nothing and wait for more data */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%p: underrun read:%u avail:=
%d&quot;, p, index, avail);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (avail &lt; (int32_t) n_bytes) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n_bytes =3D avail;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_ringbuffer_read_data(&amp;v-&gt;ring,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;buffer, RINGBUFF=
ER_SIZE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index &amp; RINGBUFFER=
_MASK, p, n_bytes);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 index +=3D n_bytes;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_ringbuffer_read_update(&amp;v-&gt;ring, in=
dex);<br>
+<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 buf-&gt;datas[0].chunk-&gt;offset =3D 0;<br>
+=C2=A0 =C2=A0 buf-&gt;datas[0].chunk-&gt;stride =3D v-&gt;sample_size;<br>
+=C2=A0 =C2=A0 buf-&gt;datas[0].chunk-&gt;size =3D n_bytes;<br>
+<br>
+=C2=A0 =C2=A0 /* queue the buffer for playback */<br>
+=C2=A0 =C2=A0 pw_stream_queue_buffer(v-&gt;stream, b);<br>
+}<br>
+<br>
+/* output data processing function to generate stuffs in the buffer */<br>
+static void<br>
+capture_on_process(void *data)<br>
+{<br>
+=C2=A0 =C2=A0 PWVoice *v =3D (PWVoice *) data;<br>
+=C2=A0 =C2=A0 void *p;<br>
+=C2=A0 =C2=A0 struct pw_buffer *b;<br>
+=C2=A0 =C2=A0 struct spa_buffer *buf;<br>
+=C2=A0 =C2=A0 int32_t filled;<br>
+=C2=A0 =C2=A0 uint32_t index, offs, n_bytes;<br>
+<br>
+=C2=A0 =C2=A0 assert(v-&gt;stream);<br>
+<br>
+=C2=A0 =C2=A0 /* obtain a buffer */<br>
+=C2=A0 =C2=A0 b =3D pw_stream_dequeue_buffer(v-&gt;stream);<br>
+=C2=A0 =C2=A0 if (b =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;out of buffers: %s&quot;, s=
trerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Write data into buffer */<br>
+=C2=A0 =C2=A0 buf =3D b-&gt;buffer;<br>
+=C2=A0 =C2=A0 p =3D buf-&gt;datas[0].data;<br>
+=C2=A0 =C2=A0 if (p =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 offs =3D SPA_MIN(buf-&gt;datas[0].chunk-&gt;offset, buf-&gt;=
datas[0].maxsize);<br>
+=C2=A0 =C2=A0 n_bytes =3D SPA_MIN(buf-&gt;datas[0].chunk-&gt;size, buf-&gt=
;datas[0].maxsize - offs);<br>
+<br>
+=C2=A0 =C2=A0 filled =3D spa_ringbuffer_get_write_index(&amp;v-&gt;ring, &=
amp;index);<br>
+<br>
+<br>
+=C2=A0 =C2=A0 if (filled &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%p: underrun write:%u fille=
d:%d&quot;, p, index, filled);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((uint32_t) filled + n_bytes &gt; RINGBUFFE=
R_SIZE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%p: overrun w=
rite:%u filled:%d + size:%u &gt; max:%u&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p, index, filled, n_bytes, RINGB=
UFFER_SIZE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 spa_ringbuffer_write_data(&amp;v-&gt;ring,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;buffer, RINGBUFFER_SIZE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index &amp; RINGBUFFER_MASK,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_PTROFF(p, offs, void), n_bytes);=
<br>
+=C2=A0 =C2=A0 index +=3D n_bytes;<br>
+=C2=A0 =C2=A0 spa_ringbuffer_write_update(&amp;v-&gt;ring, index);<br>
+<br>
+=C2=A0 =C2=A0 /* queue the buffer for playback */<br>
+=C2=A0 =C2=A0 pw_stream_queue_buffer(v-&gt;stream, b);<br>
+}<br>
+<br>
+static void<br>
+on_stream_state_changed(void *data, enum pw_stream_state old,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 enum pw_stream_state state, const char *error)<br>
+{<br>
+=C2=A0 =C2=A0 PWVoice *v =3D (PWVoice *) data;<br>
+<br>
+=C2=A0 =C2=A0 trace_pw_state_changed(pw_stream_get_node_id(v-&gt;stream),<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0pw_stream_state_as_string(state));<br>
+<br>
+=C2=A0 =C2=A0 switch (state) {<br>
+=C2=A0 =C2=A0 case PW_STREAM_STATE_ERROR:<br>
+=C2=A0 =C2=A0 case PW_STREAM_STATE_UNCONNECTED:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case PW_STREAM_STATE_PAUSED:<br>
+=C2=A0 =C2=A0 case PW_STREAM_STATE_CONNECTING:<br>
+=C2=A0 =C2=A0 case PW_STREAM_STATE_STREAMING:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static const struct pw_stream_events capture_stream_events =3D {<br>
+=C2=A0 =C2=A0 PW_VERSION_STREAM_EVENTS,<br>
+=C2=A0 =C2=A0 .destroy =3D stream_destroy,<br>
+=C2=A0 =C2=A0 .state_changed =3D on_stream_state_changed,<br>
+=C2=A0 =C2=A0 .process =3D capture_on_process<br>
+};<br>
+<br>
+static const struct pw_stream_events playback_stream_events =3D {<br>
+=C2=A0 =C2=A0 PW_VERSION_STREAM_EVENTS,<br>
+=C2=A0 =C2=A0 .destroy =3D stream_destroy,<br>
+=C2=A0 =C2=A0 .state_changed =3D on_stream_state_changed,<br>
+=C2=A0 =C2=A0 .process =3D playback_on_process<br>
+};<br>
+<br>
+static size_t<br>
+qpw_read(HWVoiceIn *hw, void *data, size_t len)<br>
+{<br>
+=C2=A0 =C2=A0 PWVoiceIn *pw =3D (PWVoiceIn *) hw;<br>
+=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
+=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
+=C2=A0 =C2=A0 const char *error =3D NULL;<br>
+=C2=A0 =C2=A0 size_t l;<br>
+=C2=A0 =C2=A0 int32_t avail;<br>
+=C2=A0 =C2=A0 uint32_t index;<br>
+<br>
+=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 if (pw_stream_get_state(v-&gt;stream, &amp;error) !=3D PW_ST=
REAM_STATE_STREAMING) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* wait for stream to become ready */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done_unlock;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /* get no of available bytes to read data from buffer */<br>
+=C2=A0 =C2=A0 avail =3D spa_ringbuffer_get_read_index(&amp;v-&gt;ring, &am=
p;index);<br>
+<br>
+=C2=A0 =C2=A0 trace_pw_read(avail, index, len);<br>
+<br>
+=C2=A0 =C2=A0 if (avail &lt; (int32_t) len) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D avail;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 spa_ringbuffer_read_data(&amp;v-&gt;ring,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v-&gt;buffer, RINGBUFFER_SIZE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index &amp; RINGBUFFER_MASK, data, len);<br>
+=C2=A0 =C2=A0 index +=3D len;<br>
+=C2=A0 =C2=A0 spa_ringbuffer_read_update(&amp;v-&gt;ring, index);<br>
+=C2=A0 =C2=A0 l =3D len;<br>
+<br>
+done_unlock:<br>
+=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 return l;<br>
+}<br>
+<br>
+static size_t qpw_buffer_get_free(HWVoiceOut *hw)<br>
+{<br>
+=C2=A0 =C2=A0 PWVoiceOut *pw =3D (PWVoiceOut *)hw;<br>
+=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
+=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
+=C2=A0 =C2=A0 const char *error =3D NULL;<br>
+=C2=A0 =C2=A0 int32_t filled, avail;<br>
+=C2=A0 =C2=A0 uint32_t index;<br>
+<br>
+=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 if (pw_stream_get_state(v-&gt;stream, &amp;error) !=3D PW_ST=
REAM_STATE_STREAMING) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* wait for stream to become ready */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 avail =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done_unlock;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 filled =3D spa_ringbuffer_get_write_index(&amp;v-&gt;ring, &=
amp;index);<br>
+=C2=A0 =C2=A0 avail =3D v-&gt;highwater_mark - filled;<br>
+<br>
+done_unlock:<br>
+=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 return avail;<br>
+}<br>
+<br>
+static size_t<br>
+qpw_write(HWVoiceOut *hw, void *data, size_t len)<br>
+{<br>
+=C2=A0 =C2=A0 PWVoiceOut *pw =3D (PWVoiceOut *) hw;<br>
+=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
+=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
+=C2=A0 =C2=A0 const char *error =3D NULL;<br>
+=C2=A0 =C2=A0 int32_t filled, avail;<br>
+=C2=A0 =C2=A0 uint32_t index;<br>
+<br>
+=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 if (pw_stream_get_state(v-&gt;stream, &amp;error) !=3D PW_ST=
REAM_STATE_STREAMING) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* wait for stream to become ready */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done_unlock;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 filled =3D spa_ringbuffer_get_write_index(&amp;v-&gt;ring, &=
amp;index);<br>
+=C2=A0 =C2=A0 avail =3D v-&gt;highwater_mark - filled;<br>
+<br>
+=C2=A0 =C2=A0 trace_pw_write(filled, avail, index, len);<br>
+<br>
+=C2=A0 =C2=A0 if (len &gt; avail) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D avail;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (filled &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_pcm_info_clear_buf(&amp;hw-&gt;info, dat=
a, len / hw-&gt;info.bytes_per_frame);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%p: underrun write:%u fille=
d:%d&quot;, pw, index, filled);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((uint32_t) filled + len &gt; RINGBUFFER_SI=
ZE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%p: overrun w=
rite:%u filled:%d + size:%zu &gt; max:%u&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw, index, filled, len, RINGBUFF=
ER_SIZE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 spa_ringbuffer_write_data(&amp;v-&gt;ring,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;buffer, RINGBUFFER_SIZE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index &amp; RINGBUFFER_MASK, data, l=
en);<br>
+=C2=A0 =C2=A0 index +=3D len;<br>
+=C2=A0 =C2=A0 spa_ringbuffer_write_update(&amp;v-&gt;ring, index);<br>
+<br>
+done_unlock:<br>
+=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 return len;<br>
+}<br>
+<br>
+static int<br>
+audfmt_to_pw(AudioFormat fmt, int endianness)<br>
+{<br>
+=C2=A0 =C2=A0 int format;<br>
+<br>
+=C2=A0 =C2=A0 switch (fmt) {<br>
+=C2=A0 =C2=A0 case AUDIO_FORMAT_S8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D SPA_AUDIO_FORMAT_S8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case AUDIO_FORMAT_U8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D SPA_AUDIO_FORMAT_U8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case AUDIO_FORMAT_S16:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D endianness ? SPA_AUDIO_FORMAT_S16_B=
E : SPA_AUDIO_FORMAT_S16_LE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case AUDIO_FORMAT_U16:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D endianness ? SPA_AUDIO_FORMAT_U16_B=
E : SPA_AUDIO_FORMAT_U16_LE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case AUDIO_FORMAT_S32:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D endianness ? SPA_AUDIO_FORMAT_S32_B=
E : SPA_AUDIO_FORMAT_S32_LE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case AUDIO_FORMAT_U32:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D endianness ? SPA_AUDIO_FORMAT_U32_B=
E : SPA_AUDIO_FORMAT_U32_LE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case AUDIO_FORMAT_F32:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D endianness ? SPA_AUDIO_FORMAT_F32_B=
E : SPA_AUDIO_FORMAT_F32_LE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dolog(&quot;Internal logic error: Bad audio fo=
rmat %d\n&quot;, fmt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D SPA_AUDIO_FORMAT_U8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return format;<br>
+}<br>
+<br>
+static AudioFormat<br>
+pw_to_audfmt(enum spa_audio_format fmt, int *endianness,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t *sample_size)<br>
+{<br>
+=C2=A0 =C2=A0 switch (fmt) {<br>
+=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_S8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_S8;<br>
+=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_U8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U8;<br>
+=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_S16_BE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_S16;<br>
+=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_S16_LE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_S16;<br>
+=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_U16_BE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U16;<br>
+=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_U16_LE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U16;<br>
+=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_S32_BE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_S32;<br>
+=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_S32_LE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_S32;<br>
+=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_U32_BE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U32;<br>
+=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_U32_LE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U32;<br>
+=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_F32_BE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_F32;<br>
+=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_F32_LE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_F32;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dolog(&quot;Internal logic error: Bad spa_audi=
o_format %d\n&quot;, fmt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U8;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static int<br>
+create_stream(pwaudio *c, PWVoice *v, const char *stream_name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *name, enum sp=
a_direction dir)<br>
+{<br>
+=C2=A0 =C2=A0 int res;<br>
+=C2=A0 =C2=A0 uint32_t n_params;<br>
+=C2=A0 =C2=A0 const struct spa_pod *params[2];<br>
+=C2=A0 =C2=A0 uint8_t buffer[1024];<br>
+=C2=A0 =C2=A0 struct spa_pod_builder b;<br>
+=C2=A0 =C2=A0 uint64_t buf_samples;<br>
+=C2=A0 =C2=A0 struct pw_properties *props;<br>
+<br>
+=C2=A0 =C2=A0 props =3D pw_properties_new(NULL, NULL);<br>
+<br>
+=C2=A0 =C2=A0 /* 75% of the timer period for faster updates */<br>
+=C2=A0 =C2=A0 buf_samples =3D (uint64_t)v-&gt;g-&gt;dev-&gt;timer_period *=
 v-&gt;info.rate<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 3 =
/ 4 / 1000000;<br>
+=C2=A0 =C2=A0 trace_pw_timer(v-&gt;g-&gt;dev-&gt;timer_period);<br>
+=C2=A0 =C2=A0 pw_properties_setf(props, PW_KEY_NODE_LATENCY, &quot;%&quot;=
 PRIu64 &quot;/%u&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0buf_samples, v-&gt;info.rate);<br>
+<br>
+=C2=A0 =C2=A0 if (name) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, PW_KEY_TARGET_OBJECT,=
 name);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 v-&gt;stream =3D pw_stream_new(c-&gt;core, stream_name, prop=
s);<br>
+<br>
+=C2=A0 =C2=A0 if (v-&gt;stream =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (dir =3D=3D SPA_DIRECTION_INPUT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_add_listener(v-&gt;stream,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;v-&gt;stream_listener, &amp;capture_stream_ev=
ents, v);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_add_listener(v-&gt;stream,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;v-&gt;stream_listener, &amp;playback_stream_e=
vents, v);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 n_params =3D 0;<br>
+=C2=A0 =C2=A0 spa_pod_builder_init(&amp;b, buffer, sizeof(buffer));<br>
+=C2=A0 =C2=A0 params[n_params++] =3D spa_format_audio_raw_build(&amp;b,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 SPA_PARAM_EnumFormat,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;v-&gt;info);<br>
+<br>
+=C2=A0 =C2=A0 /* connect the stream to a sink or source */<br>
+=C2=A0 =C2=A0 res =3D pw_stream_connect(v-&gt;stream,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 dir =3D=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 SPA_DIRECTION_INPUT ? PW_DIRECTION_INPUT :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 PW_DIRECTION_OUTPUT, PW_ID_ANY,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_AUTOCONNECT |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_INACTIVE |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_MAP_BUFFERS |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_RT_PROCESS, params, n_params);<br>
+=C2=A0 =C2=A0 if (res &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_destroy(v-&gt;stream);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int<br>
+qpw_stream_new(pwaudio *c, PWVoice *v, const char *stream_name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name, e=
num spa_direction dir)<br>
+{<br>
+=C2=A0 =C2=A0 int r;<br>
+<br>
+=C2=A0 =C2=A0 switch (v-&gt;info.channels) {<br>
+=C2=A0 =C2=A0 case 8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[0] =3D SPA_AUDIO_CHANNEL_F=
L;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[1] =3D SPA_AUDIO_CHANNEL_F=
R;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[2] =3D SPA_AUDIO_CHANNEL_F=
C;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[3] =3D SPA_AUDIO_CHANNEL_L=
FE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[4] =3D SPA_AUDIO_CHANNEL_R=
L;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[5] =3D SPA_AUDIO_CHANNEL_R=
R;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[6] =3D SPA_AUDIO_CHANNEL_S=
L;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[7] =3D SPA_AUDIO_CHANNEL_S=
R;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 6:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[0] =3D SPA_AUDIO_CHANNEL_F=
L;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[1] =3D SPA_AUDIO_CHANNEL_F=
R;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[2] =3D SPA_AUDIO_CHANNEL_F=
C;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[3] =3D SPA_AUDIO_CHANNEL_L=
FE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[4] =3D SPA_AUDIO_CHANNEL_R=
L;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[5] =3D SPA_AUDIO_CHANNEL_R=
R;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 5:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[0] =3D SPA_AUDIO_CHANNEL_F=
L;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[1] =3D SPA_AUDIO_CHANNEL_F=
R;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[2] =3D SPA_AUDIO_CHANNEL_F=
C;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[3] =3D SPA_AUDIO_CHANNEL_L=
FE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[4] =3D SPA_AUDIO_CHANNEL_R=
C;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[0] =3D SPA_AUDIO_CHANNEL_F=
L;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[1] =3D SPA_AUDIO_CHANNEL_F=
R;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[2] =3D SPA_AUDIO_CHANNEL_F=
C;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[3] =3D SPA_AUDIO_CHANNEL_R=
C;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[0] =3D SPA_AUDIO_CHANNEL_F=
L;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[1] =3D SPA_AUDIO_CHANNEL_F=
R;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[2] =3D SPA_AUDIO_CHANNEL_L=
FE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[0] =3D SPA_AUDIO_CHANNEL_F=
L;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[1] =3D SPA_AUDIO_CHANNEL_F=
R;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[0] =3D SPA_AUDIO_CHANNEL_M=
ONO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (size_t i =3D 0; i &lt; v-&gt;info.channel=
s; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[i] =3D SPA_A=
UDIO_CHANNEL_UNKNOWN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* create a new unconnected pwstream */<br>
+=C2=A0 =C2=A0 r =3D create_stream(c, v, stream_name, name, dir);<br>
+=C2=A0 =C2=A0 if (r &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 AUD_log(AUDIO_CAP, &quot;Failed to create stre=
am.&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return r;<br>
+}<br>
+<br>
+static int<br>
+qpw_init_out(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque)<br>
+{<br>
+=C2=A0 =C2=A0 PWVoiceOut *pw =3D (PWVoiceOut *) hw;<br>
+=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
+=C2=A0 =C2=A0 struct audsettings obt_as =3D *as;<br>
+=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g =3D drv_opaque;<br>
+=C2=A0 =C2=A0 AudiodevPipewireOptions *popts =3D &amp;c-&gt;dev-&gt;u.pipe=
wire;<br>
+=C2=A0 =C2=A0 AudiodevPipewirePerDirectionOptions *ppdo =3D popts-&gt;out;=
<br>
+=C2=A0 =C2=A0 int r;<br>
+<br>
+=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
+<br>
+=C2=A0 =C2=A0 v-&gt;info.format =3D audfmt_to_pw(as-&gt;fmt, as-&gt;endian=
ness);<br>
+=C2=A0 =C2=A0 v-&gt;info.channels =3D as-&gt;nchannels;<br>
+=C2=A0 =C2=A0 v-&gt;info.rate =3D as-&gt;freq;<br>
+<br>
+=C2=A0 =C2=A0 obt_as.fmt =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_to_audfmt(v-&gt;info.format, &amp;obt_as.en=
dianness, &amp;v-&gt;sample_size);<br>
+=C2=A0 =C2=A0 v-&gt;sample_size *=3D as-&gt;nchannels;<br>
+<br>
+=C2=A0 =C2=A0 v-&gt;req =3D (uint64_t)c-&gt;dev-&gt;timer_period * v-&gt;i=
nfo.rate<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1 / 2 / 1000000 * v-&gt;sample_size;<br>
+<br>
+=C2=A0 =C2=A0 /* call the function that creates a new stream for playback =
*/<br>
+=C2=A0 =C2=A0 r =3D qpw_stream_new(c, v, ppdo-&gt;stream_name ? : c-&gt;de=
v-&gt;id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ppdo-&gt;name, SPA_DIRECTION_OUTPUT);<br>
+=C2=A0 =C2=A0 if (r &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;qpw_stream_new for playback=
 failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* report the audio format we support */<br>
+=C2=A0 =C2=A0 audio_pcm_init_info(&amp;hw-&gt;info, &amp;obt_as);<br>
+<br>
+=C2=A0 =C2=A0 /* report the buffer size to qemu */<br>
+=C2=A0 =C2=A0 hw-&gt;samples =3D audio_buffer_frames(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_AudiodevPipewirePerDirectionOptions_base(=
ppdo), &amp;obt_as, 46440);<br>
+=C2=A0 =C2=A0 v-&gt;highwater_mark =3D MIN(RINGBUFFER_SIZE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (ppdo-&gt;has_latency ? ppdo-&gt;latency : 46440)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 * (uint64_t)v-&gt;info.rate / 1000000 * v-&gt;samp=
le_size);<br>
+<br>
+=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int<br>
+qpw_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)<br>
+{<br>
+=C2=A0 =C2=A0 PWVoiceIn *pw =3D (PWVoiceIn *) hw;<br>
+=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
+=C2=A0 =C2=A0 struct audsettings obt_as =3D *as;<br>
+=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g =3D drv_opaque;<br>
+=C2=A0 =C2=A0 AudiodevPipewireOptions *popts =3D &amp;c-&gt;dev-&gt;u.pipe=
wire;<br>
+=C2=A0 =C2=A0 AudiodevPipewirePerDirectionOptions *ppdo =3D popts-&gt;in;<=
br>
+=C2=A0 =C2=A0 int r;<br>
+<br>
+=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
+<br>
+=C2=A0 =C2=A0 v-&gt;info.format =3D audfmt_to_pw(as-&gt;fmt, as-&gt;endian=
ness);<br>
+=C2=A0 =C2=A0 v-&gt;info.channels =3D as-&gt;nchannels;<br>
+=C2=A0 =C2=A0 v-&gt;info.rate =3D as-&gt;freq;<br>
+<br>
+=C2=A0 =C2=A0 obt_as.fmt =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_to_audfmt(v-&gt;info.format, &amp;obt_as.en=
dianness, &amp;v-&gt;sample_size);<br>
+=C2=A0 =C2=A0 v-&gt;sample_size *=3D as-&gt;nchannels;<br>
+<br>
+=C2=A0 =C2=A0 /* call the function that creates a new stream for recording=
 */<br>
+=C2=A0 =C2=A0 r =3D qpw_stream_new(c, v, ppdo-&gt;stream_name ? : c-&gt;de=
v-&gt;id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ppdo-&gt;name, SPA_DIRECTION_INPUT);<br>
+=C2=A0 =C2=A0 if (r &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;qpw_stream_new for recordin=
g failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* report the audio format we support */<br>
+=C2=A0 =C2=A0 audio_pcm_init_info(&amp;hw-&gt;info, &amp;obt_as);<br>
+<br>
+=C2=A0 =C2=A0 /* report the buffer size to qemu */<br>
+=C2=A0 =C2=A0 hw-&gt;samples =3D audio_buffer_frames(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_AudiodevPipewirePerDirectionOptions_base(=
ppdo), &amp;obt_as, 46440);<br>
+<br>
+=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static void<br>
+qpw_fini_out(HWVoiceOut *hw)<br>
+{<br>
+=C2=A0 =C2=A0 PWVoiceOut *pw =3D (PWVoiceOut *) hw;<br>
+=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
+<br>
+=C2=A0 =C2=A0 if (v-&gt;stream) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_destroy(v-&gt;stream);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;stream =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void<br>
+qpw_fini_in(HWVoiceIn *hw)<br>
+{<br>
+=C2=A0 =C2=A0 PWVoiceIn *pw =3D (PWVoiceIn *) hw;<br>
+=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
+<br>
+=C2=A0 =C2=A0 if (v-&gt;stream) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_destroy(v-&gt;stream);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;stream =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void<br>
+qpw_enable_out(HWVoiceOut *hw, bool enable)<br>
+{<br>
+=C2=A0 =C2=A0 PWVoiceOut *po =3D (PWVoiceOut *) hw;<br>
+=C2=A0 =C2=A0 PWVoice *v =3D &amp;po-&gt;v;<br>
+=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
+=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 pw_stream_set_active(v-&gt;stream, enable);<br>
+=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
+}<br>
+<br>
+static void<br>
+qpw_enable_in(HWVoiceIn *hw, bool enable)<br>
+{<br>
+=C2=A0 =C2=A0 PWVoiceIn *pi =3D (PWVoiceIn *) hw;<br>
+=C2=A0 =C2=A0 PWVoice *v =3D &amp;pi-&gt;v;<br>
+=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
+=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 pw_stream_set_active(v-&gt;stream, enable);<br>
+=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
+}<br>
+<br>
+static void<br>
+qpw_volume_out(HWVoiceOut *hw, Volume *vol)<br>
+{<br>
+=C2=A0 =C2=A0 PWVoiceOut *pw =3D (PWVoiceOut *) hw;<br>
+=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
+=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
+=C2=A0 =C2=A0 int i, ret;<br>
+<br>
+=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 v-&gt;volume.channels =3D vol-&gt;channels;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; vol-&gt;channels; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;volume.values[i] =3D (float)vol-&gt;vol[=
i] / 255;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret =3D pw_stream_set_control(v-&gt;stream,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_PROP_channelVolumes, v-&gt;volume.channels=
, v-&gt;volume.values, 0);<br>
+=C2=A0 =C2=A0 trace_pw_vol(ret =3D=3D 0 ? &quot;success&quot; : &quot;fail=
ed&quot;);<br>
+<br>
+=C2=A0 =C2=A0 v-&gt;muted =3D vol-&gt;mute;<br>
+=C2=A0 =C2=A0 float val =3D v-&gt;muted ? 1.f : 0.f;<br>
+=C2=A0 =C2=A0 ret =3D pw_stream_set_control(v-&gt;stream, SPA_PROP_mute, 1=
, &amp;val, 0);<br>
+=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
+}<br>
+<br>
+static void<br>
+qpw_volume_in(HWVoiceIn *hw, Volume *vol)<br>
+{<br>
+=C2=A0 =C2=A0 PWVoiceIn *pw =3D (PWVoiceIn *) hw;<br>
+=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
+=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
+=C2=A0 =C2=A0 int i, ret;<br>
+<br>
+=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 v-&gt;volume.channels =3D vol-&gt;channels;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; vol-&gt;channels; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;volume.values[i] =3D (float)vol-&gt;vol[=
i] / 255;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret =3D pw_stream_set_control(v-&gt;stream,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_PROP_channelVolumes, v-&gt;volume.channels=
, v-&gt;volume.values, 0);<br>
+=C2=A0 =C2=A0 trace_pw_vol(ret =3D=3D 0 ? &quot;success&quot; : &quot;fail=
ed&quot;);<br>
+<br>
+=C2=A0 =C2=A0 v-&gt;muted =3D vol-&gt;mute;<br>
+=C2=A0 =C2=A0 float val =3D v-&gt;muted ? 1.f : 0.f;<br>
+=C2=A0 =C2=A0 ret =3D pw_stream_set_control(v-&gt;stream, SPA_PROP_mute, 1=
, &amp;val, 0);<br>
+=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
+}<br>
+<br>
+static int wait_resync(pwaudio *pw)<br>
+{<br>
+=C2=A0 =C2=A0 int res;<br>
+=C2=A0 =C2=A0 pw-&gt;pending_seq =3D pw_core_sync(pw-&gt;core, PW_ID_CORE,=
 pw-&gt;pending_seq);<br>
+<br>
+=C2=A0 =C2=A0 while (true) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_wait(pw-&gt;thread_loop);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D pw-&gt;error;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw-&gt;error =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return res;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pw-&gt;pending_seq =3D=3D pw-&gt;last_seq)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+static void<br>
+on_core_error(void *data, uint32_t id, int seq, int res, const char *messa=
ge)<br>
+{<br>
+=C2=A0 =C2=A0 pwaudio *pw =3D data;<br>
+<br>
+=C2=A0 =C2=A0 error_report(&quot;error id:%u seq:%d res:%d (%s): %s&quot;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id, seq, res, spa_=
strerror(res), message);<br>
+<br>
+=C2=A0 =C2=A0 /* stop and exit the thread loop */<br>
+=C2=A0 =C2=A0 pw_thread_loop_signal(pw-&gt;thread_loop, FALSE);<br>
+}<br>
+<br>
+static void<br>
+on_core_done(void *data, uint32_t id, int seq)<br>
+{<br>
+=C2=A0 =C2=A0 pwaudio *pw =3D data;<br>
+=C2=A0 =C2=A0 assert(id =3D=3D PW_ID_CORE);<br>
+=C2=A0 =C2=A0 pw-&gt;last_seq =3D seq;<br>
+=C2=A0 =C2=A0 if (pw-&gt;pending_seq =3D=3D seq) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* stop and exit the thread loop */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_signal(pw-&gt;thread_loop, FALS=
E);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static const struct pw_core_events core_events =3D {<br>
+=C2=A0 =C2=A0 PW_VERSION_CORE_EVENTS,<br>
+=C2=A0 =C2=A0 .done =3D on_core_done,<br>
+=C2=A0 =C2=A0 .error =3D on_core_error,<br>
+};<br>
+<br>
+static void *<br>
+qpw_audio_init(Audiodev *dev)<br>
+{<br>
+=C2=A0 =C2=A0 g_autofree pwaudio *pw =3D g_new0(pwaudio, 1);<br>
+=C2=A0 =C2=A0 pw_init(NULL, NULL);<br>
+<br>
+=C2=A0 =C2=A0 trace_pw_audio_init();<br>
+=C2=A0 =C2=A0 assert(dev-&gt;driver =3D=3D AUDIODEV_DRIVER_PIPEWIRE);<br>
+<br>
+=C2=A0 =C2=A0 pw-&gt;dev =3D dev;<br>
+=C2=A0 =C2=A0 pw-&gt;thread_loop =3D pw_thread_loop_new(&quot;Pipewire thr=
ead loop&quot;, NULL);<br>
+=C2=A0 =C2=A0 if (pw-&gt;thread_loop =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Could not create Pipewire l=
oop&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 pw-&gt;context =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_context_new(pw_thread_loop_get_loop(pw-&gt;=
thread_loop), NULL, 0);<br>
+=C2=A0 =C2=A0 if (pw-&gt;context =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Could not create Pipewire c=
ontext&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (pw_thread_loop_start(pw-&gt;thread_loop) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Could not start Pipewire lo=
op&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 pw_thread_loop_lock(pw-&gt;thread_loop);<br>
+<br>
+=C2=A0 =C2=A0 pw-&gt;core =3D pw_context_connect(pw-&gt;context, NULL, 0);=
<br>
+=C2=A0 =C2=A0 if (pw-&gt;core =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_unlock(pw-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (pw_core_add_listener(pw-&gt;core, &amp;pw-&gt;core_liste=
ner,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;core_events, pw) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_unlock(pw-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (wait_resync(pw) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_unlock(pw-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 pw_thread_loop_unlock(pw-&gt;thread_loop);<br>
+<br>
+=C2=A0 =C2=A0 return g_steal_pointer(&amp;pw);<br>
+<br>
+fail:<br>
+=C2=A0 =C2=A0 AUD_log(AUDIO_CAP, &quot;Failed to initialize PW context&quo=
t;);<br>
+=C2=A0 =C2=A0 if (pw-&gt;thread_loop) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_stop(pw-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (pw-&gt;context) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_clear_pointer(&amp;pw-&gt;context, pw_contex=
t_destroy);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (pw-&gt;thread_loop) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_clear_pointer(&amp;pw-&gt;thread_loop, pw_th=
read_loop_destroy);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+static void<br>
+qpw_audio_fini(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 pwaudio *pw =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 if (pw-&gt;thread_loop) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_stop(pw-&gt;thread_loop);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (pw-&gt;core) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;pw-&gt;core_listener);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_zero(pw-&gt;core_listener);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_core_disconnect(pw-&gt;core);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (pw-&gt;context) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_context_destroy(pw-&gt;context);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 pw_thread_loop_destroy(pw-&gt;thread_loop);<br>
+<br>
+=C2=A0 =C2=A0 g_free(pw);<br>
+}<br>
+<br>
+static struct audio_pcm_ops qpw_pcm_ops =3D {<br>
+=C2=A0 =C2=A0 .init_out =3D qpw_init_out,<br>
+=C2=A0 =C2=A0 .fini_out =3D qpw_fini_out,<br>
+=C2=A0 =C2=A0 .write =3D qpw_write,<br>
+=C2=A0 =C2=A0 .buffer_get_free =3D qpw_buffer_get_free,<br>
+=C2=A0 =C2=A0 .run_buffer_out =3D audio_generic_run_buffer_out,<br>
+=C2=A0 =C2=A0 .enable_out =3D qpw_enable_out,<br>
+=C2=A0 =C2=A0 .volume_out =3D qpw_volume_out,<br>
+=C2=A0 =C2=A0 .volume_in =3D qpw_volume_in,<br>
+<br>
+=C2=A0 =C2=A0 .init_in =3D qpw_init_in,<br>
+=C2=A0 =C2=A0 .fini_in =3D qpw_fini_in,<br>
+=C2=A0 =C2=A0 .read =3D qpw_read,<br>
+=C2=A0 =C2=A0 .run_buffer_in =3D audio_generic_run_buffer_in,<br>
+=C2=A0 =C2=A0 .enable_in =3D qpw_enable_in<br>
+};<br>
+<br>
+static struct audio_driver pw_audio_driver =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;pipewire&quot;,<br>
+=C2=A0 =C2=A0 .descr =3D &quot;<a href=3D"http://www.pipewire.org/" rel=3D=
"noreferrer" target=3D"_blank">http://www.pipewire.org/</a>&quot;,<br>
+=C2=A0 =C2=A0 .init =3D qpw_audio_init,<br>
+=C2=A0 =C2=A0 .fini =3D qpw_audio_fini,<br>
+=C2=A0 =C2=A0 .pcm_ops =3D &amp;qpw_pcm_ops,<br>
+=C2=A0 =C2=A0 .can_be_default =3D 1,<br>
+=C2=A0 =C2=A0 .max_voices_out =3D INT_MAX,<br>
+=C2=A0 =C2=A0 .max_voices_in =3D INT_MAX,<br>
+=C2=A0 =C2=A0 .voice_size_out =3D sizeof(PWVoiceOut),<br>
+=C2=A0 =C2=A0 .voice_size_in =3D sizeof(PWVoiceIn),<br>
+};<br>
+<br>
+static void<br>
+register_audio_pw(void)<br>
+{<br>
+=C2=A0 =C2=A0 audio_driver_register(&amp;pw_audio_driver);<br>
+}<br>
+<br>
+type_init(register_audio_pw);<br>
diff --git a/audio/trace-events b/audio/trace-events<br>
index e1ab643add..c764e5641b 100644<br>
--- a/audio/trace-events<br>
+++ b/audio/trace-events<br>
@@ -18,6 +18,14 @@ dbus_audio_register(const char *s, const char *dir) &quo=
t;sender =3D %s, dir =3D %s&quot;<br>
=C2=A0dbus_audio_put_buffer_out(size_t len) &quot;len =3D %zu&quot;<br>
=C2=A0dbus_audio_read(size_t len) &quot;len =3D %zu&quot;<br>
<br>
+# pwaudio.c<br>
+pw_state_changed(int nodeid, const char *s) &quot;node id: %d stream state=
: %s&quot;<br>
+pw_read(int32_t avail, uint32_t index, size_t len) &quot;avail=3D%d index=
=3D%u len=3D%zu&quot;<br>
+pw_write(int32_t filled, int32_t avail, uint32_t index, size_t len) &quot;=
filled=3D%d avail=3D%d index=3D%u len=3D%zu&quot;<br>
+pw_vol(const char *ret) &quot;set volume: %s&quot;<br>
+pw_timer(uint64_t buf_samples) &quot;timer period =3D %&quot; PRIu64<br>
+pw_audio_init(void) &quot;Initialize Pipewire context&quot;<br>
+<br>
=C2=A0# audio.c<br>
=C2=A0audio_timer_start(int interval) &quot;interval %d ms&quot;<br>
=C2=A0audio_timer_stop(void) &quot;&quot;<br>
diff --git a/meson.build b/meson.build<br>
index 29f8644d6d..31bf280c0d 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -730,6 +730,12 @@ if not get_option(&#39;jack&#39;).auto() or have_syste=
m<br>
=C2=A0 =C2=A0jack =3D dependency(&#39;jack&#39;, required: get_option(&#39;=
jack&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0method: &#39;pkg-config&#39;, kwargs: static_kwargs)<br>
=C2=A0endif<br>
+pipewire =3D not_found<br>
+if not get_option(&#39;pipewire&#39;).auto() or (targetos =3D=3D &#39;linu=
x&#39; and have_system)<br>
+=C2=A0 pipewire =3D dependency(&#39;libpipewire-0.3&#39;, version: &#39;&g=
t;=3D0.3.60&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 requ=
ired: get_option(&#39;pipewire&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meth=
od: &#39;pkg-config&#39;, kwargs: static_kwargs)<br>
+endif<br>
=C2=A0sndio =3D not_found<br>
=C2=A0if not get_option(&#39;sndio&#39;).auto() or have_system<br>
=C2=A0 =C2=A0sndio =3D dependency(&#39;sndio&#39;, required: get_option(&#3=
9;sndio&#39;),<br>
@@ -1667,6 +1673,7 @@ if have_system<br>
=C2=A0 =C2=A0 =C2=A0&#39;jack&#39;: jack.found(),<br>
=C2=A0 =C2=A0 =C2=A0&#39;oss&#39;: oss.found(),<br>
=C2=A0 =C2=A0 =C2=A0&#39;pa&#39;: pulse.found(),<br>
+=C2=A0 =C2=A0 &#39;pipewire&#39;: pipewire.found(),<br>
=C2=A0 =C2=A0 =C2=A0&#39;sdl&#39;: sdl.found(),<br>
=C2=A0 =C2=A0 =C2=A0&#39;sndio&#39;: sndio.found(),<br>
=C2=A0 =C2=A0}<br>
@@ -3980,6 +3987,7 @@ if targetos =3D=3D &#39;linux&#39;<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;ALSA support&#39;:=C2=A0 =C2=A0 alsa}<=
br>
=C2=A0 =C2=A0summary_info +=3D {&#39;PulseAudio support&#39;: pulse}<br>
=C2=A0endif<br>
+summary_info +=3D {&#39;Pipewire support&#39;:=C2=A0 =C2=A0pipewire}<br>
=C2=A0summary_info +=3D {&#39;JACK support&#39;:=C2=A0 =C2=A0 =C2=A0 jack}<=
br>
=C2=A0summary_info +=3D {&#39;brlapi support&#39;:=C2=A0 =C2=A0 brlapi}<br>
=C2=A0summary_info +=3D {&#39;vde support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0v=
de}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index fc9447d267..9ae1ec7f47 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -21,7 +21,7 @@ option(&#39;tls_priority&#39;, type : &#39;string&#39;, v=
alue : &#39;NORMAL&#39;,<br>
=C2=A0option(&#39;default_devices&#39;, type : &#39;boolean&#39;, value : t=
rue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Include a default selection o=
f devices in emulators&#39;)<br>
=C2=A0option(&#39;audio_drv_list&#39;, type: &#39;array&#39;, value: [&#39;=
default&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0choices: [&#39;alsa&#39;, &#39;coreaudio&#39;, =
&#39;default&#39;, &#39;dsound&#39;, &#39;jack&#39;, &#39;oss&#39;, &#39;pa=
&#39;, &#39;sdl&#39;, &#39;sndio&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0choices: [&#39;alsa&#39;, &#39;coreaudio&#39;, =
&#39;default&#39;, &#39;dsound&#39;, &#39;jack&#39;, &#39;oss&#39;, &#39;pa=
&#39;, &#39;pipewire&#39;, &#39;sdl&#39;, &#39;sndio&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Set audio driver list&#39;)<b=
r>
=C2=A0option(&#39;block_drv_rw_whitelist&#39;, type : &#39;string&#39;, val=
ue : &#39;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;set block driver read-write w=
hitelist (by default affects only QEMU, not tools like qemu-img)&#39;)<br>
@@ -255,6 +255,8 @@ option(&#39;oss&#39;, type: &#39;feature&#39;, value: &=
#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;OSS sound support&#39;)<br>
=C2=A0option(&#39;pa&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;PulseAudio sound support&#39;=
)<br>
+option(&#39;pipewire&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Pipewire sound support&#39;)<=
br>
=C2=A0option(&#39;sndio&#39;, type: &#39;feature&#39;, value: &#39;auto&#39=
;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;sndio sound support&#39;)<br>
<br>
diff --git a/qapi/audio.json b/qapi/audio.json<br>
index 4e54c00f51..e03396a7bc 100644<br>
--- a/qapi/audio.json<br>
+++ b/qapi/audio.json<br>
@@ -324,6 +324,47 @@<br>
=C2=A0 =C2=A0 =C2=A0&#39;*out&#39;:=C2=A0 =C2=A0 &#39;AudiodevPaPerDirectio=
nOptions&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;*server&#39;: &#39;str&#39; } }<br>
<br>
+##<br>
+# @AudiodevPipewirePerDirectionOptions:<br>
+#<br>
+# Options of the Pipewire backend that are used for both playback and<br>
+# recording.<br>
+#<br>
+# @name: name of the sink/source to use<br>
+#<br>
+# @stream-name: name of the Pipewire stream created by qemu.=C2=A0 Can be<=
br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used to identify t=
he stream in Pipewire when you<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create multiple Pi=
pewire devices or run multiple qemu<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0instances (default=
: audiodev&#39;s id)<br>
+#<br>
+# @latency: latency you want Pipewire to achieve in microseconds<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(default 46000)<br>
+#<br>
+# Since: 8.1<br>
+##<br>
+{ &#39;struct&#39;: &#39;AudiodevPipewirePerDirectionOptions&#39;,<br>
+=C2=A0 &#39;base&#39;: &#39;AudiodevPerDirectionOptions&#39;,<br>
+=C2=A0 &#39;data&#39;: {<br>
+=C2=A0 =C2=A0 &#39;*name&#39;: &#39;str&#39;,<br>
+=C2=A0 =C2=A0 &#39;*stream-name&#39;: &#39;str&#39;,<br>
+=C2=A0 =C2=A0 &#39;*latency&#39;: &#39;uint32&#39; } }<br>
+<br>
+##<br>
+# @AudiodevPipewireOptions:<br>
+#<br>
+# Options of the Pipewire audio backend.<br>
+#<br>
+# @in: options of the capture stream<br>
+#<br>
+# @out: options of the playback stream<br>
+#<br>
+# Since: 8.1<br>
+##<br>
+{ &#39;struct&#39;: &#39;AudiodevPipewireOptions&#39;,<br>
+=C2=A0 &#39;data&#39;: {<br>
+=C2=A0 =C2=A0 &#39;*in&#39;:=C2=A0 =C2=A0 =C2=A0&#39;AudiodevPipewirePerDi=
rectionOptions&#39;,<br>
+=C2=A0 =C2=A0 &#39;*out&#39;:=C2=A0 =C2=A0 &#39;AudiodevPipewirePerDirecti=
onOptions&#39; } }<br>
+<br>
=C2=A0##<br>
=C2=A0# @AudiodevSdlPerDirectionOptions:<br>
=C2=A0#<br>
@@ -416,6 +457,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;jack=
&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_JACK&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;oss&=
#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_OSS&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;pa&#=
39;, &#39;if&#39;: &#39;CONFIG_AUDIO_PA&#39; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;pipewire&=
#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_PIPEWIRE&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;sdl&=
#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_SDL&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;sndi=
o&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_SNDIO&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;spic=
e&#39;, &#39;if&#39;: &#39;CONFIG_SPICE&#39; },<br>
@@ -456,6 +498,8 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
if&#39;: &#39;CONFIG_AUDIO_OSS&#39; },<br>
=C2=A0 =C2=A0 =C2=A0&#39;pa&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;type&#3=
9;: &#39;AudiodevPaOptions&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
if&#39;: &#39;CONFIG_AUDIO_PA&#39; },<br>
+=C2=A0 =C2=A0 &#39;pipewire&#39;:=C2=A0 { &#39;type&#39;: &#39;AudiodevPip=
ewireOptions&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
if&#39;: &#39;CONFIG_AUDIO_PIPEWIRE&#39; },<br>
=C2=A0 =C2=A0 =C2=A0&#39;sdl&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;type&#3=
9;: &#39;AudiodevSdlOptions&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
if&#39;: &#39;CONFIG_AUDIO_SDL&#39; },<br>
=C2=A0 =C2=A0 =C2=A0&#39;sndio&#39;:=C2=A0 =C2=A0 =C2=A0{ &#39;type&#39;: &=
#39;AudiodevSndioOptions&#39;,<br>
diff --git a/qemu-options.hx b/qemu-options.hx<br>
index 59bdf67a2c..2d908717bd 100644<br>
--- a/qemu-options.hx<br>
+++ b/qemu-options.hx<br>
@@ -779,6 +779,12 @@ DEF(&quot;audiodev&quot;, HAS_ARG, QEMU_OPTION_audiode=
v,<br>
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 in|<a href=3D"http://out.name" rel=3D"noreferrer" target=3D"_blank">=
out.name</a>=3D source/sink device name\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 in|out.latency=3D desired latency in microseconds\n&quot;<br>
=C2=A0#endif<br>
+#ifdef CONFIG_AUDIO_PIPEWIRE<br>
+=C2=A0 =C2=A0 &quot;-audiodev pipewire,id=3Did[,prop[=3Dvalue][,...]]\n&qu=
ot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 in|<a href=3D"http://out.name" rel=3D"noreferrer" target=3D"_blank">out=
.name</a>=3D source/sink device name\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 in|out.stream-name=3D name of pipewire stream\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 in|out.latency=3D desired latency in microseconds\n&quot;<br>
+#endif<br>
=C2=A0#ifdef CONFIG_AUDIO_SDL<br>
=C2=A0 =C2=A0 =C2=A0&quot;-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]\n&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 in|out.buffer-count=3D number of buffers\n&quot;<br>
@@ -942,6 +948,21 @@ SRST<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Desired latency in microseconds. The Puls=
eAudio server will try<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to honor this value but actual latencies =
may be lower or higher.<br>
<br>
+``-audiodev pipewire,id=3Did[,prop[=3Dvalue][,...]]``<br>
+=C2=A0 =C2=A0 Creates a backend using Pipewire. This backend is available =
on<br>
+=C2=A0 =C2=A0 most systems.<br>
+<br>
+=C2=A0 =C2=A0 Pipewire specific options are:<br>
+<br>
+=C2=A0 =C2=A0 ``in|out.latency=3Dusecs``<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Desired latency in microseconds.<br>
+<br>
+=C2=A0 =C2=A0 ``in|<a href=3D"http://out.name" rel=3D"noreferrer" target=
=3D"_blank">out.name</a>=3Dsink``<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Use the specified source/sink for recording/pl=
ayback.<br>
+<br>
+=C2=A0 =C2=A0 ``in|out.stream-name``<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Specify the name of pipewire stream.<br>
+<br>
=C2=A0``-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]``<br>
=C2=A0 =C2=A0 =C2=A0Creates a backend using SDL. This backend is available =
on most<br>
=C2=A0 =C2=A0 =C2=A0systems, but you should use your platform&#39;s native =
backend if<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index 009fab1515..ba1057b62c 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -1,7 +1,8 @@<br>
=C2=A0# This file is generated by meson-buildoptions.py, do not edit!<br>
=C2=A0meson_options_help() {<br>
-=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --audio-drv-list=3DCHOICES Set =
audio driver list [default] (choices: alsa/co&#39;<br>
-=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reaudio/default/=
dsound/jack/oss/pa/sdl/sndio)&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --audio-drv-list=3DCHOICES Set =
audio driver list [default] (choices: al&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sa/coreaudio/def=
ault/dsound/jack/oss/pa/&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pipewire/sdl/snd=
io)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --block-drv-ro-whitelist=
=3DVALUE&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set block=
 driver read-only whitelist (by default&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0affects o=
nly QEMU, not tools like qemu-img)&#39;<br>
@@ -136,6 +137,7 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 oss=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0OSS sound support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 pa=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 PulseAudio sound support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 parallels=C2=A0 =C2=A0 =C2=
=A0 =C2=A0parallels image format support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 pipewire=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Pipewire sound support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 png=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0PNG support with libpng&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 pvrdma=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 Enable PVRDMA support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 qcow1=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0qcow1 image format support&#39;<br>
@@ -370,6 +372,8 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-pa) printf &quot;%s&quot; -Dpa=3Ddisabled ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--enable-parallels) printf &quot;%s&quot; -Dparallels=
=3Denabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-parallels) printf &quot;%s&quot; -Dparallels=
=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-pipewire) printf &quot;%s&quot; -Dpipewire=3Denable=
d ;;<br>
+=C2=A0 =C2=A0 --disable-pipewire) printf &quot;%s&quot; -Dpipewire=3Ddisab=
led ;;<br>
=C2=A0 =C2=A0 =C2=A0--with-pkgversion=3D*) quote_sh &quot;-Dpkgversion=3D$2=
&quot; ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-png) printf &quot;%s&quot; -Dpng=3Denabled ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--disable-png) printf &quot;%s&quot; -Dpng=3Ddisabled ;=
;<br>
-- <br>
2.39.1<br>
<br>
</blockquote></div>

--00000000000006e81d05f92404c6--


