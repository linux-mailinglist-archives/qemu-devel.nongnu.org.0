Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DD86B7772
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 13:29:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbhHz-00055j-IC; Mon, 13 Mar 2023 08:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pbhHp-00052E-TM
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 08:28:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pbhHn-0004oI-1J
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 08:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678710496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+QkDK1Tb7jf/aEOVCkVKXF8uvfLp0sGy2dqXKlzkUIg=;
 b=JNhbOSgE2fFRjumWcwR/YZ5jXDuoKZknx7H1Z0FF6g+3Aj6lepUit7IHo4igRGJUIHU7e+
 cSoV032zruRl/fqtWAecjnBXjVGoec8pSj9oOEUEUKOOA2Lp3NahxfZUl4veXzb+saukQ+
 YV1UNdBZuokzs73K3PnvZU2vn5vhL/c=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-phxcdSVMO6amK3Bw0sG-qQ-1; Mon, 13 Mar 2023 08:28:12 -0400
X-MC-Unique: phxcdSVMO6amK3Bw0sG-qQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 l2-20020ac87242000000b003bfecc6d046so6747148qtp.17
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 05:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678710492;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+QkDK1Tb7jf/aEOVCkVKXF8uvfLp0sGy2dqXKlzkUIg=;
 b=QhRvax1gdeCEVDO+N4iIQTHGfK5AgZB8BawtoqDRPPWJ19IMUIqXORfh0HQFkN0JgC
 l/MdhX8QRhu9Y4P2GH7RPjhBDI/O4LoVNBLAmZmSWbruPlWk/W51VOUXZHmtTOFPwWe7
 hZLFxTyIBclgRzH1HjGr8URtmWCK7dNLDrYdAFfCbORmCuYgyWi0LF2UcT5w1ZGRt60m
 qJ1qAFbTH26Xo9YRxmIJQaj5MhLPscJtpWeiGa79cPbKF7uhG6+7LEuStgknGhTlnE3i
 bnV3tcNCcmd+srsoFRAzGID5rOyZZYMpA8bMLAmd5bMiRYRaNtP4pd3T70SC6DgunWlR
 OqNg==
X-Gm-Message-State: AO0yUKWE6ZTKI3if/Yn05G1sVQOZzC8gMnXxRTFICj3V+lxjPa/34Rft
 ZYcJGo9SOxyBA0s8NRnIv9I4Hdzhv3gXJ2JcvZWRB5A2khb/pmJ6X4cGOlFccn9Qr+qwiy56eT4
 8/43a61LrxyFuGpe5DSjgoV5fWFmYKNw=
X-Received: by 2002:a05:620a:2198:b0:745:a35f:ad71 with SMTP id
 g24-20020a05620a219800b00745a35fad71mr351862qka.13.1678710492148; 
 Mon, 13 Mar 2023 05:28:12 -0700 (PDT)
X-Google-Smtp-Source: AK7set9AxntxlX0XbjxCECsl8s1L9XCqpYvaZxudNPxe5J7FYCT9WUZHmByme8Znk9snul7t6+gNjsGPNJWiwLLyyyA=
X-Received: by 2002:a05:620a:2198:b0:745:a35f:ad71 with SMTP id
 g24-20020a05620a219800b00745a35fad71mr351851qka.13.1678710491784; Mon, 13 Mar
 2023 05:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <a3717185-a930-e8e7-80cc-edb8d9e4d01d@t-online.de>
 <20230311120826.5584-1-vr_qemu@t-online.de>
 <5179fdbb-54f2-a24b-d9e0-fea89c5528fd@t-online.de>
In-Reply-To: <5179fdbb-54f2-a24b-d9e0-fea89c5528fd@t-online.de>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Mon, 13 Mar 2023 13:28:00 +0100
Message-ID: <CACzuRyzZu1iw_KS-bQO=ZM2oEhZC=6BG2w7XE=Fyndpwi+jkQw@mail.gmail.com>
Subject: Re: [PATCH] DO-NOT-MERGE: pipewire sample code
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wtaymans@redhat.com, 
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008b390f05f6c73e29"
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

--0000000000008b390f05f6c73e29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volker,

Thanks for the patch, I've tested the patch and it works. I don't hear the
choppy audio with this option "qemu-system-x86_64 -device ich9-intel-hda
-device hda-duplex,audiodev=3Daudio0 -audiodev
pipewire,id=3Daudio0,out.frequency=3D96000,in.frequency=3D96000 ...."

I don't understand how the req =3D=3D 0 case can work at all.
>
how this works is that  b->requested could be zero when no suggestion is
provided. For playback streams, this field contains the suggested amount of
data to provide. hence the reason for this check.

I suggest to use the same option names as the pulseaudio backend.
> out.latency is the effective Pipewire buffer size.
>
Ack.

Thanks,
Dorinda.


On Sat, Mar 11, 2023 at 5:19=E2=80=AFPM Volker R=C3=BCmelin <vr_qemu@t-onli=
ne.de> wrote:

> > Based-on:<20230306171020.381116-1-dbassey@redhat.com>
> > ([PATCH v7] audio/pwaudio.c: Add Pipewire audio backend for QEMU)
> >
> > This is sample code for the review of the pipewire backed. The
> > code actually works.
> >
> > An email with explanations for the changes will follow.
> >
> > Signed-off-by: Volker R=C3=BCmelin<vr_qemu@t-online.de>
> > ---
> >   audio/pwaudio.c | 67 +++++++++++++++++++++++++++++++++---------------=
-
> >   qapi/audio.json | 10 +++-----
> >   2 files changed, 49 insertions(+), 28 deletions(-)
> >
> > diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> > index d357761152..8e2a38938f 100644
> > --- a/audio/pwaudio.c
> > +++ b/audio/pwaudio.c
> > @@ -23,7 +23,6 @@
> >   #define AUDIO_CAP "pipewire"
> >   #define RINGBUFFER_SIZE    (1u << 22)
> >   #define RINGBUFFER_MASK    (RINGBUFFER_SIZE - 1)
> > -#define BUFFER_SAMPLES    512
> >
> >   #include "audio_int.h"
> >
> > @@ -48,6 +47,7 @@ typedef struct PWVoice {
> >       struct pw_stream *stream;
> >       struct spa_hook stream_listener;
> >       struct spa_audio_info_raw info;
> > +    uint32_t highwater_mark;
> >       uint32_t frame_size;
> >       struct spa_ringbuffer ring;
> >       uint8_t buffer[RINGBUFFER_SIZE];
> > @@ -82,7 +82,7 @@ playback_on_process(void *data)
> >       void *p;
> >       struct pw_buffer *b;
> >       struct spa_buffer *buf;
> > -    uint32_t n_frames, req, index, n_bytes;
> > +    uint32_t req, index, n_bytes;
> >       int32_t avail;
> >
> >       if (!v->stream) {
> > @@ -105,8 +105,7 @@ playback_on_process(void *data)
> >       if (req =3D=3D 0) {
> >           req =3D 4096 * v->frame_size;
> >       }
>
> I don't understand how the req =3D=3D 0 case can work at all. The downstr=
eam
> audio device is the thinnest point in the playback stream. We can't
> write more audio frames than the audio device will consume.
>
> > -    n_frames =3D SPA_MIN(req, buf->datas[0].maxsize);
> > -    n_bytes =3D n_frames * v->frame_size;
> > +    n_bytes =3D SPA_MIN(req, buf->datas[0].maxsize);
>
> See Marc-Andr=C3=A9's review.
>
> >
> >       /* get no of available bytes to read data from buffer */
> >
> > @@ -270,6 +269,30 @@ done_unlock:
> >       return l;
> >   }
> >
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
>
> A pcm_ops buffer_get_free function is necessary. Otherwise the gus and
> via-ac97 audio devices will not work properly for the -audiodev
> pipewire,id=3Daudio0,out.mixing-engine=3Doff case. They need to know in
> advance how many bytes they can write.
>
> Also, without the buffer_get_free function, the generic audio buffer
> will increase the playback latency.
>
> >   static size_t
> >   qpw_write(HWVoiceOut *hw, void *data, size_t len)
> >   {
> > @@ -277,20 +300,18 @@ qpw_write(HWVoiceOut *hw, void *data, size_t len)
> >       PWVoice *v =3D &pw->v;
> >       pwaudio *c =3D v->g;
> >       const char *error =3D NULL;
> > -    const int periods =3D 3;
> > -    size_t l;
> >       int32_t filled, avail;
> >       uint32_t index;
> >
> >       pw_thread_loop_lock(c->thread_loop);
> >       if (pw_stream_get_state(v->stream, &error) !=3D
> PW_STREAM_STATE_STREAMING) {
> >           /* wait for stream to become ready */
> > -        l =3D 0;
> > +        len =3D 0;
> >           goto done_unlock;
> >       }
> > -    filled =3D spa_ringbuffer_get_write_index(&v->ring, &index);
> >
> > -    avail =3D BUFFER_SAMPLES * v->frame_size * periods - filled;
> > +    filled =3D spa_ringbuffer_get_write_index(&v->ring, &index);
> > +    avail =3D v->highwater_mark - filled;
> >
> >       trace_pw_write(filled, avail, index, len);
> >
> > @@ -312,11 +333,10 @@ qpw_write(HWVoiceOut *hw, void *data, size_t len)
> >                                   index & RINGBUFFER_MASK, data, len);
> >       index +=3D len;
> >       spa_ringbuffer_write_update(&v->ring, index);
> > -    l =3D len;
> >
> >   done_unlock:
> >       pw_thread_loop_unlock(c->thread_loop);
> > -    return l;
> > +    return len;
> >   }
> >
> >   static int
> > @@ -420,8 +440,13 @@ create_stream(pwaudio *c, PWVoice *v, const char
> *name)
> >       const struct spa_pod *params[2];
> >       uint8_t buffer[1024];
> >       struct spa_pod_builder b;
> > +    struct pw_properties *props;
> >
> > -    v->stream =3D pw_stream_new(c->core, name, NULL);
> > +    props =3D pw_properties_new(NULL, NULL);
> > +    pw_properties_setf(props, PW_KEY_NODE_LATENCY, "%" PRIu64 "/%u",
> > +                       (uint64_t)v->g->dev->timer_period * v->info.rat=
e
> > +                       * 3 / 4 / 1000000, v->info.rate);
> > +    v->stream =3D pw_stream_new(c->core, name, props);
>
> The PW_KEY_NODE_LATENCY property is a hint for Pipewire that we need
> updates faster than timer_period. I selected 75% of timer-period. Then
> there's a good chance the audio frontends can write or read new audio
> packets every timer-period. It doesn't matter that Pipewire calls the
> callbacks faster in most cases.
>
> If it turns out that Pipewire often can't even approximately fulfill
> this hint, we will additionally need a jitter buffer implementation to
> split the larger Pipewire audio packets into timer-period sized packets.
>
> >
> >       if (v->stream =3D=3D NULL) {
> >           goto error;
> > @@ -563,7 +588,11 @@ qpw_init_out(HWVoiceOut *hw, struct audsettings
> *as, void *drv_opaque)
> >       audio_pcm_init_info(&hw->info, &obt_as);
> >
> >       /* report the buffer size to qemu */
> > -    hw->samples =3D BUFFER_SAMPLES;
> > +    hw->samples =3D audio_buffer_frames(
> > +        qapi_AudiodevPipewirePerDirectionOptions_base(ppdo), &obt_as,
> 46440);
> > +    v->highwater_mark =3D MIN(RINGBUFFER_SIZE,
> > +                            (ppdo->has_latency ? ppdo->latency : 46440=
)
> > +                            * (uint64_t)v->info.rate / 1000000 *
> v->frame_size);
> >
>
> The reported buffer size should be much larger than BUFFER_SAMPLES. This
> gives the audio frontends a chance to catch up if they missed
> timer-periods or if they have to fill the pipewire backend buffer
> quickly after playback starts. The exact size is not critical, but to be
> command line compatible with the pulseaudio backend, I suggest to use
> 46ms. A large hw->samples value doesn't increase the playback latency.
>
> v->highwater_mark is the effective pipewire backend buffer size. At a
> audio frame rate of 44100 frames/s, the code without this patch uses a
> buffer size of BUFFER_SAMPLES * periods / 44100 frames/s =3D 512 frames *
> 3 / 44100 frames/s =3D 35ms. On my computer the buffer size has to be 30m=
s
> at minimum. I suggest to add a good margin and use a default of 46ms.
> This buffer is a larger contributor to the playback latency.
>
> >       pw_thread_loop_unlock(c->thread_loop);
> >       return 0;
> > @@ -606,7 +635,8 @@ qpw_init_in(HWVoiceIn *hw, struct audsettings *as,
> void *drv_opaque)
> >       audio_pcm_init_info(&hw->info, &obt_as);
> >
> >       /* report the buffer size to qemu */
> > -    hw->samples =3D BUFFER_SAMPLES;
> > +    hw->samples =3D audio_buffer_frames(
> > +        qapi_AudiodevPipewirePerDirectionOptions_base(ppdo), &obt_as,
> 46440);
> >
>
> See qpw_init_out().
>
> >       pw_thread_loop_unlock(c->thread_loop);
> >       return 0;
> > @@ -695,15 +725,8 @@ qpw_audio_init(Audiodev *dev)
> >       pw =3D g_new0(pwaudio, 1);
> >       pw_init(NULL, NULL);
> >
> > -    AudiodevPipewireOptions *popts;
> >       trace_pw_audio_init("Initialize Pipewire context\n");
> >       assert(dev->driver =3D=3D AUDIODEV_DRIVER_PIPEWIRE);
> > -    popts =3D &dev->u.pipewire;
> > -
> > -    if (!popts->has_latency) {
> > -        popts->has_latency =3D true;
> > -        popts->latency =3D 15000;
> > -    }
> >
> >       pw->dev =3D dev;
> >       pw->thread_loop =3D pw_thread_loop_new("Pipewire thread loop", NU=
LL);
> > @@ -781,7 +804,7 @@ static struct audio_pcm_ops qpw_pcm_ops =3D {
> >       .init_out =3D qpw_init_out,
> >       .fini_out =3D qpw_fini_out,
> >       .write =3D qpw_write,
> > -    .buffer_get_free =3D audio_generic_buffer_get_free,
> > +    .buffer_get_free =3D qpw_buffer_get_free,
> >       .run_buffer_out =3D audio_generic_run_buffer_out,
> >       .enable_out =3D qpw_enable_out,
> >
> > diff --git a/qapi/audio.json b/qapi/audio.json
> > index 9a0d7d9ece..d49a8a670b 100644
> > --- a/qapi/audio.json
> > +++ b/qapi/audio.json
> > @@ -337,6 +337,7 @@
> >   #               create multiple Pipewire devices or run multiple qemu
> >   #               instances (default: audiodev's id, since 7.1)
> >   #
> > +# @latency: Pipewire backend buffer size in microseconds (default 4644=
0)
> >   #
> >   # Since: 8.0
> >   ##
> > @@ -344,7 +345,8 @@
> >     'base': 'AudiodevPerDirectionOptions',
> >     'data': {
> >       '*name': 'str',
> > -    '*stream-name': 'str' } }
> > +    '*stream-name': 'str',
> > +    '*latency': 'uint32' } }
> >
>
> I suggest to use the same option names as the pulseaudio backend.
> out.latency is the effective Pipewire buffer size.
>
> With best regards,
> Volker
>
> >   ##
> >   # @AudiodevPipewireOptions:
> > @@ -355,16 +357,12 @@
> >   #
> >   # @out: options of the playback stream
> >   #
> > -# @latency: add latency to playback in microseconds
> > -#           (default 15000)
> > -#
> >   # Since: 8.0
> >   ##
> >   { 'struct': 'AudiodevPipewireOptions',
> >     'data': {
> >       '*in':     'AudiodevPipewirePerDirectionOptions',
> > -    '*out':    'AudiodevPipewirePerDirectionOptions',
> > -    '*latency': 'uint32' } }
> > +    '*out':    'AudiodevPipewirePerDirectionOptions' } }
> >
> >   ##
> >   # @AudiodevSdlPerDirectionOptions:
>
>

--0000000000008b390f05f6c73e29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Volker,</div><div><br></div><div>Thanks for the pa=
tch, I&#39;ve tested the patch and it works. I don&#39;t hear the choppy au=
dio with this option &quot;qemu-system-x86_64 -device ich9-intel-hda -devic=
e hda-duplex,audiodev=3Daudio0 -audiodev pipewire,id=3Daudio0,out.frequency=
=3D96000,in.frequency=3D96000 ....&quot;<br></div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div>I don&#39;t understand how the=
 req =3D=3D 0 case can work at all.</div></blockquote><div>how this works i=
s that=C2=A0 b-&gt;requested could be zero when no suggestion is provided. =
For playback streams, this field contains the suggested amount of data to p=
rovide. hence the reason for this check.</div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div>I suggest to use the same option n=
ames as the pulseaudio backend. <br>
out.latency is the effective Pipewire buffer size.</div></blockquote><div>A=
ck.</div><div><br></div><div>Thanks,</div><div>Dorinda.<br></div><div>=C2=
=A0<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sat, Mar 11, 2023 at 5:19=E2=80=AFPM Volker R=C3=BCmelin &l=
t;<a href=3D"mailto:vr_qemu@t-online.de">vr_qemu@t-online.de</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; Based-on:&=
lt;<a href=3D"mailto:20230306171020.381116-1-dbassey@redhat.com" target=3D"=
_blank">20230306171020.381116-1-dbassey@redhat.com</a>&gt;<br>
&gt; ([PATCH v7] audio/pwaudio.c: Add Pipewire audio backend for QEMU)<br>
&gt;<br>
&gt; This is sample code for the review of the pipewire backed. The<br>
&gt; code actually works.<br>
&gt;<br>
&gt; An email with explanations for the changes will follow.<br>
&gt;<br>
&gt; Signed-off-by: Volker R=C3=BCmelin&lt;<a href=3D"mailto:vr_qemu@t-onli=
ne.de" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0audio/pwaudio.c | 67 +++++++++++++++++++++++++++++++++----=
------------<br>
&gt;=C2=A0 =C2=A0qapi/audio.json | 10 +++-----<br>
&gt;=C2=A0 =C2=A02 files changed, 49 insertions(+), 28 deletions(-)<br>
&gt;<br>
&gt; diff --git a/audio/pwaudio.c b/audio/pwaudio.c<br>
&gt; index d357761152..8e2a38938f 100644<br>
&gt; --- a/audio/pwaudio.c<br>
&gt; +++ b/audio/pwaudio.c<br>
&gt; @@ -23,7 +23,6 @@<br>
&gt;=C2=A0 =C2=A0#define AUDIO_CAP &quot;pipewire&quot;<br>
&gt;=C2=A0 =C2=A0#define RINGBUFFER_SIZE=C2=A0 =C2=A0 (1u &lt;&lt; 22)<br>
&gt;=C2=A0 =C2=A0#define RINGBUFFER_MASK=C2=A0 =C2=A0 (RINGBUFFER_SIZE - 1)=
<br>
&gt; -#define BUFFER_SAMPLES=C2=A0 =C2=A0 512<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &quot;audio_int.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -48,6 +47,7 @@ typedef struct PWVoice {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pw_stream *stream;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct spa_hook stream_listener;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct spa_audio_info_raw info;<br>
&gt; +=C2=A0 =C2=A0 uint32_t highwater_mark;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t frame_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct spa_ringbuffer ring;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t buffer[RINGBUFFER_SIZE];<br>
&gt; @@ -82,7 +82,7 @@ playback_on_process(void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void *p;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pw_buffer *b;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct spa_buffer *buf;<br>
&gt; -=C2=A0 =C2=A0 uint32_t n_frames, req, index, n_bytes;<br>
&gt; +=C2=A0 =C2=A0 uint32_t req, index, n_bytes;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int32_t avail;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!v-&gt;stream) {<br>
&gt; @@ -105,8 +105,7 @@ playback_on_process(void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (req =3D=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0req =3D 4096 * v-&gt;frame_siz=
e;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
I don&#39;t understand how the req =3D=3D 0 case can work at all. The downs=
tream <br>
audio device is the thinnest point in the playback stream. We can&#39;t <br=
>
write more audio frames than the audio device will consume.<br>
<br>
&gt; -=C2=A0 =C2=A0 n_frames =3D SPA_MIN(req, buf-&gt;datas[0].maxsize);<br=
>
&gt; -=C2=A0 =C2=A0 n_bytes =3D n_frames * v-&gt;frame_size;<br>
&gt; +=C2=A0 =C2=A0 n_bytes =3D SPA_MIN(req, buf-&gt;datas[0].maxsize);<br>
<br>
See Marc-Andr=C3=A9&#39;s review.<br>
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* get no of available bytes to read data fr=
om buffer */<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -270,6 +269,30 @@ done_unlock:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return l;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
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
<br>
A pcm_ops buffer_get_free function is necessary. Otherwise the gus and <br>
via-ac97 audio devices will not work properly for the -audiodev <br>
pipewire,id=3Daudio0,out.mixing-engine=3Doff case. They need to know in <br=
>
advance how many bytes they can write.<br>
<br>
Also, without the buffer_get_free function, the generic audio buffer <br>
will increase the playback latency.<br>
<br>
&gt;=C2=A0 =C2=A0static size_t<br>
&gt;=C2=A0 =C2=A0qpw_write(HWVoiceOut *hw, void *data, size_t len)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; @@ -277,20 +300,18 @@ qpw_write(HWVoiceOut *hw, void *data, size_t len=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PWVoice *v =3D &amp;pw-&gt;v;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pwaudio *c =3D v-&gt;g;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *error =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 const int periods =3D 3;<br>
&gt; -=C2=A0 =C2=A0 size_t l;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int32_t filled, avail;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t index;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pw_thread_loop_lock(c-&gt;thread_loop);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pw_stream_get_state(v-&gt;stream, &amp;e=
rror) !=3D PW_STREAM_STATE_STREAMING) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* wait for stream to become r=
eady */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done_unlock;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 filled =3D spa_ringbuffer_get_write_index(&amp;v-&gt;ri=
ng, &amp;index);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 avail =3D BUFFER_SAMPLES * v-&gt;frame_size * periods -=
 filled;<br>
&gt; +=C2=A0 =C2=A0 filled =3D spa_ringbuffer_get_write_index(&amp;v-&gt;ri=
ng, &amp;index);<br>
&gt; +=C2=A0 =C2=A0 avail =3D v-&gt;highwater_mark - filled;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_pw_write(filled, avail, index, len);<b=
r>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -312,11 +333,10 @@ qpw_write(HWVoiceOut *hw, void *data, size_t len=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index &amp; RINGBUFF=
ER_MASK, data, len);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0index +=3D len;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spa_ringbuffer_write_update(&amp;v-&gt;ring,=
 index);<br>
&gt; -=C2=A0 =C2=A0 l =3D len;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0done_unlock:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pw_thread_loop_unlock(c-&gt;thread_loop);<br=
>
&gt; -=C2=A0 =C2=A0 return l;<br>
&gt; +=C2=A0 =C2=A0 return len;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static int<br>
&gt; @@ -420,8 +440,13 @@ create_stream(pwaudio *c, PWVoice *v, const char =
*name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct spa_pod *params[2];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t buffer[1024];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct spa_pod_builder b;<br>
&gt; +=C2=A0 =C2=A0 struct pw_properties *props;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 v-&gt;stream =3D pw_stream_new(c-&gt;core, name, NULL);=
<br>
&gt; +=C2=A0 =C2=A0 props =3D pw_properties_new(NULL, NULL);<br>
&gt; +=C2=A0 =C2=A0 pw_properties_setf(props, PW_KEY_NODE_LATENCY, &quot;%&=
quot; PRIu64 &quot;/%u&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(uint64_t)v-&gt;g-&gt;dev-&gt;timer_period * v-&gt;info.rate<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0* 3 / 4 / 1000000, v-&gt;info.rate);<br>
&gt; +=C2=A0 =C2=A0 v-&gt;stream =3D pw_stream_new(c-&gt;core, name, props)=
;<br>
<br>
The PW_KEY_NODE_LATENCY property is a hint for Pipewire that we need <br>
updates faster than timer_period. I selected 75% of timer-period. Then <br>
there&#39;s a good chance the audio frontends can write or read new audio <=
br>
packets every timer-period. It doesn&#39;t matter that Pipewire calls the <=
br>
callbacks faster in most cases.<br>
<br>
If it turns out that Pipewire often can&#39;t even approximately fulfill <b=
r>
this hint, we will additionally need a jitter buffer implementation to <br>
split the larger Pipewire audio packets into timer-period sized packets.<br=
>
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (v-&gt;stream =3D=3D NULL) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt; @@ -563,7 +588,11 @@ qpw_init_out(HWVoiceOut *hw, struct audsettings *=
as, void *drv_opaque)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0audio_pcm_init_info(&amp;hw-&gt;info, &amp;o=
bt_as);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* report the buffer size to qemu */<br>
&gt; -=C2=A0 =C2=A0 hw-&gt;samples =3D BUFFER_SAMPLES;<br>
&gt; +=C2=A0 =C2=A0 hw-&gt;samples =3D audio_buffer_frames(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_AudiodevPipewirePerDirectionOptions_=
base(ppdo), &amp;obt_as, 46440);<br>
&gt; +=C2=A0 =C2=A0 v-&gt;highwater_mark =3D MIN(RINGBUFFER_SIZE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ppdo-&gt;has_latency ? ppdo-&gt;latency : 464=
40)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * (uint64_t)v-&gt;info.rate / 1000000 * v-&gt;=
frame_size);<br>
&gt;=C2=A0 =C2=A0<br>
<br>
The reported buffer size should be much larger than BUFFER_SAMPLES. This <b=
r>
gives the audio frontends a chance to catch up if they missed <br>
timer-periods or if they have to fill the pipewire backend buffer <br>
quickly after playback starts. The exact size is not critical, but to be <b=
r>
command line compatible with the pulseaudio backend, I suggest to use <br>
46ms. A large hw-&gt;samples value doesn&#39;t increase the playback latenc=
y.<br>
<br>
v-&gt;highwater_mark is the effective pipewire backend buffer size. At a <b=
r>
audio frame rate of 44100 frames/s, the code without this patch uses a <br>
buffer size of BUFFER_SAMPLES * periods / 44100 frames/s =3D 512 frames * <=
br>
3 / 44100 frames/s =3D 35ms. On my computer the buffer size has to be 30ms =
<br>
at minimum. I suggest to add a good margin and use a default of 46ms. <br>
This buffer is a larger contributor to the playback latency.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pw_thread_loop_unlock(c-&gt;thread_loop);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; @@ -606,7 +635,8 @@ qpw_init_in(HWVoiceIn *hw, struct audsettings *as,=
 void *drv_opaque)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0audio_pcm_init_info(&amp;hw-&gt;info, &amp;o=
bt_as);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* report the buffer size to qemu */<br>
&gt; -=C2=A0 =C2=A0 hw-&gt;samples =3D BUFFER_SAMPLES;<br>
&gt; +=C2=A0 =C2=A0 hw-&gt;samples =3D audio_buffer_frames(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_AudiodevPipewirePerDirectionOptions_=
base(ppdo), &amp;obt_as, 46440);<br>
&gt;=C2=A0 =C2=A0<br>
<br>
See qpw_init_out().<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pw_thread_loop_unlock(c-&gt;thread_loop);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; @@ -695,15 +725,8 @@ qpw_audio_init(Audiodev *dev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pw =3D g_new0(pwaudio, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pw_init(NULL, NULL);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 AudiodevPipewireOptions *popts;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_pw_audio_init(&quot;Initialize Pipewir=
e context\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0assert(dev-&gt;driver =3D=3D AUDIODEV_DRIVER=
_PIPEWIRE);<br>
&gt; -=C2=A0 =C2=A0 popts =3D &amp;dev-&gt;u.pipewire;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (!popts-&gt;has_latency) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 popts-&gt;has_latency =3D true;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 popts-&gt;latency =3D 15000;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pw-&gt;dev =3D dev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pw-&gt;thread_loop =3D pw_thread_loop_new(&q=
uot;Pipewire thread loop&quot;, NULL);<br>
&gt; @@ -781,7 +804,7 @@ static struct audio_pcm_ops qpw_pcm_ops =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.init_out =3D qpw_init_out,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.fini_out =3D qpw_fini_out,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D qpw_write,<br>
&gt; -=C2=A0 =C2=A0 .buffer_get_free =3D audio_generic_buffer_get_free,<br>
&gt; +=C2=A0 =C2=A0 .buffer_get_free =3D qpw_buffer_get_free,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.run_buffer_out =3D audio_generic_run_buffer=
_out,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.enable_out =3D qpw_enable_out,<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/qapi/audio.json b/qapi/audio.json<br>
&gt; index 9a0d7d9ece..d49a8a670b 100644<br>
&gt; --- a/qapi/audio.json<br>
&gt; +++ b/qapi/audio.json<br>
&gt; @@ -337,6 +337,7 @@<br>
&gt;=C2=A0 =C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cr=
eate multiple Pipewire devices or run multiple qemu<br>
&gt;=C2=A0 =C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in=
stances (default: audiodev&#39;s id, since 7.1)<br>
&gt;=C2=A0 =C2=A0#<br>
&gt; +# @latency: Pipewire backend buffer size in microseconds (default 464=
40)<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0# Since: 8.0<br>
&gt;=C2=A0 =C2=A0##<br>
&gt; @@ -344,7 +345,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;base&#39;: &#39;AudiodevPerDirectionOptions&#3=
9;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;data&#39;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*name&#39;: &#39;str&#39;,<br>
&gt; -=C2=A0 =C2=A0 &#39;*stream-name&#39;: &#39;str&#39; } }<br>
&gt; +=C2=A0 =C2=A0 &#39;*stream-name&#39;: &#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*latency&#39;: &#39;uint32&#39; } }<br>
&gt;=C2=A0 =C2=A0<br>
<br>
I suggest to use the same option names as the pulseaudio backend. <br>
out.latency is the effective Pipewire buffer size.<br>
<br>
With best regards,<br>
Volker<br>
<br>
&gt;=C2=A0 =C2=A0##<br>
&gt;=C2=A0 =C2=A0# @AudiodevPipewireOptions:<br>
&gt; @@ -355,16 +357,12 @@<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0# @out: options of the playback stream<br>
&gt;=C2=A0 =C2=A0#<br>
&gt; -# @latency: add latency to playback in microseconds<br>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(default 15000)<br>
&gt; -#<br>
&gt;=C2=A0 =C2=A0# Since: 8.0<br>
&gt;=C2=A0 =C2=A0##<br>
&gt;=C2=A0 =C2=A0{ &#39;struct&#39;: &#39;AudiodevPipewireOptions&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;data&#39;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*in&#39;:=C2=A0 =C2=A0 =C2=A0&#39;Audio=
devPipewirePerDirectionOptions&#39;,<br>
&gt; -=C2=A0 =C2=A0 &#39;*out&#39;:=C2=A0 =C2=A0 &#39;AudiodevPipewirePerDi=
rectionOptions&#39;,<br>
&gt; -=C2=A0 =C2=A0 &#39;*latency&#39;: &#39;uint32&#39; } }<br>
&gt; +=C2=A0 =C2=A0 &#39;*out&#39;:=C2=A0 =C2=A0 &#39;AudiodevPipewirePerDi=
rectionOptions&#39; } }<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0##<br>
&gt;=C2=A0 =C2=A0# @AudiodevSdlPerDirectionOptions:<br>
<br>
</blockquote></div>

--0000000000008b390f05f6c73e29--


