Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4661B492B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 17:52:42 +0200 (CEST)
Received: from localhost ([::1]:53182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRHg1-0006Hw-8J
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 11:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44900)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jRHbz-0003PE-IU
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 11:48:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jRHbx-0007My-FC
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 11:48:31 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36521
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jRHbw-0007M9-Fw
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 11:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587570506;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OPue3pHpWPFWw7iFcJgVN4hohWjRkR+l3nCuSL/E3Bg=;
 b=Mfw/CT9PLmNSSHBKH5mbnzsvGHEeb0ZBuckVt0mOZ9yK90S9rKAE2n+rnfYqs5Agir42zh
 UFvL4hxHCui3g8auf12bSA3HqKT+lpNBSINIvkZJXOX8zTrm4NrAkcpgYp+N1MbClF87uN
 f6CdJ6aRDJLdcsSSsqJErXZUEjuD71o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-_FATwDjdM_C0zgcR2wiqXQ-1; Wed, 22 Apr 2020 11:48:24 -0400
X-MC-Unique: _FATwDjdM_C0zgcR2wiqXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B6CC809882;
 Wed, 22 Apr 2020 15:48:23 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61A83600D2;
 Wed, 22 Apr 2020 15:48:22 +0000 (UTC)
Date: Wed, 22 Apr 2020 16:48:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alexey Krasikov <alex-krasikov@yandex-team.ru>
Subject: Re: [PATCH 2/2] crypto/secret: fix return logic of
 crypto_secret_prop_get_loaded()
Message-ID: <20200422154819.GH587120@redhat.com>
References: <20200415201336.24195-1-alex-krasikov@yandex-team.ru>
 <20200415201336.24195-2-alex-krasikov@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20200415201336.24195-2-alex-krasikov@yandex-team.ru>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:57:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 15, 2020 at 11:13:36PM +0300, Alexey Krasikov wrote:
> * Get function returned value of properties 'data' insteed of returning
>   value of raw data internal field. This error did not affect anyone,
>   because no one called the get function.
>=20
> Signed-off-by: Alexey Krasikov <alex-krasikov@yandex-team.ru>
> ---
>  crypto/secret.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/crypto/secret.c b/crypto/secret.c
> index 546b965afe..79b9b4ce0c 100644
> --- a/crypto/secret.c
> +++ b/crypto/secret.c
> @@ -231,7 +231,7 @@ qcrypto_secret_prop_get_loaded(Object *obj,
>                                 Error **errp G_GNUC_UNUSED)
>  {
>      QCryptoSecret *secret =3D QCRYPTO_SECRET(obj);
> -    return secret->data !=3D NULL;
> +    return secret->rawdata !=3D NULL;
>  }

I already have this change queued from another user, so I'll drop this
dupe.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


