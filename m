Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9F159EC2B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 21:24:02 +0200 (CEST)
Received: from localhost ([::1]:53886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQZVJ-00044n-Im
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 15:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQZTl-0002MA-1z
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 15:22:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQZTi-0003e5-2V
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 15:22:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661282541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bw+24lw+iXagqw+VyfiS+t6tODkvsufMoHByfnPKVb0=;
 b=JndGkQngf/PEjcZ2Xbu9VWrAHTzzBsMb2whQRhIcWCFMmUAJoALHZTLJzGEK9WH/25dE7y
 PYJV+XyDBgJMpnygLjS0OHnwNXcDZ4dgCc2/765IhyLQMTzJRKj6Zwd1+R23BwptMuHUwZ
 9pN1VS+Suo8hGBmewVV+xbnpUu0ZKD8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-SBs_YzD3PHG70hv9dXg6BQ-1; Tue, 23 Aug 2022 15:22:16 -0400
X-MC-Unique: SBs_YzD3PHG70hv9dXg6BQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEA698037B7;
 Tue, 23 Aug 2022 19:22:15 +0000 (UTC)
Received: from localhost (unknown [10.39.192.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB42E492C3B;
 Tue, 23 Aug 2022 19:22:14 +0000 (UTC)
Date: Tue, 23 Aug 2022 15:22:13 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Peter Xu <peterx@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, integration@gluster.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, sgarzare@redhat.com,
 Alberto Faria <afaria@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Xie Changlong <xiechanglong.d@gmail.com>
Subject: Re: [RFC v4 11/11] virtio-blk: use BDRV_REQ_REGISTERED_BUF
 optimization hint
Message-ID: <YwUo5UgdHjJ7k9QX@fedora>
References: <20220822222402.176088-1-stefanha@redhat.com>
 <20220822222402.176088-12-stefanha@redhat.com>
 <b068f95e-fc8f-1ecc-5bf5-d7774ce6c13a@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l+k831t+cdY/T5Se"
Content-Disposition: inline
In-Reply-To: <b068f95e-fc8f-1ecc-5bf5-d7774ce6c13a@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--l+k831t+cdY/T5Se
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2022 at 10:01:59AM +0200, David Hildenbrand wrote:
> On 23.08.22 00:24, Stefan Hajnoczi wrote:
> > Register guest RAM using BlockRAMRegistrar and set the
> > BDRV_REQ_REGISTERED_BUF flag so block drivers can optimize memory
> > accesses in I/O requests.
> >=20
> > This is for vdpa-blk, vhost-user-blk, and other I/O interfaces that rely
> > on DMA mapping/unmapping.
>=20
> Can you explain why we're monitoring RAMRegistrar to hook into "guest
> RAM" and not go the usual path of the MemoryListener?

The requirements are similar to VFIO, which uses RAMBlockNotifier. We
need to learn about all guest RAM because that's where I/O buffers are
located.

Do you think RAMBlockNotifier should be avoided?

> What will BDRV_REQ_REGISTERED_BUF actually do? Pin all guest memory in
> the worst case such as io_uring fixed buffers would do ( I hope not ).

BLK_REQ_REGISTERED_BUF is a hint that no bounce buffer is necessary
because the I/O buffer is located in memory that was previously
registered with bdrv_registered_buf().

The RAMBlockNotifier calls bdrv_register_buf() to let the libblkio
driver know about RAM. Some libblkio drivers ignore this hint, io_uring
may use the fixed buffers feature, vhost-user sends the shared memory
file descriptors to the vhost device server, and VFIO/vhost may pin
pages.

So the blkio block driver doesn't add anything new, it's the union of
VFIO/vhost/vhost-user/etc memory requirements.

Stefan

--l+k831t+cdY/T5Se
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMFKOQACgkQnKSrs4Gr
c8hRxggAwRW3vECTU8Y9vWe7yb/5ciHppn/tzU+gi5tnNfvR/IpA7xSTvKvaAh4U
ULcV3G6lwEalJxLob3QfN3jAcTQ2m23O6OPYaEs+v90yCRQfsZmm+H+6gaCVLwUg
k6+BN/WQaux6E+60L86z97YR1RSd40xaCqZBWQ4sgRwbs3WJj3toRx8DCzeO5lMh
c+YRoK6lBja02vYgQHByArZIiDeLBIZy29m7ez6i+cphoQUetec62Z2im4btnp6j
M/U2Jp1IWMkLoFS8VVXpqoDWHHV0M8RhUihia1CVkKgTKYrBrQ4ghxLd3pedhMvp
31HXAxRCZx2je24+FOK42BgbGJ32Rw==
=w9hq
-----END PGP SIGNATURE-----

--l+k831t+cdY/T5Se--


