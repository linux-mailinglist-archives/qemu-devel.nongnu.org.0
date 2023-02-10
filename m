Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CD16921EB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 16:20:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVCQ-0008Fp-KS; Fri, 10 Feb 2023 10:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQVCO-0008Dz-Nu
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:20:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQVCM-0002IW-Mv
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:20:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676042425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tWOvcjEksGBWEdwEb1nyVmvmtrrbhYgOi66L8XZ63x0=;
 b=h8G850T5OOzoC+fF5ETsq8CV/w+LJDweeYzFV5ycg7PP5hTMp6la7kR/X1d0M/D1EN6iJP
 pI+Wy5kCk7JxsOZ5JtONdnqIWpQrNx3lAI6RGBtmkUH0kz13ZBsg6Dsmp4CMS8Mhw+Hvuw
 f/H0zQZAekKq4pXmOmDaDTD4sE0LBHA=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-59-49hHnyTTNxOHLUWHao2B7w-1; Fri, 10 Feb 2023 10:20:24 -0500
X-MC-Unique: 49hHnyTTNxOHLUWHao2B7w-1
Received: by mail-pl1-f200.google.com with SMTP id
 z8-20020a170902834800b001990ad8de5bso3182439pln.10
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 07:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tWOvcjEksGBWEdwEb1nyVmvmtrrbhYgOi66L8XZ63x0=;
 b=LSjtH7TdJOjQf35rflG3GaOGh6B1dpRyMbbr9JfxMd/Oukpnwsnj0P8lGlLHyVHy/B
 Mr1XhOSXRi54Xe6penTK+dKMga54CE0g3OaRaY+Iiri0SS6nBDr8Hp97UlzXq8us3nNP
 jp502iQquZ9THYw/SQZCR0Sx82T2zXzPMEruWU+729fP+DNLuCZSNv0e3QhbtL4ZrdS1
 iU21e/2ZUVXGrCxHms6isChQKzZZQdggQ9+XdOO1iDiqdF2+nKSMYlQg7I/tGXO0feMs
 9sbOLcankbNIsTDKankGNZEknKVSv/FY2tHVJD5/kZkHdZnofU6x944GFd3aTxUIBUej
 P9uQ==
X-Gm-Message-State: AO0yUKW+mnuXOKbygYw5ueoXwq5RF6ZgjOd4N2Boq6u1cfxl3VDBkeRg
 MPcF9pUvXK5gFadpSdJIoEeUlusXSiuMR6207buwEwMz0qIgSlyXtaROD48iUY90yuG/2/JI1lg
 3I5VmWQU1iHpWGhN6iHdA/BCYEezVvE0=
X-Received: by 2002:a63:3d4e:0:b0:4fb:58bf:d269 with SMTP id
 k75-20020a633d4e000000b004fb58bfd269mr689346pga.22.1676042423028; 
 Fri, 10 Feb 2023 07:20:23 -0800 (PST)
X-Google-Smtp-Source: AK7set+LXrktKB5JhSgF7vKWQ4/DfyupfsTvZW1zveHJOAxdomg8YjB2lKR8kBgQxRIhkLCqb8GRetQjVCs694rks/Q=
X-Received: by 2002:a63:3d4e:0:b0:4fb:58bf:d269 with SMTP id
 k75-20020a633d4e000000b004fb58bfd269mr689338pga.22.1676042422638; Fri, 10 Feb
 2023 07:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20230209184758.1017863-1-jsnow@redhat.com>
 <20230209184758.1017863-4-jsnow@redhat.com>
 <87pmahr983.fsf@pond.sub.org>
In-Reply-To: <87pmahr983.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Fri, 10 Feb 2023 10:20:11 -0500
Message-ID: <CAFn=p-bSS_0A2cpWce01Oy7c4gGtDYzMYjSpc4azniYPcPN7CQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] qapi/expr: Split check_expr out from check_exprs
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="0000000000003b01fe05f45a096a"
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

--0000000000003b01fe05f45a096a
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 10, 2023, 7:33 AM Markus Armbruster <armbru@redhat.com> wrote:

> Another observation...
>
> John Snow <jsnow@redhat.com> writes:
>
> > Primarily, this reduces a nesting level of a particularly long
> > block. It's mostly code movement, but a new docstring is created.
> >
> > It also has the effect of creating a fairly convenient "catch point" in
> > check_exprs for exception handling without making the nesting level even
> > worse.
>

What I mean is: If you want to handle exceptions without this patch, a
try/catch will add another nesting level to this hundred line function.

By splitting it, you can use the outer looping function as a choke point to
write the handler.

I had a branch once where I use this fact to stop routing "info" into 99%
of expr.py. I did this to use an off the shelf JSON validator while
preserving your custom source info error reporting that identifies the
precise location of the error.

I took that out for now, in the interest of staying focused on the minimum
viable to achieve strict typing, but found this change to be helpful anyway.

Admit that it does muddy the waters with git blame, but... my calculus on
that might just be different from yours.

(To me, git blame is almost always something I have to trace back through
several refactors anyway, so I see the battle as lost before I started.)

I can omit this patch for now if you'd like, it isn't crucial. I just think
I'd still "kinda like to have it". I'll leave it up to you.

>
> > Signed-off-by: John Snow <jsnow@redhat.com>
> >
> > ---
> >
> > This patch was originally written as part of my effort to factor out
> > QAPISourceInfo from this file by having expr.py raise a simple
> > exception, then catch and wrap it at the higher level.
> >
> > This series doesn't do that anymore, but reducing the nesting level
> > still seemed subjectively nice. It's not crucial.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>

Whoops, script doesn't understand when I add notes.

> ---
> >  scripts/qapi/expr.py | 179 +++++++++++++++++++++++--------------------
> >  1 file changed, 95 insertions(+), 84 deletions(-)
> >
> > diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> > index 5a1782b57ea..b56353bdf84 100644
> > --- a/scripts/qapi/expr.py
> > +++ b/scripts/qapi/expr.py
> > @@ -595,6 +595,99 @@ def check_event(expr: _JSONObject, info:
> QAPISourceInfo) -> None:
> >      check_type(args, info, "'data'", allow_dict=not boxed)
> >
> >
> > +def check_expr(expr_elem: _JSONObject) -> None:
>
> [...]
>
> >  def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
> >      """
> >      Validate and normalize a list of parsed QAPI schema expressions.
>
> The typing is kind of wrong.
>
> The list is the value of QAPISchemaParser.exprs, which is (losely) typed
> as List[Dict[str, object]].  It is actually a dict mapping
>
>    'expr' -> _ExprValue
>    'info' -> QAPISourceInfo
>    'doc'  -> Optional[QAPIDoc]
>
> Thet's not what _JSONObject is!  Its doc string describes it as
> "Deserialized JSON objects as returned by the parser", i.e. the same as
> _ExprValue.
>
> Works only because _JSONObject is a dict mapping arbitrary keys to
> _JSONObject, str or bool.
>
> This patch spreads the flawed typing to the new function.
>
> Gets healed later in the series.
>

Oops...!

Symptom of patch reordering that happened some time ago, I think. Mea
culpa. Will fix.

(Possibly with some ugly intermediate type that goes away by end of series.)



> [...]
>
>

--0000000000003b01fe05f45a096a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Feb 10, 2023, 7:33 AM Markus Armbruster &lt;<a=
 href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Another observation...<br>
<br>
John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank" rel=3D"=
noreferrer">jsnow@redhat.com</a>&gt; writes:<br>
<br>
&gt; Primarily, this reduces a nesting level of a particularly long<br>
&gt; block. It&#39;s mostly code movement, but a new docstring is created.<=
br>
&gt;<br>
&gt; It also has the effect of creating a fairly convenient &quot;catch poi=
nt&quot; in<br>
&gt; check_exprs for exception handling without making the nesting level ev=
en<br>
&gt; worse.<br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">What I mean is: If you want to handle exceptions without this pa=
tch, a try/catch will add another nesting level to this hundred line functi=
on.</div><div dir=3D"auto"><br></div><div dir=3D"auto">By splitting it, you=
 can use the outer looping function as a choke point to write the handler.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">I had a branch once wher=
e I use this fact to stop routing &quot;info&quot; into 99% of expr.py. I d=
id this to use an off the shelf JSON validator while preserving your custom=
 source info error reporting that identifies the precise location of the er=
ror.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I took that out for=
 now, in the interest of staying focused on the minimum viable to achieve s=
trict typing, but found this change to be helpful anyway.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Admit that it does muddy the waters with =
git blame, but... my calculus on that might just be different from yours.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">(To me, git blame is almo=
st always something I have to trace back through several refactors anyway, =
so I see the battle as lost before I started.)</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">I can omit this patch for now if you&#39;d like, it =
isn&#39;t crucial. I just think I&#39;d still &quot;kinda like to have it&q=
uot;. I&#39;ll leave it up to you.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; This patch was originally written as part of my effort to factor out<b=
r>
&gt; QAPISourceInfo from this file by having expr.py raise a simple<br>
&gt; exception, then catch and wrap it at the higher level.<br>
&gt;<br>
&gt; This series doesn&#39;t do that anymore, but reducing the nesting leve=
l<br>
&gt; still seemed subjectively nice. It&#39;s not crucial.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Whoops, script does=
n&#39;t understand when I add notes.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/expr.py | 179 +++++++++++++++++++++++--------------=
------<br>
&gt;=C2=A0 1 file changed, 95 insertions(+), 84 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py<br>
&gt; index 5a1782b57ea..b56353bdf84 100644<br>
&gt; --- a/scripts/qapi/expr.py<br>
&gt; +++ b/scripts/qapi/expr.py<br>
&gt; @@ -595,6 +595,99 @@ def check_event(expr: _JSONObject, info: QAPISour=
ceInfo) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 check_type(args, info, &quot;&#39;data&#39;&quot;,=
 allow_dict=3Dnot boxed)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; +def check_expr(expr_elem: _JSONObject) -&gt; None:<br>
<br>
[...]<br>
<br>
&gt;=C2=A0 def check_exprs(exprs: List[_JSONObject]) -&gt; List[_JSONObject=
]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Validate and normalize a list of parsed QAPI schem=
a expressions.<br>
<br>
The typing is kind of wrong.<br>
<br>
The list is the value of QAPISchemaParser.exprs, which is (losely) typed<br=
>
as List[Dict[str, object]].=C2=A0 It is actually a dict mapping<br>
<br>
=C2=A0 =C2=A0&#39;expr&#39; -&gt; _ExprValue<br>
=C2=A0 =C2=A0&#39;info&#39; -&gt; QAPISourceInfo<br>
=C2=A0 =C2=A0&#39;doc&#39;=C2=A0 -&gt; Optional[QAPIDoc]<br>
<br>
Thet&#39;s not what _JSONObject is!=C2=A0 Its doc string describes it as<br=
>
&quot;Deserialized JSON objects as returned by the parser&quot;, i.e. the s=
ame as<br>
_ExprValue.<br>
<br>
Works only because _JSONObject is a dict mapping arbitrary keys to<br>
_JSONObject, str or bool.<br>
<br>
This patch spreads the flawed typing to the new function.<br>
<br>
Gets healed later in the series.<br></blockquote></div></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Oops...!</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Symptom of patch reordering that happened some time ago, I=
 think. Mea culpa. Will fix.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">(Possibly with some ugly intermediate type that goes away by end of se=
ries.)</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
[...]<br>
<br>
</blockquote></div></div></div>

--0000000000003b01fe05f45a096a--


