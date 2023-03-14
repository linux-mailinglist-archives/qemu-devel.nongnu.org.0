Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EED86B921B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 12:52:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc3B4-00030V-Gs; Tue, 14 Mar 2023 07:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pc3B2-00030J-Ar
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:50:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pc3Az-0004vO-Ua
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:50:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678794644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=81ynRowFUTdyFXwti2nsOsNFapKkhI5ab6VjyPkV/Sw=;
 b=MzDmCVc+BWMZMASVAD+1RA8XrH4Z6Pmxne7O7EBDTasJDuCu/inL0Q6Y0RmM4MEu6kxLRW
 x00Gd52NBIDTIiOt81UB6UEVDJ1oqJE21ztBxC3adzW2qBdiDf+gdufD8/rr8HpcWeiHaW
 suvjpIrZTj8cCVpIVJBMv4+ilE8r524=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-UQZMRxhZMGGn8CCcwSmwZg-1; Tue, 14 Mar 2023 07:50:43 -0400
X-MC-Unique: UQZMRxhZMGGn8CCcwSmwZg-1
Received: by mail-qv1-f71.google.com with SMTP id
 dg8-20020a056214084800b005acc280bf19so514340qvb.22
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 04:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678794642;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=81ynRowFUTdyFXwti2nsOsNFapKkhI5ab6VjyPkV/Sw=;
 b=yp+kAVddn4fwOYqLZG+7juEtqw9WLmiroPxyab48bufHHhwxVhJAuDBLTc9ECZmctG
 KVOo9LykT+O9A5vvvKag85h4LNIX9jas4QQYztPJoav2uC9Qu5gTXdYjfrLS5KnIWuBd
 68rg6vf2aLFdx3tUg36bVfaiNk81EQAb/mvs+02WjEo9A/4u4i0rnXupMY4OV7lfP6nZ
 av4wLmsC+GT4Iy+Rk2smHGTrSQvbr0rci1cusJMnQyGbK163AHz6R4/wF1D8sX/R1Lgw
 oWsbh9OZaDG8oa72wKrmCQGX8VwwPHUj07iILjlu64vmd00V+gZ8W1PPXgg7aAAq50pu
 SrEQ==
X-Gm-Message-State: AO0yUKUcEP9jKDhZ8xMJFzvdqIuxo9ksfDgpUw36p3h0Ybv4+ou3ezUA
 KE23KLCcXuDwYHtbdSJMxYMWD3Kf04wDG7Ml+Fi9220tMNOyRpWwT4EDXkX+U4YV5dAgwEbcgrB
 /LSLi0HJq1efyw/7++I8htmYToHsJkQo=
X-Received: by 2002:ad4:58ac:0:b0:56e:a0b1:8a9e with SMTP id
 ea12-20020ad458ac000000b0056ea0b18a9emr2700383qvb.9.1678794642463; 
 Tue, 14 Mar 2023 04:50:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set/HX3/ZDlTkU76sFoA6/bDkhbIChZFhMytpBeJFOlqk0m0JaKwe8FXXwmVdnT8cRz/dt5q0WSgZi14la5tNJSg=
X-Received: by 2002:ad4:58ac:0:b0:56e:a0b1:8a9e with SMTP id
 ea12-20020ad458ac000000b0056ea0b18a9emr2700377qvb.9.1678794642210; Tue, 14
 Mar 2023 04:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <a3717185-a930-e8e7-80cc-edb8d9e4d01d@t-online.de>
 <20230311120826.5584-1-vr_qemu@t-online.de>
 <5179fdbb-54f2-a24b-d9e0-fea89c5528fd@t-online.de>
 <CACzuRyzZu1iw_KS-bQO=ZM2oEhZC=6BG2w7XE=Fyndpwi+jkQw@mail.gmail.com>
 <b7679119-44dc-0027-1819-2886bad79ce5@t-online.de>
In-Reply-To: <b7679119-44dc-0027-1819-2886bad79ce5@t-online.de>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Tue, 14 Mar 2023 12:50:30 +0100
Message-ID: <CACzuRyyaXs43it58LPiwvTRa9ELPUtTKFkiqGSUj9ap-0BaohA@mail.gmail.com>
Subject: Re: [PATCH] DO-NOT-MERGE: pipewire sample code
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wtaymans@redhat.com, 
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004ccfdc05f6dad6b5"
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

--0000000000004ccfdc05f6dad6b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volker,

Thank you for the clarification. I see the problem now.
So is it safe to say that:

@@ -104,8 +104,9 @@ playback_on_process(void *data)
     /* calculate the total no of bytes to read data from buffer */
     req =3D b->requested * v->frame_size;
     if (req =3D=3D 0) {
-        req =3D 4096 * v->frame_size;
+        req =3D v->g->dev->timer_period * v->info.rate * v->frame_size * 1=
 /
2 / 1000000;
     }

I used 50% of the timer-period and the frame_size which would give a close
margin to what the downstream audio device writes to the DAC.

Thanks,
Dorinda.

On Mon, Mar 13, 2023 at 9:06=E2=80=AFPM Volker R=C3=BCmelin <vr_qemu@t-onli=
ne.de> wrote:

> Am 13.03.23 um 13:28 schrieb Dorinda Bassey:
> > Hi Volker,
> >
> > Thanks for the patch, I've tested the patch and it works. I don't hear
> > the choppy audio with this option "qemu-system-x86_64 -device
> > ich9-intel-hda -device hda-duplex,audiodev=3Daudio0 -audiodev
> > pipewire,id=3Daudio0,out.frequency=3D96000,in.frequency=3D96000 ...."
> >
> >     I don't understand how the req =3D=3D 0 case can work at all.
> >
> > how this works is that  b->requested could be zero when no suggestion
> > is provided. For playback streams, this field contains the suggested
> > amount of data to provide. hence the reason for this check.
>
> Hi Dorinda,
>
> there has to be a control mechanism that ensures that our write rate on
> average is exactly the frame rate that the down stream audio device
> writes to the DAC. My question was how can this work if we always write
> 4096 frames.
>
> The answer is, that after a 4096 frames write, the callback is delayed
> by 4096 frames / 44100 frames/s =3D 93ms. This ensures that our write rat=
e
> is exactly 44100 frames/s.
>
> This means a fixed 4096 frames write is wrong for the req =3D=3D 0 case. =
We
> have to write 75% of timer-period frames.
>
> If you want to test this yourself, just ignore req and assume it's 0.
>
> With best regards,
> Volker
>
> >
> >     I suggest to use the same option names as the pulseaudio backend.
> >     out.latency is the effective Pipewire buffer size.
> >
> > Ack.
> >
> > Thanks,
> > Dorinda.
> >
> >
> > On Sat, Mar 11, 2023 at 5:19=E2=80=AFPM Volker R=C3=BCmelin <vr_qemu@t-=
online.de>
> > wrote:
> >
> >     > Based-on:<20230306171020.381116-1-dbassey@redhat.com>
> >     > ([PATCH v7] audio/pwaudio.c: Add Pipewire audio backend for QEMU)
> >     >
> >     > This is sample code for the review of the pipewire backed. The
> >     > code actually works.
> >     >
> >     > An email with explanations for the changes will follow.
> >     >
> >     > Signed-off-by: Volker R=C3=BCmelin<vr_qemu@t-online.de>
> >     > ---
> >     >   audio/pwaudio.c | 67
> >     +++++++++++++++++++++++++++++++++----------------
> >     >   qapi/audio.json | 10 +++-----
> >     >   2 files changed, 49 insertions(+), 28 deletions(-)
> >     >
> >     > diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> >     > index d357761152..8e2a38938f 100644
> >     > --- a/audio/pwaudio.c
> >     > +++ b/audio/pwaudio.c
> >     > @@ -23,7 +23,6 @@
> >     >   #define AUDIO_CAP "pipewire"
> >     >   #define RINGBUFFER_SIZE    (1u << 22)
> >     >   #define RINGBUFFER_MASK    (RINGBUFFER_SIZE - 1)
> >     > -#define BUFFER_SAMPLES    512
> >     >
> >     >   #include "audio_int.h"
> >     >
> >     > @@ -48,6 +47,7 @@ typedef struct PWVoice {
> >     >       struct pw_stream *stream;
> >     >       struct spa_hook stream_listener;
> >     >       struct spa_audio_info_raw info;
> >     > +    uint32_t highwater_mark;
> >     >       uint32_t frame_size;
> >     >       struct spa_ringbuffer ring;
> >     >       uint8_t buffer[RINGBUFFER_SIZE];
> >     > @@ -82,7 +82,7 @@ playback_on_process(void *data)
> >     >       void *p;
> >     >       struct pw_buffer *b;
> >     >       struct spa_buffer *buf;
> >     > -    uint32_t n_frames, req, index, n_bytes;
> >     > +    uint32_t req, index, n_bytes;
> >     >       int32_t avail;
> >     >
> >     >       if (!v->stream) {
> >     > @@ -105,8 +105,7 @@ playback_on_process(void *data)
> >     >       if (req =3D=3D 0) {
> >     >           req =3D 4096 * v->frame_size;
> >     >       }
> >
> >     I don't understand how the req =3D=3D 0 case can work at all. The
> >     downstream
> >     audio device is the thinnest point in the playback stream. We can't
> >     write more audio frames than the audio device will consume.
> >
>
>

--0000000000004ccfdc05f6dad6b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Volker,</div><div><br></div><div>Thank you for the=
 clarification. I see the problem now. <br></div><div>So is it safe to say =
that:</div><div><br></div><div>@@ -104,8 +104,9 @@ playback_on_process(void=
 *data)<br>=C2=A0 =C2=A0 =C2=A0/* calculate the total no of bytes to read d=
ata from buffer */<br>=C2=A0 =C2=A0 =C2=A0req =3D b-&gt;requested * v-&gt;f=
rame_size;<br>=C2=A0 =C2=A0 =C2=A0if (req =3D=3D 0) {<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0req =3D 4096 * v-&gt;frame_size;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0req =3D v-&gt;g-&gt;dev-&gt;timer_period * v-&gt;info.rate * v-&gt;frame=
_size * 1 / 2 / 1000000;<br>=C2=A0 =C2=A0 =C2=A0}</div><div><br></div><div>=
I used 50% of the timer-period and the frame_size which would give a close =
margin to what the downstream audio device writes to the DAC.</div><div><br=
></div><div>Thanks,</div><div>Dorinda.<br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 13, 2023 at 9:0=
6=E2=80=AFPM Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de"=
>vr_qemu@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Am 13.03.23 um 13:28 schrieb Dorinda Bassey:<br>
&gt; Hi Volker,<br>
&gt;<br>
&gt; Thanks for the patch, I&#39;ve tested the patch and it works. I don&#3=
9;t hear <br>
&gt; the choppy audio with this option &quot;qemu-system-x86_64 -device <br=
>
&gt; ich9-intel-hda -device hda-duplex,audiodev=3Daudio0 -audiodev <br>
&gt; pipewire,id=3Daudio0,out.frequency=3D96000,in.frequency=3D96000 ....&q=
uot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I don&#39;t understand how the req =3D=3D 0 case ca=
n work at all.<br>
&gt;<br>
&gt; how this works is that=C2=A0 b-&gt;requested could be zero when no sug=
gestion <br>
&gt; is provided. For playback streams, this field contains the suggested <=
br>
&gt; amount of data to provide. hence the reason for this check.<br>
<br>
Hi Dorinda,<br>
<br>
there has to be a control mechanism that ensures that our write rate on <br=
>
average is exactly the frame rate that the down stream audio device <br>
writes to the DAC. My question was how can this work if we always write <br=
>
4096 frames.<br>
<br>
The answer is, that after a 4096 frames write, the callback is delayed <br>
by 4096 frames / 44100 frames/s =3D 93ms. This ensures that our write rate =
<br>
is exactly 44100 frames/s.<br>
<br>
This means a fixed 4096 frames write is wrong for the req =3D=3D 0 case. We=
 <br>
have to write 75% of timer-period frames.<br>
<br>
If you want to test this yourself, just ignore req and assume it&#39;s 0.<b=
r>
<br>
With best regards,<br>
Volker<br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I suggest to use the same option names as the pulse=
audio backend.<br>
&gt;=C2=A0 =C2=A0 =C2=A0out.latency is the effective Pipewire buffer size.<=
br>
&gt;<br>
&gt; Ack.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Dorinda.<br>
&gt;<br>
&gt;<br>
&gt; On Sat, Mar 11, 2023 at 5:19=E2=80=AFPM Volker R=C3=BCmelin &lt;<a hre=
f=3D"mailto:vr_qemu@t-online.de" target=3D"_blank">vr_qemu@t-online.de</a>&=
gt; <br>
&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Based-on:&lt;<a href=3D"mailto:20230306171020.=
381116-1-dbassey@redhat.com" target=3D"_blank">20230306171020.381116-1-dbas=
sey@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ([PATCH v7] audio/pwaudio.c: Add Pipewire audi=
o backend for QEMU)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This is sample code for the review of the pipe=
wire backed. The<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; code actually works.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; An email with explanations for the changes wil=
l follow.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Volker R=C3=BCmelin&lt;<a href=
=3D"mailto:vr_qemu@t-online.de" target=3D"_blank">vr_qemu@t-online.de</a>&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0audio/pwaudio.c | 67<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++++++++++++++++----------------<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0qapi/audio.json | 10 +++-----<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A02 files changed, 49 insertions(+),=
 28 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/audio/pwaudio.c b/audio/pwaudio.c=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index d357761152..8e2a38938f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/audio/pwaudio.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/audio/pwaudio.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -23,7 +23,6 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0#define AUDIO_CAP &quot;pipewire&q=
uot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0#define RINGBUFFER_SIZE=C2=A0 =C2=
=A0 (1u &lt;&lt; 22)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0#define RINGBUFFER_MASK=C2=A0 =C2=
=A0 (RINGBUFFER_SIZE - 1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -#define BUFFER_SAMPLES=C2=A0 =C2=A0 512<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0#include &quot;audio_int.h&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -48,6 +47,7 @@ typedef struct PWVoice {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pw_stream *st=
ream;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct spa_hook stre=
am_listener;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct spa_audio_inf=
o_raw info;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 uint32_t highwater_mark;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t frame_size;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct spa_ringbuffe=
r ring;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t buffer[RINGB=
UFFER_SIZE];<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -82,7 +82,7 @@ playback_on_process(void *da=
ta)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void *p;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pw_buffer *b;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct spa_buffer *b=
uf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 uint32_t n_frames, req, index, =
n_bytes;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 uint32_t req, index, n_bytes;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int32_t avail;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!v-&gt;stream) {=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -105,8 +105,7 @@ playback_on_process(void *=
data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (req =3D=3D 0) {<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0req =
=3D 4096 * v-&gt;frame_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I don&#39;t understand how the req =3D=3D 0 case ca=
n work at all. The<br>
&gt;=C2=A0 =C2=A0 =C2=A0downstream<br>
&gt;=C2=A0 =C2=A0 =C2=A0audio device is the thinnest point in the playback =
stream. We can&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0write more audio frames than the audio device will =
consume.<br>
&gt;<br>
<br>
</blockquote></div>

--0000000000004ccfdc05f6dad6b5--


