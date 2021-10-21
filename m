Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F0843663B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:28:22 +0200 (CEST)
Received: from localhost ([::1]:38758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZzR-0001q5-L8
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZrS-0006LE-1H
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:20:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZrO-0004Lo-T3
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634829602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V/lw3v7pf1DRVoOGeWLjZgxHKYHhsbkJL52oq7D4D2E=;
 b=i9KvKMmgpXSMukpAvAnVP5DkKlYflV0KqvYjijMIzDlhxUOX2lN9As/oIBi+fOmpeMfB37
 eCnu28vaP4vl4C4wkOMSX3ZccpO8fF1Ois29ia276sWq4vY2akHqkrAmwGTgT1Vd/xgtLp
 OK9qRH1faPtCJZ792kHg0x0bZJqyovM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-4KTQfyrmO3Sl5ynZM7cpiw-1; Thu, 21 Oct 2021 11:20:00 -0400
X-MC-Unique: 4KTQfyrmO3Sl5ynZM7cpiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25D7B79EE0;
 Thu, 21 Oct 2021 15:19:59 +0000 (UTC)
Received: from localhost (unknown [10.39.195.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBAC77944B;
 Thu, 21 Oct 2021 15:19:49 +0000 (UTC)
Date: Thu, 21 Oct 2021 16:19:48 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 2/3] linux-aio: add `dev_max_batch` parameter to
 laio_co_submit()
Message-ID: <YXGFFHII1soD6eB+@stefanha-x1.localdomain>
References: <20210923143100.182979-1-sgarzare@redhat.com>
 <20210923143100.182979-3-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210923143100.182979-3-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NDx1GYLgomhW8eBZ"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--NDx1GYLgomhW8eBZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 23, 2021 at 04:30:59PM +0200, Stefano Garzarella wrote:
> This new parameter can be used by block devices to limit the
> Linux AIO batch size more than the limit set by the AIO context.
>=20
> file-posix backend supports this, passing its `aio-max-batch` option
> previously added.
>=20
> Add an helper function to calculate the maximum batch size.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  include/block/raw-aio.h |  3 ++-
>  block/file-posix.c      |  3 ++-
>  block/linux-aio.c       | 30 ++++++++++++++++++++++--------
>  3 files changed, 26 insertions(+), 10 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--NDx1GYLgomhW8eBZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFxhRQACgkQnKSrs4Gr
c8ifggf+P1rDv/+Q4xQFHrd7NHvtXgWqH+hgo15l4iBfIFZCTjopI+egWvhrpnQg
zs6eIK9dN7suRnwPrIpkygXCvqFivALPZAwe9akr1aedzDPlAZ5xhbF0JGvlqo5k
7Pm27AZsScfu3M2AZrcXaQ1Fwig+bP0S/yYqF1gRGyN+XvuXRtAEZRZC0ZsZYIKA
NEUxXOgNWFpjRpEu4TyCUFCfBUOdpFfTzYXK5BVpO89Jcri+k0fsUziLgFQ4IKW1
ONdlznLTtogD8o1nZX8NBGgxrLRcjxXR4BI3QeKEJPit/VyP9c+hBWKWP21Pek+5
XTX1q6UjaEKfE5nnfQqi32bx1JWdMQ==
=/t1M
-----END PGP SIGNATURE-----

--NDx1GYLgomhW8eBZ--


