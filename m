Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E0629D0C2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 16:38:34 +0100 (CET)
Received: from localhost ([::1]:51378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXnWz-0004GP-TS
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 11:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kXnUj-0002Wp-FV
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 11:36:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kXnUb-0000Sc-KZ
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 11:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603899364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZbojeWKKeg9srrky6591hpb7qDdpohXj9xB4kvkOsAI=;
 b=H6GUkMXC8El9MQv+I7s0qc88VqoMhr5uvyqRWqcVknlyjzOxnwG/UeWn8QfvwHdAd0SbdZ
 JosoaGTP0T3TupeoUknCQg4MeZvfU6h24LigEZYLQXMK86ihQkcoEkmZoT0BrA2P71IW1P
 cma5EHhOdJv97p4SRPNgB0zO4GNJguQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-WE_4cO_-O9KEMaoJULibwQ-1; Wed, 28 Oct 2020 11:36:01 -0400
X-MC-Unique: WE_4cO_-O9KEMaoJULibwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08B6183DC21;
 Wed, 28 Oct 2020 15:36:00 +0000 (UTC)
Received: from localhost (ovpn-114-6.ams2.redhat.com [10.36.114.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FD3460C04;
 Wed, 28 Oct 2020 15:35:56 +0000 (UTC)
Date: Wed, 28 Oct 2020 15:35:55 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 21/25] block/nvme: Change size and alignment of IDENTIFY
 response buffer
Message-ID: <20201028153555.GN231368@stefanha-x1.localdomain>
References: <20201027135547.374946-1-philmd@redhat.com>
 <20201027135547.374946-22-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201027135547.374946-22-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="K4LMwn8CgX2KMboP"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:51:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--K4LMwn8CgX2KMboP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2020 at 02:55:43PM +0100, Philippe Mathieu-Daud=E9 wrote:
> From: Eric Auger <eric.auger@redhat.com>
>=20
> In preparation of 64kB host page support, let's change the size
> and alignment of the IDENTIFY command response buffer so that
> the VFIO DMA MAP succeeds. We align on the host page size.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  block/nvme.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--K4LMwn8CgX2KMboP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+Zj9sACgkQnKSrs4Gr
c8gXSwf/ZxNXAayLKKLSx6WnAjc41qIyCRZjYp5ZTdrvfqN7+GS41gD+/QOkr/A+
2BCbwvKnDxfDeNPPCzTVZZyB5+KyrhejuKDNongcncyyCdbcYim6Ff7mVqnXsoDy
KAZxUjfsK0w7ydQ/PJPD8NvsLeQAT6kT/lXfiZhM4Hns98ILwy49hHFY6giRzHuk
dogdWpp9Gfrmb7U5syW9kgNmDKsjrBQJ63rCFAl9tS6z0jx4JJBz2M1sC6U77ubF
MAjdLNAGTrzlKf3g1jjM6YT7+xsDAlxFP+tdyfMPhtwJhcRWK/4Jr/CzSIH2qZBx
mFIny3DluW6Mhlxf4u9UcsEaajgM4w==
=+R2z
-----END PGP SIGNATURE-----

--K4LMwn8CgX2KMboP--


