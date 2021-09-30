Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2602C41DFAE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 19:01:35 +0200 (CEST)
Received: from localhost ([::1]:36350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVzR7-0002Kj-UT
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 13:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVzOz-0001JR-VC
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 12:59:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVzOw-0000EQ-I6
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 12:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633021157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=va2esx24ptRp8hHByXk6gm6Aj1ViBf1ut4tKnV9A6K4=;
 b=PBDE5IIRQpsilBkBJAuOHabl5aX0TiJByC2bWnnkeEUcDmITODAUrQ6cWKOqILbZaJoyYK
 j19qGGg0eVOri/tSIp3HSvAhkkIBSxAr7RLGiwXVJK/4kLt/c3UljUjjh8UQsOy828lLRL
 STcpQ63Yvsl8MVoJtSxoBRPnBrgxNSk=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-oW4hHt0jMcWiPtNiWVqvPQ-1; Thu, 30 Sep 2021 12:59:15 -0400
X-MC-Unique: oW4hHt0jMcWiPtNiWVqvPQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 p13-20020ab01ecd000000b002c997cb5556so3335502uak.20
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 09:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=va2esx24ptRp8hHByXk6gm6Aj1ViBf1ut4tKnV9A6K4=;
 b=C6F7Aj2IjMLVNiTkV3iuLW22k+hhoZD7DmKYyGbMsuT9gyWUTnWaEwLkilVKKDtYOV
 hODtpd94RzrnqkUhOJl7ymyippmelfluRTSiQVnhP3uwNcq1PneaQZE2t8f9Ic1+rA5y
 RM8/FdddYKioGQCzU0ANQXLOmdf9T0RLdISC+VI0brhsrMsHK63LdheBpaolBPSC14Vi
 V3qe5Q/83x0IXfjG1FhotblQdbaGDN6smZov9phQOuXEQeC/zHkv4s7/TgeRQ/ooKnDq
 5YEB0/qsBh6izgzBMwRxBEi45veX2dzqNfYSjXKdR4FPhkCtQdrr8rFCN0DggZk7RodB
 8bIw==
X-Gm-Message-State: AOAM533QlK3tDkdad4TzJrA1GkhOHn2cNeeO/tvJhveKGwyl4oe6YCOV
 u6k/4vSmnEsfbWg1hD66M9dx3SdrSt6UUe2Teimc1r5WtNCmQ3lZPQm2woAcizvgNQzqFhuOg0M
 MXQu/EXJR8L5yHgqpil1fPfYaZsTIeSI=
X-Received: by 2002:a05:6102:3a0c:: with SMTP id
 b12mr356728vsu.13.1633021154469; 
 Thu, 30 Sep 2021 09:59:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyoOVzSGkpdfrt4B7+Sq5FEVy5L16bzzfYgySBU1MHVZeFXW2+c4pqPAqAnSZK+SrLFEYCcBhRxCaTNKaKoZE=
X-Received: by 2002:a05:6102:3a0c:: with SMTP id
 b12mr356691vsu.13.1633021154252; 
 Thu, 30 Sep 2021 09:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210929194428.1038496-1-jsnow@redhat.com>
 <20210929194428.1038496-9-jsnow@redhat.com>
 <87tui2qudc.fsf@dusky.pond.sub.org>
In-Reply-To: <87tui2qudc.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 30 Sep 2021 12:59:03 -0400
Message-ID: <CAFn=p-Z3ag-3hSgc0R1o_gSLsFUwCuGzPnPr_Lrj7qbtBLUWwA@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] qapi/parser: Introduce NullSection
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000cf718705cd395d01"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

--000000000000cf718705cd395d01
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 30, 2021 at 5:35 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > Here's the weird bit. QAPIDoc generally expects -- virtually everywhere
> > -- that it will always have a current section. The sole exception to
> > this is in the case that end_comment() is called, which leaves us with
> > *no* section. However, in this case, we also don't expect to actually
> > ever mutate the comment contents ever again.
> >
> > NullSection is just a Null-object that allows us to maintain the
> > invariant that we *always* have a current section, enforced by static
> > typing -- allowing us to type that field as QAPIDoc.Section instead of
> > the more ambiguous Optional[QAPIDoc.Section].
> >
> > end_section is renamed to switch_section and now accepts as an argument
> > the new section to activate, clarifying that no callers ever just
> > unilaterally end a section; they only do so when starting a new section.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> >
> > ---
> >
> > For my money: Optional types can be a nuisance because an unfamiliar
> > reader may wonder in what circumstances the field may be unset. This
> > makes the condition quite a bit more explicit and statically provable.
> >
> > Doing it in this way (and not by creating a dummy section) will also
>

("And not by creating a [mutable] dummy section" ... but this wasn't
destined for the git log anyway.)


> > continue to reject (rather noisily) any erroneous attempts to append
> > additional lines after end_comment() has been called.
> >
> > Also, this section isn't indexed into .sections[] and isn't really
> > visible in any way to external users of the class, so it seems like a
> > harmless and low-cost way to formalize the "life cycle" of a QAPIDoc
> > parser.
> >
> > Clean and clear as I can make it, in as few lines as I could muster.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  scripts/qapi/parser.py | 27 ++++++++++++++++-----------
> >  1 file changed, 16 insertions(+), 11 deletions(-)
> >
> > diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> > index 1fdc5bc7056..123fc2f099c 100644
> > --- a/scripts/qapi/parser.py
> > +++ b/scripts/qapi/parser.py
> > @@ -478,6 +478,13 @@ def __init__(self, parser, name, indent=0):
> >          def connect(self, member):
> >              self.member = member
> >
> > +    class NullSection(Section):
> > +        """
> > +        Empty section that signifies the end of a doc block.
>
> What about "Dummy section for use at the end of a doc block"?
>
>
Sure. "Immutable dummy section for use at the end of a doc block."


> > +        """
> > +        def append(self, line):
> > +            assert False, "BUG: Text appended after end_comment()
> called."
>
> How can a failing assertion *not* be a bug?
>
>
Haha. I'll drop the prefix. (I'll update my branch with these tiny edits
and you can decide what you'd like to do with that.)


> > +
> >      def __init__(self, parser, info):
> >          # self._parser is used to report errors with QAPIParseError.
> The
> >          # resulting error position depends on the state of the parser.
> > @@ -525,7 +532,7 @@ def append(self, line):
> >          self._append_line(line)
> >
> >      def end_comment(self):
> > -        self._end_section()
> > +        self._switch_section(QAPIDoc.NullSection(self._parser))
> >
> >      @staticmethod
> >      def _is_section_tag(name):
> > @@ -702,9 +709,9 @@ def _start_symbol_section(self, symbols_dict, name,
> indent):
> >              raise QAPIParseError(self._parser,
> >                                   "'%s' parameter name duplicated" %
> name)
> >          assert not self.sections
> > -        self._end_section()
> > -        self._section = QAPIDoc.ArgSection(self._parser, name, indent)
> > -        symbols_dict[name] = self._section
> > +        new_section = QAPIDoc.ArgSection(self._parser, name, indent)
> > +        self._switch_section(new_section)
> > +        symbols_dict[name] = new_section
> >
> >      def _start_args_section(self, name, indent):
> >          self._start_symbol_section(self.args, name, indent)
> > @@ -716,13 +723,11 @@ def _start_section(self, name=None, indent=0):
> >          if name in ('Returns', 'Since') and self.has_section(name):
> >              raise QAPIParseError(self._parser,
> >                                   "duplicated '%s' section" % name)
> > -        self._end_section()
> > -        self._section = QAPIDoc.Section(self._parser, name, indent)
> > -        self.sections.append(self._section)
> > -
> > -    def _end_section(self):
> > -        assert self._section is not None
> > +        new_section = QAPIDoc.Section(self._parser, name, indent)
> > +        self._switch_section(new_section)
> > +        self.sections.append(new_section)
> >
> > +    def _switch_section(self, new_section):
> >          text = self._section.text = self._section.text.strip()
> >
> >          # Only the 'body' section is allowed to have an empty body.
> > @@ -735,7 +740,7 @@ def _end_section(self):
> >                  self._parser,
> >                  "empty doc section '%s'" % self._section.name)
> >
> > -        self._section = None
> > +        self._section = new_section
> >
> >      def _append_freeform(self, line):
> >          match = re.match(r'(@\S+:)', line)
>
> Feels clearer, thanks!
>
>
Relieved you think so O:-)

--js

--000000000000cf718705cd395d01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 30, 2021 at 5:35 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">John=
 Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redha=
t.com</a>&gt; writes:<br>
<br>
&gt; Here&#39;s the weird bit. QAPIDoc generally expects -- virtually every=
where<br>
&gt; -- that it will always have a current section. The sole exception to<b=
r>
&gt; this is in the case that end_comment() is called, which leaves us with=
<br>
&gt; *no* section. However, in this case, we also don&#39;t expect to actua=
lly<br>
&gt; ever mutate the comment contents ever again.<br>
&gt;<br>
&gt; NullSection is just a Null-object that allows us to maintain the<br>
&gt; invariant that we *always* have a current section, enforced by static<=
br>
&gt; typing -- allowing us to type that field as QAPIDoc.Section instead of=
<br>
&gt; the more ambiguous Optional[QAPIDoc.Section].<br>
&gt;<br>
&gt; end_section is renamed to switch_section and now accepts as an argumen=
t<br>
&gt; the new section to activate, clarifying that no callers ever just<br>
&gt; unilaterally end a section; they only do so when starting a new sectio=
n.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; For my money: Optional types can be a nuisance because an unfamiliar<b=
r>
&gt; reader may wonder in what circumstances the field may be unset. This<b=
r>
&gt; makes the condition quite a bit more explicit and statically provable.=
<br>
&gt;<br>
&gt; Doing it in this way (and not by creating a dummy section) will also<b=
r></blockquote><div><br></div><div>(&quot;And not by creating a [mutable] d=
ummy section&quot; ... but this wasn&#39;t destined for the git log anyway.=
)<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
&gt; continue to reject (rather noisily) any erroneous attempts to append<b=
r>
&gt; additional lines after end_comment() has been called.<br>
&gt;<br>
&gt; Also, this section isn&#39;t indexed into .sections[] and isn&#39;t re=
ally<br>
&gt; visible in any way to external users of the class, so it seems like a<=
br>
&gt; harmless and low-cost way to formalize the &quot;life cycle&quot; of a=
 QAPIDoc<br>
&gt; parser.<br>
&gt;<br>
&gt; Clean and clear as I can make it, in as few lines as I could muster.<b=
r>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/parser.py | 27 ++++++++++++++++-----------<br>
&gt;=C2=A0 1 file changed, 16 insertions(+), 11 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py<br>
&gt; index 1fdc5bc7056..123fc2f099c 100644<br>
&gt; --- a/scripts/qapi/parser.py<br>
&gt; +++ b/scripts/qapi/parser.py<br>
&gt; @@ -478,6 +478,13 @@ def __init__(self, parser, name, indent=3D0):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def connect(self, member):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.member =3D member=
<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 class NullSection(Section):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Empty section that signifies the end of a=
 doc block.<br>
<br>
What about &quot;Dummy section for use at the end of a doc block&quot;?<br>
<br></blockquote><div><br></div><div>Sure. &quot;Immutable dummy section fo=
r use at the end of a doc block.&quot;<br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def append(self, line):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert False, &quot;BUG: Te=
xt appended after end_comment() called.&quot;<br>
<br>
How can a failing assertion *not* be a bug?<br>
<br></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">Haha. I&#39;ll drop the prefix. (I&#39;ll update my branch with=
 these tiny edits and you can decide what you&#39;d like to do with that.)<=
br></div>=C2=A0<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def __init__(self, parser, info):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # self._parser is used to report err=
ors with QAPIParseError.=C2=A0 The<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # resulting error position depends o=
n the state of the parser.<br>
&gt; @@ -525,7 +532,7 @@ def append(self, line):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._append_line(line)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def end_comment(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._end_section()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._switch_section(QAPIDoc.NullSection(=
self._parser))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 @staticmethod<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _is_section_tag(name):<br>
&gt; @@ -702,9 +709,9 @@ def _start_symbol_section(self, symbols_dict, name=
, indent):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPIParseError(s=
elf._parser,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&#39;%s&#39; p=
arameter name duplicated&quot; % name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert not self.sections<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._end_section()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._section =3D QAPIDoc.ArgSection(self=
._parser, name, indent)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 symbols_dict[name] =3D self._section<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_section =3D QAPIDoc.ArgSection(self._=
parser, name, indent)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._switch_section(new_section)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 symbols_dict[name] =3D new_section<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _start_args_section(self, name, indent):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._start_symbol_section(self.args=
, name, indent)<br>
&gt; @@ -716,13 +723,11 @@ def _start_section(self, name=3DNone, indent=3D0=
):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name in (&#39;Returns&#39;, &#39;=
Since&#39;) and self.has_section(name):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPIParseError(s=
elf._parser,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;duplicated &#3=
9;%s&#39; section&quot; % name)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._end_section()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._section =3D QAPIDoc.Section(self._p=
arser, name, indent)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sections.append(self._section)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 def _end_section(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self._section is not None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_section =3D QAPIDoc.Section(self._par=
ser, name, indent)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._switch_section(new_section)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sections.append(new_section)<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 def _switch_section(self, new_section):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 text =3D self._section.text =3D self=
._section.text.strip()<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Only the &#39;body&#39; section is=
 allowed to have an empty body.<br>
&gt; @@ -735,7 +740,7 @@ def _end_section(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._pa=
rser,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;em=
pty doc section &#39;%s&#39;&quot; % self._<a href=3D"http://section.name" =
rel=3D"noreferrer" target=3D"_blank">section.name</a>)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._section =3D None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._section =3D new_section<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _append_freeform(self, line):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D re.match(r&#39;(@\S+:)&#39=
;, line)<br>
<br>
Feels clearer, thanks!<br>
<br></blockquote><div><br></div><div>Relieved you think so O:-)</div><div><=
br></div><div>--js<br></div></div></div>

--000000000000cf718705cd395d01--


