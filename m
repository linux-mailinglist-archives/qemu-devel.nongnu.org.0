Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1065F6DBE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 20:54:37 +0200 (CEST)
Received: from localhost ([::1]:51004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogW0v-0007iH-Vy
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 14:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogVtb-0005dQ-MK
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:47:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogVta-0005pP-9w
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665082017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p9dSohB9/fkF2X4INbQTygIW6/JzlEQTAlJJH4Vhi8Q=;
 b=e/3Bm9G8nz00hb6XVeYntN1HFnarG+bSflVyrgUKiVI4NYeaW9fSDX53y8aV6IVsH8WwVJ
 YW+z6pOG0+q4eUpBphw/Xkx4pOTm/KvJy58sNkpwExIGwCIxVLZARIRWs4eNjG9a1o2m22
 +PUn145A7G+ImxeQEZEyfoVAgpblmdk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-TLs2M8RWNBuC8jE2nGN6Ag-1; Thu, 06 Oct 2022 14:46:54 -0400
X-MC-Unique: TLs2M8RWNBuC8jE2nGN6Ag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A0CE38164C0;
 Thu,  6 Oct 2022 18:46:54 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E61C3145888E;
 Thu,  6 Oct 2022 18:46:51 +0000 (UTC)
Date: Thu, 6 Oct 2022 14:46:49 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Eric Blake <eblake@redhat.com>, integration@gluster.org,
 David Hildenbrand <david@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, sgarzare@redhat.com
Subject: Re: [PATCH v5 11/12] blkio: implement BDRV_REQ_REGISTERED_BUF
 optimization
Message-ID: <Yz8imZI9Bb0WGzKZ@fedora>
References: <20220927193431.22302-1-stefanha@redhat.com>
 <20220927193431.22302-12-stefanha@redhat.com>
 <YzSex5t0UIAT+LPU@fedora>
 <CAELaAXyURC9YJvtjY3O5iXsA5Q0WCTxM21++iqJ__pna9CSNOQ@mail.gmail.com>
 <Yz8Xr81Dw8M9rj3c@fedora>
 <CAELaAXw+sLHOX9drshJbZmpryRkQFd4ozuX-ZoCq+uTRwXsaWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SQDsPrkrnDdOueww"
Content-Disposition: inline
In-Reply-To: <CAELaAXw+sLHOX9drshJbZmpryRkQFd4ozuX-ZoCq+uTRwXsaWg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SQDsPrkrnDdOueww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2022 at 07:09:36PM +0100, Alberto Faria wrote:
> On Thu, Oct 6, 2022 at 7:00 PM Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> > s->needs_mem_regions determines if we'll use libblkio memory regions at
> > all. When it's false we skip blkio_map_mem_region() and therefore it's
> > safe to set s->mem_regions_pinned to false.
>=20
> blkio_register_buf() calls blkio_map_mem_region(). Is the
> bdrv_register_buf callback maybe skipped somehow when
> needs_mem_regions is false?

You're right. blkio_register_buf() will be called by virtio-blk's ram
block registrar even when s->needs_mem_regions is false.

s->mem_regions_pinned therefore has to default to true even when
s->needs_mem_regions is false.

> Regardless, I'd say we want to map memory regions even if we don't
> strictly need to (in cases where we can do so at no additional cost),
> since that may improve performance for some drivers.

The downside is that when s->mem_regions_pinned is true, virtio-mem and
anything else that calls ram discard cannot be used.

I think we can try that for now and see if the policy needs to be
refined.

Stefan

--SQDsPrkrnDdOueww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM/IpkACgkQnKSrs4Gr
c8jXBwf+IO2xpRZ90QGXb0JcG2RpWeFMZJOVbu/DMqQ53ed9XGIS93J69BZurSaa
5n8tbcc+wd7Voz5HDJZoufROM4VoymBXOzfPJ1mVD2md3B1/u1WcyI/yj4hlZpiW
7J69TkFxHx30kViwGyoz0khIHw+iwxRGaTIr+GRnHQXu+PZZVudPAjelZFTJlw13
S4QlEx2mPfiBIUK5rAKSvism3H4qGBX1JjY8dogKaBYpFaZb7/3/1Ova8VlvHSsc
q4vvwzEYYWyM/g5bYcIkbXWG8pU6+7BLrSEoFW37y7K3/wNQtgrDCQW0tI4JgCU3
VtD/cIfLtPCgFqXLwRBLnj4Q+H4NVQ==
=M9AP
-----END PGP SIGNATURE-----

--SQDsPrkrnDdOueww--


