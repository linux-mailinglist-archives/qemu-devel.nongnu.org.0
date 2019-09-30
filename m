Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0644CC228A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 16:00:00 +0200 (CEST)
Received: from localhost ([::1]:52852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEwDX-00055E-2t
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 09:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49633)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iEwCB-0004BQ-BO
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 09:58:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iEwCA-0006ew-2e
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 09:58:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39374)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1iEwC5-0006dI-Sp; Mon, 30 Sep 2019 09:58:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 12E1F8980E8;
 Mon, 30 Sep 2019 13:58:29 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA26E26199;
 Mon, 30 Sep 2019 13:58:27 +0000 (UTC)
Message-ID: <97bc2bcdd0ba3582d8b937cd0de32e8419a5d104.camel@redhat.com>
Subject: Re: [PATCH 01/18] iotests: Filter refcount_order in 036
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Date: Mon, 30 Sep 2019 16:58:26 +0300
In-Reply-To: <5e39c90a-1e78-6c07-e03b-cef23f566227@redhat.com>
References: <20190927094242.11152-1-mreitz@redhat.com>
 <20190927094242.11152-2-mreitz@redhat.com>
 <f8db846b4dba5cd8febc09e871a932c7999f5403.camel@redhat.com>
 <d10fef7d-502a-d8c9-c548-bb6088d16c69@redhat.com>
 <4b3bea45194528716499d1624cdefa6cd3a56806.camel@redhat.com>
 <5e39c90a-1e78-6c07-e03b-cef23f566227@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Mon, 30 Sep 2019 13:58:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2019-09-30 at 15:44 +0200, Max Reitz wrote:
> On 30.09.19 15:40, Maxim Levitsky wrote:
> > On Mon, 2019-09-30 at 14:43 +0200, Max Reitz wrote:
> > > On 29.09.19 18:31, Maxim Levitsky wrote:
> > > > On Fri, 2019-09-27 at 11:42 +0200, Max Reitz wrote:
> > > > > This test can run just fine with other values for refcount_bits=
, so we
> > > > > should filter the value from qcow2.py's dump-header.
> > > > >=20
> > > > > (036 currently ignores user-specified image options, but that w=
ill be
> > > > > fixed in the next patch.)
> > > > >=20
> > > > > Signed-off-by: Max Reitz <mreitz@redhat.com>
> > > > > ---
> > > > >  tests/qemu-iotests/036     | 9 ++++++---
> > > > >  tests/qemu-iotests/036.out | 6 +++---
> > > > >  2 files changed, 9 insertions(+), 6 deletions(-)
> > > > >=20
> > > > > diff --git a/tests/qemu-iotests/036 b/tests/qemu-iotests/036
> > > > > index f06ff67408..69d0f9f903 100755
> > > > > --- a/tests/qemu-iotests/036
> > > > > +++ b/tests/qemu-iotests/036
> > > > > @@ -55,7 +55,8 @@ $PYTHON qcow2.py "$TEST_IMG" set-feature-bit =
incompatible 63
> > > > > =20
> > > > >  # Without feature table
> > > > >  $PYTHON qcow2.py "$TEST_IMG" del-header-ext 0x6803f857
> > > > > -$PYTHON qcow2.py "$TEST_IMG" dump-header
> > > > > +$PYTHON qcow2.py "$TEST_IMG" dump-header \
> > > > > +    | sed -e 's/^\(refcount_order\s*\).*/\1(filtered)/'
> > > > >  _img_info
> > > > > =20
> > > > >  # With feature table containing bit 63
> > > > > @@ -103,14 +104,16 @@ echo =3D=3D=3D Create image with unknown =
autoclear feature bit =3D=3D=3D
> > > > >  echo
> > > > >  _make_test_img 64M
> > > > >  $PYTHON qcow2.py "$TEST_IMG" set-feature-bit autoclear 63
> > > > > -$PYTHON qcow2.py "$TEST_IMG" dump-header
> > > > > +$PYTHON qcow2.py "$TEST_IMG" dump-header \
> > > > > +    | sed -e 's/^\(refcount_order\s*\).*/\1(filtered)/'
> > > > > =20
> > > > >  echo
> > > > >  echo =3D=3D=3D Repair image =3D=3D=3D
> > > > >  echo
> > > > >  _check_test_img -r all
> > > > > =20
> > > > > -$PYTHON qcow2.py "$TEST_IMG" dump-header
> > > > > +$PYTHON qcow2.py "$TEST_IMG" dump-header \
> > > > > +    | sed -e 's/^\(refcount_order\s*\).*/\1(filtered)/'
> > > > > =20
> > > > >  # success, all done
> > > > >  echo "*** done"
> > > > > diff --git a/tests/qemu-iotests/036.out b/tests/qemu-iotests/03=
6.out
> > > > > index e489b44386..998c2a8a35 100644
> > > > > --- a/tests/qemu-iotests/036.out
> > > > > +++ b/tests/qemu-iotests/036.out
> > > > > @@ -19,7 +19,7 @@ snapshot_offset           0x0
> > > > >  incompatible_features     0x8000000000000000
> > > > >  compatible_features       0x0
> > > > >  autoclear_features        0x0
> > > > > -refcount_order            4
> > > > > +refcount_order            (filtered)
> > > > >  header_length             104
> > > > > =20
> > > > >  qemu-img: Could not open 'TEST_DIR/t.IMGFMT': Unsupported IMGF=
MT feature(s): Unknown incompatible feature: 8000000000000000
> > > > > @@ -53,7 +53,7 @@ snapshot_offset           0x0
> > > > >  incompatible_features     0x0
> > > > >  compatible_features       0x0
> > > > >  autoclear_features        0x8000000000000000
> > > > > -refcount_order            4
> > > > > +refcount_order            (filtered)
> > > > >  header_length             104
> > > > > =20
> > > > >  Header extension:
> > > > > @@ -81,7 +81,7 @@ snapshot_offset           0x0
> > > > >  incompatible_features     0x0
> > > > >  compatible_features       0x0
> > > > >  autoclear_features        0x0
> > > > > -refcount_order            4
> > > > > +refcount_order            (filtered)
> > > > >  header_length             104
> > > > > =20
> > > > >  Header extension:
> > > >=20
> > > > Minor notes:
> > > >=20
> > > > 1. Maybe put the sed command into a function to avoid duplication=
?
> > >=20
> > > Hm, maybe, but that would increase the LoC, so I=E2=80=99m not sure=
 whether it
> > > really would be a simplification.
> >=20
> > IMHO, in my opinion, regardless of LOC, duplicated code is almost alw=
ays
> > bad. Common functions are mostly for the next guy that will be able t=
o use
> > them instead of searching through code to see how this is done there =
and there.
>=20
> In my experience, people write tests without scanning common.filter for
> whether anyone has written the same code already.  See the
> _filter_qemu_img_check example in this series.
Fair enough, but this can change.

>=20
> > >=20
> > > > 2. As I understand the test, it only checks the feature bits.
> > > >    So maybe instead of blacklisting some of the values, white lis=
t
> > > >    only the feature bits in the output?
> > >=20
> > > Hm.  Seems reasonable, but then again I=E2=80=99d prefer a minimal =
change, and
> > > changing it to a whitelist would be more change...
> >=20
> > I don't think this is bad, again in my eyes, the code should be as fr=
iendly
> > as possible for the next guy that will have to change it, so adding
> > some more extra changes don't seem a problem to me.
>=20
> In my eyes tests aren=E2=80=99t code.

And yet, writing tests is commonly known as a task=20
that developers don't really like to do, so making that even a tiniest bi=
t
easier, is a good thing IMHO,

Anyway I won't argue about this too much, and on top of this,
I think that this patch series does *lot* of improvements that
do make it easier to write the tests.

Thanks for that, and I might also someday in the future do
some refactoring for the iotests. The thing that I hate the
most is that the tests don't have names....


Best regards,
	Maxim Levitsky


