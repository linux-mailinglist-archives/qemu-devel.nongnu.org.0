Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9878833112D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:47:27 +0100 (CET)
Received: from localhost ([::1]:37264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHAL-0007g1-3H
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJH2l-0001M0-Oy
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:39:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJH2h-0005MM-Ql
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615214370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lgp2xrEAm7FfjuZLTET0IjaykQd9y3S7XbeLO8Z4Iks=;
 b=CR4nKo54TurnaYTyVZpif7k3gyv30YcdCcgz5tAnPRxPYVrVZydbkyRhwgML2BiWdP3Nr0
 iD+frsKdmPRzPYW6lSl0FItWs48slAIfUXRMNbWln3AaBUdmJqlZsP0IzSnXlSmxCzP0Gu
 YbdBXhACHeqIX4Kiaj+CEzfGrFKlbWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-9FKHJ4vNMsaUro8ZQA1jNg-1; Mon, 08 Mar 2021 09:39:28 -0500
X-MC-Unique: 9FKHJ4vNMsaUro8ZQA1jNg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08B6681DF8D;
 Mon,  8 Mar 2021 14:39:27 +0000 (UTC)
Received: from localhost (ovpn-114-104.ams2.redhat.com [10.36.114.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AF3B5C8AD;
 Mon,  8 Mar 2021 14:39:21 +0000 (UTC)
Date: Mon, 8 Mar 2021 14:39:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] virtio-net: calculating proper msix vectors on init
Message-ID: <YEY3D/DysDwK7Kbe@stefanha-x1.localdomain>
References: <20210308053059.28753-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210308053059.28753-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BEqYS0AVIv+f5Wrq"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--BEqYS0AVIv+f5Wrq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2021 at 01:30:59PM +0800, Jason Wang wrote:
> Currently, the default msix vectors for virtio-net-pci is 3 which is
> obvious not suitable for multiqueue guest, so we depends on the user
> or management tools to pass a correct vectors parameter. In fact, we
> can simplifying this by calculating the number of vectors on realize.
>=20
> Consider we have N queues, the number of vectors needed is 2*N + 2
> (#queue pais + plus one config interrupt and control vq). We didn't

Maybe this can be squashed in but it's not important:
s/pais/pairs/

> check whether or not host support control vq because it was added
> unconditionally by qemu to avoid breaking legacy guests such as Minix.
>=20
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/core/machine.c          | 1 +
>  hw/virtio/virtio-net-pci.c | 8 +++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--BEqYS0AVIv+f5Wrq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBGNw8ACgkQnKSrs4Gr
c8jrOAgAihw/4ySaOevYo37HJHZgtaaw0MI/yjZFm+yIGaeo9IzS1/vYDpoKyE8C
+5rpGwvEw8AlHVMkMakh/UcxA1PKX0zxd71GX1oBQSUU31sibhTegZzQMadCrN3i
pzbLttZpJaYSM7C61TAGbb31kdBKXVTAZQ0Sy1atH0Ra2xnC11792ofYbaqqb6D+
AkOxu1X3ja4ce3Zgqi0rurA9YG4PaJ0R3+zWDEVZaB+QZlzW/iM6eckw9093tSNx
f2xd6Aq9GuDukg7NEbuTsCrkQ9RwhCr/K7clYwXcMryhX47sVP9QN6K7I9zsZhsu
DbMpVVKBuYG1L+HTj4XgBWqZ+PR0eA==
=oidj
-----END PGP SIGNATURE-----

--BEqYS0AVIv+f5Wrq--


