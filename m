Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1282D10E1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 13:50:08 +0100 (CET)
Received: from localhost ([::1]:50002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmFxv-0006Qm-MR
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 07:50:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmEr9-0000BR-FO
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:39:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmEqv-0008Db-OO
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607341128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bDSi1/r+GVTdHg2c0U63i/yNEWheqrf7cA3MgQBhNxw=;
 b=VIdBlFN9PcyekjSI5Cz0ta8wZAHWhPcJOteSxICJVNryIPMffDyRbmg9pRjfi6YOVar3K4
 f+C8j8l/lph1CmbF2i0vHcatSge71PkOp/NturPprDFauuuX9UYOPm9fs8itHosQrIMR5d
 rYMVZH7kB6k/vjnr3nervYYssBkrn9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-a28nZYE4OSiPnVUV7wUSYQ-1; Mon, 07 Dec 2020 06:38:46 -0500
X-MC-Unique: a28nZYE4OSiPnVUV7wUSYQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 838D8107ACE3;
 Mon,  7 Dec 2020 11:38:45 +0000 (UTC)
Received: from localhost (ovpn-114-128.ams2.redhat.com [10.36.114.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02C4E10016FA;
 Mon,  7 Dec 2020 11:38:41 +0000 (UTC)
Date: Mon, 7 Dec 2020 11:38:40 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-5.2 08/10] block/export: port virtio-blk
 discard/write zeroes input validation
Message-ID: <20201207113840.GF203660@stefanha-x1.localdomain>
References: <20201111124331.1393747-1-stefanha@redhat.com>
 <20201111124331.1393747-9-stefanha@redhat.com>
 <0446562a-c3bf-cff4-82e2-71b9ae2cf3bf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0446562a-c3bf-cff4-82e2-71b9ae2cf3bf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2020 at 04:25:39PM +0100, Max Reitz wrote:
> On 11.11.20 13:43, Stefan Hajnoczi wrote:
> > @@ -58,30 +60,101 @@ static void vu_blk_req_complete(VuBlkReq *req)
> >       free(req);
> >   }
> > +static bool vu_blk_sect_range_ok(VuBlkExport *vexp, uint64_t sector,
> > +                                 size_t size)
> > +{
> > +    uint64_t nb_sectors =3D size >> BDRV_SECTOR_BITS;
> > +    uint64_t total_sectors;
> > +
> > +    if (nb_sectors > BDRV_REQUEST_MAX_SECTORS) {
>=20
> I wonder why you pass a byte length, then shift it down to sectors, when
> it=E2=80=99s kind of unsafe on the caller=E2=80=99s side to even calculat=
e that byte length
> (because the caller has to verify that shifting the sector count up to be=
 a
> byte length is safe).
>=20
> Wouldn=E2=80=99t it be simpler to pass nb_sectors (perhaps even as uint64=
_t, because
> why not) and then compare that against BDRV_REQUEST_MAX_BYTES here?
>=20
> (With how the code is written, it also has the problem of rounding down
> @size.  Which isn=E2=80=99t a problem in practice because the caller effe=
ctively
> guarantees that @size is aligned to sectors, but it still means that the
> code looks a bit strange.  As in, =E2=80=9CWhy is it safe to round down? =
 Ah,
> because the caller always produces an aligned value.  But why does the
> caller even pass a byte count, then?  Especially given that the offset is
> passed as a sector index, too.=E2=80=9D)

Thanks for the suggestions, I'll take a look for the next revision.

> > +        return false;
> > +    }
> > +    if ((sector << BDRV_SECTOR_BITS) % vexp->blk_size) {
>=20
> This made me wonder why the discard/write-zeroes sector granularity would=
 be
> BDRV_SECTOR_BITS and not blk_size, which is used for IN/OUT (read/write)
> requests.
>=20
> I still don=E2=80=99t know, but judging from the only reference I could f=
ind quickly
> (contrib/vhost-user-blk/vhost-user-blk.c), it seems correct.
>=20
> OTOH, I wonder whether BDRV_SECTOR_BITS/BDRV_SECTOR_SIZE are the correct
> constants.  Isn=E2=80=99t it just 9/512 as per some specification, i.e., =
shouldn=E2=80=99t
> it be independent of qemu=E2=80=99s block layer=E2=80=99s sector size?

Yes, a new VIRTIO_BLK_SECTOR_SIZE constant would be clearer. According
to the VIRTIO 1.1 specification:

  blk_size can be read to determine the optimal sector size for the
  driver to use. This does not affect the units used in the protocol
  (always 512 bytes), but awareness of the correct value can affect
  performance.

So all virtio-blk sector fields are in 512-byte units, regardless of the
blk_size config field.

Stefan

--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/OFEAACgkQnKSrs4Gr
c8hFbwgAiuCZSDoEDipkNBKjS2TlwoEBB19DidBLksB0AKr5CQsp9J5mDVcwO//7
7v5g5RQVHc2mPtvlyKs0jszPTInLp/09Oq6fDuhGM2C9EXNeGwrvCMKRLr6Nm+1Y
Dkic8ebCwoJZ44RyISU0wJzMQgRD2u6PRQQeICT00Q1QjbnWcWKtjnPZZy30CfSE
bcYk9tYay6WsBWHXEffWeUHFiSPego7AryziOWqe36NfADvAWQuEwWgHhavLRKeC
70kcCtYI6qav8ke3COt/r+gTD1a1IOQ6dqIbsBjdp672+c7WiHAQlP6rZ5NgRPOf
hgwM70sacBAQyiSrx1sVIV04WCg/gw==
=DORh
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--


