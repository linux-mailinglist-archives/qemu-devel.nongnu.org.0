Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C74BDEB8
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 15:15:08 +0200 (CEST)
Received: from localhost ([::1]:49792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD78M-0003Sl-NL
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 09:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58625)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iD6mj-0006Fd-VY
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:52:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iD6mi-00042R-S0
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:52:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42422)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iD6mi-00042F-N5; Wed, 25 Sep 2019 08:52:44 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D09AC7FDCA;
 Wed, 25 Sep 2019 12:52:43 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-14.ams2.redhat.com [10.36.117.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63C8E600C8;
 Wed, 25 Sep 2019 12:52:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] s390x/mmu: DAT translation rewrite
Date: Wed, 25 Sep 2019 14:52:29 +0200
Message-Id: <20190925125236.4043-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 25 Sep 2019 12:52:43 +0000 (UTC)
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a split-up of:
    [PATCH-for-4.2 v1 3/9] s390x/mmu: DAT translation rewrite
Rebased on latest upstream changes. Hopefully, this makes it easier to
review.

v1 -> v2:
- Cleanup old code first, before switching to non-recursive handling
- Fix EDAT1 translation: I was missing the vaddr offset within the 1MB
  page.

David Hildenbrand (7):
  s390x/mmu: Drop debug logging from MMU code
  s390x/mmu: Move DAT protection handling out of mmu_translate_asce()
  s390x/mmu: Inject DAT exceptions from a single place
  s390x/mmu: Inject PGM_ADDRESSING on boguous table addresses
  s390x/mmu: Use TARGET_PAGE_MASK in mmu_translate_pte()
  s390x/mmu: DAT table definition overhaul
  s390x/mmu: Convert to non-recursive page table walk

 target/s390x/cpu.h        |  77 +++++---
 target/s390x/mem_helper.c |  12 +-
 target/s390x/mmu_helper.c | 368 ++++++++++++++++----------------------
 3 files changed, 221 insertions(+), 236 deletions(-)

--=20
2.21.0


