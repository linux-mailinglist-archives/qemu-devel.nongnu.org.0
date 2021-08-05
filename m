Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8513E17B3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 17:16:25 +0200 (CEST)
Received: from localhost ([::1]:47338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBf6e-0004sL-Kv
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 11:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBf55-0003ZO-Jz
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:14:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBf50-0004zP-Jc
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:14:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628176479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/VwRYm9Nmo8WAfphlD3jEppb7+nn+tk2Y/dW/IdlUk=;
 b=YATjcQnxYNw7jsCMp8n5WM1rHN9I3ChLMI4AksKV+116nKr+dx21cuLAtqxG4tzh7vzDbE
 E7e6W+Z5Gh36LMNNhRwCwPTdbPWCV1KmFYTERT9yfkxkroNjqXe23qswR2iT8cWVG5EudA
 9On7DlYnKiKvqDXyObmW7V7fAYEzd1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-9WV7FPxFP0ysMAmvvsUtPQ-1; Thu, 05 Aug 2021 11:14:38 -0400
X-MC-Unique: 9WV7FPxFP0ysMAmvvsUtPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7556F19357A5
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 15:14:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7BB8692B6;
 Thu,  5 Aug 2021 15:14:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 78C3A11380A0; Thu,  5 Aug 2021 17:14:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v7 06/10] qapi: replace if condition list with dict
 {'all': [...]}
References: <20210804083105.97531-1-marcandre.lureau@redhat.com>
 <20210804083105.97531-7-marcandre.lureau@redhat.com>
Date: Thu, 05 Aug 2021 17:14:35 +0200
In-Reply-To: <20210804083105.97531-7-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 4 Aug 2021 12:31:01 +0400")
Message-ID: <87lf5f6i04.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Replace the simple list sugar form with a recursive structure that will
> accept other operators in the following commits (all, any or not).
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  scripts/qapi/common.py                        | 23 +++++--
>  scripts/qapi/expr.py                          | 52 ++++++++++------
>  scripts/qapi/schema.py                        |  2 +-
>  tests/qapi-schema/bad-if-all.err              |  2 +
>  tests/qapi-schema/bad-if-all.json             |  3 +
>  tests/qapi-schema/bad-if-all.out              |  0
>  tests/qapi-schema/bad-if-empty-list.json      |  2 +-
>  tests/qapi-schema/bad-if-key.err              |  3 +
>  tests/qapi-schema/bad-if-key.json             |  3 +
>  tests/qapi-schema/bad-if-key.out              |  0
>  tests/qapi-schema/bad-if-keys.err             |  2 +
>  tests/qapi-schema/bad-if-keys.json            |  3 +
>  tests/qapi-schema/bad-if-keys.out             |  0
>  tests/qapi-schema/bad-if-list.json            |  2 +-
>  tests/qapi-schema/bad-if.err                  |  2 +-
>  tests/qapi-schema/bad-if.json                 |  2 +-
>  tests/qapi-schema/doc-good.json               |  3 +-
>  tests/qapi-schema/doc-good.out                | 13 ++--
>  tests/qapi-schema/doc-good.txt                |  6 ++
>  tests/qapi-schema/enum-if-invalid.err         |  3 +-
>  tests/qapi-schema/features-if-invalid.err     |  2 +-
>  tests/qapi-schema/meson.build                 |  3 +
>  tests/qapi-schema/qapi-schema-test.json       | 25 ++++----
>  tests/qapi-schema/qapi-schema-test.out        | 62 +++++++++----------
>  .../qapi-schema/struct-member-if-invalid.err  |  2 +-
>  .../qapi-schema/union-branch-if-invalid.json  |  2 +-
>  26 files changed, 138 insertions(+), 84 deletions(-)
>  create mode 100644 tests/qapi-schema/bad-if-all.err
>  create mode 100644 tests/qapi-schema/bad-if-all.json
>  create mode 100644 tests/qapi-schema/bad-if-all.out
>  create mode 100644 tests/qapi-schema/bad-if-key.err
>  create mode 100644 tests/qapi-schema/bad-if-key.json
>  create mode 100644 tests/qapi-schema/bad-if-key.out
>  create mode 100644 tests/qapi-schema/bad-if-keys.err
>  create mode 100644 tests/qapi-schema/bad-if-keys.json
>  create mode 100644 tests/qapi-schema/bad-if-keys.out
>
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index 5181a0f167..51463510c9 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -13,7 +13,8 @@
> =20
>  import re
>  from typing import (
> -    List,
> +    Any,
> +    Dict,
>      Match,
>      Optional,
>      Union,
> @@ -199,16 +200,28 @@ def guardend(name: str) -> str:
>                   name=3Dc_fname(name).upper())
> =20
> =20
> -def cgen_ifcond(ifcond: Union[str, List[str]]) -> str:
> +def docgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
>      if not ifcond:
>          return ''
> -    return '(' + ') && ('.join(ifcond) + ')'
> +    if isinstance(ifcond, str):
> +        return ifcond
> =20
> +    oper, operands =3D next(iter(ifcond.items()))
> +    oper =3D {'all': ' and '}[oper]
> +    operands =3D [docgen_ifcond(o) for o in operands]
> +    return '(' + oper.join(operands) + ')'
> =20
> -def docgen_ifcond(ifcond: Union[str, List[str]]) -> str:
> +
> +def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
>      if not ifcond:
>          return ''
> -    return ' and '.join(ifcond)
> +    if isinstance(ifcond, str):
> +        return ifcond
> +
> +    oper, operands =3D next(iter(ifcond.items()))
> +    oper =3D {'all': '&&'}[oper]
> +    operands =3D [cgen_ifcond(o) for o in operands]
> +    return '(' + (') ' + oper + ' (').join(operands) + ')'
> =20
> =20
>  def gen_if(cond: str) -> str:
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index cf98923fa6..b5187bfbca 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -259,14 +259,12 @@ def check_flags(expr: _JSONObject, info: QAPISource=
Info) -> None:
> =20
>  def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> No=
ne:
>      """
> -    Normalize and validate the ``if`` member of an object.
> +    Validate the ``if`` member of an object.
> =20
> -    The ``if`` member may be either a ``str`` or a ``List[str]``.
> -    A ``str`` value will be normalized to ``List[str]``.
> +    The ``if`` member may be either a ``str`` or a dict.
> =20
>      :forms:
> -      :sugared: ``Union[str, List[str]]``
> -      :canonical: ``List[str]``
> +      :canonical: ``Union[str, dict]``
> =20
>      :param expr: The expression containing the ``if`` member to validate=
.
>      :param info: QAPI schema source file information.
> @@ -275,31 +273,45 @@ def check_if(expr: _JSONObject, info: QAPISourceInf=
o, source: str) -> None:
>      :raise QAPISemError:
>          When the "if" member fails validation, or when there are no
>          non-empty conditions.
> -    :return: None, ``expr`` is normalized in-place as needed.
> +    :return: None
>      """
>      ifcond =3D expr.get('if')
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
> +    def _check_if(cond: Union[str, object]) -> None:
> +        if isinstance(cond, str):
> +            if not cond.strip():
> +                raise QAPISemError(
> +                    info,
> +                    "'if' condition '%s' of %s makes no sense"
> +                    % (cond, source))
> +            return
> =20
> -    for elt in ifcond:
> -        if not isinstance(elt, str):
> +        if not isinstance(cond, dict):
>              raise QAPISemError(
>                  info,
> -                "'if' condition of %s must be a string or a list of stri=
ngs"
> -                % source)
> -        if not elt.strip():
> +                "'if' condition of %s must be a string or a dict" % sour=
ce)

s/a dict/an object/, since we're talking about JSON, not Python.

The existing error messages don't get this right 100% either.

> +        if len(cond) !=3D 1:
>              raise QAPISemError(
>                  info,
> -                "'if' condition '%s' of %s makes no sense"
> -                % (elt, source))
> +                "'if' condition dict of %s must have one key: "
> +                "'all'" % source)
> +        check_keys(cond, info, "'if' condition", [],
> +                   ["all"])
> +
> +        oper, operands =3D next(iter(cond.items()))
> +        if not operands:
> +            raise QAPISemError(
> +                info, "'if' condition [] of %s is useless" % source)
> +
> +        if oper in ("all") and not isinstance(operands, list):
> +            raise QAPISemError(
> +                info, "'%s' condition of %s must be a list" % (oper, sou=
rce))

s/a list/an array/

Can do both in my tree.

> +        for operand in operands:
> +            _check_if(operand)
> +
> +    _check_if(ifcond)
> =20
> =20
>  def normalize_members(members: object) -> None:
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index ff9c4f0a17..627735a431 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -32,7 +32,7 @@
> =20
>  class QAPISchemaIfCond:
>      def __init__(self, ifcond=3DNone):
> -        self.ifcond =3D ifcond or []
> +        self.ifcond =3D ifcond or {}
> =20
>      def cgen(self):
>          return cgen_ifcond(self.ifcond)
> diff --git a/tests/qapi-schema/bad-if-all.err b/tests/qapi-schema/bad-if-=
all.err
> new file mode 100644
> index 0000000000..3d9edd8af9
> --- /dev/null
> +++ b/tests/qapi-schema/bad-if-all.err
> @@ -0,0 +1,2 @@
> +bad-if-all.json: In struct 'TestIfStruct':
> +bad-if-all.json:2: 'all' condition of struct must be a list
> diff --git a/tests/qapi-schema/bad-if-all.json b/tests/qapi-schema/bad-if=
-all.json
> new file mode 100644
> index 0000000000..44837d3981
> --- /dev/null
> +++ b/tests/qapi-schema/bad-if-all.json
> @@ -0,0 +1,3 @@
> +# check 'if all' is not a list
> +{ 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
> +  'if': { 'all': 'ALL' } }
> diff --git a/tests/qapi-schema/bad-if-all.out b/tests/qapi-schema/bad-if-=
all.out
> new file mode 100644
> index 0000000000..e69de29bb2
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

Syntax changes, but the error message remains "'if' condition [] of
struct is useless".  The new error message visible in bad-if-all.err
above refers to the same thing as "'all' condition of struct", which is
better.

Not worth a respin by itself.  If improving it is trivial, I'll do it in
my tree.

> diff --git a/tests/qapi-schema/bad-if-key.err b/tests/qapi-schema/bad-if-=
key.err
> new file mode 100644
> index 0000000000..725d5abae5
> --- /dev/null
> +++ b/tests/qapi-schema/bad-if-key.err
> @@ -0,0 +1,3 @@
> +bad-if-key.json: In struct 'TestIfStruct':
> +bad-if-key.json:2: 'if' condition has unknown key 'value'
> +Valid keys are 'all'.
> diff --git a/tests/qapi-schema/bad-if-key.json b/tests/qapi-schema/bad-if=
-key.json
> new file mode 100644
> index 0000000000..64c74c13f2
> --- /dev/null
> +++ b/tests/qapi-schema/bad-if-key.json
> @@ -0,0 +1,3 @@
> +# check unknown 'if' dict key
> +{ 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
> +  'if': { 'value': 'defined(TEST_IF_STRUCT)' } }
> diff --git a/tests/qapi-schema/bad-if-key.out b/tests/qapi-schema/bad-if-=
key.out
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qapi-schema/bad-if-keys.err b/tests/qapi-schema/bad-if=
-keys.err
> new file mode 100644
> index 0000000000..b072db9a6f
> --- /dev/null
> +++ b/tests/qapi-schema/bad-if-keys.err
> @@ -0,0 +1,2 @@
> +bad-if-keys.json: In struct 'TestIfStruct':
> +bad-if-keys.json:2: 'if' condition dict of struct must have one key: 'al=
l'
> diff --git a/tests/qapi-schema/bad-if-keys.json b/tests/qapi-schema/bad-i=
f-keys.json
> new file mode 100644
> index 0000000000..9e2f39ae21
> --- /dev/null
> +++ b/tests/qapi-schema/bad-if-keys.json
> @@ -0,0 +1,3 @@
> +# check multiple 'if' keys
> +{ 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
> +  'if': { 'any': ['ANY'], 'all': ['ALL'] } }
> diff --git a/tests/qapi-schema/bad-if-keys.out b/tests/qapi-schema/bad-if=
-keys.out
> new file mode 100644
> index 0000000000..e69de29bb2
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

Likewise.

> diff --git a/tests/qapi-schema/bad-if.err b/tests/qapi-schema/bad-if.err
> index f83dee65da..7f8f57057a 100644
> --- a/tests/qapi-schema/bad-if.err
> +++ b/tests/qapi-schema/bad-if.err
> @@ -1,2 +1,2 @@
>  bad-if.json: In struct 'TestIfStruct':
> -bad-if.json:2: 'if' condition of struct must be a string or a list of st=
rings
> +bad-if.json:2: 'if' condition of struct must be a string or a dict
> diff --git a/tests/qapi-schema/bad-if.json b/tests/qapi-schema/bad-if.jso=
n
> index 3edd1a0bf2..fdc0c87bb3 100644
> --- a/tests/qapi-schema/bad-if.json
> +++ b/tests/qapi-schema/bad-if.json
> @@ -1,3 +1,3 @@
>  # check invalid 'if' type
>  { 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
> -  'if': { 'value': 'defined(TEST_IF_STRUCT)' } }
> +  'if': ['defined(TEST_IF_STRUCT)'] }
> diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good=
.json
> index 423ea23e07..25b1053e8a 100644
> --- a/tests/qapi-schema/doc-good.json
> +++ b/tests/qapi-schema/doc-good.json
> @@ -70,7 +70,8 @@
>  # @base1:
>  # the first member
>  ##
> -{ 'struct': 'Base', 'data': { 'base1': 'Enum' } }
> +{ 'struct': 'Base', 'data': { 'base1': 'Enum' },
> +  'if': { 'all': ['IFALL1', 'IFALL2'] } }
> =20
>  ##
>  # @Variant1:
> diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.=
out
> index 8f54ceff2e..689d084f3a 100644
> --- a/tests/qapi-schema/doc-good.out
> +++ b/tests/qapi-schema/doc-good.out
> @@ -12,15 +12,16 @@ enum QType
>  module doc-good.json
>  enum Enum
>      member one
> -        if ['defined(IFONE)']
> +        if defined(IFONE)
>      member two
> -    if ['defined(IFCOND)']
> +    if defined(IFCOND)
>      feature enum-feat
>  object Base
>      member base1: Enum optional=3DFalse
> +    if OrderedDict([('all', ['IFALL1', 'IFALL2'])])

This will change (for the better) when we drop OrderedDict in favor of
plain dict.  Tolerable.

>  object Variant1
>      member var1: str optional=3DFalse
> -        if ['defined(IFSTR)']
> +        if defined(IFSTR)
>          feature member-feat
>      feature variant1-feat
>  object Variant2
> @@ -29,7 +30,7 @@ object Object
>      tag base1
>      case one: Variant1
>      case two: Variant2
> -        if ['IFTWO']
> +        if IFTWO
>      feature union-feat1
>  object q_obj_Variant1-wrapper
>      member data: Variant1 optional=3DFalse
> @@ -38,13 +39,13 @@ object q_obj_Variant2-wrapper
>  enum SugaredUnionKind
>      member one
>      member two
> -        if ['IFTWO']
> +        if IFTWO
>  object SugaredUnion
>      member type: SugaredUnionKind optional=3DFalse
>      tag type
>      case one: q_obj_Variant1-wrapper
>      case two: q_obj_Variant2-wrapper
> -        if ['IFTWO']
> +        if IFTWO
>      feature union-feat2
>  alternate Alternate
>      tag type
> diff --git a/tests/qapi-schema/doc-good.txt b/tests/qapi-schema/doc-good.=
txt
> index 726727af74..4490108cb7 100644
> --- a/tests/qapi-schema/doc-good.txt
> +++ b/tests/qapi-schema/doc-good.txt
> @@ -76,6 +76,12 @@ Members
>     the first member
> =20
> =20
> +If
> +~~
> +
> +"(IFALL1 and IFALL2)"
> +
> +
>  "Variant1" (Object)
>  -------------------
> =20
> diff --git a/tests/qapi-schema/enum-if-invalid.err b/tests/qapi-schema/en=
um-if-invalid.err
> index 0556dc967b..df305cd79f 100644
> --- a/tests/qapi-schema/enum-if-invalid.err
> +++ b/tests/qapi-schema/enum-if-invalid.err
> @@ -1,2 +1,3 @@
>  enum-if-invalid.json: In enum 'TestIfEnum':
> -enum-if-invalid.json:2: 'if' condition of 'data' member 'bar' must be a =
string or a list of strings
> +enum-if-invalid.json:2: 'if' condition has unknown key 'val'
> +Valid keys are 'all'.
> diff --git a/tests/qapi-schema/features-if-invalid.err b/tests/qapi-schem=
a/features-if-invalid.err
> index f63b89535e..8b64318df6 100644
> --- a/tests/qapi-schema/features-if-invalid.err
> +++ b/tests/qapi-schema/features-if-invalid.err
> @@ -1,2 +1,2 @@
>  features-if-invalid.json: In struct 'Stru':
> -features-if-invalid.json:2: 'if' condition of 'features' member 'f' must=
 be a string or a list of strings
> +features-if-invalid.json:2: 'if' condition of 'features' member 'f' must=
 be a string or a dict
> diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.buil=
d
> index b8de58116a..4697c070bc 100644
> --- a/tests/qapi-schema/meson.build
> +++ b/tests/qapi-schema/meson.build
> @@ -37,8 +37,11 @@ schemas =3D [
>    'bad-data.json',
>    'bad-ident.json',
>    'bad-if.json',
> +  'bad-if-all.json',
>    'bad-if-empty.json',
>    'bad-if-empty-list.json',
> +  'bad-if-key.json',
> +  'bad-if-keys.json',
>    'bad-if-list.json',
>    'bad-type-bool.json',
>    'bad-type-dict.json',
> diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/=
qapi-schema-test.json
> index 84b9d41f15..f2e0fff51f 100644
> --- a/tests/qapi-schema/qapi-schema-test.json
> +++ b/tests/qapi-schema/qapi-schema-test.json
> @@ -231,8 +231,8 @@
> =20
>  { 'union': 'TestIfUnion', 'data':
>    { 'foo': 'TestStruct',
> -    'bar': { 'type': 'str', 'if': 'defined(TEST_IF_UNION_BAR)'} },
> -  'if': 'defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)' }
> +    'union-bar': { 'type': 'str', 'if': 'defined(TEST_IF_UNION_BAR)'} },

Any particular reason for renaming @bar to @union-bar?

> +  'if': { 'all': ['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'] }=
 }
> =20
>  { 'command': 'test-if-union-cmd',
>    'data': { 'union-cmd-arg': 'TestIfUnion' },
> @@ -241,25 +241,24 @@
>  { 'alternate': 'TestIfAlternate', 'data':
>    { 'foo': 'int',
>      'bar': { 'type': 'TestStruct', 'if': 'defined(TEST_IF_ALT_BAR)'} },
> -  'if': 'defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)' }
> +  'if': { 'all': ['defined(TEST_IF_ALT)', 'defined(TEST_IF_STRUCT)'] } }
> =20
> -{ 'command': 'test-if-alternate-cmd',
> -  'data': { 'alt-cmd-arg': 'TestIfAlternate' },
> -  'if': 'defined(TEST_IF_ALT)' }
> +{ 'command': 'test-if-alternate-cmd', 'data': { 'alt-cmd-arg': 'TestIfAl=
ternate' },

The joining of lines looks accidental.  Mind if I revert?

> +  'if': { 'all': ['defined(TEST_IF_ALT)'] } }
> =20
>  { 'command': 'test-if-cmd',
>    'data': {
>      'foo': 'TestIfStruct',
>      'bar': { 'type': 'TestIfEnum', 'if': 'defined(TEST_IF_CMD_BAR)' } },
>    'returns': 'UserDefThree',
> -  'if': ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'] }
> +  'if': { 'all': ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'] } }
> =20
>  { 'command': 'test-cmd-return-def-three', 'returns': 'UserDefThree' }
> =20
>  { 'event': 'TEST_IF_EVENT', 'data':
>    { 'foo': 'TestIfStruct',
>      'bar': { 'type': ['TestIfEnum'], 'if': 'defined(TEST_IF_EVT_BAR)' } =
},
> -  'if': 'defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)' }
> +  'if': { 'all': ['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'] } }
> =20
>  # test 'features'
> =20
> @@ -288,8 +287,9 @@
>                  { 'name': 'feature2', 'if': 'defined(TEST_IF_FEATURE_2)'=
} ] }
>  { 'struct': 'CondFeatureStruct3',
>    'data': { 'foo': 'int' },
> -  'features': [ { 'name': 'feature1', 'if': [ 'defined(TEST_IF_COND_1)',
> -                                              'defined(TEST_IF_COND_2)']=
 } ] }
> +  'features': [ { 'name': 'feature1',
> +                  'if': { 'all': [ 'defined(TEST_IF_COND_1)',
> +                                   'defined(TEST_IF_COND_2)'] } } ] }
> =20
>  { 'enum': 'FeatureEnum1',
>    'data': [ 'eins', 'zwei', 'drei' ],
> @@ -328,8 +328,9 @@
>    'features': [ { 'name': 'feature1', 'if': 'defined(TEST_IF_FEATURE_1)'=
},
>                  { 'name': 'feature2', 'if': 'defined(TEST_IF_FEATURE_2)'=
} ] }
>  { 'command': 'test-command-cond-features3',
> -  'features': [ { 'name': 'feature1', 'if': [ 'defined(TEST_IF_COND_1)',
> -                                              'defined(TEST_IF_COND_2)']=
 } ] }
> +  'features': [ { 'name': 'feature1',
> +                  'if': { 'all': [ 'defined(TEST_IF_COND_1)',
> +                                   'defined(TEST_IF_COND_2)'] } } ] }
> =20
>  { 'event': 'TEST_EVENT_FEATURES0',
>    'data': 'FeatureStruct1' }
> diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/q=
api-schema-test.out
> index e0b8a5f0b6..6a1b3aa341 100644
> --- a/tests/qapi-schema/qapi-schema-test.out
> +++ b/tests/qapi-schema/qapi-schema-test.out
> @@ -298,65 +298,65 @@ command __org.qemu_x-command q_obj___org.qemu_x-com=
mand-arg -> __org.qemu_x-Unio
>  object TestIfStruct
>      member foo: int optional=3DFalse
>      member bar: int optional=3DFalse
> -        if ['defined(TEST_IF_STRUCT_BAR)']
> -    if ['defined(TEST_IF_STRUCT)']
> +        if defined(TEST_IF_STRUCT_BAR)
> +    if defined(TEST_IF_STRUCT)
>  enum TestIfEnum
>      member foo
>      member bar
> -        if ['defined(TEST_IF_ENUM_BAR)']
> -    if ['defined(TEST_IF_ENUM)']
> +        if defined(TEST_IF_ENUM_BAR)
> +    if defined(TEST_IF_ENUM)
>  object q_obj_TestStruct-wrapper
>      member data: TestStruct optional=3DFalse
>  enum TestIfUnionKind
>      member foo
> -    member bar
> -        if ['defined(TEST_IF_UNION_BAR)']
> -    if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
> +    member union-bar
> +        if defined(TEST_IF_UNION_BAR)
> +    if OrderedDict([('all', ['defined(TEST_IF_UNION)', 'defined(TEST_IF_=
STRUCT)'])])
>  object TestIfUnion
>      member type: TestIfUnionKind optional=3DFalse
>      tag type
>      case foo: q_obj_TestStruct-wrapper
> -    case bar: q_obj_str-wrapper
> -        if ['defined(TEST_IF_UNION_BAR)']
> -    if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
> +    case union-bar: q_obj_str-wrapper
> +        if defined(TEST_IF_UNION_BAR)
> +    if OrderedDict([('all', ['defined(TEST_IF_UNION)', 'defined(TEST_IF_=
STRUCT)'])])
>  object q_obj_test-if-union-cmd-arg
>      member union-cmd-arg: TestIfUnion optional=3DFalse
> -    if ['defined(TEST_IF_UNION)']
> +    if defined(TEST_IF_UNION)
>  command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
>      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse
> -    if ['defined(TEST_IF_UNION)']
> +    if defined(TEST_IF_UNION)
>  alternate TestIfAlternate
>      tag type
>      case foo: int
>      case bar: TestStruct
> -        if ['defined(TEST_IF_ALT_BAR)']
> -    if ['defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)']
> +        if defined(TEST_IF_ALT_BAR)
> +    if OrderedDict([('all', ['defined(TEST_IF_ALT)', 'defined(TEST_IF_ST=
RUCT)'])])
>  object q_obj_test-if-alternate-cmd-arg
>      member alt-cmd-arg: TestIfAlternate optional=3DFalse
> -    if ['defined(TEST_IF_ALT)']
> +    if OrderedDict([('all', ['defined(TEST_IF_ALT)'])])
>  command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
>      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse
> -    if ['defined(TEST_IF_ALT)']
> +    if OrderedDict([('all', ['defined(TEST_IF_ALT)'])])
>  object q_obj_test-if-cmd-arg
>      member foo: TestIfStruct optional=3DFalse
>      member bar: TestIfEnum optional=3DFalse
> -        if ['defined(TEST_IF_CMD_BAR)']
> -    if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
> +        if defined(TEST_IF_CMD_BAR)
> +    if OrderedDict([('all', ['defined(TEST_IF_CMD)', 'defined(TEST_IF_ST=
RUCT)'])])
>  command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
>      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse
> -    if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
> +    if OrderedDict([('all', ['defined(TEST_IF_CMD)', 'defined(TEST_IF_ST=
RUCT)'])])
>  command test-cmd-return-def-three None -> UserDefThree
>      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse
>  array TestIfEnumList TestIfEnum
> -    if ['defined(TEST_IF_ENUM)']
> +    if defined(TEST_IF_ENUM)
>  object q_obj_TEST_IF_EVENT-arg
>      member foo: TestIfStruct optional=3DFalse
>      member bar: TestIfEnumList optional=3DFalse
> -        if ['defined(TEST_IF_EVT_BAR)']
> -    if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
> +        if defined(TEST_IF_EVT_BAR)
> +    if OrderedDict([('all', ['defined(TEST_IF_EVT)', 'defined(TEST_IF_ST=
RUCT)'])])
>  event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
>      boxed=3DFalse
> -    if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
> +    if OrderedDict([('all', ['defined(TEST_IF_EVT)', 'defined(TEST_IF_ST=
RUCT)'])])
>  object FeatureStruct0
>      member foo: int optional=3DFalse
>  object FeatureStruct1
> @@ -379,17 +379,17 @@ object FeatureStruct4
>  object CondFeatureStruct1
>      member foo: int optional=3DFalse
>      feature feature1
> -        if ['defined(TEST_IF_FEATURE_1)']
> +        if defined(TEST_IF_FEATURE_1)
>  object CondFeatureStruct2
>      member foo: int optional=3DFalse
>      feature feature1
> -        if ['defined(TEST_IF_FEATURE_1)']
> +        if defined(TEST_IF_FEATURE_1)
>      feature feature2
> -        if ['defined(TEST_IF_FEATURE_2)']
> +        if defined(TEST_IF_FEATURE_2)
>  object CondFeatureStruct3
>      member foo: int optional=3DFalse
>      feature feature1
> -        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
> +        if OrderedDict([('all', ['defined(TEST_IF_COND_1)', 'defined(TES=
T_IF_COND_2)'])])
>  enum FeatureEnum1
>      member eins
>      member zwei
> @@ -429,17 +429,17 @@ command test-command-features3 None -> None
>  command test-command-cond-features1 None -> None
>      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse
>      feature feature1
> -        if ['defined(TEST_IF_FEATURE_1)']
> +        if defined(TEST_IF_FEATURE_1)
>  command test-command-cond-features2 None -> None
>      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse
>      feature feature1
> -        if ['defined(TEST_IF_FEATURE_1)']
> +        if defined(TEST_IF_FEATURE_1)
>      feature feature2
> -        if ['defined(TEST_IF_FEATURE_2)']
> +        if defined(TEST_IF_FEATURE_2)
>  command test-command-cond-features3 None -> None
>      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse
>      feature feature1
> -        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
> +        if OrderedDict([('all', ['defined(TEST_IF_COND_1)', 'defined(TES=
T_IF_COND_2)'])])
>  event TEST_EVENT_FEATURES0 FeatureStruct1
>      boxed=3DFalse
>  event TEST_EVENT_FEATURES1 None
> diff --git a/tests/qapi-schema/struct-member-if-invalid.err b/tests/qapi-=
schema/struct-member-if-invalid.err
> index 42e7fdae3c..eea4c62aaf 100644
> --- a/tests/qapi-schema/struct-member-if-invalid.err
> +++ b/tests/qapi-schema/struct-member-if-invalid.err
> @@ -1,2 +1,2 @@
>  struct-member-if-invalid.json: In struct 'Stru':
> -struct-member-if-invalid.json:2: 'if' condition of 'data' member 'member=
' must be a string or a list of strings
> +struct-member-if-invalid.json:2: 'if' condition of 'data' member 'member=
' must be a string or a dict
> diff --git a/tests/qapi-schema/union-branch-if-invalid.json b/tests/qapi-=
schema/union-branch-if-invalid.json
> index 46d4239af6..c41633856f 100644
> --- a/tests/qapi-schema/union-branch-if-invalid.json
> +++ b/tests/qapi-schema/union-branch-if-invalid.json
> @@ -3,4 +3,4 @@
>  { 'struct': 'Stru', 'data': { 'member': 'str' } }
>  { 'union': 'Uni',
>    'base': { 'tag': 'Branches' }, 'discriminator': 'tag',
> -  'data': { 'branch1': { 'type': 'Stru', 'if': [''] } } }
> +  'data': { 'branch1': { 'type': 'Stru', 'if': { 'all': [''] } } } }


