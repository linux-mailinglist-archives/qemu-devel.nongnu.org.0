Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13318EE26
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 16:28:52 +0200 (CEST)
Received: from localhost ([::1]:42478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyGkF-0000SM-Vb
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 10:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55086)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1hyGjO-0008FK-3l
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 10:28:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hyGjK-0005IG-HG
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 10:27:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51854)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hyGjE-0005G0-UU; Thu, 15 Aug 2019 10:27:49 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EB34E3002069;
 Thu, 15 Aug 2019 14:27:47 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-12.ams2.redhat.com [10.36.117.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCF1F841C7;
 Thu, 15 Aug 2019 14:27:46 +0000 (UTC)
Date: Thu, 15 Aug 2019 16:27:45 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20190815142745.GD7415@linux.fritz.box>
References: <2c685097-1647-e2d3-8b8a-21f76551ce3c@gmail.com>
 <20190815135309.GC10996@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Content-Disposition: inline
In-Reply-To: <20190815135309.GC10996@stefanha-x1.localdomain>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 15 Aug 2019 14:27:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v0] Implement new cache mode "target"
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
Cc: Artemy Kapitula <dalt74@gmail.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 15.08.2019 um 15:53 hat Stefan Hajnoczi geschrieben:
> On Wed, Aug 07, 2019 at 04:09:54PM +0300, Artemy Kapitula wrote:
>=20
> Hi,
> Please use "scripts/get_maintainer.pl -f block.c" to find out which
> maintainers to email.  qemu-devel@nongnu.org is a high-traffic list and
> patches not CCed to the right maintainer may not get quick review.
>=20
> > There is an issue with databases in VM that perform too slow
> > on generic SAN storages. The key point is fdatasync that flushes
> > disk on SCSI target.
> >=20
> > The QEMU blockdev "target" cache mode intended to be used with
> > SAN storages and is a mix of "none" by using direct I/O and
> > "unsafe" that omit device flush.
> >=20
> > Such storages has its own data integrity protection and can
> > be operated with direct I/O without additional fdatasyc().
> >=20
> > With generic SCSI targets like LIO or SCST it boost performance
> > up to 100% on some profiles like database with transaction journal
> > (postrgesql/mssql/oracle etc) or virtualized SDS (ceph/rook inside
> > VMs) which performs block device cache flush on journal record.
>=20
> If the physical storage controller has a Battery Backed Unit (BBU) or
> similar then flush requests are not required with O_DIRECT.  This has
> been a common enterprise storage configuration for many years and is
> already supported in QEMU today:
>=20
> Configure the guest with cache=3Dnone and disable the emulated storage
> controller's write cache (e.g. -device virtio-blk-pci,write-cache=3Doff).
> Inside the guest /sys/block/$BLKDEV/queue/write_cache should show "write
> through".
>=20
> I think this patch is not necessary since write-cache=3Doff already
> exists.  cache=3Dtarget is also slower since the guest sends unnecessary
> flush requests to the emulated storage controller.

Two more comments:

1. The proposed cache mode can already be configured as
   cache.direct=3Don,cache.no-flush=3Don. I don't think we intend to add new
   aliases for combinations of these options. The existing aliases exist
   for compatibility reasons.

2. If fdatasync() takes noticable time on such storage, this is a host
   kernel problem. If we know that there is nothing to be synced, the
   kernel should just return immediately without involving any I/O.

Kevin

--dkEUBIird37B8yKS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJdVWvhAAoJEH8JsnLIjy/WjuMP/AtmPgK58lwRS4AFrlQTiFXN
Gsi9lIhZnAEfkUyENeBoM1TP1TXrUuj8wY8jP5nUNn8C9ZOCQ8Wxu8kgscJaNK6N
MgHfXCgWKr/Bb6XTSaK06utVGF4qSwUl3z0oUT8e31ZX+jvqsOJkmRkuDudf2UJP
Ja8HT/c72k4O8cLmFShnu6hQMf4KZvRqfwjqTzcP4jdwzE1fVRU6xyILVWtn31MM
qqw69Lg6J0nLOosXWC74rymGxg8BIrIOVOXTKqwzf8O248tJ6RhDVnhayEfm4Gm9
jppk88hsOjxuCe8BS/vAsXvLg5gY9ie7Kyuw8jWowdYZoVxd5A3xisYpNEAALPYQ
qFpL9cEqnPPBpKQmXL83nsQSkZ4SC/Pm7YBnsgdpKSbL4XBNdt9YLO11AuhoB9ra
rWAMrbeI9Ljm9In3RyymuoddfLZ77d8BFYv6fLe6yIoVaB9GVLauWO77SN35Cg8w
1Nx6OZl/LlkIvdmX6BUYjj/QGjXlBC/XaFO7Odvfm/P67Gai/aACTzzEv/XNIeVq
cMB3Hnh4le/G/7EMuZB8NrBPRdjxCeoKCbtgoU41rBYOCYdrTcwkeEMlO1Qqepj+
sAxfMKvHW+JtXPxGIjopnZof3R1oCQpr1StOGmOUewAp6y0QIL7GqvF/v+4NjeTI
A2OimqWoIzHwy2Rb0miI
=AjOd
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--

