Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C830E62C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 23:41:01 +0100 (CET)
Received: from localhost ([::1]:40512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7QpY-0006O1-V7
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 17:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l7Qes-0000If-0x
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 17:29:58 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:42288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l7Qeq-0005h0-Ay
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 17:29:57 -0500
Received: by mail-vs1-xe34.google.com with SMTP id v19so727105vsf.9
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 14:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2CnDQPA2VutawhiAFJDcmgS62w28j51ePUxMLJ093go=;
 b=YSmHPhkNtYmIwK3Fcxxcq2YUCLxXXW9edjSjOuoMj4agAur/P+2R4rdcuUnWitxiEh
 CFqBx7mevLtVB0TeJRi5rur73n9MJ1MEHaKG5nmJaGn0ZMwTgQH+ExQmHJmPioM6JPsr
 Ok20PXZHLk3XnKIIJ5I7n4Rhc5wxwfTyFHx2T4gt59HCAwys73vJd2xZl+ol+kx9g6W5
 aSprz0/2zJKnIH7MVOF12Fu7j/SXWbibDPfEUjnvlPG6G38QpDBiVL+1NP+x+VYfJluc
 bFPptwtRhxDoC0b9z7LwzM+x2qW6DaKLPmMPGS3jFthgdxiF5ulNo1V4BsioM6kakmn8
 94kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2CnDQPA2VutawhiAFJDcmgS62w28j51ePUxMLJ093go=;
 b=gtWLtPBd4Kae3YfSe5Myb68nMYDoYz58LmBHpBXuSWPAxyiJZkbboZK/MliayAAu0N
 o6hHvNSvtkw7Dxyp4PWE4a6dqYbhc9S2FpB2FgavRlsMKtp/N2CFVPhh6y1P7Pna/IT3
 WWayqW/wNheY3tDJWpHGXZDcQHwE+EZaSPMBMTEPcu96Omtc5SCVGPQT8Pn5e3YBOYgd
 fT3/+jjUrsd2E2gKAofoUA9eOwg7wusH9bbxVX2TgKgi1TcnLhXMcYViFxqBJxjOyMG5
 pTKz1pRNeH5A2XLyVZdIYH9dTRtPYvDGwJKfsJGZ4XVn9YfAU8QVYV0vq6X8VU6x9RqK
 uSkg==
X-Gm-Message-State: AOAM530p6xciX6EwaS7wIZyM0//PQGKkYu/rZ/ZbanLIbXH/kn70oMU8
 mDOP62cJKbg9rRAA+0I8lzRiQoYDkv3iqlPDWpRZvUrFvKk=
X-Google-Smtp-Source: ABdhPJxBVzsyxiS2HcVQrtuDexXTiyWmsPoM4bIGPyP1WC1VZHQZgkkhMoGWaq5YtJo+tctmeRKO3U1eOmTZIb5/juw=
X-Received: by 2002:a05:6102:2e5:: with SMTP id
 j5mr3134665vsj.29.1612391394991; 
 Wed, 03 Feb 2021 14:29:54 -0800 (PST)
MIME-Version: 1.0
References: <20210203213729.1940893-1-dje@google.com>
 <20210203213729.1940893-3-dje@google.com>
 <20210203222053.htsym7musxnqpc5n@begin>
In-Reply-To: <20210203222053.htsym7musxnqpc5n@begin>
From: Doug Evans <dje@google.com>
Date: Wed, 3 Feb 2021 14:29:16 -0800
Message-ID: <CADPb22SNUYx9pBR-c+YSJV_T-LL4scGRV6=sFZfceCPHQfyosA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] net: Add -ipv6-hostfwd option,
 ipv6_hostfwd_add/remove commands
To: Samuel Thibault <samuel.thibault@gnu.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000056c48f05ba762059"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=dje@google.com; helo=mail-vs1-xe34.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000056c48f05ba762059
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 3, 2021 at 2:20 PM Samuel Thibault <samuel.thibault@gnu.org>
wrote:

> Doug Evans, le mer. 03 f=C3=A9vr. 2021 13:37:29 -0800, a ecrit:
> > @@ -1392,6 +1392,34 @@ SRST
> >    Remove host-to-guest TCP or UDP redirection.
> >  ERST
> >
> > +#ifdef CONFIG_SLIRP
> > +    {
> > +        .name       =3D "ipv6_hostfwd_add",
> > +        .args_type  =3D "arg1:s,arg2:s?",
> > +        .params     =3D "[netdev_id]
> [tcp|udp]:[hostaddr6]:hostport-[guestaddr6]:guestport",
>
> Perhaps explicit that the IPv6 address should be enclosed with [] ?
>


Yeah, totally open to suggestions for what to write.
I wasn't sure how to do that without getting klunky,


> > +    /* Ignore the part between the ']' and addr_sep. */
> > +    if (get_str_sep(buf, sizeof(buf), &p, addr_sep) < 0) {
>
> Mmm, I would say that we do not want to just ignore it, and rather make
> sure that it is empty, so that we can possibly make extensions later
> without breaking existing misuse.
>


Completely agree.

--00000000000056c48f05ba762059
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Wed, Feb 3, 2021 at 2:20 PM Samuel Thibault &lt;<a href=3D=
"mailto:samuel.thibault@gnu.org">samuel.thibault@gnu.org</a>&gt; wrote:<br>=
</div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Doug Evans, le mer. 03 f=C3=A9vr. 2021 13:37:29 -0800, a ecri=
t:<br>
&gt; @@ -1392,6 +1392,34 @@ SRST<br>
&gt;=C2=A0 =C2=A0 Remove host-to-guest TCP or UDP redirection.<br>
&gt;=C2=A0 ERST<br>
&gt;=C2=A0 <br>
&gt; +#ifdef CONFIG_SLIRP<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;ipv6_hostfwd_add&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .args_type=C2=A0 =3D &quot;arg1:s,arg2:s?=
&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .params=C2=A0 =C2=A0 =C2=A0=3D &quot;[net=
dev_id] [tcp|udp]:[hostaddr6]:hostport-[guestaddr6]:guestport&quot;,<br>
<br>
Perhaps explicit that the IPv6 address should be enclosed with [] ?<br></bl=
ockquote><div><br></div><div><br></div><div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Yeah, totally open to suggestions for what to write=
.</div><div class=3D"gmail_default" style=3D"font-size:small">I wasn&#39;t =
sure how to do that without getting klunky,</div><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small"></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 /* Ignore the part between the &#39;]&#39; and addr_sep=
. */<br>
&gt; +=C2=A0 =C2=A0 if (get_str_sep(buf, sizeof(buf), &amp;p, addr_sep) &lt=
; 0) {<br>
<br>
Mmm, I would say that we do not want to just ignore it, and rather make<br>
sure that it is empty, so that we can possibly make extensions later<br>
without breaking existing misuse.<br></blockquote><div><br></div><div><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Completely=C2=
=A0agree.</div></div></div>

--00000000000056c48f05ba762059--

