Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D080699CD5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 20:07:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSjaF-00034X-OW; Thu, 16 Feb 2023 14:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pSjaD-00034M-Nl
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 14:06:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pSja7-0008My-FJ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 14:06:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676574370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gdfXA6MhDET4yX/oLeMPhXweZ5LaHm1lahkG1ySNWmI=;
 b=X3hNxUckoZPRE6VlJJqSpVRZVjXLcNCGHAHnL+K/ETqjxI4JklRNWgMdig/HQqnaxiJiY+
 J7L+SCRVeOgvMal8XZ/l6RfTn9Osycc2PcjfFfquB9MdEVwBGccasx9s6v2eKwQE1l9r/G
 tHnJM72OIWlt/+/vfMXoyYbMUBPusBM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-ioeXoCC2OEm5KTxmynoaqg-1; Thu, 16 Feb 2023 14:06:08 -0500
X-MC-Unique: ioeXoCC2OEm5KTxmynoaqg-1
Received: by mail-qt1-f197.google.com with SMTP id
 cr22-20020a05622a429600b003b694a9f291so1766401qtb.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 11:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676574364;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gdfXA6MhDET4yX/oLeMPhXweZ5LaHm1lahkG1ySNWmI=;
 b=qNbZYQm8e8m0qb8MUnGHQS84mMYBDA8tlfKZJ7ORWBXbz0P7G49zQb4Fm6SMYSuRPF
 h8qbH8cB0sFwHj/chvs52sBQnOOWlV4xVeNCcY3CJNBO/Ittt2xmN/2Uy4cHAOuodFtw
 u29de3+GbvBzYFgDkpqO8/0O9f6KqZryncpgSaxi6NlNn435MT5jfGQfathPLkqYM3NP
 HKSPzSzr6xNlQR52X7FYF5zg9A4AGECtdvzFJyDl7/NunKSZp3MoYVMmldSOTj9p+erv
 TXvRSOBvXN/NFoL8uutOBLWT12kPiouhkME5HFfDCSQsySqxtAWtTrVyQOhxnk4uSGET
 pyPQ==
X-Gm-Message-State: AO0yUKWSlbCwC9dyQox/ST/pu/xmsgJNgiw8rZndM7p1+TDUWIkpePwk
 GfbeYwYTsIr3mHwyi8VwUbCLsSBwMl2be9D2wngqhCAkCoy9Dd/hAD7ot5BDYUOVBGEQTP6q40a
 KWN1SSJSkZvsXzvExoG4+76NltgAJwpc=
X-Received: by 2002:a0c:b28c:0:b0:56f:6f9:83d2 with SMTP id
 r12-20020a0cb28c000000b0056f06f983d2mr128834qve.12.1676574363560; 
 Thu, 16 Feb 2023 11:06:03 -0800 (PST)
X-Google-Smtp-Source: AK7set9iVbW9xWN6WacXVUW9Mlb91OR/ICRNI1gO/krUb0DVESj9r5xSukGNfrebpOs3HcYaBNTjRXI4fpHqzr3fNm4=
X-Received: by 2002:a0c:b28c:0:b0:56f:6f9:83d2 with SMTP id
 r12-20020a0cb28c000000b0056f06f983d2mr128819qve.12.1676574363113; Thu, 16 Feb
 2023 11:06:03 -0800 (PST)
MIME-Version: 1.0
References: <20230216082544.119313-1-dbassey@redhat.com>
 <3927829.46xv3xUdxJ@silver>
In-Reply-To: <3927829.46xv3xUdxJ@silver>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Thu, 16 Feb 2023 20:05:52 +0100
Message-ID: <CACzuRyzdZjGPhY2RQ9cqJEAZyzzt-HG+_TX+-_LbfBu3sLoEYA@mail.gmail.com>
Subject: Re: [PATCH v2] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, armbru@redhat.com, 
 pbonzini@redhat.com, wtaymans@redhat.com
Content-Type: multipart/alternative; boundary="0000000000005a716105f4d5e3c8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dbassey@redhat.com;
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

--0000000000005a716105f4d5e3c8
Content-Type: text/plain; charset="UTF-8"

>
> BUFFER_SAMPLES is not used anywhere, and in code you are using 512 as
> literals
> instead.

That was an oversight indeed, It's intended use was removed.

s/buffer/ringbuffer/ maybe?
>
I think the naming convention 'buffer' is good.

I would not use literals for period size and number of periods directly in
> code. Better use macros or constants instead.
>
Noted, thanks.

Why exactly 4k?
>
For playback streams, this size allows for more efficient streaming of
audio data, as smaller chunks can lead to inaccuracies in sound quality.

Why 44ms?
>
 Thanks for spotting that, I had set its calculation to be Hz, because the
default rate is between 44kHz to 48kHz, when actually the latency should be
low as ~10ms latency (256 /48000 Hz). I would change that to 15ms which is
fair for what a generic hardware can handle. BTW there's also the parameter
to set the latency to desired value.

On Thu, Feb 16, 2023 at 12:41 PM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Thursday, February 16, 2023 9:25:44 AM CET Dorinda Bassey wrote:
> > This commit adds a new audiodev backend to allow QEMU to use Pipewire as
> both an audio sink and source.
> >
>
> Please wrap commit log.
>
> > Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
> > ---
> > v2:
> > * Shorten commit message
> > * fix copyright ownership and authour
> > * use QEMU standard of 4 space indentation
> > * verbose use of pipewire instead pf pw
> >
> >  audio/audio.c                 |   3 +
> >  audio/audio_template.h        |   4 +
> >  audio/meson.build             |   1 +
> >  audio/pwaudio.c               | 818 ++++++++++++++++++++++++++++++++++
> >  meson.build                   |   7 +
> >  meson_options.txt             |   4 +-
> >  qapi/audio.json               |  45 ++
> >  qemu-options.hx               |  17 +
> >  scripts/meson-buildoptions.sh |   8 +-
> >  9 files changed, 904 insertions(+), 3 deletions(-)
> >  create mode 100644 audio/pwaudio.c
> >
> > diff --git a/audio/audio.c b/audio/audio.c
> > index 4290309d18..aa55e41ad8 100644
> > --- a/audio/audio.c
> > +++ b/audio/audio.c
> > @@ -2069,6 +2069,9 @@ void audio_create_pdos(Audiodev *dev)
> >  #ifdef CONFIG_AUDIO_PA
> >          CASE(PA, pa, Pa);
> >  #endif
> > +#ifdef CONFIG_AUDIO_PIPEWIRE
> > +        CASE(PIPEWIRE, pipewire, Pipewire);
> > +#endif
> >  #ifdef CONFIG_AUDIO_SDL
> >          CASE(SDL, sdl, Sdl);
> >  #endif
> > diff --git a/audio/audio_template.h b/audio/audio_template.h
> > index 42b4712acb..0f02afb921 100644
> > --- a/audio/audio_template.h
> > +++ b/audio/audio_template.h
> > @@ -355,6 +355,10 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_,
> TYPE)(Audiodev *dev)
> >      case AUDIODEV_DRIVER_PA:
> >          return qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE);
> >  #endif
> > +#ifdef CONFIG_AUDIO_PIPEWIRE
> > +    case AUDIODEV_DRIVER_PIPEWIRE:
> > +        return
> qapi_AudiodevPipewirePerDirectionOptions_base(dev->u.pipewire.TYPE);
> > +#endif
> >  #ifdef CONFIG_AUDIO_SDL
> >      case AUDIODEV_DRIVER_SDL:
> >          return
> qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.TYPE);
> > diff --git a/audio/meson.build b/audio/meson.build
> > index 0722224ba9..65a49c1a10 100644
> > --- a/audio/meson.build
> > +++ b/audio/meson.build
> > @@ -19,6 +19,7 @@ foreach m : [
> >    ['sdl', sdl, files('sdlaudio.c')],
> >    ['jack', jack, files('jackaudio.c')],
> >    ['sndio', sndio, files('sndioaudio.c')],
> > +  ['pipewire', pipewire, files('pwaudio.c')],
> >    ['spice', spice, files('spiceaudio.c')]
> >  ]
> >    if m[1].found()
> > diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> > new file mode 100644
> > index 0000000000..bb25133414
> > --- /dev/null
> > +++ b/audio/pwaudio.c
> > @@ -0,0 +1,818 @@
> > +/*
> > + * QEMU Pipewire audio driver
> > + *
> > + * Copyright (c) 2023 Red Hat Inc.
> > + *
> > + * Author: Dorinda Bassey       <dbassey@redhat.com>
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> obtaining a copy
> > + * of this software and associated documentation files (the
> "Software"), to deal
> > + * in the Software without restriction, including without limitation
> the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> > + * copies of the Software, and to permit persons to whom the Software is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN
> > + * THE SOFTWARE.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/module.h"
> > +#include "audio.h"
> > +#include <errno.h>
> > +#include <spa/param/audio/format-utils.h>
> > +#include <spa/utils/ringbuffer.h>
> > +#include <spa/utils/result.h>
> > +
> > +#include <pipewire/pipewire.h>
> > +
> > +#define AUDIO_CAP "pipewire"
> > +#define RINGBUFFER_SIZE    (1u << 22)
> > +#define RINGBUFFER_MASK    (RINGBUFFER_SIZE - 1)
> > +#define BUFFER_SAMPLES    128
>
> BUFFER_SAMPLES is not used anywhere, and in code you are using 512 as
> literals
> instead.
>
> > +
> > +#include "audio_int.h"
> > +
> > +enum {
> > +    MODE_SINK,
> > +    MODE_SOURCE
> > +};
> > +
> > +typedef struct pwaudio {
> > +    Audiodev *dev;
> > +    struct pw_thread_loop *thread_loop;
> > +    struct pw_context *context;
> > +
> > +    struct pw_core *core;
> > +    struct spa_hook core_listener;
> > +    int seq;
> > +} pwaudio;
> > +
> > +typedef struct PWVoice {
> > +    pwaudio *g;
> > +    bool enabled;
> > +    struct pw_stream *stream;
> > +    struct spa_hook stream_listener;
> > +    struct spa_audio_info_raw info;
> > +    uint32_t frame_size;
> > +    struct spa_ringbuffer ring;
> > +    uint8_t buffer[RINGBUFFER_SIZE];
>
> s/buffer/ringbuffer/ maybe?
>
> > +
> > +    uint32_t mode;
> > +    struct pw_properties *props;
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
> > +    PWVoice *v = (PWVoice *) data;
> > +    spa_hook_remove(&v->stream_listener);
> > +    v->stream = NULL;
> > +}
> > +
> > +/* output data processing function to read stuffs from the buffer */
> > +static void
> > +playback_on_process(void *data)
> > +{
> > +    PWVoice *v = (PWVoice *) data;
> > +    void *p;
> > +    struct pw_buffer *b;
> > +    struct spa_buffer *buf;
> > +    uint32_t n_frames, req, index, n_bytes;
> > +    int32_t avail;
> > +
>
> if (!v->stream) {
>     return;
> }
>
> As pw_stream_dequeue_buffer() apparently can't cope with NULL.
>
> > +    /* obtain a buffer to read from */
> > +    b = pw_stream_dequeue_buffer(v->stream);
> > +    if (b == NULL) {
> > +        pw_log_warn("out of buffers: %m");
> > +        return;
> > +    }
> > +
> > +    buf = b->buffer;
> > +    p = buf->datas[0].data;
> > +    if (p == NULL) {
> > +        return;
> > +    }
> > +    req = b->requested * v->frame_size;
> > +    if (req == 0) {
> > +        req = 4096 * v->frame_size;
> > +    }
>
> Why exactly 4k?
>
> > +    n_frames = SPA_MIN(req, buf->datas[0].maxsize);
> > +    n_bytes = n_frames * v->frame_size;
> > +
> > +    /* get no of available bytes to read data from buffer */
> > +
> > +    avail = spa_ringbuffer_get_read_index(&v->ring, &index);
> > +
> > +    if (!v->enabled) {
> > +        avail = 0;
> > +    }
> > +
> > +    if (avail == 0) {
> > +        memset(p, 0, n_bytes);
> > +    } else {
> > +        if (avail < (int32_t) n_bytes) {
> > +            n_bytes = avail;
> > +        }
> > +
> > +        spa_ringbuffer_read_data(&v->ring,
> > +                                    v->buffer, RINGBUFFER_SIZE,
> > +                                    index & RINGBUFFER_MASK, p,
> n_bytes);
> > +
> > +        index += n_bytes;
> > +        spa_ringbuffer_read_update(&v->ring, index);
> > +    }
> > +
> > +    buf->datas[0].chunk->offset = 0;
> > +    buf->datas[0].chunk->stride = v->frame_size;
> > +    buf->datas[0].chunk->size = n_bytes;
> > +
> > +    /* queue the buffer for playback */
> > +    pw_stream_queue_buffer(v->stream, b);
> > +}
> > +
> > +/* output data processing function to generate stuffs in the buffer */
> > +static void
> > +capture_on_process(void *data)
> > +{
> > +    PWVoice *v = (PWVoice *) data;
> > +    void *p;
> > +    struct pw_buffer *b;
> > +    struct spa_buffer *buf;
> > +    int32_t filled;
> > +    uint32_t index, offs, n_bytes;
> > +
>
> if (!v->stream) {
>     return;
> }
>
> > +    /* obtain a buffer */
> > +    b = pw_stream_dequeue_buffer(v->stream);
> > +    if (b == NULL) {
> > +        pw_log_warn("out of buffers: %m");
> > +        return;
> > +    }
> > +
> > +    /* Write data into buffer */
> > +    buf = b->buffer;
> > +    p = buf->datas[0].data;
> > +    if (p == NULL) {
> > +        return;
> > +    }
> > +    offs = SPA_MIN(buf->datas[0].chunk->offset, buf->datas[0].maxsize);
> > +    n_bytes = SPA_MIN(buf->datas[0].chunk->size, buf->datas[0].maxsize
> - offs);
> > +
> > +    filled = spa_ringbuffer_get_write_index(&v->ring, &index);
> > +
> > +    if (!v->enabled) {
> > +        n_bytes = 0;
> > +    }
> > +
> > +    if (filled < 0) {
> > +        pw_log_warn("%p: underrun write:%u filled:%d", p, index,
> filled);
> > +    } else {
> > +        if ((uint32_t) filled + n_bytes > RINGBUFFER_SIZE) {
> > +            pw_log_warn("%p: overrun write:%u filled:%d + size:%u >
> max:%u",
> > +            p, index, filled, n_bytes, RINGBUFFER_SIZE);
> > +        }
> > +    }
> > +    spa_ringbuffer_write_data(&v->ring,
> > +                                v->buffer, RINGBUFFER_SIZE,
> > +                                index & RINGBUFFER_MASK,
> > +                                SPA_PTROFF(p, offs, void), n_bytes);
> > +    index += n_bytes;
> > +    spa_ringbuffer_write_update(&v->ring, index);
> > +
> > +    /* queue the buffer for playback */
> > +    pw_stream_queue_buffer(v->stream, b);
> > +}
> > +
> > +static void
> > +on_stream_state_changed(void *_data, enum pw_stream_state old,
> > +                        enum pw_stream_state state, const char *error)
> > +{
> > +    PWVoice *v = (PWVoice *) _data;
> > +
> > +    printf("stream state: \"%s\"\n", pw_stream_state_as_string(state));
> > +
> > +    switch (state) {
> > +    case PW_STREAM_STATE_ERROR:
> > +    case PW_STREAM_STATE_UNCONNECTED:
> > +        {
> > +            break;
> > +        }
> > +    case PW_STREAM_STATE_PAUSED:
> > +        printf("node id: %d\n", pw_stream_get_node_id(v->stream));
> > +        break;
> > +    case PW_STREAM_STATE_CONNECTING:
> > +    case PW_STREAM_STATE_STREAMING:
> > +        break;
> > +    }
> > +}
> > +
> > +static const struct pw_stream_events capture_stream_events = {
> > +    PW_VERSION_STREAM_EVENTS,
> > +    .destroy = stream_destroy,
> > +    .state_changed = on_stream_state_changed,
> > +    .process = capture_on_process
> > +};
> > +
> > +static const struct pw_stream_events playback_stream_events = {
> > +    PW_VERSION_STREAM_EVENTS,
> > +    .destroy = stream_destroy,
> > +    .state_changed = on_stream_state_changed,
> > +    .process = playback_on_process
> > +};
> > +
> > +static size_t
> > +qpw_read(HWVoiceIn *hw, void *data, size_t len)
> > +{
> > +    PWVoiceIn *pw = (PWVoiceIn *) hw;
> > +    PWVoice *v = &pw->v;
> > +    pwaudio *c = v->g;
> > +    const char *error = NULL;
> > +    size_t l;
> > +    int32_t avail;
> > +    uint32_t index;
> > +
> > +    pw_thread_loop_lock(c->thread_loop);
> > +    if (pw_stream_get_state(v->stream, &error) !=
> PW_STREAM_STATE_STREAMING) {
> > +        /* wait for stream to become ready */
> > +        l = 0;
> > +        goto done_unlock;
> > +    }
> > +    /* get no of available bytes to read data from buffer */
> > +    avail = spa_ringbuffer_get_read_index(&v->ring, &index);
> > +
> > +    if (avail < (int32_t) len) {
> > +        len = avail;
> > +    }
> > +
> > +    spa_ringbuffer_read_data(&v->ring,
> > +                             v->buffer, RINGBUFFER_SIZE,
> > +                             index & RINGBUFFER_MASK, data, len);
> > +    index += len;
> > +    spa_ringbuffer_read_update(&v->ring, index);
> > +    l = len;
> > +
> > +done_unlock:
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +    return l;
> > +}
> > +
> > +static size_t
> > +qpw_write(HWVoiceOut *hw, void *data, size_t len)
> > +{
> > +    PWVoiceOut *pw = (PWVoiceOut *) hw;
> > +    PWVoice *v = &pw->v;
> > +    pwaudio *c = v->g;
> > +    const char *error = NULL;
> > +    size_t l;
> > +    int32_t filled, avail;
> > +    uint32_t index;
> > +
> > +    pw_thread_loop_lock(c->thread_loop);
> > +    if (pw_stream_get_state(v->stream, &error) !=
> PW_STREAM_STATE_STREAMING) {
> > +        /* wait for stream to become ready */
> > +        l = 0;
> > +        goto done_unlock;
> > +    }
> > +    filled = spa_ringbuffer_get_write_index(&v->ring, &index);
> > +
> > +    avail = 512 * v->frame_size * 3 - filled;
>
> I would not use literals for period size and number of periods directly in
> code. Better use macros or constants instead.
>
> > +
> > +    pw_log_debug("%u %u %u %zu", filled, avail, index, len);
> > +
> > +    if (len > avail) {
> > +        len = avail;
> > +    }
> > +
> > +    if (filled < 0) {
> > +        pw_log_warn("%p: underrun write:%u filled:%d", pw, index,
> filled);
> > +    } else {
> > +        if ((uint32_t) filled + len > RINGBUFFER_SIZE) {
> > +            pw_log_warn("%p: overrun write:%u filled:%d + size:%zu >
> max:%u",
> > +            pw, index, filled, len, RINGBUFFER_SIZE);
> > +        }
> > +    }
> > +
> > +    spa_ringbuffer_write_data(&v->ring,
> > +                                v->buffer, RINGBUFFER_SIZE,
> > +                                index & RINGBUFFER_MASK, data, len);
> > +    index += len;
> > +    spa_ringbuffer_write_update(&v->ring, index);
> > +    l = len;
> > +
> > +done_unlock:
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +    return l;
> > +}
> > +
> > +static int
> > +audfmt_to_pw(AudioFormat fmt, int endianness)
> > +{
> > +    int format;
> > +
> > +    switch (fmt) {
> > +    case AUDIO_FORMAT_S8:
> > +        format = SPA_AUDIO_FORMAT_S8;
> > +        break;
> > +    case AUDIO_FORMAT_U8:
> > +        format = SPA_AUDIO_FORMAT_U8;
> > +        break;
> > +    case AUDIO_FORMAT_S16:
> > +        format = endianness ? SPA_AUDIO_FORMAT_S16_BE :
> SPA_AUDIO_FORMAT_S16_LE;
> > +        break;
> > +    case AUDIO_FORMAT_U16:
> > +        format = endianness ? SPA_AUDIO_FORMAT_U16_BE :
> SPA_AUDIO_FORMAT_U16_LE;
> > +        break;
> > +    case AUDIO_FORMAT_S32:
> > +        format = endianness ? SPA_AUDIO_FORMAT_S32_BE :
> SPA_AUDIO_FORMAT_S32_LE;
> > +        break;
> > +    case AUDIO_FORMAT_U32:
> > +        format = endianness ? SPA_AUDIO_FORMAT_U32_BE :
> SPA_AUDIO_FORMAT_U32_LE;
> > +        break;
> > +    case AUDIO_FORMAT_F32:
> > +        format = endianness ? SPA_AUDIO_FORMAT_F32_BE :
> SPA_AUDIO_FORMAT_F32_LE;
> > +        break;
> > +    default:
> > +        dolog("Internal logic error: Bad audio format %d\n", fmt);
> > +        format = SPA_AUDIO_FORMAT_U8;
> > +        break;
> > +    }
> > +    return format;
> > +}
> > +
> > +static AudioFormat
> > +pw_to_audfmt(enum spa_audio_format fmt, int *endianness,
> > +             uint32_t *frame_size)
> > +{
> > +    switch (fmt) {
> > +    case SPA_AUDIO_FORMAT_S8:
> > +        *frame_size = 1;
> > +        return AUDIO_FORMAT_S8;
> > +    case SPA_AUDIO_FORMAT_U8:
> > +        *frame_size = 1;
> > +        return AUDIO_FORMAT_U8;
> > +    case SPA_AUDIO_FORMAT_S16_BE:
> > +        *frame_size = 2;
> > +        *endianness = 1;
> > +        return AUDIO_FORMAT_S16;
> > +    case SPA_AUDIO_FORMAT_S16_LE:
> > +        *frame_size = 2;
> > +        *endianness = 0;
> > +        return AUDIO_FORMAT_S16;
> > +    case SPA_AUDIO_FORMAT_U16_BE:
> > +        *frame_size = 2;
> > +        *endianness = 1;
> > +        return AUDIO_FORMAT_U16;
> > +    case SPA_AUDIO_FORMAT_U16_LE:
> > +        *frame_size = 2;
> > +        *endianness = 0;
> > +        return AUDIO_FORMAT_U16;
> > +    case SPA_AUDIO_FORMAT_S32_BE:
> > +        *frame_size = 4;
> > +        *endianness = 1;
> > +        return AUDIO_FORMAT_S32;
> > +    case SPA_AUDIO_FORMAT_S32_LE:
> > +        *frame_size = 4;
> > +        *endianness = 0;
> > +        return AUDIO_FORMAT_S32;
> > +    case SPA_AUDIO_FORMAT_U32_BE:
> > +        *frame_size = 4;
> > +        *endianness = 1;
> > +        return AUDIO_FORMAT_U32;
> > +    case SPA_AUDIO_FORMAT_U32_LE:
> > +        *frame_size = 4;
> > +        *endianness = 0;
> > +        return AUDIO_FORMAT_U32;
> > +    case SPA_AUDIO_FORMAT_F32_BE:
> > +        *frame_size = 4;
> > +        *endianness = 1;
> > +        return AUDIO_FORMAT_F32;
> > +    case SPA_AUDIO_FORMAT_F32_LE:
> > +        *frame_size = 4;
> > +        *endianness = 0;
> > +        return AUDIO_FORMAT_F32;
> > +    default:
> > +        *frame_size = 1;
> > +        dolog("Internal logic error: Bad spa_audio_format %d\n", fmt);
> > +        return AUDIO_FORMAT_U8;
> > +    }
> > +}
> > +
> > +static int
> > +create_stream(pwaudio *c, PWVoice *v, const char *name)
> > +{
> > +    int res;
> > +    uint32_t n_params;
> > +    const struct spa_pod *params[2];
> > +    uint8_t buffer[1024];
> > +    struct spa_pod_builder b;
> > +
> > +    v->stream = pw_stream_new(c->core, name, NULL);
> > +
> > +    if (v->stream == NULL) {
> > +        res = -errno;
> > +        goto error;
> > +    }
> > +
> > +    if (v->mode == MODE_SOURCE) {
> > +        pw_stream_add_listener(v->stream,
> > +                            &v->stream_listener,
> &capture_stream_events, v);
> > +    } else {
> > +        pw_stream_add_listener(v->stream,
> > +                            &v->stream_listener,
> &playback_stream_events, v);
> > +    }
> > +
> > +    n_params = 0;
> > +    spa_pod_builder_init(&b, buffer, sizeof(buffer));
> > +    params[n_params++] = spa_format_audio_raw_build(&b,
> > +                            SPA_PARAM_EnumFormat,
> > +                            &v->info);
> > +
> > +    /* connect the stream to a sink or source */
> > +    res = pw_stream_connect(v->stream,
> > +                            v->mode ==
> > +                            MODE_SOURCE ? PW_DIRECTION_INPUT :
> > +                            PW_DIRECTION_OUTPUT, PW_ID_ANY,
> > +                            PW_STREAM_FLAG_AUTOCONNECT |
> > +                            PW_STREAM_FLAG_MAP_BUFFERS |
> > +                            PW_STREAM_FLAG_RT_PROCESS, params,
> n_params);
> > +    if (res < 0) {
> > +        goto error;
> > +    }
> > +
> > +    return 0;
> > +error:
> > +    return res;
> > +}
> > +
> > +static void
> > +pw_destroy(pwaudio *c)
> > +{
> > +    if (c->thread_loop) {
> > +        pw_thread_loop_stop(c->thread_loop);
> > +    }
> > +    if (c->core) {
> > +        pw_core_disconnect(c->core);
> > +    }
> > +
> > +    free(c);
>
> g_free(c);
>
> > +}
> > +
> > +static int
> > +qpw_stream_new(pwaudio *c, PWVoice *v, const char *name)
> > +{
> > +    int r;
> > +
> > +    pw_thread_loop_lock(c->thread_loop);
> > +
> > +    switch (v->info.channels) {
> > +    case 8:
> > +        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> > +        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> > +        v->info.position[2] = SPA_AUDIO_CHANNEL_FC;
> > +        v->info.position[3] = SPA_AUDIO_CHANNEL_LFE;
> > +        v->info.position[4] = SPA_AUDIO_CHANNEL_RL;
> > +        v->info.position[5] = SPA_AUDIO_CHANNEL_RR;
> > +        v->info.position[6] = SPA_AUDIO_CHANNEL_SL;
> > +        v->info.position[7] = SPA_AUDIO_CHANNEL_SR;
> > +        break;
> > +    case 6:
> > +        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> > +        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> > +        v->info.position[2] = SPA_AUDIO_CHANNEL_FC;
> > +        v->info.position[3] = SPA_AUDIO_CHANNEL_LFE;
> > +        v->info.position[4] = SPA_AUDIO_CHANNEL_RL;
> > +        v->info.position[5] = SPA_AUDIO_CHANNEL_RR;
> > +        break;
> > +    case 5:
> > +        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> > +        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> > +        v->info.position[2] = SPA_AUDIO_CHANNEL_FC;
> > +        v->info.position[3] = SPA_AUDIO_CHANNEL_LFE;
> > +        v->info.position[4] = SPA_AUDIO_CHANNEL_RC;
> > +        break;
> > +    case 4:
> > +        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> > +        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> > +        v->info.position[2] = SPA_AUDIO_CHANNEL_FC;
> > +        v->info.position[3] = SPA_AUDIO_CHANNEL_RC;
> > +        break;
> > +    case 3:
> > +        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> > +        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> > +        v->info.position[2] = SPA_AUDIO_CHANNEL_LFE;
> > +        break;
> > +    case 2:
> > +        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> > +        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> > +        break;
> > +    case 1:
> > +        v->info.position[0] = SPA_AUDIO_CHANNEL_MONO;
> > +        break;
> > +    default:
> > +        for (size_t i = 0; i < v->info.channels; i++) {
> > +            v->info.position[i] = SPA_AUDIO_CHANNEL_UNKNOWN;
> > +        }
> > +        break;
> > +    }
> > +
> > +    /* create a new unconnected pwstream */
> > +    r = create_stream(c, v, name);
> > +    if (r < 0) {
> > +        goto error;
> > +    }
> > +
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +    return r;
> > +
> > +error:
> > +    AUD_log(AUDIO_CAP, "Failed to create stream.");
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +    pw_destroy(c);
> > +    return -1;
> > +}
> > +
> > +static int
> > +qpw_init_out(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque)
> > +{
> > +    PWVoiceOut *pw = (PWVoiceOut *) hw;
> > +    PWVoice *v = &pw->v;
> > +    struct audsettings obt_as = *as;
> > +    pwaudio *c = v->g = drv_opaque;
> > +    AudiodevPipewireOptions *popts = &c->dev->u.pipewire;
> > +    AudiodevPipewirePerDirectionOptions *ppdo = popts->out;
> > +    int r;
> > +    v->enabled = false;
> > +
> > +    v->mode = MODE_SINK;
> > +
> > +    pw_thread_loop_lock(c->thread_loop);
> > +
> > +    v->info.format = audfmt_to_pw(as->fmt, as->endianness);
> > +    v->info.channels = as->nchannels;
> > +    v->info.rate = as->freq;
> > +
> > +    obt_as.fmt =
> > +        pw_to_audfmt(v->info.format, &obt_as.endianness,
> &v->frame_size);
> > +    v->frame_size *= as->nchannels;
> > +
> > +    /* call the function that creates a new stream for playback */
> > +    r = qpw_stream_new(c, v, ppdo->stream_name ? : c->dev->id);
> > +    if (r < 0) {
> > +        pw_log_error("qpw_stream_new for playback failed\n ");
> > +        goto fail;
> > +    }
> > +
> > +    /* report the audio format we support */
> > +    audio_pcm_init_info(&hw->info, &obt_as);
> > +
> > +    /* report the buffer size to qemu */
> > +    hw->samples = 512;
> > +
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +    return 0;
> > +fail:
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +    return -1;
> > +}
> > +
> > +static int
> > +qpw_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
> > +{
> > +    PWVoiceIn *pw = (PWVoiceIn *) hw;
> > +    PWVoice *v = &pw->v;
> > +    struct audsettings obt_as = *as;
> > +    pwaudio *c = v->g = drv_opaque;
> > +    AudiodevPipewireOptions *popts = &c->dev->u.pipewire;
> > +    AudiodevPipewirePerDirectionOptions *ppdo = popts->in;
> > +    int r;
> > +    v->enabled = false;
> > +
> > +    v->mode = MODE_SOURCE;
> > +    pw_thread_loop_lock(c->thread_loop);
> > +
> > +    v->info.format = audfmt_to_pw(as->fmt, as->endianness);
> > +    v->info.channels = as->nchannels;
> > +    v->info.rate = as->freq;
> > +
> > +    obt_as.fmt =
> > +        pw_to_audfmt(v->info.format, &obt_as.endianness,
> &v->frame_size);
> > +    v->frame_size *= as->nchannels;
> > +
> > +    /* call the function that creates a new stream for recording */
> > +    r = qpw_stream_new(c, v, ppdo->stream_name ? : c->dev->id);
> > +    if (r < 0) {
> > +        pw_log_error("qpw_stream_new for recording failed\n ");
> > +        goto fail;
> > +    }
> > +
> > +    /* report the audio format we support */
> > +    audio_pcm_init_info(&hw->info, &obt_as);
> > +
> > +    /* report the buffer size to qemu */
> > +    hw->samples = 512;
> > +
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +    return 0;
> > +fail:
> > +    pw_thread_loop_unlock(c->thread_loop);
> > +    return -1;
> > +}
> > +
> > +static void
> > +qpw_fini_out(HWVoiceOut *hw)
> > +{
> > +    PWVoiceOut *pw = (PWVoiceOut *) hw;
> > +    PWVoice *v = &pw->v;
> > +
> > +    if (v->stream) {
> > +        pwaudio *c = v->g;
> > +        pw_thread_loop_lock(c->thread_loop);
> > +        pw_stream_destroy(v->stream);
> > +        v->stream = NULL;
> > +        pw_thread_loop_unlock(c->thread_loop);
> > +    }
> > +}
> > +
> > +static void
> > +qpw_fini_in(HWVoiceIn *hw)
> > +{
> > +    PWVoiceIn *pw = (PWVoiceIn *) hw;
> > +    PWVoice *v = &pw->v;
> > +
> > +    if (v->stream) {
> > +        pwaudio *c = v->g;
> > +        pw_thread_loop_lock(c->thread_loop);
> > +        pw_stream_destroy(v->stream);
> > +        v->stream = NULL;
> > +        pw_thread_loop_unlock(c->thread_loop);
> > +    }
> > +}
> > +
> > +static void
> > +qpw_enable_out(HWVoiceOut *hw, bool enable)
> > +{
> > +    PWVoiceOut *po = (PWVoiceOut *) hw;
> > +    PWVoice *v = &po->v;
> > +    v->enabled = enable;
> > +}
> > +
> > +static void
> > +qpw_enable_in(HWVoiceIn *hw, bool enable)
> > +{
> > +    PWVoiceIn *pi = (PWVoiceIn *) hw;
> > +    PWVoice *v = &pi->v;
> > +    v->enabled = enable;
> > +}
> > +
> > +static void
> > +on_core_error(void *data, uint32_t id, int seq, int res, const char
> *message)
> > +{
> > +    pwaudio *pw = data;
> > +
> > +    pw_log_warn("error id:%u seq:%d res:%d (%s): %s",
> > +                id, seq, res, spa_strerror(res), message);
> > +
> > +    pw_thread_loop_signal(pw->thread_loop, FALSE);
> > +}
> > +
> > +static void
> > +on_core_done(void *data, uint32_t id, int seq)
> > +{
> > +    pwaudio *pw = data;
> > +    if (id == PW_ID_CORE) {
> > +        pw->seq = seq;
> > +        pw_thread_loop_signal(pw->thread_loop, FALSE);
> > +    }
> > +}
> > +
> > +static const struct pw_core_events core_events = {
> > +    PW_VERSION_CORE_EVENTS,
> > +    .done = on_core_done,
> > +    .error = on_core_error,
> > +};
> > +
> > +static void *
> > +qpw_audio_init(Audiodev *dev)
> > +{
> > +    pwaudio *pw;
> > +    pw = g_new0(pwaudio, 1);
> > +    pw_init(NULL, NULL);
> > +
> > +    AudiodevPipewireOptions *popts;
> > +    AUD_log(AUDIO_CAP, "Initialize PW context\n");
> > +    assert(dev->driver == AUDIODEV_DRIVER_PIPEWIRE);
> > +    popts = &dev->u.pipewire;
> > +
> > +    if (!popts->has_latency) {
> > +        popts->has_latency = true;
> > +        popts->latency = 44100;
> > +    }
>
> Why 44ms?
>
> > +
> > +    pw->dev = dev;
> > +    pw->thread_loop = pw_thread_loop_new("Pipewire thread loop", NULL);
> > +    if (pw->thread_loop == NULL) {
> > +        goto fail;
> > +    }
> > +    pw->context =
> > +        pw_context_new(pw_thread_loop_get_loop(pw->thread_loop), NULL,
> 0);
> > +
> > +    if (pw_thread_loop_start(pw->thread_loop) < 0) {
> > +        goto fail;
> > +    }
> > +
> > +    pw_thread_loop_lock(pw->thread_loop);
> > +
> > +    pw->core = pw_context_connect(pw->context, NULL, 0);
> > +    if (pw->core == NULL) {
> > +        goto fail;
> > +    }
> > +
> > +    pw_core_add_listener(pw->core, &pw->core_listener, &core_events,
> pw);
> > +
> > +    pw_thread_loop_unlock(pw->thread_loop);
> > +
> > +    return pw;
> > +
> > +fail:
> > +    AUD_log(AUDIO_CAP, "Failed to initialize PW context");
> > +    pw_thread_loop_unlock(pw->thread_loop);
> > +    pw_context_destroy(pw->context);
> > +    pw_thread_loop_destroy(pw->thread_loop);
> > +    g_free(pw);
> > +    return NULL;
> > +}
> > +
> > +static void
> > +qpw_audio_fini(void *opaque)
> > +{
> > +    pwaudio *pw = opaque;
> > +
> > +    pw_thread_loop_stop(pw->thread_loop);
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
> > +static struct audio_pcm_ops qpw_pcm_ops = {
> > +    .init_out = qpw_init_out,
> > +    .fini_out = qpw_fini_out,
> > +    .write = qpw_write,
> > +    .buffer_get_free = audio_generic_buffer_get_free,
> > +    .run_buffer_out = audio_generic_run_buffer_out,
> > +    .enable_out = qpw_enable_out,
> > +
> > +    .init_in = qpw_init_in,
> > +    .fini_in = qpw_fini_in,
> > +    .read = qpw_read,
> > +    .run_buffer_in = audio_generic_run_buffer_in,
> > +    .enable_in = qpw_enable_in
> > +};
> > +
> > +static struct audio_driver pw_audio_driver = {
> > +    .name = "pipewire",
> > +    .descr = "http://www.pipewire.org/",
> > +    .init = qpw_audio_init,
> > +    .fini = qpw_audio_fini,
> > +    .pcm_ops = &qpw_pcm_ops,
> > +    .can_be_default = 1,
> > +    .max_voices_out = INT_MAX,
> > +    .max_voices_in = INT_MAX,
> > +    .voice_size_out = sizeof(PWVoiceOut),
> > +    .voice_size_in = sizeof(PWVoiceIn),
> > +};
> > +
> > +static void
> > +register_audio_pw(void)
> > +{
> > +    audio_driver_register(&pw_audio_driver);
> > +}
> > +
> > +type_init(register_audio_pw);
> > diff --git a/meson.build b/meson.build
> > index a76c855312..686fdd5b81 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -734,6 +734,11 @@ if not get_option('jack').auto() or have_system
> >    jack = dependency('jack', required: get_option('jack'),
> >                      method: 'pkg-config', kwargs: static_kwargs)
> >  endif
> > +pipewire = not_found
> > +if not get_option('pipewire').auto() or (targetos == 'linux' and
> have_system)
> > +  pipewire = dependency('libpipewire-0.3', required:
> get_option('pipewire'),
> > +                    method: 'pkg-config', kwargs: static_kwargs)
> > +endif
> >  sndio = not_found
> >  if not get_option('sndio').auto() or have_system
> >    sndio = dependency('sndio', required: get_option('sndio'),
> > @@ -1671,6 +1676,7 @@ if have_system
> >      'jack': jack.found(),
> >      'oss': oss.found(),
> >      'pa': pulse.found(),
> > +    'pipewire': pipewire.found(),
> >      'sdl': sdl.found(),
> >      'sndio': sndio.found(),
> >    }
> > @@ -3949,6 +3955,7 @@ endif
> >  if targetos == 'linux'
> >    summary_info += {'ALSA support':    alsa}
> >    summary_info += {'PulseAudio support': pulse}
> > +  summary_info += {'Pipewire support':   pipewire}
> >  endif
> >  summary_info += {'JACK support':      jack}
> >  summary_info += {'brlapi support':    brlapi}
> > diff --git a/meson_options.txt b/meson_options.txt
> > index 7e5801db90..1b7847250d 100644
> > --- a/meson_options.txt
> > +++ b/meson_options.txt
> > @@ -21,7 +21,7 @@ option('tls_priority', type : 'string', value :
> 'NORMAL',
> >  option('default_devices', type : 'boolean', value : true,
> >         description: 'Include a default selection of devices in
> emulators')
> >  option('audio_drv_list', type: 'array', value: ['default'],
> > -       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack',
> 'oss', 'pa', 'sdl', 'sndio'],
> > +       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack',
> 'oss', 'pa', 'pipewire', 'sdl', 'sndio'],
> >         description: 'Set audio driver list')
> >  option('block_drv_rw_whitelist', type : 'string', value : '',
> >         description: 'set block driver read-write whitelist (by default
> affects only QEMU, not tools like qemu-img)')
> > @@ -255,6 +255,8 @@ option('oss', type: 'feature', value: 'auto',
> >         description: 'OSS sound support')
> >  option('pa', type: 'feature', value: 'auto',
> >         description: 'PulseAudio sound support')
> > +option('pipewire', type: 'feature', value: 'auto',
> > +       description: 'Pipewire sound support')
> >  option('sndio', type: 'feature', value: 'auto',
> >         description: 'sndio sound support')
> >
> > diff --git a/qapi/audio.json b/qapi/audio.json
> > index 4e54c00f51..b872e9f10d 100644
> > --- a/qapi/audio.json
> > +++ b/qapi/audio.json
> > @@ -324,6 +324,48 @@
> >      '*out':    'AudiodevPaPerDirectionOptions',
> >      '*server': 'str' } }
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
> > +#               instances (default: audiodev's id, since 7.1)
> > +#
> > +#
> > +# Since: 7.2
> > +##
> > +{ 'struct': 'AudiodevPipewirePerDirectionOptions',
> > +  'base': 'AudiodevPerDirectionOptions',
> > +  'data': {
> > +    '*name': 'str',
> > +    '*stream-name': 'str' } }
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
> > +# @latency: add latency to playback in microseconds
> > +#           (default 44100)
> > +#
> > +# Since: 7.2
> > +##
> > +{ 'struct': 'AudiodevPipewireOptions',
> > +  'data': {
> > +    '*in':     'AudiodevPipewirePerDirectionOptions',
> > +    '*out':    'AudiodevPipewirePerDirectionOptions',
> > +    '*latency': 'uint32' } }
> > +
> >  ##
> >  # @AudiodevSdlPerDirectionOptions:
> >  #
> > @@ -416,6 +458,7 @@
> >              { 'name': 'jack', 'if': 'CONFIG_AUDIO_JACK' },
> >              { 'name': 'oss', 'if': 'CONFIG_AUDIO_OSS' },
> >              { 'name': 'pa', 'if': 'CONFIG_AUDIO_PA' },
> > +            { 'name': 'pipewire', 'if': 'CONFIG_AUDIO_PIPEWIRE' },
> >              { 'name': 'sdl', 'if': 'CONFIG_AUDIO_SDL' },
> >              { 'name': 'sndio', 'if': 'CONFIG_AUDIO_SNDIO' },
> >              { 'name': 'spice', 'if': 'CONFIG_SPICE' },
> > @@ -456,6 +499,8 @@
> >                     'if': 'CONFIG_AUDIO_OSS' },
> >      'pa':        { 'type': 'AudiodevPaOptions',
> >                     'if': 'CONFIG_AUDIO_PA' },
> > +    'pipewire':  { 'type': 'AudiodevPipewireOptions',
> > +                   'if': 'CONFIG_AUDIO_PIPEWIRE' },
> >      'sdl':       { 'type': 'AudiodevSdlOptions',
> >                     'if': 'CONFIG_AUDIO_SDL' },
> >      'sndio':     { 'type': 'AudiodevSndioOptions',
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 88e93c6103..bde4830fab 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -779,6 +779,11 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
> >      "                in|out.name= source/sink device name\n"
> >      "                in|out.latency= desired latency in microseconds\n"
> >  #endif
> > +#ifdef CONFIG_AUDIO_PIPEWIRE
> > +    "-audiodev pipewire,id=id[,prop[=value][,...]]\n"
> > +    "                in|out.name= source/sink device name\n"
> > +    "                latency= desired latency in microseconds\n"
> > +#endif
> >  #ifdef CONFIG_AUDIO_SDL
> >      "-audiodev sdl,id=id[,prop[=value][,...]]\n"
> >      "                in|out.buffer-count= number of buffers\n"
> > @@ -942,6 +947,18 @@ SRST
> >          Desired latency in microseconds. The PulseAudio server will try
> >          to honor this value but actual latencies may be lower or higher.
> >
> > +``-audiodev pipewire,id=id[,prop[=value][,...]]``
> > +    Creates a backend using Pipewire. This backend is available on
> > +    most systems.
> > +
> > +    Pipewire specific options are:
> > +
> > +    ``latency=latency``
> > +        Add extra latency to playback in microseconds
> > +
> > +    ``in|out.name=sink``
> > +        Use the specified source/sink for recording/playback.
> > +
> >  ``-audiodev sdl,id=id[,prop[=value][,...]]``
> >      Creates a backend using SDL. This backend is available on most
> >      systems, but you should use your platform's native backend if
> > diff --git a/scripts/meson-buildoptions.sh
> b/scripts/meson-buildoptions.sh
> > index 180c11665a..d9f6525346 100644
> > --- a/scripts/meson-buildoptions.sh
> > +++ b/scripts/meson-buildoptions.sh
> > @@ -1,7 +1,8 @@
> >  # This file is generated by meson-buildoptions.py, do not edit!
> >  meson_options_help() {
> > -  printf "%s\n" '  --audio-drv-list=CHOICES Set audio driver list
> [default] (choices: alsa/co'
> > -  printf "%s\n" '
>  reaudio/default/dsound/jack/oss/pa/sdl/sndio)'
> > +  printf "%s\n" '  --audio-drv-list=CHOICES Set audio driver list
> [default] (choices: al'
> > +  printf "%s\n" '
>  sa/coreaudio/default/dsound/jack/oss/pa/'
> > +  printf "%s\n" '                           pipewire/sdl/sndio)'
> >    printf "%s\n" '  --block-drv-ro-whitelist=VALUE'
> >    printf "%s\n" '                           set block driver read-only
> whitelist (by default'
> >    printf "%s\n" '                           affects only QEMU, not
> tools like qemu-img)'
> > @@ -135,6 +136,7 @@ meson_options_help() {
> >    printf "%s\n" '  oss             OSS sound support'
> >    printf "%s\n" '  pa              PulseAudio sound support'
> >    printf "%s\n" '  parallels       parallels image format support'
> > +  printf "%s\n" '  pipewire        Pipewire sound support'
> >    printf "%s\n" '  png             PNG support with libpng'
> >    printf "%s\n" '  pvrdma          Enable PVRDMA support'
> >    printf "%s\n" '  qcow1           qcow1 image format support'
> > @@ -370,6 +372,8 @@ _meson_option_parse() {
> >      --disable-pa) printf "%s" -Dpa=disabled ;;
> >      --enable-parallels) printf "%s" -Dparallels=enabled ;;
> >      --disable-parallels) printf "%s" -Dparallels=disabled ;;
> > +    --enable-pipewire) printf "%s" -Dpipewire=enabled ;;
> > +    --disable-pipewire) printf "%s" -Dpipewire=disabled ;;
> >      --with-pkgversion=*) quote_sh "-Dpkgversion=$2" ;;
> >      --enable-png) printf "%s" -Dpng=enabled ;;
> >      --disable-png) printf "%s" -Dpng=disabled ;;
> >
>
>
>

--0000000000005a716105f4d5e3c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">BUFFER_S=
AMPLES is not used anywhere, and in code you are using 512 as literals<br>
instead.</blockquote><div>That was an oversight indeed, It&#39;s intended u=
se was removed.=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div>s/buffer/ringbuffer/ maybe?</div></blockquote><div>I =
think the naming convention &#39;buffer&#39; is good.</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div>I would not use liter=
als for period size and number of periods directly in<br>
code. Better use macros or constants instead.</div></blockquote><div>Noted,=
 thanks. <br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div>Why exactly 4k?</div></blockquote><div>For playback streams=
, this size allows for more efficient streaming of audio data, as smaller c=
hunks can lead to inaccuracies in sound quality. <br></div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div>Why 44ms?</div></bloc=
kquote><div>=C2=A0Thanks for spotting that, I had set its calculation to be=
 Hz, because the default rate is between 44kHz to 48kHz, when actually the =
latency should be low as ~10ms latency (256 /48000 Hz). I would change that=
 to 15ms which is fair for what a generic hardware can handle. BTW there&#3=
9;s also the parameter to set the latency to desired value.<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Feb 16, 2023 at 12:41 PM Christian Schoenebeck &lt;<a href=3D"mailto:qemu=
_oss@crudebyte.com" target=3D"_blank">qemu_oss@crudebyte.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thursday, Fe=
bruary 16, 2023 9:25:44 AM CET Dorinda Bassey wrote:<br>
&gt; This commit adds a new audiodev backend to allow QEMU to use Pipewire =
as both an audio sink and source.<br>
&gt; <br>
<br>
Please wrap commit log.<br>
<br>
&gt; Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dbassey@redhat.com=
" target=3D"_blank">dbassey@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; v2:<br>
&gt; * Shorten commit message<br>
&gt; * fix copyright ownership and authour<br>
&gt; * use QEMU standard of 4 space indentation<br>
&gt; * verbose use of pipewire instead pf pw<br>
&gt; <br>
&gt;=C2=A0 audio/audio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 audio/audio_template.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
4 +<br>
&gt;=C2=A0 audio/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 audio/pwaudio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 818 ++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br>
&gt;=C2=A0 meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 qapi/audio.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 45 ++<br>
&gt;=C2=A0 qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 17 +<br>
&gt;=C2=A0 scripts/meson-buildoptions.sh |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 9 files changed, 904 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 create mode 100644 audio/pwaudio.c<br>
&gt; <br>
&gt; diff --git a/audio/audio.c b/audio/audio.c<br>
&gt; index 4290309d18..aa55e41ad8 100644<br>
&gt; --- a/audio/audio.c<br>
&gt; +++ b/audio/audio.c<br>
&gt; @@ -2069,6 +2069,9 @@ void audio_create_pdos(Audiodev *dev)<br>
&gt;=C2=A0 #ifdef CONFIG_AUDIO_PA<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CASE(PA, pa, Pa);<br>
&gt;=C2=A0 #endif<br>
&gt; +#ifdef CONFIG_AUDIO_PIPEWIRE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CASE(PIPEWIRE, pipewire, Pipewire);<br>
&gt; +#endif<br>
&gt;=C2=A0 #ifdef CONFIG_AUDIO_SDL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CASE(SDL, sdl, Sdl);<br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/audio/audio_template.h b/audio/audio_template.h<br>
&gt; index 42b4712acb..0f02afb921 100644<br>
&gt; --- a/audio/audio_template.h<br>
&gt; +++ b/audio/audio_template.h<br>
&gt; @@ -355,6 +355,10 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_,=
 TYPE)(Audiodev *dev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case AUDIODEV_DRIVER_PA:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return qapi_AudiodevPaPerDirectionOp=
tions_base(dev-&gt;u.pa.TYPE);<br>
&gt;=C2=A0 #endif<br>
&gt; +#ifdef CONFIG_AUDIO_PIPEWIRE<br>
&gt; +=C2=A0 =C2=A0 case AUDIODEV_DRIVER_PIPEWIRE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qapi_AudiodevPipewirePerDirectionO=
ptions_base(dev-&gt;u.pipewire.TYPE);<br>
&gt; +#endif<br>
&gt;=C2=A0 #ifdef CONFIG_AUDIO_SDL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case AUDIODEV_DRIVER_SDL:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return qapi_AudiodevSdlPerDirectionO=
ptions_base(dev-&gt;u.sdl.TYPE);<br>
&gt; diff --git a/audio/meson.build b/audio/meson.build<br>
&gt; index 0722224ba9..65a49c1a10 100644<br>
&gt; --- a/audio/meson.build<br>
&gt; +++ b/audio/meson.build<br>
&gt; @@ -19,6 +19,7 @@ foreach m : [<br>
&gt;=C2=A0 =C2=A0 [&#39;sdl&#39;, sdl, files(&#39;sdlaudio.c&#39;)],<br>
&gt;=C2=A0 =C2=A0 [&#39;jack&#39;, jack, files(&#39;jackaudio.c&#39;)],<br>
&gt;=C2=A0 =C2=A0 [&#39;sndio&#39;, sndio, files(&#39;sndioaudio.c&#39;)],<=
br>
&gt; +=C2=A0 [&#39;pipewire&#39;, pipewire, files(&#39;pwaudio.c&#39;)],<br=
>
&gt;=C2=A0 =C2=A0 [&#39;spice&#39;, spice, files(&#39;spiceaudio.c&#39;)]<b=
r>
&gt;=C2=A0 ]<br>
&gt;=C2=A0 =C2=A0 if m[1].found()<br>
&gt; diff --git a/audio/pwaudio.c b/audio/pwaudio.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..bb25133414<br>
&gt; --- /dev/null<br>
&gt; +++ b/audio/pwaudio.c<br>
&gt; @@ -0,0 +1,818 @@<br>
&gt; +/*<br>
&gt; + * QEMU Pipewire audio driver<br>
&gt; + *<br>
&gt; + * Copyright (c) 2023 Red Hat Inc.<br>
&gt; + *<br>
&gt; + * Author: Dorinda Bassey=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"ma=
ilto:dbassey@redhat.com" target=3D"_blank">dbassey@redhat.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a copy<br>
&gt; + * of this software and associated documentation files (the &quot;Sof=
tware&quot;), to deal<br>
&gt; + * in the Software without restriction, including without limitation =
the rights<br>
&gt; + * to use, copy, modify, merge, publish, distribute, sublicense, and/=
or sell<br>
&gt; + * copies of the Software, and to permit persons to whom the Software=
 is<br>
&gt; + * furnished to do so, subject to the following conditions:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be inc=
luded in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING FROM,<br>
&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEAL=
INGS IN<br>
&gt; + * THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/module.h&quot;<br>
&gt; +#include &quot;audio.h&quot;<br>
&gt; +#include &lt;errno.h&gt;<br>
&gt; +#include &lt;spa/param/audio/format-utils.h&gt;<br>
&gt; +#include &lt;spa/utils/ringbuffer.h&gt;<br>
&gt; +#include &lt;spa/utils/result.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;pipewire/pipewire.h&gt;<br>
&gt; +<br>
&gt; +#define AUDIO_CAP &quot;pipewire&quot;<br>
&gt; +#define RINGBUFFER_SIZE=C2=A0 =C2=A0 (1u &lt;&lt; 22)<br>
&gt; +#define RINGBUFFER_MASK=C2=A0 =C2=A0 (RINGBUFFER_SIZE - 1)<br>
&gt; +#define BUFFER_SAMPLES=C2=A0 =C2=A0 128<br>
<br>
BUFFER_SAMPLES is not used anywhere, and in code you are using 512 as liter=
als<br>
instead.<br>
<br>
&gt; +<br>
&gt; +#include &quot;audio_int.h&quot;<br>
&gt; +<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 MODE_SINK,<br>
&gt; +=C2=A0 =C2=A0 MODE_SOURCE<br>
&gt; +};<br>
&gt; +<br>
&gt; +typedef struct pwaudio {<br>
&gt; +=C2=A0 =C2=A0 Audiodev *dev;<br>
&gt; +=C2=A0 =C2=A0 struct pw_thread_loop *thread_loop;<br>
&gt; +=C2=A0 =C2=A0 struct pw_context *context;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 struct pw_core *core;<br>
&gt; +=C2=A0 =C2=A0 struct spa_hook core_listener;<br>
&gt; +=C2=A0 =C2=A0 int seq;<br>
&gt; +} pwaudio;<br>
&gt; +<br>
&gt; +typedef struct PWVoice {<br>
&gt; +=C2=A0 =C2=A0 pwaudio *g;<br>
&gt; +=C2=A0 =C2=A0 bool enabled;<br>
&gt; +=C2=A0 =C2=A0 struct pw_stream *stream;<br>
&gt; +=C2=A0 =C2=A0 struct spa_hook stream_listener;<br>
&gt; +=C2=A0 =C2=A0 struct spa_audio_info_raw info;<br>
&gt; +=C2=A0 =C2=A0 uint32_t frame_size;<br>
&gt; +=C2=A0 =C2=A0 struct spa_ringbuffer ring;<br>
&gt; +=C2=A0 =C2=A0 uint8_t buffer[RINGBUFFER_SIZE];<br>
<br>
s/buffer/ringbuffer/ maybe?<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 uint32_t mode;<br>
&gt; +=C2=A0 =C2=A0 struct pw_properties *props;<br>
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
&gt; +=C2=A0 =C2=A0 uint32_t n_frames, req, index, n_bytes;<br>
&gt; +=C2=A0 =C2=A0 int32_t avail;<br>
&gt; +<br>
<br>
if (!v-&gt;stream) {<br>
=C2=A0 =C2=A0 return;<br>
}<br>
<br>
As pw_stream_dequeue_buffer() apparently can&#39;t cope with NULL.<br>
<br>
&gt; +=C2=A0 =C2=A0 /* obtain a buffer to read from */<br>
&gt; +=C2=A0 =C2=A0 b =3D pw_stream_dequeue_buffer(v-&gt;stream);<br>
&gt; +=C2=A0 =C2=A0 if (b =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_warn(&quot;out of buffers: %m&quot=
;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 buf =3D b-&gt;buffer;<br>
&gt; +=C2=A0 =C2=A0 p =3D buf-&gt;datas[0].data;<br>
&gt; +=C2=A0 =C2=A0 if (p =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 req =3D b-&gt;requested * v-&gt;frame_size;<br>
&gt; +=C2=A0 =C2=A0 if (req =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 req =3D 4096 * v-&gt;frame_size;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
Why exactly 4k?<br>
<br>
&gt; +=C2=A0 =C2=A0 n_frames =3D SPA_MIN(req, buf-&gt;datas[0].maxsize);<br=
>
&gt; +=C2=A0 =C2=A0 n_bytes =3D n_frames * v-&gt;frame_size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* get no of available bytes to read data from buffer *=
/<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 avail =3D spa_ringbuffer_get_read_index(&amp;v-&gt;ring=
, &amp;index);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!v-&gt;enabled) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 avail =3D 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (avail =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(p, 0, n_bytes);<br>
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
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 buf-&gt;datas[0].chunk-&gt;offset =3D 0;<br>
&gt; +=C2=A0 =C2=A0 buf-&gt;datas[0].chunk-&gt;stride =3D v-&gt;frame_size;=
<br>
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
<br>
if (!v-&gt;stream) {<br>
=C2=A0 =C2=A0 return;<br>
}<br>
<br>
&gt; +=C2=A0 =C2=A0 /* obtain a buffer */<br>
&gt; +=C2=A0 =C2=A0 b =3D pw_stream_dequeue_buffer(v-&gt;stream);<br>
&gt; +=C2=A0 =C2=A0 if (b =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_warn(&quot;out of buffers: %m&quot=
;);<br>
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
&gt; +=C2=A0 =C2=A0 if (!v-&gt;enabled) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 n_bytes =3D 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (filled &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_warn(&quot;%p: underrun write:%u f=
illed:%d&quot;, p, index, filled);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((uint32_t) filled + n_bytes &gt; RING=
BUFFER_SIZE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_warn(&quot;%p: overr=
un write:%u filled:%d + size:%u &gt; max:%u&quot;,<br>
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
&gt; +on_stream_state_changed(void *_data, enum pw_stream_state old,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 enum pw_stream_state state, const char *error)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D (PWVoice *) _data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 printf(&quot;stream state: \&quot;%s\&quot;\n&quot;, pw=
_stream_state_as_string(state));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (state) {<br>
&gt; +=C2=A0 =C2=A0 case PW_STREAM_STATE_ERROR:<br>
&gt; +=C2=A0 =C2=A0 case PW_STREAM_STATE_UNCONNECTED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 case PW_STREAM_STATE_PAUSED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;node id: %d\n&quot;, pw_stre=
am_get_node_id(v-&gt;stream));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
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
&gt; +static size_t<br>
&gt; +qpw_write(HWVoiceOut *hw, void *data, size_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoiceOut *pw =3D (PWVoiceOut *) hw;<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D &amp;pw-&gt;v;<br>
&gt; +=C2=A0 =C2=A0 pwaudio *c =3D v-&gt;g;<br>
&gt; +=C2=A0 =C2=A0 const char *error =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 size_t l;<br>
&gt; +=C2=A0 =C2=A0 int32_t filled, avail;<br>
&gt; +=C2=A0 =C2=A0 uint32_t index;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 if (pw_stream_get_state(v-&gt;stream, &amp;error) !=3D =
PW_STREAM_STATE_STREAMING) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* wait for stream to become ready */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done_unlock;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 filled =3D spa_ringbuffer_get_write_index(&amp;v-&gt;ri=
ng, &amp;index);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 avail =3D 512 * v-&gt;frame_size * 3 - filled;<br>
<br>
I would not use literals for period size and number of periods directly in<=
br>
code. Better use macros or constants instead.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_log_debug(&quot;%u %u %u %zu&quot;, filled, avail, i=
ndex, len);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (len &gt; avail) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D avail;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (filled &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_warn(&quot;%p: underrun write:%u f=
illed:%d&quot;, pw, index, filled);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((uint32_t) filled + len &gt; RINGBUFF=
ER_SIZE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_warn(&quot;%p: overr=
un write:%u filled:%d + size:%zu &gt; max:%u&quot;,<br>
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
&gt; +=C2=A0 =C2=A0 l =3D len;<br>
&gt; +<br>
&gt; +done_unlock:<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 return l;<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t *frame_size)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 switch (fmt) {<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_S8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *frame_size =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_S8;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_U8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *frame_size =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U8;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_S16_BE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *frame_size =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_S16;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_S16_LE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *frame_size =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_S16;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_U16_BE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *frame_size =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U16;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_U16_LE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *frame_size =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U16;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_S32_BE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *frame_size =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_S32;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_S32_LE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *frame_size =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_S32;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_U32_BE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *frame_size =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U32;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_U32_LE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *frame_size =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U32;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_F32_BE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *frame_size =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_F32;<br>
&gt; +=C2=A0 =C2=A0 case SPA_AUDIO_FORMAT_F32_LE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *frame_size =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *endianness =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_F32;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *frame_size =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dolog(&quot;Internal logic error: Bad spa=
_audio_format %d\n&quot;, fmt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AUDIO_FORMAT_U8;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +create_stream(pwaudio *c, PWVoice *v, const char *name)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int res;<br>
&gt; +=C2=A0 =C2=A0 uint32_t n_params;<br>
&gt; +=C2=A0 =C2=A0 const struct spa_pod *params[2];<br>
&gt; +=C2=A0 =C2=A0 uint8_t buffer[1024];<br>
&gt; +=C2=A0 =C2=A0 struct spa_pod_builder b;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 v-&gt;stream =3D pw_stream_new(c-&gt;core, name, NULL);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (v-&gt;stream =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D -errno;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (v-&gt;mode =3D=3D MODE_SOURCE) {<br>
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
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;mode =3D=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MODE_SOURCE ? PW_DIRECTION_INPUT :<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_DIRECTION_OUTPUT, PW_ID_ANY,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_AUTOCONNECT |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_MAP_BUFFERS |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_RT_PROCESS, params, n_params);<=
br>
&gt; +=C2=A0 =C2=A0 if (res &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +error:<br>
&gt; +=C2=A0 =C2=A0 return res;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +pw_destroy(pwaudio *c)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (c-&gt;thread_loop) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_thread_loop_stop(c-&gt;thread_loop);<b=
r>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 if (c-&gt;core) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_core_disconnect(c-&gt;core);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 free(c);<br>
<br>
g_free(c);<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +qpw_stream_new(pwaudio *c, PWVoice *v, const char *name)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int r;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
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
&gt; +=C2=A0 =C2=A0 r =3D create_stream(c, v, name);<br>
&gt; +=C2=A0 =C2=A0 if (r &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 return r;<br>
&gt; +<br>
&gt; +error:<br>
&gt; +=C2=A0 =C2=A0 AUD_log(AUDIO_CAP, &quot;Failed to create stream.&quot;=
);<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 pw_destroy(c);<br>
&gt; +=C2=A0 =C2=A0 return -1;<br>
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
&gt; +=C2=A0 =C2=A0 v-&gt;enabled =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 v-&gt;mode =3D MODE_SINK;<br>
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
as.endianness, &amp;v-&gt;frame_size);<br>
&gt; +=C2=A0 =C2=A0 v-&gt;frame_size *=3D as-&gt;nchannels;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* call the function that creates a new stream for play=
back */<br>
&gt; +=C2=A0 =C2=A0 r =3D qpw_stream_new(c, v, ppdo-&gt;stream_name ? : c-&=
gt;dev-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 if (r &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;qpw_stream_new for pla=
yback failed\n &quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* report the audio format we support */<br>
&gt; +=C2=A0 =C2=A0 audio_pcm_init_info(&amp;hw-&gt;info, &amp;obt_as);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* report the buffer size to qemu */<br>
&gt; +=C2=A0 =C2=A0 hw-&gt;samples =3D 512;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +fail:<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 return -1;<br>
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
&gt; +=C2=A0 =C2=A0 v-&gt;enabled =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 v-&gt;mode =3D MODE_SOURCE;<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_lock(c-&gt;thread_loop);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 v-&gt;info.format =3D audfmt_to_pw(as-&gt;fmt, as-&gt;e=
ndianness);<br>
&gt; +=C2=A0 =C2=A0 v-&gt;info.channels =3D as-&gt;nchannels;<br>
&gt; +=C2=A0 =C2=A0 v-&gt;info.rate =3D as-&gt;freq;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 obt_as.fmt =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_to_audfmt(v-&gt;info.format, &amp;obt_=
as.endianness, &amp;v-&gt;frame_size);<br>
&gt; +=C2=A0 =C2=A0 v-&gt;frame_size *=3D as-&gt;nchannels;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* call the function that creates a new stream for reco=
rding */<br>
&gt; +=C2=A0 =C2=A0 r =3D qpw_stream_new(c, v, ppdo-&gt;stream_name ? : c-&=
gt;dev-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 if (r &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;qpw_stream_new for rec=
ording failed\n &quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* report the audio format we support */<br>
&gt; +=C2=A0 =C2=A0 audio_pcm_init_info(&amp;hw-&gt;info, &amp;obt_as);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* report the buffer size to qemu */<br>
&gt; +=C2=A0 =C2=A0 hw-&gt;samples =3D 512;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +fail:<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(c-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 return -1;<br>
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
&gt; +=C2=A0 =C2=A0 v-&gt;enabled =3D enable;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +qpw_enable_in(HWVoiceIn *hw, bool enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoiceIn *pi =3D (PWVoiceIn *) hw;<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D &amp;pi-&gt;v;<br>
&gt; +=C2=A0 =C2=A0 v-&gt;enabled =3D enable;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +on_core_error(void *data, uint32_t id, int seq, int res, const char *=
message)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 pwaudio *pw =3D data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_log_warn(&quot;error id:%u seq:%d res:%d (%s): %s&qu=
ot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id, seq, res,=
 spa_strerror(res), message);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_signal(pw-&gt;thread_loop, FALSE);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +on_core_done(void *data, uint32_t id, int seq)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 pwaudio *pw =3D data;<br>
&gt; +=C2=A0 =C2=A0 if (id =3D=3D PW_ID_CORE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw-&gt;seq =3D seq;<br>
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
&gt; +=C2=A0 =C2=A0 pwaudio *pw;<br>
&gt; +=C2=A0 =C2=A0 pw =3D g_new0(pwaudio, 1);<br>
&gt; +=C2=A0 =C2=A0 pw_init(NULL, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 AudiodevPipewireOptions *popts;<br>
&gt; +=C2=A0 =C2=A0 AUD_log(AUDIO_CAP, &quot;Initialize PW context\n&quot;)=
;<br>
&gt; +=C2=A0 =C2=A0 assert(dev-&gt;driver =3D=3D AUDIODEV_DRIVER_PIPEWIRE);=
<br>
&gt; +=C2=A0 =C2=A0 popts =3D &amp;dev-&gt;u.pipewire;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!popts-&gt;has_latency) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 popts-&gt;has_latency =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 popts-&gt;latency =3D 44100;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
Why 44ms?<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw-&gt;dev =3D dev;<br>
&gt; +=C2=A0 =C2=A0 pw-&gt;thread_loop =3D pw_thread_loop_new(&quot;Pipewir=
e thread loop&quot;, NULL);<br>
&gt; +=C2=A0 =C2=A0 if (pw-&gt;thread_loop =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 pw-&gt;context =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_context_new(pw_thread_loop_get_loop(pw=
-&gt;thread_loop), NULL, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (pw_thread_loop_start(pw-&gt;thread_loop) &lt; 0) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_lock(pw-&gt;thread_loop);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw-&gt;core =3D pw_context_connect(pw-&gt;context, NULL=
, 0);<br>
&gt; +=C2=A0 =C2=A0 if (pw-&gt;core =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_core_add_listener(pw-&gt;core, &amp;pw-&gt;core_list=
ener, &amp;core_events, pw);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(pw-&gt;thread_loop);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return pw;<br>
&gt; +<br>
&gt; +fail:<br>
&gt; +=C2=A0 =C2=A0 AUD_log(AUDIO_CAP, &quot;Failed to initialize PW contex=
t&quot;);<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_unlock(pw-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 pw_context_destroy(pw-&gt;context);<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_destroy(pw-&gt;thread_loop);<br>
&gt; +=C2=A0 =C2=A0 g_free(pw);<br>
&gt; +=C2=A0 =C2=A0 return NULL;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +qpw_audio_fini(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 pwaudio *pw =3D opaque;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pw_thread_loop_stop(pw-&gt;thread_loop);<br>
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
&gt; +=C2=A0 =C2=A0 .buffer_get_free =3D audio_generic_buffer_get_free,<br>
&gt; +=C2=A0 =C2=A0 .run_buffer_out =3D audio_generic_run_buffer_out,<br>
&gt; +=C2=A0 =C2=A0 .enable_out =3D qpw_enable_out,<br>
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
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index a76c855312..686fdd5b81 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -734,6 +734,11 @@ if not get_option(&#39;jack&#39;).auto() or have_=
system<br>
&gt;=C2=A0 =C2=A0 jack =3D dependency(&#39;jack&#39;, required: get_option(=
&#39;jack&#39;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 method: &#39;pkg-config&#39;, kwargs: static_kwargs)<br>
&gt;=C2=A0 endif<br>
&gt; +pipewire =3D not_found<br>
&gt; +if not get_option(&#39;pipewire&#39;).auto() or (targetos =3D=3D &#39=
;linux&#39; and have_system)<br>
&gt; +=C2=A0 pipewire =3D dependency(&#39;libpipewire-0.3&#39;, required: g=
et_option(&#39;pipewire&#39;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 method: &#39;pkg-config&#39;, kwargs: static_kwargs)<br>
&gt; +endif<br>
&gt;=C2=A0 sndio =3D not_found<br>
&gt;=C2=A0 if not get_option(&#39;sndio&#39;).auto() or have_system<br>
&gt;=C2=A0 =C2=A0 sndio =3D dependency(&#39;sndio&#39;, required: get_optio=
n(&#39;sndio&#39;),<br>
&gt; @@ -1671,6 +1676,7 @@ if have_system<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;jack&#39;: jack.found(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;oss&#39;: oss.found(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;pa&#39;: pulse.found(),<br>
&gt; +=C2=A0 =C2=A0 &#39;pipewire&#39;: pipewire.found(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;sdl&#39;: sdl.found(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;sndio&#39;: sndio.found(),<br>
&gt;=C2=A0 =C2=A0 }<br>
&gt; @@ -3949,6 +3955,7 @@ endif<br>
&gt;=C2=A0 if targetos =3D=3D &#39;linux&#39;<br>
&gt;=C2=A0 =C2=A0 summary_info +=3D {&#39;ALSA support&#39;:=C2=A0 =C2=A0 a=
lsa}<br>
&gt;=C2=A0 =C2=A0 summary_info +=3D {&#39;PulseAudio support&#39;: pulse}<b=
r>
&gt; +=C2=A0 summary_info +=3D {&#39;Pipewire support&#39;:=C2=A0 =C2=A0pip=
ewire}<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 summary_info +=3D {&#39;JACK support&#39;:=C2=A0 =C2=A0 =C2=A0 j=
ack}<br>
&gt;=C2=A0 summary_info +=3D {&#39;brlapi support&#39;:=C2=A0 =C2=A0 brlapi=
}<br>
&gt; diff --git a/meson_options.txt b/meson_options.txt<br>
&gt; index 7e5801db90..1b7847250d 100644<br>
&gt; --- a/meson_options.txt<br>
&gt; +++ b/meson_options.txt<br>
&gt; @@ -21,7 +21,7 @@ option(&#39;tls_priority&#39;, type : &#39;string&#3=
9;, value : &#39;NORMAL&#39;,<br>
&gt;=C2=A0 option(&#39;default_devices&#39;, type : &#39;boolean&#39;, valu=
e : true,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Include a default s=
election of devices in emulators&#39;)<br>
&gt;=C2=A0 option(&#39;audio_drv_list&#39;, type: &#39;array&#39;, value: [=
&#39;default&#39;],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0choices: [&#39;alsa&#39;, &#39;coreaudio&#=
39;, &#39;default&#39;, &#39;dsound&#39;, &#39;jack&#39;, &#39;oss&#39;, &#=
39;pa&#39;, &#39;sdl&#39;, &#39;sndio&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0choices: [&#39;alsa&#39;, &#39;coreaudio&#=
39;, &#39;default&#39;, &#39;dsound&#39;, &#39;jack&#39;, &#39;oss&#39;, &#=
39;pa&#39;, &#39;pipewire&#39;, &#39;sdl&#39;, &#39;sndio&#39;],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Set audio driver li=
st&#39;)<br>
&gt;=C2=A0 option(&#39;block_drv_rw_whitelist&#39;, type : &#39;string&#39;=
, value : &#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;set block driver re=
ad-write whitelist (by default affects only QEMU, not tools like qemu-img)&=
#39;)<br>
&gt; @@ -255,6 +255,8 @@ option(&#39;oss&#39;, type: &#39;feature&#39;, val=
ue: &#39;auto&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;OSS sound support&#=
39;)<br>
&gt;=C2=A0 option(&#39;pa&#39;, type: &#39;feature&#39;, value: &#39;auto&#=
39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;PulseAudio sound su=
pport&#39;)<br>
&gt; +option(&#39;pipewire&#39;, type: &#39;feature&#39;, value: &#39;auto&=
#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Pipewire sound support&#=
39;)<br>
&gt;=C2=A0 option(&#39;sndio&#39;, type: &#39;feature&#39;, value: &#39;aut=
o&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;sndio sound support=
&#39;)<br>
&gt;=C2=A0 <br>
&gt; diff --git a/qapi/audio.json b/qapi/audio.json<br>
&gt; index 4e54c00f51..b872e9f10d 100644<br>
&gt; --- a/qapi/audio.json<br>
&gt; +++ b/qapi/audio.json<br>
&gt; @@ -324,6 +324,48 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;*out&#39;:=C2=A0 =C2=A0 &#39;AudiodevPaPerDir=
ectionOptions&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;*server&#39;: &#39;str&#39; } }<br>
&gt;=C2=A0 <br>
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
fault: audiodev&#39;s id, since 7.1)<br>
&gt; +#<br>
&gt; +#<br>
&gt; +# Since: 7.2<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;AudiodevPipewirePerDirectionOptions&#39;,<br=
>
&gt; +=C2=A0 &#39;base&#39;: &#39;AudiodevPerDirectionOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;*name&#39;: &#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*stream-name&#39;: &#39;str&#39; } }<br>
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
&gt; +# @latency: add latency to playback in microseconds<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(default 44100)<br>
&gt; +#<br>
&gt; +# Since: 7.2<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;AudiodevPipewireOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;*in&#39;:=C2=A0 =C2=A0 =C2=A0&#39;AudiodevPipewire=
PerDirectionOptions&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*out&#39;:=C2=A0 =C2=A0 &#39;AudiodevPipewirePerDi=
rectionOptions&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*latency&#39;: &#39;uint32&#39; } }<br>
&gt; +<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @AudiodevSdlPerDirectionOptions:<br>
&gt;=C2=A0 #<br>
&gt; @@ -416,6 +458,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39=
;jack&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_JACK&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39=
;oss&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_OSS&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39=
;pa&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_PA&#39; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;pipe=
wire&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_PIPEWIRE&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39=
;sdl&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_SDL&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39=
;sndio&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_SNDIO&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39=
;spice&#39;, &#39;if&#39;: &#39;CONFIG_SPICE&#39; },<br>
&gt; @@ -456,6 +499,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;if&#39;: &#39;CONFIG_AUDIO_OSS&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;pa&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;ty=
pe&#39;: &#39;AudiodevPaOptions&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;if&#39;: &#39;CONFIG_AUDIO_PA&#39; },<br>
&gt; +=C2=A0 =C2=A0 &#39;pipewire&#39;:=C2=A0 { &#39;type&#39;: &#39;Audiod=
evPipewireOptions&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;if&#39;: &#39;CONFIG_AUDIO_PIPEWIRE&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;sdl&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;ty=
pe&#39;: &#39;AudiodevSdlOptions&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;if&#39;: &#39;CONFIG_AUDIO_SDL&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;sndio&#39;:=C2=A0 =C2=A0 =C2=A0{ &#39;type&#3=
9;: &#39;AudiodevSndioOptions&#39;,<br>
&gt; diff --git a/qemu-options.hx b/qemu-options.hx<br>
&gt; index 88e93c6103..bde4830fab 100644<br>
&gt; --- a/qemu-options.hx<br>
&gt; +++ b/qemu-options.hx<br>
&gt; @@ -779,6 +779,11 @@ DEF(&quot;audiodev&quot;, HAS_ARG, QEMU_OPTION_au=
diodev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 in|<a href=3D"http://out.name" rel=3D"noreferrer" target=3D"_=
blank">out.name</a>=3D source/sink device name\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 in|out.latency=3D desired latency in microseconds\n&quot;<br>
&gt;=C2=A0 #endif<br>
&gt; +#ifdef CONFIG_AUDIO_PIPEWIRE<br>
&gt; +=C2=A0 =C2=A0 &quot;-audiodev pipewire,id=3Did[,prop[=3Dvalue][,...]]=
\n&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 in|<a href=3D"http://out.name" rel=3D"noreferrer" target=3D"_blank">=
out.name</a>=3D source/sink device name\n&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 latency=3D desired latency in microseconds\n&quot;<br>
&gt; +#endif<br>
&gt;=C2=A0 #ifdef CONFIG_AUDIO_SDL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]=
\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 in|out.buffer-count=3D number of buffers\n&quot;<br>
&gt; @@ -942,6 +947,18 @@ SRST<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Desired latency in microseconds. The=
 PulseAudio server will try<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to honor this value but actual laten=
cies may be lower or higher.<br>
&gt;=C2=A0 <br>
&gt; +``-audiodev pipewire,id=3Did[,prop[=3Dvalue][,...]]``<br>
&gt; +=C2=A0 =C2=A0 Creates a backend using Pipewire. This backend is avail=
able on<br>
&gt; +=C2=A0 =C2=A0 most systems.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Pipewire specific options are:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ``latency=3Dlatency``<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Add extra latency to playback in microsec=
onds<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ``in|<a href=3D"http://out.name" rel=3D"noreferrer" tar=
get=3D"_blank">out.name</a>=3Dsink``<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Use the specified source/sink for recordi=
ng/playback.<br>
&gt; +<br>
&gt;=C2=A0 ``-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]``<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Creates a backend using SDL. This backend is avail=
able on most<br>
&gt;=C2=A0 =C2=A0 =C2=A0 systems, but you should use your platform&#39;s na=
tive backend if<br>
&gt; diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoption=
s.sh<br>
&gt; index 180c11665a..d9f6525346 100644<br>
&gt; --- a/scripts/meson-buildoptions.sh<br>
&gt; +++ b/scripts/meson-buildoptions.sh<br>
&gt; @@ -1,7 +1,8 @@<br>
&gt;=C2=A0 # This file is generated by meson-buildoptions.py, do not edit!<=
br>
&gt;=C2=A0 meson_options_help() {<br>
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
&gt;=C2=A0 =C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --block-drv-ro-whitel=
ist=3DVALUE&#39;<br>
&gt;=C2=A0 =C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set bl=
ock driver read-only whitelist (by default&#39;<br>
&gt;=C2=A0 =C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0affect=
s only QEMU, not tools like qemu-img)&#39;<br>
&gt; @@ -135,6 +136,7 @@ meson_options_help() {<br>
&gt;=C2=A0 =C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 oss=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OSS sound support&#39;<br>
&gt;=C2=A0 =C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 pa=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PulseAudio sound support&#39;<br>
&gt;=C2=A0 =C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 parallels=C2=A0 =C2=
=A0 =C2=A0 =C2=A0parallels image format support&#39;<br>
&gt; +=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 pipewire=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Pipewire sound support&#39;<br>
&gt;=C2=A0 =C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 png=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PNG support with libpng&#39;<br>
&gt;=C2=A0 =C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 pvrdma=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Enable PVRDMA support&#39;<br>
&gt;=C2=A0 =C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 qcow1=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0qcow1 image format support&#39;<br>
&gt; @@ -370,6 +372,8 @@ _meson_option_parse() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-pa) printf &quot;%s&quot; -Dpa=3Ddisable=
d ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-parallels) printf &quot;%s&quot; -Dparall=
els=3Denabled ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-parallels) printf &quot;%s&quot; -Dparal=
lels=3Ddisabled ;;<br>
&gt; +=C2=A0 =C2=A0 --enable-pipewire) printf &quot;%s&quot; -Dpipewire=3De=
nabled ;;<br>
&gt; +=C2=A0 =C2=A0 --disable-pipewire) printf &quot;%s&quot; -Dpipewire=3D=
disabled ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-pkgversion=3D*) quote_sh &quot;-Dpkgversion=
=3D$2&quot; ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-png) printf &quot;%s&quot; -Dpng=3Denable=
d ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-png) printf &quot;%s&quot; -Dpng=3Ddisab=
led ;;<br>
&gt; <br>
<br>
<br>
</blockquote></div>

--0000000000005a716105f4d5e3c8--


