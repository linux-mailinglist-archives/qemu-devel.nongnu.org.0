Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7276CBE3A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 13:56:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph7wI-0003SY-26; Tue, 28 Mar 2023 07:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1ph7wE-0003Fj-GX
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:56:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1ph7wC-0007ZX-DR
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680004586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AdXR+qqKb1wix5Z2cX0A0iXro/0Iu6b1jUE5+lum1No=;
 b=P1+vhfAVgeTH9HG21WWXH6M3uPsL8gDNplBtlkMXd1TFSPuP9LG1oeWne2jcoBL4H/h1UP
 VIg0KEUd2BR6RZOdEDF7TJTCVyuKmr/075foN7iz8BSRviDkXgHV3KgBYIw1ywBsqD0QnY
 FeBPkJia9xRB3gk2dUe2fEhnXcWHDn8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-NEpCQJk8Oh6dMBjlaPxgjA-1; Tue, 28 Mar 2023 07:56:24 -0400
X-MC-Unique: NEpCQJk8Oh6dMBjlaPxgjA-1
Received: by mail-qk1-f200.google.com with SMTP id
 pc36-20020a05620a842400b00742c715894bso5464208qkn.21
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 04:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680004584;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AdXR+qqKb1wix5Z2cX0A0iXro/0Iu6b1jUE5+lum1No=;
 b=5JjT8XnR4822prT9VIE40ledSn7sHcSjP4Hif3tqnEB5iWy6B1voFfHtA6arWXnChZ
 S694fACkmP/sliDwfFvdQqHLKkS9aS99yWIK0pBcUPN16fkpYFI9ZRynWJfno/pp68if
 /GEJaOFnVtBEv6PytUL4tSYDisukXQfxxtAPvFVh4PI4RWzg99fpuHc4sttkZi4llikQ
 +dhxMcAIEMINafHvoLkz+3zM7sBsF3w9NeQtmkoZZ56yYzODbQNLE+elLBGi12C1YK+s
 G0L2IbeRxPwHR5hTyHTc1d05CwE5wq2wNOeMA4HRvW+6OsEDedFR8M1xSg2/fBeeB4kh
 SyzQ==
X-Gm-Message-State: AO0yUKVrHp72pPDADtlbgNwuyHJra9+icre+ILgrS8q6u0ew1tM+otw8
 elZYTOh+3x4ydIiYQwyEc8YPP8JF0ITDutu8lr5EGzsrjZaVs0mzrYvbDfEoylD0uWxTlpnQJzp
 ClnAjlXHy1IgOmyYY9l6/vRKKzBT+y6M=
X-Received: by 2002:a05:620a:3186:b0:745:a35f:ad71 with SMTP id
 bi6-20020a05620a318600b00745a35fad71mr3953192qkb.13.1680004584377; 
 Tue, 28 Mar 2023 04:56:24 -0700 (PDT)
X-Google-Smtp-Source: AK7set9SkdyLVnGrzDv3Vy8EqtU9PGb/zFgwWjMijFRpO7Js/h4ofgV8Qda4JylTQxNtdl22DfEY6D8wOHdHgIqM9Lk=
X-Received: by 2002:a05:620a:3186:b0:745:a35f:ad71 with SMTP id
 bi6-20020a05620a318600b00745a35fad71mr3953181qkb.13.1680004584086; Tue, 28
 Mar 2023 04:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230315164633.60924-1-dbassey@redhat.com>
 <325b0fd9-d435-e8c6-25cc-124e7ad68f8c@t-online.de>
In-Reply-To: <325b0fd9-d435-e8c6-25cc-124e7ad68f8c@t-online.de>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Tue, 28 Mar 2023 13:56:13 +0200
Message-ID: <CACzuRywrL7E4bj_85HyJxqkWXAh_--z-BQ4FURPS8ufPu=fAhw@mail.gmail.com>
Subject: Re: [PATCH v8] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: qemu-devel@nongnu.org, marcandre.lureau@gmail.com, kraxel@redhat.com, 
 armbru@redhat.com, qemu_oss@crudebyte.com, pbonzini@redhat.com, 
 wtaymans@redhat.com
Content-Type: multipart/alternative; boundary="00000000000074b29005f7f48c71"
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

--00000000000074b29005f7f48c71
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volker,

Thanks for the feedback.

This term is constant for the lifetime of the playback stream. It could
> be precalculated in qpw_init_out().
>
It's still constant even when precalculated in qpw_init_out().

The if (!v->enabled) block isn't needed. When the guest stops the
> playback stream, it won't write new samples. After the pipewire
> ringbuffer is drained, avail is always 0. It's better to drain the
> ringbuffer, otherwise the first thing you will hear after playback
> starts again will be stale audio samples.
>
> You removed the code to play silence on a buffer underrun. I suggest to
> add it again. Use a trace point with the "simple" trace backend to see
> how often pipewire now calls the callback in short succession for a
> disabled stream before giving up. Please read again Marc-Andr=C3=A9's com=
ments
> for the v7 version of the
> pipewire backend. When the guest enables/disables an audio stream,
> pipewire should know this. It's unnecessary that pipewire calls the
> callback code for disabled streams. Don't forget to connect the stream
> with the flag PW_STREAM_FLAG_INACTIVE. Every QEMU audio device enables
> the stream before playback/recording starts. The pcm_ops functions
> volume_out and volume_in are missing. Probably
> SPA_PROP_channelVolumes can be used to adjust the stream volumes.
> Without these functions the guest can adjust the stream volume and the
> host has an independent way to adjust the stream volume. This is
> sometimes irritating.
>
The pipewire backend code doesn't use the in|out.name options. Please
> either remove the name options or add code to connect to the specified
> source/sink. I would prefer the latter. PW_KEY_TARGET_OBJECT looks
> promising.
>
Ack.

Thanks,
Dorinda.



On Mon, Mar 20, 2023 at 7:31=E2=80=AFAM Volker R=C3=BCmelin <vr_qemu@t-onli=
ne.de> wrote:

>
> > diff --git a/audio/trace-events b/audio/trace-events
> > index e1ab643add..e0acf9ac56 100644
> > --- a/audio/trace-events
> > +++ b/audio/trace-events
> > @@ -18,6 +18,13 @@ dbus_audio_register(const char *s, const char *dir)
> "sender =3D %s, dir =3D %s"
> >   dbus_audio_put_buffer_out(size_t len) "len =3D %zu"
> >   dbus_audio_read(size_t len) "len =3D %zu"
> >
> > +# pwaudio.c
> > +pw_state_changed(const char *s) "stream state: %s"
> > +pw_node(int nodeid) "node id: %d"
> > +pw_read(int32_t avail, uint32_t index, size_t len) "avail=3D%u index=
=3D%u
> len=3D%zu"
> > +pw_write(int32_t filled, int32_t avail, uint32_t index, size_t len)
> "filled=3D%u avail=3D%u index=3D%u len=3D%zu"
> > +pw_audio_init(void) "Initialize Pipewire context"
> > +
>
> Hi Dorinda,
>
> the format specifiers and parameter types don't always match.
>
> With  best regards,
> Volker
>
> >   # audio.c
> >   audio_timer_start(int interval) "interval %d ms"
> >   audio_timer_stop(void) ""
> >
>
>

--00000000000074b29005f7f48c71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Volker,</div><div><br></div><div>Thanks for the fe=
edback.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div>This term is constant for the lifetime of the playback stream. It c=
ould <br>
be precalculated in qpw_init_out().<span><br></span></div></blockquote><div=
>It&#39;s still constant even when precalculated in qpw_init_out().</div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>The if =
(!v-&gt;enabled) block isn&#39;t needed. When the guest stops the <br>
playback stream, it won&#39;t write new samples. After the pipewire <br>
ringbuffer is drained, avail is always 0. It&#39;s better to drain the <br>
ringbuffer, otherwise the first thing you will hear after playback <br>
starts again will be stale audio samples.<br>
<br>
You removed the code to play silence on a buffer underrun. I suggest to <br=
>
add it again. Use a trace point with the &quot;simple&quot; trace backend t=
o see <br>
how often pipewire now calls the callback in short succession for a <br>
disabled stream before giving up.
Please read again Marc-Andr=C3=A9&#39;s comments for the v7 version of the =
<br>
pipewire backend. When the guest enables/disables an audio stream, <br>
pipewire should know this. It&#39;s unnecessary that pipewire calls the <br=
>
callback code for disabled streams. Don&#39;t forget to connect the stream =
<br>
with the flag PW_STREAM_FLAG_INACTIVE. Every QEMU audio device enables <br>
the stream before playback/recording starts.
The pcm_ops functions volume_out and volume_in are missing. Probably <br>
SPA_PROP_channelVolumes can be used to adjust the stream volumes. <br>
Without these functions the guest can adjust the stream volume and the <br>
host has an independent way to adjust the stream volume. This is <br>
sometimes irritating.</div></blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div>The pipewire backend code doesn&#39;t use the in|<a hre=
f=3D"http://out.name" rel=3D"noreferrer" target=3D"_blank">out.name</a> opt=
ions. Please <br>
either remove the name options or add code to connect to the specified <br>
source/sink. I would prefer the latter. PW_KEY_TARGET_OBJECT looks <br>
promising.</div></blockquote><div>Ack.</div><div><br></div><div>Thanks,</di=
v><div>Dorinda. <br></div><div><br></div><div><br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 20, 202=
3 at 7:31=E2=80=AFAM Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-on=
line.de" target=3D"_blank">vr_qemu@t-online.de</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt; diff --git a/audio/trace-events b/audio/trace-events<br>
&gt; index e1ab643add..e0acf9ac56 100644<br>
&gt; --- a/audio/trace-events<br>
&gt; +++ b/audio/trace-events<br>
&gt; @@ -18,6 +18,13 @@ dbus_audio_register(const char *s, const char *dir)=
 &quot;sender =3D %s, dir =3D %s&quot;<br>
&gt;=C2=A0 =C2=A0dbus_audio_put_buffer_out(size_t len) &quot;len =3D %zu&qu=
ot;<br>
&gt;=C2=A0 =C2=A0dbus_audio_read(size_t len) &quot;len =3D %zu&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +# pwaudio.c<br>
&gt; +pw_state_changed(const char *s) &quot;stream state: %s&quot;<br>
&gt; +pw_node(int nodeid) &quot;node id: %d&quot;<br>
&gt; +pw_read(int32_t avail, uint32_t index, size_t len) &quot;avail=3D%u i=
ndex=3D%u len=3D%zu&quot;<br>
&gt; +pw_write(int32_t filled, int32_t avail, uint32_t index, size_t len) &=
quot;filled=3D%u avail=3D%u index=3D%u len=3D%zu&quot;<br>
&gt; +pw_audio_init(void) &quot;Initialize Pipewire context&quot;<br>
&gt; +<br>
<br>
Hi Dorinda,<br>
<br>
the format specifiers and parameter types don&#39;t always match.<br>
<br>
With=C2=A0 best regards,<br>
Volker<br>
<br>
&gt;=C2=A0 =C2=A0# audio.c<br>
&gt;=C2=A0 =C2=A0audio_timer_start(int interval) &quot;interval %d ms&quot;=
<br>
&gt;=C2=A0 =C2=A0audio_timer_stop(void) &quot;&quot;<br>
&gt;<br>
<br>
</blockquote></div>

--00000000000074b29005f7f48c71--


