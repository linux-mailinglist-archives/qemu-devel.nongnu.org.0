Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708EA57E47C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 18:34:11 +0200 (CEST)
Received: from localhost ([::1]:42312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEvbO-0000J1-5A
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 12:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEvZj-0007K8-5Z
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 12:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEvZf-0006UP-BG
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 12:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658507542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W/dgnGk6i2wzyD9pRZ31gA1uZdNHSF4g57z/vEXMpYQ=;
 b=TXIfaZfw4zgh4O2xTRP1oWy2idNuiQ3tq+BeUTxCOhMUTugvFXpswoci17qNz4+qcM+CHR
 eOvYEmFpV6FAvVWjensdSTGg7yUd2kAkqJ3HVL1KEdFhcRHh5AnZJdC7lu2vWXlwMGsTfF
 OLAnHUUBMuIJcSXS3D+3x7RQn41CEOM=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-HqoEs2cgNGWw8Mp17brYxQ-1; Fri, 22 Jul 2022 12:32:20 -0400
X-MC-Unique: HqoEs2cgNGWw8Mp17brYxQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 z28-20020a0565120c1c00b0048a2049d2feso1979967lfu.22
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 09:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W/dgnGk6i2wzyD9pRZ31gA1uZdNHSF4g57z/vEXMpYQ=;
 b=XNe2mNx1i3JX27s+Go56ejwgHa/RkP103UvtjILVVfBahlcQOTjo8Ey7a/ZLtSetT2
 vFa7VzSpOflNnQnUegrHLUWjfcLhr4mqA0pcnj3mV1WEIdqPu8xyj2/5wa/nHqNPMyjV
 LD/+I0c6W6nNqWphAMtdPbWXDJs+8JM9G5ZQY8FOa+Re9o4OVL4h/S6MubyFPGmMSQfK
 FFvQ2coQ3zdyh8RfdqNmXJ/4asBtIlWrQE8UMyYucVUoGzY/1H6UbqQE3D1KHHbAFiaa
 sgIsIVMN/85J0xnOZIOIwE2lHg5DSYlT7dwKjiXaub9OAcEgpNl6D7sARsTYIpsKp7TE
 ok5w==
X-Gm-Message-State: AJIora8l/f2tGVU4jnovsEGhCSrfqgDZxRkHicWKLICjI+40juEoHBay
 R1OwUPGnZlVY6vxgurg7uVgimjr0bUni+o9PR0p9YGyfDRh0g41IMWjwk/rMOoVbNeanpZRZA3D
 lcIGIrhd8D3o6jGxB2ejFXseA1f37OH4=
X-Received: by 2002:a2e:a289:0:b0:258:e917:36a4 with SMTP id
 k9-20020a2ea289000000b00258e91736a4mr301680lja.510.1658507538838; 
 Fri, 22 Jul 2022 09:32:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u6X5qFV4mr4rZvLmsZspxjaU92OTTXL/RwQ53Gqu4DRdldrwMNXwBOJFTKN+zfF0EmOAOE6AvOXqtcHLHjgxE=
X-Received: by 2002:a2e:a289:0:b0:258:e917:36a4 with SMTP id
 k9-20020a2ea289000000b00258e91736a4mr301674lja.510.1658507538567; Fri, 22 Jul
 2022 09:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-8-pbonzini@redhat.com>
 <87tu7az28k.fsf@linaro.org> <Ytm1KiyFGNqAo/Af@zx2c4.com>
 <87o7xhscey.fsf@linaro.org>
 <YtqJaf5gSyj9cVt6@zx2c4.com> <87k085rz6b.fsf@linaro.org>
In-Reply-To: <87k085rz6b.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 22 Jul 2022 18:32:06 +0200
Message-ID: <CABgObfamRDdOW-oYsUeL+ESH+m_1Yi4gsT2hS5rAD=PyoZrQ_Q@mail.gmail.com>
Subject: Re: [PULL 7/9] hw/guest-loader: pass random seed to fdt
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000b1aa0405e467606b"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b1aa0405e467606b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok I will resend the pull request. Apologies for overstepping.

Paolo

Il ven 22 lug 2022, 16:37 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha scri=
tto:

>
> "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
>
> > Hey Alex,
> >
> > On Fri, Jul 22, 2022 at 10:45:19AM +0100, Alex Benn=C3=A9e wrote:
> >> All the guest-loader does is add the information about where in memory=
 a
> >> guest and/or it's initrd have been placed in memory to the DTB. It's
> >> entirely up to the initial booted code (usually a hypervisor in this
> >> case) to decide what gets passed up the chain to any subsequent guests=
.
> >
> > I think that's also my understanding, but let me tell you what I was
> > thinking with regards to rng-seed there, and you can tell me if I'm way
> > off.
> >
> > The guest-loader puts in memory various loaders in a multistage boot.
> > Let's call it stage0, stage1, stage2, and finally the kernel. Normally,
> > rng-seed is only given to one of these stages. That stage may or may no=
t
> > pass it to the next one, and it most probably does not. And why should
> > it? The host is in a better position to generate these seeds, rather
> > than adding finicky and fragile crypto ratcheting code into each stage
> > bootloader. So, instead, QEMU can just give each stage its own seed, fo=
r
> > it to do whatever with. This way, if stage1 does nothing, at least
> > there's a fresh unused one available for the kernel when it finally get=
s
> > there.
>
> That sounds suspiciously like inventing a new ABI between QEMU and
> guests which we generally try to avoid. The DTB exposed to the first
> stage may never be made visible to the following stages or more likely a
> sanitised version is prepared by the previous stage. Generally QEMU just
> tries to get the emulation right so the firmware/software can get on
> with it's thing. Indeed the dynamic DTB for -M virt and friends is an
> oddity compared to most of the other machine types which assume the user
> has a valid DTB.
>
> Either way given how close to release we are I'd rather drop this patch.
>
> > Does what I describe correspond at all with the use of guest-loader? If
> > so, maybe this patch should stay? If not, discard it as rubbish.
>
> The original intent of the guest-loader was to make testing of
> hypervisors easier because the alternative is getting a multi-stage boot
> chain of firmware, boot-loaders and distro specific integration working
> which can be quite opaque to debug (c.f. why -kernel/-initrd exist and
> not everyone boots via -bios/-pflash).
>
> >
> > Jason
>
>
> --
> Alex Benn=C3=A9e
>
>

--000000000000b1aa0405e467606b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok I will resend the pull request. Apologies for overstep=
ping.<div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il ven 22 lug=
 2022, 16:37 Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
>alex.bennee@linaro.org</a>&gt; ha scritto:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><br>
&quot;Jason A. Donenfeld&quot; &lt;<a href=3D"mailto:Jason@zx2c4.com" targe=
t=3D"_blank" rel=3D"noreferrer">Jason@zx2c4.com</a>&gt; writes:<br>
<br>
&gt; Hey Alex,<br>
&gt;<br>
&gt; On Fri, Jul 22, 2022 at 10:45:19AM +0100, Alex Benn=C3=A9e wrote:<br>
&gt;&gt; All the guest-loader does is add the information about where in me=
mory a<br>
&gt;&gt; guest and/or it&#39;s initrd have been placed in memory to the DTB=
. It&#39;s<br>
&gt;&gt; entirely up to the initial booted code (usually a hypervisor in th=
is<br>
&gt;&gt; case) to decide what gets passed up the chain to any subsequent gu=
ests.<br>
&gt;<br>
&gt; I think that&#39;s also my understanding, but let me tell you what I w=
as<br>
&gt; thinking with regards to rng-seed there, and you can tell me if I&#39;=
m way<br>
&gt; off.<br>
&gt;<br>
&gt; The guest-loader puts in memory various loaders in a multistage boot.<=
br>
&gt; Let&#39;s call it stage0, stage1, stage2, and finally the kernel. Norm=
ally,<br>
&gt; rng-seed is only given to one of these stages. That stage may or may n=
ot<br>
&gt; pass it to the next one, and it most probably does not. And why should=
<br>
&gt; it? The host is in a better position to generate these seeds, rather<b=
r>
&gt; than adding finicky and fragile crypto ratcheting code into each stage=
<br>
&gt; bootloader. So, instead, QEMU can just give each stage its own seed, f=
or<br>
&gt; it to do whatever with. This way, if stage1 does nothing, at least<br>
&gt; there&#39;s a fresh unused one available for the kernel when it finall=
y gets<br>
&gt; there.<br>
<br>
That sounds suspiciously like inventing a new ABI between QEMU and<br>
guests which we generally try to avoid. The DTB exposed to the first<br>
stage may never be made visible to the following stages or more likely a<br=
>
sanitised version is prepared by the previous stage. Generally QEMU just<br=
>
tries to get the emulation right so the firmware/software can get on<br>
with it&#39;s thing. Indeed the dynamic DTB for -M virt and friends is an<b=
r>
oddity compared to most of the other machine types which assume the user<br=
>
has a valid DTB.<br>
<br>
Either way given how close to release we are I&#39;d rather drop this patch=
.<br>
<br>
&gt; Does what I describe correspond at all with the use of guest-loader? I=
f<br>
&gt; so, maybe this patch should stay? If not, discard it as rubbish.<br>
<br>
The original intent of the guest-loader was to make testing of<br>
hypervisors easier because the alternative is getting a multi-stage boot<br=
>
chain of firmware, boot-loaders and distro specific integration working<br>
which can be quite opaque to debug (c.f. why -kernel/-initrd exist and<br>
not everyone boots via -bios/-pflash).<br>
<br>
&gt;<br>
&gt; Jason<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
<br>
</blockquote></div>

--000000000000b1aa0405e467606b--


