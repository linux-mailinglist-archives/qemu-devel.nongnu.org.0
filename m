Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB3C69009F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 07:59:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ0sf-0002eY-Km; Thu, 09 Feb 2023 01:58:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ0sb-0002eG-Vg
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:58:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ0sZ-0004o3-OQ
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675925878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CaadVHDzcw82bzJR4BhEOYOfkFKANwFi9vmRtlAGUdU=;
 b=AoKeS/hIC7uVuRXTNLW/IlolIRSJphWgMJ9VYdE1VE11+WTlcYKc4wh2ENtRZUySHZuerd
 tS8QO2HYvLOcgo8buEiT5rULBlZCIC2F8JAZXsn1wW4qkbsdLOxsdHkWgOrzHUyY4S+HxP
 9kuyrJkU147/xLYpjC7jR6WSSeoO46c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-pWWrhMmjMV6OaTJ8vOoSEg-1; Thu, 09 Feb 2023 01:57:51 -0500
X-MC-Unique: pWWrhMmjMV6OaTJ8vOoSEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DF6F87B2A0;
 Thu,  9 Feb 2023 06:57:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE8762166B29;
 Thu,  9 Feb 2023 06:57:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 99BD121E6A1F; Thu,  9 Feb 2023 07:57:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>,  Markus
 Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 5/7] qapi/parser: [RFC] add QAPIExpression
References: <20230208021306.870657-1-jsnow@redhat.com>
 <20230208021306.870657-6-jsnow@redhat.com>
Date: Thu, 09 Feb 2023 07:57:49 +0100
In-Reply-To: <20230208021306.870657-6-jsnow@redhat.com> (John Snow's message
 of "Tue, 7 Feb 2023 21:13:04 -0500")
Message-ID: <87357fqqaa.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
> Signed-off-by: John Snow <jsnow@redhat.com>

[...]

> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index f897dffbfd4..88f6fdfa67b 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py

[...]

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
> +
> +
> +class QAPIExpression(_UserDict):
> +    def __init__(
> +        self,
> +        initialdata: Mapping[str, object],
> +        info: QAPISourceInfo,
> +        doc: Optional['QAPIDoc'] =3D None,
> +    ):

Style nitpick:

           doc: Optional['QAPIDoc'] =3D None):

> +        super().__init__(initialdata)
> +        self.info =3D info
> +        self.doc: Optional['QAPIDoc'] =3D doc
>=20=20
>=20=20
>  class QAPIParseError(QAPISourceError):

[...]


