Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7678068F675
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 19:02:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPola-0004Ps-6D; Wed, 08 Feb 2023 13:01:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPolX-0004PG-FM
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:01:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPolU-0006vL-LP
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675879311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w5ln7WAij5oFlJzlEdaxDrBNhvwtk5lZXPQaPdoP2yE=;
 b=A3SJc7wA3FWQrvZ6fGjYK5WClMRUMSteIftkmZpADgyzPHjQcYrC9EjZ2k+avaNSb2Sznh
 /vwstLBGpsrgIzXAjdkbzYjMtYONiYmM0CcjibtzuyaDo4cW1iEIzBzfuJggfd8l7Yk+Qe
 LTFOFZTsYMkzEpmnFJJ507ebHC6HBdc=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-272-GFNiTUgBO262RR_XD84Kyw-1; Wed, 08 Feb 2023 13:01:50 -0500
X-MC-Unique: GFNiTUgBO262RR_XD84Kyw-1
Received: by mail-pg1-f200.google.com with SMTP id
 63-20020a630542000000b004fb3982dd50so740703pgf.8
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 10:01:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w5ln7WAij5oFlJzlEdaxDrBNhvwtk5lZXPQaPdoP2yE=;
 b=6KANY+84Jnh7o6XuL+2ToZy2rkdyToMtL1f+jtquh1x8hB4uEPPSGsXiYZAJl9xR2x
 y7NeoI6ob9ZbBsMpHmxPeWekqwh9HF/S5jcSVIrjDOR8IcijbQVxlIVdwg7WRrWCRk74
 tO90i5m9dK9/PhKyla1SrE5D1E3yT1FQazQ2Bj0GLgNAhC+VLLCDrPWmTQHMc+chXL/U
 fIkw0rL+EpZi7CYT6pUzJqbnUuKK/WMBSIWE3XarwSgz+DD8DI6ZWyOsHFEFcfg9YVlF
 9I9RLzZ4jlf0cufoPMwVAj+rDJkhRLQn8STx8YB0IeBVT4+Eq1IDPl2r2S4/vTltcWBp
 bTNQ==
X-Gm-Message-State: AO0yUKUUj5mH62icGbTWMkk/C5c3eSdTQ6t+e8NR+z232XWVqN5COxHj
 zjjhIK8Gh/hL3Zgn5WiS87UP80uTMi/f5vQ2fd+oL4GDUJEhDXY8usr35e/DIWkOclNdJCDxZJJ
 UisGZyxGP49NrmxcADVPzN6Je3kHeJq0=
X-Received: by 2002:a17:902:9890:b0:199:3483:e920 with SMTP id
 s16-20020a170902989000b001993483e920mr1741933plp.33.1675879309158; 
 Wed, 08 Feb 2023 10:01:49 -0800 (PST)
X-Google-Smtp-Source: AK7set/RWrObKdWDHZkH7o7YW0hfne/k5sAh6FWCWZsGWjKih0jIpFn8XuJ6vVQH4LUXoUtTImxmWxA9jcxU0JDiyi8=
X-Received: by 2002:a17:902:9890:b0:199:3483:e920 with SMTP id
 s16-20020a170902989000b001993483e920mr1741922plp.33.1675879308763; Wed, 08
 Feb 2023 10:01:48 -0800 (PST)
MIME-Version: 1.0
References: <20230208021306.870657-1-jsnow@redhat.com>
 <20230208021306.870657-3-jsnow@redhat.com>
 <87sffguo71.fsf@pond.sub.org>
In-Reply-To: <87sffguo71.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 8 Feb 2023 13:01:37 -0500
Message-ID: <CAFn=p-aR_eP8XbKUVEnFsnwRqPWmOZ-4bhypACf+rCq7bePEkQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] qapi/parser.py: add ParsedExpression type
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="000000000000e2beb005f4340e2f"
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

--000000000000e2beb005f4340e2f
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 8, 2023, 11:17 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > This is an immutable, named, typed tuple. It's arguably nicer than
> > arbitrary dicts for passing data around when using strict typing.
> >
> > This patch turns parser.exprs into a list of ParsedExpressions instead,
> > and adjusts expr.py to match.
> >
> > This allows the types we specify in parser.py to be "remembered" all the
> > way through expr.py and into schema.py. Several assertions around
> > packing and unpacking this data can be removed as a result.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  scripts/qapi/expr.py   | 29 +++++++++--------------------
> >  scripts/qapi/parser.py | 29 ++++++++++++++++++-----------
> >  scripts/qapi/schema.py |  6 +++---
> >  3 files changed, 30 insertions(+), 34 deletions(-)
> >
> > diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> > index d01543006d8..293f830fe9d 100644
> > --- a/scripts/qapi/expr.py
> > +++ b/scripts/qapi/expr.py
> > @@ -44,7 +44,7 @@
> >
> >  from .common import c_name
> >  from .error import QAPISemError
> > -from .parser import QAPIDoc
> > +from .parser import ParsedExpression
> >  from .source import QAPISourceInfo
> >
> >
> > @@ -595,29 +595,17 @@ def check_event(expr: _JSONObject, info:
> QAPISourceInfo) -> None:
> >      check_type(args, info, "'data'", allow_dict=not boxed)
> >
> >
> > -def check_expr(expr_elem: _JSONObject) -> None:
> > +def check_expr(pexpr: ParsedExpression) -> None:
> >      """
> > -    Validate and normalize a parsed QAPI schema expression.
> > +    Validate and normalize a `ParsedExpression`.
>
> Doc comment style question: what's our attitude towards repeating (parts
> of) the function signature in its doc comment?
>
> In general, I dislike comments that merely rephrase code as prose.
>

Me too, I've never found a doc system that gets it exactly right... I don't
like the duplication.

For the sake of tooltips and help docs that might be removed from code, I
often feel compelled to write something. Sometimes I value the consistency
over the DRY violation.

I dunno. I struggle with it.


> Untyped Python builds a habit of mentioning the types in the doc
> comment.  That's additional information.  In typed Python, it's
> rephrased information.
>
> Keeping the old line would be just fine with me.
>

The only reason I have this habit is because I have an obsession with
cross-references, really. I love clickables. love 'em!

Though it's probably true that the type signature would suffice for giving
you a clickable.

Looking at
https://qemu.readthedocs.io/projects/python-qemu-qmp/en/latest/overview.html
... yeah, the signatures are clickable. OK, I can cut it out. probably. I
guess. perhaps.


> >
> > -    :param expr_elem: The parsed expression to normalize and validate.
> > +    :param pexpr: The parsed expression to normalize and validate.
> >
> >      :raise QAPISemError: When this expression fails validation.
> > -    :return: None, ``expr`` is normalized in-place as needed.
> > +    :return: None, ``pexpr`` is normalized in-place as needed.
> >      """
> > -    # Expression
> > -    assert isinstance(expr_elem['expr'], dict)
> > -    for key in expr_elem['expr'].keys():
> > -        assert isinstance(key, str)
> > -    expr: _JSONObject = expr_elem['expr']
> > -
> > -    # QAPISourceInfo
> > -    assert isinstance(expr_elem['info'], QAPISourceInfo)
> > -    info: QAPISourceInfo = expr_elem['info']
> > -
> > -    # Optional[QAPIDoc]
> > -    tmp = expr_elem.get('doc')
> > -    assert tmp is None or isinstance(tmp, QAPIDoc)
> > -    doc: Optional[QAPIDoc] = tmp
> > +    expr = pexpr.expr
> > +    info = pexpr.info
> >
> >      if 'include' in expr:
> >          return
> > @@ -637,6 +625,7 @@ def check_expr(expr_elem: _JSONObject) -> None:
> >      info.set_defn(meta, name)
> >      check_defn_name_str(name, info, meta)
> >
> > +    doc = pexpr.doc
> >      if doc:
> >          if doc.symbol != name:
> >              raise QAPISemError(
> > @@ -688,7 +677,7 @@ def check_expr(expr_elem: _JSONObject) -> None:
> >      check_flags(expr, info)
> >
> >
> > -def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
> > +def check_exprs(exprs: List[ParsedExpression]) ->
> List[ParsedExpression]:
> >      """
> >      Validate and normalize a list of parsed QAPI schema expressions.
> >
> > diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> > index 1b006cdc133..f897dffbfd4 100644
> > --- a/scripts/qapi/parser.py
> > +++ b/scripts/qapi/parser.py
> > @@ -21,6 +21,7 @@
> >      TYPE_CHECKING,
> >      Dict,
> >      List,
> > +    NamedTuple,
> >      Optional,
> >      Set,
> >      Union,
> > @@ -48,6 +49,12 @@
> >  # several modules.
> >
> >
> > +class ParsedExpression(NamedTuple):
> > +    expr: TopLevelExpr
> > +    info: QAPISourceInfo
> > +    doc: Optional['QAPIDoc']
> > +
> > +
> >  class QAPIParseError(QAPISourceError):
> >      """Error class for all QAPI schema parsing errors."""
> >      def __init__(self, parser: 'QAPISchemaParser', msg: str):
> > @@ -100,7 +107,7 @@ def __init__(self,
> >          self.line_pos = 0
> >
> >          # Parser output:
> > -        self.exprs: List[Dict[str, object]] = []
> > +        self.exprs: List[ParsedExpression] = []
> >          self.docs: List[QAPIDoc] = []
> >
> >          # Showtime!
> > @@ -147,8 +154,7 @@ def _parse(self) -> None:
> >                                         "value of 'include' must be a
> string")
> >                  incl_fname = os.path.join(os.path.dirname(self._fname),
> >                                            include)
> > -                self.exprs.append({'expr': {'include': incl_fname},
> > -                                   'info': info})
> > +                self._add_expr(OrderedDict({'include': incl_fname}),
> info)
> >                  exprs_include = self._include(include, info, incl_fname,
> >                                                self._included)
> >                  if exprs_include:
> > @@ -165,17 +171,18 @@ def _parse(self) -> None:
> >                  for name, value in pragma.items():
> >                      self._pragma(name, value, info)
> >              else:
> > -                expr_elem = {'expr': expr,
> > -                             'info': info}
> > -                if cur_doc:
> > -                    if not cur_doc.symbol:
> > -                        raise QAPISemError(
> > -                            cur_doc.info, "definition documentation
> required")
> > -                    expr_elem['doc'] = cur_doc
> > -                self.exprs.append(expr_elem)
> > +                if cur_doc and not cur_doc.symbol:
> > +                    raise QAPISemError(
> > +                        cur_doc.info, "definition documentation
> required")
> > +                self._add_expr(expr, info, cur_doc)
> >              cur_doc = None
> >          self.reject_expr_doc(cur_doc)
> >
> > +    def _add_expr(self, expr: TopLevelExpr,
> > +                  info: QAPISourceInfo,
> > +                  doc: Optional['QAPIDoc'] = None) -> None:
> > +        self.exprs.append(ParsedExpression(expr, info, doc))
> > +
> >      @staticmethod
> >      def reject_expr_doc(doc: Optional['QAPIDoc']) -> None:
> >          if doc and doc.symbol:
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index cd8661125cd..89f8e60db36 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -1168,9 +1168,9 @@ def _def_event(self, expr, info, doc):
> >
> >      def _def_exprs(self, exprs):
> >          for expr_elem in exprs:
>
> Rename @expr_elem to @pexpr for consistency with check_expr()?
>

OK, will address when reordering/squashing


> > -            expr = expr_elem['expr']
> > -            info = expr_elem['info']
> > -            doc = expr_elem.get('doc')
> > +            expr = expr_elem.expr
> > +            info = expr_elem.info
> > +            doc = expr_elem.doc
> >              if 'enum' in expr:
> >                  self._def_enum_type(expr, info, doc)
> >              elif 'struct' in expr:
>
>

--000000000000e2beb005f4340e2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Feb 8, 2023, 11:17 AM Markus Armbruster &lt;<a=
 href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">John Snow &lt;<a href=3D"mailto:jsnow@redh=
at.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt; write=
s:<br>
<br>
&gt; This is an immutable, named, typed tuple. It&#39;s arguably nicer than=
<br>
&gt; arbitrary dicts for passing data around when using strict typing.<br>
&gt;<br>
&gt; This patch turns parser.exprs into a list of ParsedExpressions instead=
,<br>
&gt; and adjusts expr.py to match.<br>
&gt;<br>
&gt; This allows the types we specify in parser.py to be &quot;remembered&q=
uot; all the<br>
&gt; way through expr.py and into schema.py. Several assertions around<br>
&gt; packing and unpacking this data can be removed as a result.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/expr.py=C2=A0 =C2=A0| 29 +++++++++-----------------=
---<br>
&gt;=C2=A0 scripts/qapi/parser.py | 29 ++++++++++++++++++-----------<br>
&gt;=C2=A0 scripts/qapi/schema.py |=C2=A0 6 +++---<br>
&gt;=C2=A0 3 files changed, 30 insertions(+), 34 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py<br>
&gt; index d01543006d8..293f830fe9d 100644<br>
&gt; --- a/scripts/qapi/expr.py<br>
&gt; +++ b/scripts/qapi/expr.py<br>
&gt; @@ -44,7 +44,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 from .common import c_name<br>
&gt;=C2=A0 from .error import QAPISemError<br>
&gt; -from .parser import QAPIDoc<br>
&gt; +from .parser import ParsedExpression<br>
&gt;=C2=A0 from .source import QAPISourceInfo<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; @@ -595,29 +595,17 @@ def check_event(expr: _JSONObject, info: QAPISou=
rceInfo) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 check_type(args, info, &quot;&#39;data&#39;&quot;,=
 allow_dict=3Dnot boxed)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -def check_expr(expr_elem: _JSONObject) -&gt; None:<br>
&gt; +def check_expr(pexpr: ParsedExpression) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 Validate and normalize a parsed QAPI schema expression.=
<br>
&gt; +=C2=A0 =C2=A0 Validate and normalize a `ParsedExpression`.<br>
<br>
Doc comment style question: what&#39;s our attitude towards repeating (part=
s<br>
of) the function signature in its doc comment?<br>
<br>
In general, I dislike comments that merely rephrase code as prose.<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Me too, I=
&#39;ve never found a doc system that gets it exactly right... I don&#39;t =
like the duplication.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">For the sake of tooltips and help docs that might be removed from code,=
 I often feel compelled to write something. Sometimes I value the consisten=
cy over the DRY violation.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">I dunno. I struggle with it.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Untyped Python builds a habit of mentioning the types in the doc<br>
comment.=C2=A0 That&#39;s additional information.=C2=A0 In typed Python, it=
&#39;s<br>
rephrased information.<br>
<br>
Keeping the old line would be just fine with me.<br></blockquote></div></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">The only reason I have this=
 habit is because I have an obsession with cross-references, really. I love=
 clickables. love &#39;em!</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Though it&#39;s probably true that the type signature would suffice for =
giving you a clickable.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Looking at=C2=A0<a href=3D"https://qemu.readthedocs.io/projects/python-qemu=
-qmp/en/latest/overview.html">https://qemu.readthedocs.io/projects/python-q=
emu-qmp/en/latest/overview.html</a> ... yeah, the signatures are clickable.=
 OK, I can cut it out. probably. I guess. perhaps.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 :param expr_elem: The parsed expression to normalize an=
d validate.<br>
&gt; +=C2=A0 =C2=A0 :param pexpr: The parsed expression to normalize and va=
lidate.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 :raise QAPISemError: When this expression fails va=
lidation.<br>
&gt; -=C2=A0 =C2=A0 :return: None, ``expr`` is normalized in-place as neede=
d.<br>
&gt; +=C2=A0 =C2=A0 :return: None, ``pexpr`` is normalized in-place as need=
ed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 # Expression<br>
&gt; -=C2=A0 =C2=A0 assert isinstance(expr_elem[&#39;expr&#39;], dict)<br>
&gt; -=C2=A0 =C2=A0 for key in expr_elem[&#39;expr&#39;].keys():<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert isinstance(key, str)<br>
&gt; -=C2=A0 =C2=A0 expr: _JSONObject =3D expr_elem[&#39;expr&#39;]<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 # QAPISourceInfo<br>
&gt; -=C2=A0 =C2=A0 assert isinstance(expr_elem[&#39;info&#39;], QAPISource=
Info)<br>
&gt; -=C2=A0 =C2=A0 info: QAPISourceInfo =3D expr_elem[&#39;info&#39;]<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 # Optional[QAPIDoc]<br>
&gt; -=C2=A0 =C2=A0 tmp =3D expr_elem.get(&#39;doc&#39;)<br>
&gt; -=C2=A0 =C2=A0 assert tmp is None or isinstance(tmp, QAPIDoc)<br>
&gt; -=C2=A0 =C2=A0 doc: Optional[QAPIDoc] =3D tmp<br>
&gt; +=C2=A0 =C2=A0 expr =3D pexpr.expr<br>
&gt; +=C2=A0 =C2=A0 info =3D <a href=3D"http://pexpr.info" rel=3D"noreferre=
r noreferrer" target=3D"_blank">pexpr.info</a><br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if &#39;include&#39; in expr:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; @@ -637,6 +625,7 @@ def check_expr(expr_elem: _JSONObject) -&gt; None:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 info.set_defn(meta, name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 check_defn_name_str(name, info, meta)<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 doc =3D pexpr.doc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if doc:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if doc.symbol !=3D name:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br=
>
&gt; @@ -688,7 +677,7 @@ def check_expr(expr_elem: _JSONObject) -&gt; None:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 check_flags(expr, info)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -def check_exprs(exprs: List[_JSONObject]) -&gt; List[_JSONObject]:<br=
>
&gt; +def check_exprs(exprs: List[ParsedExpression]) -&gt; List[ParsedExpre=
ssion]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Validate and normalize a list of parsed QAPI schem=
a expressions.<br>
&gt;=C2=A0 <br>
&gt; diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py<br>
&gt; index 1b006cdc133..f897dffbfd4 100644<br>
&gt; --- a/scripts/qapi/parser.py<br>
&gt; +++ b/scripts/qapi/parser.py<br>
&gt; @@ -21,6 +21,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TYPE_CHECKING,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Dict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 List,<br>
&gt; +=C2=A0 =C2=A0 NamedTuple,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Optional,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Set,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Union,<br>
&gt; @@ -48,6 +49,12 @@<br>
&gt;=C2=A0 # several modules.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; +class ParsedExpression(NamedTuple):<br>
&gt; +=C2=A0 =C2=A0 expr: TopLevelExpr<br>
&gt; +=C2=A0 =C2=A0 info: QAPISourceInfo<br>
&gt; +=C2=A0 =C2=A0 doc: Optional[&#39;QAPIDoc&#39;]<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 class QAPIParseError(QAPISourceError):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Error class for all QAPI schema =
parsing errors.&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def __init__(self, parser: &#39;QAPISchemaParser&#=
39;, msg: str):<br>
&gt; @@ -100,7 +107,7 @@ def __init__(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.line_pos =3D 0<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Parser output:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.exprs: List[Dict[str, object]] =3D [=
]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.exprs: List[ParsedExpression] =3D []=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.docs: List[QAPIDoc] =3D []<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Showtime!<br>
&gt; @@ -147,8 +154,7 @@ def _parse(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;value of &#39;include&#39; must be a string&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 incl_fna=
me =3D os.path.join(os.path.dirname(self._fname),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 include)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.exprs.ap=
pend({&#39;expr&#39;: {&#39;include&#39;: incl_fname},<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;info&#39;: inf=
o})<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._add_exp=
r(OrderedDict({&#39;include&#39;: incl_fname}), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exprs_in=
clude =3D self._include(include, info, incl_fname,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 self._included)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if exprs=
_include:<br>
&gt; @@ -165,17 +171,18 @@ def _parse(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for name=
, value in pragma.items():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self._pragma(name, value, info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expr_elem =3D=
 {&#39;expr&#39;: expr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;info&#39;: info}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cur_doc:<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if not cur_doc.symbol:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 raise QAPISemError(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://cur_doc.info" rel=3D"norefer=
rer noreferrer" target=3D"_blank">cur_doc.info</a>, &quot;definition docume=
ntation required&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 expr_elem[&#39;doc&#39;] =3D cur_doc<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.exprs.ap=
pend(expr_elem)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cur_doc an=
d not cur_doc.symbol:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 raise QAPISemError(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 <a href=3D"http://cur_doc.info" rel=3D"noreferrer noreferrer=
" target=3D"_blank">cur_doc.info</a>, &quot;definition documentation requir=
ed&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._add_exp=
r(expr, info, cur_doc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_doc =3D None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.reject_expr_doc(cur_doc)<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 def _add_expr(self, expr: TopLevelExpr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info: =
QAPISourceInfo,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 doc: O=
ptional[&#39;QAPIDoc&#39;] =3D None) -&gt; None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.exprs.append(ParsedExpression(expr, =
info, doc))<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 @staticmethod<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def reject_expr_doc(doc: Optional[&#39;QAPIDoc&#39=
;]) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if doc and doc.symbol:<br>
&gt; diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
&gt; index cd8661125cd..89f8e60db36 100644<br>
&gt; --- a/scripts/qapi/schema.py<br>
&gt; +++ b/scripts/qapi/schema.py<br>
&gt; @@ -1168,9 +1168,9 @@ def _def_event(self, expr, info, doc):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _def_exprs(self, exprs):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for expr_elem in exprs:<br>
<br>
Rename @expr_elem to @pexpr for consistency with check_expr()?<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">OK, will addr=
ess when reordering/squashing</div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expr =3D expr_elem[&#39;exp=
r&#39;]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info =3D expr_elem[&#39;inf=
o&#39;]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 doc =3D expr_elem.get(&#39;=
doc&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expr =3D expr_elem.expr<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info =3D <a href=3D"http://=
expr_elem.info" rel=3D"noreferrer noreferrer" target=3D"_blank">expr_elem.i=
nfo</a><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 doc =3D expr_elem.doc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;enum&#39; in e=
xpr:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._de=
f_enum_type(expr, info, doc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif &#39;struct&#39; =
in expr:<br>
<br>
</blockquote></div></div></div>

--000000000000e2beb005f4340e2f--


