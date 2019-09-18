Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0B6B601C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 11:28:44 +0200 (CEST)
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAWGQ-0003EK-R7
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 05:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56158)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iAWEf-0002WI-OK
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 05:26:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iAWEe-0000WG-8r
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 05:26:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59346)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iAWEe-0000VH-1M; Wed, 18 Sep 2019 05:26:52 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5E7DC308421A;
 Wed, 18 Sep 2019 09:26:50 +0000 (UTC)
Received: from gondolin (dhcp-192-230.str.redhat.com [10.33.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92B5D600CC;
 Wed, 18 Sep 2019 09:26:48 +0000 (UTC)
Date: Wed, 18 Sep 2019 11:26:46 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20190918112646.4363372e.cohuck@redhat.com>
In-Reply-To: <a3d54208-1126-2f4e-e16d-6c01270d2bb9@redhat.com>
References: <20190916135806.1269-1-david@redhat.com>
 <a3d54208-1126-2f4e-e16d-6c01270d2bb9@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 18 Sep 2019 09:26:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 00/29] s390x/tcg: mem_helper: Fault-safe
 handling
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
Cc: Florian Weimer <fweimer@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>, qemu-devel@nongnu.org,
 Stefano Brivio <sbrivio@redhat.com>, qemu-s390x@nongnu.org,
 Cole Robinson <crobinso@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Sep 2019 10:25:15 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 16.09.19 15:57, David Hildenbrand wrote:
> > This series fixes a bunch of issues related to some mem helpers and mak=
es
> > sure that they are fault-safe, meaning no system state is modified in c=
ase
> > a fault is triggered.
> >=20
> > I can spot tons of other issues with other mem helpers that will have
> > to be fixed later. Also, fault-safe handling for some instructions
> > (especially TR) might be harder to implement (you don't know what will
> > actually be accessed upfront - we might need a buffer and go over
> > inputs twice). Focusing on the MOVE instructions for now.
> >=20
> > ----
> >=20
> > Newer versions of glibc use memcpy() in memmove() for forward moves. The
> > implementation makese use of MVC. The TCG implementation of MVC is
> > currently not able to handle faults reliably when crossing pages. MVC
> > can cross with 256 bytes at most two pages.
> >=20
> > In case we get a fault on the second page, we already moved data. When
> > continuing after the fault we might try to move already overwritten dat=
a,
> > which is very bad in case we have overlapping data on a forward move.
> >=20
> > Triggered for now only by rpmbuild (crashes when checking the spec file)
> > and rpm (database corruptions). This fixes installing Fedora rawhide (3=
1)
> > under TCG.
> >=20
> > This was horrible to debug as it barely triggers and we fail at complet=
ely
> > different places.
> >=20
> > Cc: Stefano Brivio <sbrivio@redhat.com>
> > Cc: Florian Weimer <fweimer@redhat.com>
> > Cc: Dan Hor=C3=A1k <dan@danny.cz>
> > Cc: Cole Robinson <crobinso@redhat.com>
> >=20
> > v2 -> v3:
> > - "s390x/tcg: MVCL: Zero out unused bits of address"
> > -- Do single deposit for 24/31-bit
> > - "s390x/tcg: MVCL: Process max 4k bytes at a time"
> > -- Use max of 4k instead of 2k, limiting to single pages
> > - "s390x/tcg: MVCLU/MVCLE: Process max 4k bytes at a time"
> > -- Limit to single pages
> > - "s390x/tcg: MVCOS: Lengths are 32 bit in 24/31-bit mode"
> > -- Added
> > - "s390x/tcg: MVCS/MVCP: Properly wrap the length"
> > -- Properly use 32 instead of 31 bit.
> > - "s390x/tcg: MVST: Fix storing back the addresses to registers"
> > -- Read R0 implicitly
> > - "s390x/tcg: Fault-safe memset"
> > -- Speed up TLB_NOTDIRTY handling
> > -- Move single-page access to helper function
> > -- Pass access structure to access_memset()
> > -- Replace access_prepare() by previous access_prepare_idx()
> > - "s390x/tcg: Fault-safe memmove"
> > -- Pass access structure to access_memmove()
> > -- Speed up TLB_NOTDIRTY handling when accessing single bytes
> > - The other fault-safe handling patches were adapted to work with the
> >   changed access functions. mmu_idx is now always passed to
> >   access_prepare() from the helpers.
> >=20
> > v1 -> v2:
> > - Include many fixes
> > - Fix more instructions
> > - Use the new probe_access() function
> > - Include "tests/tcg: target/s390x: Test MVO"
> >=20
> > David Hildenbrand (29):
> >   s390x/tcg: Reset exception_index to -1 instead of 0
> >   s390x/tcg: MVCL: Zero out unused bits of address
> >   s390x/tcg: MVCL: Detect destructive overlaps
> >   s390x/tcg: MVCL: Process max 4k bytes at a time
> >   s390x/tcg: MVC: Increment the length once
> >   s390x/tcg: MVC: Use is_destructive_overlap()
> >   s390x/tcg: MVPG: Check for specification exceptions
> >   s390x/tcg: MVPG: Properly wrap the addresses
> >   s390x/tcg: MVCLU/MVCLE: Process max 4k bytes at a time
> >   s390x/tcg: MVCS/MVCP: Check for special operation exceptions
> >   s390x/tcg: MVCOS: Lengths are 32 bit in 24/31-bit mode
> >   s390x/tcg: MVCS/MVCP: Properly wrap the length
> >   s390x/tcg: MVST: Check for specification exceptions
> >   s390x/tcg: MVST: Fix storing back the addresses to registers
> >   s390x/tcg: Always use MMU_USER_IDX for CONFIG_USER_ONLY
> >   s390x/tcg: Fault-safe memset
> >   s390x/tcg: Fault-safe memmove
> >   s390x/tcg: MVCS/MVCP: Use access_memmove()
> >   s390x/tcg: MVC: Fault-safe handling on destructive overlaps
> >   s390x/tcg: MVCLU: Fault-safe handling
> >   s390x/tcg: OC: Fault-safe handling
> >   s390x/tcg: XC: Fault-safe handling
> >   s390x/tcg: NC: Fault-safe handling
> >   s390x/tcg: MVCIN: Fault-safe handling
> >   s390x/tcg: MVN: Fault-safe handling
> >   s390x/tcg: MVZ: Fault-safe handling
> >   s390x/tcg: MVST: Fault-safe handling
> >   s390x/tcg: MVO: Fault-safe handling
> >   tests/tcg: target/s390x: Test MVO
> >=20
> >  target/s390x/cpu.h              |   4 +
> >  target/s390x/helper.h           |   2 +-
> >  target/s390x/insn-data.def      |   2 +-
> >  target/s390x/mem_helper.c       | 743 ++++++++++++++++++++++----------
> >  target/s390x/translate.c        |  12 +-
> >  tests/tcg/s390x/Makefile.target |   1 +
> >  tests/tcg/s390x/mvo.c           |  25 ++
> >  7 files changed, 564 insertions(+), 225 deletions(-)
> >  create mode 100644 tests/tcg/s390x/mvo.c
> >  =20
>=20
> As long as there are no further comments, this series is ready to go
> (only one patch description needs a fixup).

I don't have any :)

>=20
> Conny, how do you prefer to upstream this stuff? (remembering that
> you'll be on vacation soon).

I'll happily process a pull request from you, as long as I can send a
pull request myself on Thu or Fri latest.

