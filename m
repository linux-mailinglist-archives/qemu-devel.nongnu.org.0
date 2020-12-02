Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA7E2CC06E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:12:22 +0100 (CET)
Received: from localhost ([::1]:60196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkTnp-00063v-6G
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkTlX-0004ek-AF
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:09:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkTlR-0001Si-5o
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606921792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gxhGs7DBJFaktlSE7zTYN69rRHZJNrCgw0VNQqMvgJw=;
 b=IMpHPyOSd6dc9Vdq7XJPnap/n0dD0jbjtMEtwPOBAtW7JGPlBSw1JFnqcdkhZtrVH2YLQl
 fFOIn/msT2iYgcPceR4LjoaI+kg9gpNCk0HWBrVHb8gZYmJOM3eodEjRweJkfbC19TjqUb
 Rm9fAgMvruz2pnauRnF3IWshsM/s8SU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-46ATAlN2OVyyal7FRWiABg-1; Wed, 02 Dec 2020 10:09:50 -0500
X-MC-Unique: 46ATAlN2OVyyal7FRWiABg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2B131005E56;
 Wed,  2 Dec 2020 15:09:47 +0000 (UTC)
Received: from localhost (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42EA019C47;
 Wed,  2 Dec 2020 15:09:41 +0000 (UTC)
Date: Wed, 2 Dec 2020 15:09:39 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 0/4] vhost-user: avoid g_return_val_if() in
 get/set_config()
Message-ID: <20201202150939.GO655829@stefanha-x1.localdomain>
References: <20201118091644.199527-1-stefanha@redhat.com>
 <CAJ+F1CK3Ap38E8343j1keFoX4UEPXR7FgALf7LRvwMSpKywefQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CK3Ap38E8343j1keFoX4UEPXR7FgALf7LRvwMSpKywefQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lCFQJunhLz1tFGpX"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--lCFQJunhLz1tFGpX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 07:21:15PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Wed, Nov 18, 2020 at 1:17 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
>=20
> > Markus Armbruster pointed out that g_return_val_if() is meant for
> > programming
> > errors. It must not be used for input validation since it can be compil=
ed
> > out.
> > Use explicit if statements instead.
> >
> > This patch series converts vhost-user device backends that use
> > g_return_val_if() in get/set_config().
> >
> > Stefan Hajnoczi (4):
> >   contrib/vhost-user-blk: avoid g_return_val_if() input validation
> >   contrib/vhost-user-gpu: avoid g_return_val_if() input validation
> >   contrib/vhost-user-input: avoid g_return_val_if() input validation
> >   block/export: avoid g_return_val_if() input validation
> >
> >
> The condition is the same for all the patches, checking the message confi=
g
> payload is large enough. Afaict, the value is set by the client, so it
> could be a runtime error, and thus explicit checking is required.
>=20
> Nevertheless, one nice thing about g_return* macros, is that it provides =
an
> error message when the condition fails, which helps. Could you replace it=
?
>=20
> (fwiw, I think g_return* macros are so convenient, I would simply make
> G_DISABLE_CHECKS forbidden and call it a day)

I'll add an error message in v2.

Stefan

--lCFQJunhLz1tFGpX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/HrjMACgkQnKSrs4Gr
c8is5wf/X4qwdndCatti7wK/HknUtS5bnWszRCko1w5m8ebTHCddhZa3qhE+Gbpl
JPu+MZDF3cLbn3nXWG7G0S1xzmFvz0EXwYsCGNI/PqPrS+SUEpmTuIsiPTCui79W
ieyUlvePXPA4LeqG6GAgPT8kNUoKQ4TciQkRvhFMjRI/Lxp7Z+1XElLphcg1XVm/
1NSPjBvTahD4Q8T+GkiLhh/g0p2l9nTiWReiDQfw5SVl2VCNhXX4NCxCDZNbuud4
G+J2wVRFTQlWg1sTY7HoFty9ZGUmv6P9UJ37xyCJAblHIY2qRlHP55hNksS/YZ8E
lXFQvLy6D5WtEkS32CTNxJ0nIx5s2w==
=31Ba
-----END PGP SIGNATURE-----

--lCFQJunhLz1tFGpX--


