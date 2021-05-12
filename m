Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2FE37C036
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:32:53 +0200 (CEST)
Received: from localhost ([::1]:57722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgpuu-0002cl-Po
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgpnX-00019U-Nt
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:25:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgpnU-00015G-Rj
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620829511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BOX1HmFA5lpUJhLC7cPmulUnAg+eO2wHpLSpOJ7KaB4=;
 b=NP+5AGiNi3zEYwcm+Bkw6NvfqyaTmtMvqQ5sGRleE1GnQ7dz+lXB1z0v7Pj3HaFfjJRELh
 CZAi4rA2F2uX4xBy7jrWh8ZZ8clI4LykPQ176UI2sGgtJUPTOkLV/MotiTezwt6Kc7QE67
 vx/N8Rfa00tJa9fjbLIWxMus//X2BZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-OpJwscYyNWmyNTQQqX6ixA-1; Wed, 12 May 2021 10:25:09 -0400
X-MC-Unique: OpJwscYyNWmyNTQQqX6ixA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72EF01856A76;
 Wed, 12 May 2021 14:24:58 +0000 (UTC)
Received: from localhost (ovpn-115-51.ams2.redhat.com [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4967D108463C;
 Wed, 12 May 2021 14:24:57 +0000 (UTC)
Date: Wed, 12 May 2021 15:24:56 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 0/6] block-copy: make helper APIs thread safe
Message-ID: <YJvlOPPwrCnV0hOg@stefanha-x1.localdomain>
References: <20210510085941.22769-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210510085941.22769-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="K0gpM6Ks7kECf9d0"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--K0gpM6Ks7kECf9d0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 10:59:35AM +0200, Emanuele Giuseppe Esposito wrote:
> This serie of patches bring thread safety to the smaller APIs used by
> block-copy, namely ratelimit, progressmeter, co-shared-resource
> and aiotask.
> The end goal is to reduce the usage of the global
> AioContexlock in block-copy, by introducing smaller granularity
> locks thus on making the block layer thread safe.=20

I'm not sure "global" is accurate. Block jobs can deal with arbitrary
AioContexts, not just a global AioContext. The lock is per-AioContext
rather than global. Or did I miss something?

--K0gpM6Ks7kECf9d0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCb5TcACgkQnKSrs4Gr
c8gOtAgAhx+rGrKpIDE97GRuwNj//jlum6x0jXnGztBqgxr6URTWqAdgm5TE5OnA
DUmv2XD3GgZXMGshk117wT8TrhXjEZSgmnnnFW1Pjk5NSIeqUyyHD+tvkhEj/j4n
hYw6XlYIXL0TP91Z2kDF4I/WIkfnqGt2nletfmXvgdbUb3Qe0XhiJEONuUA7SHxj
6PWo5+GalQ1u/HljCdiFiRl1vL208F5IXgU+LTLYjthyTouq5Li3Ns7bPv2v5QNe
GBzCVY8aF1s9Iey4SPGWxcw/CO2em8sNm82Pu/hceC8BILlWhrFJY/rNPeoQvvtD
4XT2mpShTykqyu3r3QOs9kIkMeKzVQ==
=TvDb
-----END PGP SIGNATURE-----

--K0gpM6Ks7kECf9d0--


