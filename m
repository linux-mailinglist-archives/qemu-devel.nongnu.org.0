Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1550E94A90
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 18:39:33 +0200 (CEST)
Received: from localhost ([::1]:55504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzkgu-00026K-64
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 12:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40490)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1hzkfp-0000yl-SU
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 12:38:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hzkfo-0000IM-OK
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 12:38:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46934)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hzkfo-0000Hx-JG; Mon, 19 Aug 2019 12:38:24 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DC2781089044;
 Mon, 19 Aug 2019 16:38:23 +0000 (UTC)
Received: from gondolin (unknown [10.36.116.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9580427CA8;
 Mon, 19 Aug 2019 16:38:19 +0000 (UTC)
Date: Mon, 19 Aug 2019 18:38:16 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20190819183816.45dd8178.cohuck@redhat.com>
In-Reply-To: <20190816084708.602-1-david@redhat.com>
References: <20190816084708.602-1-david@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Mon, 19 Aug 2019 16:38:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 0/6] s390x/mmu: Storage key reference
 and change bit handling
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Aug 2019 10:47:02 +0200
David Hildenbrand <david@redhat.com> wrote:

> The first two patches are modified patches from:
>     [PATCH-for-4.2 v1 0/9] s390x: MMU changes and extensions
>=20
> This series primarily fixes minor things in the storage key handling code
> in the MMU and implements fairly reliable reference and change bit handli=
ng
> for TCG. To track the reference and change bit, we have to invalidate
> TLB entries whenever the storage key is changed by the guest and make sure
> not TLB entry is writable in case the storage key does not indicate a
> change already.
>=20
> With this series, the kvm-unit-test "skey" now passes. \o/
>=20
> v2 -> v3:
> - Reshuffled patches to avoid a temporary uninitialized return value
> - Minor updates to patch descriptions
> - "s390x/tcg: Flush the TLB of all CPUs on SSKE and RRBE"
> -- Updated comments
> - "s390x/mmu: Factor out storage key handling"
> -- Reduce indentation
>=20
> v1 -> v2:
> - "s390x/tcg: Rework MMU selection for instruction fetches"
> -- Cleanup return value handling
> - Added RB's
>=20
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>=20
> David Hildenbrand (6):
>   s390x/mmu: Trace the right value if setting/getting the storage key
>     fails
>   s390x/mmu: ASC selection in s390_cpu_get_phys_page_debug()
>   s390x/tcg: Rework MMU selection for instruction fetches
>   s390x/tcg: Flush the TLB of all CPUs on SSKE and RRBE
>   s390x/mmu: Better storage key reference and change bit handling
>   s390x/mmu: Factor out storage key handling
>=20
>  target/s390x/cpu.h        |   7 ++
>  target/s390x/helper.c     |   5 ++
>  target/s390x/mem_helper.c |  10 +++
>  target/s390x/mmu_helper.c | 135 ++++++++++++++++++++++++--------------
>  4 files changed, 107 insertions(+), 50 deletions(-)
>=20

[Now the correct one...]

Thanks, applied.

