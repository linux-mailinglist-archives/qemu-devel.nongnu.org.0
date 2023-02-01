Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B909686FA7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 21:30:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNJj6-0001l0-HQ; Wed, 01 Feb 2023 15:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Q3mX=55=zx2c4.com=Jason@kernel.org>)
 id 1pNJj4-0001kr-Lk
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:29:02 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Q3mX=55=zx2c4.com=Jason@kernel.org>)
 id 1pNJj2-0003nr-4y
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:29:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 830C2B8229E
 for <qemu-devel@nongnu.org>; Wed,  1 Feb 2023 20:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2CD1C433D2
 for <qemu-devel@nongnu.org>; Wed,  1 Feb 2023 20:28:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Nkrw10b1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675283333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BeC/U9Shrqj1gv29cWMrRgWq03KLAHEM+n3YlHZRW58=;
 b=Nkrw10b1UVG5ykyfpxTNCWyTobMaa1zA/XErBgkRD63eHPQnZ76uZ2yLuEXw7JU0hQbY/y
 wFP9iFVaExrMTrg1Gd30bDMGta6djOgzrwTFoWzOK1xiSqreBwc/zRFMVT7Gy6h2sH7XF2
 Tf7wcyWNaP0YVt/lqNQaUrd2Q2+eKQQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f6469e70
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 1 Feb 2023 20:28:53 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-4a263c4ddbaso784167b3.0
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 12:28:52 -0800 (PST)
X-Gm-Message-State: AO0yUKV3sIUG/38SjEDyyoi4cLnJMq834r1BSER/hroPXieH5ztyZbuT
 2cprwcgnsnvPT6ioWyKMZOmApQuMtYKleDwmo/8=
X-Google-Smtp-Source: AK7set/0DM3relTL7H4RK8xENIee+gFegdgrFK2jeX5YMCVbr1BL6soa7dIX7/qna59DbJNSt3m+eLuhW20/dYlWBdg=
X-Received: by 2002:a81:2591:0:b0:50f:7b33:e1d1 with SMTP id
 l139-20020a812591000000b0050f7b33e1d1mr431597ywl.79.1675283332444; Wed, 01
 Feb 2023 12:28:52 -0800 (PST)
MIME-Version: 1.0
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
 <CAHmME9ouTTk1ONXm276CwunOpy=MAW1Q79x25kcQv=YJTZ88dQ@mail.gmail.com>
 <2b8fc552e1dc3a14de404eeaff0819ec8da7de54.camel@linux.ibm.com>
In-Reply-To: <2b8fc552e1dc3a14de404eeaff0819ec8da7de54.camel@linux.ibm.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 1 Feb 2023 12:51:48 -0500
X-Gmail-Original-Message-ID: <CAHmME9ps8w8TbC_6Bk8OQbJytR-_CJrcUWT_uXDV+xjL293NHQ@mail.gmail.com>
Message-ID: <CAHmME9ps8w8TbC_6Bk8OQbJytR-_CJrcUWT_uXDV+xjL293NHQ@mail.gmail.com>
Subject: Re: [PATCH] x86: fix q35 kernel measurements broken due to rng seeding
To: "James E . J . Bottomley" <jejb@linux.ibm.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 DOV MURIK <Dov.Murik1@il.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000edb8bd05f3a94b77"
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

--000000000000edb8bd05f3a94b77
Content-Type: text/plain; charset="UTF-8"

It's not a secret, but I have so little internet right now that I can't
even load a webpage, and I'm on my phone, hence the short HTMLified emails.

In brief, though, it gets rid of all modifications to the kernel image all
together, so it should fix your issue.

On Wed, Feb 1, 2023, 10:24 James Bottomley <jejb@linux.ibm.com> wrote:

> On Wed, 2023-02-01 at 10:10 -0500, Jason A. Donenfeld wrote:
> > This is already fixed via the patch that MST just sent in his pull.
> > So wait a few days for that to be merged and it'll be all set.
> >
> > No need for this patch here. Do not merge.
>
> If it's not a secret, would it be too much trouble to point to the
> branch so we can actually test it?  It does seem that the biggest
> problem this issue shows is that there wasn't wide enough configuration
> testing done on the prior commits before they were merged.
>
> James
>
>

--000000000000edb8bd05f3a94b77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It&#39;s not a secret, but I have so little internet righ=
t now that I can&#39;t even load a webpage, and I&#39;m on my phone, hence =
the short HTMLified emails.<div dir=3D"auto"><br></div><div dir=3D"auto">In=
 brief, though, it gets rid of all modifications to the kernel image all to=
gether, so it should fix your issue.</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 1, 2023, 10:24 James =
Bottomley &lt;<a href=3D"mailto:jejb@linux.ibm.com">jejb@linux.ibm.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 2023-02-01 at 10=
:10 -0500, Jason A. Donenfeld wrote:<br>
&gt; This is already fixed via the patch that MST just sent in his pull.<br=
>
&gt; So wait a few days for that to be merged and it&#39;ll be all set.<br>
&gt; <br>
&gt; No need for this patch here. Do not merge.<br>
<br>
If it&#39;s not a secret, would it be too much trouble to point to the<br>
branch so we can actually test it?=C2=A0 It does seem that the biggest<br>
problem this issue shows is that there wasn&#39;t wide enough configuration=
<br>
testing done on the prior commits before they were merged.<br>
<br>
James<br>
<br>
</blockquote></div>

--000000000000edb8bd05f3a94b77--

