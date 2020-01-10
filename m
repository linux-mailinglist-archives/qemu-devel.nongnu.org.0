Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699F8137067
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 15:57:04 +0100 (CET)
Received: from localhost ([::1]:47156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipvig-00062d-V2
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 09:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51125)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ipvgF-0003XG-C4
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 09:54:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ipvgB-0004Ec-Gt
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 09:54:30 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31957
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ipvgB-00048y-5k
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 09:54:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578668065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VexdPnxBGtP4m5sD088Fr2Z7oIrl6ON5vXnTAqxCkko=;
 b=bXT8FW7W23colUYzK3Tk5jCRYh4JV1zdnZ+HhZb6aK0AlOczWAO2p4qJQKg0SJw5yJIsVi
 iiFMcbAOoRArQVfDLz1T00WAPxI1c/lq+8zS9shc01xiV4+rYI22wvWxtBk0q0ah8Zi/p8
 UnWTpvsVSAJGuEzClHeCLmMIFxvPeQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-R0oieHwYPCy7edteuUVVHg-1; Fri, 10 Jan 2020 09:54:22 -0500
X-MC-Unique: R0oieHwYPCy7edteuUVVHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A7EA801B3A;
 Fri, 10 Jan 2020 14:54:20 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A869082475;
 Fri, 10 Jan 2020 14:54:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v2 00/16] arm/arm64: Add ITS tests
Date: Fri, 10 Jan 2020 15:53:56 +0100
Message-Id: <20200110145412.14937-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, andre.przywara@arm.com,
 thuth@redhat.com, yuzenghui@huawei.com, alexandru.elisei@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series is a revival of an RFC series sent in Dec 2016 [1].
Given the amount of code and the lack of traction at that time,
I haven't respinned until now. However a recent bug found related
to the ITS migration convinced me that this work may deserve to be
respinned and enhanced.

Tests exercise main ITS commands and also test migration.
With the migration framework, we are able to trigger the
migration from guest and that is very practical actually.

What is particular with the ITS programming is that most of
the commands are passed through queues and there is real error
handling. Invalid commands are just ignored and that is not
really tester friendly.

This series includes Andre's patch: "arm: gic: Provide
per-IRQ helper functions" [2]

test_migrate_unmapped_collection is currently failing with
upstream kernel. See [3].

The series can be fount at:
https://github.com/eauger/kut/tree/its-v2

Best Regards

Eric

History:
v1 -> v2:
- took into account Zenghui's comments
- collect R-b's from Thomas

References:
[1] [kvm-unit-tests RFC 00/15] arm/arm64: add ITS framework
    https://lists.gnu.org/archive/html/qemu-devel/2016-12/msg00575.html

[2] [kvm-unit-tests PATCH 00/17] arm: gic: Test SPIs and interrupt groups
    https://patchwork.kernel.org/cover/11234975/

[3] [PATCH] KVM: arm/arm64: vgic-its: Fix restoration of unmappedxi
    collections (https://lkml.org/lkml/2019/12/13/205)

Execution:
x For ITS migration testing use:
  ./run_tests.sh -g migration (blocks on TCG)

x For other ITS tests:
  ./run_tests.sh -g its

x non migration tests can be launched invidually. For instance:
  ./arm-run arm/gic.flat -smp 8 -append 'its-trigger'

Andre Przywara (1):
  arm: gic: Provide per-IRQ helper functions

Eric Auger (15):
  libcflat: Add other size defines
  arm/arm64: gic: Introduce setup_irq() helper
  arm/arm64: gicv3: Add some re-distributor defines
  arm/arm64: ITS: Introspection tests
  arm/arm64: ITS: Test BASER
  arm/arm64: ITS: Set the LPI config and pending tables
  arm/arm64: ITS: Init the command queue
  arm/arm64: ITS: Enable/Disable LPIs at re-distributor level
  arm/arm64: ITS: its_enable_defaults
  arm/arm64: ITS: Device and collection Initialization
  arm/arm64: ITS: commands
  arm/arm64: ITS: INT functional tests
  arm/run: Allow Migration tests
  arm/arm64: ITS: migration tests
  arm/arm64: ITS: pending table migration test

 arm/Makefile.common        |   3 +-
 arm/gic.c                  | 446 ++++++++++++++++++++++++++++++++++--
 arm/run                    |   2 +-
 arm/unittests.cfg          |  39 ++++
 lib/arm/asm/gic-v3-its.h   | 177 +++++++++++++++
 lib/arm/asm/gic-v3.h       |  20 ++
 lib/arm/asm/gic.h          |  12 +
 lib/arm/gic-v3-its-cmd.c   | 453 +++++++++++++++++++++++++++++++++++++
 lib/arm/gic-v3-its.c       | 327 ++++++++++++++++++++++++++
 lib/arm/gic.c              | 132 ++++++++++-
 lib/arm/io.c               |  13 ++
 lib/arm64/asm/gic-v3-its.h |   1 +
 lib/libcflat.h             |   3 +
 13 files changed, 1600 insertions(+), 28 deletions(-)
 create mode 100644 lib/arm/asm/gic-v3-its.h
 create mode 100644 lib/arm/gic-v3-its-cmd.c
 create mode 100644 lib/arm/gic-v3-its.c
 create mode 100644 lib/arm64/asm/gic-v3-its.h

--=20
2.20.1


