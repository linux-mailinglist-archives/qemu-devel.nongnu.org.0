Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510C43E15E5
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 15:43:07 +0200 (CEST)
Received: from localhost ([::1]:50172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBdeL-0007pI-1d
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 09:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBddX-000799-C4
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:42:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBddT-0005xm-Pa
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:42:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628170929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UeHW9pW5/34T3G/+Xgcf9X5zYDNhZcdd1wWF1wNGeQ=;
 b=BE0FjcWFRQS3k2mJ5nbQ5fGLIf/s8GEP8dgTiYaISl6SSFcmBTa6Jn9Tkof9ZvOBkXi8+p
 QvlVc4OnBML0rXI9mUwgwmQu1LcTfFB4OiZtrno+SE7u3Ui6ohGc3u3xE2bS7hweQUGlRK
 dvg+Tf4zHMs+guHeMm6GPRSza/Ur3OM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-R6CjHucUOZ6PDOt433oMNQ-1; Thu, 05 Aug 2021 09:42:07 -0400
X-MC-Unique: R6CjHucUOZ6PDOt433oMNQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04870801AC0
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 13:42:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CCA46A901;
 Thu,  5 Aug 2021 13:41:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7A56F11380A0; Thu,  5 Aug 2021 15:41:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v7 06/10] qapi: replace if condition list with dict
 {'all': [...]}
References: <20210804083105.97531-1-marcandre.lureau@redhat.com>
 <20210804083105.97531-7-marcandre.lureau@redhat.com>
Date: Thu, 05 Aug 2021 15:41:55 +0200
In-Reply-To: <20210804083105.97531-7-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 4 Aug 2021 12:31:01 +0400")
Message-ID: <87y29g6mak.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Looks like you forgot to un-swap cgen_ifcond() and docgen_ifcond().  Can
do in my tree.

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

I suggested a more legible version in review of v6.  Not worth a respin
by itself.

Note to self: try to get rid of redundant parenthesis here.

Note to self: cgen_ifcond() and docgen_ifcond() are almost identical.
Refactor?

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

John hasn't answered my question whether :forms: makes sensw without
:sugared:.  If it doesn't, I can drop it in my tree.

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

Mind if I squash in the move of the helper function to the beginning?

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

This is slightly subtle.

QAPISchemaIfCond.ifcond can look like one of

* {'all': [COND, ...]}

* {'any': [COND, ...]}          (only after PATCH 07)

* {'not': COND}                 (only after PATCH 08)

* STRING

* {}

This is just like the AST, except "absent" is now {} instead of None.
It can occur only at the root.

cgen_ifcond() and docgen_ifcond() are recursive, which means they
happily accept {} anywhere, and generate crap.

I believe the code works anyway, because it only ever creates {} in
QAPISchemaIfCond.__init__(), i.e. at the root.

Non-local correctness argument.  I'd like to try my hand at tweaking the
code so it's more obviously correct.  Not now.

> =20
>      def cgen(self):
>          return cgen_ifcond(self.ifcond)
[Tests skipped for now...]


