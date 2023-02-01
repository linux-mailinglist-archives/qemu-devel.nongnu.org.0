Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269A86869AE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 16:13:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEnS-0003FW-Pa; Wed, 01 Feb 2023 10:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Q3mX=55=zx2c4.com=Jason@kernel.org>)
 id 1pNEnQ-0003Dv-0s
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:13:12 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Q3mX=55=zx2c4.com=Jason@kernel.org>)
 id 1pNEnN-0003TS-MR
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:13:11 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 398EBB821B2
 for <qemu-devel@nongnu.org>; Wed,  1 Feb 2023 15:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF767C4339B
 for <qemu-devel@nongnu.org>; Wed,  1 Feb 2023 15:13:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GG/BH1bY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675264383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/zIL9BofsCWxEA3Gq9VjogKL84w2PJuMzQgTBREbX5M=;
 b=GG/BH1bYxodFZXZsf1UAOw1yRSLuHZeoB7qqR0HVdaLX8x3ftVSG5Ib3r1zt01ISfoN+mo
 vSvZHbwidRr0a8yfV4oKV53aISFR8tp4UZzz2mZpB4mffOd5AKjeCpobdtJawDZTQOJP1c
 bVNNi0Fzzuca5lptCFcEFSD/Y3ez1JU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 14d586f6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 1 Feb 2023 15:13:03 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-501c3a414acso250032377b3.7
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 07:13:02 -0800 (PST)
X-Gm-Message-State: AO0yUKWauMU/vVpwZMxyWmmf2WHbHUMoNgvGIs86slm4CORV6kNvkgbU
 lFyCJ255Awxtic0+P/cTXIUUr8anMaArNeZQPwk=
X-Google-Smtp-Source: AK7set9uoNy7NAujrM0FZK4V2DdBxxvGJ+THBZaBSpgWAvVMfx2EyqCiN4mxAk+3MUOcS58ruY7G1eOhH04tDgOpHc0=
X-Received: by 2002:a81:2591:0:b0:50f:7b33:e1d1 with SMTP id
 l139-20020a812591000000b0050f7b33e1d1mr314048ywl.79.1675264382129; Wed, 01
 Feb 2023 07:13:02 -0800 (PST)
MIME-Version: 1.0
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
 <Y9p4sARXUdUOz/6X@redhat.com>
 <bac451554357676b073d589f7668b517020d9a4e.camel@linux.ibm.com>
In-Reply-To: <bac451554357676b073d589f7668b517020d9a4e.camel@linux.ibm.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 1 Feb 2023 10:12:45 -0500
X-Gmail-Original-Message-ID: <CAHmME9p0n12uw_m1CBzhaGG8irYnZ55i6mJCAN0hKSL1mhG37w@mail.gmail.com>
Message-ID: <CAHmME9p0n12uw_m1CBzhaGG8irYnZ55i6mJCAN0hKSL1mhG37w@mail.gmail.com>
Subject: Re: [PATCH] x86: fix q35 kernel measurements broken due to rng seeding
To: "James E . J . Bottomley" <jejb@linux.ibm.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 DOV MURIK <Dov.Murik1@il.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000066de0305f3a4e26e"
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=Q3mX=55=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000066de0305f3a4e26e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch is not needed. It is already fixed in a pending pull. Do not
merge.

On Wed, Feb 1, 2023, 09:57 James Bottomley <jejb@linux.ibm.com> wrote:

> On Wed, 2023-02-01 at 14:35 +0000, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Feb 01, 2023 at 08:57:10AM -0500, James Bottomley wrote:
> > > The origin commit for rng seeding 67f7e426e5 ("hw/i386: pass RNG
> > > seed
> > > via setup_data entry") modifies the kernel image file to append a
> > > random seed.  Obviously this makes the hash of the kernel file
> > > non-deterministic and so breaks both measured and some signed
> > > boots.
> >
> > I recall raising that at the time
> >
> >   https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00710.html
> >
> > and Jason pointed me to a followup which I tested and believe
> > fixed it for SEV:
> >
> >   https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00601.html
> >
> > but it doesn't look like that second patch ever merged. We went
> > through so many patches I think it probably got obsoleted by
> > something else, and no one rechecked SEV again.
>
> The kernel file problem is a pretty huge one.  OVMF lays it down on an
> internal file system and without the second patch, it now contains
> random junk at the end.  Anything that hashes the whole file (which
> includes not only the measured direct boot but also grub signatures and
> probably other bootloader signing mechanisms) will have an issue.
>
> > > The commit notes it's only for non-EFI (because EFI has a different
> > > RNG seeding mechanism) so, since there are no non-EFI q35 systems,
> > > this should be disabled for the whole of the q35 machine type to
> > > bring back deterministic kernel file hashes.
> >
> > SeaBIOS is the default firmware for both q35 and i440fx. The
> > majority of systems using q35 will be non-EFI today, and that
> > is what the random seed was intended to address. I don't think
> > we can just disable this for the whole of q35.
> >
> > When you say it breaks measured / signed boots, I presume you
> > are specifically referring to SEV kernel hashes measurements ?
> > Or is there a more general problem to solve ?
>
> No it generally breaks measured/signed boots because it adds random
> junk to the kernel file.  The second patch will fix this if you apply
> it because setup data isn't measured or signed (yet ... however see the
> linux-coco debate about how it should be).
>
> I also note there was a v3 of the patch and considerable discussion
> saying it couldn't work:
>
> https://lore.kernel.org/qemu-devel/20220804230411.17720-1-Jason@zx2c4.com=
/
>
> Which is likely why it never went in ... although the discussion does
> seem to resolve towards the end.
>
> James
>
>

--00000000000066de0305f3a4e26e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This patch is not needed. It is already fixed in a pendin=
g pull. Do not merge.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Feb 1, 2023, 09:57 James Bottomley &lt;<a href=
=3D"mailto:jejb@linux.ibm.com">jejb@linux.ibm.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">On Wed, 2023-02-01 at 14:35 +0000, Daniel P. =
Berrang=C3=A9 wrote:<br>
&gt; On Wed, Feb 01, 2023 at 08:57:10AM -0500, James Bottomley wrote:<br>
&gt; &gt; The origin commit for rng seeding 67f7e426e5 (&quot;hw/i386: pass=
 RNG<br>
&gt; &gt; seed<br>
&gt; &gt; via setup_data entry&quot;) modifies the kernel image file to app=
end a<br>
&gt; &gt; random seed.=C2=A0 Obviously this makes the hash of the kernel fi=
le<br>
&gt; &gt; non-deterministic and so breaks both measured and some signed<br>
&gt; &gt; boots.<br>
&gt; <br>
&gt; I recall raising that at the time<br>
&gt; <br>
&gt; =C2=A0 <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2022-0=
8/msg00710.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://li=
sts.gnu.org/archive/html/qemu-devel/2022-08/msg00710.html</a><br>
&gt; <br>
&gt; and Jason pointed me to a followup which I tested and believe<br>
&gt; fixed it for SEV:<br>
&gt; <br>
&gt; =C2=A0 <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2022-0=
8/msg00601.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://li=
sts.gnu.org/archive/html/qemu-devel/2022-08/msg00601.html</a><br>
&gt; <br>
&gt; but it doesn&#39;t look like that second patch ever merged. We went<br=
>
&gt; through so many patches I think it probably got obsoleted by<br>
&gt; something else, and no one rechecked SEV again.<br>
<br>
The kernel file problem is a pretty huge one.=C2=A0 OVMF lays it down on an=
<br>
internal file system and without the second patch, it now contains<br>
random junk at the end.=C2=A0 Anything that hashes the whole file (which<br=
>
includes not only the measured direct boot but also grub signatures and<br>
probably other bootloader signing mechanisms) will have an issue.<br>
<br>
&gt; &gt; The commit notes it&#39;s only for non-EFI (because EFI has a dif=
ferent<br>
&gt; &gt; RNG seeding mechanism) so, since there are no non-EFI q35 systems=
,<br>
&gt; &gt; this should be disabled for the whole of the q35 machine type to<=
br>
&gt; &gt; bring back deterministic kernel file hashes.<br>
&gt; <br>
&gt; SeaBIOS is the default firmware for both q35 and i440fx. The<br>
&gt; majority of systems using q35 will be non-EFI today, and that<br>
&gt; is what the random seed was intended to address. I don&#39;t think<br>
&gt; we can just disable this for the whole of q35.<br>
&gt; <br>
&gt; When you say it breaks measured / signed boots, I presume you<br>
&gt; are specifically referring to SEV kernel hashes measurements ?<br>
&gt; Or is there a more general problem to solve ?<br>
<br>
No it generally breaks measured/signed boots because it adds random<br>
junk to the kernel file.=C2=A0 The second patch will fix this if you apply<=
br>
it because setup data isn&#39;t measured or signed (yet ... however see the=
<br>
linux-coco debate about how it should be).<br>
<br>
I also note there was a v3 of the patch and considerable discussion<br>
saying it couldn&#39;t work:<br>
<br>
<a href=3D"https://lore.kernel.org/qemu-devel/20220804230411.17720-1-Jason@=
zx2c4.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lore.ke=
rnel.org/qemu-devel/20220804230411.17720-1-Jason@zx2c4.com/</a><br>
<br>
Which is likely why it never went in ... although the discussion does<br>
seem to resolve towards the end.<br>
<br>
James<br>
<br>
</blockquote></div>

--00000000000066de0305f3a4e26e--

