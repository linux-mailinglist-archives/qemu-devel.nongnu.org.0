Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B402DDAA7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 22:14:34 +0100 (CET)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq0ba-0000FO-0m
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 16:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kq0ae-000885-Bj
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 16:13:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kq0ac-0003hU-Bl
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 16:13:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608239613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FF+7dQdpZzQ66mIq5LNe7eXcii+BF6FirbMYeVIGJCA=;
 b=G9RuH2oV9NQqL7DFvVksH29RktkIyiJ0XNGhsaPtZjr3czrFx9oeyoDaepFXAmagUs6yng
 8vQlsoU9LQJ/0i0QNPxf6ue4RoDWVnDLAtYhMfvb1UiF6jaAs8hDyETcBeog/zzeY10Ch1
 wwkpSeU4k+TkGLqJztNLvv9yIv5Vdkw=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-86zkEtPKOwGtJPr9YFdjmw-1; Thu, 17 Dec 2020 16:13:30 -0500
X-MC-Unique: 86zkEtPKOwGtJPr9YFdjmw-1
Received: by mail-pf1-f198.google.com with SMTP id e28so19358733pfl.19
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 13:13:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FF+7dQdpZzQ66mIq5LNe7eXcii+BF6FirbMYeVIGJCA=;
 b=GlPKvY9FE1oLAu1Dakn1kmqTWmobeN2t1pvOsVqMhSWeEaq5z/NF0nrpJoPnzLKDef
 W62SQfh2UqwBOqL1EYiMTTaOOpkaBx+m2yWFr4EaZzKf6Smr868fEkusyjPQ6+ugkezR
 +TTLprnHt8hUpu1wskbmDFt9QzOP7QDbH/QcN4nQ3AIUlbe/kF24LUrKRJTKUT6XHWSD
 oZSbzRnrdkNJ/oYpi8qsJO3b9DKgPzGwfc7rpcmQTlkFpim5G7XGOwp7xdRIOfZj1DPL
 ZsmXHYhpVkdCv3ETgJ4JztOcbYnB0Km70Blw/e6F0KW3UWIyJ2KV7mtSzmStSX7Uui6T
 6Ilw==
X-Gm-Message-State: AOAM533faLccoqeQjqPOT2lTKxyZ+MAMDEpfEo8NbHOhEVencNStJ2Vi
 CnA1pNcCtt31Zcyx9CDGXU4bNe2nE8wXLFpyIxdU6RStEvS8yCbuSKT6Fb0f2+waP/01VIF0MJW
 nDre4XGmGlICag2t7cLxMuDVQj1KdZLA=
X-Received: by 2002:aa7:9388:0:b029:19e:648:6480 with SMTP id
 t8-20020aa793880000b029019e06486480mr1126134pfe.21.1608239609874; 
 Thu, 17 Dec 2020 13:13:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzosYZ7gGJ/debCC7695T9VqCTZjMMGNf2OYshJY2vjVa9cVNDTZriE8gWa0ZMGMp5Mg1NbK+LDqeZgsdc32U=
X-Received: by 2002:aa7:9388:0:b029:19e:648:6480 with SMTP id
 t8-20020aa793880000b029019e06486480mr1126100pfe.21.1608239609551; Thu, 17 Dec
 2020 13:13:29 -0800 (PST)
MIME-Version: 1.0
References: <20201211100908.19696-1-cfontana@suse.de>
 <20201211100908.19696-8-cfontana@suse.de>
 <e47ef5e5-2053-d98d-9cd5-f6d96c423c82@suse.de>
 <CAFEAcA8FL23_bZaOM_u8CdSQoCrrQ2SxnuOoU0H9kPFeANyT0A@mail.gmail.com>
 <CAFEAcA8RyT58QCX=UpfGRrOvBZWAC7Jhvq0t+X2cAX7qEjhfkQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8RyT58QCX=UpfGRrOvBZWAC7Jhvq0t+X2cAX7qEjhfkQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 17 Dec 2020 22:13:17 +0100
Message-ID: <CABgObfaQBuwQ3UHC6VLm03Y=djQQnorT+Ecqx5QLe0oz_XrAXQ@mail.gmail.com>
Subject: Re: dangers of current NEED_CPU_H, CONFIG_SOFTMMU, CONFIG_USER_ONLY
 (was: [PATCH v11 7/7] cpu: introduce cpu_accel_instance_init)
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a4378a05b6af76a2"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a4378a05b6af76a2
Content-Type: text/plain; charset="UTF-8"

I will take a look, CONFIG_USER_ONLY is definitely something that should be
poisoned.

Paolo

Il gio 17 dic 2020, 21:26 Peter Maydell <peter.maydell@linaro.org> ha
scritto:

> On Thu, 17 Dec 2020 at 20:15, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> > (So in theory we could make CONFIG_USER_ONLY
> > a poisoned identifier but that will require some work to
> > adjust places where we currently use it in "safe" ways...)
>
> Specifically, putting it in poison.h turns up these places
> that would need to be made to do what they're doing in a
> different way somehow:
>
> ../../hw/core/cpu.c:211:14: error: attempt to use poisoned
> "CONFIG_USER_ONLY"
> include/disas/disas.h:27:13: error: attempt to use poisoned
> "CONFIG_USER_ONLY"
> include/exec/address-spaces.h:24:9: error: attempt to use poisoned
> "CONFIG_USER_ONLY"
> include/exec/cpu-common.h:20:14: error: attempt to use poisoned
> "CONFIG_USER_ONLY"
> include/exec/cpu-common.h:6:9: error: attempt to use poisoned
> "CONFIG_USER_ONLY"
> include/exec/ioport.h:43:9: error: attempt to use poisoned
> "CONFIG_USER_ONLY"
> include/exec/memory.h:17:9: error: attempt to use poisoned
> "CONFIG_USER_ONLY"
> include/exec/ramblock.h:22:9: error: attempt to use poisoned
> "CONFIG_USER_ONLY"
> include/hw/core/cpu.h:1035:8: error: attempt to use poisoned
> "CONFIG_USER_ONLY"
> include/hw/core/cpu.h:518:14: error: attempt to use poisoned
> "CONFIG_USER_ONLY"
> include/hw/core/cpu.h:602:9: error: attempt to use poisoned
> "CONFIG_USER_ONLY"
> include/hw/hw.h:4:8: error: attempt to use poisoned "CONFIG_USER_ONLY"
> include/hw/semihosting/semihost.h:29:8: error: attempt to use poisoned
> "CONFIG_USER_ONLY"
> include/sysemu/accel.h:40:9: error: attempt to use poisoned
> "CONFIG_USER_ONLY"
> include/sysemu/cpus.h:65:9: error: attempt to use poisoned
> "CONFIG_USER_ONLY"
> include/sysemu/dma.h:34:9: error: attempt to use poisoned
> "CONFIG_USER_ONLY"
> include/sysemu/xen.h:27:9: error: attempt to use poisoned
> "CONFIG_USER_ONLY"
>
> That cpu.c one is definitely dubious given it's in a C file,
> not a header.
>
> thanks
> -- PMM
>
>

--000000000000a4378a05b6af76a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I will take a look, CONFIG_USER_ONLY is definitely someth=
ing that should be poisoned.<div dir=3D"auto"><br></div><div dir=3D"auto">P=
aolo</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">Il gio 17 dic 2020, 21:26 Peter Maydell &lt;<a href=3D"mailto:pet=
er.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; ha scritto:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On Thu, 17 Dec 2020 at 20:15, Peter Maydel=
l &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank" rel=3D"=
noreferrer">peter.maydell@linaro.org</a>&gt; wrote:<br>
&gt; (So in theory we could make CONFIG_USER_ONLY<br>
&gt; a poisoned identifier but that will require some work to<br>
&gt; adjust places where we currently use it in &quot;safe&quot; ways...)<b=
r>
<br>
Specifically, putting it in poison.h turns up these places<br>
that would need to be made to do what they&#39;re doing in a<br>
different way somehow:<br>
<br>
../../hw/core/cpu.c:211:14: error: attempt to use poisoned &quot;CONFIG_USE=
R_ONLY&quot;<br>
include/disas/disas.h:27:13: error: attempt to use poisoned &quot;CONFIG_US=
ER_ONLY&quot;<br>
include/exec/address-spaces.h:24:9: error: attempt to use poisoned<br>
&quot;CONFIG_USER_ONLY&quot;<br>
include/exec/cpu-common.h:20:14: error: attempt to use poisoned<br>
&quot;CONFIG_USER_ONLY&quot;<br>
include/exec/cpu-common.h:6:9: error: attempt to use poisoned &quot;CONFIG_=
USER_ONLY&quot;<br>
include/exec/ioport.h:43:9: error: attempt to use poisoned &quot;CONFIG_USE=
R_ONLY&quot;<br>
include/exec/memory.h:17:9: error: attempt to use poisoned &quot;CONFIG_USE=
R_ONLY&quot;<br>
include/exec/ramblock.h:22:9: error: attempt to use poisoned &quot;CONFIG_U=
SER_ONLY&quot;<br>
include/hw/core/cpu.h:1035:8: error: attempt to use poisoned &quot;CONFIG_U=
SER_ONLY&quot;<br>
include/hw/core/cpu.h:518:14: error: attempt to use poisoned &quot;CONFIG_U=
SER_ONLY&quot;<br>
include/hw/core/cpu.h:602:9: error: attempt to use poisoned &quot;CONFIG_US=
ER_ONLY&quot;<br>
include/hw/hw.h:4:8: error: attempt to use poisoned &quot;CONFIG_USER_ONLY&=
quot;<br>
include/hw/semihosting/semihost.h:29:8: error: attempt to use poisoned<br>
&quot;CONFIG_USER_ONLY&quot;<br>
include/sysemu/accel.h:40:9: error: attempt to use poisoned &quot;CONFIG_US=
ER_ONLY&quot;<br>
include/sysemu/cpus.h:65:9: error: attempt to use poisoned &quot;CONFIG_USE=
R_ONLY&quot;<br>
include/sysemu/dma.h:34:9: error: attempt to use poisoned &quot;CONFIG_USER=
_ONLY&quot;<br>
include/sysemu/xen.h:27:9: error: attempt to use poisoned &quot;CONFIG_USER=
_ONLY&quot;<br>
<br>
That cpu.c one is definitely dubious given it&#39;s in a C file,<br>
not a header.<br>
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div>

--000000000000a4378a05b6af76a2--


