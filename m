Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E963DFCC1
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:24:54 +0200 (CEST)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCCr-0006n9-Cn
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCBI-0003iz-AO
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:23:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCBC-0002vh-As
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628065389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4dc1yUmo3eZ9Csq4ti2aot0Ldp8qcPYlBRCZ+bkv++o=;
 b=OwibpilogiPJS1rwOmTJ843I5Bm4G1tZfHwXUQezpFThaPTJO1p7xPNKbAzS+RHhUpC89x
 NsYjKR5oj6BG09gGnYa58p9x3zrSgdJ12lJez0W3wMQi1GSm9vIkn3VCYPFILVwQ2SPaAK
 TUwyet130jiaXMxVedp+TAA8bfUXWPA=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-FaaqnKQIOtmti911PNcRNA-1; Wed, 04 Aug 2021 04:23:02 -0400
X-MC-Unique: FaaqnKQIOtmti911PNcRNA-1
Received: by mail-pl1-f198.google.com with SMTP id
 j5-20020a170902da85b029012c4287ea54so1546957plx.22
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 01:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4dc1yUmo3eZ9Csq4ti2aot0Ldp8qcPYlBRCZ+bkv++o=;
 b=VNwzGIe+DlVXfET27cfuAqMPpcs3N2hssksymelxhrJkbC46VSTYZ8J52lCRRovVhz
 Ptv/9TvzlrrQI91dYBZDnPuU7i/oaynnx1EJ6CG/A6k0aJktu5rb13p5owZqD96Fc38c
 I3tXA0BZ+3Cf47CJJxZvKhekO4dg3wsQD7J092b8HgMzjalmsFg35RbxMhSCArm4XIkV
 7V++ikag3DmP1+07gsqporSgkMEn01l6X1Y0XJOv+xPdGigqbbcq6Xbt9sGU9s2CutEz
 PUxx9QokoL+WevY8OTst+YueD0d4hyEufgY1TmWOUtIlWEbrPYxsWc+PV5jWY5JSFk9L
 3jBw==
X-Gm-Message-State: AOAM532cRpt+BW2oc/QgVmSRs33ueO5RpXBtNcedAxmHVGW60YHuTUBs
 UcbtNYjHYy69G4oacwu44fzlGp4B8pJGLFAIuvTYzFBMQiFQxy0zipq0TN9pnQV0M3yq4eMwlKP
 xxIiymOwIVWM7qTkJ6VXdwVbpuSIvRco=
X-Received: by 2002:a17:90a:d251:: with SMTP id
 o17mr27414268pjw.200.1628065380822; 
 Wed, 04 Aug 2021 01:23:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1+Fcv9feiYy4DUH3xAujlWJy6BhDQ4810l+6xr45v5u+aNpY698cphfKPk9fht9PK4oOU48P2aiMxRnvwxTw=
X-Received: by 2002:a17:90a:d251:: with SMTP id
 o17mr27414247pjw.200.1628065380541; 
 Wed, 04 Aug 2021 01:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-3-marcandre.lureau@redhat.com>
 <87czqwtd5v.fsf@dusky.pond.sub.org>
In-Reply-To: <87czqwtd5v.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 4 Aug 2021 12:22:48 +0400
Message-ID: <CAMxuvawv2-=90LUt_ByMhwckAcH=3M4h3oQvCoFbk=qavrfjWg@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] qapi: wrap Sequence[str] in an object
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000adbf2705c8b782a3"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=ham autolearn_force=no
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

--000000000000adbf2705c8b782a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Aug 2, 2021 at 1:21 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Except for the special casing assert in _make_implicit_object_type(),
> > which needs to handle schema objects, it's a mechanical change.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  docs/sphinx/qapidoc.py         | 10 +++---
> >  scripts/qapi/commands.py       |  4 +--
> >  scripts/qapi/events.py         |  5 +--
> >  scripts/qapi/gen.py            | 14 ++++----
> >  scripts/qapi/introspect.py     | 26 +++++++-------
> >  scripts/qapi/schema.py         | 66 +++++++++++++++++++++-------------
> >  scripts/qapi/types.py          | 33 ++++++++---------
> >  scripts/qapi/visit.py          | 23 ++++++------
> >  tests/qapi-schema/test-qapi.py |  4 +--
> >  9 files changed, 103 insertions(+), 82 deletions(-)
> >
> > diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> > index 87c67ab23f..0eac3308b2 100644
> > --- a/docs/sphinx/qapidoc.py
> > +++ b/docs/sphinx/qapidoc.py
> > @@ -116,7 +116,7 @@ def _nodes_for_ifcond(self, ifcond, with_if=3DTrue)=
:
> >          the conditions are in literal-text and the commas are not.
> >          If with_if is False, we don't return the "(If: " and ")".
> >          """
> > -        condlist =3D intersperse([nodes.literal('', c) for c in ifcond=
],
> > +        condlist =3D intersperse([nodes.literal('', c) for c in
> ifcond.ifcond],
>
> Mechanical pattern #1: ifcond becomes ifcond.ifcond to peel off the new
> wrapper.  ifcond.ifcond is ugly, but almost all instances go away in
> this series.  I'm okay with the remainder.
>
> >                                 nodes.Text(', '))
> >          if not with_if:
> >              return condlist
> > @@ -139,7 +139,7 @@ def _nodes_for_one_member(self, member):
> >              term.append(nodes.literal('', member.type.doc_type()))
> >          if member.optional:
> >              term.append(nodes.Text(' (optional)'))
> > -        if member.ifcond:
> > +        if member.ifcond.ifcond:
> >              term.extend(self._nodes_for_ifcond(member.ifcond))
> >          return term
> >
> > @@ -154,7 +154,7 @@ def _nodes_for_variant_when(self, variants, variant=
):
> >                  nodes.literal('', variants.tag_member.name),
> >                  nodes.Text(' is '),
> >                  nodes.literal('', '"%s"' % variant.name)]
> > -        if variant.ifcond:
> > +        if variant.ifcond.ifcond:
> >              term.extend(self._nodes_for_ifcond(variant.ifcond))
> >          return term
> >
> > @@ -209,7 +209,7 @@ def _nodes_for_enum_values(self, doc):
> >          dlnode =3D nodes.definition_list()
> >          for section in doc.args.values():
> >              termtext =3D [nodes.literal('', section.member.name)]
> > -            if section.member.ifcond:
> > +            if section.member.ifcond.ifcond:
> >
> termtext.extend(self._nodes_for_ifcond(section.member.ifcond))
> >              # TODO drop fallbacks when undocumented members are outlaw=
ed
> >              if section.text:
> > @@ -277,7 +277,7 @@ def _nodes_for_sections(self, doc):
> >      def _nodes_for_if_section(self, ifcond):
> >          """Return list of doctree nodes for the "If" section"""
> >          nodelist =3D []
> > -        if ifcond:
> > +        if ifcond.ifcond:
> >              snode =3D self._make_section('If')
> >              snode +=3D nodes.paragraph(
> >                  '', '', *self._nodes_for_ifcond(ifcond, with_if=3DFals=
e)
> > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> > index 0e13d51054..3654825968 100644
> > --- a/scripts/qapi/commands.py
> > +++ b/scripts/qapi/commands.py
> > @@ -17,7 +17,6 @@
> >      Dict,
> >      List,
> >      Optional,
> > -    Sequence,
> >      Set,
> >  )
> >
> > @@ -31,6 +30,7 @@
> >  from .schema import (
> >      QAPISchema,
> >      QAPISchemaFeature,
> > +    QAPISchemaIfCond,
> >      QAPISchemaObjectType,
> >      QAPISchemaType,
> >  )
> > @@ -301,7 +301,7 @@ def visit_end(self) -> None:
> >      def visit_command(self,
> >                        name: str,
> >                        info: Optional[QAPISourceInfo],
> > -                      ifcond: Sequence[str],
> > +                      ifcond: QAPISchemaIfCond,
> >                        features: List[QAPISchemaFeature],
> >                        arg_type: Optional[QAPISchemaObjectType],
> >                        ret_type: Optional[QAPISchemaType],
>
> Mechanical pattern #2: Sequence[str] becomes QAPISchemaIfCond.  Also
> obvious import adjustments.
>
> > diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
> > index fee8c671e7..82475e84ec 100644
> > --- a/scripts/qapi/events.py
> > +++ b/scripts/qapi/events.py
> > @@ -12,7 +12,7 @@
> >  See the COPYING file in the top-level directory.
> >  """
> >
> > -from typing import List, Optional, Sequence
> > +from typing import List, Optional
> >
> >  from .common import c_enum_const, c_name, mcgen
> >  from .gen import QAPISchemaModularCVisitor, build_params, ifcontext
> > @@ -20,6 +20,7 @@
> >      QAPISchema,
> >      QAPISchemaEnumMember,
> >      QAPISchemaFeature,
> > +    QAPISchemaIfCond,
> >      QAPISchemaObjectType,
> >  )
> >  from .source import QAPISourceInfo
> > @@ -227,7 +228,7 @@ def visit_end(self) -> None:
> >      def visit_event(self,
> >                      name: str,
> >                      info: Optional[QAPISourceInfo],
> > -                    ifcond: Sequence[str],
> > +                    ifcond: QAPISchemaIfCond,
> >                      features: List[QAPISchemaFeature],
> >                      arg_type: Optional[QAPISchemaObjectType],
> >                      boxed: bool) -> None:
> > diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> > index 1fa503bdbd..1c5b190276 100644
> > --- a/scripts/qapi/gen.py
> > +++ b/scripts/qapi/gen.py
> > @@ -18,7 +18,6 @@
> >      Dict,
> >      Iterator,
> >      Optional,
> > -    Sequence,
> >      Tuple,
> >  )
> >
> > @@ -32,6 +31,7 @@
> >      mcgen,
> >  )
> >  from .schema import (
> > +    QAPISchemaIfCond,
> >      QAPISchemaModule,
> >      QAPISchemaObjectType,
> >      QAPISchemaVisitor,
> > @@ -85,7 +85,7 @@ def write(self, output_dir: str) -> None:
> >                  fp.write(text)
> >
> >
> > -def _wrap_ifcond(ifcond: Sequence[str], before: str, after: str) -> st=
r:
> > +def _wrap_ifcond(ifcond: QAPISchemaIfCond, before: str, after: str) ->
> str:
> >      if before =3D=3D after:
> >          return after   # suppress empty #if ... #endif
> >
> > @@ -95,9 +95,9 @@ def _wrap_ifcond(ifcond: Sequence[str], before: str,
> after: str) -> str:
> >      if added[0] =3D=3D '\n':
> >          out +=3D '\n'
> >          added =3D added[1:]
> > -    out +=3D gen_if(ifcond)
> > +    out +=3D gen_if(ifcond.ifcond)
> >      out +=3D added
> > -    out +=3D gen_endif(ifcond)
> > +    out +=3D gen_endif(ifcond.ifcond)
> >      return out
> >
> >
> > @@ -127,9 +127,9 @@ def build_params(arg_type:
> Optional[QAPISchemaObjectType],
> >  class QAPIGenCCode(QAPIGen):
> >      def __init__(self, fname: str):
> >          super().__init__(fname)
> > -        self._start_if: Optional[Tuple[Sequence[str], str, str]] =3D N=
one
> > +        self._start_if: Optional[Tuple[QAPISchemaIfCond, str, str]] =
=3D
> None
> >
> > -    def start_if(self, ifcond: Sequence[str]) -> None:
> > +    def start_if(self, ifcond: QAPISchemaIfCond) -> None:
> >          assert self._start_if is None
> >          self._start_if =3D (ifcond, self._body, self._preamble)
> >
> > @@ -187,7 +187,7 @@ def _bottom(self) -> str:
> >
> >
> >  @contextmanager
> > -def ifcontext(ifcond: Sequence[str], *args: QAPIGenCCode) ->
> Iterator[None]:
> > +def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) ->
> Iterator[None]:
> >      """
> >      A with-statement context manager that wraps with `start_if()` /
> `end_if()`.
> >
> > diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> > index 9a348ca2e5..77a8c33ad4 100644
> > --- a/scripts/qapi/introspect.py
> > +++ b/scripts/qapi/introspect.py
> > @@ -15,11 +15,9 @@
> >      Any,
> >      Dict,
> >      Generic,
> > -    Iterable,
> >      List,
> >      Optional,
> >      Sequence,
> > -    Tuple,
> >      TypeVar,
> >      Union,
> >  )
> > @@ -38,6 +36,7 @@
> >      QAPISchemaEntity,
> >      QAPISchemaEnumMember,
> >      QAPISchemaFeature,
> > +    QAPISchemaIfCond,
> >      QAPISchemaObjectType,
> >      QAPISchemaObjectTypeMember,
> >      QAPISchemaType,
> > @@ -91,11 +90,11 @@ class Annotated(Generic[_ValueT]):
> >      """
> >      # TODO: Remove after Python 3.7 adds @dataclass:
> >      # pylint: disable=3Dtoo-few-public-methods
> > -    def __init__(self, value: _ValueT, ifcond: Iterable[str],
> > +    def __init__(self, value: _ValueT, ifcond: QAPISchemaIfCond,
>
> Here, we have Iterable[str] instead of Sequence[str] before the patch.
> I figure use of Iterable was an attempt to be more general.  Minor
> variation of pattern #2.
>
> >                   comment: Optional[str] =3D None):
> >          self.value =3D value
> >          self.comment: Optional[str] =3D comment
> > -        self.ifcond: Tuple[str, ...] =3D tuple(ifcond)
> > +        self.ifcond =3D ifcond
>
> Hmm.  Here we change from Tuple, not from Sequence.
>
> I believe the next hunk has its only uses:
>
> >
> >
> >  def _tree_to_qlit(obj: JSONValue,
> > @@ -125,10 +124,10 @@ def indent(level: int) -> str:
> >          if obj.comment:
> >              ret +=3D indent(level) + f"/* {obj.comment} */\n"
> >          if obj.ifcond:
> > -            ret +=3D gen_if(obj.ifcond)
> > +            ret +=3D gen_if(obj.ifcond.ifcond)
> >          ret +=3D _tree_to_qlit(obj.value, level)
> >          if obj.ifcond:
> > -            ret +=3D '\n' + gen_endif(obj.ifcond)
> > +            ret +=3D '\n' + gen_endif(obj.ifcond.ifcond)
> >          return ret
> >
> >      ret =3D ''
>
> You update obj.ifcond to obj.ifcond.ifcond when used as argument of
> gen_if() and gen_endif().  This changes the argument from Tuple to
> Sequence.  Fine, because Tuple is a special Sequence.
>
> Digression: I don't (anymore) understand why we made self.ifcond Tuple.
> John, do you remember?
>
> You don't update obj.ifcond when used as conditional.  The code now
> calls gen_if() and gen_endif() even for an empty Sequence.
>
> I believe this can't actually happen because check_if() rejects [] with
> "'if' condition [] of %s is useless".
>
> Still, the mechanical change should update to obj.ifcond even when used
> as conditional.
>
> Are there other, possibly not so harmless uses of values that change
> from Sequence to QAPISchemaIfCond the patch doesn't update?
>
> Or asked differently: how did you find what to update?
>

Eh, you are asking me for something I spent just a few hours a few times
over the last year. Sorry!

Most probably simply with code reading/grepping, linter and the test suite.


>
> > @@ -254,7 +253,7 @@ def _gen_features(features:
> Sequence[QAPISchemaFeature]
> >          return [Annotated(f.name, f.ifcond) for f in features]
> >
> >      def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
> > -                  ifcond: Sequence[str] =3D (),
> > +                  ifcond: QAPISchemaIfCond =3D QAPISchemaIfCond(),
>
> Mechanical pattern #3: wrap QAPISchemaIfCond around the Sequence.
>
> For readability, you simplify the pure wrap QAPISchemaIfCond(()) to just
> QAPISchemaIfCond(), relying on QAPISchemaIfCond.__init__()'s default.
>
> However, it's also a subtle change from () to [].  I believe that's
> okay, because we both are empty Sequences.  Might be worth a mention in
> the commit message.
>
> >                    features: Sequence[QAPISchemaFeature] =3D ()) -> Non=
e:
> >          """
> >          Build and append a SchemaInfo object to self._trees.
> > @@ -305,7 +304,7 @@ def visit_builtin_type(self, name: str, info:
> Optional[QAPISourceInfo],
> >          self._gen_tree(name, 'builtin', {'json-type': json_type})
> >
> >      def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo=
],
> > -                        ifcond: Sequence[str],
> > +                        ifcond: QAPISchemaIfCond,
> >                          features: List[QAPISchemaFeature],
> >                          members: List[QAPISchemaEnumMember],
> >                          prefix: Optional[str]) -> None:
> > @@ -316,14 +315,14 @@ def visit_enum_type(self, name: str, info:
> Optional[QAPISourceInfo],
> >          )
> >
> >      def visit_array_type(self, name: str, info:
> Optional[QAPISourceInfo],
> > -                         ifcond: Sequence[str],
> > +                         ifcond: QAPISchemaIfCond,
> >                           element_type: QAPISchemaType) -> None:
> >          element =3D self._use_type(element_type)
> >          self._gen_tree('[' + element + ']', 'array', {'element-type':
> element},
> >                         ifcond)
> >
> >      def visit_object_type_flat(self, name: str, info:
> Optional[QAPISourceInfo],
> > -                               ifcond: Sequence[str],
> > +                               ifcond: QAPISchemaIfCond,
> >                                 features: List[QAPISchemaFeature],
> >                                 members:
> List[QAPISchemaObjectTypeMember],
> >                                 variants: Optional[QAPISchemaVariants])
> -> None:
> > @@ -336,7 +335,7 @@ def visit_object_type_flat(self, name: str, info:
> Optional[QAPISourceInfo],
> >          self._gen_tree(name, 'object', obj, ifcond, features)
> >
> >      def visit_alternate_type(self, name: str, info:
> Optional[QAPISourceInfo],
> > -                             ifcond: Sequence[str],
> > +                             ifcond: QAPISchemaIfCond,
> >                               features: List[QAPISchemaFeature],
> >                               variants: QAPISchemaVariants) -> None:
> >          self._gen_tree(
> > @@ -348,7 +347,7 @@ def visit_alternate_type(self, name: str, info:
> Optional[QAPISourceInfo],
> >          )
> >
> >      def visit_command(self, name: str, info: Optional[QAPISourceInfo],
> > -                      ifcond: Sequence[str],
> > +                      ifcond: QAPISchemaIfCond,
> >                        features: List[QAPISchemaFeature],
> >                        arg_type: Optional[QAPISchemaObjectType],
> >                        ret_type: Optional[QAPISchemaType], gen: bool,
> > @@ -367,7 +366,8 @@ def visit_command(self, name: str, info:
> Optional[QAPISourceInfo],
> >          self._gen_tree(name, 'command', obj, ifcond, features)
> >
> >      def visit_event(self, name: str, info: Optional[QAPISourceInfo],
> > -                    ifcond: Sequence[str], features:
> List[QAPISchemaFeature],
> > +                    ifcond: QAPISchemaIfCond,
> > +                    features: List[QAPISchemaFeature],
> >                      arg_type: Optional[QAPISchemaObjectType],
> >                      boxed: bool) -> None:
> >          assert self._schema is not None
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index d1d27ff7ee..5e44164bd1 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -25,6 +25,11 @@
> >  from .parser import QAPISchemaParser
> >
> >
> > +class QAPISchemaIfCond:
> > +    def __init__(self, ifcond=3DNone):
> > +        self.ifcond =3D ifcond or []
> > +
> > +
> >  class QAPISchemaEntity:
> >      meta: Optional[str] =3D None
> >
> > @@ -42,7 +47,7 @@ def __init__(self, name: str, info, doc, ifcond=3DNon=
e,
> features=3DNone):
> >          # such place).
> >          self.info =3D info
> >          self.doc =3D doc
> > -        self._ifcond =3D ifcond or []
> > +        self._ifcond =3D ifcond or QAPISchemaIfCond()
>
> This is an instance of mechanical pattern #3 where we wrap the value
> without changing it.
>
> Before the patch we use both () and [] as "no conditions".  After the
> patch, we always use [], unless something passes another empty sequence
> to QAPISchemaIfCond.__init__(), which I don't think is the case.
> Observation, not a request.
>
>
> >          self.features =3D features or []
> >          self._checked =3D False
> >
> > @@ -78,6 +83,7 @@ def set_module(self, schema):
> >      @property
> >      def ifcond(self):
> >          assert self._checked
> > +        assert isinstance(self._ifcond, QAPISchemaIfCond)
> >          return self._ifcond
>
> Non-mechanical hunk.  The commit message claims to list them ("Except
> for ..., it's a mechanical change"), but it doesn't.  Easy enough to
> fix.
>

dropped


> >
> >      def is_implicit(self):
> > @@ -593,7 +599,7 @@ def check(self, schema, seen):
> >                      self.info,
> >                      "discriminator member '%s' of %s must not be
> optional"
> >                      % (self._tag_name, base))
> > -            if self.tag_member.ifcond:
> > +            if self.tag_member.ifcond.ifcond:
> >                  raise QAPISemError(
> >                      self.info,
> >                      "discriminator member '%s' of %s must not be
> conditional"
> > @@ -601,7 +607,7 @@ def check(self, schema, seen):
> >          else:                   # simple union
> >              assert isinstance(self.tag_member.type, QAPISchemaEnumType=
)
> >              assert not self.tag_member.optional
> > -            assert self.tag_member.ifcond =3D=3D []
> > +            assert self.tag_member.ifcond.ifcond =3D=3D []
> >          if self._tag_name:    # flat union
> >              # branches that are not explicitly covered get an empty ty=
pe
> >              cases =3D {v.name for v in self.variants}
> > @@ -646,7 +652,7 @@ def __init__(self, name, info, ifcond=3DNone):
> >          assert isinstance(name, str)
> >          self.name =3D name
> >          self.info =3D info
> > -        self.ifcond =3D ifcond or []
> > +        self.ifcond =3D ifcond or QAPISchemaIfCond()
> >          self.defined_in =3D None
> >
> >      def set_defined_in(self, name):
> > @@ -968,11 +974,13 @@ def _def_predefineds(self):
> >      def _make_features(self, features, info):
> >          if features is None:
> >              return []
> > -        return [QAPISchemaFeature(f['name'], info, f.get('if'))
> > +        return [QAPISchemaFeature(f['name'], info,
> > +                                  QAPISchemaIfCond(f.get('if')))
> >                  for f in features]
> >
> >      def _make_enum_members(self, values, info):
> > -        return [QAPISchemaEnumMember(v['name'], info, v.get('if'))
> > +        return [QAPISchemaEnumMember(v['name'], info,
> > +                                     QAPISchemaIfCond(v.get('if')))
> >                  for v in values]
> >
>
> Two more instances of pattern #3, only here we wrap values we get from
> the JSON parser.  These are either None or non-empty lists.
>
> >      def _make_implicit_enum_type(self, name, info, ifcond, values):
> > @@ -1008,7 +1016,10 @@ def _make_implicit_object_type(self, name, info,
> ifcond, role, members):
>            if typ:
>                # The implicit object type has multiple users.  This can
>                # happen only for simple unions' implicit wrapper types.
>                # Its ifcond should be the disjunction of its user's
>                # ifconds.  Not implemented.  Instead, we always pass the
>                # wrapped type's ifcond, which is trivially the same for a=
ll
>                # users.  It's also necessary for the wrapper to compile.
>                # But it's not tight: the disjunction need not imply it.  =
We
>                # may end up compiling useless wrapper types.
> >              # TODO kill simple unions or implement the disjunction
> >
> >              # pylint: disable=3Dprotected-access
> > -            assert (ifcond or []) =3D=3D typ._ifcond
> > +            if isinstance(ifcond, QAPISchemaIfCond):
> > +                assert ifcond.ifcond =3D=3D typ._ifcond.ifcond
> > +            else:
> > +                assert ifcond =3D=3D typ._ifcond
> >          else:
> >              self._def_entity(QAPISchemaObjectType(
> >                  name, info, None, ifcond, None, None, members, None))
>
> This is the non-mechanical change mentioned in the commit message.
>
> Can you explain where the two cases come from?
>
>
_make_simple_variant() calls _make_implicit_object_type() with
self.lookup_type(typ).

I think it could instead call with the ._ifcond value.

To be done after?



> > @@ -1018,7 +1029,7 @@ def _def_enum_type(self, expr, info, doc):
> >          name =3D expr['enum']
> >          data =3D expr['data']
> >          prefix =3D expr.get('prefix')
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> >          self._def_entity(QAPISchemaEnumType(
> >              name, info, doc, ifcond, features,
> > @@ -1036,7 +1047,8 @@ def _make_member(self, name, typ, ifcond,
> features, info):
> >                                            self._make_features(features=
,
> info))
> >
> >      def _make_members(self, data, info):
> > -        return [self._make_member(key, value['type'], value.get('if'),
> > +        return [self._make_member(key, value['type'],
> > +                                  QAPISchemaIfCond(value.get('if')),
> >                                    value.get('features'), info)
> >                  for (key, value) in data.items()]
> >
> > @@ -1044,7 +1056,7 @@ def _def_struct_type(self, expr, info, doc):
> >          name =3D expr['struct']
> >          base =3D expr.get('base')
> >          data =3D expr['data']
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> >          self._def_entity(QAPISchemaObjectType(
> >              name, info, doc, ifcond, features, base,
> > @@ -1067,7 +1079,7 @@ def _def_union_type(self, expr, info, doc):
> >          name =3D expr['union']
> >          data =3D expr['data']
> >          base =3D expr.get('base')
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> >          tag_name =3D expr.get('discriminator')
> >          tag_member =3D None
> > @@ -1076,15 +1088,19 @@ def _def_union_type(self, expr, info, doc):
> >                  name, info, ifcond,
> >                  'base', self._make_members(base, info))
> >          if tag_name:
> > -            variants =3D [self._make_variant(key, value['type'],
> > -                                           value.get('if'), info)
> > -                        for (key, value) in data.items()]
> > +            variants =3D [
> > +                self._make_variant(key, value['type'],
> > +                                   QAPISchemaIfCond(value.get('if')),
> > +                                   info)
> > +                for (key, value) in data.items()]
> >              members =3D []
> >          else:
> > -            variants =3D [self._make_simple_variant(key, value['type']=
,
> > -                                                  value.get('if'), inf=
o)
> > -                        for (key, value) in data.items()]
> > -            enum =3D [{'name': v.name, 'if': v.ifcond} for v in varian=
ts]
> > +            variants =3D [
> > +                self._make_simple_variant(key, value['type'],
> > +
> QAPISchemaIfCond(value.get('if')),
> > +                                          info)
> > +                for (key, value) in data.items()]
> > +            enum =3D [{'name': v.name, 'if': v.ifcond.ifcond} for v in
> variants]
> >              typ =3D self._make_implicit_enum_type(name, info, ifcond,
> enum)
> >              tag_member =3D QAPISchemaObjectTypeMember('type', info, ty=
p,
> False)
> >              members =3D [tag_member]
> > @@ -1097,11 +1113,13 @@ def _def_union_type(self, expr, info, doc):
> >      def _def_alternate_type(self, expr, info, doc):
> >          name =3D expr['alternate']
> >          data =3D expr['data']
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> > -        variants =3D [self._make_variant(key, value['type'],
> value.get('if'),
> > -                                       info)
> > -                    for (key, value) in data.items()]
> > +        variants =3D [
> > +            self._make_variant(key, value['type'],
> > +                               QAPISchemaIfCond(value.get('if')),
> > +                               info)
> > +            for (key, value) in data.items()]
> >          tag_member =3D QAPISchemaObjectTypeMember('type', info, 'QType=
',
> False)
> >          self._def_entity(
> >              QAPISchemaAlternateType(name, info, doc, ifcond, features,
> > @@ -1118,7 +1136,7 @@ def _def_command(self, expr, info, doc):
> >          allow_oob =3D expr.get('allow-oob', False)
> >          allow_preconfig =3D expr.get('allow-preconfig', False)
> >          coroutine =3D expr.get('coroutine', False)
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> >          if isinstance(data, OrderedDict):
> >              data =3D self._make_implicit_object_type(
> > @@ -1137,7 +1155,7 @@ def _def_event(self, expr, info, doc):
> >          name =3D expr['event']
> >          data =3D expr.get('data')
> >          boxed =3D expr.get('boxed', False)
> > -        ifcond =3D expr.get('if')
> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> >          features =3D self._make_features(expr.get('features'), info)
> >          if isinstance(data, OrderedDict):
> >              data =3D self._make_implicit_object_type(
> > diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> > index 20d572a23a..3673cf0f49 100644
> > --- a/scripts/qapi/types.py
> > +++ b/scripts/qapi/types.py
> > @@ -13,7 +13,7 @@
> >  # See the COPYING file in the top-level directory.
> >  """
> >
> > -from typing import List, Optional, Sequence
> > +from typing import List, Optional
> >
> >  from .common import (
> >      c_enum_const,
> > @@ -27,6 +27,7 @@
> >      QAPISchema,
> >      QAPISchemaEnumMember,
> >      QAPISchemaFeature,
> > +    QAPISchemaIfCond,
> >      QAPISchemaObjectType,
> >      QAPISchemaObjectTypeMember,
> >      QAPISchemaType,
> > @@ -50,13 +51,13 @@ def gen_enum_lookup(name: str,
> >  ''',
> >                  c_name=3Dc_name(name))
> >      for memb in members:
> > -        ret +=3D gen_if(memb.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.ifcond)
> >          index =3D c_enum_const(name, memb.name, prefix)
> >          ret +=3D mcgen('''
> >          [%(index)s] =3D "%(name)s",
> >  ''',
> >                       index=3Dindex, name=3Dmemb.name)
> > -        ret +=3D gen_endif(memb.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.ifcond)
> >
> >      ret +=3D mcgen('''
> >      },
> > @@ -80,12 +81,12 @@ def gen_enum(name: str,
> >                  c_name=3Dc_name(name))
> >
> >      for memb in enum_members:
> > -        ret +=3D gen_if(memb.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.ifcond)
> >          ret +=3D mcgen('''
> >      %(c_enum)s,
> >  ''',
> >                       c_enum=3Dc_enum_const(name, memb.name, prefix))
> > -        ret +=3D gen_endif(memb.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.ifcond)
> >
> >      ret +=3D mcgen('''
> >  } %(c_name)s;
> > @@ -125,7 +126,7 @@ def gen_array(name: str, element_type:
> QAPISchemaType) -> str:
> >  def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) ->
> str:
> >      ret =3D ''
> >      for memb in members:
> > -        ret +=3D gen_if(memb.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.ifcond)
> >          if memb.optional:
> >              ret +=3D mcgen('''
> >      bool has_%(c_name)s;
> > @@ -135,11 +136,11 @@ def gen_struct_members(members:
> List[QAPISchemaObjectTypeMember]) -> str:
> >      %(c_type)s %(c_name)s;
> >  ''',
> >                       c_type=3Dmemb.type.c_type(), c_name=3Dc_name(memb=
.name
> ))
> > -        ret +=3D gen_endif(memb.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.ifcond)
> >      return ret
> >
> >
> > -def gen_object(name: str, ifcond: Sequence[str],
> > +def gen_object(name: str, ifcond: QAPISchemaIfCond,
> >                 base: Optional[QAPISchemaObjectType],
> >                 members: List[QAPISchemaObjectTypeMember],
> >                 variants: Optional[QAPISchemaVariants]) -> str:
> > @@ -158,7 +159,7 @@ def gen_object(name: str, ifcond: Sequence[str],
> >      ret +=3D mcgen('''
> >
> >  ''')
> > -    ret +=3D gen_if(ifcond)
> > +    ret +=3D gen_if(ifcond.ifcond)
> >      ret +=3D mcgen('''
> >  struct %(c_name)s {
> >  ''',
> > @@ -192,7 +193,7 @@ def gen_object(name: str, ifcond: Sequence[str],
> >      ret +=3D mcgen('''
> >  };
> >  ''')
> > -    ret +=3D gen_endif(ifcond)
> > +    ret +=3D gen_endif(ifcond.ifcond)
> >
> >      return ret
> >
> > @@ -219,13 +220,13 @@ def gen_variants(variants: QAPISchemaVariants) ->
> str:
> >      for var in variants.variants:
> >          if var.type.name =3D=3D 'q_empty':
> >              continue
> > -        ret +=3D gen_if(var.ifcond)
> > +        ret +=3D gen_if(var.ifcond.ifcond)
> >          ret +=3D mcgen('''
> >          %(c_type)s %(c_name)s;
> >  ''',
> >                       c_type=3Dvar.type.c_unboxed_type(),
> >                       c_name=3Dc_name(var.name))
> > -        ret +=3D gen_endif(var.ifcond)
> > +        ret +=3D gen_endif(var.ifcond.ifcond)
> >
> >      ret +=3D mcgen('''
> >      } u;
> > @@ -307,7 +308,7 @@ def _gen_type_cleanup(self, name: str) -> None:
> >      def visit_enum_type(self,
> >                          name: str,
> >                          info: Optional[QAPISourceInfo],
> > -                        ifcond: Sequence[str],
> > +                        ifcond: QAPISchemaIfCond,
> >                          features: List[QAPISchemaFeature],
> >                          members: List[QAPISchemaEnumMember],
> >                          prefix: Optional[str]) -> None:
> > @@ -318,7 +319,7 @@ def visit_enum_type(self,
> >      def visit_array_type(self,
> >                           name: str,
> >                           info: Optional[QAPISourceInfo],
> > -                         ifcond: Sequence[str],
> > +                         ifcond: QAPISchemaIfCond,
> >                           element_type: QAPISchemaType) -> None:
> >          with ifcontext(ifcond, self._genh, self._genc):
> >              self._genh.preamble_add(gen_fwd_object_or_array(name))
> > @@ -328,7 +329,7 @@ def visit_array_type(self,
> >      def visit_object_type(self,
> >                            name: str,
> >                            info: Optional[QAPISourceInfo],
> > -                          ifcond: Sequence[str],
> > +                          ifcond: QAPISchemaIfCond,
> >                            features: List[QAPISchemaFeature],
> >                            base: Optional[QAPISchemaObjectType],
> >                            members: List[QAPISchemaObjectTypeMember],
> > @@ -351,7 +352,7 @@ def visit_object_type(self,
> >      def visit_alternate_type(self,
> >                               name: str,
> >                               info: Optional[QAPISourceInfo],
> > -                             ifcond: Sequence[str],
> > +                             ifcond: QAPISchemaIfCond,
> >                               features: List[QAPISchemaFeature],
> >                               variants: QAPISchemaVariants) -> None:
> >          with ifcontext(ifcond, self._genh):
> > diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> > index 9e96f3c566..67721b2470 100644
> > --- a/scripts/qapi/visit.py
> > +++ b/scripts/qapi/visit.py
> > @@ -13,7 +13,7 @@
> >  See the COPYING file in the top-level directory.
> >  """
> >
> > -from typing import List, Optional, Sequence
> > +from typing import List, Optional
> >
> >  from .common import (
> >      c_enum_const,
> > @@ -29,6 +29,7 @@
> >      QAPISchemaEnumMember,
> >      QAPISchemaEnumType,
> >      QAPISchemaFeature,
> > +    QAPISchemaIfCond,
> >      QAPISchemaObjectType,
> >      QAPISchemaObjectTypeMember,
> >      QAPISchemaType,
> > @@ -78,7 +79,7 @@ def gen_visit_object_members(name: str,
> >
> >      for memb in members:
> >          deprecated =3D 'deprecated' in [f.name for f in memb.features]
> > -        ret +=3D gen_if(memb.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.ifcond)
> >          if memb.optional:
> >              ret +=3D mcgen('''
> >      if (visit_optional(v, "%(name)s", &obj->has_%(c_name)s)) {
> > @@ -111,7 +112,7 @@ def gen_visit_object_members(name: str,
> >              ret +=3D mcgen('''
> >      }
> >  ''')
> > -        ret +=3D gen_endif(memb.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.ifcond)
> >
> >      if variants:
> >          tag_member =3D variants.tag_member
> > @@ -125,7 +126,7 @@ def gen_visit_object_members(name: str,
> >          for var in variants.variants:
> >              case_str =3D c_enum_const(tag_member.type.name, var.name,
> >                                      tag_member.type.prefix)
> > -            ret +=3D gen_if(var.ifcond)
> > +            ret +=3D gen_if(var.ifcond.ifcond)
> >              if var.type.name =3D=3D 'q_empty':
> >                  # valid variant and nothing to do
> >                  ret +=3D mcgen('''
> > @@ -141,7 +142,7 @@ def gen_visit_object_members(name: str,
> >                               case=3Dcase_str,
> >                               c_type=3Dvar.type.c_name(), c_name=3Dc_na=
me(
> var.name))
> >
> > -            ret +=3D gen_endif(var.ifcond)
> > +            ret +=3D gen_endif(var.ifcond.ifcond)
> >          ret +=3D mcgen('''
> >      default:
> >          abort();
> > @@ -227,7 +228,7 @@ def gen_visit_alternate(name: str, variants:
> QAPISchemaVariants) -> str:
> >                  c_name=3Dc_name(name))
> >
> >      for var in variants.variants:
> > -        ret +=3D gen_if(var.ifcond)
> > +        ret +=3D gen_if(var.ifcond.ifcond)
> >          ret +=3D mcgen('''
> >      case %(case)s:
> >  ''',
> > @@ -253,7 +254,7 @@ def gen_visit_alternate(name: str, variants:
> QAPISchemaVariants) -> str:
> >          ret +=3D mcgen('''
> >          break;
> >  ''')
> > -        ret +=3D gen_endif(var.ifcond)
> > +        ret +=3D gen_endif(var.ifcond.ifcond)
> >
> >      ret +=3D mcgen('''
> >      case QTYPE_NONE:
> > @@ -352,7 +353,7 @@ def _begin_user_module(self, name: str) -> None:
> >      def visit_enum_type(self,
> >                          name: str,
> >                          info: Optional[QAPISourceInfo],
> > -                        ifcond: Sequence[str],
> > +                        ifcond: QAPISchemaIfCond,
> >                          features: List[QAPISchemaFeature],
> >                          members: List[QAPISchemaEnumMember],
> >                          prefix: Optional[str]) -> None:
> > @@ -363,7 +364,7 @@ def visit_enum_type(self,
> >      def visit_array_type(self,
> >                           name: str,
> >                           info: Optional[QAPISourceInfo],
> > -                         ifcond: Sequence[str],
> > +                         ifcond: QAPISchemaIfCond,
> >                           element_type: QAPISchemaType) -> None:
> >          with ifcontext(ifcond, self._genh, self._genc):
> >              self._genh.add(gen_visit_decl(name))
> > @@ -372,7 +373,7 @@ def visit_array_type(self,
> >      def visit_object_type(self,
> >                            name: str,
> >                            info: Optional[QAPISourceInfo],
> > -                          ifcond: Sequence[str],
> > +                          ifcond: QAPISchemaIfCond,
> >                            features: List[QAPISchemaFeature],
> >                            base: Optional[QAPISchemaObjectType],
> >                            members: List[QAPISchemaObjectTypeMember],
> > @@ -394,7 +395,7 @@ def visit_object_type(self,
> >      def visit_alternate_type(self,
> >                               name: str,
> >                               info: Optional[QAPISourceInfo],
> > -                             ifcond: Sequence[str],
> > +                             ifcond: QAPISchemaIfCond,
> >                               features: List[QAPISchemaFeature],
> >                               variants: QAPISchemaVariants) -> None:
> >          with ifcontext(ifcond, self._genh, self._genc):
> > diff --git a/tests/qapi-schema/test-qapi.py
> b/tests/qapi-schema/test-qapi.py
> > index f1c4deb9a5..7907b4ac3a 100755
> > --- a/tests/qapi-schema/test-qapi.py
> > +++ b/tests/qapi-schema/test-qapi.py
> > @@ -94,8 +94,8 @@ def _print_variants(variants):
> >
> >      @staticmethod
> >      def _print_if(ifcond, indent=3D4):
> > -        if ifcond:
> > -            print('%sif %s' % (' ' * indent, ifcond))
> > +        if ifcond.ifcond:
> > +            print('%sif %s' % (' ' * indent, ifcond.ifcond))
> >
> >      @classmethod
> >      def _print_features(cls, features, indent=3D4):
>
>

--000000000000adbf2705c8b782a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 1:21 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">ar=
mbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_bl=
ank">marcandre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Except for the special casing assert in _make_implicit_object_type(),<=
br>
&gt; which needs to handle schema objects, it&#39;s a mechanical change.<br=
>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 docs/sphinx/qapidoc.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++=
---<br>
&gt;=C2=A0 scripts/qapi/commands.py=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +--=
<br>
&gt;=C2=A0 scripts/qapi/events.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
5 +--<br>
&gt;=C2=A0 scripts/qapi/gen.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
4 ++++----<br>
&gt;=C2=A0 scripts/qapi/introspect.py=C2=A0 =C2=A0 =C2=A0| 26 +++++++------=
-<br>
&gt;=C2=A0 scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 66 +++=
++++++++++++++++++-------------<br>
&gt;=C2=A0 scripts/qapi/types.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 33 +++=
+++++---------<br>
&gt;=C2=A0 scripts/qapi/visit.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 +++=
+++------<br>
&gt;=C2=A0 tests/qapi-schema/test-qapi.py |=C2=A0 4 +--<br>
&gt;=C2=A0 9 files changed, 103 insertions(+), 82 deletions(-)<br>
&gt;<br>
&gt; diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py<br>
&gt; index 87c67ab23f..0eac3308b2 100644<br>
&gt; --- a/docs/sphinx/qapidoc.py<br>
&gt; +++ b/docs/sphinx/qapidoc.py<br>
&gt; @@ -116,7 +116,7 @@ def _nodes_for_ifcond(self, ifcond, with_if=3DTrue=
):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the conditions are in literal-text a=
nd the commas are not.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If with_if is False, we don&#39;t re=
turn the &quot;(If: &quot; and &quot;)&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 condlist =3D intersperse([nodes.literal(&=
#39;&#39;, c) for c in ifcond],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 condlist =3D intersperse([nodes.literal(&=
#39;&#39;, c) for c in ifcond.ifcond],<br>
<br>
Mechanical pattern #1: ifcond becomes ifcond.ifcond to peel off the new<br>
wrapper.=C2=A0 ifcond.ifcond is ugly, but almost all instances go away in<b=
r>
this series.=C2=A0 I&#39;m okay with the remainder.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nodes.Text(&#39;, &#39;))<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not with_if:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return condlist<br>
&gt; @@ -139,7 +139,7 @@ def _nodes_for_one_member(self, member):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 term.append(nodes.lite=
ral(&#39;&#39;, member.type.doc_type()))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if member.optional:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 term.append(nodes.Text=
(&#39; (optional)&#39;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if member.ifcond:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if member.ifcond.ifcond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 term.extend(self._node=
s_for_ifcond(member.ifcond))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return term<br>
&gt;=C2=A0 <br>
&gt; @@ -154,7 +154,7 @@ def _nodes_for_variant_when(self, variants, varian=
t):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nodes.li=
teral(&#39;&#39;, <a href=3D"http://variants.tag_member.name" rel=3D"norefe=
rrer" target=3D"_blank">variants.tag_member.name</a>),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nodes.Te=
xt(&#39; is &#39;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nodes.li=
teral(&#39;&#39;, &#39;&quot;%s&quot;&#39; % <a href=3D"http://variant.name=
" rel=3D"noreferrer" target=3D"_blank">variant.name</a>)]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if variant.ifcond:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if variant.ifcond.ifcond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 term.extend(self._node=
s_for_ifcond(variant.ifcond))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return term<br>
&gt;=C2=A0 <br>
&gt; @@ -209,7 +209,7 @@ def _nodes_for_enum_values(self, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlnode =3D nodes.definition_list()<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for section in doc.args.values():<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 termtext =3D [nodes.li=
teral(&#39;&#39;, <a href=3D"http://section.member.name" rel=3D"noreferrer"=
 target=3D"_blank">section.member.name</a>)]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if section.member.ifcond:<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if section.member.ifcond.if=
cond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 termtext=
.extend(self._nodes_for_ifcond(section.member.ifcond))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO drop fallbacks =
when undocumented members are outlawed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if section.text:<br>
&gt; @@ -277,7 +277,7 @@ def _nodes_for_sections(self, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _nodes_for_if_section(self, ifcond):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Return list of doc=
tree nodes for the &quot;If&quot; section&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nodelist =3D []<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ifcond:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ifcond.ifcond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snode =3D self._make_s=
ection(&#39;If&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snode +=3D nodes.parag=
raph(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#3=
9;, &#39;&#39;, *self._nodes_for_ifcond(ifcond, with_if=3DFalse)<br>
&gt; diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py<br>
&gt; index 0e13d51054..3654825968 100644<br>
&gt; --- a/scripts/qapi/commands.py<br>
&gt; +++ b/scripts/qapi/commands.py<br>
&gt; @@ -17,7 +17,6 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Dict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 List,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Optional,<br>
&gt; -=C2=A0 =C2=A0 Sequence,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Set,<br>
&gt;=C2=A0 )<br>
&gt;=C2=A0 <br>
&gt; @@ -31,6 +30,7 @@<br>
&gt;=C2=A0 from .schema import (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchema,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaFeature,<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaType,<br>
&gt;=C2=A0 )<br>
&gt; @@ -301,7 +301,7 @@ def visit_end(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_command(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 arg_type: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ret_type: Optional[QAPISchemaType],<br>
<br>
Mechanical pattern #2: Sequence[str] becomes QAPISchemaIfCond.=C2=A0 Also<b=
r>
obvious import adjustments.<br>
<br>
&gt; diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py<br>
&gt; index fee8c671e7..82475e84ec 100644<br>
&gt; --- a/scripts/qapi/events.py<br>
&gt; +++ b/scripts/qapi/events.py<br>
&gt; @@ -12,7 +12,7 @@<br>
&gt;=C2=A0 See the COPYING file in the top-level directory.<br>
&gt;=C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 <br>
&gt; -from typing import List, Optional, Sequence<br>
&gt; +from typing import List, Optional<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 from .common import c_enum_const, c_name, mcgen<br>
&gt;=C2=A0 from .gen import QAPISchemaModularCVisitor, build_params, ifcont=
ext<br>
&gt; @@ -20,6 +20,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchema,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaEnumMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaFeature,<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectType,<br>
&gt;=C2=A0 )<br>
&gt;=C2=A0 from .source import QAPISourceInfo<br>
&gt; @@ -227,7 +228,7 @@ def visit_end(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_event(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 arg_type: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 boxed: bool) -&gt; None:<br>
&gt; diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py<br>
&gt; index 1fa503bdbd..1c5b190276 100644<br>
&gt; --- a/scripts/qapi/gen.py<br>
&gt; +++ b/scripts/qapi/gen.py<br>
&gt; @@ -18,7 +18,6 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Dict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Iterator,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Optional,<br>
&gt; -=C2=A0 =C2=A0 Sequence,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Tuple,<br>
&gt;=C2=A0 )<br>
&gt;=C2=A0 <br>
&gt; @@ -32,6 +31,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mcgen,<br>
&gt;=C2=A0 )<br>
&gt;=C2=A0 from .schema import (<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaModule,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaVisitor,<br>
&gt; @@ -85,7 +85,7 @@ def write(self, output_dir: str) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fp.write=
(text)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -def _wrap_ifcond(ifcond: Sequence[str], before: str, after: str) -&gt=
; str:<br>
&gt; +def _wrap_ifcond(ifcond: QAPISchemaIfCond, before: str, after: str) -=
&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if before =3D=3D after:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return after=C2=A0 =C2=A0# suppress =
empty #if ... #endif<br>
&gt;=C2=A0 <br>
&gt; @@ -95,9 +95,9 @@ def _wrap_ifcond(ifcond: Sequence[str], before: str,=
 after: str) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if added[0] =3D=3D &#39;\n&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D &#39;\n&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 added =3D added[1:]<br>
&gt; -=C2=A0 =C2=A0 out +=3D gen_if(ifcond)<br>
&gt; +=C2=A0 =C2=A0 out +=3D gen_if(ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 out +=3D added<br>
&gt; -=C2=A0 =C2=A0 out +=3D gen_endif(ifcond)<br>
&gt; +=C2=A0 =C2=A0 out +=3D gen_endif(ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return out<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; @@ -127,9 +127,9 @@ def build_params(arg_type: Optional[QAPISchemaObje=
ctType],<br>
&gt;=C2=A0 class QAPIGenCCode(QAPIGen):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def __init__(self, fname: str):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(fname)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._start_if: Optional[Tuple[Sequence[s=
tr], str, str]] =3D None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._start_if: Optional[Tuple[QAPISchema=
IfCond, str, str]] =3D None<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def start_if(self, ifcond: Sequence[str]) -&gt; None:<b=
r>
&gt; +=C2=A0 =C2=A0 def start_if(self, ifcond: QAPISchemaIfCond) -&gt; None=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self._start_if is None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._start_if =3D (ifcond, self._bo=
dy, self._preamble)<br>
&gt;=C2=A0 <br>
&gt; @@ -187,7 +187,7 @@ def _bottom(self) -&gt; str:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 @contextmanager<br>
&gt; -def ifcontext(ifcond: Sequence[str], *args: QAPIGenCCode) -&gt; Itera=
tor[None]:<br>
&gt; +def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) -&gt; It=
erator[None]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 A with-statement context manager that wraps with `=
start_if()` / `end_if()`.<br>
&gt;=C2=A0 <br>
&gt; diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py<b=
r>
&gt; index 9a348ca2e5..77a8c33ad4 100644<br>
&gt; --- a/scripts/qapi/introspect.py<br>
&gt; +++ b/scripts/qapi/introspect.py<br>
&gt; @@ -15,11 +15,9 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Any,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Dict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Generic,<br>
&gt; -=C2=A0 =C2=A0 Iterable,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 List,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Optional,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Sequence,<br>
&gt; -=C2=A0 =C2=A0 Tuple,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TypeVar,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Union,<br>
&gt;=C2=A0 )<br>
&gt; @@ -38,6 +36,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaEntity,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaEnumMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaFeature,<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectTypeMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaType,<br>
&gt; @@ -91,11 +90,11 @@ class Annotated(Generic[_ValueT]):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # TODO: Remove after Python 3.7 adds @dataclass:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 # pylint: disable=3Dtoo-few-public-methods<br>
&gt; -=C2=A0 =C2=A0 def __init__(self, value: _ValueT, ifcond: Iterable[str=
],<br>
&gt; +=C2=A0 =C2=A0 def __init__(self, value: _ValueT, ifcond: QAPISchemaIf=
Cond,<br>
<br>
Here, we have Iterable[str] instead of Sequence[str] before the patch.<br>
I figure use of Iterable was an attempt to be more general.=C2=A0 Minor<br>
variation of pattern #2.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
mment: Optional[str] =3D None):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.value =3D value<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.comment: Optional[str] =3D comm=
ent<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond: Tuple[str, ...] =3D tuple(if=
cond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond<br>
<br>
Hmm.=C2=A0 Here we change from Tuple, not from Sequence.<br>
<br>
I believe the next hunk has its only uses:<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def _tree_to_qlit(obj: JSONValue,<br>
&gt; @@ -125,10 +124,10 @@ def indent(level: int) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj.comment:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D indent(level)=
 + f&quot;/* {obj.comment} */\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj.ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(obj.ifcond)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(obj.ifcond.=
ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D _tree_to_qlit(obj.value, le=
vel)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj.ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39;\n&#39; + gen=
_endif(obj.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39;\n&#39; + gen=
_endif(obj.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D &#39;&#39;<br>
<br>
You update obj.ifcond to obj.ifcond.ifcond when used as argument of<br>
gen_if() and gen_endif().=C2=A0 This changes the argument from Tuple to<br>
Sequence.=C2=A0 Fine, because Tuple is a special Sequence.<br>
<br>
Digression: I don&#39;t (anymore) understand why we made self.ifcond Tuple.=
<br>
John, do you remember?<br>
<br>
You don&#39;t update obj.ifcond when used as conditional.=C2=A0 The code no=
w<br>
calls gen_if() and gen_endif() even for an empty Sequence.<br>
<br>
I believe this can&#39;t actually happen because check_if() rejects [] with=
<br>
&quot;&#39;if&#39; condition [] of %s is useless&quot;.<br>
<br>
Still, the mechanical change should update to obj.ifcond even when used<br>
as conditional.<br>
<br>
Are there other, possibly not so harmless uses of values that change<br>
from Sequence to QAPISchemaIfCond the patch doesn&#39;t update?<br>
<br>
Or asked differently: how did you find what to update?<br></blockquote><div=
><br></div><div>Eh, you are asking me for something I spent just a few hour=
s a few times over the last year. Sorry!<br></div><div><br></div><div>Most =
probably simply with code reading/grepping, linter and the test suite.<br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; @@ -254,7 +253,7 @@ def _gen_features(features: Sequence[QAPISchemaFea=
ture]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return [Annotated(<a href=3D"http://=
f.name" rel=3D"noreferrer" target=3D"_blank">f.name</a>, f.ifcond) for f in=
 features]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _gen_tree(self, name: str, mtype: str, obj: Di=
ct[str, object],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond=
: Sequence[str] =3D (),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond=
: QAPISchemaIfCond =3D QAPISchemaIfCond(),<br>
<br>
Mechanical pattern #3: wrap QAPISchemaIfCond around the Sequence.<br>
<br>
For readability, you simplify the pure wrap QAPISchemaIfCond(()) to just<br=
>
QAPISchemaIfCond(), relying on QAPISchemaIfCond.__init__()&#39;s default.<b=
r>
<br>
However, it&#39;s also a subtle change from () to [].=C2=A0 I believe that&=
#39;s<br>
okay, because we both are empty Sequences.=C2=A0 Might be worth a mention i=
n<br>
the commit message.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
eatures: Sequence[QAPISchemaFeature] =3D ()) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Build and append a SchemaInfo object=
 to self._trees.<br>
&gt; @@ -305,7 +304,7 @@ def visit_builtin_type(self, name: str, info: Opti=
onal[QAPISourceInfo],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._gen_tree(name, &#39;builtin&#3=
9;, {&#39;json-type&#39;: json_type})<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_enum_type(self, name: str, info: Optiona=
l[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 members: List[QAPISchemaEnumMember],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 prefix: Optional[str]) -&gt; None:<br>
&gt; @@ -316,14 +315,14 @@ def visit_enum_type(self, name: str, info: Optio=
nal[QAPISourceInfo],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_array_type(self, name: str, info: Option=
al[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0element_type: QAPISchemaType) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 element =3D self._use_type(element_t=
ype)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._gen_tree(&#39;[&#39; + element=
 + &#39;]&#39;, &#39;array&#39;, {&#39;element-type&#39;: element},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ifcond)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_object_type_flat(self, name: str, info: =
Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features: List[QAPISchemaFe=
ature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0members: List[QAPISchemaObj=
ectTypeMember],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variants: Optional[QAPISche=
maVariants]) -&gt; None:<br>
&gt; @@ -336,7 +335,7 @@ def visit_object_type_flat(self, name: str, info: =
Optional[QAPISourceInfo],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._gen_tree(name, &#39;object&#39=
;, obj, ifcond, features)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_alternate_type(self, name: str, info: Op=
tional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features: List[QAPISchemaFeature],=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variants: QAPISchemaVariants) -&gt=
; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._gen_tree(<br>
&gt; @@ -348,7 +347,7 @@ def visit_alternate_type(self, name: str, info: Op=
tional[QAPISourceInfo],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_command(self, name: str, info: Optional[=
QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 arg_type: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ret_type: Optional[QAPISchemaType], gen: bool,<br>
&gt; @@ -367,7 +366,8 @@ def visit_command(self, name: str, info: Optional[=
QAPISourceInfo],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._gen_tree(name, &#39;command&#3=
9;, obj, ifcond, features)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_event(self, name: str, info: Optional[QA=
PISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ifcond: Sequence[str], features: List[QAPISchemaFeature],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ifcond: QAPISchemaIfCond,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 arg_type: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 boxed: bool) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self._schema is not None<br>
&gt; diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
&gt; index d1d27ff7ee..5e44164bd1 100644<br>
&gt; --- a/scripts/qapi/schema.py<br>
&gt; +++ b/scripts/qapi/schema.py<br>
&gt; @@ -25,6 +25,11 @@<br>
&gt;=C2=A0 from .parser import QAPISchemaParser<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; +class QAPISchemaIfCond:<br>
&gt; +=C2=A0 =C2=A0 def __init__(self, ifcond=3DNone):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or []<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 class QAPISchemaEntity:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 meta: Optional[str] =3D None<br>
&gt;=C2=A0 <br>
&gt; @@ -42,7 +47,7 @@ def __init__(self, name: str, info, doc, ifcond=3DNo=
ne, features=3DNone):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # such place).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.info" rel=3D"=
noreferrer" target=3D"_blank">self.info</a> =3D info<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.doc =3D doc<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ifcond =3D ifcond or []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ifcond =3D ifcond or QAPISchemaIfCo=
nd()<br>
<br>
This is an instance of mechanical pattern #3 where we wrap the value<br>
without changing it.<br>
<br>
Before the patch we use both () and [] as &quot;no conditions&quot;.=C2=A0 =
After the<br>
patch, we always use [], unless something passes another empty sequence<br>
to QAPISchemaIfCond.__init__(), which I don&#39;t think is the case.<br>
Observation, not a request.<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.features =3D features or []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._checked =3D False<br>
&gt;=C2=A0 <br>
&gt; @@ -78,6 +83,7 @@ def set_module(self, schema):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 @property<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def ifcond(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self._checked<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert isinstance(self._ifcond, QAPISchem=
aIfCond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._ifcond<br>
<br>
Non-mechanical hunk.=C2=A0 The commit message claims to list them (&quot;Ex=
cept<br>
for ..., it&#39;s a mechanical change&quot;), but it doesn&#39;t.=C2=A0 Eas=
y enough to<br>
fix.<br></blockquote><div><br></div><div>dropped</div><div> <br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def is_implicit(self):<br>
&gt; @@ -593,7 +599,7 @@ def check(self, schema, seen):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <a href=3D"http://self.info" rel=3D"noreferrer" target=3D"_blank">se=
lf.info</a>,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;discriminator member &#39;%s&#39; of %s must not be optional&q=
uot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 % (self._tag_name, base))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.tag_member.ifcond:<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.tag_member.ifcond.i=
fcond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QA=
PISemError(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <a href=3D"http://self.info" rel=3D"noreferrer" target=3D"_blank">se=
lf.info</a>,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;discriminator member &#39;%s&#39; of %s must not be conditiona=
l&quot;<br>
&gt; @@ -601,7 +607,7 @@ def check(self, schema, seen):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# simple union<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert isinstance(self=
.tag_member.type, QAPISchemaEnumType)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert not self.tag_me=
mber.optional<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self.tag_member.ifco=
nd =3D=3D []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self.tag_member.ifco=
nd.ifcond =3D=3D []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._tag_name:=C2=A0 =C2=A0 # fl=
at union<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # branches that are no=
t explicitly covered get an empty type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cases =3D {<a href=3D"=
http://v.name" rel=3D"noreferrer" target=3D"_blank">v.name</a> for v in sel=
f.variants}<br>
&gt; @@ -646,7 +652,7 @@ def __init__(self, name, info, ifcond=3DNone):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert isinstance(name, str)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.name" rel=3D"=
noreferrer" target=3D"_blank">self.name</a> =3D name<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.info" rel=3D"=
noreferrer" target=3D"_blank">self.info</a> =3D info<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or QAPISchemaIfCon=
d()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.defined_in =3D None<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def set_defined_in(self, name):<br>
&gt; @@ -968,11 +974,13 @@ def _def_predefineds(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _make_features(self, features, info):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if features is None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return []<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaFeature(f[&#39;name&#39=
;], info, f.get(&#39;if&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaFeature(f[&#39;name&#39=
;], info,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPISchemaIfCond(f.get(&#=
39;if&#39;)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in=
 features]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _make_enum_members(self, values, info):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaEnumMember(v[&#39;name&=
#39;], info, v.get(&#39;if&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaEnumMember(v[&#39;name&=
#39;], info,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaIf=
Cond(v.get(&#39;if&#39;)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for v in=
 values]<br>
&gt;=C2=A0 <br>
<br>
Two more instances of pattern #3, only here we wrap values we get from<br>
the JSON parser.=C2=A0 These are either None or non-empty lists.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _make_implicit_enum_type(self, name, info, ifc=
ond, values):<br>
&gt; @@ -1008,7 +1016,10 @@ def _make_implicit_object_type(self, name, info=
, ifcond, role, members):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if typ:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# The implicit objec=
t type has multiple users.=C2=A0 This can<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# happen only for si=
mple unions&#39; implicit wrapper types.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Its ifcond should =
be the disjunction of its user&#39;s<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# ifconds.=C2=A0 Not=
 implemented.=C2=A0 Instead, we always pass the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# wrapped type&#39;s=
 ifcond, which is trivially the same for all<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# users.=C2=A0 It&#3=
9;s also necessary for the wrapper to compile.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# But it&#39;s not t=
ight: the disjunction need not imply it.=C2=A0 We<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# may end up compili=
ng useless wrapper types.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO kill simple uni=
ons or implement the disjunction<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # pylint: disable=3Dpr=
otected-access<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert (ifcond or []) =3D=
=3D typ._ifcond<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(ifcond, QAPIS=
chemaIfCond):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert ifcond=
.ifcond =3D=3D typ._ifcond.ifcond<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert ifcond=
 =3D=3D typ._ifcond<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._def_entity(QAPIS=
chemaObjectType(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, in=
fo, None, ifcond, None, None, members, None))<br>
<br>
This is the non-mechanical change mentioned in the commit message.<br>
<br>
Can you explain where the two cases come from?<br>
<br></blockquote><div><br></div><div>_make_simple_variant() calls _make_imp=
licit_object_type() with self.lookup_type(typ).</div><div><br></div><div>I =
think it could instead call with the ._ifcond value.</div><div><br></div><d=
iv>To be done after?<br></div><div><br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
&gt; @@ -1018,7 +1029,7 @@ def _def_enum_type(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D expr[&#39;enum&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D expr[&#39;data&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D expr.get(&#39;prefix&#39;=
)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._def_entity(QAPISchemaEnumType(=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, info, doc, ifcon=
d, features,<br>
&gt; @@ -1036,7 +1047,8 @@ def _make_member(self, name, typ, ifcond, featur=
es, info):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 self._make_features(features, info))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _make_members(self, data, info):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [self._make_member(key, value[&#39=
;type&#39;], value.get(&#39;if&#39;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [self._make_member(key, value[&#39=
;type&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPISchemaIfCond(value.ge=
t(&#39;if&#39;)),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value.get(&#39;feat=
ures&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (key=
, value) in data.items()]<br>
&gt;=C2=A0 <br>
&gt; @@ -1044,7 +1056,7 @@ def _def_struct_type(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D expr[&#39;struct&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D expr.get(&#39;base&#39;)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D expr[&#39;data&#39;]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._def_entity(QAPISchemaObjectTyp=
e(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, info, doc, ifcon=
d, features, base,<br>
&gt; @@ -1067,7 +1079,7 @@ def _def_union_type(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D expr[&#39;union&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D expr[&#39;data&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D expr.get(&#39;base&#39;)<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_name =3D expr.get(&#39;discrimin=
ator&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_member =3D None<br>
&gt; @@ -1076,15 +1088,19 @@ def _def_union_type(self, expr, info, doc):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, in=
fo, ifcond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bas=
e&#39;, self._make_members(base, info))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tag_name:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [self._make_va=
riant(key, value[&#39;type&#39;],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0value.get(&#39;if&#39;), info)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 for (key, value) in data.items()]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._make_va=
riant(key, value[&#39;type&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaIfCond(va=
lue.get(&#39;if&#39;)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (key, val=
ue) in data.items()]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 members =3D []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [self._make_si=
mple_variant(key, value[&#39;type&#39;],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value.get(&#39;if&#39;), info)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 for (key, value) in data.items()]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum =3D [{&#39;name&#39;: =
<a href=3D"http://v.name" rel=3D"noreferrer" target=3D"_blank">v.name</a>, =
&#39;if&#39;: v.ifcond} for v in variants]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._make_si=
mple_variant(key, value[&#39;type&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 QAPISchemaIfCond(value.get(&#39;if&#39;)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 info)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (key, val=
ue) in data.items()]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum =3D [{&#39;name&#39;: =
<a href=3D"http://v.name" rel=3D"noreferrer" target=3D"_blank">v.name</a>, =
&#39;if&#39;: v.ifcond.ifcond} for v in variants]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typ =3D self._make_imp=
licit_enum_type(name, info, ifcond, enum)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_member =3D QAPISch=
emaObjectTypeMember(&#39;type&#39;, info, typ, False)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 members =3D [tag_membe=
r]<br>
&gt; @@ -1097,11 +1113,13 @@ def _def_union_type(self, expr, info, doc):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 def _def_alternate_type(self, expr, info, doc):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D expr[&#39;alternate&#39;]<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D expr[&#39;data&#39;]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [self._make_variant(key, val=
ue[&#39;type&#39;], value.get(&#39;if&#39;),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info)=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 for (key, value) in data.items()]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._make_variant(key, val=
ue[&#39;type&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaIfCond(value.get(&#39;i=
f&#39;)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (key, value) in data.it=
ems()]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_member =3D QAPISchemaObjectTypeM=
ember(&#39;type&#39;, info, &#39;QType&#39;, False)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._def_entity(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPISchemaAlternateTyp=
e(name, info, doc, ifcond, features,<br>
&gt; @@ -1118,7 +1136,7 @@ def _def_command(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_oob =3D expr.get(&#39;allow-oo=
b&#39;, False)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_preconfig =3D expr.get(&#39;al=
low-preconfig&#39;, False)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 coroutine =3D expr.get(&#39;coroutin=
e&#39;, False)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(data, OrderedDict):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D self._make_im=
plicit_object_type(<br>
&gt; @@ -1137,7 +1155,7 @@ def _def_event(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D expr[&#39;event&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D expr.get(&#39;data&#39;)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 boxed =3D expr.get(&#39;boxed&#39;, =
False)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D expr.get(&#39;if&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D QAPISchemaIfCond(expr.get(&#39=
;if&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D self._make_features(exp=
r.get(&#39;features&#39;), info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(data, OrderedDict):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D self._make_im=
plicit_object_type(<br>
&gt; diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py<br>
&gt; index 20d572a23a..3673cf0f49 100644<br>
&gt; --- a/scripts/qapi/types.py<br>
&gt; +++ b/scripts/qapi/types.py<br>
&gt; @@ -13,7 +13,7 @@<br>
&gt;=C2=A0 # See the COPYING file in the top-level directory.<br>
&gt;=C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 <br>
&gt; -from typing import List, Optional, Sequence<br>
&gt; +from typing import List, Optional<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 from .common import (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 c_enum_const,<br>
&gt; @@ -27,6 +27,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchema,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaEnumMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaFeature,<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectTypeMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaType,<br>
&gt; @@ -50,13 +51,13 @@ def gen_enum_lookup(name: str,<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_name=
=3Dc_name(name))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for memb in members:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index =3D c_enum_const(name, <a href=
=3D"http://memb.name" rel=3D"noreferrer" target=3D"_blank">memb.name</a>, p=
refix)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [%(index)s] =3D &quot;%(name)s&quot;=
,<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0index=3Dindex, name=3D<a href=3D"http://memb.name" rel=3D"nore=
ferrer" target=3D"_blank">memb.name</a>)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 },<br>
&gt; @@ -80,12 +81,12 @@ def gen_enum(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_name=
=3Dc_name(name))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 for memb in enum_members:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 %(c_enum)s,<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0c_enum=3Dc_enum_const(name, <a href=3D"http://memb.name" rel=
=3D"noreferrer" target=3D"_blank">memb.name</a>, prefix))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 } %(c_name)s;<br>
&gt; @@ -125,7 +126,7 @@ def gen_array(name: str, element_type: QAPISchemaT=
ype) -&gt; str:<br>
&gt;=C2=A0 def gen_struct_members(members: List[QAPISchemaObjectTypeMember]=
) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D &#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for memb in members:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if memb.optional:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#=
39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool has_%(c_name)s;<br>
&gt; @@ -135,11 +136,11 @@ def gen_struct_members(members: List[QAPISchemaO=
bjectTypeMember]) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 %(c_type)s %(c_name)s;<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0c_type=3Dmemb.type.c_type(), c_name=3Dc_name(<a href=3D"http:/=
/memb.name" rel=3D"noreferrer" target=3D"_blank">memb.name</a>))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -def gen_object(name: str, ifcond: Sequence[str],<br>
&gt; +def gen_object(name: str, ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base: Opt=
ional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0members: =
List[QAPISchemaObjectTypeMember],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variants:=
 Optional[QAPISchemaVariants]) -&gt; str:<br>
&gt; @@ -158,7 +159,7 @@ def gen_object(name: str, ifcond: Sequence[str],<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 &#39;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 ret +=3D gen_if(ifcond)<br>
&gt; +=C2=A0 =C2=A0 ret +=3D gen_if(ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 struct %(c_name)s {<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt; @@ -192,7 +193,7 @@ def gen_object(name: str, ifcond: Sequence[str],<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 &#39;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 ret +=3D gen_endif(ifcond)<br>
&gt; +=C2=A0 =C2=A0 ret +=3D gen_endif(ifcond.ifcond)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret<br>
&gt;=C2=A0 <br>
&gt; @@ -219,13 +220,13 @@ def gen_variants(variants: QAPISchemaVariants) -=
&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for var in variants.variants:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://var.type.name" =
rel=3D"noreferrer" target=3D"_blank">var.type.name</a> =3D=3D &#39;q_empty&=
#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %(c_type)s %(c_name)s;<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0c_type=3Dvar.type.c_unboxed_type(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0c_name=3Dc_name(<a href=3D"http://var.name" rel=3D"noreferrer"=
 target=3D"_blank">var.name</a>))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifcond.ifcond)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } u;<br>
&gt; @@ -307,7 +308,7 @@ def _gen_type_cleanup(self, name: str) -&gt; None:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_enum_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 members: List[QAPISchemaEnumMember],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 prefix: Optional[str]) -&gt; None:<br>
&gt; @@ -318,7 +319,7 @@ def visit_enum_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_array_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0element_type: QAPISchemaType) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with ifcontext(ifcond, self._genh, s=
elf._genc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._genh.preamble_ad=
d(gen_fwd_object_or_array(name))<br>
&gt; @@ -328,7 +329,7 @@ def visit_array_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_object_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 base: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 members: List[QAPISchemaObjectTypeMember],<br>
&gt; @@ -351,7 +352,7 @@ def visit_object_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_alternate_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info: Optional[QAPISourceInfo],<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features: List[QAPISchemaFeature],=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variants: QAPISchemaVariants) -&gt=
; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with ifcontext(ifcond, self._genh):<=
br>
&gt; diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py<br>
&gt; index 9e96f3c566..67721b2470 100644<br>
&gt; --- a/scripts/qapi/visit.py<br>
&gt; +++ b/scripts/qapi/visit.py<br>
&gt; @@ -13,7 +13,7 @@<br>
&gt;=C2=A0 See the COPYING file in the top-level directory.<br>
&gt;=C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 <br>
&gt; -from typing import List, Optional, Sequence<br>
&gt; +from typing import List, Optional<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 from .common import (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 c_enum_const,<br>
&gt; @@ -29,6 +29,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaEnumMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaEnumType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaFeature,<br>
&gt; +=C2=A0 =C2=A0 QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectType,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaObjectTypeMember,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaType,<br>
&gt; @@ -78,7 +79,7 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 for memb in members:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deprecated =3D &#39;deprecated&#39; =
in [<a href=3D"http://f.name" rel=3D"noreferrer" target=3D"_blank">f.name</=
a> for f in memb.features]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if memb.optional:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#=
39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (visit_optional(v, &quot;%(name)s&quot;, &amp;o=
bj-&gt;has_%(c_name)s)) {<br>
&gt; @@ -111,7 +112,7 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#=
39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 &#39;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if variants:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_member =3D variants.tag_member<b=
r>
&gt; @@ -125,7 +126,7 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for var in variants.variants:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case_str =3D c_enum_co=
nst(<a href=3D"http://tag_member.type.name" rel=3D"noreferrer" target=3D"_b=
lank">tag_member.type.name</a>, <a href=3D"http://var.name" rel=3D"noreferr=
er" target=3D"_blank">var.name</a>,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_member.t=
ype.prefix)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond.=
ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://v=
ar.type.name" rel=3D"noreferrer" target=3D"_blank">var.type.name</a> =3D=3D=
 &#39;q_empty&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # valid =
variant and nothing to do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D=
 mcgen(&#39;&#39;&#39;<br>
&gt; @@ -141,7 +142,7 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case=3Dcase_str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c_type=3Dvar.type.c_name(), c_name=
=3Dc_name(<a href=3D"http://var.name" rel=3D"noreferrer" target=3D"_blank">=
var.name</a>))<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifco=
nd)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifco=
nd.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt; @@ -227,7 +228,7 @@ def gen_visit_alternate(name: str, variants: QAPIS=
chemaVariants) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_name=
=3Dc_name(name))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 for var in variants.variants:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(var.ifcond.ifcond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case %(case)s:<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt; @@ -253,7 +254,7 @@ def gen_visit_alternate(name: str, variants: QAPIS=
chemaVariants) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 &#39;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(var.ifcond.ifcond)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case QTYPE_NONE:<br>
&gt; @@ -352,7 +353,7 @@ def _begin_user_module(self, name: str) -&gt; None=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_enum_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 members: List[QAPISchemaEnumMember],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 prefix: Optional[str]) -&gt; None:<br>
&gt; @@ -363,7 +364,7 @@ def visit_enum_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_array_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0element_type: QAPISchemaType) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with ifcontext(ifcond, self._genh, s=
elf._genc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._genh.add(gen_vis=
it_decl(name))<br>
&gt; @@ -372,7 +373,7 @@ def visit_array_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_object_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 info: Optional[QAPISourceInfo],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 features: List[QAPISchemaFeature],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 base: Optional[QAPISchemaObjectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 members: List[QAPISchemaObjectTypeMember],<br>
&gt; @@ -394,7 +395,7 @@ def visit_object_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def visit_alternate_type(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info: Optional[QAPISourceInfo],<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: Sequence[str],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifcond: QAPISchemaIfCond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features: List[QAPISchemaFeature],=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variants: QAPISchemaVariants) -&gt=
; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with ifcontext(ifcond, self._genh, s=
elf._genc):<br>
&gt; diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-q=
api.py<br>
&gt; index f1c4deb9a5..7907b4ac3a 100755<br>
&gt; --- a/tests/qapi-schema/test-qapi.py<br>
&gt; +++ b/tests/qapi-schema/test-qapi.py<br>
&gt; @@ -94,8 +94,8 @@ def _print_variants(variants):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 @staticmethod<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _print_if(ifcond, indent=3D4):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ifcond:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;%sif %s&#39; % (=
&#39; &#39; * indent, ifcond))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ifcond.ifcond:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;%sif %s&#39; % (=
&#39; &#39; * indent, ifcond.ifcond))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 @classmethod<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _print_features(cls, features, indent=3D4):<br=
>
<br>
</blockquote></div></div>

--000000000000adbf2705c8b782a3--


