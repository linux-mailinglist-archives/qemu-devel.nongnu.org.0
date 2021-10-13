Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2D342BBDE
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:44:17 +0200 (CEST)
Received: from localhost ([::1]:32862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maao4-000885-1C
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1maaku-0002xd-TN
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:41:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1maakt-0003sQ-4Q
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634118058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ihr5bWXnlFJsrh/1Gezdoj/2jjuw9hySv2u/G/IwRDI=;
 b=bUBCAn2C4pevpq7TYVeVrRqEuwdM4mOV2P+4kO511SQ4tUXc5q5iyZXU9kBQAxFh4hyqz/
 C261hvFpa32aypQqv8X6PeOg88ipyrOgB2e9cQ4Prh0ruPdITRnHkPAmwi67p+mPPG65pN
 jS7kEcY7UmKt9YhkYIAlsLncOknis6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-bdF_X08fMzOhb9FBrlyovQ-1; Wed, 13 Oct 2021 05:40:56 -0400
X-MC-Unique: bdF_X08fMzOhb9FBrlyovQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C78948BD960;
 Wed, 13 Oct 2021 09:40:55 +0000 (UTC)
Received: from localhost (unknown [10.39.193.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 325F45C3DF;
 Wed, 13 Oct 2021 09:40:47 +0000 (UTC)
Date: Wed, 13 Oct 2021 10:40:46 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG skipping
 mmap_addr
Message-ID: <YWapnsmfDMPj80Sd@stefanha-x1.localdomain>
References: <20211011201047.62587-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211011201047.62587-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0cyQIy4pqd7jfpIZ"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Coiby Xu <coiby.xu@gmail.com>, qemu-stable@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0cyQIy4pqd7jfpIZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 10:10:47PM +0200, David Hildenbrand wrote:
> We end up not copying the mmap_addr of all existing regions, resulting
> in a SEGFAULT once we actually try to map/access anything within our
> memory regions.
>=20
> Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-user")
> Cc: qemu-stable@nongnu.org
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> Cc: "Marc-Andr=E9 Lureau" <marcandre.lureau@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Coiby Xu <coiby.xu@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libv=
host-user/libvhost-user.c
> index bf09693255..787f4d2d4f 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -816,6 +816,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>              shadow_regions[j].gpa =3D dev->regions[i].gpa;
>              shadow_regions[j].size =3D dev->regions[i].size;
>              shadow_regions[j].qva =3D dev->regions[i].qva;
> +            shadow_regions[j].mmap_addr =3D dev->regions[i].mmap_addr;
>              shadow_regions[j].mmap_offset =3D dev->regions[i].mmap_offse=
t;
>              j++;
>          } else {

Raphael: Some questions about vu_rem_mem_reg():

- What ensures that shadow_regions[VHOST_USER_MAX_RAM_SLOTS] is large
  enough? The add_mem_reg/set_mem_table code doesn't seem to check
  whether there is enough space in dev->regions[] before adding regions.

- What happens when the master populated dev->regions[] with multiple
  copies of the same region? dev->nregions is only decremented once and
  no longer accurately reflects the number of elements in
  dev->regions[].

libvhost-user must not trust the vhost-user master since vhost-user
needs to provide process isolation. Please add input validation.

Stefan

--0cyQIy4pqd7jfpIZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFmqZ4ACgkQnKSrs4Gr
c8glggf/SiaZcaRTogsvO/MTCZB8Vex4PnImbHX05BF6sv4WG5NdHWnIbtlmUGEm
0YvtksJSXoLB2OoCR1JgENkSgoJxRvnGB3xxhLaxbuVJ12F8A5NobGfWei+lL5pB
Exokq/htOrymbTNAcLoCqKV9LtcoyXrb4YNcPb2vTG4dfPMtjED/ha6qUhjOELA9
PM6VWbgWqomz2Jm81kO/VoRQNaF1p2tG1AYQ11/h9abgNvuBkgx4io5Ijbvn1S6j
oQwGzGMSaUGhAyE4dbUstHd4LPhIWRl4igSCHIsTllQAcaRu7N6M7pOYdNj7h/eW
zSntb17iq7iv4vR7LNeGIHGzmFB4eg==
=60SQ
-----END PGP SIGNATURE-----

--0cyQIy4pqd7jfpIZ--


