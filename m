Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AF9382AE6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:24:58 +0200 (CEST)
Received: from localhost ([::1]:32926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libMn-00047N-1V
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1libH8-0004s6-Ms
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:19:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1libH1-0005Mo-2w
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:19:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621250338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FHCDIPBzL9RFLpQLPMYOfQjKdAS4JBaOJX8aHKySUZI=;
 b=hdAvhlzdgjq9rFSuKhmT6bQ2YecccEycRWGNBNxwtvijvqrW/P1otB7vLQwJXTbIWFsTr0
 XosnxNfS+HpZreKdoGT9aZWymGkWiSB0soFMX3lUiGnyzwhOtEKsjH1pOR+T7OUiKcX2xF
 dfrnIEH3TCHzpG6HWPEOu0rp1D2MlWA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-XVQgGLIGOv2pc1TRz-dkmQ-1; Mon, 17 May 2021 07:18:56 -0400
X-MC-Unique: XVQgGLIGOv2pc1TRz-dkmQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 r91-20020a17090a1864b029015da4ff1c12so97547pja.4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FHCDIPBzL9RFLpQLPMYOfQjKdAS4JBaOJX8aHKySUZI=;
 b=flc931DFF9Q+g8pJeOPmGtYGVLcix6HMemujUEXARiCOSoX/+9QPnzaKPLYyrSFowp
 7+323v2uXo61q2m5wiHUWC3820TxQ2Rt6Jk3G9ZoYdaEdOH9ABjSgVm84FPPkCOjHGk6
 FN62f8oK4ep2pJIDVyij/7qpVJhDTAGuy76Fy4BZo7JnvKT0vXGaAyaNysTnxoG9LTvx
 HIZ7P2/BFDHda3uqnQ91DnQGSlDpEV7IsmtnHLM+ig8Fq3JKSMza6/vH2SCLKtH7cTpL
 dp3PLtTwq0L5WZfw3Z9HUqJTiRIWZXuVlQiJGg5j0b6f6tHk/wGcRWuufsKbQTqIgWLM
 7rWQ==
X-Gm-Message-State: AOAM530BQ30StnbnsM4uQBnCxFziw1t+1ngstYUtfz0Bivj+9WlfcNBs
 PPQiQNYuw0bgQAXBsZ0+uzKY4z4hNbdRTl6S8/dOOhO7GvkyWkY+LRuDDpz607swwoZgF//JaPP
 1KU82zH4OWzSE76B97Lfap9nq5gcjfSg=
X-Received: by 2002:a62:aa12:0:b029:28e:7580:8f3d with SMTP id
 e18-20020a62aa120000b029028e75808f3dmr59639526pff.42.1621250334805; 
 Mon, 17 May 2021 04:18:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTwP/Uv4UHgFX8FZSqxdTZRqsptMlX0CNJuRhwRKnp4jRMAFV2qbfwrAwMpbqDVraX3QXABGMSqjqRQXYcsr0=
X-Received: by 2002:a62:aa12:0:b029:28e:7580:8f3d with SMTP id
 e18-20020a62aa120000b029028e75808f3dmr59639515pff.42.1621250334602; Mon, 17
 May 2021 04:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-5-marcandre.lureau@redhat.com>
 <d974cb2c-0f54-9c19-f973-c74cee3d192b@redhat.com>
In-Reply-To: <d974cb2c-0f54-9c19-f973-c74cee3d192b@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 17 May 2021 15:18:43 +0400
Message-ID: <CAMxuvaz2V2b45L9uEs-At0UXrfOrz-ZUYORny=LhnfbpZTW1Uw@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] qapi: introduce IfPredicateList and IfAny
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000494da705c284c29e"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Armbruster,
 Markus" <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000494da705c284c29e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 13, 2021 at 3:26 AM John Snow <jsnow@redhat.com> wrote:

> On 4/29/21 9:40 AM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Refactor IfAll class, to introduce a base class IfPredicateList and add
> > IfAny for the 'any' conditions.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   scripts/qapi/common.py | 32 +++++++++++++++++++++++++++-----
> >   1 file changed, 27 insertions(+), 5 deletions(-)
> >
> > diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> > index 59a7ee2f32..102d347348 100644
> > --- a/scripts/qapi/common.py
> > +++ b/scripts/qapi/common.py
> > @@ -224,23 +224,45 @@ def __eq__(self, other: object) -> bool:
> >           return self.option =3D=3D other.option
> >
> >
> > -class IfAll(IfPredicate):
> > +class IfPredicateList(IfPredicate):
> > +    C_SEP =3D ""
> > +    DOC_SEP =3D ""
> > +
> >       def __init__(self, pred_list: Sequence[IfPredicate]):
> >           self.pred_list =3D pred_list
> >
> >       def cgen(self) -> str:
> > -        return " && ".join([p.cgen() for p in self.pred_list])
> > +        sep =3D " " + self.C_SEP + " "
> > +        gen =3D sep.join([p.cgen() for p in self.pred_list])
> > +        if len(self.pred_list) =3D=3D 1:
> > +            return gen
> > +        return "(%s)" % gen
> >
> >       def docgen(self) -> str:
> > -        return " and ".join([p.docgen() for p in self.pred_list])
> > +        sep =3D " " + self.DOC_SEP + " "
> > +        gen =3D sep.join([p.docgen() for p in self.pred_list])
> > +        if len(self.pred_list) =3D=3D 1:
> > +            return gen
> > +        return "(%s)" % gen
> >
> >       def __bool__(self) -> bool:
> >           return bool(self.pred_list)
> >
> >       def __repr__(self) -> str:
> > -        return f"IfAll({self.pred_list})"
> > +        ty =3D type(self)
> > +        return f"{ty.__qualname__}({self.pred_list})"
> >
> >       def __eq__(self, other: object) -> bool:
> > -        if not isinstance(other, IfAll):
> > +        if not isinstance(other, type(self)):
> >               return False
> >           return self.pred_list =3D=3D other.pred_list
> > +
> > +
> > +class IfAll(IfPredicateList):
> > +    C_SEP =3D "&&"
> > +    DOC_SEP =3D "and"
> > +
> > +
> > +class IfAny(IfPredicateList):
> > +    C_SEP =3D "||"
> > +    DOC_SEP =3D "or"
> >
>
> I do like the way these get combined. Is there a reason it's not
> squashed into the earlier commit?
>
>
No, just the sake of doing things iteratively.

(Qualms about not having a visitor or a callback or whatever you want to
> call it remain, but I'll stop remarking on that for the rest of this
> series.)
>
>
thanks :)

Tested-by: John Snow <jsnow@redhat.com>
>
>

--000000000000494da705c284c29e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 13, 2021 at 3:26 AM Joh=
n Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 4/29/21 9:40 AM, <a href=3D"mailto:marcandre.lureau@redhat.com" ta=
rget=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Refactor IfAll class, to introduce a base class IfPredicateList and ad=
d<br>
&gt; IfAny for the &#39;any&#39; conditions.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0scripts/qapi/common.py | 32 +++++++++++++++++++++++++++---=
--<br>
&gt;=C2=A0 =C2=A01 file changed, 27 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py<br>
&gt; index 59a7ee2f32..102d347348 100644<br>
&gt; --- a/scripts/qapi/common.py<br>
&gt; +++ b/scripts/qapi/common.py<br>
&gt; @@ -224,23 +224,45 @@ def __eq__(self, other: object) -&gt; bool:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return self.option =3D=3D othe=
r.option<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -class IfAll(IfPredicate):<br>
&gt; +class IfPredicateList(IfPredicate):<br>
&gt; +=C2=A0 =C2=A0 C_SEP =3D &quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 DOC_SEP =3D &quot;&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def __init__(self, pred_list: Sequence[IfPre=
dicate]):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.pred_list =3D pred_list<b=
r>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def cgen(self) -&gt; str:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot; &amp;&amp; &quot;.join([p.c=
gen() for p in self.pred_list])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sep =3D &quot; &quot; + self.C_SEP + &quo=
t; &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen =3D sep.join([p.cgen() for p in self.=
pred_list])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(self.pred_list) =3D=3D 1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gen<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;(%s)&quot; % gen<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def docgen(self) -&gt; str:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot; and &quot;.join([p.docgen()=
 for p in self.pred_list])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sep =3D &quot; &quot; + self.DOC_SEP + &q=
uot; &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen =3D sep.join([p.docgen() for p in sel=
f.pred_list])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(self.pred_list) =3D=3D 1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gen<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;(%s)&quot; % gen<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def __bool__(self) -&gt; bool:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return bool(self.pred_list)<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def __repr__(self) -&gt; str:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return f&quot;IfAll({self.pred_list})&quo=
t;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ty =3D type(self)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return f&quot;{ty.__qualname__}({self.pre=
d_list})&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def __eq__(self, other: object) -&gt; bool:<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(other, IfAll):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(other, type(self)):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return self.pred_list =3D=3D o=
ther.pred_list<br>
&gt; +<br>
&gt; +<br>
&gt; +class IfAll(IfPredicateList):<br>
&gt; +=C2=A0 =C2=A0 C_SEP =3D &quot;&amp;&amp;&quot;<br>
&gt; +=C2=A0 =C2=A0 DOC_SEP =3D &quot;and&quot;<br>
&gt; +<br>
&gt; +<br>
&gt; +class IfAny(IfPredicateList):<br>
&gt; +=C2=A0 =C2=A0 C_SEP =3D &quot;||&quot;<br>
&gt; +=C2=A0 =C2=A0 DOC_SEP =3D &quot;or&quot;<br>
&gt; <br>
<br>
I do like the way these get combined. Is there a reason it&#39;s not <br>
squashed into the earlier commit?<br>
<br></blockquote><div><br></div><div>No, just the sake of doing things iter=
atively.</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
(Qualms about not having a visitor or a callback or whatever you want to <b=
r>
call it remain, but I&#39;ll stop remarking on that for the rest of this <b=
r>
series.)<br>
<br></blockquote><div><br></div><div>thanks :)</div><div> <br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
Tested-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_bla=
nk">jsnow@redhat.com</a>&gt;<br>
<br>
</blockquote></div></div>

--000000000000494da705c284c29e--


