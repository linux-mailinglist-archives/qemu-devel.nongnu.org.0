Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5F24253A5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:06:02 +0200 (CEST)
Received: from localhost ([::1]:47538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYT61-0007pm-Bo
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYT2E-0005Ax-K2
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:02:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYT29-0005Vl-EF
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633611720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wSd8S+h+jpO3RXTtkw1wsX7xi9C1WDCN8TmeM3aRb/c=;
 b=FvgI0eF3lIGm9grNhDLgnEM8+JHGgp8hhpHBzXqK9ViGeBsgmzYkViZKfc36SSzE1mMw7s
 kPv8g3726k6Esd9F4z0PxXHfl1q2I5jmYJjsql8J2frgMbCY4kQwkPsrftoppmRqP2wFN6
 JxiB6LHpxnObdABy1V+QH3m+wWJJyq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-AlCydyENMk2pUrEPssUtuw-1; Thu, 07 Oct 2021 09:01:57 -0400
X-MC-Unique: AlCydyENMk2pUrEPssUtuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9634835DE2;
 Thu,  7 Oct 2021 13:01:55 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 014AE5F4FD;
 Thu,  7 Oct 2021 13:01:52 +0000 (UTC)
Date: Thu, 7 Oct 2021 14:01:52 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v2 04/25] include/block/block: split header into I/O
 and global state API
Message-ID: <YV7vwBNSWTQGXOB6@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-5-eesposit@redhat.com>
 <YV7db8LeJfp0v775@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YV7db8LeJfp0v775@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XM15PMy4DNX7Owol"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--XM15PMy4DNX7Owol
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 07, 2021 at 12:43:43PM +0100, Daniel P. Berrang=E9 wrote:
> On Tue, Oct 05, 2021 at 10:31:54AM -0400, Emanuele Giuseppe Esposito wrot=
e:
> > Similarly to the previous patch, split block.h
> > in block-io.h and block-global-state.h
> >=20
> > block-common.h contains the structures shared between
> > the two headers, and the functions that can't be categorized as
> > I/O or global state.
>=20
> This is nice from a code organization POV, but it doesn't do all
> that much from a code reviewer / author POV as I doubt anyone
> will remember which header file the respective APIs/structures/
> constants are in, without having to look it up each time.
>=20
> It would make life easier if we had distinct namning conventions
> for APIs/struct/contsants in the respective headers.
>=20
> eg instead of  "bdrv_" have "bdrv_state_" and "bdrv_io_" as
> the two naming conventions for -global-state.h and -io.h
> respectively, nad only use the bare 'bdrv_' for -common.h
>=20
> Yes, this would be major code churn, but I think it'd make
> the code clearer to understand which will be a win over the
> long term.
>=20
> NB, I'm not suggesting doing a rename as part of this patch
> though. Any rename would have to be separate, and likely
> split over many patches to make it manageable.

Yes. Taking it one step further, BlockDriverState could be split into
two struct so that I/O code doesn't even have access to the struct
needed to invoke GS APIs. This is a type-safe way of enforcing the API
split.

Unfortunately that's a lot of code churn and I think the separation is
not very clean. For example, block drivers need to forward requests to
their children, so they need to traverse the graph (which we think of as
global state).

Stefan

--XM15PMy4DNX7Owol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFe78AACgkQnKSrs4Gr
c8hYiAgAr1gvi2nhl1oSr1FEBJbUYDDEzAsOe4jpqsVh2JKPMbHwzOah3tJQddyA
+nS0w5koumTAnt5qwaKJ/jn+UXOq9oW45UNGP7+YBBUCTdmhxb6sqFGt49QYgHDE
+6qw1DoYKHYJe7XhPelpxGouGzr5dY/YCFQVCJKCt0OEInrPoRUm6D8SfSS8a9lX
HUF+Vh+uH+8imbQnYGXLTh8nMmZzn23UnWeu1WDn0xUdXXVcW3oKpA37c6SATldC
NgaYNWxRtT10b+GvC3rSLAhMbMqM2B8jslHOwmFWb62olOK1gcEsYzMT8gblQs9Q
52yY9RVOm+kpfKNRY8D2R1eRWce8Lw==
=iqew
-----END PGP SIGNATURE-----

--XM15PMy4DNX7Owol--


