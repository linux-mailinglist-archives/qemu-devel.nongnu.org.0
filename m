Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63FA3DEEB8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 15:06:31 +0200 (CEST)
Received: from localhost ([::1]:34518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAu7q-0002Py-D3
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 09:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAu6x-0001kH-Nd
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:05:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAu6u-0004HP-Cd
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:05:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627995930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ETRxWTQfnX1yfBqx1VnpNTHKTsD4RRgplIfuJeIv2V0=;
 b=PYGyaOVNvqoRukvTV0otjfx2UW/8kTLRNhX/leYRmqT6PasZ0pqDpMyKDWw/5i1PN9vIpv
 g2sFjXkXvlB7l4hHOg0VbDGlAV3mLB1/ccxnwyLxWOVIAPvzCWV54rmUDT+8+tJdlDx3td
 HuEkNfFkAf7FISBgYwFHTxWHJwfjT9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-HqxdgmgcPKeVCy0sC__K0A-1; Tue, 03 Aug 2021 09:05:29 -0400
X-MC-Unique: HqxdgmgcPKeVCy0sC__K0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8933423C5
 for <qemu-devel@nongnu.org>; Tue,  3 Aug 2021 13:05:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B02E6E0B9;
 Tue,  3 Aug 2021 13:05:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C2BBC11380A0; Tue,  3 Aug 2021 15:05:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v6 07/11] qapi: replace if condition list with dict
 {'all': [...]}
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-8-marcandre.lureau@redhat.com>
Date: Tue, 03 Aug 2021 15:05:12 +0200
In-Reply-To: <20210618102507.3761128-8-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Fri, 18 Jun 2021 14:25:03 +0400")
Message-ID: <87lf5ismpj.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Eric Blake <eblake@redhat.com>, jsnow@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
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
>  tests/qapi-schema/bad-if-empty-list.json      |  2 +-
>  tests/qapi-schema/bad-if-list.json            |  2 +-
>  tests/qapi-schema/bad-if.err                  |  3 +-
>  tests/qapi-schema/doc-good.json               |  3 +-
>  tests/qapi-schema/doc-good.out                | 13 ++--
>  tests/qapi-schema/doc-good.txt                |  6 ++
>  tests/qapi-schema/enum-if-invalid.err         |  3 +-
>  tests/qapi-schema/features-if-invalid.err     |  2 +-
>  tests/qapi-schema/qapi-schema-test.json       | 25 ++++----
>  tests/qapi-schema/qapi-schema-test.out        | 62 +++++++++----------
>  .../qapi-schema/struct-member-if-invalid.err  |  2 +-
>  .../qapi-schema/union-branch-if-invalid.json  |  2 +-
>  15 files changed, 119 insertions(+), 83 deletions(-)
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

Uh, why do you swap cgen_ifcond() and docgen_ifcond()?  Accident?

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

What a nice review speedbump you buried here...

The whole block boils down to the much less exciting

       operands =3D [docgen_ifcond(o) for o in ifcond['all']]
       return '(' + ' and '.join(operands) + ')'

Peeking ahead, I understand that you did it this way here so you can
extend it trivially there.  Matter of taste; what counts is the final
result and minimizing reviewer WTFs/minute along the way.

Since the WTFs/minute is a done deed now, what remains is the final
result, which I expect to review shortly.  But please try a bit harder
to be boring next time ;)

> =20
> -def docgen_ifcond(ifcond: Union[str, List[str]]) -> str:
> +
> +def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
>      if not ifcond:
>          return ''
> -    return ' and '.join(ifcond)
> +    if isinstance(ifcond, str):
> +        return ifcond

This is what gets rid of the redundant parenthesises in the common case
"single condition string".

> +
> +    oper, operands =3D next(iter(ifcond.items()))
> +    oper =3D {'all': '&&'}[oper]
> +    operands =3D [cgen_ifcond(o) for o in operands]
> +    return '(' + (') ' + oper + ' (').join(operands) + ')'

This line is hard to read.  Easier, I think:

       oper =3D {'all': ' && '}[oper]
       operands =3D ['(' + cgen_ifcond(o) + ')' for o in operands]
       return oper.join(operands)

Neither your version nor mine gets rid of the redundant parenthesises in
the (uncommon) case "complex condition expression".
tests/test-qapi-introspect.c still has

    #if (defined(TEST_IF_COND_1)) && (defined(TEST_IF_COND_2))
                QLIT_QSTR("feature1"),
    #endif /* (defined(TEST_IF_COND_1)) && (defined(TEST_IF_COND_2)) */

Mildly annoying.  I'm willing to leave this for later.

Code smell: cgen_ifcond() and docgen_ifcond() are almost identical.  Can
also be left for later.

> =20
> =20
>  def gen_if(cond: str) -> str:
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 496f7e0333..3ee66c5f62 100644
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

Does this :forms: thing make sense without any :sugared:?  John, you
added (invented?) it in commit a48653638fa, but no explanation made it
into the tree.

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

Looks like there's a bit more going on than the commit message made me
expect.

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
> +        for operand in operands:
> +            _check_if(operand)
> +
> +    _check_if(ifcond)

Putting the function's helper in the middle of the function reminds me
of Mark Twain's "The Awful German Language":

    "The trunks being now ready, he DE- after kissing his mother and
    sisters, and once more pressing to his bosom his adored Gretchen,
    who, dressed in simple white muslin, with a single tuberose in the
    ample folds of her rich brown hair, had tottered feebly down the
    stairs, still pale from the terror and excitement of the past
    evening, but longing to lay her poor aching head yet once again upon
    the breast of him whom she loved more dearly than life itself,
    PARTED."

I find it hard to read.

> =20
> =20
>  def normalize_members(members: object) -> None:
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 30d6a01ad1..d2fbdbe583 100644
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
> index f83dee65da..8278c49368 100644
> --- a/tests/qapi-schema/bad-if.err
> +++ b/tests/qapi-schema/bad-if.err
> @@ -1,2 +1,3 @@
>  bad-if.json: In struct 'TestIfStruct':
> -bad-if.json:2: 'if' condition of struct must be a string or a list of st=
rings
> +bad-if.json:2: 'if' condition has unknown key 'value'
> +Valid keys are 'all'.

"keys are" is awkward when there's just one.  Okay since there soon will
be more.

Test case bad-if.json is meant to cover "value of key 'if' has an
invalid JSON type".  Before the patch, str and list are valid, and the
test uses (invalid) dict.  Afterwards, str and dict are, and the test
still uses (now valid) dict.  In other words, it now tests something
else entirely.

I think this test should be updated to something like

    'if': [ 'defined(TEST_IF_STRUCT)' ]

and a new test added to cover invalid dict key.

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

We lack cover for this before your patch.  Thanks for fixing it.

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

The documentation generated for conditionals is poor before and after
your work.  Observation, not demand.

>  "Variant1" (Object)
>  -------------------
> =20

[...]


