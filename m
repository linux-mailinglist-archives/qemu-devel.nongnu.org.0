Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBD5351649
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 17:47:28 +0200 (CEST)
Received: from localhost ([::1]:54368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRzXa-0002Nm-U2
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 11:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRzW0-00016t-4N
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:45:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRzVx-0003pg-5E
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617291941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Aa8lrrLpE3lsWsH7/BFbVOqBBXC2fInncVYAHF4SpJ0=;
 b=A19ZoGr4WTsO1mVHYFe5xSkUrgwl3J1PPJ1hWr9IZneXdTt1+atyw9FYrGEK7cokfhoGTr
 rOf5rGENzrAbJVIQpBv157BE863y7ZNfzXQ7Omc+b/Ck/++cQ3qtThhWEgfDO6B/AsNBF0
 Hds7bxFnMUIhjed7BF+c3S8RiADj/kU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-26m7aE0VPhCio5oCqzThew-1; Thu, 01 Apr 2021 11:45:37 -0400
X-MC-Unique: 26m7aE0VPhCio5oCqzThew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 069A85236;
 Thu,  1 Apr 2021 15:45:36 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79CE31378E;
 Thu,  1 Apr 2021 15:45:35 +0000 (UTC)
Date: Thu, 1 Apr 2021 16:45:34 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v3 1/2] block/file-posix: Optimize for macOS
Message-ID: <YGXqnlQDx3N22YV/@stefanha-x1.localdomain>
References: <20210310153916.64256-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210310153916.64256-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mkOiTtpYvPOGLEBq"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 pkrempa@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Konstantin Nazarov <mail@knazarov.com>,
 John Snow <jsnow@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--mkOiTtpYvPOGLEBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 12:39:15AM +0900, Akihiko Odaki wrote:
> @@ -1586,6 +1589,7 @@ out:
>      }
>  }
> =20
> +G_GNUC_UNUSED

Why isn't translate_err() used in the F_PUNCHHOLE case below?

If you really want to avoid using it on macOS, please add a #if with the
necessary conditions here so it's clear when this translate_err() is
needed.

> @@ -514,7 +515,8 @@ static int raw_probe_blocksizes(BlockDriverState *bs,=
 BlockSizes *bsz)
>          return ret;
>      }
> =20
> -    if (!QEMU_IS_ALIGNED(s->offset, MAX(bsz->log, bsz->phys))) {
> +    size =3D MAX(bsz->log, bsz->phys);
> +    if (size && !QEMU_IS_ALIGNED(s->offset, size)) {
>          return -ENOTSUP;
>      }
> =20

This patch changes the semantics of bdrv_probe_blocksizes(). It used to
return -ENOTSUP when phys/log weren't available. Now it returns 0 and
the fields are 0. Please update the bdrv_probe_blocksizes doc comment in
include/block/block_int.h to mention phys and log, as well as that
fields can be set to 0 (or -1 in the case of discard_granularity).

--mkOiTtpYvPOGLEBq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBl6p4ACgkQnKSrs4Gr
c8hR4wf+KuuWyXr6ng81qkOSW8afAwtN07TaaCRlI8iDONsjU44eBZY37OQg3wZ6
QRg6JFtB3kdVTp7QpYGY9OrIMj1AEaRP2bZH/Uh+pOra5uu0e+tRweZ9cDDICXRv
AQEkOP2LUKy52CkIdAFMqy9KSkOSdOiNN06DPhA173omcFGIb2njsQ6L+GmMLio4
nmMcEo8YX9FcQ3Q54rUUgBau9+VONwG1rLJ2uRLCqwuOILLpegrEby1j251BJsT8
6wb3gnvMMaYauevFOwX34qfkuNpIHN8ab9aFeWlXmbH/MyhmUv9Y0Rq+XGwYYm3D
ooI9691CTWB5SNmnRbARDjg72K2AIA==
=2sJ4
-----END PGP SIGNATURE-----

--mkOiTtpYvPOGLEBq--


