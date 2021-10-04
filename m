Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DF242083C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:27:30 +0200 (CEST)
Received: from localhost ([::1]:53504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKFt-0001nq-8v
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXKC2-0005Eo-B1
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:23:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXKBz-0006U3-NH
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633339406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bbKVz5kUDBEVajS6FkIp/vcFOpdY8nR5z6hHeLozsws=;
 b=SnwwRDJp+DG4++V/mb7t73Et6EXKdFLQWr4wXGasWqWqCDW6v4FJ1dkxTfD7SqRle6A05f
 //otXYArdn9Eg7Pe5vb0PQz+zMApdTjz+W9h4xyq2hO7x8e7R7YXKQh0DwZ9Kl91zSDPUY
 dh3hIFQcsDolOJgW4mDW7bwwZRHcxlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-EYYPsjzWOCScQ91jqIe4pw-1; Mon, 04 Oct 2021 05:23:25 -0400
X-MC-Unique: EYYPsjzWOCScQ91jqIe4pw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A9781084684
 for <qemu-devel@nongnu.org>; Mon,  4 Oct 2021 09:23:24 +0000 (UTC)
Received: from localhost (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2FCD5F4E7;
 Mon,  4 Oct 2021 09:23:19 +0000 (UTC)
Date: Mon, 4 Oct 2021 10:23:18 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 2/3] hw/virtio: Acquire RCU read lock in
 virtqueue_packed_drop_all()
Message-ID: <YVrIBqT2gXAwhNF3@stefanha-x1.localdomain>
References: <20210906104318.1569967-1-philmd@redhat.com>
 <20210906104318.1569967-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210906104318.1569967-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oJRrLTzYvmVAMs2b"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--oJRrLTzYvmVAMs2b
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 06, 2021 at 12:43:17PM +0200, Philippe Mathieu-Daud=E9 wrote:
> vring_get_region_caches() must be called with the RCU read lock
> acquired. virtqueue_packed_drop_all() does not, and uses the
> 'caches' pointer. Fix that by using the RCU_READ_LOCK_GUARD()
> macro.

Is this a bug that has been encountered, is it a latent bug, a code
cleanup, etc? The impact of this isn't clear but it sounds a little
scary so I wanted to check.

>=20
> Reported-by: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/virtio/virtio.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 97f60017466..7d3bf9091ee 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -1704,6 +1704,8 @@ static unsigned int virtqueue_packed_drop_all(VirtQ=
ueue *vq)
>      VirtIODevice *vdev =3D vq->vdev;
>      VRingPackedDesc desc;
> =20
> +    RCU_READ_LOCK_GUARD();
> +
>      caches =3D vring_get_region_caches(vq);
>      if (!caches) {
>          return 0;
> --=20
> 2.31.1
>=20

--oJRrLTzYvmVAMs2b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFayAYACgkQnKSrs4Gr
c8icAwgAlCI4+ELPu3QkUDBsTLRaX7YefiSVv8v5F17rE1Xs/GaCTuthNNwyvj4/
MgCxSljrkBWWeJlPvXn3kfo5zIjgUFC1TVLTweP+nUtj0ClR2BaPA8CtmSnOsHMy
UFIELnzA6NIwwsfVKzf5oU7XNtaUyREzzYlWUKvvJ2+oixBLpVvgi2OR4H0vquUy
9CysX3a2uX5i64N5MK/ZptiVLRw3Ot4fK2yboIhbFYxmcq4MqEMepA44K0ZvFLyv
jSolBWkbKbaqrixr2r0WnJ5mnxYLklsUdmKPMLKRPgLPqUp6rACObxKgfgixb1eP
48fNkJh6cr3ja9wf9FQmk+4GuZIkeA==
=VsvU
-----END PGP SIGNATURE-----

--oJRrLTzYvmVAMs2b--


