Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AAC3BBB63
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:40:51 +0200 (CEST)
Received: from localhost ([::1]:56620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0M1y-0005vX-K8
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m0M0n-0004Nv-Fd
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:39:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m0M0j-0002vk-Qx
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:39:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625481572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dR3Tvl94z+WrYHix2YE03tF+zVezyik8Po56Dpod0wo=;
 b=Krb+FrqtDg6FmbVmWczywJx2vkz7O4AD+M2C1fmhc/9rp8gdEAzWARq4s33A+rikXWNn7V
 uXnrpkYqiIh43CYq1SMk42iPFwYrUo9mVQ2sslkE7NYyoYBaQnDRYWgAVAH3fWaEThUgNV
 wZ77Mhe/gR6clu/ApEN7zcKwfrnqS+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-f-_Op1LzNyyiRewovZciqQ-1; Mon, 05 Jul 2021 06:39:24 -0400
X-MC-Unique: f-_Op1LzNyyiRewovZciqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E77991800D41;
 Mon,  5 Jul 2021 10:39:22 +0000 (UTC)
Received: from localhost (ovpn-114-164.ams2.redhat.com [10.36.114.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 500695C1BB;
 Mon,  5 Jul 2021 10:39:22 +0000 (UTC)
Date: Mon, 5 Jul 2021 11:39:21 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [v5 1/3] block/file-posix: Optimize for macOS
Message-ID: <YOLhWaEoQ97Hq8U3@stefanha-x1.localdomain>
References: <20210402160256.39647-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210402160256.39647-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aZURrz6P4sMvTeDj"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 shajnocz <shajnocz@redhat.com>, John Snow <jsnow@redhat.com>,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--aZURrz6P4sMvTeDj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 02, 2021 at 09:02:54AM -0700, Akihiko Odaki wrote:
> This commit introduces "punch hole" operation and optimizes transfer
> block size for macOS.
>=20
> Thanks to Konstantin Nazarov for detailed analysis of a flaw in an
> old version of this change:
> https://gist.github.com/akihikodaki/87df4149e7ca87f18dc56807ec5a1bc5#gist=
comment-3654667
>=20
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  block/file-posix.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)

I encountered the following qemu-iotests failure after applying this
series:

172                             fail       [11:09:32] [11:09:36]   3.6s    =
             output mismatch (see 172.out.bad)
--- /home/stefanha/qemu/tests/qemu-iotests/172.out
+++ 172.out.bad
@@ -21,6 +21,7 @@
               dev: floppy, id ""
                 unit =3D 0 (0x0)
                 drive =3D "floppy0"
+                backend_defaults =3D "auto"
                 logical_block_size =3D 512 (512 B)
                 physical_block_size =3D 512 (512 B)
                 min_io_size =3D 0 (0 B)
...

You can run the test case like this:

  $ (cd tests/qemu-iotests && ./check -qcow2 172)

It looks like the 172.out test output file just needs to be updated to
include the new backend_defaults property.

Stefan

--aZURrz6P4sMvTeDj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDi4VkACgkQnKSrs4Gr
c8ik8wgAt5PsqtJflN5k5qbCtxxG+jl4iLRCL6V4M4a1NjawGi+W5qrn5M2ZcIhn
JsDL4ceE8zfx2/7PBtt3eV1d1qMGhaJTgVN9gTGK+TSBXDHmrgs8xSyvKhcbOn3q
4S/n5u57Z5Xq87fu+03PwTjTaDPiT4vNWH7jbo0GOyXMuHKsCnWwjn770EBilgRd
KNCfCDeOIRvbFGbUm//P/T8cI3NmpgCVSLJpYMvgwxxpAgraVk5ykcoA21OOEIbb
S2fuVsanvW62UnOZxPu0s0FIBgb5FPWjjXdV8GoUgG0aqMwSz2Z/RQCtDeoK/CY9
dPtBgyh2zidRpcneHfHUGg1Mg731Zg==
=Kog6
-----END PGP SIGNATURE-----

--aZURrz6P4sMvTeDj--


