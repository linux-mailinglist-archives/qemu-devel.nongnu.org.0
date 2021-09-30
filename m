Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDD441DFD7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 19:13:57 +0200 (CEST)
Received: from localhost ([::1]:55322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVzd6-0007Mt-Fr
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 13:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVzbi-0006E5-0v
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 13:12:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVzbf-0002qI-Ap
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 13:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633021946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ZRN643k1EdMGEMviLuvYFmhHTNdeR10nx4MZt90OLc=;
 b=empvG/cNSQziLoWfWVz5lZ0suhsGyj/UguoG6f7LW9V6dDrC5g1vAfK0k/g46whrBUIsYL
 6SJGSDaA26IOVj3gAQtRh0CTIJiKg9FcECyJluV9tF8xpomqMCU6Nr1XkA3xXbCdnmz28u
 4tBavpuAGjF2gDlmwGukVyKyziqsH/c=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-v5hq7nEHMbWXaHW_rPY7ig-1; Thu, 30 Sep 2021 13:12:07 -0400
X-MC-Unique: v5hq7nEHMbWXaHW_rPY7ig-1
Received: by mail-ua1-f71.google.com with SMTP id
 i9-20020ab029c90000b02902aa59690c5aso3389586uaq.3
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 10:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ZRN643k1EdMGEMviLuvYFmhHTNdeR10nx4MZt90OLc=;
 b=E0KyqVnxnJqKsUJqbz4S9iisXA8+p1b7gCndX2QoGVL9qcGA0qglG2TzzB4vXKD1qp
 clkKcGdZ27qqcpuswBlF43OC9t2l6GqDBZX+mN8SL7tJZpksbl9CoUqyHO4BUK2B/5jv
 o0ZNCOgfIk1K2HS12LVuPaAqD3Cd92paqvD+FGYoEH46o23NoVRvHuUOaQZt3q6lXGei
 joHQnp+91U17uGHkKvnFBIf9YvLAxCK/5HcTGsbk4XL1pPVR5J3sSjcl96+rBwW2pYqQ
 OqpDRwXVupllupsiyt+z299LMguyCZMLnRWOEAPRK6WEAqZLL87bNEa/VWkoLM6eHCH8
 HDjg==
X-Gm-Message-State: AOAM530TFMKhFn/q/lfRF6UZuMgfZ9FvEm8VcVG2lL56HhyQTH5qL46z
 Wgi6ayFlyb6cXf0FOJg9eacGj1IKx0m/3JzaEp0pnYRx7DcNw/jzdACznZSHYrAy50mvsCovMXi
 LqeZ52T8+64zHzAuWpQEFBkvFkH7t0q4=
X-Received: by 2002:ab0:558d:: with SMTP id v13mr6706490uaa.50.1633021927047; 
 Thu, 30 Sep 2021 10:12:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykoLwJdxgqmNfM92HFkymVp9dGzoYPQkTt+SsEh4kwcRvXdduH/4AipbqOV/5+AOdqBGiv2uta6QSO/zW1R3Y=
X-Received: by 2002:ab0:558d:: with SMTP id v13mr6706472uaa.50.1633021926854; 
 Thu, 30 Sep 2021 10:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210929194428.1038496-1-jsnow@redhat.com>
 <20210929194428.1038496-10-jsnow@redhat.com>
 <87o88aqtw4.fsf@dusky.pond.sub.org>
In-Reply-To: <87o88aqtw4.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 30 Sep 2021 13:11:55 -0400
Message-ID: <CAFn=p-ZhF0wpbwL0X5Xn7YLKNSth+Bhsm9ScZF=MJtKHa4cWXQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] qapi/parser: add import cycle workaround
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000dc61c005cd398b82"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dc61c005cd398b82
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 30, 2021 at 5:45 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > There is a cycle that exists in the QAPI generator: [schema -> expr ->
>
> "There is" or "there will be once we add strong type hints"?
>
>
"There exists in my mind-palace a cycle where, ..."

(Will adjust the commit message.)


> > parser -> schema]. It exists because the QAPIDoc class needs the names
> > of types defined by the schema module, but the schema module needs to
> > import both expr.py/parser.py to do its actual parsing.
> >
> > Ultimately, the layering violation is that parser.py should not have any
> > knowledge of specifics of the Schema. QAPIDoc performs double-duty here
> > both as a parser *and* as a finalized object that is part of the schema.
> >
> > I see three paths here:
> >
> > (1) Just use the TYPE_CHECKING trick to eliminate the cycle which is only
> >     present during static analysis.
> >
> > (2) Don't bother to annotate connect_member() et al, give them 'object'
> >     or 'Any'. I don't particularly like this, because it diminishes the
> >     usefulness of type hints for documentation purposes. Still, it's an
> >     extremely quick fix.
> >
> > (3) Reimplement doc <--> definition correlation directly in schema.py,
> >     integrating doc fields directly into QAPISchemaMember and relieving
> >     the QAPIDoc class of the responsibility. Users of the information
> >     would instead visit the members first and retrieve their
> >     documentation instead of the inverse operation -- visiting the
> >     documentation and retrieving their members.
> >
> > I prefer (3), but (1) is the easiest way to have my cake (strong type
> > hints) and eat it too (Not have import cycles). Do (1) for now, but plan
> > for (3). See also:
> >
> https://mypy.readthedocs.io/en/latest/runtime_troubles.html#import-cycles
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  scripts/qapi/parser.py | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> > index 123fc2f099c..30b1d98df0b 100644
> > --- a/scripts/qapi/parser.py
> > +++ b/scripts/qapi/parser.py
> > @@ -18,6 +18,7 @@
> >  import os
> >  import re
> >  from typing import (
> > +    TYPE_CHECKING,
> >      Dict,
> >      List,
> >      Optional,
> > @@ -30,6 +31,12 @@
> >  from .source import QAPISourceInfo
> >
> >
> > +if TYPE_CHECKING:
> > +    # pylint: disable=cyclic-import
> > +    # TODO: Remove cycle. [schema -> expr -> parser -> schema]
> > +    from .schema import QAPISchemaFeature, QAPISchemaMember
> > +
> > +
> >  # Return value alias for get_expr().
> >  _ExprValue = Union[List[object], Dict[str, object], str, bool]
> >
> > @@ -473,9 +480,9 @@ def append(self, line):
> >      class ArgSection(Section):
> >          def __init__(self, parser, name, indent=0):
> >              super().__init__(parser, name, indent)
> > -            self.member = None
> > +            self.member: Optional['QAPISchemaMember'] = None
> >
> > -        def connect(self, member):
> > +        def connect(self, member: 'QAPISchemaMember') -> None:
> >              self.member = member
> >
> >      class NullSection(Section):
> > @@ -750,14 +757,14 @@ def _append_freeform(self, line):
> >                                   % match.group(1))
> >          self._section.append(line)
> >
> > -    def connect_member(self, member):
> > +    def connect_member(self, member: 'QAPISchemaMember') -> None:
> >          if member.name not in self.args:
> >              # Undocumented TODO outlaw
> >              self.args[member.name] = QAPIDoc.ArgSection(self._parser,
> >                                                          member.name)
> >          self.args[member.name].connect(member)
> >
> > -    def connect_feature(self, feature):
> > +    def connect_feature(self, feature: 'QAPISchemaFeature') -> None:
> >          if feature.name not in self.features:
> >              raise QAPISemError(feature.info,
> >                                 "feature '%s' lacks documentation"
>
> This adds just the type hints that cause the cycle.  I like that,
> because it illustrates the cycle.  Would be nice if the commit message
> mentioned this, perhaps
>
>   I prefer (3), but (1) is the easiest way to have my cake (strong type
>   hints) and eat it too (Not have import cycles). Do (1) for now, but plan
>   for (3). Also add the type hints that cause the cycle right away to
>   illustrate. See also:
>
> https://mypy.readthedocs.io/en/latest/runtime_troubles.html#import-cycles
>
> Slightly nicer, I think, would be swapping this and the next patch.
> Then that one's commit message needs to say something like "except for a
> few problematic ones, which the next commit will add".  Worthwhile?  Up
> to you.
>
>
Doing it the other way around means you can't squash the mypy patch into
the bulk-type-hints patch, but I think the git log usefulness is not better
or worse either way around. (Reviewer usefulness is maybe a ship that has
sailed, by now?)

--js

--000000000000dc61c005cd398b82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 30, 2021 at 5:45 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">John=
 Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redha=
t.com</a>&gt; writes:<br>
<br>
&gt; There is a cycle that exists in the QAPI generator: [schema -&gt; expr=
 -&gt;<br>
<br>
&quot;There is&quot; or &quot;there will be once we add strong type hints&q=
uot;?<br>
<br></blockquote><div><br></div><div>&quot;There exists in my mind-palace a=
 cycle where, ...&quot;</div><div><br></div><div>(Will adjust the commit me=
ssage.)<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; parser -&gt; schema]. It exists because the QAPIDoc class needs the na=
mes<br>
&gt; of types defined by the schema module, but the schema module needs to<=
br>
&gt; import both <a href=3D"http://expr.py/parser.py" rel=3D"noreferrer" ta=
rget=3D"_blank">expr.py/parser.py</a> to do its actual parsing.<br>
&gt;<br>
&gt; Ultimately, the layering violation is that parser.py should not have a=
ny<br>
&gt; knowledge of specifics of the Schema. QAPIDoc performs double-duty her=
e<br>
&gt; both as a parser *and* as a finalized object that is part of the schem=
a.<br>
&gt;<br>
&gt; I see three paths here:<br>
&gt;<br>
&gt; (1) Just use the TYPE_CHECKING trick to eliminate the cycle which is o=
nly<br>
&gt;=C2=A0 =C2=A0 =C2=A0present during static analysis.<br>
&gt;<br>
&gt; (2) Don&#39;t bother to annotate connect_member() et al, give them &#3=
9;object&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0or &#39;Any&#39;. I don&#39;t particularly like thi=
s, because it diminishes the<br>
&gt;=C2=A0 =C2=A0 =C2=A0usefulness of type hints for documentation purposes=
. Still, it&#39;s an<br>
&gt;=C2=A0 =C2=A0 =C2=A0extremely quick fix.<br>
&gt;<br>
&gt; (3) Reimplement doc &lt;--&gt; definition correlation directly in sche=
ma.py,<br>
&gt;=C2=A0 =C2=A0 =C2=A0integrating doc fields directly into QAPISchemaMemb=
er and relieving<br>
&gt;=C2=A0 =C2=A0 =C2=A0the QAPIDoc class of the responsibility. Users of t=
he information<br>
&gt;=C2=A0 =C2=A0 =C2=A0would instead visit the members first and retrieve =
their<br>
&gt;=C2=A0 =C2=A0 =C2=A0documentation instead of the inverse operation -- v=
isiting the<br>
&gt;=C2=A0 =C2=A0 =C2=A0documentation and retrieving their members.<br>
&gt;<br>
&gt; I prefer (3), but (1) is the easiest way to have my cake (strong type<=
br>
&gt; hints) and eat it too (Not have import cycles). Do (1) for now, but pl=
an<br>
&gt; for (3). See also:<br>
&gt; <a href=3D"https://mypy.readthedocs.io/en/latest/runtime_troubles.html=
#import-cycles" rel=3D"noreferrer" target=3D"_blank">https://mypy.readthedo=
cs.io/en/latest/runtime_troubles.html#import-cycles</a><br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/parser.py | 15 +++++++++++----<br>
&gt;=C2=A0 1 file changed, 11 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py<br>
&gt; index 123fc2f099c..30b1d98df0b 100644<br>
&gt; --- a/scripts/qapi/parser.py<br>
&gt; +++ b/scripts/qapi/parser.py<br>
&gt; @@ -18,6 +18,7 @@<br>
&gt;=C2=A0 import os<br>
&gt;=C2=A0 import re<br>
&gt;=C2=A0 from typing import (<br>
&gt; +=C2=A0 =C2=A0 TYPE_CHECKING,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Dict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 List,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Optional,<br>
&gt; @@ -30,6 +31,12 @@<br>
&gt;=C2=A0 from .source import QAPISourceInfo<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; +if TYPE_CHECKING:<br>
&gt; +=C2=A0 =C2=A0 # pylint: disable=3Dcyclic-import<br>
&gt; +=C2=A0 =C2=A0 # TODO: Remove cycle. [schema -&gt; expr -&gt; parser -=
&gt; schema]<br>
&gt; +=C2=A0 =C2=A0 from .schema import QAPISchemaFeature, QAPISchemaMember=
<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 # Return value alias for get_expr().<br>
&gt;=C2=A0 _ExprValue =3D Union[List[object], Dict[str, object], str, bool]=
<br>
&gt;=C2=A0 <br>
&gt; @@ -473,9 +480,9 @@ def append(self, line):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 class ArgSection(Section):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def __init__(self, parser, name, ind=
ent=3D0):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(parse=
r, name, indent)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.member =3D None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.member: Optional[&#39;=
QAPISchemaMember&#39;] =3D None<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 def connect(self, member):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def connect(self, member: &#39;QAPISchema=
Member&#39;) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.member =3D member=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 class NullSection(Section):<br>
&gt; @@ -750,14 +757,14 @@ def _append_freeform(self, line):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% match.group(1))<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._section.append(line)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def connect_member(self, member):<br>
&gt; +=C2=A0 =C2=A0 def connect_member(self, member: &#39;QAPISchemaMember&=
#39;) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://member.name" re=
l=3D"noreferrer" target=3D"_blank">member.name</a> not in self.args:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Undocumented TODO ou=
tlaw<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.args[<a href=3D"h=
ttp://member.name" rel=3D"noreferrer" target=3D"_blank">member.name</a>] =
=3D QAPIDoc.ArgSection(self._parser,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http=
://member.name" rel=3D"noreferrer" target=3D"_blank">member.name</a>)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.args[<a href=3D"http://member.n=
ame" rel=3D"noreferrer" target=3D"_blank">member.name</a>].connect(member)<=
br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def connect_feature(self, feature):<br>
&gt; +=C2=A0 =C2=A0 def connect_feature(self, feature: &#39;QAPISchemaFeatu=
re&#39;) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://feature.name" r=
el=3D"noreferrer" target=3D"_blank">feature.name</a> not in self.features:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<a =
href=3D"http://feature.info" rel=3D"noreferrer" target=3D"_blank">feature.i=
nfo</a>,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;feature &#39;%s&#39; =
lacks documentation&quot;<br>
<br>
This adds just the type hints that cause the cycle.=C2=A0 I like that,<br>
because it illustrates the cycle.=C2=A0 Would be nice if the commit message=
<br>
mentioned this, perhaps<br>
<br>
=C2=A0 I prefer (3), but (1) is the easiest way to have my cake (strong typ=
e<br>
=C2=A0 hints) and eat it too (Not have import cycles). Do (1) for now, but =
plan<br>
=C2=A0 for (3). Also add the type hints that cause the cycle right away to<=
br>
=C2=A0 illustrate. See also:<br>
=C2=A0 <a href=3D"https://mypy.readthedocs.io/en/latest/runtime_troubles.ht=
ml#import-cycles" rel=3D"noreferrer" target=3D"_blank">https://mypy.readthe=
docs.io/en/latest/runtime_troubles.html#import-cycles</a><br>
<br>
Slightly nicer, I think, would be swapping this and the next patch.<br>
Then that one&#39;s commit message needs to say something like &quot;except=
 for a<br>
few problematic ones, which the next commit will add&quot;.=C2=A0 Worthwhil=
e?=C2=A0 Up<br>
to you.<br>
<br></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">Doing it the other way around means you can&#39;t squash the my=
py patch into the bulk-type-hints patch, but I think the git log usefulness=
 is not better or worse either way around. (Reviewer usefulness is maybe a =
ship that has sailed, by now?)</div><div class=3D"gmail_quote"><br></div><d=
iv class=3D"gmail_quote">--js<br></div></div>

--000000000000dc61c005cd398b82--


