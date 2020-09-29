Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45F127D352
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 18:08:33 +0200 (CEST)
Received: from localhost ([::1]:44956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNIB6-0005gj-Ji
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 12:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kNI2y-0007mr-Lk
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 12:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kNI2w-0006e5-QP
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 12:00:08 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601395205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N8hr4pAyQSdAWYa5vOUugmVSNFm/4X3EnoakMPUfEwk=;
 b=TuMBubklgojpCkQNnp9+9Yc+mMLVjh+0oQ+z6sbxIISflNDcILpE/PX8xmCLeb8nPH+Lu/
 Ns5gxDbPSslpyqb1LPUl3DeRrp3vHBZ0KEVe56ybOochLcnqTI2D54za46kajj9AMwqQN6
 nh/zM4anME6sKRhThMu5NjWomgSeDl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-giww8qCvMwih6J64--_0WA-1; Tue, 29 Sep 2020 12:00:00 -0400
X-MC-Unique: giww8qCvMwih6J64--_0WA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72A2210A7AE3;
 Tue, 29 Sep 2020 15:59:59 +0000 (UTC)
Received: from localhost (ovpn-113-13.ams2.redhat.com [10.36.113.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1E305C1C4;
 Tue, 29 Sep 2020 15:59:52 +0000 (UTC)
Date: Tue, 29 Sep 2020 16:59:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/2] util/vfio-helpers: Rework the IOVA allocator to
 avoid IOVA reserved regions
Message-ID: <20200929155951.GB191675@stefanha-x1.localdomain>
References: <20200929085550.30926-1-eric.auger@redhat.com>
 <20200929085550.30926-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200929085550.30926-3-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 22:47:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, lvivier@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, kwolf@redhat.com, philmd@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2020 at 10:55:50AM +0200, Eric Auger wrote:
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index ba0ee6e21c..71145970f3 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -667,6 +667,50 @@ static bool qemu_vfio_verify_mappings(QEMUVFIOState =
*s)
>      return true;
>  }
> =20
> +static int
> +qemu_vfio_find_fixed_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < s->nb_iova_ranges; i++) {
> +        if (s->usable_iova_ranges[i].end < s->low_water_mark) {
> +            continue;
> +        }
> +        s->low_water_mark =3D
> +            MAX(s->low_water_mark, s->usable_iova_ranges[i].start);
> +
> +        if (s->usable_iova_ranges[i].end - s->low_water_mark + 1 >=3D si=
ze ||
> +            s->usable_iova_ranges[i].end - s->low_water_mark + 1 =3D=3D =
0) {

I don't understand the =3D=3D 0 case. It seems like we are allocating an
IOVA beyond usable_iova_ranges[i].end?

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9zWfcACgkQnKSrs4Gr
c8hnOggAiZISmIVXIB1CYgD5ryEilvJO/zzOZENq24WN75MQjgrxXyhoe0pnk5S2
ONN3znYQn36KG5t8nG5a+JLouOWZsrLteUXg8AvCfN6kv/YkiOzJzP4GZ5X3NYvn
12QzAVvlbxNFvOz7ySxahJvQe2FCyfVRG8D/GeZofzGnKgphivsyaAT3bfS5hZqQ
w5L2ugRZSS6+jTPJ+hLO7eV8BZcUyeaQHEYnignBrmmR3CG1btAYeL++ksIbAdSv
Gv1uW53u35oXSOU3bjxfHdox9smRKrc6SHdOctI7dsYkKwJFGdtfbPiK4QOkEEjP
MC4/NapG3vSWUVZWh+nE8U+vbYXn0g==
=qPxM
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--


