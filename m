Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14C8696AC1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:05:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyjZ-0001Uc-Ie; Tue, 14 Feb 2023 12:04:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pRyjU-0001Ts-Tz
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:04:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pRyjS-0007oa-Le
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676394281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s7+hP3m5xGcayhhxVi6BRmxgl6hMRxiObGllkSWp4DU=;
 b=EmUBE9+LIeGF9HFFculpAzR3UyTuJW6ixpgxroE9kKFfqTDtuL7xlF0MDCCekRdx1X62IF
 9noFtQgbT2d9WsCAq+5Nnwn38G02Y56mwfE+H5viQpL+htgcGhw5PSYC4xsjYxc65lE7uU
 3P9ZmOQ9iTwiOehVoRktlHz1i7CdgA4=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-478-Iwt2uVmbOCCGzZApFk3KhA-1; Tue, 14 Feb 2023 12:04:38 -0500
X-MC-Unique: Iwt2uVmbOCCGzZApFk3KhA-1
Received: by mail-pj1-f70.google.com with SMTP id
 rm5-20020a17090b3ec500b0023406b78560so2767810pjb.8
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 09:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s7+hP3m5xGcayhhxVi6BRmxgl6hMRxiObGllkSWp4DU=;
 b=jlwfYKmuXla4q3pW84U6LNa+psapxxj3vJ07Fs4uB21S6y23KRTEtzLhyFASfsntZs
 Wvp02Gt5rNGSo3wz1LB3EhlSIf4D+S6dRilX5rYcj1Mptksp/uTyFFfzQ7BBWv2MRqNO
 pvz6ypMHl0na5Zc9wfl8ySK7+JgNMi3kyzc8ZLe1kLie6JDVIY6eInDMEtxDQ7zzymxZ
 9nTiRAFZ+esylQaI++Y5NmZBcSBKurFGXI3CMzCSldc6A/kS2QQn488AvkKQgM/EjX4v
 j0AKBr2YyUeh4ikfJ+Lrx6UwqaCuI+PV4yTTPgbo/AgIsxr5Ce5CRhGQv4cxEPsdtmxs
 Nlmw==
X-Gm-Message-State: AO0yUKVM+H6ZvI+hYf7cIP9UfSkvWHJr8teLDOHnrRwHJOhku+GysBMg
 oUN23+ap/xrPyQeOcTKG/XbNLY7bjol4EsYrIcRl1KBNOc8FWhhjVg2BBu0xEnVcb1RNbN6QaBc
 3Jwsm8iCXsXfCFL640HsWsC5BjCo/t383ye4g
X-Received: by 2002:a17:90a:9f42:b0:234:2592:efbe with SMTP id
 q2-20020a17090a9f4200b002342592efbemr14271pjv.131.1676394276850; 
 Tue, 14 Feb 2023 09:04:36 -0800 (PST)
X-Google-Smtp-Source: AK7set+62fN0oWIhtJv8C43nJwQN72EY+M4XKimupmfK8X6ed84QxqfEmTPGEvsDvV31WIp3eyaRyEyQsUtuOUpE+wU=
X-Received: by 2002:a17:90a:9f42:b0:234:2592:efbe with SMTP id
 q2-20020a17090a9f4200b002342592efbemr14268pjv.131.1676394276562; Tue, 14 Feb
 2023 09:04:36 -0800 (PST)
MIME-Version: 1.0
References: <20230209184758.1017863-1-jsnow@redhat.com>
 <20230209184758.1017863-4-jsnow@redhat.com>
 <87pmahr983.fsf@pond.sub.org>
 <CAFn=p-bSS_0A2cpWce01Oy7c4gGtDYzMYjSpc4azniYPcPN7CQ@mail.gmail.com>
 <874jrs349u.fsf@pond.sub.org>
In-Reply-To: <874jrs349u.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 14 Feb 2023 12:04:25 -0500
Message-ID: <CAFn=p-aQRQ7xUGVHtfRz=vG0yCd=eoUVyWCyGBdDE3v-yKEHUQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] qapi/expr: Split check_expr out from check_exprs
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="0000000000005bbece05f4abf5ee"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

--0000000000005bbece05f4abf5ee
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 11, 2023, 5:06 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > --0000000000003b01fe05f45a096a
> > Content-Type: text/plain; charset="UTF-8"
> >
> > On Fri, Feb 10, 2023, 7:33 AM Markus Armbruster <armbru@redhat.com>
> wrote:
> >
> >> Another observation...
> >>
> >> John Snow <jsnow@redhat.com> writes:
> >>
> >> > Primarily, this reduces a nesting level of a particularly long
> >> > block. It's mostly code movement, but a new docstring is created.
> >> >
> >> > It also has the effect of creating a fairly convenient "catch point"
> in
> >> > check_exprs for exception handling without making the nesting level
> even
> >> > worse.
> >>
> >
> > What I mean is: If you want to handle exceptions without this patch, a
> > try/catch will add another nesting level to this hundred line function.
> >
> > By splitting it, you can use the outer looping function as a choke point
> to
> > write the handler.
> >
> > I had a branch once where I use this fact to stop routing "info" into 99%
> > of expr.py. I did this to use an off the shelf JSON validator while
> > preserving your custom source info error reporting that identifies the
> > precise location of the error.
>
> When you have to reindent anyway, the drawback "makes git-blame less
> useful" evaporates.  When the reindent is due to another level of
> nesting, the benefit "reduces nesting" becomes more valuable.
>
> > I took that out for now, in the interest of staying focused on the
> minimum
> > viable to achieve strict typing, but found this change to be helpful
> anyway.
> >
> > Admit that it does muddy the waters with git blame, but... my calculus on
> > that might just be different from yours.
> >
> > (To me, git blame is almost always something I have to trace back through
> > several refactors anyway, so I see the battle as lost before I started.)
> >
> > I can omit this patch for now if you'd like, it isn't crucial. I just
> think
> > I'd still "kinda like to have it". I'll leave it up to you.
>
> I'd prefer to shelve it for now.  Bring it back when we have to reindent
> anyway.
>

OK. Let me peek ahead to some of my other pending patches and just confirm
there's no stronger reason to keep it...

(/me still ~kiiiinda~ wants it, but admits its not seemingly crucial atm)


> >> > Signed-off-by: John Snow <jsnow@redhat.com>
> >> >
> >> > ---
> >> >
> >> > This patch was originally written as part of my effort to factor out
> >> > QAPISourceInfo from this file by having expr.py raise a simple
> >> > exception, then catch and wrap it at the higher level.
> >> >
> >> > This series doesn't do that anymore, but reducing the nesting level
> >> > still seemed subjectively nice. It's not crucial.
> >> >
> >> > Signed-off-by: John Snow <jsnow@redhat.com>
> >>
> >
> > Whoops, script doesn't understand when I add notes.
> >
> >> ---
> >> >  scripts/qapi/expr.py | 179
> +++++++++++++++++++++++--------------------
> >> >  1 file changed, 95 insertions(+), 84 deletions(-)
> >> >
> >> > diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> >> > index 5a1782b57ea..b56353bdf84 100644
> >> > --- a/scripts/qapi/expr.py
> >> > +++ b/scripts/qapi/expr.py
> >> > @@ -595,6 +595,99 @@ def check_event(expr: _JSONObject, info:
> >> QAPISourceInfo) -> None:
> >> >      check_type(args, info, "'data'", allow_dict=not boxed)
> >> >
> >> >
> >> > +def check_expr(expr_elem: _JSONObject) -> None:
> >>
> >> [...]
> >>
> >> >  def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
> >> >      """
> >> >      Validate and normalize a list of parsed QAPI schema expressions.
> >>
> >> The typing is kind of wrong.
> >>
> >> The list is the value of QAPISchemaParser.exprs, which is (losely) typed
> >> as List[Dict[str, object]].  It is actually a dict mapping
> >>
> >>    'expr' -> _ExprValue
> >>    'info' -> QAPISourceInfo
> >>    'doc'  -> Optional[QAPIDoc]
> >>
> >> Thet's not what _JSONObject is!  Its doc string describes it as
> >> "Deserialized JSON objects as returned by the parser", i.e. the same as
> >> _ExprValue.
> >>
> >> Works only because _JSONObject is a dict mapping arbitrary keys to
> >> _JSONObject, str or bool.
> >>
> >> This patch spreads the flawed typing to the new function.
> >>
> >> Gets healed later in the series.
> >>
> >
> > Oops...!
> >
> > Symptom of patch reordering that happened some time ago, I think. Mea
> > culpa. Will fix.
> >
> > (Possibly with some ugly intermediate type that goes away by end of
> series.)
>
> Only if it's dead easy.
>
> Simply have the commit message point out there's problem being fixed?
>
> >> [...]
>
>

--0000000000005bbece05f4abf5ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Feb 11, 2023, 5:06 AM Markus Armbruster &lt;<a=
 href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">John Snow &lt;<a href=3D"mailto:jsnow@redh=
at.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt; write=
s:<br>
<br>
&gt; --0000000000003b01fe05f45a096a<br>
&gt; Content-Type: text/plain; charset=3D&quot;UTF-8&quot;<br>
&gt;<br>
&gt; On Fri, Feb 10, 2023, 7:33 AM Markus Armbruster &lt;<a href=3D"mailto:=
armbru@redhat.com" target=3D"_blank" rel=3D"noreferrer">armbru@redhat.com</=
a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Another observation...<br>
&gt;&gt;<br>
&gt;&gt; John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank=
" rel=3D"noreferrer">jsnow@redhat.com</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; Primarily, this reduces a nesting level of a particularly lon=
g<br>
&gt;&gt; &gt; block. It&#39;s mostly code movement, but a new docstring is =
created.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; It also has the effect of creating a fairly convenient &quot;=
catch point&quot; in<br>
&gt;&gt; &gt; check_exprs for exception handling without making the nesting=
 level even<br>
&gt;&gt; &gt; worse.<br>
&gt;&gt;<br>
&gt;<br>
&gt; What I mean is: If you want to handle exceptions without this patch, a=
<br>
&gt; try/catch will add another nesting level to this hundred line function=
.<br>
&gt;<br>
&gt; By splitting it, you can use the outer looping function as a choke poi=
nt to<br>
&gt; write the handler.<br>
&gt;<br>
&gt; I had a branch once where I use this fact to stop routing &quot;info&q=
uot; into 99%<br>
&gt; of expr.py. I did this to use an off the shelf JSON validator while<br=
>
&gt; preserving your custom source info error reporting that identifies the=
<br>
&gt; precise location of the error.<br>
<br>
When you have to reindent anyway, the drawback &quot;makes git-blame less<b=
r>
useful&quot; evaporates.=C2=A0 When the reindent is due to another level of=
<br>
nesting, the benefit &quot;reduces nesting&quot; becomes more valuable.<br>
<br>
&gt; I took that out for now, in the interest of staying focused on the min=
imum<br>
&gt; viable to achieve strict typing, but found this change to be helpful a=
nyway.<br>
&gt;<br>
&gt; Admit that it does muddy the waters with git blame, but... my calculus=
 on<br>
&gt; that might just be different from yours.<br>
&gt;<br>
&gt; (To me, git blame is almost always something I have to trace back thro=
ugh<br>
&gt; several refactors anyway, so I see the battle as lost before I started=
.)<br>
&gt;<br>
&gt; I can omit this patch for now if you&#39;d like, it isn&#39;t crucial.=
 I just think<br>
&gt; I&#39;d still &quot;kinda like to have it&quot;. I&#39;ll leave it up =
to you.<br>
<br>
I&#39;d prefer to shelve it for now.=C2=A0 Bring it back when we have to re=
indent<br>
anyway.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">OK. Let me peek ahead to some of my other pending patches and just c=
onfirm there&#39;s no stronger reason to keep it...</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">(/me still ~kiiiinda~ wants it, but admits its =
not seemingly crucial atm)</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;&gt; &gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.c=
om" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This patch was originally written as part of my effort to fac=
tor out<br>
&gt;&gt; &gt; QAPISourceInfo from this file by having expr.py raise a simpl=
e<br>
&gt;&gt; &gt; exception, then catch and wrap it at the higher level.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This series doesn&#39;t do that anymore, but reducing the nes=
ting level<br>
&gt;&gt; &gt; still seemed subjectively nice. It&#39;s not crucial.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.c=
om" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; Whoops, script doesn&#39;t understand when I add notes.<br>
&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; &gt;=C2=A0 scripts/qapi/expr.py | 179 +++++++++++++++++++++++-----=
---------------<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 95 insertions(+), 84 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py<br>
&gt;&gt; &gt; index 5a1782b57ea..b56353bdf84 100644<br>
&gt;&gt; &gt; --- a/scripts/qapi/expr.py<br>
&gt;&gt; &gt; +++ b/scripts/qapi/expr.py<br>
&gt;&gt; &gt; @@ -595,6 +595,99 @@ def check_event(expr: _JSONObject, info:=
<br>
&gt;&gt; QAPISourceInfo) -&gt; None:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 check_type(args, info, &quot;&#39;data&#3=
9;&quot;, allow_dict=3Dnot boxed)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +def check_expr(expr_elem: _JSONObject) -&gt; None:<br>
&gt;&gt;<br>
&gt;&gt; [...]<br>
&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 def check_exprs(exprs: List[_JSONObject]) -&gt; List[_J=
SONObject]:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Validate and normalize a list of parsed Q=
API schema expressions.<br>
&gt;&gt;<br>
&gt;&gt; The typing is kind of wrong.<br>
&gt;&gt;<br>
&gt;&gt; The list is the value of QAPISchemaParser.exprs, which is (losely)=
 typed<br>
&gt;&gt; as List[Dict[str, object]].=C2=A0 It is actually a dict mapping<br=
>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 &#39;expr&#39; -&gt; _ExprValue<br>
&gt;&gt;=C2=A0 =C2=A0 &#39;info&#39; -&gt; QAPISourceInfo<br>
&gt;&gt;=C2=A0 =C2=A0 &#39;doc&#39;=C2=A0 -&gt; Optional[QAPIDoc]<br>
&gt;&gt;<br>
&gt;&gt; Thet&#39;s not what _JSONObject is!=C2=A0 Its doc string describes=
 it as<br>
&gt;&gt; &quot;Deserialized JSON objects as returned by the parser&quot;, i=
.e. the same as<br>
&gt;&gt; _ExprValue.<br>
&gt;&gt;<br>
&gt;&gt; Works only because _JSONObject is a dict mapping arbitrary keys to=
<br>
&gt;&gt; _JSONObject, str or bool.<br>
&gt;&gt;<br>
&gt;&gt; This patch spreads the flawed typing to the new function.<br>
&gt;&gt;<br>
&gt;&gt; Gets healed later in the series.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Oops...!<br>
&gt;<br>
&gt; Symptom of patch reordering that happened some time ago, I think. Mea<=
br>
&gt; culpa. Will fix.<br>
&gt;<br>
&gt; (Possibly with some ugly intermediate type that goes away by end of se=
ries.)<br>
<br>
Only if it&#39;s dead easy.<br>
<br>
Simply have the commit message point out there&#39;s problem being fixed?<b=
r>
<br>
&gt;&gt; [...]<br>
<br>
</blockquote></div></div></div>

--0000000000005bbece05f4abf5ee--


