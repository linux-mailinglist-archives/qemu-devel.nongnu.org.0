Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F406E31A4
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 15:47:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pngEO-00072Q-9Y; Sat, 15 Apr 2023 09:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pngEJ-00072A-Hs
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 09:46:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pngEC-0002UL-LC
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 09:46:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681566367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SV/nAIzLK748YgRZrQE2KbmKcK8b1FnwziR2UQvxzas=;
 b=Am177445+JOP2DpiVOMa8Ws3qEAQadSojMc0wo8c/CjC5rpgRgjjv8DnjNe79i2GJh/JVj
 1ja+Iec5dqRspBzMrVkQ/KTzN90uodKzvH8XfFKVqkaqa/Ql7l0fq7RswwAePdqzoqamE5
 x9a/gwxsBx6E2kVTYj8sBEnN9wFRVhM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-DA2KEFRJMVOw8taTSG56Pw-1; Sat, 15 Apr 2023 09:46:03 -0400
X-MC-Unique: DA2KEFRJMVOw8taTSG56Pw-1
Received: by mail-qt1-f198.google.com with SMTP id
 d20-20020a05622a05d400b003edf6076831so306861qtb.6
 for <qemu-devel@nongnu.org>; Sat, 15 Apr 2023 06:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681566363; x=1684158363;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SV/nAIzLK748YgRZrQE2KbmKcK8b1FnwziR2UQvxzas=;
 b=F7OUatqP71XlgmXjt6TGRkGRyFZUfP1o+e7+xQ+tfkwMT6uHnaSFFQjcvBuvk2w0Z6
 vSk2csF6K5NswcF75FmLCRQ6h22ZBHR/QvfQM7rUcuQkpebpGf7PIF1XSbAH+R9mAhau
 IsKJY8NIi/O/0SfiCKBdW0ZFrGTkXIxIIX5a0eu0LvxMoTWA0GOPhXm3snF0C38qrDg6
 483Q4LHtH1MY7hTHs4i7MA/nkmQvNNFZzYd489Gx4o3idUsgO3UxEjmgFuTm4rUNq1lz
 M+hweo+Wqq2TE3ds8MbVg6iankwphG5eki3ELjMqWsV7mWsN7l6ZjPAXVkwFR6m5Yia1
 XKaQ==
X-Gm-Message-State: AAQBX9dXOpzBAYSXJEiU5EQi4dHNtMgTnsWs+yzu8HnxrjQfS8uQcmFN
 cgFH2VftYDtmxaVB537gXaBphZjTHg7/1qRn2o0Hpahacr0dlLG1EeraLQmxmGpIT2UlCRk8PRg
 IFgiB0xn9dLpVaMeZeJIhZzKPbfhEPdA=
X-Received: by 2002:a05:6214:f67:b0:56e:98a1:fff1 with SMTP id
 iy7-20020a0562140f6700b0056e98a1fff1mr9563294qvb.7.1681566362810; 
 Sat, 15 Apr 2023 06:46:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350YrKKgM4txJnZBtSVZADbo3XAPU1ioutMVeHZP9N3GngIpAF8xuBUlhBtSERk6u8Ycw4Zm5Z8h9sLVyszQfjsE=
X-Received: by 2002:a05:6214:f67:b0:56e:98a1:fff1 with SMTP id
 iy7-20020a0562140f6700b0056e98a1fff1mr9563245qvb.7.1681566362270; Sat, 15 Apr
 2023 06:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230412135730.51012-1-dbassey@redhat.com>
 <37459b0c-9375-2abb-5f86-f101f92eb646@t-online.de>
In-Reply-To: <37459b0c-9375-2abb-5f86-f101f92eb646@t-online.de>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Sat, 15 Apr 2023 15:45:51 +0200
Message-ID: <CACzuRyyM=OUjKZJmrv8TutGLrvSTm=aFnAXO9D+DnyZuq1L22A@mail.gmail.com>
Subject: Re: [PATCH v11] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: qemu-devel@nongnu.org, marcandre.lureau@gmail.com, kraxel@redhat.com, 
 armbru@redhat.com, qemu_oss@crudebyte.com, pbonzini@redhat.com, 
 wtaymans@redhat.com
Content-Type: multipart/alternative; boundary="000000000000b0963105f9602d47"
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

--000000000000b0963105f9602d47
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the clarification, I will look into it.

Regards,
Dorinda.

On Sat, Apr 15, 2023 at 9:39=E2=80=AFAM Volker R=C3=BCmelin <vr_qemu@t-onli=
ne.de> wrote:

> Hi Dorinda,
>
> > This commit adds a new audiodev backend to allow QEMU to use Pipewire a=
s
> > both an audio sink and source. This backend is available on most system=
s
> >
> > Add Pipewire entry points for QEMU Pipewire audio backend
> > Add wrappers for QEMU Pipewire audio backend in qpw_pcm_ops()
> > qpw_write function returns the current state of the stream to pwaudio
> > and Writes some data to the server for playback streams using pipewire
> > spa_ringbuffer implementation.
> > qpw_read function returns the current state of the stream to pwaudio an=
d
> > reads some data from the server for capture streams using pipewire
> > spa_ringbuffer implementation. These functions qpw_write and qpw_read
> > are called during playback and capture.
> > Added some functions that convert pw audio formats to QEMU audio format
> > and vice versa which would be needed in the pipewire audio sink and
> > source functions qpw_init_in() & qpw_init_out().
> > These methods that implement playback and recording will create streams
> > for playback and capture that will start processing and will result in
> > the on_process callbacks to be called.
> > Built a connection to the Pipewire sound system server in the
> > qpw_audio_init() method.
> >
> > Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
> > ---
> > v11:
> > handle buffer underruns in qpw_write
> > use local variable
> > change param name frame_size
> > fix format specifier
> > change trace value to trace quantum
> >
> >   audio/audio.c                 |   3 +
> >   audio/audio_template.h        |   4 +
> >   audio/meson.build             |   1 +
> >   audio/pwaudio.c               | 913 +++++++++++++++++++++++++++++++++=
+
> >   audio/trace-events            |   8 +
> >   meson.build                   |   8 +
> >   meson_options.txt             |   4 +-
> >   qapi/audio.json               |  44 ++
> >   qemu-options.hx               |  21 +
> >   scripts/meson-buildoptions.sh |   8 +-
> >   10 files changed, 1011 insertions(+), 3 deletions(-)
> >   create mode 100644 audio/pwaudio.c
> >
> > diff --git a/audio/audio.c b/audio/audio.c
> > index 70b096713c..90c7c49d11 100644
> > --- a/audio/audio.c
> > +++ b/audio/audio.c
> > @@ -2061,6 +2061,9 @@ void audio_create_pdos(Audiodev *dev)
> >   #ifdef CONFIG_AUDIO_PA
> >           CASE(PA, pa, Pa);
> >   #endif
> > +#ifdef CONFIG_AUDIO_PIPEWIRE
> > +        CASE(PIPEWIRE, pipewire, Pipewire);
> > +#endif
> >   #ifdef CONFIG_AUDIO_SDL
> >           CASE(SDL, sdl, Sdl);
> >   #endif
> > diff --git a/audio/audio_template.h b/audio/audio_template.h
> > index e42326c20d..dc0c74aa74 100644
> > --- a/audio/audio_template.h
> > +++ b/audio/audio_template.h
> > @@ -362,6 +362,10 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_,
> TYPE)(Audiodev *dev)
> >       case AUDIODEV_DRIVER_PA:
> >           return qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE=
);
> >   #endif
> > +#ifdef CONFIG_AUDIO_PIPEWIRE
> > +    case AUDIODEV_DRIVER_PIPEWIRE:
> > +        return
> qapi_AudiodevPipewirePerDirectionOptions_base(dev->u.pipewire.TYPE);
> > +#endif
> >   #ifdef CONFIG_AUDIO_SDL
> >       case AUDIODEV_DRIVER_SDL:
> >           return
> qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.TYPE);
> > diff --git a/audio/meson.build b/audio/meson.build
> > index 0722224ba9..65a49c1a10 100644
> > --- a/audio/meson.build
> > +++ b/audio/meson.build
> > @@ -19,6 +19,7 @@ foreach m : [
> >     ['sdl', sdl, files('sdlaudio.c')],
> >     ['jack', jack, files('jackaudio.c')],
> >     ['sndio', sndio, files('sndioaudio.c')],
> > +  ['pipewire', pipewire, files('pwaudio.c')],
> >     ['spice', spice, files('spiceaudio.c')]
> >   ]
> >     if m[1].found()
> > diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> > new file mode 100644
> > index 0000000000..adf1a538c0
> > --- /dev/null
> > +++ b/audio/pwaudio.c
> > @@ -0,0 +1,913 @@
> > +/*
> > + * QEMU Pipewire audio driver
> > + *
> > + * Copyright (c) 2023 Red Hat Inc.
> > + *
> > + * Author: Dorinda Bassey       <dbassey@redhat.com>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/module.h"
> > +#include "audio.h"
> > +#include <errno.h>
> > +#include "qemu/error-report.h"
> > +#include <spa/param/audio/format-utils.h>
> > +#include <spa/utils/ringbuffer.h>
> > +#include <spa/utils/result.h>
> > +#include <spa/param/props.h>
> > +
> > +#include <pipewire/pipewire.h>
> > +#include "trace.h"
> > +
> > +#define AUDIO_CAP "pipewire"
> > +#define RINGBUFFER_SIZE    (1u << 22)
> > +#define RINGBUFFER_MASK    (RINGBUFFER_SIZE - 1)
> > +
> > +#include "audio_int.h"
> > +
> > +typedef struct pwvolume {
> > +    uint32_t channels;
> > +    float values[SPA_AUDIO_MAX_CHANNELS];
> > +} pwvolume;
> > +
> > +typedef struct pwaudio {
> > +    Audiodev *dev;
> > +    struct pw_thread_loop *thread_loop;
> > +    struct pw_context *context;
> > +
> > +    struct pw_core *core;
> > +    struct spa_hook core_listener;
> > +    int last_seq, pending_seq, error;
> > +} pwaudio;
> > +
> > +typedef struct PWVoice {
> > +    pwaudio *g;
> > +    struct pw_stream *stream;
> > +    struct spa_hook stream_listener;
> > +    struct spa_audio_info_raw info;
> > +    uint32_t highwater_mark;
> > +    uint32_t sample_size, req;
>
> The older patches used the correct name frame_size instead of
> sample_size. Please revert this. Further below I've written an explanatio=
n.
>
> > +    struct spa_ringbuffer ring;
> > +    uint8_t buffer[RINGBUFFER_SIZE];
> > +
> > +    pwvolume volume;
> > +    bool muted;
> > +} PWVoice;
> > +
> > +typedef struct PWVoiceOut {
> > +    HWVoiceOut hw;
> > +    PWVoice v;
> > +} PWVoiceOut;
> > +
> > +typedef struct PWVoiceIn {
> > +    HWVoiceIn hw;
> > +    PWVoice v;
> > +} PWVoiceIn;
> > +
> > +static void
> > +stream_destroy(void *data)
> > +{
> > +    PWVoice *v =3D (PWVoice *) data;
> > +    spa_hook_remove(&v->stream_listener);
> > +    v->stream =3D NULL;
> > +}
> > +
> > +/* output data processing function to read stuffs from the buffer */
> > +static void
> > +playback_on_process(void *data)
> > +{
> > +    PWVoice *v =3D (PWVoice *) data;
> > +    void *p;
> > +    struct pw_buffer *b;
> > +    struct spa_buffer *buf;
> > +    uint32_t req, index, n_bytes;
> > +    int32_t avail;
> > +
> > +    assert(v->stream);
> > +
> > +    /* obtain a buffer to read from */
> > +    b =3D pw_stream_dequeue_buffer(v->stream);
> > +    if (b =3D=3D NULL) {
> > +        error_report("out of buffers: %s", strerror(errno));
> > +        return;
> > +    }
> > +
> > +    buf =3D b->buffer;
> > +    p =3D buf->datas[0].data;
> > +    if (p =3D=3D NULL) {
> > +        return;
> > +    }
> > +    /* calculate the total no of bytes to read data from buffer */
> > +    req =3D b->requested * v->sample_size;
> > +    if (req =3D=3D 0) {
> > +        req =3D v->req;
> > +    }
> > +    n_bytes =3D SPA_MIN(req, buf->datas[0].maxsize);
> > +
> > +    /* get no of available bytes to read data from buffer */
> > +
> > +    avail =3D spa_ringbuffer_get_read_index(&v->ring, &index);
> > +
> > +    if (avail <=3D 0) {
> > +        /* underrun, can't really happen but if it does we */
> > +        /* do nothing and wait for more data */
> > +        error_report("%p: underrun read:%u avail:%d", p, index, avail)=
;
>
> Please don't do that. The PipeWire audio threads have a higher priority
> than the QEMU thread. On a heavily loaded system the callbacks will be
> called even if QEMU nearly stalled. So this is the right place to detect
> a buffer underflow and continue to write silent audio frames.
>
> There's no need for an error report. Buffer underflows are expected and
> the QEMU users can hear the problem.
>
> > +    } else {
> > +        if (avail < (int32_t) n_bytes) {
> > +            n_bytes =3D avail;
> > +        }
> > +
> > +        spa_ringbuffer_read_data(&v->ring,
> > +                                    v->buffer, RINGBUFFER_SIZE,
> > +                                    index & RINGBUFFER_MASK, p,
> n_bytes);
> > +
> > +        index +=3D n_bytes;
> > +        spa_ringbuffer_read_update(&v->ring, index);
> > +
> > +    }
> > +    buf->datas[0].chunk->offset =3D 0;
> > +    buf->datas[0].chunk->stride =3D v->sample_size;
> > +    buf->datas[0].chunk->size =3D n_bytes;
> > +
> > +    /* queue the buffer for playback */
> > +    pw_stream_queue_buffer(v->stream, b);
> > +}
> > +
> > +/* output data processing function to generate stuffs in the buffer */
> > +static void
> > +capture_on_process(void *data)
> > +{
> > +    PWVoice *v =3D (PWVoice *) data;
> > +    void *p;
> > +    struct pw_buffer *b;
> > +    struct spa_buffer *buf;
> > +    int32_t filled;
> > +    uint32_t index, offs, n_bytes;
> > +
> > +    assert(v->stream);
> > +
> > +    /* obtain a buffer */
> > +    b =3D pw_stream_dequeue_buffer(v->stream);
> > +    if (b =3D=3D NULL) {
> > +        error_report("out of buffers: %s", strerror(errno));
> > +        return;
> > +    }
> > +
> > +    /* Write data into buffer */
> > +    buf =3D b->buffer;
> > +    p =3D buf->datas[0].data;
> > +    if (p =3D=3D NULL) {
> > +        return;
> > +    }
> > +    offs =3D SPA_MIN(buf->datas[0].chunk->offset, buf->datas[0].maxsiz=
e);
> > +    n_bytes =3D SPA_MIN(buf->datas[0].chunk->size, buf->datas[0].maxsi=
ze
> - offs);
> > +
> > +    filled =3D spa_ringbuffer_get_write_index(&v->ring, &index);
> > +
> > +
> > +    if (filled < 0) {
> > +        error_report("%p: underrun write:%u filled:%d", p, index,
> filled);
> > +    } else {
> > +        if ((uint32_t) filled + n_bytes > RINGBUFFER_SIZE) {
> > +            error_report("%p: overrun write:%u filled:%d + size:%u >
> max:%u",
> > +            p, index, filled, n_bytes, RINGBUFFER_SIZE);
> > +        }
> > +    }
> > +    spa_ringbuffer_write_data(&v->ring,
> > +                                v->buffer, RINGBUFFER_SIZE,
> > +                                index & RINGBUFFER_MASK,
> > +                                SPA_PTROFF(p, offs, void), n_bytes);
> > +    index +=3D n_bytes;
> > +    spa_ringbuffer_write_update(&v->ring, index);
> > +
> > +    /* queue the buffer for playback */
> > +    pw_stream_queue_buffer(v->stream, b);
> > +}
> > +
> > +static void
> > +on_stream_state_changed(void *data, enum pw_stream_state old,
> > +                        enum pw_stream_state state, const char *error)
> > +{
> > +    PWVoice *v =3D (PWVoice *) data;
> > +
> > +    trace_pw_state_changed(pw_stream_get_node_id(v->stream),
> > +                           pw_stream_state_as_string(state));
> > +
> > +    switch (state) {
> > +    case PW_STREAM_STATE_ERROR:
> > +    case PW_STREAM_STATE_UNCONNECTED:
> > +        break;
> > +    case PW_STREAM_STATE_PAUSED:
> > +    case PW_STREAM_STATE_CONNECTING:
> > +    case PW_STREAM_STATE_STREAMING:
> > +        break;
> > +    }
> > +}
> > +
> > +static const struct pw_stream_events capture_stream_events =3D {
> > +    PW_VERSION_STREAM_EVENTS,
> > +    .destroy =3D stream_destroy,
> > +    .state_changed =3D on_stream_state_changed,
> > +    .process =3D capture_on_process
> > +};
> > +
> > +static const struct pw_stream_events playback_stream_events =3D {
> > +    PW_VERSION_STREAM_EVENTS,
> > +    .destroy =3D stream_destroy,
> > +    .state_changed =3D on_stream_state_changed,
> > +    .process =3D playback_on_process
> > +};
> > +
> > +static size_t
> > +qpw_read(HWVoiceIn *hw, void *data, size_t len)
> > +{
> > +    PWVoiceIn *pw =3D (PWVoiceIn *) hw;
> > +    PWVoice *v =3D &pw->v;
> > +    pwaudio *c =3D v->g;
> > +    const char *error =3D NULL;
> > +    size_t l;
> > +    int32_t avail;
> > +    uint32_t index;
> > +
> > +    pw_thread_loop_lock(c->thread_loop);
> > +    if (pw_stream_get_state(v->stream, &error) !=3D
> PW_STREAM_STATE_STREAMING) {
> > +        /* wait for stream to become ready */
> > +        l =3D 0;
> > +        goto done_unlock;
> > +    }
> > +    /* get no of available bytes to read data from buffer */
> > +    avail =3D spa_ringbuffer_get_read_index(&v->ring, &index);
> > +
> > +    trace_pw_read(avail, index, len);
> > +
> > +    if (avail < (int32_t) len) {
> > +        len =3D avail;
> > +    }
> > +
> > +    spa_ringbuffer_read_data(&v->ring,
> > +                             v->buffer, RINGBUFFER_SIZE,
> > +                             index & RINGBUFFER_MASK, data, len);
> > +    index +=3D len;
> > +    spa_ringbuffer_read_update(&v->ring, index);
> > +    l =3D len;
> > +
> > +done_unlock:
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +    return l;
> > +}
> > +
> > +static size_t qpw_buffer_get_free(HWVoiceOut *hw)
> > +{
> > +    PWVoiceOut *pw =3D (PWVoiceOut *)hw;
> > +    PWVoice *v =3D &pw->v;
> > +    pwaudio *c =3D v->g;
> > +    const char *error =3D NULL;
> > +    int32_t filled, avail;
> > +    uint32_t index;
> > +
> > +    pw_thread_loop_lock(c->thread_loop);
> > +    if (pw_stream_get_state(v->stream, &error) !=3D
> PW_STREAM_STATE_STREAMING) {
> > +        /* wait for stream to become ready */
> > +        avail =3D 0;
> > +        goto done_unlock;
> > +    }
> > +
> > +    filled =3D spa_ringbuffer_get_write_index(&v->ring, &index);
> > +    avail =3D v->highwater_mark - filled;
> > +
> > +done_unlock:
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +    return avail;
> > +}
> > +
> > +static size_t
> > +qpw_write(HWVoiceOut *hw, void *data, size_t len)
> > +{
> > +    PWVoiceOut *pw =3D (PWVoiceOut *) hw;
> > +    PWVoice *v =3D &pw->v;
> > +    pwaudio *c =3D v->g;
> > +    const char *error =3D NULL;
> > +    int32_t filled, avail;
> > +    uint32_t index;
> > +
> > +    pw_thread_loop_lock(c->thread_loop);
> > +    if (pw_stream_get_state(v->stream, &error) !=3D
> PW_STREAM_STATE_STREAMING) {
> > +        /* wait for stream to become ready */
> > +        len =3D 0;
> > +        goto done_unlock;
> > +    }
> > +    filled =3D spa_ringbuffer_get_write_index(&v->ring, &index);
> > +    avail =3D v->highwater_mark - filled;
> > +
> > +    trace_pw_write(filled, avail, index, len);
> > +
> > +    if (len > avail) {
> > +        len =3D avail;
> > +    }
> > +
> > +    if (filled < 0) {
> > +        audio_pcm_info_clear_buf(&hw->info, data, len /
> hw->info.bytes_per_frame);
>
> -        audio_pcm_info_clear_buf(&hw->info, data, len /
> hw->info.bytes_per_frame);
>
> There is no way to reach this code.
>
> > +        error_report("%p: underrun write:%u filled:%d", pw, index,
> filled);
> > +    } else {
> > +        if ((uint32_t) filled + len > RINGBUFFER_SIZE) {
> > +            error_report("%p: overrun write:%u filled:%d + size:%zu >
> max:%u",
> > +            pw, index, filled, len, RINGBUFFER_SIZE);
> > +        }
> > +    }
> > +
> > +    spa_ringbuffer_write_data(&v->ring,
> > +                                v->buffer, RINGBUFFER_SIZE,
> > +                                index & RINGBUFFER_MASK, data, len);
> > +    index +=3D len;
> > +    spa_ringbuffer_write_update(&v->ring, index);
> > +
> > +done_unlock:
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +    return len;
> > +}
> > +
> > +static int
> > +audfmt_to_pw(AudioFormat fmt, int endianness)
> > +{
> > +    int format;
> > +
> > +    switch (fmt) {
> > +    case AUDIO_FORMAT_S8:
> > +        format =3D SPA_AUDIO_FORMAT_S8;
> > +        break;
> > +    case AUDIO_FORMAT_U8:
> > +        format =3D SPA_AUDIO_FORMAT_U8;
> > +        break;
> > +    case AUDIO_FORMAT_S16:
> > +        format =3D endianness ? SPA_AUDIO_FORMAT_S16_BE :
> SPA_AUDIO_FORMAT_S16_LE;
> > +        break;
> > +    case AUDIO_FORMAT_U16:
> > +        format =3D endianness ? SPA_AUDIO_FORMAT_U16_BE :
> SPA_AUDIO_FORMAT_U16_LE;
> > +        break;
> > +    case AUDIO_FORMAT_S32:
> > +        format =3D endianness ? SPA_AUDIO_FORMAT_S32_BE :
> SPA_AUDIO_FORMAT_S32_LE;
> > +        break;
> > +    case AUDIO_FORMAT_U32:
> > +        format =3D endianness ? SPA_AUDIO_FORMAT_U32_BE :
> SPA_AUDIO_FORMAT_U32_LE;
> > +        break;
> > +    case AUDIO_FORMAT_F32:
> > +        format =3D endianness ? SPA_AUDIO_FORMAT_F32_BE :
> SPA_AUDIO_FORMAT_F32_LE;
> > +        break;
> > +    default:
> > +        dolog("Internal logic error: Bad audio format %d\n", fmt);
> > +        format =3D SPA_AUDIO_FORMAT_U8;
> > +        break;
> > +    }
> > +    return format;
> > +}
> > +
> > +static AudioFormat
> > +pw_to_audfmt(enum spa_audio_format fmt, int *endianness,
> > +             uint32_t *sample_size)
> > +{
> > +    switch (fmt) {
> > +    case SPA_AUDIO_FORMAT_S8:
> > +        *sample_size =3D 1;
> > +        return AUDIO_FORMAT_S8;
> > +    case SPA_AUDIO_FORMAT_U8:
> > +        *sample_size =3D 1;
> > +        return AUDIO_FORMAT_U8;
> > +    case SPA_AUDIO_FORMAT_S16_BE:
> > +        *sample_size =3D 2;
> > +        *endianness =3D 1;
> > +        return AUDIO_FORMAT_S16;
> > +    case SPA_AUDIO_FORMAT_S16_LE:
> > +        *sample_size =3D 2;
> > +        *endianness =3D 0;
> > +        return AUDIO_FORMAT_S16;
> > +    case SPA_AUDIO_FORMAT_U16_BE:
> > +        *sample_size =3D 2;
> > +        *endianness =3D 1;
> > +        return AUDIO_FORMAT_U16;
> > +    case SPA_AUDIO_FORMAT_U16_LE:
> > +        *sample_size =3D 2;
> > +        *endianness =3D 0;
> > +        return AUDIO_FORMAT_U16;
> > +    case SPA_AUDIO_FORMAT_S32_BE:
> > +        *sample_size =3D 4;
> > +        *endianness =3D 1;
> > +        return AUDIO_FORMAT_S32;
> > +    case SPA_AUDIO_FORMAT_S32_LE:
> > +        *sample_size =3D 4;
> > +        *endianness =3D 0;
> > +        return AUDIO_FORMAT_S32;
> > +    case SPA_AUDIO_FORMAT_U32_BE:
> > +        *sample_size =3D 4;
> > +        *endianness =3D 1;
> > +        return AUDIO_FORMAT_U32;
> > +    case SPA_AUDIO_FORMAT_U32_LE:
> > +        *sample_size =3D 4;
> > +        *endianness =3D 0;
> > +        return AUDIO_FORMAT_U32;
> > +    case SPA_AUDIO_FORMAT_F32_BE:
> > +        *sample_size =3D 4;
> > +        *endianness =3D 1;
> > +        return AUDIO_FORMAT_F32;
> > +    case SPA_AUDIO_FORMAT_F32_LE:
> > +        *sample_size =3D 4;
> > +        *endianness =3D 0;
> > +        return AUDIO_FORMAT_F32;
> > +    default:
> > +        *sample_size =3D 1;
> > +        dolog("Internal logic error: Bad spa_audio_format %d\n", fmt);
> > +        return AUDIO_FORMAT_U8;
> > +    }
> > +}
> > +
> > +static int
> > +create_stream(pwaudio *c, PWVoice *v, const char *stream_name,
> > +              const char *name, enum spa_direction dir)
> > +{
> > +    int res;
> > +    uint32_t n_params;
> > +    const struct spa_pod *params[2];
> > +    uint8_t buffer[1024];
> > +    struct spa_pod_builder b;
> > +    uint64_t buf_samples;
> > +    struct pw_properties *props;
> > +
> > +    props =3D pw_properties_new(NULL, NULL);
> > +
> > +    /* 75% of the timer period for faster updates */
> > +    buf_samples =3D (uint64_t)v->g->dev->timer_period * v->info.rate
> > +                    * 3 / 4 / 1000000;
> > +    trace_pw_timer(v->g->dev->timer_period);
> > +    pw_properties_setf(props, PW_KEY_NODE_LATENCY, "%" PRIu64 "/%u",
> > +                       buf_samples, v->info.rate);
> > +
> > +    if (name) {
> > +        pw_properties_set(props, PW_KEY_TARGET_OBJECT, name);
> > +    }
> > +    v->stream =3D pw_stream_new(c->core, stream_name, props);
> > +
> > +    if (v->stream =3D=3D NULL) {
> > +        return -1;
> > +    }
> > +
> > +    if (dir =3D=3D SPA_DIRECTION_INPUT) {
> > +        pw_stream_add_listener(v->stream,
> > +                            &v->stream_listener,
> &capture_stream_events, v);
> > +    } else {
> > +        pw_stream_add_listener(v->stream,
> > +                            &v->stream_listener,
> &playback_stream_events, v);
> > +    }
> > +
> > +    n_params =3D 0;
> > +    spa_pod_builder_init(&b, buffer, sizeof(buffer));
> > +    params[n_params++] =3D spa_format_audio_raw_build(&b,
> > +                            SPA_PARAM_EnumFormat,
> > +                            &v->info);
> > +
> > +    /* connect the stream to a sink or source */
> > +    res =3D pw_stream_connect(v->stream,
> > +                            dir =3D=3D
> > +                            SPA_DIRECTION_INPUT ? PW_DIRECTION_INPUT :
> > +                            PW_DIRECTION_OUTPUT, PW_ID_ANY,
> > +                            PW_STREAM_FLAG_AUTOCONNECT |
> > +                            PW_STREAM_FLAG_INACTIVE |
> > +                            PW_STREAM_FLAG_MAP_BUFFERS |
> > +                            PW_STREAM_FLAG_RT_PROCESS, params,
> n_params);
> > +    if (res < 0) {
> > +        pw_stream_destroy(v->stream);
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int
> > +qpw_stream_new(pwaudio *c, PWVoice *v, const char *stream_name,
> > +               const char *name, enum spa_direction dir)
> > +{
> > +    int r;
> > +
> > +    switch (v->info.channels) {
> > +    case 8:
> > +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> > +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> > +        v->info.position[2] =3D SPA_AUDIO_CHANNEL_FC;
> > +        v->info.position[3] =3D SPA_AUDIO_CHANNEL_LFE;
> > +        v->info.position[4] =3D SPA_AUDIO_CHANNEL_RL;
> > +        v->info.position[5] =3D SPA_AUDIO_CHANNEL_RR;
> > +        v->info.position[6] =3D SPA_AUDIO_CHANNEL_SL;
> > +        v->info.position[7] =3D SPA_AUDIO_CHANNEL_SR;
> > +        break;
> > +    case 6:
> > +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> > +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> > +        v->info.position[2] =3D SPA_AUDIO_CHANNEL_FC;
> > +        v->info.position[3] =3D SPA_AUDIO_CHANNEL_LFE;
> > +        v->info.position[4] =3D SPA_AUDIO_CHANNEL_RL;
> > +        v->info.position[5] =3D SPA_AUDIO_CHANNEL_RR;
> > +        break;
> > +    case 5:
> > +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> > +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> > +        v->info.position[2] =3D SPA_AUDIO_CHANNEL_FC;
> > +        v->info.position[3] =3D SPA_AUDIO_CHANNEL_LFE;
> > +        v->info.position[4] =3D SPA_AUDIO_CHANNEL_RC;
> > +        break;
> > +    case 4:
> > +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> > +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> > +        v->info.position[2] =3D SPA_AUDIO_CHANNEL_FC;
> > +        v->info.position[3] =3D SPA_AUDIO_CHANNEL_RC;
> > +        break;
> > +    case 3:
> > +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> > +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> > +        v->info.position[2] =3D SPA_AUDIO_CHANNEL_LFE;
> > +        break;
> > +    case 2:
> > +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> > +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> > +        break;
> > +    case 1:
> > +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_MONO;
> > +        break;
> > +    default:
> > +        for (size_t i =3D 0; i < v->info.channels; i++) {
> > +            v->info.position[i] =3D SPA_AUDIO_CHANNEL_UNKNOWN;
> > +        }
> > +        break;
> > +    }
> > +
> > +    /* create a new unconnected pwstream */
> > +    r =3D create_stream(c, v, stream_name, name, dir);
> > +    if (r < 0) {
> > +        AUD_log(AUDIO_CAP, "Failed to create stream.");
> > +        return -1;
> > +    }
> > +
> > +    return r;
> > +}
> > +
> > +static int
> > +qpw_init_out(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque)
> > +{
> > +    PWVoiceOut *pw =3D (PWVoiceOut *) hw;
> > +    PWVoice *v =3D &pw->v;
> > +    struct audsettings obt_as =3D *as;
> > +    pwaudio *c =3D v->g =3D drv_opaque;
> > +    AudiodevPipewireOptions *popts =3D &c->dev->u.pipewire;
> > +    AudiodevPipewirePerDirectionOptions *ppdo =3D popts->out;
> > +    int r;
> > +
> > +    pw_thread_loop_lock(c->thread_loop);
> > +
> > +    v->info.format =3D audfmt_to_pw(as->fmt, as->endianness);
> > +    v->info.channels =3D as->nchannels;
> > +    v->info.rate =3D as->freq;
> > +
> > +    obt_as.fmt =3D
> > +        pw_to_audfmt(v->info.format, &obt_as.endianness,
> &v->sample_size);
>
> The third argument of pw_to_audfmt() returns the sample size.
>
> > +    v->sample_size *=3D as->nchannels;
>
> Here you calculate the frame size from the sample size. The correct name
> is v->frame_size. I'm aware the rest of QEMU quite often uses samples as
> a synonym for frames. But new code should get the variable names right.
>
> > +
> > +    v->req =3D (uint64_t)c->dev->timer_period * v->info.rate
> > +        * 1 / 2 / 1000000 * v->sample_size;
> > +
> > +    /* call the function that creates a new stream for playback */
> > +    r =3D qpw_stream_new(c, v, ppdo->stream_name ? : c->dev->id,
> > +                       ppdo->name, SPA_DIRECTION_OUTPUT);
> > +    if (r < 0) {
> > +        error_report("qpw_stream_new for playback failed");
> > +        pw_thread_loop_unlock(c->thread_loop);
> > +        return -1;
> > +    }
> > +
> > +    /* report the audio format we support */
> > +    audio_pcm_init_info(&hw->info, &obt_as);
> > +
> > +    /* report the buffer size to qemu */
> > +    hw->samples =3D audio_buffer_frames(
> > +        qapi_AudiodevPipewirePerDirectionOptions_base(ppdo), &obt_as,
> 46440);
> > +    v->highwater_mark =3D MIN(RINGBUFFER_SIZE,
> > +                            (ppdo->has_latency ? ppdo->latency : 46440=
)
> > +                            * (uint64_t)v->info.rate / 1000000 *
> v->sample_size);
> > +
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +    return 0;
> > +}
> > +
> > +static int
> > +qpw_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
> > +{
> > +    PWVoiceIn *pw =3D (PWVoiceIn *) hw;
> > +    PWVoice *v =3D &pw->v;
> > +    struct audsettings obt_as =3D *as;
> > +    pwaudio *c =3D v->g =3D drv_opaque;
> > +    AudiodevPipewireOptions *popts =3D &c->dev->u.pipewire;
> > +    AudiodevPipewirePerDirectionOptions *ppdo =3D popts->in;
> > +    int r;
> > +
> > +    pw_thread_loop_lock(c->thread_loop);
> > +
> > +    v->info.format =3D audfmt_to_pw(as->fmt, as->endianness);
> > +    v->info.channels =3D as->nchannels;
> > +    v->info.rate =3D as->freq;
> > +
> > +    obt_as.fmt =3D
> > +        pw_to_audfmt(v->info.format, &obt_as.endianness,
> &v->sample_size);
> > +    v->sample_size *=3D as->nchannels;
> > +
> > +    /* call the function that creates a new stream for recording */
> > +    r =3D qpw_stream_new(c, v, ppdo->stream_name ? : c->dev->id,
> > +                       ppdo->name, SPA_DIRECTION_INPUT);
> > +    if (r < 0) {
> > +        error_report("qpw_stream_new for recording failed");
> > +        pw_thread_loop_unlock(c->thread_loop);
> > +        return -1;
> > +    }
> > +
> > +    /* report the audio format we support */
> > +    audio_pcm_init_info(&hw->info, &obt_as);
> > +
> > +    /* report the buffer size to qemu */
> > +    hw->samples =3D audio_buffer_frames(
> > +        qapi_AudiodevPipewirePerDirectionOptions_base(ppdo), &obt_as,
> 46440);
> > +
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +    return 0;
> > +}
> > +
> > +static void
> > +qpw_fini_out(HWVoiceOut *hw)
> > +{
> > +    PWVoiceOut *pw =3D (PWVoiceOut *) hw;
> > +    PWVoice *v =3D &pw->v;
> > +
> > +    if (v->stream) {
> > +        pwaudio *c =3D v->g;
> > +        pw_thread_loop_lock(c->thread_loop);
> > +        pw_stream_destroy(v->stream);
> > +        v->stream =3D NULL;
> > +        pw_thread_loop_unlock(c->thread_loop);
> > +    }
> > +}
> > +
> > +static void
> > +qpw_fini_in(HWVoiceIn *hw)
> > +{
> > +    PWVoiceIn *pw =3D (PWVoiceIn *) hw;
> > +    PWVoice *v =3D &pw->v;
> > +
> > +    if (v->stream) {
> > +        pwaudio *c =3D v->g;
> > +        pw_thread_loop_lock(c->thread_loop);
> > +        pw_stream_destroy(v->stream);
> > +        v->stream =3D NULL;
> > +        pw_thread_loop_unlock(c->thread_loop);
> > +    }
> > +}
> > +
> > +static void
> > +qpw_enable_out(HWVoiceOut *hw, bool enable)
> > +{
> > +    PWVoiceOut *po =3D (PWVoiceOut *) hw;
> > +    PWVoice *v =3D &po->v;
> > +    pwaudio *c =3D v->g;
> > +    pw_thread_loop_lock(c->thread_loop);
> > +    pw_stream_set_active(v->stream, enable);
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +}
> > +
> > +static void
> > +qpw_enable_in(HWVoiceIn *hw, bool enable)
> > +{
> > +    PWVoiceIn *pi =3D (PWVoiceIn *) hw;
> > +    PWVoice *v =3D &pi->v;
> > +    pwaudio *c =3D v->g;
> > +    pw_thread_loop_lock(c->thread_loop);
> > +    pw_stream_set_active(v->stream, enable);
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +}
> > +
> > +static void
> > +qpw_volume_out(HWVoiceOut *hw, Volume *vol)
> > +{
> > +    PWVoiceOut *pw =3D (PWVoiceOut *) hw;
> > +    PWVoice *v =3D &pw->v;
> > +    pwaudio *c =3D v->g;
> > +    int i, ret;
> > +
> > +    pw_thread_loop_lock(c->thread_loop);
> > +    v->volume.channels =3D vol->channels;
> > +
> > +    for (i =3D 0; i < vol->channels; ++i) {
> > +        v->volume.values[i] =3D (float)vol->vol[i] / 255;
> > +    }
> > +
> > +    ret =3D pw_stream_set_control(v->stream,
> > +        SPA_PROP_channelVolumes, v->volume.channels, v->volume.values,
> 0);
> > +    trace_pw_vol(ret =3D=3D 0 ? "success" : "failed");
> > +
> > +    v->muted =3D vol->mute;
> > +    float val =3D v->muted ? 1.f : 0.f;
> > +    ret =3D pw_stream_set_control(v->stream, SPA_PROP_mute, 1, &val, 0=
);
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +}
> > +
> > +static void
> > +qpw_volume_in(HWVoiceIn *hw, Volume *vol)
> > +{
> > +    PWVoiceIn *pw =3D (PWVoiceIn *) hw;
> > +    PWVoice *v =3D &pw->v;
> > +    pwaudio *c =3D v->g;
> > +    int i, ret;
> > +
> > +    pw_thread_loop_lock(c->thread_loop);
> > +    v->volume.channels =3D vol->channels;
> > +
> > +    for (i =3D 0; i < vol->channels; ++i) {
> > +        v->volume.values[i] =3D (float)vol->vol[i] / 255;
> > +    }
> > +
> > +    ret =3D pw_stream_set_control(v->stream,
> > +        SPA_PROP_channelVolumes, v->volume.channels, v->volume.values,
> 0);
> > +    trace_pw_vol(ret =3D=3D 0 ? "success" : "failed");
> > +
> > +    v->muted =3D vol->mute;
> > +    float val =3D v->muted ? 1.f : 0.f;
> > +    ret =3D pw_stream_set_control(v->stream, SPA_PROP_mute, 1, &val, 0=
);
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +}
> > +
> > +static int wait_resync(pwaudio *pw)
> > +{
> > +    int res;
> > +    pw->pending_seq =3D pw_core_sync(pw->core, PW_ID_CORE,
> pw->pending_seq);
> > +
> > +    while (true) {
> > +        pw_thread_loop_wait(pw->thread_loop);
> > +
> > +        res =3D pw->error;
> > +        if (res < 0) {
> > +            pw->error =3D 0;
> > +            return res;
> > +        }
> > +        if (pw->pending_seq =3D=3D pw->last_seq) {
> > +            break;
> > +        }
> > +    }
> > +    return 0;
> > +}
> > +static void
> > +on_core_error(void *data, uint32_t id, int seq, int res, const char
> *message)
> > +{
> > +    pwaudio *pw =3D data;
> > +
> > +    error_report("error id:%u seq:%d res:%d (%s): %s",
> > +                id, seq, res, spa_strerror(res), message);
> > +
> > +    /* stop and exit the thread loop */
> > +    pw_thread_loop_signal(pw->thread_loop, FALSE);
> > +}
> > +
> > +static void
> > +on_core_done(void *data, uint32_t id, int seq)
> > +{
> > +    pwaudio *pw =3D data;
> > +    assert(id =3D=3D PW_ID_CORE);
> > +    pw->last_seq =3D seq;
> > +    if (pw->pending_seq =3D=3D seq) {
> > +        /* stop and exit the thread loop */
> > +        pw_thread_loop_signal(pw->thread_loop, FALSE);
> > +    }
> > +}
> > +
> > +static const struct pw_core_events core_events =3D {
> > +    PW_VERSION_CORE_EVENTS,
> > +    .done =3D on_core_done,
> > +    .error =3D on_core_error,
> > +};
> > +
> > +static void *
> > +qpw_audio_init(Audiodev *dev)
> > +{
> > +    g_autofree pwaudio *pw =3D g_new0(pwaudio, 1);
> > +    pw_init(NULL, NULL);
> > +
> > +    trace_pw_audio_init();
> > +    assert(dev->driver =3D=3D AUDIODEV_DRIVER_PIPEWIRE);
> > +
> > +    pw->dev =3D dev;
> > +    pw->thread_loop =3D pw_thread_loop_new("Pipewire thread loop", NUL=
L);
> > +    if (pw->thread_loop =3D=3D NULL) {
> > +        error_report("Could not create Pipewire loop");
> > +        goto fail;
> > +    }
> > +
> > +    pw->context =3D
> > +        pw_context_new(pw_thread_loop_get_loop(pw->thread_loop), NULL,
> 0);
> > +    if (pw->context =3D=3D NULL) {
> > +        error_report("Could not create Pipewire context");
> > +        goto fail;
> > +    }
> > +
> > +    if (pw_thread_loop_start(pw->thread_loop) < 0) {
> > +        error_report("Could not start Pipewire loop");
> > +        goto fail;
> > +    }
> > +
> > +    pw_thread_loop_lock(pw->thread_loop);
> > +
> > +    pw->core =3D pw_context_connect(pw->context, NULL, 0);
> > +    if (pw->core =3D=3D NULL) {
> > +        pw_thread_loop_unlock(pw->thread_loop);
> > +        goto fail;
> > +    }
> > +
> > +    if (pw_core_add_listener(pw->core, &pw->core_listener,
> > +                             &core_events, pw) < 0) {
> > +        pw_thread_loop_unlock(pw->thread_loop);
> > +        goto fail;
> > +    }
> > +    if (wait_resync(pw) < 0) {
> > +        pw_thread_loop_unlock(pw->thread_loop);
> > +    }
> > +
> > +    pw_thread_loop_unlock(pw->thread_loop);
> > +
> > +    return g_steal_pointer(&pw);
> > +
> > +fail:
> > +    AUD_log(AUDIO_CAP, "Failed to initialize PW context");
> > +    if (pw->thread_loop) {
> > +        pw_thread_loop_stop(pw->thread_loop);
> > +    }
> > +    if (pw->context) {
> > +        g_clear_pointer(&pw->context, pw_context_destroy);
> > +    }
> > +    if (pw->thread_loop) {
> > +        g_clear_pointer(&pw->thread_loop, pw_thread_loop_destroy);
> > +    }
> > +    return NULL;
> > +}
> > +
> > +static void
> > +qpw_audio_fini(void *opaque)
> > +{
> > +    pwaudio *pw =3D opaque;
> > +
> > +    if (pw->thread_loop) {
> > +        pw_thread_loop_stop(pw->thread_loop);
> > +    }
> > +
> > +    if (pw->core) {
> > +        spa_hook_remove(&pw->core_listener);
> > +        spa_zero(pw->core_listener);
> > +        pw_core_disconnect(pw->core);
> > +    }
> > +
> > +    if (pw->context) {
> > +        pw_context_destroy(pw->context);
> > +    }
> > +    pw_thread_loop_destroy(pw->thread_loop);
> > +
> > +    g_free(pw);
> > +}
> > +
> > +static struct audio_pcm_ops qpw_pcm_ops =3D {
> > +    .init_out =3D qpw_init_out,
> > +    .fini_out =3D qpw_fini_out,
> > +    .write =3D qpw_write,
> > +    .buffer_get_free =3D qpw_buffer_get_free,
> > +    .run_buffer_out =3D audio_generic_run_buffer_out,
> > +    .enable_out =3D qpw_enable_out,
> > +    .volume_out =3D qpw_volume_out,
> > +    .volume_in =3D qpw_volume_in,
> > +
> > +    .init_in =3D qpw_init_in,
> > +    .fini_in =3D qpw_fini_in,
> > +    .read =3D qpw_read,
> > +    .run_buffer_in =3D audio_generic_run_buffer_in,
> > +    .enable_in =3D qpw_enable_in
> > +};
> > +
> > +static struct audio_driver pw_audio_driver =3D {
> > +    .name =3D "pipewire",
> > +    .descr =3D "http://www.pipewire.org/",
> > +    .init =3D qpw_audio_init,
> > +    .fini =3D qpw_audio_fini,
> > +    .pcm_ops =3D &qpw_pcm_ops,
> > +    .can_be_default =3D 1,
> > +    .max_voices_out =3D INT_MAX,
> > +    .max_voices_in =3D INT_MAX,
> > +    .voice_size_out =3D sizeof(PWVoiceOut),
> > +    .voice_size_in =3D sizeof(PWVoiceIn),
> > +};
> > +
> > +static void
> > +register_audio_pw(void)
> > +{
> > +    audio_driver_register(&pw_audio_driver);
> > +}
> > +
> > +type_init(register_audio_pw);
> > diff --git a/audio/trace-events b/audio/trace-events
> > index e1ab643add..c764e5641b 100644
> > --- a/audio/trace-events
> > +++ b/audio/trace-events
> > @@ -18,6 +18,14 @@ dbus_audio_register(const char *s, const char *dir)
> "sender =3D %s, dir =3D %s"
> >   dbus_audio_put_buffer_out(size_t len) "len =3D %zu"
> >   dbus_audio_read(size_t len) "len =3D %zu"
> >
> > +# pwaudio.c
> > +pw_state_changed(int nodeid, const char *s) "node id: %d stream state:
> %s"
> > +pw_read(int32_t avail, uint32_t index, size_t len) "avail=3D%d index=
=3D%u
> len=3D%zu"
> > +pw_write(int32_t filled, int32_t avail, uint32_t index, size_t len)
> "filled=3D%d avail=3D%d index=3D%u len=3D%zu"
> > +pw_vol(const char *ret) "set volume: %s"
> > +pw_timer(uint64_t buf_samples) "timer period =3D %" PRIu64
>
> Sorry, I was not very clear last time. I wrote 'quantum' but I meant the
> PipeWire scheduling period.
>
> -pw_timer(uint64_t buf_samples) "timer period =3D %" PRIu64
> +pw_period(uint64_t quant, uint32_t rate) "period=3D%" PRIu64 "/%u"
>
> This is the same you see with pw-top.
>
> S   ID  QUANT   RATE    WAIT    BUSY   W/Q   B/Q  ERR FORMAT NAME
> S   28      0      0    ---     ---   ---   --- 0
> Dummy-Driver
> S   29      0      0    ---     ---   ---   --- 0
> Freewheel-Driver
> S   37      0      0    ---     ---   ---   --- 0
> Midi-Bridge
> S   46      0      0    ---     ---   ---   --- 0
> alsa_output.pci-0000_00_03.0.hdmi-stereo
> R   47    256  48000 102,2us  22,1us  0,02  0,00    1    S32LE 2 48000
> alsa_output.pci-0000_00_1b.0.analog-stereo
> R   63    240  32000  65,4us   4,9us  0,01  0,00    1       U8 1 32000
> + qemu-system-x86_64
> R   67    330  44100  32,8us  33,4us  0,01  0,01    1    S16LE 2 44100
> + qemu-system-x86_64
> S   48      0      0    ---     ---   ---   --- 0
> alsa_input.pci-0000_00_1b.0.analog-stereo
> S   68      0      0    ---     ---   ---   --- 0
> qemu-system-x86_64
>
> With best regards,
> Volker
>
> > +pw_audio_init(void) "Initialize Pipewire context"
> > +
> >   # audio.c
> >   audio_timer_start(int interval) "interval %d ms"
> >   audio_timer_stop(void) ""
> > diff --git a/meson.build b/meson.build
> > index 29f8644d6d..31bf280c0d 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -730,6 +730,12 @@ if not get_option('jack').auto() or have_system
> >     jack =3D dependency('jack', required: get_option('jack'),
> >                       method: 'pkg-config', kwargs: static_kwargs)
> >   endif
> > +pipewire =3D not_found
> > +if not get_option('pipewire').auto() or (targetos =3D=3D 'linux' and
> have_system)
> > +  pipewire =3D dependency('libpipewire-0.3', version: '>=3D0.3.60',
> > +                    required: get_option('pipewire'),
> > +                    method: 'pkg-config', kwargs: static_kwargs)
> > +endif
> >   sndio =3D not_found
> >   if not get_option('sndio').auto() or have_system
> >     sndio =3D dependency('sndio', required: get_option('sndio'),
> > @@ -1667,6 +1673,7 @@ if have_system
> >       'jack': jack.found(),
> >       'oss': oss.found(),
> >       'pa': pulse.found(),
> > +    'pipewire': pipewire.found(),
> >       'sdl': sdl.found(),
> >       'sndio': sndio.found(),
> >     }
> > @@ -3980,6 +3987,7 @@ if targetos =3D=3D 'linux'
> >     summary_info +=3D {'ALSA support':    alsa}
> >     summary_info +=3D {'PulseAudio support': pulse}
> >   endif
> > +summary_info +=3D {'Pipewire support':   pipewire}
> >   summary_info +=3D {'JACK support':      jack}
> >   summary_info +=3D {'brlapi support':    brlapi}
> >   summary_info +=3D {'vde support':       vde}
> > diff --git a/meson_options.txt b/meson_options.txt
> > index fc9447d267..9ae1ec7f47 100644
> > --- a/meson_options.txt
> > +++ b/meson_options.txt
> > @@ -21,7 +21,7 @@ option('tls_priority', type : 'string', value :
> 'NORMAL',
> >   option('default_devices', type : 'boolean', value : true,
> >          description: 'Include a default selection of devices in
> emulators')
> >   option('audio_drv_list', type: 'array', value: ['default'],
> > -       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack',
> 'oss', 'pa', 'sdl', 'sndio'],
> > +       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack',
> 'oss', 'pa', 'pipewire', 'sdl', 'sndio'],
> >          description: 'Set audio driver list')
> >   option('block_drv_rw_whitelist', type : 'string', value : '',
> >          description: 'set block driver read-write whitelist (by defaul=
t
> affects only QEMU, not tools like qemu-img)')
> > @@ -255,6 +255,8 @@ option('oss', type: 'feature', value: 'auto',
> >          description: 'OSS sound support')
> >   option('pa', type: 'feature', value: 'auto',
> >          description: 'PulseAudio sound support')
> > +option('pipewire', type: 'feature', value: 'auto',
> > +       description: 'Pipewire sound support')
> >   option('sndio', type: 'feature', value: 'auto',
> >          description: 'sndio sound support')
> >
> > diff --git a/qapi/audio.json b/qapi/audio.json
> > index 4e54c00f51..e03396a7bc 100644
> > --- a/qapi/audio.json
> > +++ b/qapi/audio.json
> > @@ -324,6 +324,47 @@
> >       '*out':    'AudiodevPaPerDirectionOptions',
> >       '*server': 'str' } }
> >
> > +##
> > +# @AudiodevPipewirePerDirectionOptions:
> > +#
> > +# Options of the Pipewire backend that are used for both playback and
> > +# recording.
> > +#
> > +# @name: name of the sink/source to use
> > +#
> > +# @stream-name: name of the Pipewire stream created by qemu.  Can be
> > +#               used to identify the stream in Pipewire when you
> > +#               create multiple Pipewire devices or run multiple qemu
> > +#               instances (default: audiodev's id)
> > +#
> > +# @latency: latency you want Pipewire to achieve in microseconds
> > +#           (default 46000)
> > +#
> > +# Since: 8.1
> > +##
> > +{ 'struct': 'AudiodevPipewirePerDirectionOptions',
> > +  'base': 'AudiodevPerDirectionOptions',
> > +  'data': {
> > +    '*name': 'str',
> > +    '*stream-name': 'str',
> > +    '*latency': 'uint32' } }
> > +
> > +##
> > +# @AudiodevPipewireOptions:
> > +#
> > +# Options of the Pipewire audio backend.
> > +#
> > +# @in: options of the capture stream
> > +#
> > +# @out: options of the playback stream
> > +#
> > +# Since: 8.1
> > +##
> > +{ 'struct': 'AudiodevPipewireOptions',
> > +  'data': {
> > +    '*in':     'AudiodevPipewirePerDirectionOptions',
> > +    '*out':    'AudiodevPipewirePerDirectionOptions' } }
> > +
> >   ##
> >   # @AudiodevSdlPerDirectionOptions:
> >   #
> > @@ -416,6 +457,7 @@
> >               { 'name': 'jack', 'if': 'CONFIG_AUDIO_JACK' },
> >               { 'name': 'oss', 'if': 'CONFIG_AUDIO_OSS' },
> >               { 'name': 'pa', 'if': 'CONFIG_AUDIO_PA' },
> > +            { 'name': 'pipewire', 'if': 'CONFIG_AUDIO_PIPEWIRE' },
> >               { 'name': 'sdl', 'if': 'CONFIG_AUDIO_SDL' },
> >               { 'name': 'sndio', 'if': 'CONFIG_AUDIO_SNDIO' },
> >               { 'name': 'spice', 'if': 'CONFIG_SPICE' },
> > @@ -456,6 +498,8 @@
> >                      'if': 'CONFIG_AUDIO_OSS' },
> >       'pa':        { 'type': 'AudiodevPaOptions',
> >                      'if': 'CONFIG_AUDIO_PA' },
> > +    'pipewire':  { 'type': 'AudiodevPipewireOptions',
> > +                   'if': 'CONFIG_AUDIO_PIPEWIRE' },
> >       'sdl':       { 'type': 'AudiodevSdlOptions',
> >                      'if': 'CONFIG_AUDIO_SDL' },
> >       'sndio':     { 'type': 'AudiodevSndioOptions',
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 59bdf67a2c..2d908717bd 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -779,6 +779,12 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
> >       "                in|out.name=3D source/sink device name\n"
> >       "                in|out.latency=3D desired latency in microsecond=
s\n"
> >   #endif
> > +#ifdef CONFIG_AUDIO_PIPEWIRE
> > +    "-audiodev pipewire,id=3Did[,prop[=3Dvalue][,...]]\n"
> > +    "                in|out.name=3D source/sink device name\n"
> > +    "                in|out.stream-name=3D name of pipewire stream\n"
> > +    "                in|out.latency=3D desired latency in microseconds=
\n"
> > +#endif
> >   #ifdef CONFIG_AUDIO_SDL
> >       "-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]\n"
> >       "                in|out.buffer-count=3D number of buffers\n"
> > @@ -942,6 +948,21 @@ SRST
> >           Desired latency in microseconds. The PulseAudio server will t=
ry
> >           to honor this value but actual latencies may be lower or
> higher.
> >
> > +``-audiodev pipewire,id=3Did[,prop[=3Dvalue][,...]]``
> > +    Creates a backend using Pipewire. This backend is available on
> > +    most systems.
> > +
> > +    Pipewire specific options are:
> > +
> > +    ``in|out.latency=3Dusecs``
> > +        Desired latency in microseconds.
> > +
> > +    ``in|out.name=3Dsink``
> > +        Use the specified source/sink for recording/playback.
> > +
> > +    ``in|out.stream-name``
> > +        Specify the name of pipewire stream.
> > +
> >   ``-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]``
> >       Creates a backend using SDL. This backend is available on most
> >       systems, but you should use your platform's native backend if
> > diff --git a/scripts/meson-buildoptions.sh
> b/scripts/meson-buildoptions.sh
> > index 009fab1515..ba1057b62c 100644
> > --- a/scripts/meson-buildoptions.sh
> > +++ b/scripts/meson-buildoptions.sh
> > @@ -1,7 +1,8 @@
> >   # This file is generated by meson-buildoptions.py, do not edit!
> >   meson_options_help() {
> > -  printf "%s\n" '  --audio-drv-list=3DCHOICES Set audio driver list
> [default] (choices: alsa/co'
> > -  printf "%s\n" '
>  reaudio/default/dsound/jack/oss/pa/sdl/sndio)'
> > +  printf "%s\n" '  --audio-drv-list=3DCHOICES Set audio driver list
> [default] (choices: al'
> > +  printf "%s\n" '
>  sa/coreaudio/default/dsound/jack/oss/pa/'
> > +  printf "%s\n" '                           pipewire/sdl/sndio)'
> >     printf "%s\n" '  --block-drv-ro-whitelist=3DVALUE'
> >     printf "%s\n" '                           set block driver read-onl=
y
> whitelist (by default'
> >     printf "%s\n" '                           affects only QEMU, not
> tools like qemu-img)'
> > @@ -136,6 +137,7 @@ meson_options_help() {
> >     printf "%s\n" '  oss             OSS sound support'
> >     printf "%s\n" '  pa              PulseAudio sound support'
> >     printf "%s\n" '  parallels       parallels image format support'
> > +  printf "%s\n" '  pipewire        Pipewire sound support'
> >     printf "%s\n" '  png             PNG support with libpng'
> >     printf "%s\n" '  pvrdma          Enable PVRDMA support'
> >     printf "%s\n" '  qcow1           qcow1 image format support'
> > @@ -370,6 +372,8 @@ _meson_option_parse() {
> >       --disable-pa) printf "%s" -Dpa=3Ddisabled ;;
> >       --enable-parallels) printf "%s" -Dparallels=3Denabled ;;
> >       --disable-parallels) printf "%s" -Dparallels=3Ddisabled ;;
> > +    --enable-pipewire) printf "%s" -Dpipewire=3Denabled ;;
> > +    --disable-pipewire) printf "%s" -Dpipewire=3Ddisabled ;;
> >       --with-pkgversion=3D*) quote_sh "-Dpkgversion=3D$2" ;;
> >       --enable-png) printf "%s" -Dpng=3Denabled ;;
> >       --disable-png) printf "%s" -Dpng=3Ddisabled ;;
>
>

--000000000000b0963105f9602d47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you for the clarification, I will look into it.=
</div><div><br></div><div>Regards,</div><div>Dorinda.<br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr =
15, 2023 at 9:39=E2=80=AFAM Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qe=
mu@t-online.de">vr_qemu@t-online.de</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hi Dorinda,<br>
<br>
&gt; This commit adds a new audiodev backend to allow QEMU to use Pipewire =
as<br>
&gt; both an audio sink and source. This backend is available on most syste=
ms<br>
&gt;<br>
&gt; Add Pipewire entry points for QEMU Pipewire audio backend<br>
&gt; Add wrappers for QEMU Pipewire audio backend in qpw_pcm_ops()<br>
&gt; qpw_write function returns the current state of the stream to pwaudio<=
br>
&gt; and Writes some data to the server for playback streams using pipewire=
<br>
&gt; spa_ringbuffer implementation.<br>
&gt; qpw_read function returns the current state of the stream to pwaudio a=
nd<br>
&gt; reads some data from the server for capture streams using pipewire<br>
&gt; spa_ringbuffer implementation. These functions qpw_write and qpw_read<=
br>
&gt; are called during playback and capture.<br>
&gt; Added some functions that convert pw audio formats to QEMU audio forma=
t<br>
&gt; and vice versa which would be needed in the pipewire audio sink and<br=
>
&gt; source functions qpw_init_in() &amp; qpw_init_out().<br>
&gt; These methods that implement playback and recording will create stream=
s<br>
&gt; for playback and capture that will start processing and will result in=
<br>
&gt; the on_process callbacks to be called.<br>
&gt; Built a connection to the Pipewire sound system server in the<br>
&gt; qpw_audio_init() method.<br>
&gt;<br>
&gt; Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dbassey@redhat.com=
" target=3D"_blank">dbassey@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; v11:<br>
&gt; handle buffer underruns in qpw_write<br>
&gt; use local variable<br>
&gt; change param name frame_size<br>
&gt; fix format specifier<br>
&gt; change trace value to trace quantum<br>
&gt;<br>
&gt;=C2=A0 =C2=A0audio/audio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 =C2=A0audio/audio_template.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 +<br>
&gt;=C2=A0 =C2=A0audio/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0audio/pwaudio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 913 ++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0audio/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A08 +<br>
&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +<br>
&gt;=C2=A0 =C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 =C2=A0qapi/audio.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 44 ++<br>
&gt;=C2=A0 =C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 21 +<br>
&gt;=C2=A0 =C2=A0scripts/meson-buildoptions.sh |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A010 files changed, 1011 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 audio/pwaudio.c<br>
&gt;<br>
&gt; diff --git a/audio/audio.c b/audio/audio.c<br>
&gt; index 70b096713c..90c7c49d11 100644<br>
&gt; --- a/audio/audio.c<br>
&gt; +++ b/audio/audio.c<br>
&gt; @@ -2061,6 +2061,9 @@ void audio_create_pdos(Audiodev *dev)<br>
&gt;=C2=A0 =C2=A0#ifdef CONFIG_AUDIO_PA<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CASE(PA, pa, Pa);<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt; +#ifdef CONFIG_AUDIO_PIPEWIRE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CASE(PIPEWIRE, pipewire, Pipewire);<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0#ifdef CONFIG_AUDIO_SDL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CASE(SDL, sdl, Sdl);<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt; diff --git a/audio/audio_template.h b/audio/audio_template.h<br>
&gt; index e42326c20d..dc0c74aa74 100644<br>
&gt; --- a/audio/audio_template.h<br>
&gt; +++ b/audio/audio_template.h<br>
&gt; @@ -362,6 +362,10 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_,=
 TYPE)(Audiodev *dev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case AUDIODEV_DRIVER_PA:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return qapi_AudiodevPaPerDirec=
tionOptions_base(dev-&gt;u.pa.TYPE);<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt; +#ifdef CONFIG_AUDIO_PIPEWIRE<br>
&gt; +=C2=A0 =C2=A0 case AUDIODEV_DRIVER_PIPEWIRE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qapi_AudiodevPipewirePerDirectionO=
ptions_base(dev-&gt;u.pipewire.TYPE);<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0#ifdef CONFIG_AUDIO_SDL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case AUDIODEV_DRIVER_SDL:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return qapi_AudiodevSdlPerDire=
ctionOptions_base(dev-&gt;u.sdl.TYPE);<br>
&gt; diff --git a/audio/meson.build b/audio/meson.build<br>
&gt; index 0722224ba9..65a49c1a10 100644<br>
&gt; --- a/audio/meson.build<br>
&gt; +++ b/audio/meson.build<br>
&gt; @@ -19,6 +19,7 @@ foreach m : [<br>
&gt;=C2=A0 =C2=A0 =C2=A0[&#39;sdl&#39;, sdl, files(&#39;sdlaudio.c&#39;)],<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0[&#39;jack&#39;, jack, files(&#39;jackaudio.c&#39;)=
],<br>
&gt;=C2=A0 =C2=A0 =C2=A0[&#39;sndio&#39;, sndio, files(&#39;sndioaudio.c&#3=
9;)],<br>
&gt; +=C2=A0 [&#39;pipewire&#39;, pipewire, files(&#39;pwaudio.c&#39;)],<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0[&#39;spice&#39;, spice, files(&#39;spiceaudio.c&#3=
9;)]<br>
&gt;=C2=A0 =C2=A0]<br>
&gt;=C2=A0 =C2=A0 =C2=A0if m[1].found()<br>
&gt; diff --git a/audio/pwaudio.c b/audio/pwaudio.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..adf1a538c0<br>
&gt; --- /dev/null<br>
&gt; +++ b/audio/pwaudio.c<br>
&gt; @@ -0,0 +1,913 @@<br>
&gt; +/*<br>
&gt; + * QEMU Pipewire audio driver<br>
&gt; + *<br>
&gt; + * Copyright (c) 2023 Red Hat Inc.<br>
&gt; + *<br>
&gt; + * Author: Dorinda Bassey=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"ma=
ilto:dbassey@redhat.com" target=3D"_blank">dbassey@redhat.com</a>&gt;<br>
&gt; + *<br>
&gt; + * SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/module.h&quot;<br>
&gt; +#include &quot;audio.h&quot;<br>
&gt; +#include &lt;errno.h&gt;<br>
&gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt; +#include &lt;spa/param/audio/format-utils.h&gt;<br>
&gt; +#include &lt;spa/utils/ringbuffer.h&gt;<br>
&gt; +#include &lt;spa/utils/result.h&gt;<br>
&gt; +#include &lt;spa/param/props.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;pipewire/pipewire.h&gt;<br>
&gt; +#include &quot;trace.h&quot;<br>
&gt; +<br>
&gt; +#define AUDIO_CAP &quot;pipewire&quot;<br>
&gt; +#define RINGBUFFER_SIZE=C2=A0 =C2=A0 (1u &lt;&lt; 22)<br>
&gt; +#define RINGBUFFER_MASK=C2=A0 =C2=A0 (RINGBUFFER_SIZE - 1)<br>
&gt; +<br>
&gt; +#include &quot;audio_int.h&quot;<br>
&gt; +<br>
&gt; +typedef struct pwvolume {<br>
&gt; +=C2=A0 =C2=A0 uint32_t channels;<br>
&gt; +=C2=A0 =C2=A0 float values[SPA_AUDIO_MAX_CHANNELS];<br>
&gt; +} pwvolume;<br>
&gt; +<br>
&gt; +typedef struct pwaudio {<br>
&gt; +=C2=A0 =C2=A0 Audiodev *dev;<br>
&gt; +=C2=A0 =C2=A0 struct pw_thread_loop *thread_loop;<br>
&gt; +=C2=A0 =C2=A0 struct pw_context *context;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 struct pw_core *core;<br>
&gt; +=C2=A0 =C2=A0 struct spa_hook core_listener;<br>
&gt; +=C2=A0 =C2=A0 int last_seq, pending_seq, error;<br>
&gt; +} pwaudio;<br>
&gt; +<br>
&gt; +typedef struct PWVoice {<br>
&gt; +=C2=A0 =C2=A0 pwaudio *g;<br>
&gt; +=C2=A0 =C2=A0 struct pw_stream *stream;<br>
&gt; +=C2=A0 =C2=A0 struct spa_hook stream_listener;<br>
&gt; +=C2=A0 =C2=A0 struct spa_audio_info_raw info;<br>
&gt; +=C2=A0 =C2=A0 uint32_t highwater_mark;<br>
&gt; +=C2=A0 =C2=A0 uint32_t sample_size, req;<br>
<br>
The older patches used the correct name frame_size instead of <br>
sample_size. Please revert this. Further below I&#39;ve written an explanat=
ion.<br>
<br>
&gt; +=C2=A0 =C2=A0 struct spa_ringbuffer ring;<br>
&gt; +=C2=A0 =C2=A0 uint8_t buffer[RINGBUFFER_SIZE];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pwvolume volume;<br>
&gt; +=C2=A0 =C2=A0 bool muted;<br>
&gt; +} PWVoice;<br>
&gt; +<br>
&gt; +typedef struct PWVoiceOut {<br>
&gt; +=C2=A0 =C2=A0 HWVoiceOut hw;<br>
&gt; +=C2=A0 =C2=A0 PWVoice v;<br>
&gt; +} PWVoiceOut;<br>
&gt; +<br>
&gt; +typedef struct PWVoiceIn {<br>
&gt; +=C2=A0 =C2=A0 HWVoiceIn hw;<br>
&gt; +=C2=A0 =C2=A0 PWVoice v;<br>
&gt; +} PWVoiceIn;<br>
&gt; +<br>
&gt; +static void<br>
&gt; +stream_destroy(void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D (PWVoice *) data;<br>
&gt; +=C2=A0 =C2=A0 spa_hook_remove(&amp;v-&gt;stream_listener);<br>
&gt; +=C2=A0 =C2=A0 v-&gt;stream =3D NULL;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* output data processing function to read stuffs from the buffer */<=
br>
&gt; +static void<br>
&gt; +playback_on_process(void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D (PWVoice *) data;<br>
&gt; +=C2=A0 =C2=A0 void *p;<br>
&gt; +=C2=A0 =C2=A0 struct pw_buffer *b;<br>
&gt; +=C2=A0 =C2=A0 struct spa_buffer *buf;<br>
&gt; +=C2=A0 =C2=A0 uint32_t req, index, n_bytes;<br>
&gt; +=C2=A0 =C2=A0 int32_t avail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 assert(v-&gt;stream);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* obtain a buffer to read from */<br>
&gt; +=C2=A0 =C2=A0 b =3D pw_stream_dequeue_buffer(v-&gt;stream);<br>
&gt; +=C2=A0 =C2=A0 if (b =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;out of buffers: %s&quo=
t;, strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 buf =3D b-&gt;buffer;<br>
&gt; +=C2=A0 =C2=A0 p =3D buf-&gt;datas[0].data;<br>
&gt; +=C2=A0 =C2=A0 if (p =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 /* calculate the total no of bytes to read data from bu=
ffer */<br>
&gt; +=C2=A0 =C2=A0 req =3D b-&gt;requested * v-&gt;sample_size;<br>
&gt; +=C2=A0 =C2=A0 if (req =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 req =3D v-&gt;req;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 n_bytes =3D SPA_MIN(req, buf-&gt;datas[0].maxsize);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* get no of available bytes to read data from buffer *=
/<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 avail =3D spa_ringbuffer_get_read_index(&amp;v-&gt;ring=
, &amp;index);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (avail &lt;=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* underrun, can&#39;t really happen but =
if it does we */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* do nothing and wait for more data */<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%p: underrun read:%u a=
vail:%d&quot;, p, index, avail);<br>
<br>
Please don&#39;t do that. The PipeWire audio threads have a higher priority=
 <br>
than the QEMU thread. On a heavily loaded system the callbacks will be <br>
called even if QEMU nearly stalled. So this is the right place to detect <b=
r>
a buffer underflow and continue to write silent audio frames.<br>
<br>
There&#39;s no need for an error report. Buffer underflows are expected and=
 <br>
the QEMU users can hear the problem.<br>
<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (avail &lt; (int32_t) n_bytes) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n_bytes =3D avail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_ringbuffer_read_data(&amp;v-&gt;ring,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;buffer, RING=
BUFFER_SIZE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index &amp; RINGBU=
FFER_MASK, p, n_bytes);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 index +=3D n_bytes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_ringbuffer_read_update(&amp;v-&gt;rin=
g, index);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 buf-&gt;datas[0].chunk-&gt;offset =3D 0;<br>
&gt; +=C2=A0 =C2=A0 buf-&gt;datas[0].chunk-&gt;stride =3D v-&gt;sample_size=
;<br>
&gt; +=C2=A0 =C2=A0 buf-&gt;datas[0].chunk-&gt;size =3D n_bytes;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* queue the buffer for playback */<br>
&gt; +=C2=A0 =C2=A0 pw_stream_queue_buffer(v-&gt;stream, b);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* output data processing function to generate stuffs in the buffer *=
/<br>
&gt; +static void<br>
&gt; +capture_on_process(void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D (PWVoice *) data;<br>
&gt; +=C2=A0 =C2=A0 void *p;<br>
&gt; +=C2=A0 =C2=A0 struct pw_buffer *b;<br>
&gt; +=C2=A0 =C2=A0 struct spa_buffer *buf;<br>
&gt; +=C2=A0 =C2=A0 int32_t filled;<br>
&gt; +=C2=A0 =C2=A0 uint32_t index, offs, n_bytes;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 assert(v-&gt;stream);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* obtain a buffer */<br>
&gt; +=C2=A0 =C2=A0 b =3D pw_stream_dequeue_buffer(v-&gt;stream);<br>
&gt; +=C2=A0 =C2=A0 if (b =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;out of buffers: %s&quo=
t;, strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Write data into buffer */<br>
&gt; +=C2=A0 =C2=A0 buf =3D b-&gt;buffer;<br>
&gt; +=C2=A0 =C2=A0 p =3D buf-&gt;datas[0].data;<br>
&gt; +=C2=A0 =C2=A0 if (p =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 offs =3D SPA_MIN(buf-&gt;datas[0].chunk-&gt;offset, buf=
-&gt;datas[0].maxsize);<br>
&gt; +=C2=A0 =C2=A0 n_bytes =3D SPA_MIN(buf-&gt;datas[0].chunk-&gt;size, bu=
f-&gt;datas[0].maxsize - offs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 filled =3D spa_ringbuffer_get_write_index(&amp;v-&gt;ri=
ng, &amp;index);<br>
&gt; +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (filled &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%p: underrun write:%u =
filled:%d&quot;, p, index, filled);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((uint32_t) filled + n_bytes &gt; RING=
BUFFER_SIZE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%p: over=
run write:%u filled:%d + size:%u &gt; max:%u&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p, index, filled, n_bytes, =
RINGBUFFER_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 spa_ringbuffer_write_data(&amp;v-&gt;ring,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;buffer, RINGBUFFER_SIZE,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index &amp; RINGBUFFER_MASK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_PTROFF(p, offs, void), n_byt=
es);<br>
&gt; +=C2=A0 =C2=A0 index +=3D n_bytes;<br>
&gt; +=C2=A0 =C2=A0 spa_ringbuffer_write_update(&amp;v-&gt;ring, index);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* queue the buffer for playback */<br>
&gt; +=C2=A0 =C2=A0 pw_stream_queue_buffer(v-&gt;stream, b);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +on_stream_state_changed(void *data, enum pw_stream_state old,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 enum pw_stream_state state, const char *error)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D (PWVoice *) data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 trace_pw_state_changed(pw_stream_get_node_id(v-&gt;stre=
am),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0pw_stream_state_as_string(state));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (state) {<br>
&gt; +=C2=A0 =C2=A0 case PW_STREAM_STATE_ERROR:<br>
&gt; +=C2=A0 =C2=A0 case PW_STREAM_STATE_UNCONNECTED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case PW_STREAM_STATE_PAUSED:<br>
&gt; +=C2=A0 =C2=A0 case PW_STREAM_STATE_CONNECTING:<br>
&gt; +=C2=A0 =C2=A0 case PW_STREAM_STATE_STREAMING:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct pw_stream_events capture_stream_events =3D {<br>
&gt; +=C2=A0 =C2=A0 PW_VERSION_STREAM_EVENTS,<br>
&gt; +=C2=A0 =C2=A0 .destroy =3D stream_destroy,<br>
&gt; +=C2=A0 =C2=A0 .state_changed =3D on_stream_state_changed,<br>
&gt; +=C2=A0 =C2=A0 .process =3D capture_on_process<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct pw_stream_events playback_stream_events =3D {<br>
&gt; +=C2=A0 =C2=A0 PW_VERSION_STREAM_EVENTS,<br>
&gt; +=C2=A0 =C2=A0 .destroy =3D stream_destroy,<br>
&gt; +=C2=A0 =C2=A0 .state_changed =3D on_stream_state_changed,<br>
&gt; +=C2=A0 =C2=A0 .process =3D playback_on_process<br>
&gt; +};<br>
&gt; +<br>
&gt; +static size_t<br>
&gt; +qpw_read(HWVoiceIn *hw, void *data, size_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoiceIn *pw =3D (PWVoiceIn *) hw;<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
&gt; +=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
&gt; +=C2=A0 =C2=A0 const char *error =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 size_t l;<br>
&gt; +=C2=A0 =C2=A0 int32_t avail;<br>
&gt; +=C2=A0 =C2=A0 uint32_t index;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 if (pw_stream_get_state(v-&gt;stream, &amp;error) !=3D =
PW_STREAM_STATE_STREAMING) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* wait for stream to become ready */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done_unlock;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 /* get no of available bytes to read data from buffer *=
/<br>
&gt; +=C2=A0 =C2=A0 avail =3D spa_ringbuffer_get_read_index(&amp;v-&gt;ring=
, &amp;index);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 trace_pw_read(avail, index, len);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (avail &lt; (int32_t) len) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D avail;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 spa_ringbuffer_read_data(&amp;v-&gt;ring,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v-&gt;buffer, RINGBUFFER_SIZE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index &amp; RINGBUFFER_MASK, data, len);=
<br>
&gt; +=C2=A0 =C2=A0 index +=3D len;<br>
&gt; +=C2=A0 =C2=A0 spa_ringbuffer_read_update(&amp;v-&gt;ring, index);<br>
&gt; +=C2=A0 =C2=A0 l =3D len;<br>
&gt; +<br>
&gt; +done_unlock:<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 return l;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static size_t qpw_buffer_get_free(HWVoiceOut *hw)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoiceOut *pw =3D (PWVoiceOut *)hw;<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
&gt; +=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
&gt; +=C2=A0 =C2=A0 const char *error =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 int32_t filled, avail;<br>
&gt; +=C2=A0 =C2=A0 uint32_t index;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 if (pw_stream_get_state(v-&gt;stream, &amp;error) !=3D =
PW_STREAM_STATE_STREAMING) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* wait for stream to become ready */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 avail =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done_unlock;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 filled =3D spa_ringbuffer_get_write_index(&amp;v-&gt;ri=
ng, &amp;index);<br>
&gt; +=C2=A0 =C2=A0 avail =3D v-&gt;highwater_mark - filled;<br>
&gt; +<br>
&gt; +done_unlock:<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 return avail;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static size_t<br>
&gt; +qpw_write(HWVoiceOut *hw, void *data, size_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoiceOut *pw =3D (PWVoiceOut *) hw;<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
&gt; +=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
&gt; +=C2=A0 =C2=A0 const char *error =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 int32_t filled, avail;<br>
&gt; +=C2=A0 =C2=A0 uint32_t index;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 if (pw_stream_get_state(v-&gt;stream, &amp;error) !=3D =
PW_STREAM_STATE_STREAMING) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* wait for stream to become ready */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done_unlock;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 filled =3D spa_ringbuffer_get_write_index(&amp;v-&gt;ri=
ng, &amp;index);<br>
&gt; +=C2=A0 =C2=A0 avail =3D v-&gt;highwater_mark - filled;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 trace_pw_write(filled, avail, index, len);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (len &gt; avail) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D avail;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (filled &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_pcm_info_clear_buf(&amp;hw-&gt;info=
, data, len / hw-&gt;info.bytes_per_frame);<br>
<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 audio_pcm_info_clear_buf(&amp;h=
w-&gt;info, data, len / <br>
hw-&gt;info.bytes_per_frame);<br>
<br>
There is no way to reach this code.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%p: underrun write:%u =
filled:%d&quot;, pw, index, filled);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((uint32_t) filled + len &gt; RINGBUFF=
ER_SIZE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%p: over=
run write:%u filled:%d + size:%zu &gt; max:%u&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw, index, filled, len, RIN=
GBUFFER_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 spa_ringbuffer_write_data(&amp;v-&gt;ring,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;buffer, RINGBUFFER_SIZE,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index &amp; RINGBUFFER_MASK, dat=
a, len);<br>
&gt; +=C2=A0 =C2=A0 index +=3D len;<br>
&gt; +=C2=A0 =C2=A0 spa_ringbuffer_write_update(&amp;v-&gt;ring, index);<br=
>
&gt; +<br>
&gt; +done_unlock:<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 return len;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +audfmt_to_pw(AudioFormat fmt, int endianness)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int format;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (fmt) {<br>
&gt; +=C2=A0 =C2=A0 case AUDIO_FORMAT_S8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D SPA_AUDIO_FORMAT_S8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case AUDIO_FORMAT_U8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D SPA_AUDIO_FORMAT_U8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case AUDIO_FORMAT_S16:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D endianness ? SPA_AUDIO_FORMAT_=
S16_BE : SPA_AUDIO_FORMAT_S16_LE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case AUDIO_FORMAT_U16:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D endianness ? SPA_AUDIO_FORMAT_=
U16_BE : SPA_AUDIO_FORMAT_U16_LE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case AUDIO_FORMAT_S32:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D endianness ? SPA_AUDIO_FORMAT_=
S32_BE : SPA_AUDIO_FORMAT_S32_LE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case AUDIO_FORMAT_U32:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D endianness ? SPA_AUDIO_FORMAT_=
U32_BE : SPA_AUDIO_FORMAT_U32_LE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case AUDIO_FORMAT_F32:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D endianness ? SPA_AUDIO_FORMAT_=
F32_BE : SPA_AUDIO_FORMAT_F32_LE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dolog(&quot;Internal logic error: Bad aud=
io format %d\n&quot;, fmt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D SPA_AUDIO_FORMAT_U8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return format;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static AudioFormat<br>
&gt; +pw_to_audfmt(enum spa_audio_format fmt, int *endianness,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t *sample_size=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 switch (fmt) {<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_S8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_S8;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_U8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U8;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_S16_BE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_S16;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_S16_LE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_S16;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_U16_BE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U16;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_U16_LE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U16;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_S32_BE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_S32;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_S32_LE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_S32;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_U32_BE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U32;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_U32_LE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U32;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_F32_BE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_F32;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_F32_LE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_F32;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sample_size =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dolog(&quot;Internal logic error: Bad spa=
_audio_format %d\n&quot;, fmt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U8;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +create_stream(pwaudio *c, PWVoice *v, const char *stream_name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *name, en=
um spa_direction dir)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int res;<br>
&gt; +=C2=A0 =C2=A0 uint32_t n_params;<br>
&gt; +=C2=A0 =C2=A0 const struct spa_pod *params[2];<br>
&gt; +=C2=A0 =C2=A0 uint8_t buffer[1024];<br>
&gt; +=C2=A0 =C2=A0 struct spa_pod_builder b;<br>
&gt; +=C2=A0 =C2=A0 uint64_t buf_samples;<br>
&gt; +=C2=A0 =C2=A0 struct pw_properties *props;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 props =3D pw_properties_new(NULL, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* 75% of the timer period for faster updates */<br>
&gt; +=C2=A0 =C2=A0 buf_samples =3D (uint64_t)v-&gt;g-&gt;dev-&gt;timer_per=
iod * v-&gt;info.rate<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 * 3 / 4 / 1000000;<br>
&gt; +=C2=A0 =C2=A0 trace_pw_timer(v-&gt;g-&gt;dev-&gt;timer_period);<br>
&gt; +=C2=A0 =C2=A0 pw_properties_setf(props, PW_KEY_NODE_LATENCY, &quot;%&=
quot; PRIu64 &quot;/%u&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0buf_samples, v-&gt;info.rate);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (name) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, PW_KEY_TARGET_OB=
JECT, name);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 v-&gt;stream =3D pw_stream_new(c-&gt;core, stream_name,=
 props);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (v-&gt;stream =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (dir =3D=3D SPA_DIRECTION_INPUT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_add_listener(v-&gt;stream,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;v-&gt;stream_listener, &amp;capture_strea=
m_events, v);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_add_listener(v-&gt;stream,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;v-&gt;stream_listener, &amp;playback_stre=
am_events, v);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 n_params =3D 0;<br>
&gt; +=C2=A0 =C2=A0 spa_pod_builder_init(&amp;b, buffer, sizeof(buffer));<b=
r>
&gt; +=C2=A0 =C2=A0 params[n_params++] =3D spa_format_audio_raw_build(&amp;=
b,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_PARAM_EnumFormat,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;v-&gt;info);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* connect the stream to a sink or source */<br>
&gt; +=C2=A0 =C2=A0 res =3D pw_stream_connect(v-&gt;stream,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir =3D=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_DIRECTION_INPUT ? PW_DIRECTION_INPUT :<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_DIRECTION_OUTPUT, PW_ID_ANY,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_AUTOCONNECT |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_INACTIVE |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_MAP_BUFFERS |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_RT_PROCESS, params, n_params);<=
br>
&gt; +=C2=A0 =C2=A0 if (res &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_destroy(v-&gt;stream);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +qpw_stream_new(pwaudio *c, PWVoice *v, const char *stream_name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *na=
me, enum spa_direction dir)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int r;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (v-&gt;info.channels) {<br>
&gt; +=C2=A0 =C2=A0 case 8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[0] =3D SPA_AUDIO_CHAN=
NEL_FL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[1] =3D SPA_AUDIO_CHAN=
NEL_FR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[2] =3D SPA_AUDIO_CHAN=
NEL_FC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[3] =3D SPA_AUDIO_CHAN=
NEL_LFE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[4] =3D SPA_AUDIO_CHAN=
NEL_RL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[5] =3D SPA_AUDIO_CHAN=
NEL_RR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[6] =3D SPA_AUDIO_CHAN=
NEL_SL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[7] =3D SPA_AUDIO_CHAN=
NEL_SR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case 6:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[0] =3D SPA_AUDIO_CHAN=
NEL_FL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[1] =3D SPA_AUDIO_CHAN=
NEL_FR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[2] =3D SPA_AUDIO_CHAN=
NEL_FC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[3] =3D SPA_AUDIO_CHAN=
NEL_LFE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[4] =3D SPA_AUDIO_CHAN=
NEL_RL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[5] =3D SPA_AUDIO_CHAN=
NEL_RR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case 5:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[0] =3D SPA_AUDIO_CHAN=
NEL_FL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[1] =3D SPA_AUDIO_CHAN=
NEL_FR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[2] =3D SPA_AUDIO_CHAN=
NEL_FC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[3] =3D SPA_AUDIO_CHAN=
NEL_LFE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[4] =3D SPA_AUDIO_CHAN=
NEL_RC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case 4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[0] =3D SPA_AUDIO_CHAN=
NEL_FL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[1] =3D SPA_AUDIO_CHAN=
NEL_FR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[2] =3D SPA_AUDIO_CHAN=
NEL_FC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[3] =3D SPA_AUDIO_CHAN=
NEL_RC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case 3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[0] =3D SPA_AUDIO_CHAN=
NEL_FL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[1] =3D SPA_AUDIO_CHAN=
NEL_FR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[2] =3D SPA_AUDIO_CHAN=
NEL_LFE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case 2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[0] =3D SPA_AUDIO_CHAN=
NEL_FL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[1] =3D SPA_AUDIO_CHAN=
NEL_FR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case 1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[0] =3D SPA_AUDIO_CHAN=
NEL_MONO;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (size_t i =3D 0; i &lt; v-&gt;info.ch=
annels; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;info.position[i] =3D =
SPA_AUDIO_CHANNEL_UNKNOWN;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* create a new unconnected pwstream */<br>
&gt; +=C2=A0 =C2=A0 r =3D create_stream(c, v, stream_name, name, dir);<br>
&gt; +=C2=A0 =C2=A0 if (r &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 AUD_log(AUDIO_CAP, &quot;Failed to create=
 stream.&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return r;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +qpw_init_out(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoiceOut *pw =3D (PWVoiceOut *) hw;<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
&gt; +=C2=A0 =C2=A0 struct audsettings obt_as =3D *as;<br>
&gt; +=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g =3D drv_opaque;<br>
&gt; +=C2=A0 =C2=A0 AudiodevPipewireOptions *popts =3D &amp;c-&gt;dev-&gt;u=
.pipewire;<br>
&gt; +=C2=A0 =C2=A0 AudiodevPipewirePerDirectionOptions *ppdo =3D popts-&gt=
;out;<br>
&gt; +=C2=A0 =C2=A0 int r;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 v-&gt;info.format =3D audfmt_to_pw(as-&gt;fmt, as-&gt;e=
ndianness);<br>
&gt; +=C2=A0 =C2=A0 v-&gt;info.channels =3D as-&gt;nchannels;<br>
&gt; +=C2=A0 =C2=A0 v-&gt;info.rate =3D as-&gt;freq;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 obt_as.fmt =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_to_audfmt(v-&gt;info.format, &amp;obt_=
as.endianness, &amp;v-&gt;sample_size);<br>
<br>
The third argument of pw_to_audfmt() returns the sample size.<br>
<br>
&gt; +=C2=A0 =C2=A0 v-&gt;sample_size *=3D as-&gt;nchannels;<br>
<br>
Here you calculate the frame size from the sample size. The correct name <b=
r>
is v-&gt;frame_size. I&#39;m aware the rest of QEMU quite often uses sample=
s as <br>
a synonym for frames. But new code should get the variable names right.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 v-&gt;req =3D (uint64_t)c-&gt;dev-&gt;timer_period * v-=
&gt;info.rate<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1 / 2 / 1000000 * v-&gt;sample_size;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* call the function that creates a new stream for play=
back */<br>
&gt; +=C2=A0 =C2=A0 r =3D qpw_stream_new(c, v, ppdo-&gt;stream_name ? : c-&=
gt;dev-&gt;id,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ppdo-&gt;name, SPA_DIRECTION_OUTPUT);<br>
&gt; +=C2=A0 =C2=A0 if (r &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;qpw_stream_new for pla=
yback failed&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* report the audio format we support */<br>
&gt; +=C2=A0 =C2=A0 audio_pcm_init_info(&amp;hw-&gt;info, &amp;obt_as);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* report the buffer size to qemu */<br>
&gt; +=C2=A0 =C2=A0 hw-&gt;samples =3D audio_buffer_frames(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_AudiodevPipewirePerDirectionOptions_=
base(ppdo), &amp;obt_as, 46440);<br>
&gt; +=C2=A0 =C2=A0 v-&gt;highwater_mark =3D MIN(RINGBUFFER_SIZE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ppdo-&gt;has_latency ? ppdo-&gt;latency : 464=
40)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * (uint64_t)v-&gt;info.rate / 1000000 * v-&gt;=
sample_size);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +qpw_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoiceIn *pw =3D (PWVoiceIn *) hw;<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
&gt; +=C2=A0 =C2=A0 struct audsettings obt_as =3D *as;<br>
&gt; +=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g =3D drv_opaque;<br>
&gt; +=C2=A0 =C2=A0 AudiodevPipewireOptions *popts =3D &amp;c-&gt;dev-&gt;u=
.pipewire;<br>
&gt; +=C2=A0 =C2=A0 AudiodevPipewirePerDirectionOptions *ppdo =3D popts-&gt=
;in;<br>
&gt; +=C2=A0 =C2=A0 int r;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 v-&gt;info.format =3D audfmt_to_pw(as-&gt;fmt, as-&gt;e=
ndianness);<br>
&gt; +=C2=A0 =C2=A0 v-&gt;info.channels =3D as-&gt;nchannels;<br>
&gt; +=C2=A0 =C2=A0 v-&gt;info.rate =3D as-&gt;freq;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 obt_as.fmt =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_to_audfmt(v-&gt;info.format, &amp;obt_=
as.endianness, &amp;v-&gt;sample_size);<br>
&gt; +=C2=A0 =C2=A0 v-&gt;sample_size *=3D as-&gt;nchannels;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* call the function that creates a new stream for reco=
rding */<br>
&gt; +=C2=A0 =C2=A0 r =3D qpw_stream_new(c, v, ppdo-&gt;stream_name ? : c-&=
gt;dev-&gt;id,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ppdo-&gt;name, SPA_DIRECTION_INPUT);<br>
&gt; +=C2=A0 =C2=A0 if (r &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;qpw_stream_new for rec=
ording failed&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* report the audio format we support */<br>
&gt; +=C2=A0 =C2=A0 audio_pcm_init_info(&amp;hw-&gt;info, &amp;obt_as);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* report the buffer size to qemu */<br>
&gt; +=C2=A0 =C2=A0 hw-&gt;samples =3D audio_buffer_frames(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_AudiodevPipewirePerDirectionOptions_=
base(ppdo), &amp;obt_as, 46440);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +qpw_fini_out(HWVoiceOut *hw)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoiceOut *pw =3D (PWVoiceOut *) hw;<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (v-&gt;stream) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_destroy(v-&gt;stream);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;stream =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);=
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +qpw_fini_in(HWVoiceIn *hw)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoiceIn *pw =3D (PWVoiceIn *) hw;<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (v-&gt;stream) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_destroy(v-&gt;stream);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;stream =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);=
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +qpw_enable_out(HWVoiceOut *hw, bool enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoiceOut *po =3D (PWVoiceOut *) hw;<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D &amp;po-&gt;v;<br>
&gt; +=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 pw_stream_set_active(v-&gt;stream, enable);<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +qpw_enable_in(HWVoiceIn *hw, bool enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoiceIn *pi =3D (PWVoiceIn *) hw;<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D &amp;pi-&gt;v;<br>
&gt; +=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 pw_stream_set_active(v-&gt;stream, enable);<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +qpw_volume_out(HWVoiceOut *hw, Volume *vol)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoiceOut *pw =3D (PWVoiceOut *) hw;<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
&gt; +=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
&gt; +=C2=A0 =C2=A0 int i, ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 v-&gt;volume.channels =3D vol-&gt;channels;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; vol-&gt;channels; ++i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;volume.values[i] =3D (float)vol-&gt=
;vol[i] / 255;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ret =3D pw_stream_set_control(v-&gt;stream,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_PROP_channelVolumes, v-&gt;volume.cha=
nnels, v-&gt;volume.values, 0);<br>
&gt; +=C2=A0 =C2=A0 trace_pw_vol(ret =3D=3D 0 ? &quot;success&quot; : &quot=
;failed&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 v-&gt;muted =3D vol-&gt;mute;<br>
&gt; +=C2=A0 =C2=A0 float val =3D v-&gt;muted ? 1.f : 0.f;<br>
&gt; +=C2=A0 =C2=A0 ret =3D pw_stream_set_control(v-&gt;stream, SPA_PROP_mu=
te, 1, &amp;val, 0);<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +qpw_volume_in(HWVoiceIn *hw, Volume *vol)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoiceIn *pw =3D (PWVoiceIn *) hw;<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
&gt; +=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
&gt; +=C2=A0 =C2=A0 int i, ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 v-&gt;volume.channels =3D vol-&gt;channels;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; vol-&gt;channels; ++i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;volume.values[i] =3D (float)vol-&gt=
;vol[i] / 255;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ret =3D pw_stream_set_control(v-&gt;stream,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_PROP_channelVolumes, v-&gt;volume.cha=
nnels, v-&gt;volume.values, 0);<br>
&gt; +=C2=A0 =C2=A0 trace_pw_vol(ret =3D=3D 0 ? &quot;success&quot; : &quot=
;failed&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 v-&gt;muted =3D vol-&gt;mute;<br>
&gt; +=C2=A0 =C2=A0 float val =3D v-&gt;muted ? 1.f : 0.f;<br>
&gt; +=C2=A0 =C2=A0 ret =3D pw_stream_set_control(v-&gt;stream, SPA_PROP_mu=
te, 1, &amp;val, 0);<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int wait_resync(pwaudio *pw)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int res;<br>
&gt; +=C2=A0 =C2=A0 pw-&gt;pending_seq =3D pw_core_sync(pw-&gt;core, PW_ID_=
CORE, pw-&gt;pending_seq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 while (true) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_wait(pw-&gt;thread_loop);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D pw-&gt;error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw-&gt;error =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pw-&gt;pending_seq =3D=3D pw-&gt;last=
_seq) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +static void<br>
&gt; +on_core_error(void *data, uint32_t id, int seq, int res, const char *=
message)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 pwaudio *pw =3D data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 error_report(&quot;error id:%u seq:%d res:%d (%s): %s&q=
uot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id, seq, res,=
 spa_strerror(res), message);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* stop and exit the thread loop */<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_signal(pw-&gt;thread_loop, FALSE);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +on_core_done(void *data, uint32_t id, int seq)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 pwaudio *pw =3D data;<br>
&gt; +=C2=A0 =C2=A0 assert(id =3D=3D PW_ID_CORE);<br>
&gt; +=C2=A0 =C2=A0 pw-&gt;last_seq =3D seq;<br>
&gt; +=C2=A0 =C2=A0 if (pw-&gt;pending_seq =3D=3D seq) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* stop and exit the thread loop */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_signal(pw-&gt;thread_loop,=
 FALSE);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct pw_core_events core_events =3D {<br>
&gt; +=C2=A0 =C2=A0 PW_VERSION_CORE_EVENTS,<br>
&gt; +=C2=A0 =C2=A0 .done =3D on_core_done,<br>
&gt; +=C2=A0 =C2=A0 .error =3D on_core_error,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void *<br>
&gt; +qpw_audio_init(Audiodev *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 g_autofree pwaudio *pw =3D g_new0(pwaudio, 1);<br>
&gt; +=C2=A0 =C2=A0 pw_init(NULL, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 trace_pw_audio_init();<br>
&gt; +=C2=A0 =C2=A0 assert(dev-&gt;driver =3D=3D AUDIODEV_DRIVER_PIPEWIRE);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw-&gt;dev =3D dev;<br>
&gt; +=C2=A0 =C2=A0 pw-&gt;thread_loop =3D pw_thread_loop_new(&quot;Pipewir=
e thread loop&quot;, NULL);<br>
&gt; +=C2=A0 =C2=A0 if (pw-&gt;thread_loop =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Could not create Pipew=
ire loop&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw-&gt;context =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_context_new(pw_thread_loop_get_loop(pw=
-&gt;thread_loop), NULL, 0);<br>
&gt; +=C2=A0 =C2=A0 if (pw-&gt;context =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Could not create Pipew=
ire context&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (pw_thread_loop_start(pw-&gt;thread_loop) &lt; 0) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Could not start Pipewi=
re loop&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_lock(pw-&gt;thread_loop);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw-&gt;core =3D pw_context_connect(pw-&gt;context, NULL=
, 0);<br>
&gt; +=C2=A0 =C2=A0 if (pw-&gt;core =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_unlock(pw-&gt;thread_loop)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (pw_core_add_listener(pw-&gt;core, &amp;pw-&gt;core_=
listener,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;core_events, pw) &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_unlock(pw-&gt;thread_loop)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 if (wait_resync(pw) &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_unlock(pw-&gt;thread_loop)=
;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(pw-&gt;thread_loop);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return g_steal_pointer(&amp;pw);<br>
&gt; +<br>
&gt; +fail:<br>
&gt; +=C2=A0 =C2=A0 AUD_log(AUDIO_CAP, &quot;Failed to initialize PW contex=
t&quot;);<br>
&gt; +=C2=A0 =C2=A0 if (pw-&gt;thread_loop) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_stop(pw-&gt;thread_loop);<=
br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 if (pw-&gt;context) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_clear_pointer(&amp;pw-&gt;context, pw_c=
ontext_destroy);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 if (pw-&gt;thread_loop) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_clear_pointer(&amp;pw-&gt;thread_loop, =
pw_thread_loop_destroy);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return NULL;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +qpw_audio_fini(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 pwaudio *pw =3D opaque;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (pw-&gt;thread_loop) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_stop(pw-&gt;thread_loop);<=
br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (pw-&gt;core) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;pw-&gt;core_listener=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_zero(pw-&gt;core_listener);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_core_disconnect(pw-&gt;core);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (pw-&gt;context) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_context_destroy(pw-&gt;context);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_destroy(pw-&gt;thread_loop);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_free(pw);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct audio_pcm_ops qpw_pcm_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 .init_out =3D qpw_init_out,<br>
&gt; +=C2=A0 =C2=A0 .fini_out =3D qpw_fini_out,<br>
&gt; +=C2=A0 =C2=A0 .write =3D qpw_write,<br>
&gt; +=C2=A0 =C2=A0 .buffer_get_free =3D qpw_buffer_get_free,<br>
&gt; +=C2=A0 =C2=A0 .run_buffer_out =3D audio_generic_run_buffer_out,<br>
&gt; +=C2=A0 =C2=A0 .enable_out =3D qpw_enable_out,<br>
&gt; +=C2=A0 =C2=A0 .volume_out =3D qpw_volume_out,<br>
&gt; +=C2=A0 =C2=A0 .volume_in =3D qpw_volume_in,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 .init_in =3D qpw_init_in,<br>
&gt; +=C2=A0 =C2=A0 .fini_in =3D qpw_fini_in,<br>
&gt; +=C2=A0 =C2=A0 .read =3D qpw_read,<br>
&gt; +=C2=A0 =C2=A0 .run_buffer_in =3D audio_generic_run_buffer_in,<br>
&gt; +=C2=A0 =C2=A0 .enable_in =3D qpw_enable_in<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct audio_driver pw_audio_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 .name =3D &quot;pipewire&quot;,<br>
&gt; +=C2=A0 =C2=A0 .descr =3D &quot;<a href=3D"http://www.pipewire.org/" r=
el=3D"noreferrer" target=3D"_blank">http://www.pipewire.org/</a>&quot;,<br>
&gt; +=C2=A0 =C2=A0 .init =3D qpw_audio_init,<br>
&gt; +=C2=A0 =C2=A0 .fini =3D qpw_audio_fini,<br>
&gt; +=C2=A0 =C2=A0 .pcm_ops =3D &amp;qpw_pcm_ops,<br>
&gt; +=C2=A0 =C2=A0 .can_be_default =3D 1,<br>
&gt; +=C2=A0 =C2=A0 .max_voices_out =3D INT_MAX,<br>
&gt; +=C2=A0 =C2=A0 .max_voices_in =3D INT_MAX,<br>
&gt; +=C2=A0 =C2=A0 .voice_size_out =3D sizeof(PWVoiceOut),<br>
&gt; +=C2=A0 =C2=A0 .voice_size_in =3D sizeof(PWVoiceIn),<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void<br>
&gt; +register_audio_pw(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 audio_driver_register(&amp;pw_audio_driver);<br>
&gt; +}<br>
&gt; +<br>
&gt; +type_init(register_audio_pw);<br>
&gt; diff --git a/audio/trace-events b/audio/trace-events<br>
&gt; index e1ab643add..c764e5641b 100644<br>
&gt; --- a/audio/trace-events<br>
&gt; +++ b/audio/trace-events<br>
&gt; @@ -18,6 +18,14 @@ dbus_audio_register(const char *s, const char *dir)=
 &quot;sender =3D %s, dir =3D %s&quot;<br>
&gt;=C2=A0 =C2=A0dbus_audio_put_buffer_out(size_t len) &quot;len =3D %zu&qu=
ot;<br>
&gt;=C2=A0 =C2=A0dbus_audio_read(size_t len) &quot;len =3D %zu&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +# pwaudio.c<br>
&gt; +pw_state_changed(int nodeid, const char *s) &quot;node id: %d stream =
state: %s&quot;<br>
&gt; +pw_read(int32_t avail, uint32_t index, size_t len) &quot;avail=3D%d i=
ndex=3D%u len=3D%zu&quot;<br>
&gt; +pw_write(int32_t filled, int32_t avail, uint32_t index, size_t len) &=
quot;filled=3D%d avail=3D%d index=3D%u len=3D%zu&quot;<br>
&gt; +pw_vol(const char *ret) &quot;set volume: %s&quot;<br>
&gt; +pw_timer(uint64_t buf_samples) &quot;timer period =3D %&quot; PRIu64<=
br>
<br>
Sorry, I was not very clear last time. I wrote &#39;quantum&#39; but I mean=
t the <br>
PipeWire scheduling period.<br>
<br>
-pw_timer(uint64_t buf_samples) &quot;timer period =3D %&quot; PRIu64<br>
+pw_period(uint64_t quant, uint32_t rate) &quot;period=3D%&quot; PRIu64 &qu=
ot;/%u&quot;<br>
<br>
This is the same you see with pw-top.<br>
<br>
S=C2=A0=C2=A0 ID=C2=A0 QUANT=C2=A0=C2=A0 RATE=C2=A0=C2=A0=C2=A0 WAIT=C2=A0=
=C2=A0=C2=A0 BUSY=C2=A0=C2=A0 W/Q=C2=A0=C2=A0 B/Q=C2=A0 ERR FORMAT NAME<br>
S=C2=A0=C2=A0 28=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0=C2=A0=C2=A0=C2=A0 ---=C2=A0=C2=A0=C2=A0=C2=A0 ---=C2=A0=C2=A0 ---=C2=
=A0=C2=A0 --- 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>
Dummy-Driver<br>
S=C2=A0=C2=A0 29=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0=C2=A0=C2=A0=C2=A0 ---=C2=A0=C2=A0=C2=A0=C2=A0 ---=C2=A0=C2=A0 ---=C2=
=A0=C2=A0 --- 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>
Freewheel-Driver<br>
S=C2=A0=C2=A0 37=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0=C2=A0=C2=A0=C2=A0 ---=C2=A0=C2=A0=C2=A0=C2=A0 ---=C2=A0=C2=A0 ---=C2=
=A0=C2=A0 --- 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>
Midi-Bridge<br>
S=C2=A0=C2=A0 46=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0=C2=A0=C2=A0=C2=A0 ---=C2=A0=C2=A0=C2=A0=C2=A0 ---=C2=A0=C2=A0 ---=C2=
=A0=C2=A0 --- 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>
alsa_output.pci-0000_00_03.0.hdmi-stereo<br>
R=C2=A0=C2=A0 47=C2=A0=C2=A0=C2=A0 256=C2=A0 48000 102,2us=C2=A0 22,1us=C2=
=A0 0,02=C2=A0 0,00=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0 S32LE 2 48000 <br=
>
alsa_output.pci-0000_00_1b.0.analog-stereo<br>
R=C2=A0=C2=A0 63=C2=A0=C2=A0=C2=A0 240=C2=A0 32000=C2=A0 65,4us=C2=A0=C2=A0=
 4,9us=C2=A0 0,01=C2=A0 0,00=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 U8 1 32000=C2=A0 <br>
+ qemu-system-x86_64<br>
R=C2=A0=C2=A0 67=C2=A0=C2=A0=C2=A0 330=C2=A0 44100=C2=A0 32,8us=C2=A0 33,4u=
s=C2=A0 0,01=C2=A0 0,01=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0 S16LE 2 44100=
=C2=A0 <br>
+ qemu-system-x86_64<br>
S=C2=A0=C2=A0 48=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0=C2=A0=C2=A0=C2=A0 ---=C2=A0=C2=A0=C2=A0=C2=A0 ---=C2=A0=C2=A0 ---=C2=
=A0=C2=A0 --- 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>
alsa_input.pci-0000_00_1b.0.analog-stereo<br>
S=C2=A0=C2=A0 68=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0=C2=A0=C2=A0=C2=A0 ---=C2=A0=C2=A0=C2=A0=C2=A0 ---=C2=A0=C2=A0 ---=C2=
=A0=C2=A0 --- 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>
qemu-system-x86_64<br>
<br>
With best regards,<br>
Volker<br>
<br>
&gt; +pw_audio_init(void) &quot;Initialize Pipewire context&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0# audio.c<br>
&gt;=C2=A0 =C2=A0audio_timer_start(int interval) &quot;interval %d ms&quot;=
<br>
&gt;=C2=A0 =C2=A0audio_timer_stop(void) &quot;&quot;<br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index 29f8644d6d..31bf280c0d 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -730,6 +730,12 @@ if not get_option(&#39;jack&#39;).auto() or have_=
system<br>
&gt;=C2=A0 =C2=A0 =C2=A0jack =3D dependency(&#39;jack&#39;, required: get_o=
ption(&#39;jack&#39;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0method: &#39;pkg-config&#39;, kwargs: static_kwargs)<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt; +pipewire =3D not_found<br>
&gt; +if not get_option(&#39;pipewire&#39;).auto() or (targetos =3D=3D &#39=
;linux&#39; and have_system)<br>
&gt; +=C2=A0 pipewire =3D dependency(&#39;libpipewire-0.3&#39;, version: &#=
39;&gt;=3D0.3.60&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 required: get_option(&#39;pipewire&#39;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 method: &#39;pkg-config&#39;, kwargs: static_kwargs)<br>
&gt; +endif<br>
&gt;=C2=A0 =C2=A0sndio =3D not_found<br>
&gt;=C2=A0 =C2=A0if not get_option(&#39;sndio&#39;).auto() or have_system<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0sndio =3D dependency(&#39;sndio&#39;, required: get=
_option(&#39;sndio&#39;),<br>
&gt; @@ -1667,6 +1673,7 @@ if have_system<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;jack&#39;: jack.found(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;oss&#39;: oss.found(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;pa&#39;: pulse.found(),<br>
&gt; +=C2=A0 =C2=A0 &#39;pipewire&#39;: pipewire.found(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sdl&#39;: sdl.found(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sndio&#39;: sndio.found(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -3980,6 +3987,7 @@ if targetos =3D=3D &#39;linux&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0summary_info +=3D {&#39;ALSA support&#39;:=C2=A0 =
=C2=A0 alsa}<br>
&gt;=C2=A0 =C2=A0 =C2=A0summary_info +=3D {&#39;PulseAudio support&#39;: pu=
lse}<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt; +summary_info +=3D {&#39;Pipewire support&#39;:=C2=A0 =C2=A0pipewire}<=
br>
&gt;=C2=A0 =C2=A0summary_info +=3D {&#39;JACK support&#39;:=C2=A0 =C2=A0 =
=C2=A0 jack}<br>
&gt;=C2=A0 =C2=A0summary_info +=3D {&#39;brlapi support&#39;:=C2=A0 =C2=A0 =
brlapi}<br>
&gt;=C2=A0 =C2=A0summary_info +=3D {&#39;vde support&#39;:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0vde}<br>
&gt; diff --git a/meson_options.txt b/meson_options.txt<br>
&gt; index fc9447d267..9ae1ec7f47 100644<br>
&gt; --- a/meson_options.txt<br>
&gt; +++ b/meson_options.txt<br>
&gt; @@ -21,7 +21,7 @@ option(&#39;tls_priority&#39;, type : &#39;string&#3=
9;, value : &#39;NORMAL&#39;,<br>
&gt;=C2=A0 =C2=A0option(&#39;default_devices&#39;, type : &#39;boolean&#39;=
, value : true,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Include a default =
selection of devices in emulators&#39;)<br>
&gt;=C2=A0 =C2=A0option(&#39;audio_drv_list&#39;, type: &#39;array&#39;, va=
lue: [&#39;default&#39;],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0choices: [&#39;alsa&#39;, &#39;coreaudio&#=
39;, &#39;default&#39;, &#39;dsound&#39;, &#39;jack&#39;, &#39;oss&#39;, &#=
39;pa&#39;, &#39;sdl&#39;, &#39;sndio&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0choices: [&#39;alsa&#39;, &#39;coreaudio&#=
39;, &#39;default&#39;, &#39;dsound&#39;, &#39;jack&#39;, &#39;oss&#39;, &#=
39;pa&#39;, &#39;pipewire&#39;, &#39;sdl&#39;, &#39;sndio&#39;],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Set audio driver l=
ist&#39;)<br>
&gt;=C2=A0 =C2=A0option(&#39;block_drv_rw_whitelist&#39;, type : &#39;strin=
g&#39;, value : &#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;set block driver r=
ead-write whitelist (by default affects only QEMU, not tools like qemu-img)=
&#39;)<br>
&gt; @@ -255,6 +255,8 @@ option(&#39;oss&#39;, type: &#39;feature&#39;, val=
ue: &#39;auto&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;OSS sound support&=
#39;)<br>
&gt;=C2=A0 =C2=A0option(&#39;pa&#39;, type: &#39;feature&#39;, value: &#39;=
auto&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;PulseAudio sound s=
upport&#39;)<br>
&gt; +option(&#39;pipewire&#39;, type: &#39;feature&#39;, value: &#39;auto&=
#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Pipewire sound support&#=
39;)<br>
&gt;=C2=A0 =C2=A0option(&#39;sndio&#39;, type: &#39;feature&#39;, value: &#=
39;auto&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;sndio sound suppor=
t&#39;)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/qapi/audio.json b/qapi/audio.json<br>
&gt; index 4e54c00f51..e03396a7bc 100644<br>
&gt; --- a/qapi/audio.json<br>
&gt; +++ b/qapi/audio.json<br>
&gt; @@ -324,6 +324,47 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*out&#39;:=C2=A0 =C2=A0 &#39;AudiodevPa=
PerDirectionOptions&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*server&#39;: &#39;str&#39; } }<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +##<br>
&gt; +# @AudiodevPipewirePerDirectionOptions:<br>
&gt; +#<br>
&gt; +# Options of the Pipewire backend that are used for both playback and=
<br>
&gt; +# recording.<br>
&gt; +#<br>
&gt; +# @name: name of the sink/source to use<br>
&gt; +#<br>
&gt; +# @stream-name: name of the Pipewire stream created by qemu.=C2=A0 Ca=
n be<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used to ident=
ify the stream in Pipewire when you<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create multip=
le Pipewire devices or run multiple qemu<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0instances (de=
fault: audiodev&#39;s id)<br>
&gt; +#<br>
&gt; +# @latency: latency you want Pipewire to achieve in microseconds<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(default 46000)<br>
&gt; +#<br>
&gt; +# Since: 8.1<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;AudiodevPipewirePerDirectionOptions&#39;,<br=
>
&gt; +=C2=A0 &#39;base&#39;: &#39;AudiodevPerDirectionOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;*name&#39;: &#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*stream-name&#39;: &#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*latency&#39;: &#39;uint32&#39; } }<br>
&gt; +<br>
&gt; +##<br>
&gt; +# @AudiodevPipewireOptions:<br>
&gt; +#<br>
&gt; +# Options of the Pipewire audio backend.<br>
&gt; +#<br>
&gt; +# @in: options of the capture stream<br>
&gt; +#<br>
&gt; +# @out: options of the playback stream<br>
&gt; +#<br>
&gt; +# Since: 8.1<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;AudiodevPipewireOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;*in&#39;:=C2=A0 =C2=A0 =C2=A0&#39;AudiodevPipewire=
PerDirectionOptions&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*out&#39;:=C2=A0 =C2=A0 &#39;AudiodevPipewirePerDi=
rectionOptions&#39; } }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0##<br>
&gt;=C2=A0 =C2=A0# @AudiodevSdlPerDirectionOptions:<br>
&gt;=C2=A0 =C2=A0#<br>
&gt; @@ -416,6 +457,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;=
: &#39;jack&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_JACK&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;=
: &#39;oss&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_OSS&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;=
: &#39;pa&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_PA&#39; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;pipe=
wire&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_PIPEWIRE&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;=
: &#39;sdl&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_SDL&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;=
: &#39;sndio&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_SNDIO&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;=
: &#39;spice&#39;, &#39;if&#39;: &#39;CONFIG_SPICE&#39; },<br>
&gt; @@ -456,6 +498,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;if&#39;: &#39;CONFIG_AUDIO_OSS&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;pa&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &=
#39;type&#39;: &#39;AudiodevPaOptions&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;if&#39;: &#39;CONFIG_AUDIO_PA&#39; },<br>
&gt; +=C2=A0 =C2=A0 &#39;pipewire&#39;:=C2=A0 { &#39;type&#39;: &#39;Audiod=
evPipewireOptions&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;if&#39;: &#39;CONFIG_AUDIO_PIPEWIRE&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sdl&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &=
#39;type&#39;: &#39;AudiodevSdlOptions&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;if&#39;: &#39;CONFIG_AUDIO_SDL&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sndio&#39;:=C2=A0 =C2=A0 =C2=A0{ &#39;t=
ype&#39;: &#39;AudiodevSndioOptions&#39;,<br>
&gt; diff --git a/qemu-options.hx b/qemu-options.hx<br>
&gt; index 59bdf67a2c..2d908717bd 100644<br>
&gt; --- a/qemu-options.hx<br>
&gt; +++ b/qemu-options.hx<br>
&gt; @@ -779,6 +779,12 @@ DEF(&quot;audiodev&quot;, HAS_ARG, QEMU_OPTION_au=
diodev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 in|<a href=3D"http://out.name" rel=3D"noreferrer" target=
=3D"_blank">out.name</a>=3D source/sink device name\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 in|out.latency=3D desired latency in microseconds\n&quot;=
<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt; +#ifdef CONFIG_AUDIO_PIPEWIRE<br>
&gt; +=C2=A0 =C2=A0 &quot;-audiodev pipewire,id=3Did[,prop[=3Dvalue][,...]]=
\n&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 in|<a href=3D"http://out.name" rel=3D"noreferrer" target=3D"_blank">=
out.name</a>=3D source/sink device name\n&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 in|out.stream-name=3D name of pipewire stream\n&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 in|out.latency=3D desired latency in microseconds\n&quot;<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0#ifdef CONFIG_AUDIO_SDL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-audiodev sdl,id=3Did[,prop[=3Dvalue][=
,...]]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 in|out.buffer-count=3D number of buffers\n&quot;<br>
&gt; @@ -942,6 +948,21 @@ SRST<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Desired latency in microsecond=
s. The PulseAudio server will try<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to honor this value but actual=
 latencies may be lower or higher.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +``-audiodev pipewire,id=3Did[,prop[=3Dvalue][,...]]``<br>
&gt; +=C2=A0 =C2=A0 Creates a backend using Pipewire. This backend is avail=
able on<br>
&gt; +=C2=A0 =C2=A0 most systems.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Pipewire specific options are:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ``in|out.latency=3Dusecs``<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Desired latency in microseconds.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ``in|<a href=3D"http://out.name" rel=3D"noreferrer" tar=
get=3D"_blank">out.name</a>=3Dsink``<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Use the specified source/sink for recordi=
ng/playback.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ``in|out.stream-name``<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Specify the name of pipewire stream.<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0``-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]``<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Creates a backend using SDL. This backend is=
 available on most<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0systems, but you should use your platform&#3=
9;s native backend if<br>
&gt; diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoption=
s.sh<br>
&gt; index 009fab1515..ba1057b62c 100644<br>
&gt; --- a/scripts/meson-buildoptions.sh<br>
&gt; +++ b/scripts/meson-buildoptions.sh<br>
&gt; @@ -1,7 +1,8 @@<br>
&gt;=C2=A0 =C2=A0# This file is generated by meson-buildoptions.py, do not =
edit!<br>
&gt;=C2=A0 =C2=A0meson_options_help() {<br>
&gt; -=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --audio-drv-list=3DCHOICES=
 Set audio driver list [default] (choices: alsa/co&#39;<br>
&gt; -=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reaudio/d=
efault/dsound/jack/oss/pa/sdl/sndio)&#39;<br>
&gt; +=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --audio-drv-list=3DCHOICES=
 Set audio driver list [default] (choices: al&#39;<br>
&gt; +=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sa/coreau=
dio/default/dsound/jack/oss/pa/&#39;<br>
&gt; +=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pipewire/=
sdl/sndio)&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --block-drv-ro-=
whitelist=3DVALUE&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0set block driver read-only whitelist (by default&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0affects only QEMU, not tools like qemu-img)&#39;<br>
&gt; @@ -136,6 +137,7 @@ meson_options_help() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 oss=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OSS sound support&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 pa=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PulseAudio sound support&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 parallels=C2=A0=
 =C2=A0 =C2=A0 =C2=A0parallels image format support&#39;<br>
&gt; +=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 pipewire=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Pipewire sound support&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 png=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PNG support with libpng&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 pvrdma=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Enable PVRDMA support&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 qcow1=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qcow1 image format support&#39;<br>
&gt; @@ -370,6 +372,8 @@ _meson_option_parse() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-pa) printf &quot;%s&quot; -Dpa=3Dd=
isabled ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-parallels) printf &quot;%s&quot; -D=
parallels=3Denabled ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-parallels) printf &quot;%s&quot; -=
Dparallels=3Ddisabled ;;<br>
&gt; +=C2=A0 =C2=A0 --enable-pipewire) printf &quot;%s&quot; -Dpipewire=3De=
nabled ;;<br>
&gt; +=C2=A0 =C2=A0 --disable-pipewire) printf &quot;%s&quot; -Dpipewire=3D=
disabled ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--with-pkgversion=3D*) quote_sh &quot;-Dpkgv=
ersion=3D$2&quot; ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-png) printf &quot;%s&quot; -Dpng=3D=
enabled ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-png) printf &quot;%s&quot; -Dpng=
=3Ddisabled ;;<br>
<br>
</blockquote></div>

--000000000000b0963105f9602d47--


