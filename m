Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5573C4899
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 09:36:05 +0200 (CEST)
Received: from localhost ([::1]:52300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFZB6-0007Id-Lb
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 03:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58654)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1iFZ9q-0006c8-7y
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 03:34:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1iFZ9o-0007za-Vk
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 03:34:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36252)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>)
 id 1iFZ9g-0007wf-BS; Wed, 02 Oct 2019 03:34:37 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 285363D94D;
 Wed,  2 Oct 2019 07:34:35 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.43.2.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEA8810018FF;
 Wed,  2 Oct 2019 07:34:30 +0000 (UTC)
Date: Wed, 2 Oct 2019 09:34:28 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: bitmap migration bug with -drive while block mirror runs
Message-ID: <20191002073428.GB6129@angien.pipo.sk>
References: <315cff78-dcdb-a3ce-2742-da3cc9f0ca97@redhat.com>
 <d897c755-40e7-6392-23e3-c06b1a371f28@virtuozzo.com>
 <6dd4e735-47e7-45d1-98e9-2131746d470c@redhat.com>
 <dfc26b72-4795-09f8-9c50-07d4eabd971a@virtuozzo.com>
 <ef32215d-35e2-14dd-1b43-26f09a88f2dc@redhat.com>
 <e809204f-48f3-b4c0-0b6f-1e3d59c34640@virtuozzo.com>
 <00f03849-18a0-bf34-b83a-98580c58826f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <00f03849-18a0-bf34-b83a-98580c58826f@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 02 Oct 2019 07:34:35 +0000 (UTC)
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
 John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 01, 2019 at 17:26:13 +0200, Max Reitz wrote:
> On 01.10.19 16:53, Vladimir Sementsov-Ogievskiy wrote:
> > 01.10.2019 17:34, Max Reitz wrote:
> >> On 01.10.19 16:27, Vladimir Sementsov-Ogievskiy wrote:
> >>> 01.10.2019 17:13, Max Reitz wrote:
> >>>> On 01.10.19 16:00, Vladimir Sementsov-Ogievskiy wrote:
> >>>>> 01.10.2019 3:09, John Snow wrote:

[...]

> Well, I=E2=80=99d think it should be on the one with the same node name, =
but it
> appears others don=E2=80=99t want a node-name-based mapping, so maybe I s=
hould
> just stop trying to be part of the discussion. :-)
>=20
> > Still, if you don't like skipping explicit filters, I'm OK with implici=
t only, it will
> > fix the bug we are saying about.
> >=20
> > But why you don't like creating some additional explicit filters on tar=
get (prior to
> > migration process) which we didn't have on source?
>=20
> Because I feel like (without having too much insight into migration, I
> admit) that migration is generally a process where you move from one VM
> to another, but both should have the same configuration.  If you want to

During migrations you might want to change backends of the devices
though. (E.g. reconfigure disk paths) or network connections so that the
VM works on the different host.

In addition some bits of migration are not symmetrical. In libvirt we
use a blockdev/drive-mirror to copy over disks if you request migration
with non-shared storage. The destination runs an NBD server and the
source runs the blockjob to copy it over. There can't be symmetry in
this case.

> change the configuration, you do that before or after the migration.
> (I=E2=80=99d think.)



