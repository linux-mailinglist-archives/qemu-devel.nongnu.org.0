Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97527403B39
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 16:10:42 +0200 (CEST)
Received: from localhost ([::1]:57730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNyHf-0005Je-Ij
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 10:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mNyER-0003Uv-K0
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:07:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mNyEM-0004jd-GA
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631110032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6mgtNnUM2/eMgGifbaRAXPUyQGb7uD/wx7orKImzjfA=;
 b=incAmaUfBoQSuAPDyAPbuLVnJd1qtOqSlid/uBzZa5IZbNIW+dQHVsiZDDIkECo0id7zCl
 sQRSx0GddovLvz+Aj0RdlLP5xda08VotBzkCR4x/e2bGP5f+WlJ87eZH8u8NoAWjYtMpfm
 47OGCliB+rGfh12PHEM36mWevCZ43xc=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-KTBqUrC8M9SX_XuQh2U6EA-1; Wed, 08 Sep 2021 10:07:11 -0400
X-MC-Unique: KTBqUrC8M9SX_XuQh2U6EA-1
Received: by mail-pg1-f198.google.com with SMTP id
 u7-20020a632347000000b0026722cd9defso1743160pgm.7
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 07:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6mgtNnUM2/eMgGifbaRAXPUyQGb7uD/wx7orKImzjfA=;
 b=64DQy+sfA+zTpl3NT+5gdPmS6F91TpLTpeY7+zYFfYh7ioQTunQRdDgcH5itqFJrF3
 /oQ4uHjXMXnzAdD/cqdzfb/VOvtzJLB+fzEGKztqixC/LTxVmZzV8nukuhXULzE95ZAn
 mYaNEMZLzlxXuQhsux4Ru/aGO1/I+MTIFQqDh+yzYCgiik4BGsiWkM6IpKXh0HwHGW/k
 YWkg1c0GV+2zg3u/hf4mjStWfIHTnfax5ZB5GNF9B5Rfs6t5zmfPrJDgmtDffBm5iNhs
 bi69yyzP80VIIjooIeSuIQ7Sl7Y6z2WY85VdM6kDjT+nut5GipDQPvjZBS4dMPFpLvud
 HMfw==
X-Gm-Message-State: AOAM5316Df+zoCZmEaYMkGrrjQrTwdtEb5Y8aCZp0AcV4AAL2T12PiCj
 e66PORLE0PI3KcxGe2HPxHqcpnwxr3odBo0Dh17wn7eUp0tN9W4firSbKRvpTqsmtgQxqe13KwF
 GcYxGsyKWZGeICvj9+WWHDFkdI+fLtOM=
X-Received: by 2002:a63:30d:: with SMTP id 13mr3908128pgd.289.1631110030084;
 Wed, 08 Sep 2021 07:07:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJws+ptsDa+zk0j92zkj0aPjvwdwam9kkoVQUmAT7i24e1mOa9IxNF3tcMu+sI2nPVHNejGdgsD5eglENL2Hers=
X-Received: by 2002:a63:30d:: with SMTP id 13mr3908103pgd.289.1631110029797;
 Wed, 08 Sep 2021 07:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-15-marcandre.lureau@redhat.com>
 <87h7evw8kk.fsf@dusky.pond.sub.org>
In-Reply-To: <87h7evw8kk.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 8 Sep 2021 18:06:59 +0400
Message-ID: <CAMxuvax4=Se0+TsroZy7oAJik2K_=SfKxtPN80Z8evj=qGmHcw@mail.gmail.com>
Subject: Re: [RFC v3 14/32] scripts/qapi: add QAPISchemaIfCond.rsgen()
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ea807705cb7c6544"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, "P. Berrange,
 Daniel" <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ea807705cb7c6544
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 8, 2021 at 4:33 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Generate Rust #[cfg(...)] guards from QAPI 'if' conditions.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  scripts/qapi/common.py | 16 ++++++++++++++++
> >  scripts/qapi/schema.py |  4 ++++
> >  2 files changed, 20 insertions(+)
> >
> > diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> > index 5f8f76e5b2..6d22c66391 100644
> > --- a/scripts/qapi/common.py
> > +++ b/scripts/qapi/common.py
> > @@ -201,6 +201,22 @@ def guardend(name: str) -> str:
> >                   name=3Dc_fname(name).upper())
> >
> >
> > +def rsgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
> > +
> > +    def cfg(ifcond: Union[str, Dict[str, Any]]):
> > +        if isinstance(ifcond, str):
> > +            return ifcond
> > +        if isinstance(ifcond, list):
> > +            return ', '.join([cfg(c) for c in ifcond])
> > +        oper, operands =3D next(iter(ifcond.items()))
> > +        operands =3D cfg(operands)
> > +        return f'{oper}({operands})'
> > +
> > +    if not ifcond:
> > +        return ''
> > +    return '#[cfg(%s)]' % cfg(ifcond)
> > +
> > +
> >  def gen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]],
> >                 cond_fmt: str, not_fmt: str,
> >                 all_operator: str, any_operator: str) -> str:
>
> Can we generalize gen_ifcond() to work for rsgen_ifcond(), too?
>
>
Not elegantly, I am afraid. The logic of gen_ifcond() is based around the
distinct prefix vs infix handling. In contrast, Rust cfg are all infix. As
you can see from the code above, it is quite straightforward. Reusing
gen_ifcond() would make it quite convoluted.


> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index 6455a8f425..c61f35e13f 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -26,6 +26,7 @@
> >      docgen_ifcond,
> >      gen_endif,
> >      gen_if,
> > +    rsgen_ifcond,
> >  )
> >  from .error import QAPIError, QAPISemError, QAPISourceError
> >  from .expr import check_exprs
> > @@ -48,6 +49,9 @@ def gen_endif(self):
> >      def docgen(self):
> >          return docgen_ifcond(self.ifcond)
> >
> > +    def rsgen(self):
> > +        return rsgen_ifcond(self.ifcond)
> > +
> >      def is_present(self):
> >          return bool(self.ifcond)
>
>

--000000000000ea807705cb7c6544
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 8, 2021 at 4:33 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">ar=
mbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_bl=
ank">marcandre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Generate Rust #[cfg(...)] guards from QAPI &#39;if&#39; conditions.<br=
>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/common.py | 16 ++++++++++++++++<br>
&gt;=C2=A0 scripts/qapi/schema.py |=C2=A0 4 ++++<br>
&gt;=C2=A0 2 files changed, 20 insertions(+)<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py<br>
&gt; index 5f8f76e5b2..6d22c66391 100644<br>
&gt; --- a/scripts/qapi/common.py<br>
&gt; +++ b/scripts/qapi/common.py<br>
&gt; @@ -201,6 +201,22 @@ def guardend(name: str) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0na=
me=3Dc_fname(name).upper())<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; +def rsgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -&gt; str:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def cfg(ifcond: Union[str, Dict[str, Any]]):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(ifcond, str):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ifcond<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(ifcond, list):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;, &#39;.join([c=
fg(c) for c in ifcond])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oper, operands =3D next(iter(ifcond.items=
()))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 operands =3D cfg(operands)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return f&#39;{oper}({operands})&#39;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if not ifcond:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 return &#39;#[cfg(%s)]&#39; % cfg(ifcond)<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 def gen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cond_fmt:=
 str, not_fmt: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all_opera=
tor: str, any_operator: str) -&gt; str:<br>
<br>
Can we generalize gen_ifcond() to work for rsgen_ifcond(), too?<br>
<br></blockquote><div><br></div><div>Not elegantly, I am afraid. The logic =
of gen_ifcond() is based around the distinct prefix vs infix handling. In c=
ontrast, Rust cfg are all infix. As you can see from the code above, it is =
quite straightforward. Reusing gen_ifcond() would make it quite convoluted.=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
&gt; diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
&gt; index 6455a8f425..c61f35e13f 100644<br>
&gt; --- a/scripts/qapi/schema.py<br>
&gt; +++ b/scripts/qapi/schema.py<br>
&gt; @@ -26,6 +26,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 docgen_ifcond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gen_endif,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gen_if,<br>
&gt; +=C2=A0 =C2=A0 rsgen_ifcond,<br>
&gt;=C2=A0 )<br>
&gt;=C2=A0 from .error import QAPIError, QAPISemError, QAPISourceError<br>
&gt;=C2=A0 from .expr import check_exprs<br>
&gt; @@ -48,6 +49,9 @@ def gen_endif(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def docgen(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return docgen_ifcond(self.ifcond)<br=
>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 def rsgen(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return rsgen_ifcond(self.ifcond)<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def is_present(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return bool(self.ifcond)<br>
<br>
</blockquote></div></div>

--000000000000ea807705cb7c6544--


