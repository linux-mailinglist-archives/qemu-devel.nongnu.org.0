Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53D4697FD2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:47:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJzD-0002YX-H0; Wed, 15 Feb 2023 10:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pSJzB-0002YH-6w
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:46:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pSJz9-0007QO-KG
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676475979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sRFbnADmRtku9ryvJUec8yviL3CxLpqTBfnAUakK0Zo=;
 b=OFJYzy6TSE9UAf7xDZqQaGZoS/n+87KWB7vKxmjixJbRrTm9l+FVj1S8ml9vtN+yoAlUvI
 TGWCdPHgPj8zMxYGwQly2uwjUGL+TJOoOLaeZacaXGl8zYEA/mATJQVEKZHWAGXiAvYiKa
 uoCJL+FUz2Wg1jsa68EBNNJfIGCAwuQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-134-rv9GjJ7IMsiau-Cf0i-jVQ-1; Wed, 15 Feb 2023 10:46:17 -0500
X-MC-Unique: rv9GjJ7IMsiau-Cf0i-jVQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 w17-20020a05620a425100b00706bf3b459eso11736489qko.11
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 07:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676475976;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sRFbnADmRtku9ryvJUec8yviL3CxLpqTBfnAUakK0Zo=;
 b=BMaUQTF9DBU+GL1oBAnsLk9Vtr2yV5TtKwukC7zUNxa3BsJ6V4MSIHY/QMwSehKbHf
 cC2w4X+FjXbf2Slu5Y6I9l1VEhG+jVpx+KgQWIrX/tH/G8b8Ce6jkY+YW+K8Dh7Na22t
 eOOyQ9b4o7Hqi0UefDCQHLiuJNPCODsX2aUwl8hrzHsr/kZaVIKZnshQGPVE5EfZMHCC
 J6HMAqO0a1E6CM164Vhxr3VLIQ6aAs00TC4q3HFz4Qastla+8aQgWhg5YdtX2Yy2QnKL
 eaLcrUrjQGvmZNjUpqJSJXTRz2DedBlmktghZDHhtsd3Rq7LlXJNIP7dwwbOCR2TWJfO
 TRsw==
X-Gm-Message-State: AO0yUKWQa07XIzRQbpXuzMZOZkEx+I6IeWxTITevbBBfFG4tYdEtaswO
 Tv4JeK+ussXczt7M+hOXncv+xR2EfQep2J2iSCuD0ujsFMb3rU/nkijo5Bfk0xxzQk2EJWExyb7
 Xxy7HyKB2x6KQ3+woo07W0g7ZW1VLxAE+jMh79N/jGVsA
X-Received: by 2002:a0c:cb0c:0:b0:56e:bf84:ccd9 with SMTP id
 o12-20020a0ccb0c000000b0056ebf84ccd9mr182679qvk.12.1676475976769; 
 Wed, 15 Feb 2023 07:46:16 -0800 (PST)
X-Google-Smtp-Source: AK7set/zLe1mQYxpF3BVlbgK9+5A5R124CTX7IC0lVay8uilpJKHBKWCCuGo7BfA4DnVOQx7JWfHRQKokD9KVHuUtDg=
X-Received: by 2002:a0c:cb0c:0:b0:56e:bf84:ccd9 with SMTP id
 o12-20020a0ccb0c000000b0056ebf84ccd9mr182673qvk.12.1676475976570; Wed, 15 Feb
 2023 07:46:16 -0800 (PST)
MIME-Version: 1.0
References: <20230215085102.415053-1-dbassey@redhat.com>
 <CAJ+F1CL0_OAj5-jsyCVY5aF=qoSoPx2Mu=q8Z7mpp3mesRi6=Q@mail.gmail.com>
 <5159868.WgR6L5i3FV@silver>
 <20230215151115.posxqlvgzgl4eszw@sirius.home.kraxel.org>
In-Reply-To: <20230215151115.posxqlvgzgl4eszw@sirius.home.kraxel.org>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Wed, 15 Feb 2023 16:46:05 +0100
Message-ID: <CACzuRyy8u4MbRy2CQtRUffpsLdUn7wMki19GSEW1H5z3WUfWMg@mail.gmail.com>
Subject: Re: [PATCH] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 armbru@redhat.com, pbonzini@redhat.com, wtaymans@redhat.com, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 Alberto Ruiz <aruiz@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000eead705f4befbcb"
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

--0000000000000eead705f4befbcb
Content-Type: text/plain; charset="UTF-8"

>
> Are there any additional features available when using the pipewire
> protocol instead of pulseaudio or jack?


yes, Pipewire supports both use cases, It is more or less a hybrid between
pulseaudio and jack.
Pipewire uses a much more accurate timing model for timer based scheduling.
Pipewire provides highly optimized audio processing paths.
Pipewire uses ACP(copy of PulseAudio card profiles), UCM devices, profiles,
ports, soft/hw volumes, jack detection, it supports ALSA API and UCM
profiles.

Are there any plans beyond audio?  pipewire does video too and gnome
> screen sharing uses that.  Is it maybe possible to wire up the qemu vga
> display and have pipewire send out qemu sound+display as video stream?
>

I don't know but It's worth considering.

Regards,
Dorinda.

On Wed, Feb 15, 2023 at 4:11 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> > > What is the main advantage compared to using the ALSA backend? (I
> > > assume pipewire depends on ALSA anyway on Linux)
> >
> > I think it does make sense to add Pipewire. Apparently it gains
> popularity.
> >
> > The main advantage of Pipewire is its interoperability: It allows you to
> > connect apps with each other that only support a specific audio system.
> Say
> > one app that only supports JACK, another app that only supports
> PulseAudio,
> > another that only supports ALSA and so on. So it tries to provide a
> universal
> > plug on a system for all.
>
> We already have support for pulse, jack and alsa in qemu, so there are
> already three different ways to talk to pipewire.  So the question
> whenever adding yet another way makes sense is valid IMHO.
>
> Are there any additional features available when using the pipewire
> protocol instead of pulseaudio or jack?
>
> Are there any plans beyond audio?  pipewire does video too and gnome
> screen sharing uses that.  Is it maybe possible to wire up the qemu vga
> display and have pipewire send out qemu sound+display as video stream?
>
> take care,
>   Gerd
>
>

--0000000000000eead705f4befbcb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Are ther=
e any additional features available when using the pipewire<br>
protocol instead of pulseaudio or jack?</blockquote><div><br></div><div>yes=
, Pipewire supports both use cases, It is more or less a hybrid between  pu=
lseaudio and jack. <br></div><div>Pipewire uses a much more accurate timing=
 model for timer based scheduling. <br></div><div>Pipewire provides highly =
optimized audio processing paths.</div><div>Pipewire uses ACP(copy of Pulse=
Audio card profiles), UCM devices, profiles, ports, soft/hw volumes, jack d=
etection, it supports ALSA API and UCM profiles.<br></div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div>Are there any plans be=
yond audio?=C2=A0 pipewire does video too and gnome<br>
screen sharing uses that.=C2=A0 Is it maybe possible to wire up the qemu vg=
a<br>
display and have pipewire send out qemu sound+display as video stream?</div=
></blockquote><div><br></div><div>I don&#39;t know but It&#39;s worth consi=
dering. <br></div><div><br></div><div>Regards,</div><div>Dorinda.<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Feb 15, 2023 at 4:11 PM Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@=
redhat.com">kraxel@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">&gt; &gt; What is the main advantage compared =
to using the ALSA backend? (I<br>
&gt; &gt; assume pipewire depends on ALSA anyway on Linux)<br>
&gt; <br>
&gt; I think it does make sense to add Pipewire. Apparently it gains popula=
rity.<br>
&gt; <br>
&gt; The main advantage of Pipewire is its interoperability: It allows you =
to <br>
&gt; connect apps with each other that only support a specific audio system=
. Say <br>
&gt; one app that only supports JACK, another app that only supports PulseA=
udio, <br>
&gt; another that only supports ALSA and so on. So it tries to provide a un=
iversal <br>
&gt; plug on a system for all.<br>
<br>
We already have support for pulse, jack and alsa in qemu, so there are<br>
already three different ways to talk to pipewire.=C2=A0 So the question<br>
whenever adding yet another way makes sense is valid IMHO.<br>
<br>
Are there any additional features available when using the pipewire<br>
protocol instead of pulseaudio or jack?<br>
<br>
Are there any plans beyond audio?=C2=A0 pipewire does video too and gnome<b=
r>
screen sharing uses that.=C2=A0 Is it maybe possible to wire up the qemu vg=
a<br>
display and have pipewire send out qemu sound+display as video stream?<br>
<br>
take care,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div>

--0000000000000eead705f4befbcb--


