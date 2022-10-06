Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA14C5F6D8C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 20:32:29 +0200 (CEST)
Received: from localhost ([::1]:47794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogVfX-0002rX-UJ
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 14:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogVAZ-00059v-5W
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:00:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogVAW-0006SP-Pa
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:00:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665079223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7bbnaIdd4yx7d+MDCwSSFFKchMFEdLkqalWafTSVwbg=;
 b=gWCh8ugEQ/1ACzivgJycC41uK6OuUdRaILHbLPdIsqW+Qa287CVGGOtcFtPTPzol5MqFzu
 M9GYjSkKl/YipiSqTPgIHJ1b18iJssEDMScwdIMJdH4Q18wIIiNbRiWOgnps7xn6+AqdJU
 I2m6ixBQzeE+0erT077tlLVS5xFWSgQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-5In9SqCxMFquWU5FAh6mcw-1; Thu, 06 Oct 2022 14:00:19 -0400
X-MC-Unique: 5In9SqCxMFquWU5FAh6mcw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFB6B3C025CA;
 Thu,  6 Oct 2022 18:00:18 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92F8A145888E;
 Thu,  6 Oct 2022 18:00:17 +0000 (UTC)
Date: Thu, 6 Oct 2022 14:00:15 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Campinho Faria <afaria@redhat.com>
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
Message-ID: <Yz8Xr81Dw8M9rj3c@fedora>
References: <20220927193431.22302-1-stefanha@redhat.com>
 <20220927193431.22302-12-stefanha@redhat.com>
 <YzSex5t0UIAT+LPU@fedora>
 <CAELaAXyURC9YJvtjY3O5iXsA5Q0WCTxM21++iqJ__pna9CSNOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ps8be3DsCuESDjvJ"
Content-Disposition: inline
In-Reply-To: <CAELaAXyURC9YJvtjY3O5iXsA5Q0WCTxM21++iqJ__pna9CSNOQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--Ps8be3DsCuESDjvJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2022 at 09:12:36PM +0100, Alberto Campinho Faria wrote:
> On Wed, Sep 28, 2022 at 8:21 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> > On Tue, Sep 27, 2022 at 03:34:30PM -0400, Stefan Hajnoczi wrote:
> > > +    ret =3D blkio_get_bool(s->blkio,
> > > +                         "mem-regions-pinned",
> > > +                         &s->mem_regions_pinned);
> > > +    if (ret < 0) {
> > > +        /* Be conservative (assume pinning) if the property is not s=
upported */
> > > +        s->mem_regions_pinned =3D true;
> >
> > This is too conservative :). It can be changed to:
> >
> >   s->mem_regions_pinned =3D s->needs_mem_regions;
> >
> > That way we avoid ram_block_discard_disable() for libblkio drivers (like
> > io_uring in libblkio 1.0) that don't use memory regions and don't
> > support the "mem-regions-pinned" property yet.
>=20
> Even if a driver doesn't _need_ memory regions to be mapped before
> use, it may still do something special with the ones that _are_
> mapped, so we may have no choice but to set s->mem_regions_pinned =3D
> true.
>=20
> (Unless we are assuming that all future libblkio versions will either
> not have such drivers, or will provide a "mem-regions-pinned"
> property, but that feels brittle.)

s->needs_mem_regions determines if we'll use libblkio memory regions at
all. When it's false we skip blkio_map_mem_region() and therefore it's
safe to set s->mem_regions_pinned to false.

Stefan

--Ps8be3DsCuESDjvJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM/F68ACgkQnKSrs4Gr
c8gRWwf7B+a4Ajr1oCZKuGoGSP+MgZ0C2SHFVwOlEF5ZjcGGkep2UmnraED2pqnR
A8ty5hL7+dJHf7uXaLynxAm+zapV7j9VcTNbRzb4x8HUjTib5HYfSIm93Ypa2UQI
zeVbCoxL6AMtCXDz6NyahXzVnuJcdMijCnTYSBuRNNPcm+14QlwMl1uVVU5vwyg0
l7BxfGMp9Iwxlqy9bCOU41NR91qx5eO7Uy1DTDiGgnSrHfBKmY8P1zTMbUmyZT4Y
Dkh4FTiFrHW/WIWGX+TkcKO719mYlkoYYcSaBLQPeIH74ibaBLCLEjx/rEd9Sosu
VUCdaRCAw8Wj4BMGJdi25fEvpdQkQA==
=tEqP
-----END PGP SIGNATURE-----

--Ps8be3DsCuESDjvJ--


