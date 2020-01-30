Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED1514D9B9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 12:26:59 +0100 (CET)
Received: from localhost ([::1]:58876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ix7yF-0005Vt-Ky
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 06:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58142)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ix7ww-0004Dr-7Y
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 06:25:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ix7wu-0003cx-Cv
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 06:25:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42877
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ix7wu-0003Xp-9O
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 06:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580383527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RD3+Ld7Dxp10D8lHwl6kiXjd9vd6HKHz9XGO3ilgvRk=;
 b=TW7uZIfh8x7YozKJ/q2QERwpQ0NiE+LIF72kO8rJI8JasWJ+OtCt2hnjIv5N3EuCGvCQG5
 5s0ACZamqFe9S/Hhm3AfsoU4gFJJHLKhX3o9sr9SePHrrmbVfsCHFUHTl3munfHwnx1da7
 xD21hF/ucjVVrqEsMzdX3Q4o7RiW+8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-Z7hfLdmJPPalT3OyO1uCZg-1; Thu, 30 Jan 2020 06:25:23 -0500
X-MC-Unique: Z7hfLdmJPPalT3OyO1uCZg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB762100551B;
 Thu, 30 Jan 2020 11:25:21 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02B211001B05;
 Thu, 30 Jan 2020 11:25:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v2 0/9] KVM: arm64: PMUv3 Event Counter Tests
Date: Thu, 30 Jan 2020 12:25:01 +0100
Message-Id: <20200130112510.15154-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, andrew.murray@arm.com, drjones@redhat.com,
 alexandru.elisei@arm.com, andre.przywara@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series implements tests exercising the PMUv3 event counters.
It tests both the 32-bit and 64-bit versions. Overflow interrupts
also are checked. Those tests only are written for arm64.

It allowed to reveal some issues related to SW_INCR implementation
(esp. related to 64-bit implementation), some problems related to
32-bit <-> 64-bit transitions and consistency of enabled states
of odd and event counters (See [1]).

Overflow interrupt testing relies of one patch from Andre
("arm: gic: Provide per-IRQ helper functions") to enable the
PPI 23, coming from "arm: gic: Test SPIs and interrupt groups"
(https://patchwork.kernel.org/cover/11234975/). Drew kindly
provided "arm64: Provide read/write_sysreg_s".

All PMU tests can be launched with:
./run_tests.sh -g pmu
Tests also can be launched individually. For example:
./arm-run arm/pmu.flat -append 'chained-sw-incr'

With KVM:
- chain-promotion and chained-sw-incr are known to be failing.
  [1] proposed a fix.
- On TX2, I have some random failures due to MEM_ACCESS event
  measured with a great disparity. This is not observed on
  other machines I have access to.
With TCG:
- all new tests are skipped

The series can be found at:
https://github.com/eauger/kut/tree/pmu_event_counters_v2

References:
[1] [PATCH 0/4] KVM/ARM: Misc PMU fixes
(https://www.spinics.net/lists/kvm-arm/msg38886.html)

History:
- Took into account Andre's comments except I did not
  use cnbz in the mem_access_loop() and I did not use
  @loop directly. Those changes had side effects I
  cannot explain on the tests. Anyway I think this can
  be improved later on.
- removed [kvm-unit-tests PATCH 09/10] arm/arm64: gic:
  Introduce setup_irq() helper

RFC -> v1:
- Use new report() proto
- Style cleanup
- do not warn about ARM spec recommendations
- add a comment about PMCEID0/1 splits

Andre Przywara (1):
  arm: gic: Provide per-IRQ helper functions

Andrew Jones (1):
  arm64: Provide read/write_sysreg_s

Eric Auger (7):
  arm: pmu: Let pmu tests take a sub-test parameter
  arm: pmu: Add a pmu struct
  arm: pmu: Check Required Event Support
  arm: pmu: Basic event counter Tests
  arm: pmu: Test chained counter
  arm: pmu: test 32-bit <-> 64-bit transitions
  arm: pmu: Test overflow interrupts

 arm/pmu.c              | 786 ++++++++++++++++++++++++++++++++++++++++-
 arm/unittests.cfg      |  55 ++-
 lib/arm/asm/gic-v3.h   |   2 +
 lib/arm/asm/gic.h      |   9 +
 lib/arm/gic.c          |  90 +++++
 lib/arm64/asm/sysreg.h |  11 +
 6 files changed, 936 insertions(+), 17 deletions(-)

--=20
2.20.1


