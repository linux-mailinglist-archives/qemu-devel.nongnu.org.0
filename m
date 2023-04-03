Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E2C6D42DC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 13:03:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjHy0-0002Nv-Kb; Mon, 03 Apr 2023 07:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pjHxs-0002Mu-DD
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 07:03:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pjHxq-000367-47
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 07:03:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680519785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KHUmRrsDTHJQk9p8HeeCCv2GeTBiBVZc2GRVmCBri0Q=;
 b=B8FuzUv1xg+COfWhwr6oCcgZSsxFq7d2tHPNCnp7TPtW+8Tu/0buIPjSC9g+NO0B7pBtVw
 TWsD8SHf/KZvAbKV5NyX8cTE/UDQSQwyFtTQkGFHbEogAaKCbn1T5EyijMEcD9K/iw7SyT
 GXT+1iwAIp7AesY+d+EgoPjqTIcChg8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-X5aTFBiXMoGl5l_L1FqEKQ-1; Mon, 03 Apr 2023 07:03:04 -0400
X-MC-Unique: X5aTFBiXMoGl5l_L1FqEKQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 a19-20020a05622a02d300b003e4ecb5f613so14111219qtx.21
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 04:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680519783; x=1683111783;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KHUmRrsDTHJQk9p8HeeCCv2GeTBiBVZc2GRVmCBri0Q=;
 b=iZDVEmAU028sZdpjGPO249zEMl9whzbC9StjsEFHqFKPkmeZqy9QpV1d/7MxX3JXuM
 12OAU75ah3meY7GMBiAd4b38CPVsZQI3PVL5xZq16yJV+fxYkLsyLb6ceZ4x/jkR/ge+
 Ct5dW7PKXe9ZD8aiBHI1X8NvhGyyhVSB/7n21PFgsP8Olw3fxPllSmtIlkUEdP2aDLjH
 s4BNekk21fVBpd8NeFNw5u0wsNtiyA0jou78EwRU9we+GFgDG3HCM8N/13I7HhaedF4c
 QP0p1nfxg0qXPTAcYAQKt3IkRrZTCysevoFtlV0fbq3GuWX4PxPqV1ERnSUPZ99QBxax
 gHUw==
X-Gm-Message-State: AAQBX9cnDI3GlvE0kluVQAkD78IMKJMCipKHQJeqKQ+PWuZaMKluCprg
 wkdAfuMkRTS8opKc5IdJycUZsrFg8Z3jMcp87o37tBNKY4fvh3uJOM17Np4BQ8SnKMkNt9n4yJY
 K+HDBTyxnZHksSFlBw2+fvgA8Bwd+ojw=
X-Received: by 2002:a05:620a:29ce:b0:74a:28c6:c1b3 with SMTP id
 s14-20020a05620a29ce00b0074a28c6c1b3mr2341252qkp.13.1680519783541; 
 Mon, 03 Apr 2023 04:03:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z3DoJzbJ6uonXRziEHWY0dir/Nz76o9BF2HBDHF3Ng5CI3XIWBjogq+/z8A/eI8YPGP76MAYgIw89FNUkWd1I=
X-Received: by 2002:a05:620a:29ce:b0:74a:28c6:c1b3 with SMTP id
 s14-20020a05620a29ce00b0074a28c6c1b3mr2341241qkp.13.1680519783152; Mon, 03
 Apr 2023 04:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230315164633.60924-1-dbassey@redhat.com>
 <325b0fd9-d435-e8c6-25cc-124e7ad68f8c@t-online.de>
 <CACzuRywrL7E4bj_85HyJxqkWXAh_--z-BQ4FURPS8ufPu=fAhw@mail.gmail.com>
 <9a02901b-77d9-5a79-69dd-7a45a9241d7e@t-online.de>
In-Reply-To: <9a02901b-77d9-5a79-69dd-7a45a9241d7e@t-online.de>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Mon, 3 Apr 2023 13:02:52 +0200
Message-ID: <CACzuRyyFOXaUpJ+OVKU1yTjqPH=qtFDisDNjp2ukg6Sy2kchQw@mail.gmail.com>
Subject: Re: [PATCH v8] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: qemu-devel@nongnu.org, marcandre.lureau@gmail.com, kraxel@redhat.com, 
 armbru@redhat.com, qemu_oss@crudebyte.com, pbonzini@redhat.com, 
 wtaymans@redhat.com
Content-Type: multipart/alternative; boundary="000000000000b6937f05f86c8016"
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

--000000000000b6937f05f86c8016
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volker,

Filling a buffer with zeros to produce silence still wrong for unsigned
> samples. For example, a 0 in SPA_AUDIO_FORMAT_U8 format maps to -1.0 in
> SPA_AUDIO_FORMAT_F32.
>
This is a bug. On a buffer underrun, the buffer filled with silence is
> dropped.
>
What are your suggestions to improve this?

Why don't you need a lock here? Is pw_stream_set_active() thread safe?
>
I will put a lock there, Thanks.

You only have the three volume levels 2.0, 1.0 and 0.0 while vol[i] has
> 256 levels.
>
Ack.

It's an optimization. Evaluating req =3D (uint64_t)v->g->dev->timer_period
> * v->info.rate * 1 / 2 / 1000000 * v->frame_size once in qpw_init_out()
> vs. a lot of needless evaluations every few milliseconds in the callback.
>
Ack

 <http://out.name> options. Please
>
Can you please clarify WYM here?

Thanks,
Dorinda

On Mon, Apr 3, 2023 at 8:51=E2=80=AFAM Volker R=C3=BCmelin <vr_qemu@t-onlin=
e.de> wrote:

> Am 28.03.23 um 13:56 schrieb Dorinda Bassey:
>
> Hi Dorinda,
>
> > Hi Volker,
> >
> > Thanks for the feedback.
> >
> >     This term is constant for the lifetime of the playback stream. It
> >     could
> >     be precalculated in qpw_init_out().
> >
> > It's still constant even when precalculated in qpw_init_out().
>
> It's an optimization. Evaluating req =3D (uint64_t)v->g->dev->timer_perio=
d
> * v->info.rate * 1 / 2 / 1000000 * v->frame_size once in qpw_init_out()
> vs. a lot of needless evaluations every few milliseconds in the callback.
>
> With best regards,
> Volker
>
> >
> >     The if (!v->enabled) block isn't needed. When the guest stops the
> >     playback stream, it won't write new samples. After the pipewire
> >     ringbuffer is drained, avail is always 0. It's better to drain the
> >     ringbuffer, otherwise the first thing you will hear after playback
> >     starts again will be stale audio samples.
> >
> >     You removed the code to play silence on a buffer underrun. I
> >     suggest to
> >     add it again. Use a trace point with the "simple" trace backend to
> >     see
> >     how often pipewire now calls the callback in short succession for a
> >     disabled stream before giving up. Please read again Marc-Andr=C3=A9=
's
> >     comments for the v7 version of the
> >     pipewire backend. When the guest enables/disables an audio stream,
> >     pipewire should know this. It's unnecessary that pipewire calls the
> >     callback code for disabled streams. Don't forget to connect the
> >     stream
> >     with the flag PW_STREAM_FLAG_INACTIVE. Every QEMU audio device
> >     enables
> >     the stream before playback/recording starts. The pcm_ops functions
> >     volume_out and volume_in are missing. Probably
> >     SPA_PROP_channelVolumes can be used to adjust the stream volumes.
> >     Without these functions the guest can adjust the stream volume and
> >     the
> >     host has an independent way to adjust the stream volume. This is
> >     sometimes irritating.
> >
> >     The pipewire backend code doesn't use the in|out.name
> >     <http://out.name> options. Please
> >     either remove the name options or add code to connect to the
> >     specified
> >     source/sink. I would prefer the latter. PW_KEY_TARGET_OBJECT looks
> >     promising.
> >
> > Ack.
> >
> > Thanks,
> > Dorinda.
> >
> >
> >
> > On Mon, Mar 20, 2023 at 7:31=E2=80=AFAM Volker R=C3=BCmelin <vr_qemu@t-=
online.de>
> > wrote:
> >
> >
> >     > diff --git a/audio/trace-events b/audio/trace-events
> >     > index e1ab643add..e0acf9ac56 100644
> >     > --- a/audio/trace-events
> >     > +++ b/audio/trace-events
> >     > @@ -18,6 +18,13 @@ dbus_audio_register(const char *s, const char
> >     *dir) "sender =3D %s, dir =3D %s"
> >     >   dbus_audio_put_buffer_out(size_t len) "len =3D %zu"
> >     >   dbus_audio_read(size_t len) "len =3D %zu"
> >     >
> >     > +# pwaudio.c
> >     > +pw_state_changed(const char *s) "stream state: %s"
> >     > +pw_node(int nodeid) "node id: %d"
> >     > +pw_read(int32_t avail, uint32_t index, size_t len) "avail=3D%u
> >     index=3D%u len=3D%zu"
> >     > +pw_write(int32_t filled, int32_t avail, uint32_t index, size_t
> >     len) "filled=3D%u avail=3D%u index=3D%u len=3D%zu"
> >     > +pw_audio_init(void) "Initialize Pipewire context"
> >     > +
> >
> >     Hi Dorinda,
> >
> >     the format specifiers and parameter types don't always match.
> >
> >     With  best regards,
> >     Volker
> >
> >     >   # audio.c
> >     >   audio_timer_start(int interval) "interval %d ms"
> >     >   audio_timer_stop(void) ""
> >     >
> >
>
>

--000000000000b6937f05f86c8016
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Volker,</div><span class=3D"gmail-im"><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div>Filling a buffer =
with zeros to produce silence still wrong for unsigned <br>
samples. For example, a 0 in SPA_AUDIO_FORMAT_U8 format maps to -1.0 in <br=
>
SPA_AUDIO_FORMAT_F32.<span><br></span></div></blockquote></span><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div>This is a bug. On a buffer unde=
rrun, the buffer filled with silence is <br>
dropped. <br></div></blockquote><div>What are your suggestions to improve t=
his? <br></div><span class=3D"gmail-im"><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div>Why don&#39;t you need a lock here? Is p=
w_stream_set_active() thread safe?<span><br></span></div></blockquote></spa=
n><div>I will put a lock there, Thanks. <br></div><span class=3D"gmail-im">=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>You o=
nly have the three volume levels 2.0, 1.0 and 0.0 while vol[i] has <br>
256 levels.</div></blockquote></span><div>Ack.</div><span class=3D"gmail-im=
"><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>It&=
#39;s an optimization. Evaluating req =3D (uint64_t)v-&gt;g-&gt;dev-&gt;tim=
er_period <br>
* v-&gt;info.rate * 1 / 2 / 1000000 * v-&gt;frame_size once in qpw_init_out=
() <br>
vs. a lot of needless evaluations every few milliseconds in the callback.<b=
r></div></blockquote></span><div>Ack</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div>=C2=A0&lt;<a href=3D"http://out.name"=
 rel=3D"noreferrer" target=3D"_blank">http://out.name</a>&gt; options. Plea=
se</div></blockquote><div>Can you please clarify WYM here?</div><div><br></=
div><div>Thanks,</div><div>Dorinda </div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 3, 2023 at 8:51=E2=80=
=AFAM Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de">vr_qem=
u@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Am 28.03.23 um 13:56 schrieb Dorinda Bassey:<br>
<br>
Hi Dorinda,<br>
<br>
&gt; Hi Volker,<br>
&gt;<br>
&gt; Thanks for the feedback.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0This term is constant for the lifetime of the playb=
ack stream. It<br>
&gt;=C2=A0 =C2=A0 =C2=A0could<br>
&gt;=C2=A0 =C2=A0 =C2=A0be precalculated in qpw_init_out().<br>
&gt;<br>
&gt; It&#39;s still constant even when precalculated in qpw_init_out().<br>
<br>
It&#39;s an optimization. Evaluating req =3D (uint64_t)v-&gt;g-&gt;dev-&gt;=
timer_period <br>
* v-&gt;info.rate * 1 / 2 / 1000000 * v-&gt;frame_size once in qpw_init_out=
() <br>
vs. a lot of needless evaluations every few milliseconds in the callback.<b=
r>
<br>
With best regards,<br>
Volker<br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The if (!v-&gt;enabled) block isn&#39;t needed. Whe=
n the guest stops the<br>
&gt;=C2=A0 =C2=A0 =C2=A0playback stream, it won&#39;t write new samples. Af=
ter the pipewire<br>
&gt;=C2=A0 =C2=A0 =C2=A0ringbuffer is drained, avail is always 0. It&#39;s =
better to drain the<br>
&gt;=C2=A0 =C2=A0 =C2=A0ringbuffer, otherwise the first thing you will hear=
 after playback<br>
&gt;=C2=A0 =C2=A0 =C2=A0starts again will be stale audio samples.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0You removed the code to play silence on a buffer un=
derrun. I<br>
&gt;=C2=A0 =C2=A0 =C2=A0suggest to<br>
&gt;=C2=A0 =C2=A0 =C2=A0add it again. Use a trace point with the &quot;simp=
le&quot; trace backend to<br>
&gt;=C2=A0 =C2=A0 =C2=A0see<br>
&gt;=C2=A0 =C2=A0 =C2=A0how often pipewire now calls the callback in short =
succession for a<br>
&gt;=C2=A0 =C2=A0 =C2=A0disabled stream before giving up. Please read again=
 Marc-Andr=C3=A9&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0comments for the v7 version of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0pipewire backend. When the guest enables/disables a=
n audio stream,<br>
&gt;=C2=A0 =C2=A0 =C2=A0pipewire should know this. It&#39;s unnecessary tha=
t pipewire calls the<br>
&gt;=C2=A0 =C2=A0 =C2=A0callback code for disabled streams. Don&#39;t forge=
t to connect the<br>
&gt;=C2=A0 =C2=A0 =C2=A0stream<br>
&gt;=C2=A0 =C2=A0 =C2=A0with the flag PW_STREAM_FLAG_INACTIVE. Every QEMU a=
udio device<br>
&gt;=C2=A0 =C2=A0 =C2=A0enables<br>
&gt;=C2=A0 =C2=A0 =C2=A0the stream before playback/recording starts. The pc=
m_ops functions<br>
&gt;=C2=A0 =C2=A0 =C2=A0volume_out and volume_in are missing. Probably<br>
&gt;=C2=A0 =C2=A0 =C2=A0SPA_PROP_channelVolumes can be used to adjust the s=
tream volumes.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Without these functions the guest can adjust the st=
ream volume and<br>
&gt;=C2=A0 =C2=A0 =C2=A0the<br>
&gt;=C2=A0 =C2=A0 =C2=A0host has an independent way to adjust the stream vo=
lume. This is<br>
&gt;=C2=A0 =C2=A0 =C2=A0sometimes irritating.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The pipewire backend code doesn&#39;t use the in|<a=
 href=3D"http://out.name" rel=3D"noreferrer" target=3D"_blank">out.name</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://out.name" rel=3D"noreferrer" =
target=3D"_blank">http://out.name</a>&gt; options. Please<br>
&gt;=C2=A0 =C2=A0 =C2=A0either remove the name options or add code to conne=
ct to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0specified<br>
&gt;=C2=A0 =C2=A0 =C2=A0source/sink. I would prefer the latter. PW_KEY_TARG=
ET_OBJECT looks<br>
&gt;=C2=A0 =C2=A0 =C2=A0promising.<br>
&gt;<br>
&gt; Ack.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Dorinda.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Mar 20, 2023 at 7:31=E2=80=AFAM Volker R=C3=BCmelin &lt;<a hre=
f=3D"mailto:vr_qemu@t-online.de" target=3D"_blank">vr_qemu@t-online.de</a>&=
gt; <br>
&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/audio/trace-events b/audio/trace-=
events<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index e1ab643add..e0acf9ac56 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/audio/trace-events<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/audio/trace-events<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -18,6 +18,13 @@ dbus_audio_register(const c=
har *s, const char<br>
&gt;=C2=A0 =C2=A0 =C2=A0*dir) &quot;sender =3D %s, dir =3D %s&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0dbus_audio_put_buffer_out(size_t l=
en) &quot;len =3D %zu&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0dbus_audio_read(size_t len) &quot;=
len =3D %zu&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# pwaudio.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +pw_state_changed(const char *s) &quot;stream =
state: %s&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +pw_node(int nodeid) &quot;node id: %d&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +pw_read(int32_t avail, uint32_t index, size_t=
 len) &quot;avail=3D%u<br>
&gt;=C2=A0 =C2=A0 =C2=A0index=3D%u len=3D%zu&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +pw_write(int32_t filled, int32_t avail, uint3=
2_t index, size_t<br>
&gt;=C2=A0 =C2=A0 =C2=A0len) &quot;filled=3D%u avail=3D%u index=3D%u len=3D=
%zu&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +pw_audio_init(void) &quot;Initialize Pipewire=
 context&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Dorinda,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0the format specifiers and parameter types don&#39;t=
 always match.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0With=C2=A0 best regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Volker<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0# audio.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0audio_timer_start(int interval) &q=
uot;interval %d ms&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0audio_timer_stop(void) &quot;&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000b6937f05f86c8016--


