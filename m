Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136083DEEF6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 15:18:39 +0200 (CEST)
Received: from localhost ([::1]:45174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAuJZ-0001wh-Ja
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 09:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAuII-0001BQ-1K
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:17:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAuIF-0004AG-DS
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627996633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qH/s7Qkm5siTJcRMy1DX5Sv7d/FZLrSFx+rcGcK3TP8=;
 b=QJmcSuFSEIK07Ys3gBXEesIh5jG88f/22t1eWYaP4KT4D1iMohUJAtqltaAPvmm0lx10Zi
 ss5TebiKDIPNRtkNYjrUn/SWilhD5abPEvcKMhRY+oF4mOs7A/K6hF/WAoRz6RQGmgoWPl
 8b0HNofWmsshCVllYk+MkH4mPAQdwiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-dxveKsMQP6WPbpQD7Tb2aQ-1; Tue, 03 Aug 2021 09:17:12 -0400
X-MC-Unique: dxveKsMQP6WPbpQD7Tb2aQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CEB41940920
 for <qemu-devel@nongnu.org>; Tue,  3 Aug 2021 13:17:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06C9219C44;
 Tue,  3 Aug 2021 13:17:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6C16311380A0; Tue,  3 Aug 2021 15:17:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v6 07/11] qapi: replace if condition list with dict
 {'all': [...]}
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-8-marcandre.lureau@redhat.com>
Date: Tue, 03 Aug 2021 15:17:02 +0200
In-Reply-To: <20210618102507.3761128-8-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Fri, 18 Jun 2021 14:25:03 +0400")
Message-ID: <87wnp2r7ld.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

One more thing...

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Replace the simple list sugar form with a recursive structure that will
> accept other operators in the following commits (all, any or not).
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---

[...]

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

Not covered by the negative tests in tests/qapi-schema/.  Please
double-check that all new errors are covered.

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
> =20
> =20

[...]


