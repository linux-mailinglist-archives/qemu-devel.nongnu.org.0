Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A981B3A7D57
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 13:35:59 +0200 (CEST)
Received: from localhost ([::1]:54198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt7MM-0002ta-Nr
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 07:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lt7Km-0001mm-HV
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:34:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lt7Kc-0007Ty-IP
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623756848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ByRpNgQpJ4kz620weL0IohZDGt6JvVhcTPd5SWeO4Wk=;
 b=Ksh+TfnnMUK1XuBuQQuNcJKO0WZ09fyJyTO2zOuwm6fmConob6CJWp5phJUyLGkhhnAGlr
 Q4lsCluLqI5ClbyjkUVyUjsOq9mpQIMyZBQOXhePiZDQOsl2ZV0gHNxh+H5rRjpbluIoNE
 R8CfyDnSBv7VaSWTlFo1/8L52bq7jp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-UJkpbqx4N2uEvJn77Idymg-1; Tue, 15 Jun 2021 07:34:06 -0400
X-MC-Unique: UJkpbqx4N2uEvJn77Idymg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3710B803622
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 11:34:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24F9160622;
 Tue, 15 Jun 2021 11:34:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AC4D0113865F; Tue, 15 Jun 2021 13:34:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v5 7/9] qapi: normalize 'if' condition to IfPredicate tree
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
 <20210608120723.2268181-8-marcandre.lureau@redhat.com>
Date: Tue, 15 Jun 2021 13:34:00 +0200
In-Reply-To: <20210608120723.2268181-8-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 8 Jun 2021 16:07:21 +0400")
Message-ID: <87zgvrqs47.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jsnow@redhat.com, Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Modify check_if() to normalize the condition tree.

How is it normalized?  Let me rephrase my question: how does the IR
change?  If the generated code changes, how?

> Add _make_if() to build a QAPISchemaIfCond tree.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Tested-by: John Snow <jsnow@redhat.com>
> ---
>  tests/unit/test-qmp-cmds.c                    |  1 +
>  scripts/qapi/expr.py                          | 51 +++++++++------
>  scripts/qapi/schema.py                        | 62 +++++++++++++------
>  tests/qapi-schema/bad-if-empty-list.json      |  2 +-
>  tests/qapi-schema/bad-if-list.json            |  2 +-
>  tests/qapi-schema/bad-if.err                  |  3 +-
>  tests/qapi-schema/doc-good.out                | 12 ++--
>  tests/qapi-schema/enum-if-invalid.err         |  3 +-
>  tests/qapi-schema/features-if-invalid.err     |  2 +-
>  tests/qapi-schema/qapi-schema-test.json       | 32 ++++++----
>  tests/qapi-schema/qapi-schema-test.out        | 59 ++++++++++--------
>  .../qapi-schema/struct-member-if-invalid.err  |  2 +-
>  .../qapi-schema/union-branch-if-invalid.json  |  2 +-
>  13 files changed, 143 insertions(+), 90 deletions(-)
>
> diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
> index 1b0b7d99df..83efa39720 100644
> --- a/tests/unit/test-qmp-cmds.c
> +++ b/tests/unit/test-qmp-cmds.c
> @@ -51,6 +51,7 @@ FeatureStruct1 *qmp_test_features0(bool has_fs0, Featur=
eStruct0 *fs0,
>                                     bool has_cfs1, CondFeatureStruct1 *cf=
s1,
>                                     bool has_cfs2, CondFeatureStruct2 *cf=
s2,
>                                     bool has_cfs3, CondFeatureStruct3 *cf=
s3,
> +                                   bool has_cfs4, CondFeatureStruct4 *cf=
s4,
>                                     Error **errp)
>  {
>      return g_new0(FeatureStruct1, 1);
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 496f7e0333..60ffe9ef03 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -261,12 +261,12 @@ def check_if(expr: _JSONObject, info: QAPISourceInf=
o, source: str) -> None:
>      """
>      Normalize and validate the ``if`` member of an object.
> =20
> -    The ``if`` member may be either a ``str`` or a ``List[str]``.
> -    A ``str`` value will be normalized to ``List[str]``.

Double-checking: is this doc comment correct before this patch?

> +    The ``if`` field may be either a ``str`` or a dict.
> +    A ``str`` element will be normalized to ``{'all': List[str]}``.
> =20
>      :forms:
> -      :sugared: ``Union[str, List[str]]``
> -      :canonical: ``List[str]``
> +      :sugared: ``Union[str, dict]``
> +      :canonical: ``Union[str, dict]``
> =20
>      :param expr: The expression containing the ``if`` member to validate=
.
>      :param info: QAPI schema source file information.
> @@ -281,25 +281,38 @@ def check_if(expr: _JSONObject, info: QAPISourceInf=
o, source: str) -> None:
>      if ifcond is None:
>          return
> =20
> -    if isinstance(ifcond, list):
> -        if not ifcond:
> -            raise QAPISemError(
> -                info, "'if' condition [] of %s is useless" % source)
> -    else:
> -        # Normalize to a list
> -        ifcond =3D expr['if'] =3D [ifcond]
> -
> -    for elt in ifcond:
> -        if not isinstance(elt, str):
> +    def normalize(cond: Union[str, object]) -> Union[str, object]:

This definition is in the middle of check_if()'s body.  Intentional?

> +        if isinstance(cond, str):
> +            if not cond.strip():
> +                raise QAPISemError(
> +                    info,
> +                    "'if' condition '%s' of %s makes no sense"
> +                    % (cond, source))
> +            return cond
> +        if not isinstance(cond, dict):
>              raise QAPISemError(
>                  info,
> -                "'if' condition of %s must be a string or a list of stri=
ngs"
> -                % source)
> -        if not elt.strip():
> +                "'if' condition of %s must be a string or a dict" % sour=
ce)
> +        if len(cond) !=3D 1:
>              raise QAPISemError(
>                  info,
> -                "'if' condition '%s' of %s makes no sense"
> -                % (elt, source))
> +                "'if' condition dict of %s must have one key: "

Exactly one key, to be precise.

> +                "'all', 'any' or 'not'" % source)
> +        check_keys(cond, info, "'if' condition", [],
> +                   ["all", "any", "not"])

Hmmm.  Getting members of @cond before check_keys() would be wrong, but
you don't do that.  Still, I like to call check_keys() early, just to
reduce the chance for accidents.

If we check_keys() first, we're left with just two possible errors:
empty dict (len(cond)=3D=3D0), and conflicting keys (len(cond)>1).  We coul=
d
choose to diagnose them separately, but it's probably not worth the
bother.

> +        oper, operands =3D next(iter(cond.items()))
> +        if not operands:
> +            raise QAPISemError(
> +                info, "'if' condition [] of %s is useless" % source)
> +        if oper =3D=3D "not":
> +            return {oper: normalize(operands)}
> +        if oper in ("all", "any") and not isinstance(operands, list):
> +            raise QAPISemError(
> +                info, "'%s' condition of %s must be a list" % (oper, sou=
rce))
> +        operands =3D [normalize(o) for o in operands]
> +        return {oper: operands}

I guess making this a function enables writing

               return NE

instead of

               expr['if] =3D NE
               return

which is slightly more compact, and factors out the assignment's left
hand side.  Feels like a wash, but up to you.

> +
> +    expr['if'] =3D normalize(ifcond)
> =20
> =20
>  def normalize_members(members: object) -> None:
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index f52caaeecc..9864e49c54 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -22,6 +22,8 @@
>  from .common import (
>      POINTER_SUFFIX,
>      IfAll,
> +    IfAny,
> +    IfNot,
>      IfOption,
>      c_name,
>  )
> @@ -31,15 +33,14 @@
> =20
> =20
>  class QAPISchemaIfCond:
> -    def __init__(self, ifcond=3DNone):
> -        self.ifcond =3D ifcond or []
> -        self.pred =3D IfAll([IfOption(opt) for opt in self.ifcond])
> +    def __init__(self, pred=3DNone):
> +        self.pred =3D pred
> =20
>      def docgen(self):
> -        return self.pred.docgen()
> +        return self and self.pred.docgen()

The more code relying on your __bool__() methods I see, the less I like
them.

Can we do self.pred and self.pred.docgen()?

> =20
>      def cgen(self):
> -        return self.pred.cgen()
> +        return self and self.pred.cgen()

Likewise.

> =20
>      # Returns true if the condition is not void
>      def __bool__(self):
> @@ -991,16 +992,41 @@ def _def_predefineds(self):
>          self._def_entity(QAPISchemaEnumType('QType', None, None, None, N=
one,
>                                              qtype_values, 'QTYPE'))
> =20
> +    def _make_if(self, cond):
> +        if isinstance(cond, QAPISchemaIfCond):
> +            return cond
> +        if cond is None:
> +            return QAPISchemaIfCond()
> +
> +        def make_pred(node):
> +            if isinstance(node, str):
> +                return IfOption(node)
> +            oper, operands =3D next(iter(node.items()))
> +            op2cls =3D {
> +                'all': IfAll,
> +                'any': IfAny,
> +                'not': IfNot,
> +            }
> +
> +            if isinstance(operands, list):
> +                operands =3D [make_pred(o) for o in operands]
> +            else:
> +                operands =3D make_pred(operands)
> +
> +            return op2cls[oper](operands)
> +
> +        return QAPISchemaIfCond(make_pred(cond))

Maybe it's the weather, but I find this pretty impenetrable right now.

make_if() appears to accept either QAPISchemaIfCond, None, or a tree
whose inner nodes are {'any': List[tree]}, {'all': List[tree]}, {'not':
tree}, or str.  Quite the omnivore.

None of the callers I can see pass QAPISchemaIfCond.  Am I confused?

make_pred() appears to accept the tree.  The part dealing with str is
obvious.

next(iter(node.items())) appears to map a dict {key: val} to a tuple
(key, val).  Too clever by half.

val, and thus @operands then is either a list of trees (all, any), or a
tree (not).

The tree(s) in @operands get recursively processed.  Now @operands is
either a List[IfPredicate], or an IfPredicate.

IfAll and IfAny take the former, IfNot takes the latter.  Works out
(*quack*), but I'm not sure mypy will be happy with it.

> +
>      def _make_features(self, features, info):
>          if features is None:
>              return []
>          return [QAPISchemaFeature(f['name'], info,
> -                                  QAPISchemaIfCond(f.get('if')))
> +                                  self._make_if(f.get('if')))
>                  for f in features]
> =20
>      def _make_enum_members(self, values, info):
>          return [QAPISchemaEnumMember(v['name'], info,
> -                                     QAPISchemaIfCond(v.get('if')))
> +                                     self._make_if(v.get('if')))
>                  for v in values]
> =20
>      def _make_implicit_enum_type(self, name, info, ifcond, values):
> @@ -1046,7 +1072,7 @@ def _def_enum_type(self, expr, info, doc):
>          name =3D expr['enum']
>          data =3D expr['data']
>          prefix =3D expr.get('prefix')
> -        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> +        ifcond =3D self._make_if(expr.get('if'))
>          features =3D self._make_features(expr.get('features'), info)
>          self._def_entity(QAPISchemaEnumType(
>              name, info, doc, ifcond, features,
> @@ -1065,7 +1091,7 @@ def _make_member(self, name, typ, ifcond, features,=
 info):
> =20
>      def _make_members(self, data, info):
>          return [self._make_member(key, value['type'],
> -                                  QAPISchemaIfCond(value.get('if')),
> +                                  self._make_if(value.get('if')),
>                                    value.get('features'), info)
>                  for (key, value) in data.items()]
> =20
> @@ -1073,7 +1099,7 @@ def _def_struct_type(self, expr, info, doc):
>          name =3D expr['struct']
>          base =3D expr.get('base')
>          data =3D expr['data']
> -        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> +        ifcond =3D self._make_if(expr.get('if'))
>          features =3D self._make_features(expr.get('features'), info)
>          self._def_entity(QAPISchemaObjectType(
>              name, info, doc, ifcond, features, base,
> @@ -1096,7 +1122,7 @@ def _def_union_type(self, expr, info, doc):
>          name =3D expr['union']
>          data =3D expr['data']
>          base =3D expr.get('base')
> -        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> +        ifcond =3D self._make_if(expr.get('if'))
>          features =3D self._make_features(expr.get('features'), info)
>          tag_name =3D expr.get('discriminator')
>          tag_member =3D None
> @@ -1107,7 +1133,7 @@ def _def_union_type(self, expr, info, doc):
>          if tag_name:
>              variants =3D [
>                  self._make_variant(key, value['type'],
> -                                   QAPISchemaIfCond(value.get('if')),
> +                                   self._make_if(value.get('if')),
>                                     info)
>                  for (key, value) in data.items()
>              ]
> @@ -1115,11 +1141,11 @@ def _def_union_type(self, expr, info, doc):
>          else:
>              variants =3D [
>                  self._make_simple_variant(key, value['type'],
> -                                          QAPISchemaIfCond(value.get('if=
')),
> +                                          self._make_if(value.get('if'))=
,
>                                            info)
>                  for (key, value) in data.items()
>              ]
> -            enum =3D [{'name': v.name, 'if': v.ifcond.ifcond} for v in v=
ariants]
> +            enum =3D [{'name': v.name, 'if': v.ifcond} for v in variants=
]

Another riddle for me to solve?

>              typ =3D self._make_implicit_enum_type(name, info, ifcond, en=
um)
>              tag_member =3D QAPISchemaObjectTypeMember('type', info, typ,=
 False)
>              members =3D [tag_member]
> @@ -1132,11 +1158,11 @@ def _def_union_type(self, expr, info, doc):
>      def _def_alternate_type(self, expr, info, doc):
>          name =3D expr['alternate']
>          data =3D expr['data']
> -        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> +        ifcond =3D self._make_if(expr.get('if'))
>          features =3D self._make_features(expr.get('features'), info)
>          variants =3D [
>              self._make_variant(key, value['type'],
> -                               QAPISchemaIfCond(value.get('if')),
> +                               self._make_if(value.get('if')),
>                                 info)
>              for (key, value) in data.items()
>          ]
> @@ -1156,7 +1182,7 @@ def _def_command(self, expr, info, doc):
>          allow_oob =3D expr.get('allow-oob', False)
>          allow_preconfig =3D expr.get('allow-preconfig', False)
>          coroutine =3D expr.get('coroutine', False)
> -        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> +        ifcond =3D self._make_if(expr.get('if'))
>          features =3D self._make_features(expr.get('features'), info)
>          if isinstance(data, OrderedDict):
>              data =3D self._make_implicit_object_type(
> @@ -1175,7 +1201,7 @@ def _def_event(self, expr, info, doc):
>          name =3D expr['event']
>          data =3D expr.get('data')
>          boxed =3D expr.get('boxed', False)
> -        ifcond =3D QAPISchemaIfCond(expr.get('if'))
> +        ifcond =3D self._make_if(expr.get('if'))
>          features =3D self._make_features(expr.get('features'), info)
>          if isinstance(data, OrderedDict):
>              data =3D self._make_implicit_object_type(
> diff --git a/tests/qapi-schema/bad-if-empty-list.json b/tests/qapi-schema=
/bad-if-empty-list.json
> index 94f2eb8670..b62b5671df 100644
> --- a/tests/qapi-schema/bad-if-empty-list.json
> +++ b/tests/qapi-schema/bad-if-empty-list.json
> @@ -1,3 +1,3 @@
>  # check empty 'if' list
>  { 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
> -  'if': [] }
> +  'if': { 'all': [] } }
> diff --git a/tests/qapi-schema/bad-if-list.json b/tests/qapi-schema/bad-i=
f-list.json
> index ea3d95bb6b..1fefef16a7 100644
> --- a/tests/qapi-schema/bad-if-list.json
> +++ b/tests/qapi-schema/bad-if-list.json
> @@ -1,3 +1,3 @@
>  # check invalid 'if' content
>  { 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
> -  'if': ['foo', ' '] }
> +  'if': { 'all': ['foo', ' '] } }
> diff --git a/tests/qapi-schema/bad-if.err b/tests/qapi-schema/bad-if.err
> index f83dee65da..454fbae387 100644
> --- a/tests/qapi-schema/bad-if.err
> +++ b/tests/qapi-schema/bad-if.err
> @@ -1,2 +1,3 @@
>  bad-if.json: In struct 'TestIfStruct':
> -bad-if.json:2: 'if' condition of struct must be a string or a list of st=
rings
> +bad-if.json:2: 'if' condition has unknown key 'value'
> +Valid keys are 'all', 'any', 'not'.
> diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.=
out
> index db1d23c6bf..4d951f97ee 100644
> --- a/tests/qapi-schema/doc-good.out
> +++ b/tests/qapi-schema/doc-good.out
> @@ -12,15 +12,15 @@ enum QType
>  module doc-good.json
>  enum Enum
>      member one
> -        if IfAll([IfOption('defined(IFONE)')])
> +        if IfOption('defined(IFONE)')
>      member two
> -    if IfAll([IfOption('defined(IFCOND)')])
> +    if IfOption('defined(IFCOND)')
>      feature enum-feat
>  object Base
>      member base1: Enum optional=3DFalse
>  object Variant1
>      member var1: str optional=3DFalse
> -        if IfAll([IfOption('defined(IFSTR)')])
> +        if IfOption('defined(IFSTR)')
>          feature member-feat
>      feature variant1-feat
>  object Variant2
> @@ -29,7 +29,7 @@ object Object
>      tag base1
>      case one: Variant1
>      case two: Variant2
> -        if IfAll([IfOption('IFTWO')])
> +        if IfOption('IFTWO')
>      feature union-feat1
>  object q_obj_Variant1-wrapper
>      member data: Variant1 optional=3DFalse
> @@ -38,13 +38,13 @@ object q_obj_Variant2-wrapper
>  enum SugaredUnionKind
>      member one
>      member two
> -        if IfAll([IfOption('IFTWO')])
> +        if IfOption('IFTWO')
>  object SugaredUnion
>      member type: SugaredUnionKind optional=3DFalse
>      tag type
>      case one: q_obj_Variant1-wrapper
>      case two: q_obj_Variant2-wrapper
> -        if IfAll([IfOption('IFTWO')])
> +        if IfOption('IFTWO')
>      feature union-feat2
>  alternate Alternate
>      tag type
[...]

Skipping the tests for now because I'm running out of brain-juice.


