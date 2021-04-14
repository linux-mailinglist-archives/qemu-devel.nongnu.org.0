Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AC635F18E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 12:38:49 +0200 (CEST)
Received: from localhost ([::1]:49184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWcv2-0008VT-H0
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 06:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWcu0-00081r-KC
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:37:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWcty-0001hA-8Q
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618396661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NdXE9016PJZ12pE5RwR/P74HAzYo7mxgA92aT5bJKrs=;
 b=fsXi2jj67cNOyO5nUlGKP/LteF/Br87LyJ3tjiP979WhA5MNJfPytQzKZqPSUsYw7MfmB/
 4AgPmpo99O9vEL2Z5ayhrKdFdDMzJRxH5JPvH87P2yO4ofApV4anM/YDVKSjIO/EPsGEMD
 ZaNCHz2sXIpqQqUElWfqNTxcbLBTVN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-YHU88rpSO0-7mdUfQR7o3A-1; Wed, 14 Apr 2021 06:37:38 -0400
X-MC-Unique: YHU88rpSO0-7mdUfQR7o3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AD051B18BC5;
 Wed, 14 Apr 2021 10:37:37 +0000 (UTC)
Received: from localhost (ovpn-114-209.ams2.redhat.com [10.36.114.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AEB11A86A;
 Wed, 14 Apr 2021 10:37:32 +0000 (UTC)
Date: Wed, 14 Apr 2021 11:37:30 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2] vhost-user-blk: Fail gracefully on too large queue size
Message-ID: <YHbF6mGt0ornEI47@stefanha-x1.localdomain>
References: <20210413165654.50810-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210413165654.50810-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cWuF0Qtp6HhL44Qc"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: raphael.norwitz@nutanix.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--cWuF0Qtp6HhL44Qc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 06:56:54PM +0200, Kevin Wolf wrote:
> virtio_add_queue() aborts when queue_size > VIRTQUEUE_MAX_SIZE, so
> vhost_user_blk_device_realize() should check this before calling it.
>=20
> Simple reproducer:
>=20
> qemu-system-x86_64 \
>     -chardev null,id=3Dfoo \
>     -device vhost-user-blk-pci,queue-size=3D4096,chardev=3Dfoo
>=20
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1935014
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  hw/block/vhost-user-blk.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--cWuF0Qtp6HhL44Qc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB2xeoACgkQnKSrs4Gr
c8g2NwgArp1Rny9PskPTDQzYYuntr6UwBlUgjvUHQeKmBD6UMY6C6am860QTW7QK
VHXtC69ssiKhrbGv+q9WQotizBu/tfq7Px9L44yaj2KmMeWucgEj63B8tbJC55gg
7HKpELWy3e2aE9z09x44pHCcdaFBKcdWlbKy3s9TjwhbtwHxkIO/QQYYhA/NcdYo
KnKD9qfiLQ2sRPb105vpbyv7dgJ4WbT3SMEfyjrxzB0/zpcsoTHoa1WFNaxpMOUa
ESnjxFgb4INI6sPVp8E3Qzxtm29VJYDNZIAOC94HfTCDSzemP+5G4FVeu9V/cWPZ
/b3YHidXXkDEphffI/XJ5vYmrt5Dew==
=MGaW
-----END PGP SIGNATURE-----

--cWuF0Qtp6HhL44Qc--


