Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2108338707F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 06:12:00 +0200 (CEST)
Received: from localhost ([::1]:57036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lir5L-0001Qx-6d
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 00:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lir3n-0007k3-81
 for qemu-devel@nongnu.org; Tue, 18 May 2021 00:10:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lir3h-0003KW-Oe
 for qemu-devel@nongnu.org; Tue, 18 May 2021 00:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621311016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c1NxMJLUSKAPRUSxrCUF20d7gBBgdy1AM6vI4DYqK7c=;
 b=BBVioTlzvnjssBYs7vo3GtqpAOhf/1o2sIkxfYSTBeqwxwQvuPXY7Lm1n/T57jKHeSZllu
 UAAaDaAl0WTGF8yKI7ZNmHPMlGIdqI8BCVl9+ZAlue470WJWWeWztQCaBnmiZlyTqYbyTM
 1itHuR3w7H54XgukcSTt5qgeCZDpJUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-Rx22S_k8MyqhOVGGcsGL0g-1; Tue, 18 May 2021 00:10:12 -0400
X-MC-Unique: Rx22S_k8MyqhOVGGcsGL0g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E655801B12
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 04:10:11 +0000 (UTC)
Received: from localhost (ovpn-115-22.phx2.redhat.com [10.3.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A210759463;
 Tue, 18 May 2021 04:10:06 +0000 (UTC)
Date: Mon, 17 May 2021 23:48:15 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 3/6] python/machine: use subprocess.run instead of
 subprocess.Popen
Message-ID: <20210518034815.GB917386@amachine.somewhere>
References: <20210517184808.3562549-1-jsnow@redhat.com>
 <20210517184808.3562549-4-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210517184808.3562549-4-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 02:48:05PM -0400, John Snow wrote:
> use run() instead of Popen() -- to assert to pylint that we are not
> forgetting to close a long-running program.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine.py | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

qemu-iotests 045 and 147 are happy, so:

Tested-by: Cleber Rosa <crosa@redhat.com>

--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCjOPkACgkQZX6NM6Xy
CfP5CA//XyPd9OEQ/QUZ4SeKro53JRPnS44USC07cVv5IIwCCPqC0dUHvStDxmha
HBFfY/cEXvDvTU6223QmZtn2lwXH9o+EQGYQcBEpfaM2FmYdPbsiv1DcMuAcNjNI
820hq5D7zU7pZRWYKttfDnC6HP6VeRrfhJX+ZARf3bDTsD/AmWIYulKPaVJwvrqX
DB9jiupxY782qAw4plTybrlfm41Qm2af1pvPLf21DD/In5TqUzinC5Pne/Nf8a9t
6B9xaXQTMv43mV+GaXRC8TI3/ROSERl5aFWwnqQ9FMPPGHnvvQD0JJ12Zf97/MhN
1Qpr6pc1nN9gAaC92GIBqL3khuC5BIiLJW212B/4PtedJKqXsu+HRfTIg26yB9GN
ETkKqC8bu0xMZIh0mc82fXgXLqzYlELsBlgOUNYb5BK7DBxKteEESG/RUnbiyLxZ
7v/mndUBFvKw2qtKisMbe/7mSEDKloxFAFUDVsKPIAVvKOf3dWB9n5ER0nYxHsdH
yowMVbR1YGn0yiEVFic2RuamO9eLpG+wSwIZ2MfSxo2Ht1A17UADEyg3SEIBVss0
9ghQ75UMKo0zQh4Plt0F39pA2GaBBbF+s+qPVuMTF47/LW+eKVRJj2eAhQK3Jg/9
HQHcZljryexG08Cq3ftLCY8LFGCGPPZ4/4v+cSurKWgxUZRR6bc=
=z4si
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--


