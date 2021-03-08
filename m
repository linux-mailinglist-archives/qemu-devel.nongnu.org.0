Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2983F3313EA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:58:27 +0100 (CET)
Received: from localhost ([::1]:55562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJD8-0004VW-65
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJJ7O-0001UL-Fp
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:52:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJJ7J-0006zk-PZ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hao6Y8vgnIh+cK9ry3iSR5bK54jck3obiDyserLZJCI=;
 b=H1LBdc6t6rj7T/LWjOVVF341GkBP6DbyaBbcJ1QNErn/FznSHLo2vd/keaJ9YZaEv9QqFh
 vnXl/4Mn8IT51DoYi+/R4nreCpHcKULV0CAAhyAefbnNi5sSVn14XBWzyhTFgf+hvPpbV4
 jVNLw9lMqNlksECQtoNPnc7xKGgUdB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-b3aIgPhyP4yQtc9xmjqChA-1; Mon, 08 Mar 2021 11:52:20 -0500
X-MC-Unique: b3aIgPhyP4yQtc9xmjqChA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E43DA760C1;
 Mon,  8 Mar 2021 16:52:18 +0000 (UTC)
Received: from localhost (ovpn-114-104.ams2.redhat.com [10.36.114.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89EE510023B2;
 Mon,  8 Mar 2021 16:52:15 +0000 (UTC)
Date: Mon, 8 Mar 2021 16:52:09 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v4] virtio-blk: Respect discard granularity
Message-ID: <YEZWOeXbkuA6Fd+i@stefanha-x1.localdomain>
References: <20210224101747.hmgou6z7qzmk62ft@steredhat>
 <20210225001239.47046-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210225001239.47046-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uny76NbuMYiw2V+P"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--uny76NbuMYiw2V+P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 09:12:39AM +0900, Akihiko Odaki wrote:
> Report the configured granularity for discard operation to the
> guest. If this is not set use the block size.
>=20
> Since until now we have ignored the configured discard granularity
> and always reported the block size, let's add
> 'report-discard-granularity' property and disable it for older
> machine types to avoid migration issues.
>=20
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  hw/block/virtio-blk.c          | 8 +++++++-
>  hw/core/machine.c              | 4 +++-
>  include/hw/virtio/virtio-blk.h | 1 +
>  3 files changed, 11 insertions(+), 2 deletions(-)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--uny76NbuMYiw2V+P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBGVjkACgkQnKSrs4Gr
c8jxjggAo2aqIJtjOzo0TDGrnxFGth+QCPtirNWpDHYjW09SrD3xNhfdS/BLdsoI
SXgrG6dSp3AbEs9A1TigPeM48AM4n+RHNt3yNdAOr6jK4tn8oXDc3SvJt+WtMfOE
o46eL5sTvKVJ820ZhPh4ancfgZuXCockzfVpYLxbG6loWwDMBu3w6/peUTEFXHDY
CV68KLpMZdeMvBtrAEm+karsTDI0b7lneNvBOfCJ+E44F3VNNgCeiP+wU6vZL+KY
zehxisA8QGxPcvQsz+tdb2q37lgQ/3/5reFTw4O8lxY2s3LzrEuF0Oh5AqEI2mno
UdZ3Gjv1oEiSIVBSjCj93ybSKsLENw==
=JM8W
-----END PGP SIGNATURE-----

--uny76NbuMYiw2V+P--


