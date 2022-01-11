Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F8B48B898
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:23:46 +0100 (CET)
Received: from localhost ([::1]:59398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NgH-0006Hu-29
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:23:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n7NXj-00038h-Gb
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 15:14:57 -0500
Received: from [2607:f8b0:4864:20::932] (port=41533
 helo=mail-ua1-x932.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n7NXf-0002lF-Ax
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 15:14:54 -0500
Received: by mail-ua1-x932.google.com with SMTP id p37so727930uae.8
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 12:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DaQsWcbKc98wE6rFdDPMaRjY5gDBkfwIdRfvZ9n+MTA=;
 b=rItgNwAsO0MX/tTKxphznaCEs2OUYzxY7SZ51lKAskNXnGOtOCwKS7DrjDZW82i0O1
 2M4j9bpzlZRTl8DXRllTZ+KC4VVbRgSnUOR1TbkLVaI/ES3bt5L39i6jBfB22YxX5dXB
 XiGYqeYCfzjLwGIHVKzOdbzmo3bt6qlW8igRdJ3Kn3QAjbA/v+ZoWTKL3UIROGU0bXoA
 AKf1zPqe8uRvwxqOHpmUCwIOVQ4E/Ty8DbxcnRP9bm/sdYw2JX0D6a0K9WrulHrtDFZM
 dDsHTmfWLCp5tkQ3s/qRAr6o5tZ4Ywj0Kkno2+LIEWfimMYewQwTawBT8dC8MTNVkatI
 vXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DaQsWcbKc98wE6rFdDPMaRjY5gDBkfwIdRfvZ9n+MTA=;
 b=nPwEWBJXC6IWh6ncA9u8ejzHdyt9ZcJ5cYiDdM7yemS0hwG+x24vc/dWHkqCjrrqhR
 clJC0OC/xs65VzDWa6mCocLMqWB1xJxsf1TnujtqXgTlKjEIyUEs1qcou2WEDiKV1Chr
 DozojL0ZVcabRYewAPLsmFaftZczUQ7vbCWvzLY93kTTrMy0zSRiB7Oa4PJQKu5DXNlQ
 Hz462nUwILUoDElV2S4/8YAtax+XEwlNNLdp9CGVV9l8d3iN5fUmL5kIZITMiFHm1jXa
 DPhhn1hXqDgOBWWjMYI6el/axKaflZGmynsqj63OBLNNxoK6aNrPo2jjSKIYyRIsu3hz
 CgJA==
X-Gm-Message-State: AOAM532TmnqxnAJ/nG+4rdZpYUbUYNOgRd+vELGBrlXpD5h4TAlJSV8v
 GOnlykmkeJVU76wK/U49PGe/Mer5PJttR+CQaazRJg==
X-Google-Smtp-Source: ABdhPJzBv31gtTOK0hk9fkMvxsUGj6oBEkiMqnLCh9xYYjPESwVBqabbN6YQELJOwfa19zE6rcjTcse4X8a+/6lQyeo=
X-Received: by 2002:a67:cf04:: with SMTP id y4mr2698159vsl.35.1641932088930;
 Tue, 11 Jan 2022 12:14:48 -0800 (PST)
MIME-Version: 1.0
References: <20220106220038.3658586-1-venture@google.com>
 <3d44e8ff-6adc-8c52-5449-1c3ef4355786@vivier.eu>
In-Reply-To: <3d44e8ff-6adc-8c52-5449-1c3ef4355786@vivier.eu>
From: Patrick Venture <venture@google.com>
Date: Tue, 11 Jan 2022 12:14:37 -0800
Message-ID: <CAO=notz06X6SP+U_FSkMsJtUO751+2EkqffCRQqyNUkTPb6oqA@mail.gmail.com>
Subject: Re: [PATCH] linux-user: rt_sigprocmask, check read perms first
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Shu-Chun Weng <scw@google.com>
Content-Type: multipart/alternative; boundary="000000000000e8533605d5541aa2"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::932
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=venture@google.com; helo=mail-ua1-x932.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--000000000000e8533605d5541aa2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 8, 2022 at 10:16 AM Laurent Vivier <laurent@vivier.eu> wrote:

> Le 06/01/2022 =C3=A0 23:00, Patrick Venture a =C3=A9crit :
> > From: Shu-Chun Weng <scw@google.com>
> >
> > Linux kernel does it this way (checks read permission before validating
> `how`)
> > and the latest version of ABSL's `AddressIsReadable()` depends on this
> > behavior.
> >
> > c.f.
> https://github.com/torvalds/linux/blob/9539ba4308ad5bdca6cb41c7b73cbb9f79=
6dcdd7/kernel/signal.c#L3147
> > Reviewed-by: Patrick Venture <venture@google.com>
> > Signed-off-by: Shu-Chun Weng <scw@google.com>
> > ---
> >   linux-user/syscall.c | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index ce9d64896c..3070d31f34 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -9491,6 +9491,11 @@ static abi_long do_syscall1(void *cpu_env, int
> num, abi_long arg1,
> >               }
> >
> >               if (arg2) {
> > +                if (!(p =3D lock_user(VERIFY_READ, arg2,
> sizeof(target_sigset_t), 1)))
> > +                    return -TARGET_EFAULT;
> > +                target_to_host_sigset(&set, p);
> > +                unlock_user(p, arg2, 0);
> > +                set_ptr =3D &set;
> >                   switch(how) {
> >                   case TARGET_SIG_BLOCK:
> >                       how =3D SIG_BLOCK;
> > @@ -9504,11 +9509,6 @@ static abi_long do_syscall1(void *cpu_env, int
> num, abi_long arg1,
> >                   default:
> >                       return -TARGET_EINVAL;
> >                   }
> > -                if (!(p =3D lock_user(VERIFY_READ, arg2,
> sizeof(target_sigset_t), 1)))
> > -                    return -TARGET_EFAULT;
> > -                target_to_host_sigset(&set, p);
> > -                unlock_user(p, arg2, 0);
> > -                set_ptr =3D &set;
> >               } else {
> >                   how =3D 0;
> >                   set_ptr =3D NULL;
>
> I know it's only code move but generally we also update the style to pass
> scripts/checkpatch.pl
> successfully.
>

That is a reasonable request, however, can I just send a follow-on patch?
I didn't write this one and I honestly don't know much about it, but I
don't mind doing the cleanup


>
> Could you also update TARGET_NR_sigprocmask in the same way as it seems
> the kernel behaves like this
> too in this case?
>

I can take a look.  I would prefer then to also prefetch the style fixup in
a preceding patch. I don't recall seeing whether qemu supports clang-format=
.


>
> Thanks,
> Laurent
>

Patrick

--000000000000e8533605d5541aa2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 8, 2022 at 10:16 AM Laure=
nt Vivier &lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Le 06/0=
1/2022 =C3=A0 23:00, Patrick Venture a =C3=A9crit=C2=A0:<br>
&gt; From: Shu-Chun Weng &lt;<a href=3D"mailto:scw@google.com" target=3D"_b=
lank">scw@google.com</a>&gt;<br>
&gt; <br>
&gt; Linux kernel does it this way (checks read permission before validatin=
g `how`)<br>
&gt; and the latest version of ABSL&#39;s `AddressIsReadable()` depends on =
this<br>
&gt; behavior.<br>
&gt; <br>
&gt; c.f.=C2=A0 <a href=3D"https://github.com/torvalds/linux/blob/9539ba430=
8ad5bdca6cb41c7b73cbb9f796dcdd7/kernel/signal.c#L3147" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/torvalds/linux/blob/9539ba4308ad5bdca6c=
b41c7b73cbb9f796dcdd7/kernel/signal.c#L3147</a><br>
&gt; Reviewed-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.com"=
 target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; Signed-off-by: Shu-Chun Weng &lt;<a href=3D"mailto:scw@google.com" tar=
get=3D"_blank">scw@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0linux-user/syscall.c | 10 +++++-----<br>
&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
&gt; index ce9d64896c..3070d31f34 100644<br>
&gt; --- a/linux-user/syscall.c<br>
&gt; +++ b/linux-user/syscall.c<br>
&gt; @@ -9491,6 +9491,11 @@ static abi_long do_syscall1(void *cpu_env, int =
num, abi_long arg1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (arg2) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(p =3D l=
ock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return -TARGET_EFAULT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_to_hos=
t_sigset(&amp;set, p);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock_user(p=
, arg2, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_ptr =3D &=
amp;set;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sw=
itch(how) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ca=
se TARGET_SIG_BLOCK:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0how =3D SIG_BLOCK;<br>
&gt; @@ -9504,11 +9509,6 @@ static abi_long do_syscall1(void *cpu_env, int =
num, abi_long arg1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0de=
fault:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return -TARGET_EINVAL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(p =3D l=
ock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1)))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return -TARGET_EFAULT;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_to_hos=
t_sigset(&amp;set, p);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock_user(p=
, arg2, 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_ptr =3D &=
amp;set;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ho=
w =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0se=
t_ptr =3D NULL;<br>
<br>
I know it&#39;s only code move but generally we also update the style to pa=
ss scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_b=
lank">checkpatch.pl</a> <br>
successfully.<br></blockquote><div><br></div><div>That is a reasonable requ=
est, however, can I just send a follow-on patch?=C2=A0 I didn&#39;t write t=
his one and I honestly don&#39;t know much about it, but I don&#39;t mind d=
oing the cleanup</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
Could you also update TARGET_NR_sigprocmask in the same way as it seems the=
 kernel behaves like this <br>
too in this case?<br></blockquote><div><br></div><div>I can take a look.=C2=
=A0 I would prefer then to also prefetch the style fixup in a preceding pat=
ch. I don&#39;t recall seeing whether qemu supports clang-format.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Laurent<br></blockquote><div><br></div><div>Patrick=C2=A0</div></div></div>

--000000000000e8533605d5541aa2--

