Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50257692340
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:27:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWEz-00027E-Vj; Fri, 10 Feb 2023 11:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQWEx-00020l-Tj
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:27:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQWEw-0006Oz-3a
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676046429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s9zA0Szuu8pcZb+l7ZDr6r8FVuOQDA/W+dKJF0wk/qk=;
 b=EOCXq5QavF3Nhxe/3+yqfU4Om1HRl/hx6OU4s3ozTLP7TwtJdopob0g5cLe+ciQ/TRzRcU
 Yrw9dMiiJOJHwFAwlx5Q9PZXjGcnmqiLvhnlYQ/oUvDwwbm9wSdYP9/C9dfynKNcUVg9mY
 8X4bqQMTcvzZTlfG8IX3idvYq4AMuHo=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-127-Gx8zGP2VOJuMl6DYPoIF-A-1; Fri, 10 Feb 2023 11:27:07 -0500
X-MC-Unique: Gx8zGP2VOJuMl6DYPoIF-A-1
Received: by mail-pf1-f197.google.com with SMTP id
 s4-20020a056a00194400b0058d9b9fecb6so2879125pfk.1
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s9zA0Szuu8pcZb+l7ZDr6r8FVuOQDA/W+dKJF0wk/qk=;
 b=j7pDXyABTChxwRXGBa41rXgTCIrxKKOBAzExM++EUnJrrFzpvRFk2gGziSC8OymRvR
 nZuK0PjYjThWS2wQX1V9Lqi6Uc4LEDIOH0FiXADTpt3MUIoNdzMLeIaI1Xm2c7hL/96N
 5n2JBBP+HHVkaM7VkvAVqz8RVsJQBjjCRq8QIoP5U7YGUbt2wd9E8rYH8827v2pKo3NS
 oiLbPFm2llW/pKckptDXxPKnhqpI8hI9tG6DkcIEnB00VbpHR4rFevS0UCUeTfCcn3jy
 8W29LS6vt/sDqA0m4YBDz/q6euQeWyeD+qCOoBxAjBmcnhgKfDwAfN9WI5aoqiMnB+H8
 40vQ==
X-Gm-Message-State: AO0yUKWM80d7kImVZXOKhlH1BBbtKDE1bZVEwF/IK6JEDZ2NzYap1RN3
 lU5dRPqHXdx+LT536F3z9mJYWnPPbXMVxv+d8wgoYdokQsv7MOH89/sZbH41u+sp8eQ2ik6XbXP
 tDxn5uUP4BvBzfgiR0GNVs7pdnWX8bpY=
X-Received: by 2002:a62:5f04:0:b0:593:fe3d:1b6c with SMTP id
 t4-20020a625f04000000b00593fe3d1b6cmr3493047pfb.27.1676046426662; 
 Fri, 10 Feb 2023 08:27:06 -0800 (PST)
X-Google-Smtp-Source: AK7set9nTrXfKxkoWcbSsx3MztN9jpnRQLkaJnXnxJKTsihm2e63JUtNgrIS8rK7p5KIyibLcP8/QirVC0Pq2XZ+4TQ=
X-Received: by 2002:a62:5f04:0:b0:593:fe3d:1b6c with SMTP id
 t4-20020a625f04000000b00593fe3d1b6cmr3493039pfb.27.1676046426368; Fri, 10 Feb
 2023 08:27:06 -0800 (PST)
MIME-Version: 1.0
References: <20230209184758.1017863-1-jsnow@redhat.com>
 <20230209184758.1017863-5-jsnow@redhat.com>
 <87sffd5xv2.fsf@pond.sub.org>
In-Reply-To: <87sffd5xv2.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Fri, 10 Feb 2023 11:26:55 -0500
Message-ID: <CAFn=p-ZcguU+g2H1BWutxF_i2s6PU-XfDfBsZnpxxuk=RqaxEw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] qapi/expr: add typing workaround for AbstractSet
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="000000000000df12e105f45af7dd"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

--000000000000df12e105f45af7dd
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 10, 2023, 10:44 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > mypy can only narrow the type of `Mapping[str, ...].keys() & Set[str]`
> > to `AbstractSet[str]` and not a `Set[str]`. As a result, if the type of
> > an expression is changed to a Mapping[], mypy is unsure if the .pop() is
> > safe.
> >
> > A forthcoming commit does exactly that, so wrap the expression in a
> > set() constructor to force the intermediate expression to be resolved as
> > a mutable type.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  scripts/qapi/expr.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> > index b56353bdf84..af802367eff 100644
> > --- a/scripts/qapi/expr.py
> > +++ b/scripts/qapi/expr.py
> > @@ -622,8 +622,8 @@ def check_expr(expr_elem: _JSONObject) -> None:
> >      if 'include' in expr:
> >          return
> >
> > -    metas = expr.keys() & {'enum', 'struct', 'union', 'alternate',
> > -                           'command', 'event'}
> > +    metas = set(expr.keys() & {
> > +        'enum', 'struct', 'union', 'alternate', 'command', 'event'})
> >      if len(metas) != 1:
> >          raise QAPISemError(
> >              info,
>                    "expression must have exactly one key"
>                    " 'enum', 'struct', 'union', 'alternate',"
>                    " 'command', 'event'")
>            meta = metas.pop()
>
> I'm mildly surprised that the result of operator & is considered
> immutable.  How could it *not* be a freshly created set?  Oh well.
>

I think because it's up to the LHS type to return the result.

Wait, maybe I can just switch the operand order, lol.


> Passing a set to set() is a no-op, so
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
> Regardless, the code feels a bit too clever to me.  It actually did
> already when I wrote it, but I the less clever ways I could think of
> were also much more verbose.
>
> The code checks that exactly one of a set of keys is present, and which
> one it is.  Any ideas?
>

Yeah, it feels too clever but I'm not sure I know something more elegant,
really. I'll consider it while I address your feedback and prepare a respin.

>

--000000000000df12e105f45af7dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Feb 10, 2023, 10:44 AM Markus Armbruster &lt;<=
a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">John Snow &lt;<a href=3D"mailto:jsnow@red=
hat.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt; writ=
es:<br>
<br>
&gt; mypy can only narrow the type of `Mapping[str, ...].keys() &amp; Set[s=
tr]`<br>
&gt; to `AbstractSet[str]` and not a `Set[str]`. As a result, if the type o=
f<br>
&gt; an expression is changed to a Mapping[], mypy is unsure if the .pop() =
is<br>
&gt; safe.<br>
&gt;<br>
&gt; A forthcoming commit does exactly that, so wrap the expression in a<br=
>
&gt; set() constructor to force the intermediate expression to be resolved =
as<br>
&gt; a mutable type.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/expr.py | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py<br>
&gt; index b56353bdf84..af802367eff 100644<br>
&gt; --- a/scripts/qapi/expr.py<br>
&gt; +++ b/scripts/qapi/expr.py<br>
&gt; @@ -622,8 +622,8 @@ def check_expr(expr_elem: _JSONObject) -&gt; None:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if &#39;include&#39; in expr:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 metas =3D expr.keys() &amp; {&#39;enum&#39;, &#39;struc=
t&#39;, &#39;union&#39;, &#39;alternate&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;command&#39;, &#39;event&#39;}<br>
&gt; +=C2=A0 =C2=A0 metas =3D set(expr.keys() &amp; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;enum&#39;, &#39;struct&#39;, &#39;un=
ion&#39;, &#39;alternate&#39;, &#39;command&#39;, &#39;event&#39;})<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if len(metas) !=3D 1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
expression must have exactly one key&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
 &#39;enum&#39;, &#39;struct&#39;, &#39;union&#39;, &#39;alternate&#39;,&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
 &#39;command&#39;, &#39;event&#39;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta =3D metas.pop()<br>
<br>
I&#39;m mildly surprised that the result of operator &amp; is considered<br=
>
immutable.=C2=A0 How could it *not* be a freshly created set?=C2=A0 Oh well=
.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>I think because it&#39;s up to the LHS type to return the result.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Wait, maybe I can just switch th=
e operand order, lol.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Passing a set to set() is a no-op, so<br>
<br>
Reviewed-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" tar=
get=3D"_blank" rel=3D"noreferrer">armbru@redhat.com</a>&gt;<br>
<br>
Regardless, the code feels a bit too clever to me.=C2=A0 It actually did<br=
>
already when I wrote it, but I the less clever ways I could think of<br>
were also much more verbose.<br>
<br>
The code checks that exactly one of a set of keys is present, and which<br>
one it is.=C2=A0 Any ideas?<br></blockquote></div></div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Yeah, it feels too clever but I&#39;m not sure I=
 know something more elegant, really. I&#39;ll consider it while I address =
your feedback and prepare a respin.</div><div dir=3D"auto"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000df12e105f45af7dd--


