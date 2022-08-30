Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E571B5A6E66
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 22:22:17 +0200 (CEST)
Received: from localhost ([::1]:40756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT7kW-0005cm-Ew
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 16:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oT7f7-0002sg-IQ
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 16:16:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oT7f3-0004IR-3P
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 16:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661890591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JBve28ZhvjzE5igwY/wwIZYry+4KMJhxSmZ+5jphH8I=;
 b=gu5XmKrHep4I0fQoQregKQgO4aG2gyIKrDYj98pNcNORDnIUQwbeq/eIQSNYFLtnn3lZfJ
 qTApOqXXd7VLL66kFTaSEVtcJIQTSf3ZISgAuoZKff/rjsdpkb1acyvP0ugWTF97ELXgYZ
 9+X6D3u1rq+vlcjsBpxggVoraekSyGA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-OVjL_rbnMoWMEL3U56xYNw-1; Tue, 30 Aug 2022 16:16:28 -0400
X-MC-Unique: OVjL_rbnMoWMEL3U56xYNw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1EF81C06EDD;
 Tue, 30 Aug 2022 20:16:27 +0000 (UTC)
Received: from localhost (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D4C2492C3B;
 Tue, 30 Aug 2022 20:16:26 +0000 (UTC)
Date: Tue, 30 Aug 2022 16:16:24 -0400
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
Message-ID: <Yw5wGEhdsztxhV2s@fedora>
References: <20220822222402.176088-1-stefanha@redhat.com>
 <20220822222402.176088-12-stefanha@redhat.com>
 <b068f95e-fc8f-1ecc-5bf5-d7774ce6c13a@redhat.com>
 <YwUo5UgdHjJ7k9QX@fedora>
 <9f6d41c6-6d67-611b-a8b6-2a1a93242ff4@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qUKTmzNfBTo69cyH"
Content-Disposition: inline
In-Reply-To: <9f6d41c6-6d67-611b-a8b6-2a1a93242ff4@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--qUKTmzNfBTo69cyH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2022 at 09:43:16AM +0200, David Hildenbrand wrote:
> On 23.08.22 21:22, Stefan Hajnoczi wrote:
> > On Tue, Aug 23, 2022 at 10:01:59AM +0200, David Hildenbrand wrote:
> >> On 23.08.22 00:24, Stefan Hajnoczi wrote:
> >>> Register guest RAM using BlockRAMRegistrar and set the
> >>> BDRV_REQ_REGISTERED_BUF flag so block drivers can optimize memory
> >>> accesses in I/O requests.
> >>>
> >>> This is for vdpa-blk, vhost-user-blk, and other I/O interfaces that r=
ely
> >>> on DMA mapping/unmapping.
> >>
> >> Can you explain why we're monitoring RAMRegistrar to hook into "guest
> >> RAM" and not go the usual path of the MemoryListener?
> >=20
> > The requirements are similar to VFIO, which uses RAMBlockNotifier. We
>=20
> Only VFIO NVME uses RAMBlockNotifier. Ordinary VFIO uses the MemoryListen=
er.
>=20
> Maybe the difference is that ordinary VFIO has to replicate the actual
> guest physical memory layout, and VFIO NVME is only interested in
> possible guest RAM inside guest physical memory.
>=20
> > need to learn about all guest RAM because that's where I/O buffers are
> > located.
> >=20
> > Do you think RAMBlockNotifier should be avoided?
>=20
> I assume it depends on the use case. For saying "this might be used for
> I/O" it might be good enough I guess.
>=20
> >=20
> >> What will BDRV_REQ_REGISTERED_BUF actually do? Pin all guest memory in
> >> the worst case such as io_uring fixed buffers would do ( I hope not ).
> >=20
> > BLK_REQ_REGISTERED_BUF is a hint that no bounce buffer is necessary
> > because the I/O buffer is located in memory that was previously
> > registered with bdrv_registered_buf().
> >=20
> > The RAMBlockNotifier calls bdrv_register_buf() to let the libblkio
> > driver know about RAM. Some libblkio drivers ignore this hint, io_uring
> > may use the fixed buffers feature, vhost-user sends the shared memory
> > file descriptors to the vhost device server, and VFIO/vhost may pin
> > pages.
> >=20
> > So the blkio block driver doesn't add anything new, it's the union of
> > VFIO/vhost/vhost-user/etc memory requirements.
>=20
> The issue is if that backend pins memory inside any of these regions.
> Then, you're instantly incompatible to anything the relies on sparse
> RAMBlocks, such as memory ballooning or virtio-mem, and have to properly
> fence it.
>=20
> In that case, you'd have to successfully trigger
> ram_block_discard_disable(true) first, before pinning. Who would do that
> now conditionally, just like e.g., VFIO does?
>=20
> io_uring fixed buffers would be one such example that pins memory and is
> problematic. vfio (unless on s390x) is another example, as you point out.

Okay, I think libblkio needs to expose a bool property called
"mem-regions-pinned" so QEMU whether or not the registered buffers will
be pinned.

Then the QEMU BlockDriver can do:

  if (mem_regions_pinned) {
      if (ram_block_discard_disable(true) < 0) {
          ...fail to open block device...
      }
  }

Does that sound right?

Is "pinned" the best word to describe this or is there a more general
characteristic we are looking for?

>=20
> This has to be treated with care. Another thing to consider is that
> different backends might only support a limited number of such regions.
> I assume there is a way for QEMU to query this limit upfront? It might
> be required for memory hot(un)plug to figure out how many memory slots
> we actually have (for ordinary DIMMs, and if we ever want to make this
> compatible to virtio-mem, it might be required as well when the backend
> pins memory).

Yes, libblkio reports the maximum number of blkio_mem_regions supported
by the device. The property is called "max-mem-regions".

The QEMU BlockDriver currently doesn't use this information. Are there
any QEMU APIs that should be called to propagate this value?

Stefan

--qUKTmzNfBTo69cyH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMOcBgACgkQnKSrs4Gr
c8hO7Qf8C+Fox1MAjmvcWp4eVyW29STdyYkIo/l8ZTW/JllKXJ4Htn7ZsbfHLXnT
bZT/4TMrZKW4jpl9g6SC+eWtADItKU5L0qnuZgWj+julzoRHPOVGp6YrgDYWyzyt
lJNZrCIGu8wZKdoRyoMr3+u4ewnsibYFVlVyAIrKTSr1MURi70qx704kRIsUCg9d
TqPIG34Pgs4W4KQ0Z/bNQjfZBZkYOj9aO2XIKDswVIGSpt1bzsRwHqBZkyHZLWtn
cLN+Da6njnu6Sa+Eldkmzewp07fxPnLaPX9t1yUfjqOTDHaQeVTTp8DmmlscS20+
lzFqyInnZD91m3wDXM18E4mYSOGTTw==
=2kw7
-----END PGP SIGNATURE-----

--qUKTmzNfBTo69cyH--


