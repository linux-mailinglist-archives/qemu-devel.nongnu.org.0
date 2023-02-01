Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF451687016
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 21:49:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNK2V-00007n-7X; Wed, 01 Feb 2023 15:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Q3mX=55=zx2c4.com=Jason@kernel.org>)
 id 1pNK2T-00007G-Df
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:49:05 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Q3mX=55=zx2c4.com=Jason@kernel.org>)
 id 1pNK2R-0007A5-0g
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:49:04 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A88F6190D
 for <qemu-devel@nongnu.org>; Wed,  1 Feb 2023 20:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A30C4339C
 for <qemu-devel@nongnu.org>; Wed,  1 Feb 2023 20:48:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FKSJInvB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675284532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CyuJ3AceqUI4gG7N2OfQXhaxHDuSXPiY2W4HFfQ88ac=;
 b=FKSJInvBarJEIaJiDTLl/0qdAYa5nd+9/pwgKD8JQFQ5/5MKdUur59O2WT/ONG+zJj6MJO
 PfV2crgLC9qapQ2I2mT/HMgbmRBKhB27qoYM03qnlINECx6COV6V4L/ieT9kUeU7NkLdUX
 72ACEK1A8eOfkypGNVNAmVgpH44fS3s=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8d6f0bdd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 1 Feb 2023 20:48:51 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-4c24993965eso330997b3.12
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 12:48:51 -0800 (PST)
X-Gm-Message-State: AO0yUKV5vDGy13+sB4nSVNxbt8hC92POhAdeSURi4HBPEA7GCZrGRX8U
 PYxCYJy/bSXl7GJHDfjTqpHLL4iyOK7esR+KiSA=
X-Google-Smtp-Source: AK7set+MPP/f8sp7gn0oXi2e979nwSHGADcO1l3hipsawZJL3LtFoO/DjdqZHO/yJsjh6TyXWnvkxe3/cc4IDfJwR6Y=
X-Received: by 2002:a81:8d12:0:b0:509:e6b6:3491 with SMTP id
 d18-20020a818d12000000b00509e6b63491mr435618ywg.341.1675284530962; Wed, 01
 Feb 2023 12:48:50 -0800 (PST)
MIME-Version: 1.0
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
 <CAHmME9ouTTk1ONXm276CwunOpy=MAW1Q79x25kcQv=YJTZ88dQ@mail.gmail.com>
 <2b8fc552e1dc3a14de404eeaff0819ec8da7de54.camel@linux.ibm.com>
 <CAHmME9ps8w8TbC_6Bk8OQbJytR-_CJrcUWT_uXDV+xjL293NHQ@mail.gmail.com>
 <a2d5634ab624497d7d98569041e76661062f7eaf.camel@linux.ibm.com>
In-Reply-To: <a2d5634ab624497d7d98569041e76661062f7eaf.camel@linux.ibm.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 1 Feb 2023 15:48:28 -0500
X-Gmail-Original-Message-ID: <CAHmME9qy3_TPXoZ4j10JUvGGAbNikb5MdgQRw5DgTmj7nqLujA@mail.gmail.com>
Message-ID: <CAHmME9qy3_TPXoZ4j10JUvGGAbNikb5MdgQRw5DgTmj7nqLujA@mail.gmail.com>
Subject: Re: [PATCH] x86: fix q35 kernel measurements broken due to rng seeding
To: "James E . J . Bottomley" <jejb@linux.ibm.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 DOV MURIK <Dov.Murik1@il.ibm.com>, "H . Peter Anvin" <hpa@zytor.com>
Content-Type: multipart/alternative; boundary="0000000000005da80405f3a99399"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=Q3mX=55=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

--0000000000005da80405f3a99399
Content-Type: text/plain; charset="UTF-8"

Hi James,

On Wed, Feb 1, 2023, 15:39 James Bottomley <jejb@linux.ibm.com> wrote:

> On Wed, 2023-02-01 at 12:51 -0500, Jason A. Donenfeld wrote:
> > It's not a secret, but I have so little internet right now that I
> > can't even load a webpage, and I'm on my phone, hence the short
> > HTMLified emails.
> >
> > In brief, though, it gets rid of all modifications to the kernel
> > image all together, so it should fix your issue.
>
> We've already tested it and established it doesn't because you simply
> added your rng data to the end of a different integrity protected file
> which now fails the integrity check instead of the kernel.
>
> I checked the kernel source as well; I thought you'd have done the
> usual thing and bumped the boot protocol version to steal space in
> __pad9, but you didn't apparently.  To fix this up after the fact, I
> recommend that we still steal space in _pad9[] but we make it have
> enough space for a setup_data header as well as the 32 random bytes, so
> we've officially reserved the space, but in earlier kernels than this
> change gets to you can still use the setup_data_offset method, except
> that it now uses the empty space in _pad9 via the setup_data mechanism.
> That should find you space and get you out of having to expand any
> integrity protected files.  The SEV direct boot will still work because
> there's a check further down that doesn't copy the modified header back
> over the kernel because it is ignored on efi stub boot anyway.


Ahh, it looks like there's now an integrity check on the cmdline file. Darn.

The patch in that PULL is still good and necessary and fixed a *different*
bug, though. So we should still move forward on that.

But it sounds like you might now have a concrete suggestion on something
even better. I'm CCing hpa, as this is his wheelhouse, and maybe you two
can divise the next step while I'm away. Maybe the pad9 thing you mentioned
is the super nice solution we've been searching for this whole time. When
I'm home in 10 days and have internet again, I'll take a look at where
thing's are out and try to figure out how I can be productive again with it.

And sorry again for the short HTML emails. A day ago I was using mosh from
my phone to use mutt on a server to reply to emails downloaded from lore.
But today the cloud cover means the best I can do is queue these up in the
Android gmail client and hope they eventually send.

Jason

--0000000000005da80405f3a99399
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi James,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Feb 1, 2023, 15:39 James Bottomley &l=
t;<a href=3D"mailto:jejb@linux.ibm.com">jejb@linux.ibm.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Wed, 2023-02-01 at 12:51 -0500, J=
ason A. Donenfeld wrote:<br>
&gt; It&#39;s not a secret, but I have so little internet right now that I<=
br>
&gt; can&#39;t even load a webpage, and I&#39;m on my phone, hence the shor=
t<br>
&gt; HTMLified emails.<br>
&gt; <br>
&gt; In brief, though, it gets rid of all modifications to the kernel<br>
&gt; image all together, so it should fix your issue.<br>
<br>
We&#39;ve already tested it and established it doesn&#39;t because you simp=
ly<br>
added your rng data to the end of a different integrity protected file<br>
which now fails the integrity check instead of the kernel.<br>
<br>
I checked the kernel source as well; I thought you&#39;d have done the<br>
usual thing and bumped the boot protocol version to steal space in<br>
__pad9, but you didn&#39;t apparently.=C2=A0 To fix this up after the fact,=
 I<br>
recommend that we still steal space in _pad9[] but we make it have<br>
enough space for a setup_data header as well as the 32 random bytes, so<br>
we&#39;ve officially reserved the space, but in earlier kernels than this<b=
r>
change gets to you can still use the setup_data_offset method, except<br>
that it now uses the empty space in _pad9 via the setup_data mechanism.<br>
That should find you space and get you out of having to expand any<br>
integrity protected files.=C2=A0 The SEV direct boot will still work becaus=
e<br>
there&#39;s a check further down that doesn&#39;t copy the modified header =
back<br>
over the kernel because it is ignored on efi stub boot anyway.</blockquote>=
</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ahh, it looks lik=
e there&#39;s now an integrity check on the cmdline file. Darn.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">The patch in that PULL is still goo=
d and necessary and fixed a *different* bug, though. So we should still mov=
e forward on that.</div><div dir=3D"auto"><br></div><div dir=3D"auto">But i=
t sounds like you might now have a concrete suggestion on something even be=
tter. I&#39;m CCing hpa, as this is his wheelhouse, and maybe you two can d=
ivise the next step while I&#39;m away. Maybe the pad9 thing you mentioned =
is the super nice solution we&#39;ve been searching for this whole time. Wh=
en I&#39;m home in 10 days and have internet again, I&#39;ll take a look at=
 where thing&#39;s are out and try to figure out how I can be productive ag=
ain with it.</div><div dir=3D"auto"><br></div><div dir=3D"auto">And sorry a=
gain for the short HTML emails. A day ago I was using mosh from my phone to=
 use mutt on a server to reply to emails downloaded from lore. But today th=
e cloud cover means the best I can do is queue these up in the Android gmai=
l client and hope they eventually send.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Jason=C2=A0</div><div dir=3D"auto"></div></div>

--0000000000005da80405f3a99399--

