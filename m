Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E736429D5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 16:48:45 +0200 (CEST)
Received: from localhost ([::1]:32894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hb4YN-0007hU-So
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 10:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53660)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hb4Tu-0006e2-Vz
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 10:44:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hb4Tt-0004JB-F3
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 10:44:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49286)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1hb4Tn-00046d-Ap; Wed, 12 Jun 2019 10:43:59 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5EAAB30860A6;
 Wed, 12 Jun 2019 14:43:51 +0000 (UTC)
Received: from localhost (unknown [10.36.118.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E2DA60BF1;
 Wed, 12 Jun 2019 14:43:46 +0000 (UTC)
Date: Wed, 12 Jun 2019 15:43:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Fam Zheng <fam@euphon.net>
Message-ID: <20190612144340.GF19156@stefanha-x1.localdomain>
References: <20190610134905.22294-1-mehta.aaru20@gmail.com>
 <20190610134905.22294-5-mehta.aaru20@gmail.com>
 <20190611111714.wshlk6fddh34atfp@debian>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9ADF8FXzFeE7X4jE"
Content-Disposition: inline
In-Reply-To: <20190611111714.wshlk6fddh34atfp@debian>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 12 Jun 2019 14:43:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 04/12] block/io_uring: implements
 interfaces for io_uring
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
Cc: Kevin Wolf <kwolf@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 saket.sinha89@gmail.com, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Julia Suvorova <jusual@mail.ru>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9ADF8FXzFeE7X4jE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 07:17:14PM +0800, Fam Zheng wrote:
> On Mon, 06/10 19:18, Aarushi Mehta wrote:
> > +        /* Prevent infinite loop if submission is refused */
> > +        if (ret <=3D 0) {
> > +            if (ret =3D=3D -EAGAIN) {
> > +                continue;
> > +            }
> > +            break;
> > +        }
> > +        s->io_q.in_flight +=3D ret;
> > +        s->io_q.in_queue  -=3D ret;
> > +    }
> > +    s->io_q.blocked =3D (s->io_q.in_queue > 0);
>=20
> I'm confused about s->io_q.blocked. ioq_submit is where it gets updated, =
but
> if it becomes true, calling ioq_submit will be fenced. So how does it get
> cleared?

When blocked, additional I/O requests are not submitted until the next
completion.  See qemu_luring_process_completions_and_submit() for the
code path where ioq_submit() gets called again.

Stefan

--9ADF8FXzFeE7X4jE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0BD5wACgkQnKSrs4Gr
c8gGfgf/buzOhb/HLEA21dK4NmmRkG7Zg6MZpCQ0AbzBfSnJNJdjo+it/mdr/1zK
soJcpua7YweXG2/Fzm0WLj0cTfX8GmTeVg7a0MR2TmtE5fm8g+2DyD0yrqfvbj6v
YPxtO3K1NCzEeujMbx6H3slqamCnSo1z2pztvaI+/TU5mkp1VSL9rsnlvsX6Q+lP
w314fTD78sEDrxurKqhWJ/5esFs+5AyP0qVUK8CThxNrsIaKnnZSzcX1xYbia3LS
LmvOnOOIktJ2SQvjjfzE0z5w8TdXPETqJeICmqJcpJa1u3FuYYbXbY8/Gw23HWm/
5Vj9eqaQYbjA6tqiJ3vh57f+eZJ57w==
=lXPW
-----END PGP SIGNATURE-----

--9ADF8FXzFeE7X4jE--

