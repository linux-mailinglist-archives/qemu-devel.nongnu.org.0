Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E052310BFC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 19:28:41 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37456 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLt24-0007fJ-3j
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 13:28:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1hLt0f-0006xa-8o
	for qemu-devel@nongnu.org; Wed, 01 May 2019 13:27:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1hLt0d-0002an-2P
	for qemu-devel@nongnu.org; Wed, 01 May 2019 13:27:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34806)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1hLt0c-0002Wx-RA
	for qemu-devel@nongnu.org; Wed, 01 May 2019 13:27:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 725BE3082E6E;
	Wed,  1 May 2019 17:27:04 +0000 (UTC)
Received: from localhost (ovpn-116-250.ams2.redhat.com [10.36.116.250])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7311B86CCF;
	Wed,  1 May 2019 17:27:01 +0000 (UTC)
Date: Wed, 1 May 2019 13:26:59 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20190501172659.GE22391@stefanha-x1.localdomain>
References: <20190426003652.32633-1-richardw.yang@linux.intel.com>
	<20190426003652.32633-2-richardw.yang@linux.intel.com>
	<20190430204636.GK28722@habkost.net>
	<20190430223618.lyl3ribm7gg5haa5@master>
	<20190430224816.GL28722@habkost.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BQPnanjtCNWHyqYD"
Content-Disposition: inline
In-Reply-To: <20190430224816.GL28722@habkost.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Wed, 01 May 2019 17:27:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v15 1/2] util/mmap-alloc: support MAP_SYNC
 in qemu_ram_mmap()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pagupta@redhat.com, xiaoguangrong.eric@gmail.com, mst@redhat.com,
	qemu-devel@nongnu.org, Wei Yang <richard.weiyang@gmail.com>,
	yi.z.zhang@linux.intel.com, yu.c.zhang@linux.intel.com,
	Wei Yang <richardw.yang@linux.intel.com>,
	Haozhong Zhang <haozhong.zhang@intel.com>, pbonzini@redhat.com,
	imammedo@redhat.com, dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BQPnanjtCNWHyqYD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2019 at 07:48:16PM -0300, Eduardo Habkost wrote:
> On Tue, Apr 30, 2019 at 10:36:18PM +0000, Wei Yang wrote:
> [...]
> > >> +#ifdef CONFIG_LINUX
> > >> +#include <linux/mman.h>
> > >> +#endif /* CONFIG_LINUX */
> > >> +
> > >> +#ifndef MAP_SYNC
> > >> +#define MAP_SYNC 0
> > >> +#endif
> > >> +#ifndef MAP_SHARED_VALIDATE
> > >> +#define MAP_SHARED_VALIDATE 0
> > >> +#endif
> > >
> > >Why would we need this, if we added copies of mman.h to
> > >linux-headers?
> >=20
> > This is reported by Stefan.
> >=20
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg612168.html
>=20
> Stefan, did you hit a build failure, or it was just theoretical?
>=20
> linux-headers/*/mman.h is updated by "linux-headers: add
> linux/mman.h" (commit 8cf108c5d159).  If the build really fails,
> something else is broken in our build system.

I wasn't aware that QEMU ships its own mman.h.  In that case we don't
need the ifndef for Linux hosts.

Stefan

--BQPnanjtCNWHyqYD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAlzJ1uMACgkQnKSrs4Gr
c8inSAf/WhaIeEahwaL6UO28vaCGvJxB8ix7z+8ivtkB8hLbnoWuo1S9m5TeIdbQ
ZCafLUbYkOCe+py/uEAPylkHViiayR7xIdbzLzrS+wEFHaUdkhC9OTmHJhVS0tM7
dq2pF5Ocg2s1F9zAZvEAhgZANpDhCoRsuSubljv95DunQXKsXhOdwdfvZKdKdYVA
qDvqJ2u7PKk10ksqnmyt14PrReNu5Ss4hKhRz6oPoahyePTYUTkqg7qpWbHU6rka
BqMymPRk6thMvUNifEucVE/VjhxKjZCzuNv/ocbN9LtrAMz0PToK+lpQpzp58YTL
Xs+8b01P8D0pCA/rT6ZY9J70ScB74A==
=0fNg
-----END PGP SIGNATURE-----

--BQPnanjtCNWHyqYD--

