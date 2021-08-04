Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0389E3DFCB9
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:24:03 +0200 (CEST)
Received: from localhost ([::1]:54504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCC2-0004AB-0Z
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCAx-0003Ce-Cp
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:22:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCAv-0002i8-B4
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628065372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KtG85YdpisW+XWzgU4HkpH48rgHGmbZYGI0ht1S/rjM=;
 b=dTjb+rAR+MeGu/8REzIAhAbGfC5ZZqjT+VzkFqSO7hEX4EHbPQbH15kwyjnu7a7esvZgMX
 ViKpChv5bmLlSsnlht6WTRj3bgE275y2Werhpeu6J1Wqsf/1eaOMaeVHvSEbv4QCSUkE+E
 MU+IVZ/JkHsquFMyReg0wqqnobqXgjc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-uEzQUgCBPfiqaj9Ujw0yZQ-1; Wed, 04 Aug 2021 04:22:50 -0400
X-MC-Unique: uEzQUgCBPfiqaj9Ujw0yZQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 s8-20020a17090a0748b0290177ecd83711so1840952pje.2
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 01:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KtG85YdpisW+XWzgU4HkpH48rgHGmbZYGI0ht1S/rjM=;
 b=h8iYPmIoE1OL3df8840nY3+0ypGUSOlLncL/2J2vLrL1tkfEDKAe5HjwaWiybhB6Nl
 agbHJ1Xnhr5Lwgw94tqWCK1lZxKiDFpcEXIkaTwk6E7gxVS63BKSH6amh2jhrBGcXbbu
 FMAkbp14DqbZKvaGdOG+lEpLNsuzKqP4jUkYS8xl74k1un9zSLkDViqVBP9voJQbcO8W
 cKjkvLKL86SsDyJkLfPxuVSkh0brGrPn5y1LtHHEVIPsb3wcpzJUgiFU6j+zhUhyr/qZ
 Yoq2sHazLIhjIKaP/QMwT+UKBUENkm9bjRdtPw1P7xUC3y1alX6E87FceIHngGkWVY0X
 1dMA==
X-Gm-Message-State: AOAM531d/upoVwbxno7r4dTAlD3i43AYd+gwvB7bpmIo7308fCKrXsss
 vDgoDNciPJ9WxOOftZKnVDIvadFpbd7Z6J3/iUTtsNFl53TJJ7i+YdO4vTJdahPtM0Bju77XgSE
 0+vQKJaP8BLQkASOlgFPObHWuye04gAw=
X-Received: by 2002:a05:6a00:1508:b029:332:3aab:d842 with SMTP id
 q8-20020a056a001508b02903323aabd842mr26179255pfu.59.1628065369515; 
 Wed, 04 Aug 2021 01:22:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkF4cxlxUt3s2yFnZ9HppgYe8lqL2qckQroxSKb/Ik9jMbc+m/wM7SnsHYCsut79jQzGcOSdNJnaJMX+PCcb0=
X-Received: by 2002:a05:6a00:1508:b029:332:3aab:d842 with SMTP id
 q8-20020a056a001508b02903323aabd842mr26179239pfu.59.1628065369286; Wed, 04
 Aug 2021 01:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-12-marcandre.lureau@redhat.com>
 <87bl6er6q8.fsf@dusky.pond.sub.org>
In-Reply-To: <87bl6er6q8.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 4 Aug 2021 12:22:38 +0400
Message-ID: <CAMxuvayzE=TLtzw2zhyugZ-fxnE_rORMzjOAy6uiXvQeQRsp+A@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] qapi: make 'if' condition strings simple
 identifiers
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000001ffe005c8b782b0"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000001ffe005c8b782b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 3, 2021 at 5:35 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Change the 'if' condition strings to be C-agnostic and be simple
> > identifiers.
>
> This is less general, and that's okay, we're doing it for a purpose.
> But the commit message should mention / explain all this.
>

ok


> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Tested-by: John Snow <jsnow@redhat.com>
> > ---
>
> [...]
>
> > diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> > index f8718e201b..0c718e43c9 100644
> > --- a/scripts/qapi/common.py
> > +++ b/scripts/qapi/common.py
> > @@ -218,7 +218,7 @@ def cgen_ifcond(ifcond: Union[str, Dict[str, Any]])
> -> str:
> >      if not ifcond:
> >          return ''
> >      if isinstance(ifcond, str):
> > -        return ifcond
> > +        return 'defined(' + ifcond + ')'
> >
> >      oper, operands =3D next(iter(ifcond.items()))
> >      if oper =3D=3D 'not':
> > diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> > index d2bd52c49f..d355cbc8c1 100644
> > --- a/scripts/qapi/expr.py
> > +++ b/scripts/qapi/expr.py
> > @@ -281,10 +281,10 @@ def check_if(expr: _JSONObject, info:
> QAPISourceInfo, source: str) -> None:
> >
> >      def _check_if(cond: Union[str, object]) -> None:
> >          if isinstance(cond, str):
> > -            if not cond.strip():
> > +            if not cond.isidentifier():
>
> This accepts *Python* identifiers:
>
>     $ python
>     Python 3.9.6 (default, Jul 16 2021, 00:00:00)
>     [...]
>     >>> 'Andr=C3=A9'.isidentifier()
>     True
>
> These may or may not work for the languages we generate.  Wouldn't
> restricting identifiers to something like /[A-Z][A-Z0-9_]*/ make more
> sense?
>
>
yes, works for me


> >                  raise QAPISemError(
> >                      info,
> > -                    "'if' condition '%s' of %s makes no sense"
> > +                    "'if' condition '%s' of %s is not a valid
> identifier"
> >                      % (cond, source))
> >              return
> >
> > diff --git a/tests/qapi-schema/alternate-branch-if-invalid.err
> b/tests/qapi-schema/alternate-branch-if-invalid.err
> > index d384929c51..03bad877a3 100644
> > --- a/tests/qapi-schema/alternate-branch-if-invalid.err
> > +++ b/tests/qapi-schema/alternate-branch-if-invalid.err
> > @@ -1,2 +1,2 @@
> >  alternate-branch-if-invalid.json: In alternate 'Alt':
> > -alternate-branch-if-invalid.json:2: 'if' condition ' ' of 'data' membe=
r
> 'branch' makes no sense
> > +alternate-branch-if-invalid.json:2: 'if' condition ' ' of 'data' membe=
r
> 'branch' is not a valid identifier
>
> [...]
>
>

--00000000000001ffe005c8b782b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"lt=
r"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Aug 3, 2021 at 5:35 PM Markus Armbruster &lt;<a href=3D"mail=
to:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><a href=3D"mailto:=
marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com<=
/a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Change the &#39;if&#39; condition strings to be C-agnostic and be simp=
le<br>
&gt; identifiers.<br>
<br>
This is less general, and that&#39;s okay, we&#39;re doing it for a purpose=
.<br>
But the commit message should mention / explain all this.<br></blockquote><=
div><br></div><div>ok</div><div> <br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com=
" target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
&gt; Tested-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D=
"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
<br>
[...]<br>
<br>
&gt; diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py<br>
&gt; index f8718e201b..0c718e43c9 100644<br>
&gt; --- a/scripts/qapi/common.py<br>
&gt; +++ b/scripts/qapi/common.py<br>
&gt; @@ -218,7 +218,7 @@ def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]=
) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if not ifcond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if isinstance(ifcond, str):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ifcond<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;defined(&#39; + ifcond + &#39=
;)&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 oper, operands =3D next(iter(ifcond.items()))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if oper =3D=3D &#39;not&#39;:<br>
&gt; diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py<br>
&gt; index d2bd52c49f..d355cbc8c1 100644<br>
&gt; --- a/scripts/qapi/expr.py<br>
&gt; +++ b/scripts/qapi/expr.py<br>
&gt; @@ -281,10 +281,10 @@ def check_if(expr: _JSONObject, info: QAPISource=
Info, source: str) -&gt; None:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _check_if(cond: Union[str, object]) -&gt; None=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(cond, str):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cond.strip():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cond.isidentifier():=
<br>
<br>
This accepts *Python* identifiers:<br>
<br>
=C2=A0 =C2=A0 $ python<br>
=C2=A0 =C2=A0 Python 3.9.6 (default, Jul 16 2021, 00:00:00)<br>
=C2=A0 =C2=A0 [...]<br>
=C2=A0 =C2=A0 &gt;&gt;&gt; &#39;Andr=C3=A9&#39;.isidentifier()<br>
=C2=A0 =C2=A0 True<br>
<br>
These may or may not work for the languages we generate.=C2=A0 Wouldn&#39;t=
<br>
restricting identifiers to something like /[A-Z][A-Z0-9_]*/ make more<br>
sense?<br>
<br></blockquote><div><br></div><div>yes, works for me<br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QA=
PISemError(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 info,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;&#39;if&#39; condition &#39;%s&#39; of %s makes no sense&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;&#39;if&#39; condition &#39;%s&#39; of %s is not a valid identifier&=
quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 % (cond, source))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;=C2=A0 <br>
&gt; diff --git a/tests/qapi-schema/alternate-branch-if-invalid.err b/tests=
/qapi-schema/alternate-branch-if-invalid.err<br>
&gt; index d384929c51..03bad877a3 100644<br>
&gt; --- a/tests/qapi-schema/alternate-branch-if-invalid.err<br>
&gt; +++ b/tests/qapi-schema/alternate-branch-if-invalid.err<br>
&gt; @@ -1,2 +1,2 @@<br>
&gt;=C2=A0 alternate-branch-if-invalid.json: In alternate &#39;Alt&#39;:<br=
>
&gt; -alternate-branch-if-invalid.json:2: &#39;if&#39; condition &#39; &#39=
; of &#39;data&#39; member &#39;branch&#39; makes no sense<br>
&gt; +alternate-branch-if-invalid.json:2: &#39;if&#39; condition &#39; &#39=
; of &#39;data&#39; member &#39;branch&#39; is not a valid identifier<br>
<br>
[...]<br>
<br>
</blockquote></div></div>
</div>

--00000000000001ffe005c8b782b0--


