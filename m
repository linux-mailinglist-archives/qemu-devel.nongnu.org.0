Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B229696AD1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:09:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyn8-0006Ph-CH; Tue, 14 Feb 2023 12:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pRyn5-0006PW-Ul
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:08:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pRyn3-0000Ql-If
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676394503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cKjfOVCO5OzfS69Y0HGx4xpfxfBohCM/1vQIF2bXRNs=;
 b=PQiMp0QGb5sk/8w8gfmyUV8W5usNht6u/0QUnbZZ0oZAPW8OgsVk+8nZOcujk0jqzyWi1B
 P0DSeShdc1y0nb5t5Q59bZwOG0/PH8+BYgxw8cR3w3fC8G6GK5TwTll+vGJ9AwYxnlMF35
 ymTgHJdX3Ra0slobsmiDTivf5zWqkaE=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-KEtHgsrGOpahR8ZAak4qoA-1; Tue, 14 Feb 2023 12:08:22 -0500
X-MC-Unique: KEtHgsrGOpahR8ZAak4qoA-1
Received: by mail-pf1-f198.google.com with SMTP id
 x2-20020a056a000bc200b005a8ea29c7a6so512022pfu.15
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 09:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cKjfOVCO5OzfS69Y0HGx4xpfxfBohCM/1vQIF2bXRNs=;
 b=lRBiwfmrDy+ux0vWIrJ2+ZPbVeDe5hmBhcNURHfsWIlyzoj6WFaKKczdsVBngC+rj8
 czKXUaYm9GulPlotGD458KdeOfpo4OGeRBUrM/OTwN0snCUJX786mqMdh4Owzg6UxLxq
 P9Cs+NleOLtir2DKEt7FyP8N6a07lIuCK1OE6U7mqdCynpINknve35bcqgK7a1s/oyR/
 QUULGV/yxN2OpMq6X4IFgl6zY0fRSPB/tC4mqpzaaJQG52TcAZRZkLolvK1iOEYwRhBn
 8hGyA3sBo/J6u2GrvEWB9vs1EbblBvGXJsuNCILsWBi+3pcQn9iz5VWfWvhFfxMxeikf
 zAlA==
X-Gm-Message-State: AO0yUKXacY2DqFRkql9YzA3Wx81m9GylyWIiaa4k7wPzUYi+cD61e0Ag
 jSbVKsIZPl2EB8VHa4/ot2NUe7W7d/LHbcwsKtML90tv9rdJ74mZkaZKIJKEMItSSz8JetAe9vl
 rjV6h1VPn1IMB/rb3YFGKKe4ewbAhGVw=
X-Received: by 2002:a17:90a:9f42:b0:234:2592:efbe with SMTP id
 q2-20020a17090a9f4200b002342592efbemr16439pjv.131.1676394500899; 
 Tue, 14 Feb 2023 09:08:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+qWnPLYdbuDukLO1Qstvpc/mgjp5/uh7jk/0GfBqppSnPAFQ2midAgSEJ5UgN06Sav6lzRXWcGxZfbDiXTlWU=
X-Received: by 2002:a17:90a:9f42:b0:234:2592:efbe with SMTP id
 q2-20020a17090a9f4200b002342592efbemr16433pjv.131.1676394500577; Tue, 14 Feb
 2023 09:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20230209184758.1017863-1-jsnow@redhat.com>
 <20230209184758.1017863-5-jsnow@redhat.com>
 <87sffd5xv2.fsf@pond.sub.org>
 <CAFn=p-ZcguU+g2H1BWutxF_i2s6PU-XfDfBsZnpxxuk=RqaxEw@mail.gmail.com>
In-Reply-To: <CAFn=p-ZcguU+g2H1BWutxF_i2s6PU-XfDfBsZnpxxuk=RqaxEw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 14 Feb 2023 12:08:09 -0500
Message-ID: <CAFn=p-aCcrAdzHSejPZNCgoaGVK+KT-nkpTA2qL82mCOVqs69Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] qapi/expr: add typing workaround for AbstractSet
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="000000000000b5f62905f4ac0252"
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

--000000000000b5f62905f4ac0252
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 10, 2023, 11:26 AM John Snow <jsnow@redhat.com> wrote:

>
>
> On Fri, Feb 10, 2023, 10:44 AM Markus Armbruster <armbru@redhat.com>
> wrote:
>
>> John Snow <jsnow@redhat.com> writes:
>>
>> > mypy can only narrow the type of `Mapping[str, ...].keys() & Set[str]`
>> > to `AbstractSet[str]` and not a `Set[str]`. As a result, if the type of
>> > an expression is changed to a Mapping[], mypy is unsure if the .pop() is
>> > safe.
>> >
>> > A forthcoming commit does exactly that, so wrap the expression in a
>> > set() constructor to force the intermediate expression to be resolved as
>> > a mutable type.
>> >
>> > Signed-off-by: John Snow <jsnow@redhat.com>
>> > ---
>> >  scripts/qapi/expr.py | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> > index b56353bdf84..af802367eff 100644
>> > --- a/scripts/qapi/expr.py
>> > +++ b/scripts/qapi/expr.py
>> > @@ -622,8 +622,8 @@ def check_expr(expr_elem: _JSONObject) -> None:
>> >      if 'include' in expr:
>> >          return
>> >
>> > -    metas = expr.keys() & {'enum', 'struct', 'union', 'alternate',
>> > -                           'command', 'event'}
>> > +    metas = set(expr.keys() & {
>> > +        'enum', 'struct', 'union', 'alternate', 'command', 'event'})
>> >      if len(metas) != 1:
>> >          raise QAPISemError(
>> >              info,
>>                    "expression must have exactly one key"
>>                    " 'enum', 'struct', 'union', 'alternate',"
>>                    " 'command', 'event'")
>>            meta = metas.pop()
>>
>> I'm mildly surprised that the result of operator & is considered
>> immutable.  How could it *not* be a freshly created set?  Oh well.
>>
>
> I think because it's up to the LHS type to return the result.
>
> Wait, maybe I can just switch the operand order, lol.
>

Good news, I can just switch the operand order. Looks cleaner.


>
>> Passing a set to set() is a no-op, so
>>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>
>> Regardless, the code feels a bit too clever to me.  It actually did
>> already when I wrote it, but I the less clever ways I could think of
>> were also much more verbose.
>>
>> The code checks that exactly one of a set of keys is present, and which
>> one it is.  Any ideas?
>>
>
> Yeah, it feels too clever but I'm not sure I know something more elegant,
> really. I'll consider it while I address your feedback and prepare a respin.
>

Still don't have brighter ideas. A problem for another time.

--000000000000b5f62905f4ac0252
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Feb 10, 2023, 11:26 AM John Snow &lt;<a href=
=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"auto"><div><br><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 10, 2023, 10:44 =
AM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_bl=
ank" rel=3D"noreferrer">armbru@redhat.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">jsnow@redhat.com</a>&gt; write=
s:<br>
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
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">jsnow@redhat.com</a>&gt;<br>
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
e operand order, lol.</div></div></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Good news, I can just switch the operand order=
. Looks cleaner.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<br>
Passing a set to set() is a no-op, so<br>
<br>
Reviewed-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
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
your feedback and prepare a respin.</div></div></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Still don&#39;t have brighter id=
eas. A problem for another time.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"auto"><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
</blockquote></div></div></div>
</blockquote></div></div></div>

--000000000000b5f62905f4ac0252--


