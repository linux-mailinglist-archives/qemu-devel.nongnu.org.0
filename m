Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4322697F2B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:11:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJQe-0005ye-Nm; Wed, 15 Feb 2023 10:10:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pSJQb-0005vL-TQ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:10:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pSJQa-00016o-2w
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676473834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oIm776lWihosTy4EFUGfX+CnOeDzc8aDYNHtpNY64ZY=;
 b=WPOiASvvU0/veLX8/G8Qu0nVc1rwqkTbgFPxwgiPIno17YQIKCykMyiGMltV6SPdfJ4JWp
 sunzBPJVYBrj6J046tCBVBC1B+2l11sZWisplip2LswEf45J7VIeq4X6KfrPoOq7tom7oX
 PGbEpZUNSU48O+XphAti6gTINy/43Wg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-139-uCJKFUnNO-2BdM00zq5PaA-1; Wed, 15 Feb 2023 10:10:15 -0500
X-MC-Unique: uCJKFUnNO-2BdM00zq5PaA-1
Received: by mail-qt1-f198.google.com with SMTP id
 v3-20020a05622a188300b003ba183e8272so11251949qtc.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 07:10:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676473811;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oIm776lWihosTy4EFUGfX+CnOeDzc8aDYNHtpNY64ZY=;
 b=mvLTvHl9ZFLNR36+nAR3mqsmf08Ss3WCKKH32xFSoHc3eo6hKthb36IGRviJQ3DMMG
 YmGl5e+bsfzH9KmHWxvVXFe6/Tko1zDY+nLXdlfUMQ8XLeBcU5/W2iTed8y6w0folTDp
 RGLTar4oPXzl3/Ulf/2tlJjm6s7UygBE4Y1jW1qWsiB+C7YEQMea1c5EhF9i2lVIgVmp
 8kr/dQ7eacRUl29+elnHQIKdNAzcXBuFkrV5d/oY7zmgXJ9mGRv97Z9v8vZlsgohtEmF
 YutWhsIHI7lGg1Y8E+slPoGSSb08dgUBoS2nU9CY7xyoCfIt3PUVbWpwdEQqVrT7P/JR
 dm1Q==
X-Gm-Message-State: AO0yUKVU2A4gpan9ZjlknkcsvruoyAAjwbEOTsqEmHnwMF8TsnD2jaMk
 R1bcwCJYob3EQEZczfBVAX95C/f1Y0+YHVSHkBoNffduPZLPjYiQLW/h9vb+ky6E6HmUsQO22fx
 QUJNj9apzRengfThTUxg+827WcAwu4mg=
X-Received: by 2002:a0c:cb0c:0:b0:56e:bf84:ccd9 with SMTP id
 o12-20020a0ccb0c000000b0056ebf84ccd9mr174336qvk.12.1676473810767; 
 Wed, 15 Feb 2023 07:10:10 -0800 (PST)
X-Google-Smtp-Source: AK7set9dH2/JmMP6CWbhBSTsnNou30QOmD0anjwGkVxgV3+d6ipM4asrBDhDCqEZTvnfiV07dFaQ7IDo/kIRFXmcrdk=
X-Received: by 2002:a0c:cb0c:0:b0:56e:bf84:ccd9 with SMTP id
 o12-20020a0ccb0c000000b0056ebf84ccd9mr174330qvk.12.1676473810521; Wed, 15 Feb
 2023 07:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20230215085102.415053-1-dbassey@redhat.com>
 <CAJ+F1CL0_OAj5-jsyCVY5aF=qoSoPx2Mu=q8Z7mpp3mesRi6=Q@mail.gmail.com>
 <5159868.WgR6L5i3FV@silver>
 <CAJ+F1CK6kCbhAbpK8dmS3qMHnRptJiiU-FeKy3qT2WjQUGyekQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CK6kCbhAbpK8dmS3qMHnRptJiiU-FeKy3qT2WjQUGyekQ@mail.gmail.com>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Wed, 15 Feb 2023 16:09:59 +0100
Message-ID: <CACzuRyy5ac-1_pugMKGaYzszaLceBDk_xeQmrcq4M+SLpLucVQ@mail.gmail.com>
Subject: Re: [PATCH] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 kraxel@redhat.com, 
 armbru@redhat.com, pbonzini@redhat.com, wtaymans@redhat.com
Content-Type: multipart/alternative; boundary="000000000000f3a7bd05f4be790a"
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

--000000000000f3a7bd05f4be790a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> My point is that pipewire has ALSA plugin (and also pulseaudio compat
> library etc). So why add another back in QEMU?
>
Good question. Well the pulseaudio compatibility layer adds to the runtime
overhead and dependency, dropping the usage of pw-pulse daemon as a runtime
dependency would reduce footprint. For ALSA, it's a native layer and you do
not want clients talking to ALSA directly if they need to share resources
with other processes.

Regards,
Dorinda.

On Wed, Feb 15, 2023 at 3:11 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi
>
> On Wed, Feb 15, 2023 at 6:09 PM Christian Schoenebeck
> <qemu_oss@crudebyte.com> wrote:
> >
> > On Wednesday, February 15, 2023 2:18:50 PM CET Marc-Andr=C3=A9 Lureau w=
rote:
> > > Hi
> > >
> > > On Wed, Feb 15, 2023 at 12:51 PM Dorinda Bassey <dbassey@redhat.com>
> wrote:
> > > >
> > > > This commit adds a new audiodev backend to allow QEMU to use
> Pipewire as
> > both an audio sink and source. This backend is available on most system=
s.
> > > >
> > >
> > > Hmm, I would rather have less audio (and ui) backends in QEMU. (for
> > > audio, if I could introduce and keep only one, that would be
> > > GStreamer: to remove the others..)
> > >
> > > What is the main advantage compared to using the ALSA backend? (I
> > > assume pipewire depends on ALSA anyway on Linux)
> >
> > I think it does make sense to add Pipewire. Apparently it gains
> popularity.
>
> My point is that pipewire has ALSA plugin (and also pulseaudio compat
> library etc). So why add another back in QEMU?
>
> > The main advantage of Pipewire is its interoperability: It allows you t=
o
> > connect apps with each other that only support a specific audio system.
> Say
> > one app that only supports JACK, another app that only supports
> PulseAudio,
> > another that only supports ALSA and so on. So it tries to provide a
> universal
> > plug on a system for all.
> >
> > Best regards,
> > Christian Schoenebeck
> >
> >
>
>
> --
> Marc-Andr=C3=A9 Lureau
>
>

--000000000000f3a7bd05f4be790a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>My =
point is that pipewire has ALSA plugin (and also pulseaudio compat<br>
library etc). So why add another back in QEMU?</div></blockquote><div>Good =
question. Well the pulseaudio compatibility layer adds to the runtime overh=
ead and dependency, dropping the usage of pw-pulse daemon as a runtime depe=
ndency would reduce footprint. For ALSA, it&#39;s a native layer and you do=
 not want clients talking to ALSA directly if they need to share resources =
with other processes. <br></div><div><br></div><div>Regards,</div><div>Dori=
nda.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Feb 15, 2023 at 3:11 PM Marc-Andr=C3=A9 Lureau &lt;=
<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcandre.l=
ureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hi<br>
<br>
On Wed, Feb 15, 2023 at 6:09 PM Christian Schoenebeck<br>
&lt;<a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank">qemu_oss@cr=
udebyte.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wednesday, February 15, 2023 2:18:50 PM CET Marc-Andr=C3=A9 Lureau =
wrote:<br>
&gt; &gt; Hi<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Feb 15, 2023 at 12:51 PM Dorinda Bassey &lt;<a href=3D"ma=
ilto:dbassey@redhat.com" target=3D"_blank">dbassey@redhat.com</a>&gt; wrote=
:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This commit adds a new audiodev backend to allow QEMU to use=
 Pipewire as<br>
&gt; both an audio sink and source. This backend is available on most syste=
ms.<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Hmm, I would rather have less audio (and ui) backends in QEMU. (f=
or<br>
&gt; &gt; audio, if I could introduce and keep only one, that would be<br>
&gt; &gt; GStreamer: to remove the others..)<br>
&gt; &gt;<br>
&gt; &gt; What is the main advantage compared to using the ALSA backend? (I=
<br>
&gt; &gt; assume pipewire depends on ALSA anyway on Linux)<br>
&gt;<br>
&gt; I think it does make sense to add Pipewire. Apparently it gains popula=
rity.<br>
<br>
My point is that pipewire has ALSA plugin (and also pulseaudio compat<br>
library etc). So why add another back in QEMU?<br>
<br>
&gt; The main advantage of Pipewire is its interoperability: It allows you =
to<br>
&gt; connect apps with each other that only support a specific audio system=
. Say<br>
&gt; one app that only supports JACK, another app that only supports PulseA=
udio,<br>
&gt; another that only supports ALSA and so on. So it tries to provide a un=
iversal<br>
&gt; plug on a system for all.<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Christian Schoenebeck<br>
&gt;<br>
&gt;<br>
<br>
<br>
-- <br>
Marc-Andr=C3=A9 Lureau<br>
<br>
</blockquote></div>

--000000000000f3a7bd05f4be790a--


