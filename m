Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910D93759F8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 20:09:52 +0200 (CEST)
Received: from localhost ([::1]:51066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leiRb-00068U-En
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 14:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1leiBg-0007u2-CQ
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:53:24 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:40918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1leiBe-00066m-81
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:53:24 -0400
Received: by mail-qt1-x834.google.com with SMTP id j19so4671406qtp.7
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 10:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zT11MwALKpb2a/wu/dinduGbqj1Z3Zv5hINV2VZwVYg=;
 b=S04yXrmG5kn5TwO8YcY2rLN0X6efSkk20GyFaAcXemk9GwuJY9Pn1p/ylqleidpFmr
 DvFDwGwSMF+4vkLj1YZp2MJ2pRLebL4fXnKCpcetHF2BGqkdJa8TMylzAHujgwdFDUZU
 FJ9ntBJUEcI3o1t30ertWMTLrQpJFqB8Ng/UngPVKHwYvVQKLZ+sjBNkVGZtf87P+Wo9
 d87a95Aiyc0yKh7YP9GmgSWcauZA1u+LExieE9pDH6UFwHyy7P4ot5y+bx+VHdxzOZT/
 JKgkIp5Qzq5nWBeVa5kNxnRBc6wYshEwrB9BfsOKWZGwlrWhb+B1FrXhk4QzEyFhLVBK
 2PFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zT11MwALKpb2a/wu/dinduGbqj1Z3Zv5hINV2VZwVYg=;
 b=Cn3w3wMaTSqg3q/GFCk4rPhfNb5g4bM3XfEFfjKWoNPhxFQnUsGTX296J10ob68Aai
 aUxrqEJtgxtmh2ykjFtZhy+Kh0QN91Zx0eWqNPg62UJsxq9rCbQkA87xLYBbS8DJiP7t
 /KhE/m/s3xoCm3VYmKJS482TtelJGNJ1GhalEXAclyIG8TK5mzqo5uCopjXkQtFYoFab
 5E2fG+UO6GwXpy4Akwsq2LvhnIW+qpndXlJg1WpLDYjqWuwlsgIDcK8j33DVzHEJ/jOb
 aoJ5C4fjPMeGELjViU16tqEsiVN9mqLWpokXsJ2OfjwqmWezVyX9B0mKi6/IwmJQufbr
 QqRA==
X-Gm-Message-State: AOAM53337Cx5K0k+Au62+Q6Z5gs9h9nDjFV9PGnoBE9ULv5PY15GNo49
 SfIxJSWEyzEdDlmZQ84C/JeIqzu1qoqxd62eSv8bqg==
X-Google-Smtp-Source: ABdhPJzWqpo2sD6k6w28mBHpmIS6Pngdx3yfB2Xf+TqrQb631QGuIJ0HyxEKngUkl7sIYiKsE/1ca0KAozsIzauPsUU=
X-Received: by 2002:ac8:7205:: with SMTP id a5mr5519560qtp.244.1620323597419; 
 Thu, 06 May 2021 10:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210506173826.72832-1-imp@bsdimp.com>
 <f8db526d-cb19-c633-1327-2282333c7fe3@linaro.org>
In-Reply-To: <f8db526d-cb19-c633-1327-2282333c7fe3@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 11:53:06 -0600
Message-ID: <CANCZdfo3RwMYtHvH4c03Gj0+YL-QHi_Bpu5SRMB6SWrMHiQiwQ@mail.gmail.com>
Subject: Re: [PATCH v2] tcg: Use correct trap number for page faults on *BSD
 systems
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000721b0005c1acfce4"
Received-SPF: none client-ip=2607:f8b0:4864:20::834;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x834.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Riku Voipio <riku.voipio@iki.fi>,
 QEMU Developers <qemu-devel@nongnu.org>, Mark Johnston <markj@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Juergen Lock <nox@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000721b0005c1acfce4
Content-Type: text/plain; charset="UTF-8"

On Thu, May 6, 2021 at 11:51 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 5/6/21 10:38 AM, Warner Losh wrote:
> > The trap number for a page fault on BSD systems is T_PAGEFLT not 0xe.
> 0xe is
> > used by Linux and represents the intel hardware trap vector. The BSD
> kernels,
> > however, translate this to T_PAGEFLT in their Xpage, Xtrap0e, Xtrap14,
> etc fault
> > handlers. This is true for i386 and x86_64, though the name of the trap
> hanlder
> > can very on the flavor of BSD. As far as I can tell, Linux doesn't
> provide a
> > define for this value. Invent a new one (PAGE_FAULT_TRAP) and use it
> instead to
> > avoid uglier ifdefs.
> >
> > Signed-off-by: Mark Johnston<markj@FreeBSD.org>
> > Signed-off-by: Juergen Lock<nox@FreeBSD.org>
> > [ Rework to avoid ifdefs and expand it to i386 ]
> > Signed-off-by: Warner Losh<imp@bsdimp.com>
> > ---
> >   accel/tcg/user-exec.c | 14 ++++++++++++--
> >   1 file changed, 12 insertions(+), 2 deletions(-)
>
> Queued to tcg-next, thanks.
>
> Looks like this area could use a bit of cleanup...
>

No arguments from me there... Thanks!

Warner

--000000000000721b0005c1acfce4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 11:51 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 5/6/21 10:38 AM, Warner Losh wrote:<br>
&gt; The trap number for a page fault on BSD systems is T_PAGEFLT not 0xe. =
0xe is<br>
&gt; used by Linux and represents the intel hardware trap vector. The BSD k=
ernels,<br>
&gt; however, translate this to T_PAGEFLT in their Xpage, Xtrap0e, Xtrap14,=
 etc fault<br>
&gt; handlers. This is true for i386 and x86_64, though the name of the tra=
p hanlder<br>
&gt; can very on the flavor of BSD. As far as I can tell, Linux doesn&#39;t=
 provide a<br>
&gt; define for this value. Invent a new one (PAGE_FAULT_TRAP) and use it i=
nstead to<br>
&gt; avoid uglier ifdefs.<br>
&gt; <br>
&gt; Signed-off-by: Mark Johnston&lt;markj@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Juergen Lock&lt;nox@FreeBSD.org&gt;<br>
&gt; [ Rework to avoid ifdefs and expand it to i386 ]<br>
&gt; Signed-off-by: Warner Losh&lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0accel/tcg/user-exec.c | 14 ++++++++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 12 insertions(+), 2 deletions(-)<br>
<br>
Queued to tcg-next, thanks.<br>
<br>
Looks like this area could use a bit of cleanup...<br></blockquote><div><br=
></div><div>No arguments from me there... Thanks!</div><div><br></div><div>=
Warner</div></div></div>

--000000000000721b0005c1acfce4--

