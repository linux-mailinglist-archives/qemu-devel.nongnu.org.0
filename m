Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BB542547D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:42:18 +0200 (CEST)
Received: from localhost ([::1]:59236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTf7-0007W8-Cg
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYTTH-0002Of-9V
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:30:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYTTC-0002OE-LT
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:30:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633613396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vJJPspILsbAL/ugjF868A0YLIK3Z/I5PIs2VfUg048g=;
 b=MWXEGM8gvoccr4UheOxhWFwZBANq6YHxFCPKyx5UWenzMYj8fTzsrnNDXltKRvtSWbpz/P
 3q/R2C0ajjrsoCkifY7n/sO89hukB4fuhprNgLxhFJxT/hbpxHmVFLEUy1AintQF/khACI
 tmCpnWsF0iQT32s5vqDr4BxSx/WzpkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-u463eTVLNpSvUZ-VXRlDWg-1; Thu, 07 Oct 2021 09:29:53 -0400
X-MC-Unique: u463eTVLNpSvUZ-VXRlDWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F1821084686;
 Thu,  7 Oct 2021 13:29:52 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82E0260C17;
 Thu,  7 Oct 2021 13:29:39 +0000 (UTC)
Date: Thu, 7 Oct 2021 14:29:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 5/5] block/nvme: Fix memory leak from nvme_init_queue()
Message-ID: <YV72QsbNN3Eb2kLV@stefanha-x1.localdomain>
References: <20211006164931.172349-1-philmd@redhat.com>
 <20211006164931.172349-6-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211006164931.172349-6-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5fg591rBLMrUUQIP"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--5fg591rBLMrUUQIP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 06, 2021 at 06:49:31PM +0200, Philippe Mathieu-Daud=E9 wrote:
> nvme_create_queue_pair() allocates resources with qemu_vfio_dma_map(),
> but we never release them. Do it in nvme_free_queue() which is called
> from nvme_free_queue_pair().
>=20
> Reported by valgrind:
>=20
>   =3D=3D252858=3D=3D 520,192 bytes in 1 blocks are still reachable in los=
s record 8,293 of 8,302
>   =3D=3D252858=3D=3D    at 0x4846803: memalign (vg_replace_malloc.c:1265)
>   =3D=3D252858=3D=3D    by 0x484691F: posix_memalign (vg_replace_malloc.c=
:1429)
>   =3D=3D252858=3D=3D    by 0xB8AFE4: qemu_try_memalign (oslib-posix.c:210=
)
>   =3D=3D252858=3D=3D    by 0xA9E315: nvme_create_queue_pair (nvme.c:229)
>   =3D=3D252858=3D=3D    by 0xAA0125: nvme_init (nvme.c:799)
>   =3D=3D252858=3D=3D    by 0xAA081C: nvme_file_open (nvme.c:953)
>   =3D=3D252858=3D=3D    by 0xA23DDD: bdrv_open_driver (block.c:1550)
>   =3D=3D252858=3D=3D    by 0xA24806: bdrv_open_common (block.c:1827)
>   =3D=3D252858=3D=3D    by 0xA2889B: bdrv_open_inherit (block.c:3747)
>   =3D=3D252858=3D=3D    by 0xA28DE4: bdrv_open (block.c:3840)
>   =3D=3D252858=3D=3D    by 0x9E0F8E: bds_tree_init (blockdev.c:675)
>   =3D=3D252858=3D=3D    by 0x9E7C74: qmp_blockdev_add (blockdev.c:3551)
>=20
> Fixes: bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  block/nvme.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/block/nvme.c b/block/nvme.c
> index 6e476f54b9f..903c8ffa060 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -185,6 +185,7 @@ static bool nvme_init_queue(BDRVNVMeState *s, NVMeQue=
ue *q,
> =20
>  static void nvme_free_queue(BDRVNVMeState *s, NVMeQueue *q)
>  {
> +    qemu_vfio_dma_unmap(s->vfio, q->queue);
>      qemu_vfree(q->queue);
>  }

I can't figure out the issue. qemu_vfree(q->queue) was already called
before this patch. How does adding qemu_vfio_dma_unmap() help with the
valgrind report in the commit description?

Stefan

--5fg591rBLMrUUQIP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFe9kIACgkQnKSrs4Gr
c8hr2Qf/Tcg0inD0/bCgS8hQhPQdhmqZO2OWEPmGJqwYZN+Zs7WaXbhksWC7rq7Z
K79MqlPUiw4l1m/HsjqZLZJzr7HRUy3T3ogji8oFS5B4ciH9JMrH0eYbX8SQCI9N
Yl9A+md2V82qOueIXWun+w6/j0JLCwJ1RKLjB+pUhGy5vTxpcA90nbZuDEOJVEhc
adrmoocBLYCznOIJ2mdRr+N2rIkpRCnQlRrHPk4hE+W22SO4A+As3XHX0NIO1TvY
QgU5yMjqAD/mf4zAHAjemdftg3tx5bBcVXvddtGUnmoUk1ZwNorRrulb06BVPKIk
0e0EgxbnnNzgBrMmM8vRrL9+ZvdONA==
=EwKI
-----END PGP SIGNATURE-----

--5fg591rBLMrUUQIP--


