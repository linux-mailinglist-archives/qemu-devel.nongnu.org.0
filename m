Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0048A403A09
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:39:53 +0200 (CEST)
Received: from localhost ([::1]:48904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwro-0003PH-VR
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNwlt-0006uT-H5
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:33:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNwlr-0007IF-Km
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:33:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631104422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o63FY9tLvpaM73PzHbWVAWHVMiMttA4VFwDXu3pz/Zo=;
 b=eAbkwD8GCG9kYwkPbG8Uopqn+XXRU4TUC8rRxa4ahB2WQ2hlBllJUGZ1kv3tHII3jh9nDD
 42QFAeNRm+P1pXEh/lE4x25JF15KaQ9dMXEcjHBUMQnytXF/WyctXFAFJGOjMlQv4SxnR9
 dtpMRRxmWC7NfO7JpTbUSVZYqX2S4a4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-n2e4C5exMgGECakD5rCpNA-1; Wed, 08 Sep 2021 08:33:40 -0400
X-MC-Unique: n2e4C5exMgGECakD5rCpNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7E12100C662
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 12:33:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C06D310074EF;
 Wed,  8 Sep 2021 12:33:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 52BDD1138606; Wed,  8 Sep 2021 14:33:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [RFC v3 14/32] scripts/qapi: add QAPISchemaIfCond.rsgen()
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-15-marcandre.lureau@redhat.com>
Date: Wed, 08 Sep 2021 14:33:31 +0200
In-Reply-To: <20210907121943.3498701-15-marcandre.lureau@redhat.com>
 (marcandre lureau's message of "Tue, 7 Sep 2021 16:19:25 +0400")
Message-ID: <87h7evw8kk.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Generate Rust #[cfg(...)] guards from QAPI 'if' conditions.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  scripts/qapi/common.py | 16 ++++++++++++++++
>  scripts/qapi/schema.py |  4 ++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index 5f8f76e5b2..6d22c66391 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -201,6 +201,22 @@ def guardend(name: str) -> str:
>                   name=3Dc_fname(name).upper())
> =20
> =20
> +def rsgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
> +
> +    def cfg(ifcond: Union[str, Dict[str, Any]]):
> +        if isinstance(ifcond, str):
> +            return ifcond
> +        if isinstance(ifcond, list):
> +            return ', '.join([cfg(c) for c in ifcond])
> +        oper, operands =3D next(iter(ifcond.items()))
> +        operands =3D cfg(operands)
> +        return f'{oper}({operands})'
> +
> +    if not ifcond:
> +        return ''
> +    return '#[cfg(%s)]' % cfg(ifcond)
> +
> +
>  def gen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]],
>                 cond_fmt: str, not_fmt: str,
>                 all_operator: str, any_operator: str) -> str:

Can we generalize gen_ifcond() to work for rsgen_ifcond(), too?

> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 6455a8f425..c61f35e13f 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -26,6 +26,7 @@
>      docgen_ifcond,
>      gen_endif,
>      gen_if,
> +    rsgen_ifcond,
>  )
>  from .error import QAPIError, QAPISemError, QAPISourceError
>  from .expr import check_exprs
> @@ -48,6 +49,9 @@ def gen_endif(self):
>      def docgen(self):
>          return docgen_ifcond(self.ifcond)
> =20
> +    def rsgen(self):
> +        return rsgen_ifcond(self.ifcond)
> +
>      def is_present(self):
>          return bool(self.ifcond)


