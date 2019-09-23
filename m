Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722EABAEF4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 10:11:37 +0200 (CEST)
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCJRX-0004U5-CR
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 04:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42543)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iCJNP-0001SS-SB
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:07:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iCJNO-0003u5-LO
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:07:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41750)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iCJNO-0003ti-G9; Mon, 23 Sep 2019 04:07:18 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EC9E630860BD;
 Mon, 23 Sep 2019 08:07:16 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E54D919C78;
 Mon, 23 Sep 2019 08:07:12 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/30] s390x/tcg update
Date: Mon, 23 Sep 2019 10:06:42 +0200
Message-Id: <20190923080712.23951-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 23 Sep 2019 08:07:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

here is the updated tcg subset of the s390x update (including one more
test).

The following changes since commit 4300b7c2cd9f3f273804e8cca325842ccb93b1=
ad:

  Merge remote-tracking branch 'remotes/cleber/tags/python-next-pull-requ=
est' into staging (2019-09-20 17:28:43 +0100)

are available in the Git repository at:

  https://github.com/davidhildenbrand/qemu.git tags/s390x-tcg-2019-09-23

for you to fetch changes up to 5d69cbdfdd5cd6dadc9f0c986899844a0e4de703:

  tests/tcg: target/s390x: Test MVC (2019-09-23 09:28:29 +0200)

----------------------------------------------------------------
Fix a bunch of BUGs in the mem-helpers (including the MVC instruction),
especially, to make them behave correctly on faults.

----------------------------------------------------------------
David Hildenbrand (30):
  s390x/tcg: Reset exception_index to -1 instead of 0
  s390x/tcg: MVCL: Zero out unused bits of address
  s390x/tcg: MVCL: Detect destructive overlaps
  s390x/tcg: MVCL: Process max 4k bytes at a time
  s390x/tcg: MVC: Increment the length once
  s390x/tcg: MVC: Use is_destructive_overlap()
  s390x/tcg: MVPG: Check for specification exceptions
  s390x/tcg: MVPG: Properly wrap the addresses
  s390x/tcg: MVCLU/MVCLE: Process max 4k bytes at a time
  s390x/tcg: MVCS/MVCP: Check for special operation exceptions
  s390x/tcg: MVCOS: Lengths are 32 bit in 24/31-bit mode
  s390x/tcg: MVCS/MVCP: Properly wrap the length
  s390x/tcg: MVST: Check for specification exceptions
  s390x/tcg: MVST: Fix storing back the addresses to registers
  s390x/tcg: Always use MMU_USER_IDX for CONFIG_USER_ONLY
  s390x/tcg: Fault-safe memset
  s390x/tcg: Fault-safe memmove
  s390x/tcg: MVCS/MVCP: Use access_memmove()
  s390x/tcg: MVC: Fault-safe handling on destructive overlaps
  s390x/tcg: MVCLU: Fault-safe handling
  s390x/tcg: OC: Fault-safe handling
  s390x/tcg: XC: Fault-safe handling
  s390x/tcg: NC: Fault-safe handling
  s390x/tcg: MVCIN: Fault-safe handling
  s390x/tcg: MVN: Fault-safe handling
  s390x/tcg: MVZ: Fault-safe handling
  s390x/tcg: MVST: Fault-safe handling
  s390x/tcg: MVO: Fault-safe handling
  tests/tcg: target/s390x: Test MVO
  tests/tcg: target/s390x: Test MVC

 target/s390x/cpu.h              |   4 +
 target/s390x/helper.h           |   2 +-
 target/s390x/insn-data.def      |   2 +-
 target/s390x/mem_helper.c       | 749 ++++++++++++++++++++++----------
 target/s390x/translate.c        |  12 +-
 tests/tcg/s390x/Makefile.target |   2 +
 tests/tcg/s390x/mvc.c           | 109 +++++
 tests/tcg/s390x/mvo.c           |  25 ++
 8 files changed, 680 insertions(+), 225 deletions(-)
 create mode 100644 tests/tcg/s390x/mvc.c
 create mode 100644 tests/tcg/s390x/mvo.c

--=20
2.21.0


