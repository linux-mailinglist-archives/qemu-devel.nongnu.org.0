Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770C3377F1A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 11:10:44 +0200 (CEST)
Received: from localhost ([::1]:41656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg1w3-0001iH-JL
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 05:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lg1ug-0000Ok-LA
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:09:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lg1ue-0002bZ-VX
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620637755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9RLblfeNB3/VvCDISVJkOzelE9P97Yj+fsE4u4gIon8=;
 b=I4eYj/FdhdfcWfM+WzsDT9irH3RLdIdF7dQdFDUGvGX8iZ/oHPc1h0TkVffn9Mo6PxRLEa
 3p6e1mgybLE72+uuzGmjQsQsoq3qFMSOW7GAn/ih4G7GLVC/J+YowYt26XEiLyCIVHSk3s
 RFBZthTIAy7XMrCeXyg7tG57zMvStlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-e5mw5tYGNteNzsnhGuLgPQ-1; Mon, 10 May 2021 05:09:11 -0400
X-MC-Unique: e5mw5tYGNteNzsnhGuLgPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 542F3195D561;
 Mon, 10 May 2021 09:09:10 +0000 (UTC)
Received: from localhost (ovpn-115-117.ams2.redhat.com [10.36.115.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B068119C45;
 Mon, 10 May 2021 09:09:03 +0000 (UTC)
Date: Mon, 10 May 2021 10:09:02 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 06/23] hw/block/dataplane/virtio-blk: Avoid dynamic stack
 allocation
Message-ID: <YJj4LhLoNJAS5fvj@stefanha-x1.localdomain>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-7-philmd@redhat.com>
 <YJOuesiuqgQugO+Q@stefanha-x1.localdomain>
 <124ddeb2-ca4a-c551-19ad-d1125451226f@redhat.com>
 <YJQBd+lnvQnbK0XH@stefanha-x1.localdomain>
 <5356dd0d-c60a-5b37-46d9-1ddef039a8ab@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5356dd0d-c60a-5b37-46d9-1ddef039a8ab@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Yh9YuvNtMxAvjAqG"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Yh9YuvNtMxAvjAqG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 05:19:31PM +0200, Philippe Mathieu-Daud=E9 wrote:
> > Can we eliminate bitmap[] entirely by using bitops.h APIs on
> > s->batch_notify_vqs instead?
>=20
> You meant the bitmap.h API I assume, OK, better idea!

I did mean include/qemu/bitops.h. Not sure I see a suitable bitmap.h API
but in any case bitmap.h includes bitops.h :-).

Stefan

--Yh9YuvNtMxAvjAqG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCY+C4ACgkQnKSrs4Gr
c8gJQAgAybBaFX9DemvF53a1IA7SYohqcIel9xgkJ1oJbjYS3ZQ4MrXN9tbKc3fm
AqAE6MhAffsAf2H6xOBEqlFdZQj2lWk8GIS5HY2ff+zI4ZVGAQh+xsjC5jcHXy7k
YOEnQDdhVMbzVKoHILkR6zok9o0Ix65z1NQBDqnIfBtyPTpES/NILSPf5WNtgGRW
0eHJVdnbC3Tcsol3s4IzJ2qzmHsC4rtp9Q5E92hRbhs5xJHMKiyhvdDuFdGKtIQV
n/bma+1mHvlxPyvgk7PKy7/2plSTLAppex/0upYhDC9hyhXGR9D2xkhxJClUbr9p
GxBfTBET8/ufHB1wWCrpb4MZskmIUw==
=PffJ
-----END PGP SIGNATURE-----

--Yh9YuvNtMxAvjAqG--


