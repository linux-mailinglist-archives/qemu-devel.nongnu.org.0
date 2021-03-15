Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72F533B00C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:35:34 +0100 (CET)
Received: from localhost ([::1]:41686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkZR-0006SK-W1
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLkYT-00061f-D6
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:34:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLkYR-0004rD-DQ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615804470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=431mRLYrZnormo7qxu5CSX4dgFN7UsFM69dUP7Ig7cc=;
 b=P366qI9SMgIUB3tt7KtwNjq3e4DUImebKI50ipqiP4i//AC4H8j6PrTIoEHY3xsP8B7Gxp
 r4KAfC/OaqPmySgjBloQTpNA5pBHASFVJbXzzzG5QhJcqtwYnur+p+nvihmcpYxEkIDqnc
 Jbb2zc48UpjvF9tZAkDMjaMe1SxaMMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-CPWYurMwNfeAYcNcycAdlQ-1; Mon, 15 Mar 2021 06:34:27 -0400
X-MC-Unique: CPWYurMwNfeAYcNcycAdlQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5E65107ACCA;
 Mon, 15 Mar 2021 10:34:26 +0000 (UTC)
Received: from localhost (ovpn-115-125.ams2.redhat.com [10.36.115.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8245319D7C;
 Mon, 15 Mar 2021 10:34:17 +0000 (UTC)
Date: Mon, 15 Mar 2021 10:34:16 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 1/7] vhost-user: Drop misleading EAGAIN checks in
 slave_read()
Message-ID: <YE84KNmp83FLmT36@stefanha-x1.localdomain>
References: <20210312092212.782255-1-groug@kaod.org>
 <20210312092212.782255-2-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210312092212.782255-2-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h7ASQcmT1/dJBGxR"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--h7ASQcmT1/dJBGxR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 10:22:06AM +0100, Greg Kurz wrote:
> slave_read() checks EAGAIN when reading or writing to the socket
> fails. This gives the impression that the slave channel is in
> non-blocking mode, which is certainly not the case with the current
> code base. And the rest of the code isn't actually ready to cope
> with non-blocking I/O.
>=20
> Just drop the checks everywhere in this function for the sake of
> clarity.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/virtio/vhost-user.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--h7ASQcmT1/dJBGxR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBPOCgACgkQnKSrs4Gr
c8jKGwf+ItwXJlgnHNQ6Ge+37OeUgwiUHr3roZ8idwRXNqxYil7KpCOXcu/8cHvP
t3YW7Hb7LgPCg6IYNcgMr2bIZSS/znBuMnthbnmnBkpfPYVXvuWTXFJRufa3z61g
kyoQ3DJn2nB+lWFt3MZgYSBAq134wSg01AeLAARAF0NQ0mcfT1sZYlsqRChRJU/S
lBSbzSv2RGUCagd0q8kfaz5AZOvTY8RCxWCAaPCkEPKG6WGOv5WKhZSGAyXbiWAd
1wE4JbCq4AC7QNORBiEgDaz0GRT5zxxJDj3uw3+sTZF5xFoWTrhu2N8EYz/yLLjd
E6nOvYzG82cC/Pe9GBsPnDlXQyYm5A==
=OjTR
-----END PGP SIGNATURE-----

--h7ASQcmT1/dJBGxR--


