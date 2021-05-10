Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F63378CDE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:38:02 +0200 (CEST)
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg66j-0007pC-Cv
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lg5vD-0007Ho-6J
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:26:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lg5v9-0005L2-Dc
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620653162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7T73irMyQJSnwOIR+6gKmtRsDh6DF06Tk02DfC08f2M=;
 b=Lq0xJTVLJvkpPJC7teGAnoyoz28Hhyf28mAt+PSBHD8xd0dblkyfhM+X0jJKJwmLUlY9MR
 aH7cZ1sp/L2mZtUvAcji1g6nMncyrcMROu9VvI5hMjRiKLvidBMvTx/SnI1jtQ000qp6zI
 vqZxSlZRp6oXBxtz+3fCsF5yF9IFKK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-FOpIFJ_YNcKU_g7fa6SiWA-1; Mon, 10 May 2021 09:25:59 -0400
X-MC-Unique: FOpIFJ_YNcKU_g7fa6SiWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D824C8015C6;
 Mon, 10 May 2021 13:25:57 +0000 (UTC)
Received: from localhost (ovpn-115-117.ams2.redhat.com [10.36.115.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32ECF60FC2;
 Mon, 10 May 2021 13:25:54 +0000 (UTC)
Date: Mon, 10 May 2021 14:25:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/2] virtio-blk: Convert QEMUBH callback to "bitops.h"
 API
Message-ID: <YJk0Ybzgna/nPbGK@stefanha-x1.localdomain>
References: <20210507170634.2058801-1-philmd@redhat.com>
 <20210507170634.2058801-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210507170634.2058801-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qAYW9Eht7jreFvJK"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Chai Wen <chaiwen@baidu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qAYW9Eht7jreFvJK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 07, 2021 at 07:06:34PM +0200, Philippe Mathieu-Daud=E9 wrote:
> By directly using find_first_bit() and find_next_bit from the
> "bitops.h" API to iterate over the bitmap, we can remove the
> bitmap[] variable-length array copy on the stack and the complex
> manual bit testing/clearing logic.
>=20
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/block/dataplane/virtio-blk.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
>=20
> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-=
blk.c
> index e9050c8987e..a7b5bda06fc 100644
> --- a/hw/block/dataplane/virtio-blk.c
> +++ b/hw/block/dataplane/virtio-blk.c
> @@ -60,23 +60,12 @@ static void notify_guest_bh(void *opaque)
>  {
>      VirtIOBlockDataPlane *s =3D opaque;
>      unsigned nvqs =3D s->conf->num_queues;
> -    unsigned long bitmap[BITS_TO_LONGS(nvqs)];
> -    unsigned j;
> =20
> -    memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
> -    memset(s->batch_notify_vqs, 0, sizeof(bitmap));
> +    for (unsigned long i =3D find_first_bit(s->batch_notify_vqs, nvqs);
> +             i < nvqs; i =3D find_next_bit(s->batch_notify_vqs, nvqs, i)=
) {
> +        VirtQueue *vq =3D virtio_get_queue(s->vdev, i);
> =20
> -    for (j =3D 0; j < nvqs; j +=3D BITS_PER_LONG) {
> -        unsigned long bits =3D bitmap[j / BITS_PER_LONG];
> -
> -        while (bits !=3D 0) {
> -            unsigned i =3D j + ctzl(bits);
> -            VirtQueue *vq =3D virtio_get_queue(s->vdev, i);
> -
> -            virtio_notify_irqfd(s->vdev, vq);
> -
> -            bits &=3D bits - 1; /* clear right-most bit */
> -        }
> +        virtio_notify_irqfd(s->vdev, vq);
>      }
>  }

Bits in s->batch_notify_vqs[] must be cleared. Otherwise we may raise
spurious irqs next time this function is called. The memset() can be
moved after the loop.

Stefan

--qAYW9Eht7jreFvJK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCZNGEACgkQnKSrs4Gr
c8iYiwf+PEydtfL7L7j5WOFA1bqomNpak8cjLhTXdrZRCl/SVbqiMxRylk40Ylk4
/Cm9lAfsroPPzONeXhv5pFM7YQzv8caTtvQ+8wHxywAofEu43Q7lOvCwOn45ry2e
fx4hvgNFO73L6VhGxnBe9wSROlJYUnBPnC2dZ2oXFiCxCTiUDg+qPP2hQEZBG6LG
m1/xk1SoKxt3fSVa70o9KomcuDsDda1ZWDH6wfKzgNmx79uI/xBn2buKiil+C3Xt
ewd8i4+u1Qs4w8vDmigfnZ3KCZoTUutWFuXtDvuktYxoNoe7GdW660IEtkUBpYve
deOSOJYWg0KTpMleWQ4SNXGItuhhuw==
=0BSr
-----END PGP SIGNATURE-----

--qAYW9Eht7jreFvJK--


