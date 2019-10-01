Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD61C358E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 15:26:20 +0200 (CEST)
Received: from localhost ([::1]:42078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFIAV-0007T4-8o
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 09:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56096)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1iFI96-00069K-Nd
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 09:24:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1iFI95-0007Ij-I4
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 09:24:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37404)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>)
 id 1iFI91-0007DR-7K; Tue, 01 Oct 2019 09:24:47 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 11A2B3084025;
 Tue,  1 Oct 2019 13:24:45 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.43.2.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E439E6012C;
 Tue,  1 Oct 2019 13:24:43 +0000 (UTC)
Date: Tue, 1 Oct 2019 15:24:41 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: bitmap migration bug with -drive while block mirror runs
Message-ID: <20191001132441.GB9210@angien.pipo.sk>
References: <315cff78-dcdb-a3ce-2742-da3cc9f0ca97@redhat.com>
 <f84745dc-68df-c10a-a91b-a28498e54870@virtuozzo.com>
 <20191001095416.GC4688@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191001095416.GC4688@linux.fritz.box>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 01 Oct 2019 13:24:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 01, 2019 at 11:54:16 +0200, Kevin Wolf wrote:
> Am 01.10.2019 um 10:57 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > 01.10.2019 3:09, John Snow wrote:
> > > Hi folks, I identified a problem with the migration code that Red Hat=
 QE
> > > found and thought you'd like to see it:
> > >=20
> > > https://bugzilla.redhat.com/show_bug.cgi?id=3D1652424#c20
> > >=20
> > > Very, very briefly: drive-mirror inserts a filter node that changes w=
hat
> > > bdrv_get_device_or_node_name() returns, which causes a migration prob=
lem.
> > >=20
> > >=20
> > > Ignorant question #1: Can we multi-parent the filter node and
> > > source-node? It looks like at the moment both consider their only par=
ent
> > > to be the block-job and don't have a link back to their parents other=
wise.
> > >=20
> > >=20
> > > Otherwise: I have a lot of cloudy ideas on how to solve this, but
> > > ultimately what we want is to be able to find the "addressable" name =
for
> > > the node the bitmap is attached to, which would be the name of the fi=
rst
> > > ancestor node that isn't a filter. (OR, the name of the block-backend
> > > above that node.)
> >=20
> >=20
> > Better would be to migrate by node-name only.. But am I right that
> > node-names are different on source and destination? Or this situation
> > changed?
>=20
> Traditionally, I think migration assumes that frontends (guest devices)
> must match exactly, but backends may and usually will differ.
>=20
> Of course, dirty bitmaps are a backend feature that isn't really related
> to guest devices, so this doesn't really work out any more in your case.
> BlockBackend names are unusable for this purpose (especially as we're
> moving towards anonymous BlockBackends everywhere), which I guess
> essentially means node-name is the only option left.
>=20
> Is bitmap migration something that must be enabled explicitly or does
> it happen automatically? If it's explicit, then making an additional
> requirement (matching node-names) shouldn't be a problem.

I think a far better and more reasonable solution is to provide a map on
migration which would match the node names explicitly. If they have to
be the same it moves node names together with the frontend options as
guest ABI.

This means that changing the disk backend on migration will become very
painful.

