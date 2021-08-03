Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B693DEF26
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 15:36:55 +0200 (CEST)
Received: from localhost ([::1]:49350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAubG-00082a-9I
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 09:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAuaM-0007ND-KY
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:35:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAuaK-0000Al-4d
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627997755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TuUPg9g2Fr11XnARUQa2/7SmQR5XjaOKJbic5glYUUE=;
 b=SVlY0EVUT0P7yByv7lploC0Uvkvd3x37Li0Xg67NTLuiDp954xmRUyLz6GDWigt8jCQAFg
 8+BDcAAJx9vmRueJ7qRNCX/cXp16H84q+CRCVhXAA7/dyr3bqcF6J0c2U1pBIK8imHVIkP
 oxfMixvuMTTljF6OFbbhvYGpLA1TxQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-2Uh_gkr2MHatML9K9-_XhQ-1; Tue, 03 Aug 2021 09:35:53 -0400
X-MC-Unique: 2Uh_gkr2MHatML9K9-_XhQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C31C41932482
 for <qemu-devel@nongnu.org>; Tue,  3 Aug 2021 13:35:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BCC010372DF;
 Tue,  3 Aug 2021 13:35:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5CBB311380A0; Tue,  3 Aug 2021 15:35:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v6 11/11] qapi: make 'if' condition strings simple
 identifiers
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-12-marcandre.lureau@redhat.com>
Date: Tue, 03 Aug 2021 15:35:43 +0200
In-Reply-To: <20210618102507.3761128-12-marcandre.lureau@redhat.com>
 (marcandre lureau's message of "Fri, 18 Jun 2021 14:25:07 +0400")
Message-ID: <87bl6er6q8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
> Change the 'if' condition strings to be C-agnostic and be simple
> identifiers.

This is less general, and that's okay, we're doing it for a purpose.
But the commit message should mention / explain all this.

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Tested-by: John Snow <jsnow@redhat.com>
> ---

[...]

> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index f8718e201b..0c718e43c9 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -218,7 +218,7 @@ def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -=
> str:
>      if not ifcond:
>          return ''
>      if isinstance(ifcond, str):
> -        return ifcond
> +        return 'defined(' + ifcond + ')'
> =20
>      oper, operands =3D next(iter(ifcond.items()))
>      if oper =3D=3D 'not':
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index d2bd52c49f..d355cbc8c1 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -281,10 +281,10 @@ def check_if(expr: _JSONObject, info: QAPISourceInf=
o, source: str) -> None:
> =20
>      def _check_if(cond: Union[str, object]) -> None:
>          if isinstance(cond, str):
> -            if not cond.strip():
> +            if not cond.isidentifier():

This accepts *Python* identifiers:

    $ python
    Python 3.9.6 (default, Jul 16 2021, 00:00:00)
    [...]
    >>> 'Andr=C3=A9'.isidentifier()
    True

These may or may not work for the languages we generate.  Wouldn't
restricting identifiers to something like /[A-Z][A-Z0-9_]*/ make more
sense?

>                  raise QAPISemError(
>                      info,
> -                    "'if' condition '%s' of %s makes no sense"
> +                    "'if' condition '%s' of %s is not a valid identifier=
"
>                      % (cond, source))
>              return
> =20
> diff --git a/tests/qapi-schema/alternate-branch-if-invalid.err b/tests/qa=
pi-schema/alternate-branch-if-invalid.err
> index d384929c51..03bad877a3 100644
> --- a/tests/qapi-schema/alternate-branch-if-invalid.err
> +++ b/tests/qapi-schema/alternate-branch-if-invalid.err
> @@ -1,2 +1,2 @@
>  alternate-branch-if-invalid.json: In alternate 'Alt':
> -alternate-branch-if-invalid.json:2: 'if' condition ' ' of 'data' member =
'branch' makes no sense
> +alternate-branch-if-invalid.json:2: 'if' condition ' ' of 'data' member =
'branch' is not a valid identifier

[...]


