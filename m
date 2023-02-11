Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF65B692EED
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 07:50:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQjhl-0008Dr-ED; Sat, 11 Feb 2023 01:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQjhi-0008Di-6b
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 01:49:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQjhg-0005Xh-Cr
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 01:49:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676098183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LSqfiAXYLFpwInpERX2McHJL7W39w6lrU/HL+7NxSa4=;
 b=X1QxTYYGRbLxrH058J+qJwJL0pC7mCJYn+9GO5IoEhv5FvPqTPEX0bGtTSWE+13T8iaok0
 6kac5JN9hMbGQnWznd+koqzZfeCxqVzB7hnXuAHOsvNr/OTCwQAKMEcu4h9d2GDr3X+5XZ
 DU4zGmPf/grzTQSj1zuI2rAzZY7udaM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-9fmweOMaPRiew9NyAW15XQ-1; Sat, 11 Feb 2023 01:49:38 -0500
X-MC-Unique: 9fmweOMaPRiew9NyAW15XQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39A2B101A521;
 Sat, 11 Feb 2023 06:49:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10CB451FF;
 Sat, 11 Feb 2023 06:49:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EF7E921E6A1F; Sat, 11 Feb 2023 07:49:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v3 5/7] qapi/parser: add QAPIExpression type
References: <20230209184758.1017863-1-jsnow@redhat.com>
 <20230209184758.1017863-6-jsnow@redhat.com>
Date: Sat, 11 Feb 2023 07:49:36 +0100
In-Reply-To: <20230209184758.1017863-6-jsnow@redhat.com> (John Snow's message
 of "Thu, 9 Feb 2023 13:47:56 -0500")
Message-ID: <87fsbc4ry7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

> This patch creates a new type, QAPIExpression, which represents a parsed
> expression complete with QAPIDoc and QAPISourceInfo.
>
> This patch turns parser.exprs into a list of QAPIExpression instead,
> and adjusts expr.py to match.
>
> This allows the types we specify in parser.py to be "remembered" all the
> way through expr.py and into schema.py. Several assertions around
> packing and unpacking this data can be removed as a result.
>
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
> NB2: Python 3.6 has an oversight for typing UserDict that makes it
> impossible to type for both runtime and analysis time. The problem is
> described in detail at https://github.com/python/typing/issues/60 - this
> workaround can be safely removed when 3.7 is our minimum version.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---

Looks good to me, just one question:

[...]

> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index 1b006cdc133..87b46db7fba 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -14,13 +14,14 @@
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
> +    Mapping,
>      Optional,
>      Set,
>      Union,
> @@ -37,15 +38,30 @@
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
> +
> +# FIXME: Consolidate and centralize definitions for _ExprValue,
> +# JSONValue, and _JSONObject; currently scattered across several
> +# modules.
> +
> +
> +# 3.6 workaround: can be removed when Python 3.7+ is our required versio=
n.
> +if TYPE_CHECKING:
> +    _UserDict =3D UserDict[str, object]
> +else:
> +    _UserDict =3D UserDict
> +
> +
> +class QAPIExpression(_UserDict):

Can we subclass dict instead?

> +    def __init__(self,
> +                 initialdata: Mapping[str, object],
> +                 info: QAPISourceInfo,
> +                 doc: Optional['QAPIDoc'] =3D None):
> +        super().__init__(initialdata)
> +        self.info =3D info
> +        self.doc: Optional['QAPIDoc'] =3D doc
>=20=20
>=20=20
>  class QAPIParseError(QAPISourceError):

[...]


