Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEBA68F329
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 17:29:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPnJQ-0000Yc-7g; Wed, 08 Feb 2023 11:28:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPnJN-0000YO-OK
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 11:28:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPnJK-0006wP-MV
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 11:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675873721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFoQYrtr5ZLpW6/eGcRVnm2UBF0keVy+Ka9VY/G+2D8=;
 b=EH34RROgNZXCQqjBkNww9SxZCgrFsYODm0wJFY1l/coEO0UmxyMxQyL+6BLwWtDpTWAl21
 P/3wkCIr0ZXXglg2DBBBAzCveHkTKDRVTsCCCCzqPWE9UhT9pQQpKVAzxSMP+ARmfVDY+1
 LMDSOxgks7vqr4ObL85CEUDjNkbK/zs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-teXx_5MqOz65E7y_q7bMjg-1; Wed, 08 Feb 2023 11:28:38 -0500
X-MC-Unique: teXx_5MqOz65E7y_q7bMjg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B52BE1C0514B;
 Wed,  8 Feb 2023 16:28:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3134240B42D4;
 Wed,  8 Feb 2023 16:28:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1979821E6A1F; Wed,  8 Feb 2023 17:28:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v2 5/7] qapi/parser: [RFC] add QAPIExpression
References: <20230208021306.870657-1-jsnow@redhat.com>
 <20230208021306.870657-6-jsnow@redhat.com>
Date: Wed, 08 Feb 2023 17:28:36 +0100
In-Reply-To: <20230208021306.870657-6-jsnow@redhat.com> (John Snow's message
 of "Tue, 7 Feb 2023 21:13:04 -0500")
Message-ID: <87cz6kunnv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

> The idea here is to combine 'TopLevelExpr' and 'ParsedExpression' into
> one type that accomplishes the purposes of both types;
>
> 1. TopLevelExpr is meant to represent a JSON Object, but only those that
> represent what qapi-schema calls a TOP-LEVEL-EXPR, i.e. definitions,
> pragmas, and includes.
>
> 2. ParsedExpression is meant to represent a container around the above
> type, alongside QAPI-specific metadata -- the QAPISourceInfo and QAPIDoc
> objects.
>
> We can actually just roll these up into one type: A python mapping that
> has the metadata embedded directly inside of it.

On the general idea: yes, please!  Gets rid of "TopLevelExpr and
_JSONObject are the same, except semantically, but nothing checks that",
which I never liked.

> NB: This necessitates a change of typing for check_if() and
> check_keys(), because mypy does not believe UserDict[str, object] =E2=8A=
=86
> Dict[str, object]. It will, however, accept Mapping or
> MutableMapping. In this case, the immutable form is preferred as an
> input parameter because we don't actually mutate the input.
>
> Without this change, we will observe:
> qapi/expr.py:631: error: Argument 1 to "check_keys" has incompatible
> type "QAPIExpression"; expected "Dict[str, object]"
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/expr.py   | 133 +++++++++++++++++++----------------------
>  scripts/qapi/parser.py |  43 ++++++++-----
>  scripts/qapi/schema.py | 105 ++++++++++++++++----------------
>  3 files changed, 142 insertions(+), 139 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 95a25758fed..83fa7a85b06 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -34,9 +34,9 @@
>  import re
>  from typing import (
>      Collection,
> -    Dict,
>      Iterable,
>      List,
> +    Mapping,
>      Optional,
>      Union,
>      cast,
> @@ -44,7 +44,7 @@
>=20=20
>  from .common import c_name
>  from .error import QAPISemError
> -from .parser import ParsedExpression, TopLevelExpr
> +from .parser import QAPIExpression
>  from .source import QAPISourceInfo
>=20=20
>=20=20
> @@ -53,7 +53,7 @@
>  # here (and also not practical as long as mypy lacks recursive
>  # types), because the purpose of this module is to interrogate that
>  # type.
> -_JSONObject =3D Dict[str, object]
> +_JSONObject =3D Mapping[str, object]
>=20=20
>=20=20
>  # See check_name_str(), below.
> @@ -229,12 +229,11 @@ def pprint(elems: Iterable[str]) -> str:
>                 pprint(unknown), pprint(allowed)))
>=20=20
>=20=20
> -def check_flags(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
> +def check_flags(expr: QAPIExpression) -> None:
>      """
>      Ensure flag members (if present) have valid values.
>=20=20
> -    :param expr: The `TopLevelExpr` to validate.
> -    :param info: QAPI schema source file information.
> +    :param expr: The `QAPIExpression` to validate.
>=20=20
>      :raise QAPISemError:
>          When certain flags have an invalid value, or when
> @@ -243,18 +242,18 @@ def check_flags(expr: TopLevelExpr, info: QAPISourc=
eInfo) -> None:
>      for key in ('gen', 'success-response'):
>          if key in expr and expr[key] is not False:
>              raise QAPISemError(
> -                info, "flag '%s' may only use false value" % key)
> +                expr.info, "flag '%s' may only use false value" % key)
>      for key in ('boxed', 'allow-oob', 'allow-preconfig', 'coroutine'):
>          if key in expr and expr[key] is not True:
>              raise QAPISemError(
> -                info, "flag '%s' may only use true value" % key)
> +                expr.info, "flag '%s' may only use true value" % key)
>      if 'allow-oob' in expr and 'coroutine' in expr:
>          # This is not necessarily a fundamental incompatibility, but
>          # we don't have a use case and the desired semantics isn't
>          # obvious.  The simplest solution is to forbid it until we get
>          # a use case for it.
> -        raise QAPISemError(info, "flags 'allow-oob' and 'coroutine' "
> -                                 "are incompatible")
> +        raise QAPISemError(
> +            expr.info, "flags 'allow-oob' and 'coroutine' are incompatib=
le")
>=20=20
>=20=20
>  def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> No=
ne:
> @@ -447,12 +446,11 @@ def check_features(features: Optional[object],
>          check_if(feat, info, source)
>=20=20
>=20=20
> -def check_enum(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
> +def check_enum(expr: QAPIExpression) -> None:
>      """
> -    Normalize and validate this `TopLevelExpr` as an ``enum`` definition.
> +    Normalize and validate this `QAPIExpression` as an ``enum`` definiti=
on.
>=20=20
>      :param expr: The expression to validate.
> -    :param info: QAPI schema source file information.
>=20=20
>      :raise QAPISemError: When ``expr`` is not a valid ``enum``.
>      :return: None, ``expr`` is normalized in-place as needed.
> @@ -462,36 +460,35 @@ def check_enum(expr: TopLevelExpr, info: QAPISource=
Info) -> None:
>      prefix =3D expr.get('prefix')
>=20=20
>      if not isinstance(members, list):
> -        raise QAPISemError(info, "'data' must be an array")
> +        raise QAPISemError(expr.info, "'data' must be an array")
>      if prefix is not None and not isinstance(prefix, str):
> -        raise QAPISemError(info, "'prefix' must be a string")
> +        raise QAPISemError(expr.info, "'prefix' must be a string")
>=20=20
> -    permissive =3D name in info.pragma.member_name_exceptions
> +    permissive =3D name in expr.info.pragma.member_name_exceptions
>=20=20
>      members[:] =3D [m if isinstance(m, dict) else {'name': m}
>                    for m in members]
>      for member in members:
>          source =3D "'data' member"
> -        check_keys(member, info, source, ['name'], ['if', 'features'])
> +        check_keys(member, expr.info, source, ['name'], ['if', 'features=
'])
>          member_name =3D member['name']
> -        check_name_is_str(member_name, info, source)
> +        check_name_is_str(member_name, expr.info, source)
>          source =3D "%s '%s'" % (source, member_name)
>          # Enum members may start with a digit
>          if member_name[0].isdigit():
>              member_name =3D 'd' + member_name  # Hack: hide the digit
> -        check_name_lower(member_name, info, source,
> +        check_name_lower(member_name, expr.info, source,
>                           permit_upper=3Dpermissive,
>                           permit_underscore=3Dpermissive)
> -        check_if(member, info, source)
> -        check_features(member.get('features'), info)
> +        check_if(member, expr.info, source)
> +        check_features(member.get('features'), expr.info)
>=20=20
>=20=20
> -def check_struct(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
> +def check_struct(expr: QAPIExpression) -> None:
>      """
> -    Normalize and validate this `TopLevelExpr` as a ``struct`` definitio=
n.
> +    Normalize and validate this `QAPIExpression` as a ``struct`` definit=
ion.
>=20=20
>      :param expr: The expression to validate.
> -    :param info: QAPI schema source file information.
>=20=20
>      :raise QAPISemError: When ``expr`` is not a valid ``struct``.
>      :return: None, ``expr`` is normalized in-place as needed.
> @@ -499,16 +496,15 @@ def check_struct(expr: TopLevelExpr, info: QAPISour=
ceInfo) -> None:
>      name =3D cast(str, expr['struct'])  # Checked in check_exprs
>      members =3D expr['data']
>=20=20
> -    check_type(members, info, "'data'", allow_dict=3Dname)
> -    check_type(expr.get('base'), info, "'base'")
> +    check_type(members, expr.info, "'data'", allow_dict=3Dname)
> +    check_type(expr.get('base'), expr.info, "'base'")
>=20=20
>=20=20
> -def check_union(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
> +def check_union(expr: QAPIExpression) -> None:
>      """
> -    Normalize and validate this `TopLevelExpr` as a ``union`` definition.
> +    Normalize and validate this `QAPIExpression` as a ``union`` definiti=
on.
>=20=20
>      :param expr: The expression to validate.
> -    :param info: QAPI schema source file information.
>=20=20
>      :raise QAPISemError: when ``expr`` is not a valid ``union``.
>      :return: None, ``expr`` is normalized in-place as needed.
> @@ -518,25 +514,24 @@ def check_union(expr: TopLevelExpr, info: QAPISourc=
eInfo) -> None:
>      discriminator =3D expr['discriminator']
>      members =3D expr['data']
>=20=20
> -    check_type(base, info, "'base'", allow_dict=3Dname)
> -    check_name_is_str(discriminator, info, "'discriminator'")
> +    check_type(base, expr.info, "'base'", allow_dict=3Dname)
> +    check_name_is_str(discriminator, expr.info, "'discriminator'")
>=20=20
>      if not isinstance(members, dict):
> -        raise QAPISemError(info, "'data' must be an object")
> +        raise QAPISemError(expr.info, "'data' must be an object")
>=20=20
>      for (key, value) in members.items():
>          source =3D "'data' member '%s'" % key
> -        check_keys(value, info, source, ['type'], ['if'])
> -        check_if(value, info, source)
> -        check_type(value['type'], info, source, allow_array=3Dnot base)
> +        check_keys(value, expr.info, source, ['type'], ['if'])
> +        check_if(value, expr.info, source)
> +        check_type(value['type'], expr.info, source, allow_array=3Dnot b=
ase)
>=20=20
>=20=20
> -def check_alternate(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
> +def check_alternate(expr: QAPIExpression) -> None:
>      """
> -    Normalize and validate this `TopLevelExpr` as an ``alternate`` defin=
ition.
> +    Normalize and validate a `QAPIExpression` as an ``alternate`` defini=
tion.
>=20=20
>      :param expr: The expression to validate.
> -    :param info: QAPI schema source file information.
>=20=20
>      :raise QAPISemError: When ``expr`` is not a valid ``alternate``.
>      :return: None, ``expr`` is normalized in-place as needed.
> @@ -544,25 +539,24 @@ def check_alternate(expr: TopLevelExpr, info: QAPIS=
ourceInfo) -> None:
>      members =3D expr['data']
>=20=20
>      if not members:
> -        raise QAPISemError(info, "'data' must not be empty")
> +        raise QAPISemError(expr.info, "'data' must not be empty")
>=20=20
>      if not isinstance(members, dict):
> -        raise QAPISemError(info, "'data' must be an object")
> +        raise QAPISemError(expr.info, "'data' must be an object")
>=20=20
>      for (key, value) in members.items():
>          source =3D "'data' member '%s'" % key
> -        check_name_lower(key, info, source)
> -        check_keys(value, info, source, ['type'], ['if'])
> -        check_if(value, info, source)
> -        check_type(value['type'], info, source, allow_array=3DTrue)
> +        check_name_lower(key, expr.info, source)
> +        check_keys(value, expr.info, source, ['type'], ['if'])
> +        check_if(value, expr.info, source)
> +        check_type(value['type'], expr.info, source, allow_array=3DTrue)
>=20=20
>=20=20
> -def check_command(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
> +def check_command(expr: QAPIExpression) -> None:
>      """
> -    Normalize and validate this `TopLevelExpr` as a ``command`` definiti=
on.
> +    Normalize and validate this `QAPIExpression` as a ``command`` defini=
tion.
>=20=20
>      :param expr: The expression to validate.
> -    :param info: QAPI schema source file information.
>=20=20
>      :raise QAPISemError: When ``expr`` is not a valid ``command``.
>      :return: None, ``expr`` is normalized in-place as needed.
> @@ -572,17 +566,16 @@ def check_command(expr: TopLevelExpr, info: QAPISou=
rceInfo) -> None:
>      boxed =3D expr.get('boxed', False)
>=20=20
>      if boxed and args is None:
> -        raise QAPISemError(info, "'boxed': true requires 'data'")
> -    check_type(args, info, "'data'", allow_dict=3Dnot boxed)
> -    check_type(rets, info, "'returns'", allow_array=3DTrue)
> +        raise QAPISemError(expr.info, "'boxed': true requires 'data'")
> +    check_type(args, expr.info, "'data'", allow_dict=3Dnot boxed)
> +    check_type(rets, expr.info, "'returns'", allow_array=3DTrue)
>=20=20
>=20=20
> -def check_event(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
> +def check_event(expr: QAPIExpression) -> None:
>      """
> -    Normalize and validate this `TopLevelExpr` as an ``event`` definitio=
n.
> +    Normalize and validate this `QAPIExpression` as an ``event`` definit=
ion.
>=20=20
>      :param expr: The expression to validate.
> -    :param info: QAPI schema source file information.
>=20=20
>      :raise QAPISemError: When ``expr`` is not a valid ``event``.
>      :return: None, ``expr`` is normalized in-place as needed.
> @@ -591,25 +584,23 @@ def check_event(expr: TopLevelExpr, info: QAPISourc=
eInfo) -> None:
>      boxed =3D expr.get('boxed', False)
>=20=20
>      if boxed and args is None:
> -        raise QAPISemError(info, "'boxed': true requires 'data'")
> -    check_type(args, info, "'data'", allow_dict=3Dnot boxed)
> +        raise QAPISemError(expr.info, "'boxed': true requires 'data'")
> +    check_type(args, expr.info, "'data'", allow_dict=3Dnot boxed)
>=20=20
>=20=20
> -def check_expr(pexpr: ParsedExpression) -> None:
> +def check_expr(expr: QAPIExpression) -> None:
>      """
> -    Validate and normalize a `ParsedExpression`.
> +    Validate and normalize a `QAPIExpression`.
>=20=20
> -    :param pexpr: The parsed expression to normalize and validate.
> +    :param expr: The parsed expression to normalize and validate.
>=20=20
>      :raise QAPISemError: When this expression fails validation.
> -    :return: None, ``pexpr`` is normalized in-place as needed.
> +    :return: None, ``expr`` is normalized in-place as needed.
>      """
> -    expr =3D pexpr.expr
> -    info =3D pexpr.info
> -
>      if 'include' in expr:
>          return
>=20=20
> +    info =3D expr.info
>      metas =3D set(expr.keys() & {
>          'enum', 'struct', 'union', 'alternate', 'command', 'event'})
>      if len(metas) !=3D 1:
> @@ -625,7 +616,7 @@ def check_expr(pexpr: ParsedExpression) -> None:
>      info.set_defn(meta, name)
>      check_defn_name_str(name, info, meta)
>=20=20
> -    doc =3D pexpr.doc
> +    doc =3D expr.doc
>      if doc:
>          if doc.symbol !=3D name:
>              raise QAPISemError(
> @@ -638,24 +629,24 @@ def check_expr(pexpr: ParsedExpression) -> None:
>      if meta =3D=3D 'enum':
>          check_keys(expr, info, meta,
>                     ['enum', 'data'], ['if', 'features', 'prefix'])
> -        check_enum(expr, info)
> +        check_enum(expr)
>      elif meta =3D=3D 'union':
>          check_keys(expr, info, meta,
>                     ['union', 'base', 'discriminator', 'data'],
>                     ['if', 'features'])
>          normalize_members(expr.get('base'))
>          normalize_members(expr['data'])
> -        check_union(expr, info)
> +        check_union(expr)
>      elif meta =3D=3D 'alternate':
>          check_keys(expr, info, meta,
>                     ['alternate', 'data'], ['if', 'features'])
>          normalize_members(expr['data'])
> -        check_alternate(expr, info)
> +        check_alternate(expr)
>      elif meta =3D=3D 'struct':
>          check_keys(expr, info, meta,
>                     ['struct', 'data'], ['base', 'if', 'features'])
>          normalize_members(expr['data'])
> -        check_struct(expr, info)
> +        check_struct(expr)
>      elif meta =3D=3D 'command':
>          check_keys(expr, info, meta,
>                     ['command'],
> @@ -663,21 +654,21 @@ def check_expr(pexpr: ParsedExpression) -> None:
>                      'gen', 'success-response', 'allow-oob',
>                      'allow-preconfig', 'coroutine'])
>          normalize_members(expr.get('data'))
> -        check_command(expr, info)
> +        check_command(expr)
>      elif meta =3D=3D 'event':
>          check_keys(expr, info, meta,
>                     ['event'], ['data', 'boxed', 'if', 'features'])
>          normalize_members(expr.get('data'))
> -        check_event(expr, info)
> +        check_event(expr)
>      else:
>          assert False, 'unexpected meta type'
>=20=20
>      check_if(expr, info, meta)
>      check_features(expr.get('features'), info)
> -    check_flags(expr, info)
> +    check_flags(expr)
>=20=20
>=20=20
> -def check_exprs(exprs: List[ParsedExpression]) -> List[ParsedExpression]:
> +def check_exprs(exprs: List[QAPIExpression]) -> List[QAPIExpression]:
>      """
>      Validate and normalize a list of parsed QAPI schema expressions.
>=20=20
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index f897dffbfd4..88f6fdfa67b 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -14,14 +14,14 @@
>  # This work is licensed under the terms of the GNU GPL, version 2.
>  # See the COPYING file in the top-level directory.
>=20=20
> -from collections import OrderedDict
> +from collections import OrderedDict, UserDict
>  import os
>  import re
>  from typing import (
>      TYPE_CHECKING,
>      Dict,
>      List,
> -    NamedTuple,
> +    Mapping,
>      Optional,
>      Set,
>      Union,
> @@ -38,21 +38,32 @@
>      from .schema import QAPISchemaFeature, QAPISchemaMember
>=20=20
>=20=20
> -#: Represents a single Top Level QAPI schema expression.
> -TopLevelExpr =3D Dict[str, object]
> -
>  # Return value alias for get_expr().
>  _ExprValue =3D Union[List[object], Dict[str, object], str, bool]
>=20=20
> -# FIXME: Consolidate and centralize definitions for TopLevelExpr,
> -# _ExprValue, _JSONValue, and _JSONObject; currently scattered across
> -# several modules.
>=20=20
> +# FIXME: Consolidate and centralize definitions for _ExprValue,
> +# JSONValue, and _JSONObject; currently scattered across several
> +# modules.
>=20=20
> -class ParsedExpression(NamedTuple):
> -    expr: TopLevelExpr
> -    info: QAPISourceInfo
> -    doc: Optional['QAPIDoc']
> +
> +# 3.6 workaround: can be removed when Python 3.7+ is our required versio=
n.
> +if TYPE_CHECKING:
> +    _UserDict =3D UserDict[str, object]
> +else:
> +    _UserDict =3D UserDict

Worth mentioning in the commit message?  Genuine question; I'm not sure
:)

> +
> +
> +class QAPIExpression(_UserDict):
> +    def __init__(
> +        self,
> +        initialdata: Mapping[str, object],

I'd prefer to separate words: initial_data.

> +        info: QAPISourceInfo,
> +        doc: Optional['QAPIDoc'] =3D None,
> +    ):
> +        super().__init__(initialdata)
> +        self.info =3D info
> +        self.doc: Optional['QAPIDoc'] =3D doc
>=20=20
>=20=20
>  class QAPIParseError(QAPISourceError):
> @@ -107,7 +118,7 @@ def __init__(self,
>          self.line_pos =3D 0
>=20=20
>          # Parser output:
> -        self.exprs: List[ParsedExpression] =3D []
> +        self.exprs: List[QAPIExpression] =3D []
>          self.docs: List[QAPIDoc] =3D []
>=20=20
>          # Showtime!
> @@ -178,10 +189,10 @@ def _parse(self) -> None:
>              cur_doc =3D None
>          self.reject_expr_doc(cur_doc)
>=20=20
> -    def _add_expr(self, expr: TopLevelExpr,
> +    def _add_expr(self, expr: Mapping[str, object],
>                    info: QAPISourceInfo,
>                    doc: Optional['QAPIDoc'] =3D None) -> None:
> -        self.exprs.append(ParsedExpression(expr, info, doc))
> +        self.exprs.append(QAPIExpression(expr, info, doc))
>=20=20
>      @staticmethod
>      def reject_expr_doc(doc: Optional['QAPIDoc']) -> None:
> @@ -791,7 +802,7 @@ def connect_feature(self, feature: 'QAPISchemaFeature=
') -> None:
>                                 % feature.name)
>          self.features[feature.name].connect(feature)
>=20=20
> -    def check_expr(self, expr: TopLevelExpr) -> None:
> +    def check_expr(self, expr: QAPIExpression) -> None:
>          if self.has_section('Returns') and 'command' not in expr:
>              raise QAPISemError(self.info,
>                                 "'Returns:' is only valid for commands")
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 89f8e60db36..295c21eab22 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -17,7 +17,7 @@
>  from collections import OrderedDict
>  import os
>  import re
> -from typing import Optional
> +from typing import List, Optional
>=20=20
>  from .common import (
>      POINTER_SUFFIX,
> @@ -29,7 +29,7 @@
>  )
>  from .error import QAPIError, QAPISemError, QAPISourceError
>  from .expr import check_exprs
> -from .parser import QAPISchemaParser
> +from .parser import QAPIExpression, QAPISchemaParser
>=20=20
>=20=20
>  class QAPISchemaIfCond:
> @@ -964,10 +964,11 @@ def module_by_fname(self, fname):
>          name =3D self._module_name(fname)
>          return self._module_dict[name]
>=20=20
> -    def _def_include(self, expr, info, doc):
> +    def _def_include(self, expr: QAPIExpression):
>          include =3D expr['include']
> -        assert doc is None
> -        self._def_entity(QAPISchemaInclude(self._make_module(include), i=
nfo))
> +        assert expr.doc is None
> +        self._def_entity(
> +            QAPISchemaInclude(self._make_module(include), expr.info))
>=20=20
>      def _def_builtin_type(self, name, json_type, c_type):
>          self._def_entity(QAPISchemaBuiltinType(name, json_type, c_type))
> @@ -1045,15 +1046,15 @@ def _make_implicit_object_type(self, name, info, =
ifcond, role, members):
>                  name, info, None, ifcond, None, None, members, None))
>          return name
>=20=20
> -    def _def_enum_type(self, expr, info, doc):
> +    def _def_enum_type(self, expr: QAPIExpression):
>          name =3D expr['enum']
>          data =3D expr['data']
>          prefix =3D expr.get('prefix')
>          ifcond =3D QAPISchemaIfCond(expr.get('if'))
> -        features =3D self._make_features(expr.get('features'), info)
> +        features =3D self._make_features(expr.get('features'), expr.info)
>          self._def_entity(QAPISchemaEnumType(
> -            name, info, doc, ifcond, features,
> -            self._make_enum_members(data, info), prefix))
> +            name, expr.info, expr.doc, ifcond, features,
> +            self._make_enum_members(data, expr.info), prefix))
>=20=20
>      def _make_member(self, name, typ, ifcond, features, info):
>          optional =3D False
> @@ -1072,15 +1073,15 @@ def _make_members(self, data, info):
>                                    value.get('features'), info)
>                  for (key, value) in data.items()]
>=20=20
> -    def _def_struct_type(self, expr, info, doc):
> +    def _def_struct_type(self, expr: QAPIExpression):
>          name =3D expr['struct']
>          base =3D expr.get('base')
>          data =3D expr['data']
>          ifcond =3D QAPISchemaIfCond(expr.get('if'))
> -        features =3D self._make_features(expr.get('features'), info)
> +        features =3D self._make_features(expr.get('features'), expr.info)
>          self._def_entity(QAPISchemaObjectType(
> -            name, info, doc, ifcond, features, base,
> -            self._make_members(data, info),
> +            name, expr.info, expr.doc, ifcond, features, base,
> +            self._make_members(data, expr.info),
>              None))
>=20=20
>      def _make_variant(self, case, typ, ifcond, info):
> @@ -1089,46 +1090,49 @@ def _make_variant(self, case, typ, ifcond, info):
>              typ =3D self._make_array_type(typ[0], info)
>          return QAPISchemaVariant(case, info, typ, ifcond)
>=20=20
> -    def _def_union_type(self, expr, info, doc):
> +    def _def_union_type(self, expr: QAPIExpression):
>          name =3D expr['union']
>          base =3D expr['base']
>          tag_name =3D expr['discriminator']
>          data =3D expr['data']
> +        assert isinstance(data, dict)
>          ifcond =3D QAPISchemaIfCond(expr.get('if'))
> -        features =3D self._make_features(expr.get('features'), info)
> +        features =3D self._make_features(expr.get('features'), expr.info)
>          if isinstance(base, dict):
>              base =3D self._make_implicit_object_type(
> -                name, info, ifcond,
> -                'base', self._make_members(base, info))
> +                name, expr.info, ifcond,
> +                'base', self._make_members(base, expr.info))
>          variants =3D [
>              self._make_variant(key, value['type'],
>                                 QAPISchemaIfCond(value.get('if')),
> -                               info)
> +                               expr.info)
>              for (key, value) in data.items()]
> -        members =3D []
> +        members: List[QAPISchemaObjectTypeMember] =3D []
>          self._def_entity(
> -            QAPISchemaObjectType(name, info, doc, ifcond, features,
> +            QAPISchemaObjectType(name, expr.info, expr.doc, ifcond, feat=
ures,
>                                   base, members,
>                                   QAPISchemaVariants(
> -                                     tag_name, info, None, variants)))
> +                                     tag_name, expr.info, None, variants=
)))
>=20=20
> -    def _def_alternate_type(self, expr, info, doc):
> +    def _def_alternate_type(self, expr: QAPIExpression):
>          name =3D expr['alternate']
>          data =3D expr['data']
> +        assert isinstance(data, dict)
>          ifcond =3D QAPISchemaIfCond(expr.get('if'))
> -        features =3D self._make_features(expr.get('features'), info)
> +        features =3D self._make_features(expr.get('features'), expr.info)
>          variants =3D [
>              self._make_variant(key, value['type'],
>                                 QAPISchemaIfCond(value.get('if')),
> -                               info)
> +                               expr.info)
>              for (key, value) in data.items()]
> -        tag_member =3D QAPISchemaObjectTypeMember('type', info, 'QType',=
 False)
> +        tag_member =3D QAPISchemaObjectTypeMember(
> +            'type', expr.info, 'QType', False)
>          self._def_entity(
> -            QAPISchemaAlternateType(name, info, doc, ifcond, features,
> -                                    QAPISchemaVariants(
> -                                        None, info, tag_member, variants=
)))
> +            QAPISchemaAlternateType(
> +                name, expr.info, expr.doc, ifcond, features,
> +                QAPISchemaVariants(None, expr.info, tag_member, variants=
)))
>=20=20
> -    def _def_command(self, expr, info, doc):
> +    def _def_command(self, expr: QAPIExpression):
>          name =3D expr['command']
>          data =3D expr.get('data')
>          rets =3D expr.get('returns')
> @@ -1139,52 +1143,49 @@ def _def_command(self, expr, info, doc):
>          allow_preconfig =3D expr.get('allow-preconfig', False)
>          coroutine =3D expr.get('coroutine', False)
>          ifcond =3D QAPISchemaIfCond(expr.get('if'))
> -        features =3D self._make_features(expr.get('features'), info)
> +        features =3D self._make_features(expr.get('features'), expr.info)
>          if isinstance(data, OrderedDict):
>              data =3D self._make_implicit_object_type(
> -                name, info, ifcond,
> -                'arg', self._make_members(data, info))
> +                name, expr.info, ifcond,
> +                'arg', self._make_members(data, expr.info))
>          if isinstance(rets, list):
>              assert len(rets) =3D=3D 1
> -            rets =3D self._make_array_type(rets[0], info)
> -        self._def_entity(QAPISchemaCommand(name, info, doc, ifcond, feat=
ures,
> -                                           data, rets,
> +            rets =3D self._make_array_type(rets[0], expr.info)
> +        self._def_entity(QAPISchemaCommand(name, expr.info, expr.doc, if=
cond,
> +                                           features, data, rets,
>                                             gen, success_response,
>                                             boxed, allow_oob, allow_preco=
nfig,
>                                             coroutine))
>=20=20
> -    def _def_event(self, expr, info, doc):
> +    def _def_event(self, expr: QAPIExpression):
>          name =3D expr['event']
>          data =3D expr.get('data')
>          boxed =3D expr.get('boxed', False)
>          ifcond =3D QAPISchemaIfCond(expr.get('if'))
> -        features =3D self._make_features(expr.get('features'), info)
> +        features =3D self._make_features(expr.get('features'), expr.info)
>          if isinstance(data, OrderedDict):
>              data =3D self._make_implicit_object_type(
> -                name, info, ifcond,
> -                'arg', self._make_members(data, info))
> -        self._def_entity(QAPISchemaEvent(name, info, doc, ifcond, featur=
es,
> -                                         data, boxed))
> +                name, expr.info, ifcond,
> +                'arg', self._make_members(data, expr.info))
> +        self._def_entity(QAPISchemaEvent(name, expr.info, expr.doc, ifco=
nd,
> +                                         features, data, boxed))
>=20=20
>      def _def_exprs(self, exprs):
> -        for expr_elem in exprs:
> -            expr =3D expr_elem.expr
> -            info =3D expr_elem.info
> -            doc =3D expr_elem.doc
> +        for expr in exprs:
>              if 'enum' in expr:
> -                self._def_enum_type(expr, info, doc)
> +                self._def_enum_type(expr)
>              elif 'struct' in expr:
> -                self._def_struct_type(expr, info, doc)
> +                self._def_struct_type(expr)
>              elif 'union' in expr:
> -                self._def_union_type(expr, info, doc)
> +                self._def_union_type(expr)
>              elif 'alternate' in expr:
> -                self._def_alternate_type(expr, info, doc)
> +                self._def_alternate_type(expr)
>              elif 'command' in expr:
> -                self._def_command(expr, info, doc)
> +                self._def_command(expr)
>              elif 'event' in expr:
> -                self._def_event(expr, info, doc)
> +                self._def_event(expr)
>              elif 'include' in expr:
> -                self._def_include(expr, info, doc)
> +                self._def_include(expr)
>              else:
>                  assert False

The insertion of expr. makes the patch a bit tiresome to review.  I
only skimmed it for now.


