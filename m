Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD198FE80
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 10:49:36 +0200 (CEST)
Received: from localhost ([::1]:51894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyXvT-00009k-0E
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 04:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51983)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1hyXtE-0006zx-MY
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 04:47:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1hyXtD-0003s9-5P
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 04:47:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51050)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1hyXtD-0003rM-0D; Fri, 16 Aug 2019 04:47:15 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EB24285A07;
 Fri, 16 Aug 2019 08:47:13 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-249.ams2.redhat.com [10.36.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45381F6DF;
 Fri, 16 Aug 2019 08:47:09 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 10:47:02 +0200
Message-Id: <20190816084708.602-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 16 Aug 2019 08:47:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 0/6] s390x/mmu: Storage key reference and
 change bit handling
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
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first two patches are modified patches from:
    [PATCH-for-4.2 v1 0/9] s390x: MMU changes and extensions

This series primarily fixes minor things in the storage key handling code
in the MMU and implements fairly reliable reference and change bit handli=
ng
for TCG. To track the reference and change bit, we have to invalidate
TLB entries whenever the storage key is changed by the guest and make sur=
e
not TLB entry is writable in case the storage key does not indicate a
change already.

With this series, the kvm-unit-test "skey" now passes. \o/

v2 -> v3:
- Reshuffled patches to avoid a temporary uninitialized return value
- Minor updates to patch descriptions
- "s390x/tcg: Flush the TLB of all CPUs on SSKE and RRBE"
-- Updated comments
- "s390x/mmu: Factor out storage key handling"
-- Reduce indentation

v1 -> v2:
- "s390x/tcg: Rework MMU selection for instruction fetches"
-- Cleanup return value handling
- Added RB's

Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>

David Hildenbrand (6):
  s390x/mmu: Trace the right value if setting/getting the storage key
    fails
  s390x/mmu: ASC selection in s390_cpu_get_phys_page_debug()
  s390x/tcg: Rework MMU selection for instruction fetches
  s390x/tcg: Flush the TLB of all CPUs on SSKE and RRBE
  s390x/mmu: Better storage key reference and change bit handling
  s390x/mmu: Factor out storage key handling

 target/s390x/cpu.h        |   7 ++
 target/s390x/helper.c     |   5 ++
 target/s390x/mem_helper.c |  10 +++
 target/s390x/mmu_helper.c | 135 ++++++++++++++++++++++++--------------
 4 files changed, 107 insertions(+), 50 deletions(-)

--=20
2.21.0


