Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ADF401047
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 16:39:28 +0200 (CEST)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMtIt-0000F6-Qe
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 10:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mMtHp-00080r-3D
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:38:21 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:42833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mMtHn-0003oY-K6
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:38:20 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id s25so3451297vsa.9
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 07:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ciGus2Ombwg3hQ299JabpLspQc/w7trf89lXpzHw424=;
 b=dnrsvtFgKC2pHeBinNEJJQRFs1gZ4bzWLBVGnJ4QQvVwdU7v9scK2mlZXW+xkNOjow
 BQibAprQNnma8wVSjN/teWzkZ+kKqu0t/3n1ymKVzJb10PAbgFyBit8sHNT3gl2x93TZ
 m56X0FKYP77HvIv2g1kSn1Jj79c8GUDTiv9vorxrfenx8M1gmxJNvvaMN53OGo1NKWl1
 1m+fXOPDbPsC0eLW6M32DEs9LPutSYdl9JjEzTxcEYnV0glQmBSkcGJPtlsNYgQUesF0
 WSdPf5PnL+u7gleHwg7L9tZFVXB8EaGLuxrohrlkkBuEbCao3JPmedGCBQLL8lKkK4pd
 bsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ciGus2Ombwg3hQ299JabpLspQc/w7trf89lXpzHw424=;
 b=oSQ0saNPPeBpvlx34cpexEaLUzWcp+1TKcGc/9bD12jyiUs0mKoJhp3q9OF+b4aieA
 CGV878S1Hhzdt6maKS+3BV57f/K/YOa55CF86+R2CSI6IRRLzulmFHkhgjPw4kImeT2d
 thOgcnKjC+hWiZySk5Z93Slzgb39qcOgb6j4c2Obc3UOD596IAS7cE5NbCtZrGjNpBXc
 58xesM4G9jjZTU8eTN06G6Yhl4zaDaPo/QHVlXwvga2Pbxzkh2zBsfIIPR9fqTF7DFkS
 6W7fzIGSkyqj/zuQ0V9JSPsVx18uzTWRdJ0cADHzKBtXgWUwEZsTOH410fuQLp2H9T4H
 TTIw==
X-Gm-Message-State: AOAM530NsGgeUBittNsS9qmmyshuqTd6ZbvcfWJOjakTYsvo8mHl8AMh
 Kiw5dg9925+EIVMd61vD5uerkkIM3JjqOjTH1La7Sg==
X-Google-Smtp-Source: ABdhPJwdymymHYsOaa5g/8i7harxHoXSpk6RGkBpK1gj9kl8w05fPX7lSKBEl9mSnNi72EYrAwTtwaNXeHeHOFuRoOs=
X-Received: by 2002:a67:1985:: with SMTP id 127mr3782948vsz.44.1630852698585; 
 Sun, 05 Sep 2021 07:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-33-imp@bsdimp.com>
 <6d46ae71-f66c-1a5c-d2b5-8d91eef05b6f@linaro.org>
In-Reply-To: <6d46ae71-f66c-1a5c-d2b5-8d91eef05b6f@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 5 Sep 2021 08:38:07 -0600
Message-ID: <CANCZdfpELCMdLZ9COfii+NXcB1B9UWu_GKakdbMsuQym58Wa2A@mail.gmail.com>
Subject: Re: [PATCH v3 32/43] bsd-user: Rewrite target system call definintion
 glue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000c7cc9d05cb407bd6"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c7cc9d05cb407bd6
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 5, 2021 at 4:33 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/3/21 1:47 AM, imp@bsdimp.com wrote:
> > From: Warner Losh<imp@FreeBSD.org>
> >
> > Rewrite target definnitions to interface with the FreeBSD system calls.
> > This covers basic types (time_t, iovec, umtx_time, timespec, timeval,
> > rusage, rwusage) and basic defines (mmap, rusage). Also included are
> > FreeBSD version-specific variations.
> >
> > Signed-off-by: Stacey Son<sson@FreeBSD.org>
> > Signed-off-by: Warner Losh<imp@bsdimp.com>
> > ---
> >   bsd-user/bsd-mman.h     | 121 --------------------
> >   bsd-user/mmap.c         |   2 -
> >   bsd-user/syscall_defs.h | 247 ++++++++++++++++++++++++++--------------
> >   3 files changed, 162 insertions(+), 208 deletions(-)
> >   delete mode 100644 bsd-user/bsd-mman.h
>
> I think I gave you an
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>

Ah, so you did. I'm still honing my patch handling skills...

Warner

--000000000000c7cc9d05cb407bd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 5, 2021 at 4:33 AM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 9/3/21 1:47 AM, <a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a> wrote:<br>
&gt; From: Warner Losh&lt;imp@FreeBSD.org&gt;<br>
&gt; <br>
&gt; Rewrite target definnitions to interface with the FreeBSD system calls=
.<br>
&gt; This covers basic types (time_t, iovec, umtx_time, timespec, timeval,<=
br>
&gt; rusage, rwusage) and basic defines (mmap, rusage). Also included are<b=
r>
&gt; FreeBSD version-specific variations.<br>
&gt; <br>
&gt; Signed-off-by: Stacey Son&lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Warner Losh&lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/bsd-mman.h=C2=A0 =C2=A0 =C2=A0| 121 -------------=
-------<br>
&gt;=C2=A0 =C2=A0bsd-user/mmap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A02 -<br>
&gt;=C2=A0 =C2=A0bsd-user/syscall_defs.h | 247 ++++++++++++++++++++++++++--=
------------<br>
&gt;=C2=A0 =C2=A03 files changed, 162 insertions(+), 208 deletions(-)<br>
&gt;=C2=A0 =C2=A0delete mode 100644 bsd-user/bsd-mman.h<br>
<br>
I think I gave you an<br>
Acked-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.=
org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockquote=
><div><br></div><div>Ah, so you did. I&#39;m still honing my patch handling=
 skills...</div><div><br></div><div>Warner</div></div></div>

--000000000000c7cc9d05cb407bd6--

