Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A7568F976
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 22:05:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPrd8-0003fM-63; Wed, 08 Feb 2023 16:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPrd6-0003Yy-6G
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:05:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPrd4-0005tL-31
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:05:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675890320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fZDP0O547GQuPl5sfePkquryOzS+pIyzVTY/jMGt474=;
 b=FPMacOZyGI0HZTSlYVRSpxqE2oXM3aUluKbMP0R0GaM9w8Wi+fMUK0E2wTFpRh42ax1IqH
 5VElc/xmRVJPuf/SCqMJ/zmjq3Mc1YYTJlaszLHeeLVQSbvmMdPCUFCnWvK5kFcEwCJ+R4
 TQxeDn3egJkCWzTqL9syasy772DJNlU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-yiss-ufqMsGFdTtf7Be6Dw-1; Wed, 08 Feb 2023 16:05:18 -0500
X-MC-Unique: yiss-ufqMsGFdTtf7Be6Dw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C53A101A52E;
 Wed,  8 Feb 2023 21:05:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6C54492C3F;
 Wed,  8 Feb 2023 21:05:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7523A21E6A1F; Wed,  8 Feb 2023 22:05:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,  Michael
 Roth <michael.roth@amd.com>
Subject: Re: [PATCH v2 5/7] qapi/parser: [RFC] add QAPIExpression
References: <20230208021306.870657-1-jsnow@redhat.com>
 <20230208021306.870657-6-jsnow@redhat.com>
 <87cz6kunnv.fsf@pond.sub.org>
 <CAFn=p-YzaURtQnTbPDSMZsYDj2BDhn8b+mg4Mogtpow=engcqw@mail.gmail.com>
Date: Wed, 08 Feb 2023 22:05:16 +0100
In-Reply-To: <CAFn=p-YzaURtQnTbPDSMZsYDj2BDhn8b+mg4Mogtpow=engcqw@mail.gmail.com>
 (John Snow's message of "Wed, 8 Feb 2023 12:17:39 -0500")
Message-ID: <87h6vvrhpv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

John Snow <jsnow@redhat.com> writes:

> On Wed, Feb 8, 2023 at 11:28 AM Markus Armbruster <armbru@redhat.com> wro=
te:
>>
>> John Snow <jsnow@redhat.com> writes:
>>
>> > The idea here is to combine 'TopLevelExpr' and 'ParsedExpression' into
>> > one type that accomplishes the purposes of both types;
>> >
>> > 1. TopLevelExpr is meant to represent a JSON Object, but only those th=
at
>> > represent what qapi-schema calls a TOP-LEVEL-EXPR, i.e. definitions,
>> > pragmas, and includes.
>> >
>> > 2. ParsedExpression is meant to represent a container around the above
>> > type, alongside QAPI-specific metadata -- the QAPISourceInfo and QAPID=
oc
>> > objects.
>> >
>> > We can actually just roll these up into one type: A python mapping that
>> > has the metadata embedded directly inside of it.
>>
>> On the general idea: yes, please!  Gets rid of "TopLevelExpr and
>> _JSONObject are the same, except semantically, but nothing checks that",
>> which I never liked.
>
> I prefer them to be checked/enforced too; I'll admit to trying to do
> "a little less" to try and invoke less magic, especially in Python
> 3.6. The best magic comes in later versions.
>
>>
>> > NB: This necessitates a change of typing for check_if() and
>> > check_keys(), because mypy does not believe UserDict[str, object] =E2=
=8A=86
>> > Dict[str, object]. It will, however, accept Mapping or
>> > MutableMapping. In this case, the immutable form is preferred as an
>> > input parameter because we don't actually mutate the input.
>> >
>> > Without this change, we will observe:
>> > qapi/expr.py:631: error: Argument 1 to "check_keys" has incompatible
>> > type "QAPIExpression"; expected "Dict[str, object]"
>> >
>> > Signed-off-by: John Snow <jsnow@redhat.com>

[...]

>> > diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>> > index f897dffbfd4..88f6fdfa67b 100644
>> > --- a/scripts/qapi/parser.py
>> > +++ b/scripts/qapi/parser.py
>> > @@ -14,14 +14,14 @@
>> >  # This work is licensed under the terms of the GNU GPL, version 2.
>> >  # See the COPYING file in the top-level directory.
>> >
>> > -from collections import OrderedDict
>> > +from collections import OrderedDict, UserDict
>> >  import os
>> >  import re
>> >  from typing import (
>> >      TYPE_CHECKING,
>> >      Dict,
>> >      List,
>> > -    NamedTuple,
>> > +    Mapping,
>> >      Optional,
>> >      Set,
>> >      Union,
>> > @@ -38,21 +38,32 @@
>> >      from .schema import QAPISchemaFeature, QAPISchemaMember
>> >
>> >
>> > -#: Represents a single Top Level QAPI schema expression.
>> > -TopLevelExpr =3D Dict[str, object]
>> > -
>> >  # Return value alias for get_expr().
>> >  _ExprValue =3D Union[List[object], Dict[str, object], str, bool]
>> >
>> > -# FIXME: Consolidate and centralize definitions for TopLevelExpr,
>> > -# _ExprValue, _JSONValue, and _JSONObject; currently scattered across
>> > -# several modules.
>> >
>> > +# FIXME: Consolidate and centralize definitions for _ExprValue,
>> > +# JSONValue, and _JSONObject; currently scattered across several
>> > +# modules.
>> >
>> > -class ParsedExpression(NamedTuple):
>> > -    expr: TopLevelExpr
>> > -    info: QAPISourceInfo
>> > -    doc: Optional['QAPIDoc']
>> > +
>> > +# 3.6 workaround: can be removed when Python 3.7+ is our required ver=
sion.
>> > +if TYPE_CHECKING:
>> > +    _UserDict =3D UserDict[str, object]
>> > +else:
>> > +    _UserDict =3D UserDict
>>
>> Worth mentioning in the commit message?  Genuine question; I'm not sure
>> :)
>>
>
> If you please! My only consideration here was leaving a comment with
> both "3.6" and "3.7" so that when I git grep to upgrade from 3.6 to
> 3.7, there's a shining spotlight on this particular wart.
>
> The problem here is that Python 3.6 does not believe that you can
> subscript UserDict, because UserDict is not generic in its
> *implementation*, it's only generic in its type stub. Short-sighted
> problem that was corrected for 3.7; here's a bug filed by Papa Guido
> heself: https://github.com/python/typing/issues/60
>
> (This bug is where I found this workaround from.)
>
>> > +
>> > +
>> > +class QAPIExpression(_UserDict):
>> > +    def __init__(
>> > +        self,
>> > +        initialdata: Mapping[str, object],
>>
>> I'd prefer to separate words: initial_data.
>>
>
> Wasn't my choice:
> https://docs.python.org/3/library/collections.html#collections.UserDict

Alright then.

>> > +        info: QAPISourceInfo,
>> > +        doc: Optional['QAPIDoc'] =3D None,
>> > +    ):
>> > +        super().__init__(initialdata)
>> > +        self.info =3D info
>> > +        self.doc: Optional['QAPIDoc'] =3D doc
>> >
>> >
>> >  class QAPIParseError(QAPISourceError):

[...]

>> > @@ -1139,52 +1143,49 @@ def _def_command(self, expr, info, doc):
>> >          allow_preconfig =3D expr.get('allow-preconfig', False)
>> >          coroutine =3D expr.get('coroutine', False)
>> >          ifcond =3D QAPISchemaIfCond(expr.get('if'))
>> > -        features =3D self._make_features(expr.get('features'), info)
>> > +        features =3D self._make_features(expr.get('features'), expr.i=
nfo)
>> >          if isinstance(data, OrderedDict):
>> >              data =3D self._make_implicit_object_type(
>> > -                name, info, ifcond,
>> > -                'arg', self._make_members(data, info))
>> > +                name, expr.info, ifcond,
>> > +                'arg', self._make_members(data, expr.info))
>> >          if isinstance(rets, list):
>> >              assert len(rets) =3D=3D 1
>> > -            rets =3D self._make_array_type(rets[0], info)
>> > -        self._def_entity(QAPISchemaCommand(name, info, doc, ifcond, f=
eatures,
>> > -                                           data, rets,
>> > +            rets =3D self._make_array_type(rets[0], expr.info)
>> > +        self._def_entity(QAPISchemaCommand(name, expr.info, expr.doc,=
 ifcond,
>> > +                                           features, data, rets,
>> >                                             gen, success_response,
>> >                                             boxed, allow_oob, allow_pr=
econfig,
>> >                                             coroutine))
>> >
>> > -    def _def_event(self, expr, info, doc):
>> > +    def _def_event(self, expr: QAPIExpression):
>> >          name =3D expr['event']
>> >          data =3D expr.get('data')
>> >          boxed =3D expr.get('boxed', False)
>> >          ifcond =3D QAPISchemaIfCond(expr.get('if'))
>> > -        features =3D self._make_features(expr.get('features'), info)
>> > +        features =3D self._make_features(expr.get('features'), expr.i=
nfo)
>> >          if isinstance(data, OrderedDict):
>> >              data =3D self._make_implicit_object_type(
>> > -                name, info, ifcond,
>> > -                'arg', self._make_members(data, info))
>> > -        self._def_entity(QAPISchemaEvent(name, info, doc, ifcond, fea=
tures,
>> > -                                         data, boxed))
>> > +                name, expr.info, ifcond,
>> > +                'arg', self._make_members(data, expr.info))
>> > +        self._def_entity(QAPISchemaEvent(name, expr.info, expr.doc, i=
fcond,
>> > +                                         features, data, boxed))
>> >
>> >      def _def_exprs(self, exprs):
>> > -        for expr_elem in exprs:
>> > -            expr =3D expr_elem.expr
>> > -            info =3D expr_elem.info
>> > -            doc =3D expr_elem.doc
>> > +        for expr in exprs:
>> >              if 'enum' in expr:
>> > -                self._def_enum_type(expr, info, doc)
>> > +                self._def_enum_type(expr)
>> >              elif 'struct' in expr:
>> > -                self._def_struct_type(expr, info, doc)
>> > +                self._def_struct_type(expr)
>> >              elif 'union' in expr:
>> > -                self._def_union_type(expr, info, doc)
>> > +                self._def_union_type(expr)
>> >              elif 'alternate' in expr:
>> > -                self._def_alternate_type(expr, info, doc)
>> > +                self._def_alternate_type(expr)
>> >              elif 'command' in expr:
>> > -                self._def_command(expr, info, doc)
>> > +                self._def_command(expr)
>> >              elif 'event' in expr:
>> > -                self._def_event(expr, info, doc)
>> > +                self._def_event(expr)
>> >              elif 'include' in expr:
>> > -                self._def_include(expr, info, doc)
>> > +                self._def_include(expr)
>> >              else:
>> >                  assert False
>>
>> The insertion of expr. makes the patch a bit tiresome to review.  I
>> only skimmed it for now.
>
> There's indeed a lot of mechanical churn. It appears to work via
> testing; both make check and the full CI job.
> "It compiles, how wrong could it be!?"
>
> *ducks*

A few local variables could reduce churn.  Not sure we want them in the
final code, though.  Use your judgement.


