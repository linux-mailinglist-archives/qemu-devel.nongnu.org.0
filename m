Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04945417DD3
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 00:39:28 +0200 (CEST)
Received: from localhost ([::1]:58948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTtqo-000438-QI
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 18:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTtpQ-0003AT-Pf
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 18:38:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTtpN-0001LQ-63
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 18:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632523076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4ARj8rPuPj/BsuGhkp3Xju2svQzUzQfre9onv32yf38=;
 b=YSJVNSZyRL1SbFBkEkc5EWnMuC33NujwDFI4p1yLZMlMqiQ9l5vRYeM9a8zDU7ya9yQQDM
 tpGTsQTTZkelwIsnlfGubqqWZmdRRVDgpDvYDCfPU0UgNPmTQiISvj6oJk/xMMi5Hx+/Jy
 +vE6G4kkBVia6fziyc03L3O1oAV93U0=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-dTOw8gv1O4KmqbvTe9dbwA-1; Fri, 24 Sep 2021 18:37:53 -0400
X-MC-Unique: dTOw8gv1O4KmqbvTe9dbwA-1
Received: by mail-oi1-f197.google.com with SMTP id
 m84-20020acabc57000000b00275c1cf95d4so7994252oif.2
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 15:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ARj8rPuPj/BsuGhkp3Xju2svQzUzQfre9onv32yf38=;
 b=qb8dffjQ138H/U4Pso6TBKhYQesdafyrFv2Fq06tuIVxpuiuNliSlDLpYKwCbxjQXa
 aSoT9G0U2c2uSKD87QLMYGuVjgblbz1zPEEfh7l4VDfKAKJ6r+TZyHOQoAhXnQyLFraG
 f+2STN83qcEXH6REOeQXqBm2FELoq6f1e6bV4XK4429mnqkcbSU5oaEiNhpjTG1xP6kZ
 4k5CzA4uFyuwUtoostRW6xHrWOQUyPXmFKYzPE3LZnQVfSUsVdA7dM8b8wchJT+VFk+4
 H0MMdLvuSUuaF4IP7GL64BKjYBWretbbqWSad+kKrFaxVYNRHzkDl5NdDxJZQAk5QJSC
 oUzw==
X-Gm-Message-State: AOAM532roSfYA04Wj1qRoQQmOyoN50XcBT4phzPELQlLlvWuTqYgCRlj
 +pGrAtvpCFOFF71SwmfgXgZyUqEZ2Zsz5tLlfqEcPA6FeqZwyjr2tFtCVSR0sTYMpaZi/QeSpfA
 FyXoAfA4mfhS75aZIcSw+Ko/WQ3nWoDI=
X-Received: by 2002:a05:6808:209b:: with SMTP id
 s27mr3383976oiw.168.1632523072066; 
 Fri, 24 Sep 2021 15:37:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjgwm5Hs11yrVH/yEYmMx/CJ8r5NIctZzeE7T2Dwj0W3Jgzti3rsW/nxLHpotPGScb8u0u8lMHW4QN0rjqqOE=
X-Received: by 2002:a05:6808:209b:: with SMTP id
 s27mr3383969oiw.168.1632523071853; 
 Fri, 24 Sep 2021 15:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210520225710.168356-1-jsnow@redhat.com>
 <20210520225710.168356-3-jsnow@redhat.com>
 <87sfyg6b8e.fsf@dusky.pond.sub.org>
In-Reply-To: <87sfyg6b8e.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Fri, 24 Sep 2021 18:37:40 -0400
Message-ID: <CAFn=p-ZDdi157BSGWcweQ6sLE5=zMcjROJSahhONqxDC3fH20A@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] qapi/parser: Allow empty QAPIDoc Sections
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c9293805ccc56544"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c9293805ccc56544
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 7, 2021 at 4:28 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > It simplifies the typing to say that _section is always a
> > QAPIDoc.Section().
>
> If you say so....
>
>
I mean, I thought so at the time. I have an aversion to making optional
types and then littering isinstance() checks in places. I like keeping as
much of the typing statically provable as I can without adding runtime
checks. I'm re-evaluating this patch now, and I'll see if there's anything
I can do, but it's hard to predict differences in matters of taste and
style.

One thing an Optional[T] class instance variable can do that might be
helpful is to remind users that they need to check to see if it's present
or not. If I see a path to eliminate those checks, though, I will generally
always take it - eliminates the need to check everywhere else and puts all
the information you need into the static typing. As a habit, I prefer that
when feasible.

> To accommodate this change, we must allow for this object to evaluate to
> > False for functions like _end_section which behave differently based on
> > whether or not a Section has been started.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> >
> > ---
> >
> > Probably a better fix is to restructure the code to prevent empty
> > sections from being "ended", but that seems like a bigger whale than
> > what I'm after at the immediate moment.
>
> Do we have a TODO comment for that?
>
>
Nope. I'll either add one or just fix the root issue, because I want to go
back to writing the cross-referenceable QAPI symbol plugin for sphinx now.
At the time I thought I'd get to fixing some of the issues raised by pt5 a
lot sooner, but.


> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  scripts/qapi/parser.py | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> > index b6a5e661215..3ddde318376 100644
> > --- a/scripts/qapi/parser.py
> > +++ b/scripts/qapi/parser.py
> > @@ -456,6 +456,9 @@ def __init__(self, parser, name=None, indent=0):
> >              # the expected indent level of the text of this section
> >              self._indent = indent
> >
> > +        def __bool__(self) -> bool:
> > +            return bool(self.name or self.text)
> > +
> >          def append(self, line):
> >              # Strip leading spaces corresponding to the expected indent
> level
> >              # Blank lines are always OK.
>
> Overriding __bool__() is the minimally invasive compensation for the
> next hunk's replacement of None by a QAPIDoc.Section
>
> However, I'm wary of overriding __bool__().  It creates a difference
> between "if object:" and "if object is not None:".  Gives me a queasy
> feeling, as shortening the latter to the former is pretty much
> automatic.
>
>
That's just Python, though. If collections are empty, they're falsey. If
QAPIDoc is a collection of documentation lines and we have no lines,
shouldn't that also be falsey?

Nah, I get the apprehension. It's not a strictly linear collection and I
didn't check *every* last field, just name and text. It's kind of a hack
because I'm trying to paper over some deeper(?) problem(??), but it felt
safe because the static typing means we're not likely to confuse the two
cases -- we don't need to distinguish "Absent" from "empty". Or at least,
after this patch we don't need to, anymore. (We'll always have a section,
so an empty section versus no section makes no difference.)

A boring .is_empty() would avoid that, but we'd have to adjust "if S" to
> "if S.is_empty()" wherever we changed S from Optional[Section] to
> Section.  Which S could be affected?
>
>
Feels deeply against the grain of how Python is written to go out of your
way to create an .is_empty() function.


> The following variables get assigned Section or ArgSection:
>
>     QAPIDoc.body
>     QAPIDoc._section
>     QAPIDoc.args[NAME]
>     QAPIDoc.features[NAME]
>
> .body, .args[NAME] and .features[NAME] are never None I believe.
>
> ._section is also assigned None, in ._end_section().  It remains None
> until the next ._start*_section().
>
> The only use of .section that doesn't dot into it is in ._end_section().
> That's the only spot to adjust.
>
> Confirm by testing: in all of "make check", Section.__bool__() is only
> ever called from QAPIDoc._end_section().  Checked by sticking
> traceback.print_stack() into .__bool__().
>
>
If that's the only caller, isn't it then perfectly safe to just use the
patch as written?


> > @@ -722,7 +725,7 @@ def _end_section(self):
> >                  raise QAPIParseError(
> >                      self._parser,
> >                      "empty doc section '%s'" % self._section.name)
> > -            self._section = None
> > +            self._section = QAPIDoc.Section(self._parser)
> >
> >      def _append_freeform(self, line):
> >          match = re.match(r'(@\S+:)', line)
>
> Replacing None by QAPIDoc.Section doesn't just simplify the typing!  It
> also creates a bogus "additional section" (in the sense of QAPIDoc's
> class comment) after any section.  Works, because the .start*_section()
> all call .end_section() first, .end_section() does nothing for empty
> sections, and the bogus sections remain empty, unless we somehow screw
> up the code to add contents to them.  Such screwups are now possible,
> whereas before they would crash.
>
> This correctness argument isn't obvious, and therefore should be made in
> the commit message.
>
>
I'll try to suss out the real problem, because I am not sure how to justify
the hypothetical cases where we might add content to a bogus section,
because I do not fully understand the circumstances in which the bogus
sections are generated. I seem to recall we already *have* them for some
reason, and it's caused by some whitespace issues (in some cases), but
writing tests or proving it doesn't cause a hypothetical future breakage is
just not something I know how to write a commit message for.

So, time to detour into QAPIDoc parsing.

--js

--000000000000c9293805ccc56544
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 7, 2021 at 4:28 AM Markus=
 Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">John =
Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat=
.com</a>&gt; writes:<br>
<br>
&gt; It simplifies the typing to say that _section is always a<br>
&gt; QAPIDoc.Section().<br>
<br>
If you say so....<br>
<br></blockquote><br><div>I mean, I thought so at the time. I have an avers=
ion to making optional types and then littering isinstance() checks in plac=
es. I like keeping as much of the typing statically provable as I can witho=
ut adding runtime checks. I&#39;m re-evaluating this patch now, and I&#39;l=
l see if there&#39;s anything I can do, but it&#39;s hard to predict differ=
ences in matters of taste and style.</div><div><br></div><div>One thing an =
Optional[T] class instance variable can do that might be helpful is to remi=
nd users that they need to check to see if it&#39;s present or not. If I se=
e a path to eliminate those checks, though, I will generally always take it=
 - eliminates the need to check everywhere else and puts all the informatio=
n you need into the static typing. As a habit, I prefer that when feasible.=
<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; To accommodate this change, we must allow for this object to evaluate =
to<br>
&gt; False for functions like _end_section which behave differently based o=
n<br>
&gt; whether or not a Section has been started.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Probably a better fix is to restructure the code to prevent empty<br>
&gt; sections from being &quot;ended&quot;, but that seems like a bigger wh=
ale than<br>
&gt; what I&#39;m after at the immediate moment.<br>
<br>
Do we have a TODO comment for that?<br>
<br></blockquote><div><br></div><div>Nope. I&#39;ll either add one or just =
fix the root issue, because I want to go back to writing the cross-referenc=
eable QAPI symbol plugin for sphinx now. At the time I thought I&#39;d get =
to fixing some of the issues raised by pt5 a lot sooner, but.<br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/parser.py | 5 ++++-<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py<br>
&gt; index b6a5e661215..3ddde318376 100644<br>
&gt; --- a/scripts/qapi/parser.py<br>
&gt; +++ b/scripts/qapi/parser.py<br>
&gt; @@ -456,6 +456,9 @@ def __init__(self, parser, name=3DNone, indent=3D0=
):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the expected indent =
level of the text of this section<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._indent =3D inden=
t<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def __bool__(self) -&gt; bool:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return bool(<a href=3D"http=
://self.name" rel=3D"noreferrer" target=3D"_blank">self.name</a> or self.te=
xt)<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def append(self, line):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Strip leading spaces=
 corresponding to the expected indent level<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Blank lines are alwa=
ys OK.<br>
<br>
Overriding __bool__() is the minimally invasive compensation for the<br>
next hunk&#39;s replacement of None by a QAPIDoc.Section<br>
<br>
However, I&#39;m wary of overriding __bool__().=C2=A0 It creates a differen=
ce<br>
between &quot;if object:&quot; and &quot;if object is not None:&quot;.=C2=
=A0 Gives me a queasy<br>
feeling, as shortening the latter to the former is pretty much<br>
automatic.<br>
<br></blockquote><div><br></div><div>That&#39;s just Python, though. If col=
lections are empty, they&#39;re falsey. If QAPIDoc is a collection of docum=
entation lines and we have no lines, shouldn&#39;t that also be falsey?<br>=
</div><div><br></div><div>Nah, I get the apprehension. It&#39;s not a stric=
tly linear collection and I didn&#39;t check *every* last field, just name =
and text. It&#39;s kind of a hack because I&#39;m trying to paper over some=
 deeper(?) problem(??), but it felt safe because the static typing means we=
&#39;re not likely to confuse the two cases -- we don&#39;t need to disting=
uish &quot;Absent&quot; from &quot;empty&quot;. Or at least, after this pat=
ch we don&#39;t need to, anymore. (We&#39;ll always have a section, so an e=
mpty section versus no section makes no difference.)<br></div></div><div cl=
ass=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
A boring .is_empty() would avoid that, but we&#39;d have to adjust &quot;if=
 S&quot; to<br>
&quot;if S.is_empty()&quot; wherever we changed S from Optional[Section] to=
<br>
Section.=C2=A0 Which S could be affected?<br>
<br></blockquote><div><br></div><div>Feels deeply against the grain of how =
Python is written to go out of your way to create an .is_empty() function.<=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
The following variables get assigned Section or ArgSection:<br>
<br>
=C2=A0 =C2=A0 QAPIDoc.body<br>
=C2=A0 =C2=A0 QAPIDoc._section<br>
=C2=A0 =C2=A0 QAPIDoc.args[NAME]<br>
=C2=A0 =C2=A0 QAPIDoc.features[NAME]<br>
<br>
.body, .args[NAME] and .features[NAME] are never None I believe.<br>
<br>
._section is also assigned None, in ._end_section().=C2=A0 It remains None<=
br>
until the next ._start*_section().<br>
<br>
The only use of .section that doesn&#39;t dot into it is in ._end_section()=
.<br>
That&#39;s the only spot to adjust.<br>
<br>
Confirm by testing: in all of &quot;make check&quot;, Section.__bool__() is=
 only<br>
ever called from QAPIDoc._end_section().=C2=A0 Checked by sticking<br>
traceback.print_stack() into .__bool__().<br>
<br></blockquote><div><br></div><div>If that&#39;s the only caller, isn&#39=
;t it then perfectly safe to just use the patch as written?<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; @@ -722,7 +725,7 @@ def _end_section(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QA=
PIParseError(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self._parser,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;empty doc section &#39;%s&#39;&quot; % self._<a href=3D"http:/=
/section.name" rel=3D"noreferrer" target=3D"_blank">section.name</a>)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._section =3D None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._section =3D QAPIDoc.S=
ection(self._parser)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _append_freeform(self, line):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D re.match(r&#39;(@\S+:)&#39=
;, line)<br>
<br>
Replacing None by QAPIDoc.Section doesn&#39;t just simplify the typing!=C2=
=A0 It<br>
also creates a bogus &quot;additional section&quot; (in the sense of QAPIDo=
c&#39;s<br>
class comment) after any section.=C2=A0 Works, because the .start*_section(=
)<br>
all call .end_section() first, .end_section() does nothing for empty<br>
sections, and the bogus sections remain empty, unless we somehow screw<br>
up the code to add contents to them.=C2=A0 Such screwups are now possible,<=
br>
whereas before they would crash.<br>
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
This correctness argument isn&#39;t obvious, and therefore should be made i=
n<br>
the commit message.<br>
<br></blockquote><div><br></div><div>I&#39;ll try to suss out the real prob=
lem, because I am not sure how to justify the hypothetical cases where we m=
ight add content to a bogus section, because I do not fully understand the =
circumstances in which the bogus sections are generated. I seem to recall w=
e already *have* them for some reason, and it&#39;s caused by some whitespa=
ce issues (in some cases), but writing tests or proving it doesn&#39;t caus=
e a hypothetical future breakage is just not something I know how to write =
a commit message for.</div><div><br></div><div>So, time to detour into QAPI=
Doc parsing.</div><div><br></div><div>--js<br></div></div></div>

--000000000000c9293805ccc56544--


