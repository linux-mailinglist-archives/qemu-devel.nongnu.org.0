Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F3C6186AF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:56:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqeQF-0005n2-LL; Thu, 03 Nov 2022 13:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqeQD-0005mu-69
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqeQ8-0007X5-Hz
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667498067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BIYhnrymg0i5cJbfVyBMjdnY2tyW/OMk4jj2QVF4IRs=;
 b=g0+fyeW2g+xPCKd+2M8pJkPIi3Wf4knxuKdueAibpnvSqxNvIWfe3vmc575CTPsCGD4CxH
 IK1HARLl7kGTmPGAvF1YVqqA7DCS/HlyG3C1SKSxfc+vlKyZD8jivV5fViMVpT5JtFlruN
 OB6yHMosxZghlHKM6bgIBbHhtnOBkwA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-1QM9j_ulNSedr-qhFBK3HA-1; Thu, 03 Nov 2022 13:54:25 -0400
X-MC-Unique: 1QM9j_ulNSedr-qhFBK3HA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8553B800B30;
 Thu,  3 Nov 2022 17:54:25 +0000 (UTC)
Received: from localhost (unknown [10.39.194.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06635207B344;
 Thu,  3 Nov 2022 17:54:24 +0000 (UTC)
Date: Thu, 3 Nov 2022 13:54:22 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, hreitz@redhat.com,
 qemu-block@nongnu.org, nsoffer@redhat.com
Subject: Re: [PATCH 1/2] file-posix: fix Linux alignment probing when EIO is
 returned
Message-ID: <Y2QATtwdJ6eVo+yQ@fedora>
References: <20221101190031.6766-1-stefanha@redhat.com>
 <20221101190031.6766-2-stefanha@redhat.com>
 <Y2HVgnwAPdTIaZR6@sol.localdomain>
 <Y2HasGvN6qMFq29A@sol.localdomain> <Y2OPaxoX7UanUzTd@redhat.com>
 <Y2PrpOCjKsZ+rywG@gmail.com> <Y2PyMb4UluN6+ONg@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QYyOAtU4IPQe8Fc+"
Content-Disposition: inline
In-Reply-To: <Y2PyMb4UluN6+ONg@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--QYyOAtU4IPQe8Fc+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2022 at 04:54:09PM +0000, Eric Biggers wrote:
> On Thu, Nov 03, 2022 at 04:26:14PM +0000, Eric Biggers wrote:
> > > In other words, STATX_DIOALIGN is unusable from the start because we
> > > don't know whether the information it returns is actually correct? :-/
> >=20
> > That's a silly point of view.  STATX_DIOALIGN has only been in a releas=
ed kernel
> > for a few weeks (v6.0), the bug is only in one edge case, and it will g=
et fixed
> > quickly and backported to v6.0.y where users of 6.0 will get it.
>=20
> Actually, scratch that.  STATX_DIOALIGN is in 6.1, not 6.0.  So it hasn't=
 even
> been released yet.  Upstream is currently on v6.1-rc3.
>=20
> So thank you for reporting (or for not reporting?) this.  We'll make sure=
 it
> gets fixed before release :-)

That's great. Thanks!

Stefan

--QYyOAtU4IPQe8Fc+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNkAE4ACgkQnKSrs4Gr
c8hS9ggApzsIfVgVMrbTw+E83CrGaTDzmYzP0p0NQPdpXgzOa8lRkrJb1WvZ+UY7
ptZl0mjLQKrxWracqRTrQwSw/wcPn6W5go3MZmNbaRHTa/Kw/FDn7BfCbMTP6DYK
bC0KxWFs4wPojSvoC6UC3fWKeUiduTbbRaZvuGQMfwmQ+g0x+A+wZZZMtdjZZPfO
11ItKWzd4qUw6xAQLeDmphn6zazv7XRgLPgb3epymAumEXomaPHEaW+Fjkc8WuYj
TLFZQbtD0RQuxhzsnZ2DUA8I1abnbfZaIzHO+MFjJtlv7bqmND8it7P+7CVBg/Zr
wSyJD/CsVIC9+Ma0fVrWJPdRp1XE5Q==
=4GfU
-----END PGP SIGNATURE-----

--QYyOAtU4IPQe8Fc+--


