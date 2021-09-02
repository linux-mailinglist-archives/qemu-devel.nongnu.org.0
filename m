Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DBC3FEDC2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:28:01 +0200 (CEST)
Received: from localhost ([::1]:38830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLlp2-00049e-PR
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mLlaC-0007ez-K1
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:12:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mLlaA-0001MV-Mu
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630584756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fTKXPOHoYkyUBpvYLRtGI9uPUWr5pPhbSjijQdCyOpM=;
 b=S5KQ9SHknAO08c+o1tU/G/s3UfHiDDdAxxiSXBO7ssEZnwQ8taVq7nnuLP9wi23umYYmZH
 Xy4q4pQutzadLF+8cXcZbb1hhanZAzlSj/tnv+975E8TW1QqD9tEn4D+62Sk/vMkvPEdmh
 htjIXKQ5OD6Cvp5rRfaEDfq/Le5D1zQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-gjDYcTlPPHSdWoCuKSIduw-1; Thu, 02 Sep 2021 08:12:35 -0400
X-MC-Unique: gjDYcTlPPHSdWoCuKSIduw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80EAE8C4AF0
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 12:12:34 +0000 (UTC)
Received: from localhost (unknown [10.39.194.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D3872C00F;
 Thu,  2 Sep 2021 12:12:34 +0000 (UTC)
Date: Thu, 2 Sep 2021 13:12:33 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 3/3] hw/virtio: Have virtqueue_get_avail_bytes() pass
 caches arg to callees
Message-ID: <YTC/savtIjlbzFsO@stefanha-x1.localdomain>
References: <20210826172658.2116840-1-philmd@redhat.com>
 <20210826172658.2116840-4-philmd@redhat.com>
 <20210901155538.vbtxakrtbjwon3pt@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210901155538.vbtxakrtbjwon3pt@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TPc4ejr5/2KXUgaZ"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--TPc4ejr5/2KXUgaZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 05:55:38PM +0200, Stefano Garzarella wrote:
> On Thu, Aug 26, 2021 at 07:26:58PM +0200, Philippe Mathieu-Daud=E9 wrote:
> > Both virtqueue_packed_get_avail_bytes() and
> > virtqueue_split_get_avail_bytes() access the region cache, but
> > their caller also does. Simplify by having virtqueue_get_avail_bytes
> > calling both with RCU lock held, and passing the caches as argument.
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > ---
> > RFC because I'm not sure this is safe enough
>=20
> It seems safe to me.
>=20
> While reviewing I saw that vring_get_region_caches() has
> /* Called within rcu_read_lock().  */ comment, but it seems to me that we
> call that function in places where we haven't acquired it, which shouldn'=
t
> be a problem, but should we remove that comment?

Do you have specific examples? That sounds worrying because the caller
can't do much with the returned pointer if it was fetched outside the
RCU read lock.

Stefan

--TPc4ejr5/2KXUgaZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEwv7EACgkQnKSrs4Gr
c8hfcQf+OZptFBAxAK60zr1OjmwaqY2X7OHUjvV09MdWPQ5/CC442IzDONkqX5Bk
2dcxGhjHIhlveben1lsGw65fEQTmFtlhy4ipUmVDvUvoIs2K7RyDWUBGYhuVhUbH
Q0LbzzXU49gyFjpKsUrtu6F5s1FeRPnnLmWU6HexhX/EUnGv0prwsJwETQX6UQPO
pgdD8zlYYRkamRyISgCN2KiE1YykeVnjYZNYnbrDqrZ9FYw0sugZPgCmV6JjoopH
v4+eQCs/OhQJrV5MSzZrB7QZAOzXpftvtCySXZGW6HhtTy21s2yRc8hsGv5gA1Q3
o6lWQOvK3wdmNEy5qrjDxwS4xKG4LQ==
=2BUu
-----END PGP SIGNATURE-----

--TPc4ejr5/2KXUgaZ--


