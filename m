Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C49D16C289
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 14:39:25 +0100 (CET)
Received: from localhost ([::1]:56098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6aQm-0007Cf-81
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 08:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1j6a2p-0007zV-80
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:14:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1j6a2n-00026c-It
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:14:39 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:57132)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1j6a2e-000211-SL; Tue, 25 Feb 2020 08:14:29 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 49D6896EF0;
 Tue, 25 Feb 2020 13:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1582636464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cmVeIIg2UhMQ9LFYRp1vgnoqu4rjk3OUjpnIKS+p5iw=;
 b=r7iOOZgeQ/sdI+YNE4kyNt5fQHfhoWlWG//KG8QmluFN7uMymJ4J+TD8FBkVBgFIddMLjm
 b1bXOGucqJgpfwjLCQ72H6fR+BvQ9wrmxDDraS/V0eyxsrulZUG89pzxIVSNp96lRc0hDw
 b2wyypUDV4RzuLoAAY58Zi73n0wIL84=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 0/9] Clock framework API
Date: Tue, 25 Feb 2020 14:14:13 +0100
Message-Id: <20200225131422.53368-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1582636464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cmVeIIg2UhMQ9LFYRp1vgnoqu4rjk3OUjpnIKS+p5iw=;
 b=bnTs1OJ4FhCAxWiVDLMACe/PhgzYx1NvGmP4QmI4D6HuGA9Gsp2Yr5p8ehn/Y0TQCOG4In
 fdo2ZihNj9BmQPWWZQMtsGmh+Km7ICrH253ixFfMiJ/K1yh3yOC9yGyrbTT41G0GZuLbf3
 rqcPbB3tDn3g2Fsv6tV8P+RV6wv6crA=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1582636464; a=rsa-sha256; cv=none;
 b=5Yrbo8jZMITrnhmeRA2PsTNN35FOuy9z3FW2z6x901upCHSHknUkdkAmTtZ0bOHKKABL44
 WZ8+yKoLl5tlpW1U7EVLocykf3VcjQgkcbVtxRiM3HgDKE6mw6wOY5qQJ00nK0kjjQSX10
 cwmFijd0Kr39CATnwJ1x19AFgMOphj8=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, ehabkost@redhat.com, pbonzini@redhat.com,
 alistair@alistair23.me, mark.burton@greensocs.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, edgar.iglesias@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series aims to add a way to model clock distribution in qemu.
The proposed objet and qdev API allows to model the clock tree of
a platform allowing us to inspect clock configuration and detect
problems such as disabled clock or bad configured pll.

This fast v8 fixes the documentation rst patchew errors and includes
Alistair's review on v7.

There's 2 notable changes since v6:
+ The value stored in clock is now a period on 64 bits integer. The
  unit is 2^-32ns to achieve the same precision as the ptimer internal
  representation.
+ No more ClockIn/ClockOut base types, just a single Clock type. It
  makes things simplier for everything else (standalone clocks,
  possibility to read device's output clocks) and allow to chain
  several clock inputs.

Regarding the internal represention. The precision is huge so that
it is possible (in the future) to somehow connect a ptimer with a
Clock with no loss of precision.
The consequence is that we have a ~4seconds period upper bound only.
Alternatives, allowing us to keep this precision, are to use a
floating point or to extend the integer.

The added clock api is very similar the the GPIO API for devices. We
can add input and output and connect them together.

Now that ressettable API is merged, the clock tree is properly
initialized during the machine reset.
I've tested this patchset running Xilinx's Linux on the xilinx-zynq-a9
machine. Clocks are correctly updated and we ends up with a configured
baudrate of 115601 on the console uart (for a theoretical 115200)
which is nice. "cadence_uart*" and "clock*" traces can be enabled to
see what's going on in this platform.

Any comments and suggestions are welcomed.

Patches 1, 3 and 5 to 8 still need some reviews.

The patches are organised as follows:
+ Patches 1 to 4 adds the clock support in qemu
+ Patch 5 adds some documentation in docs/devel
+ Patches 6 to 8 adds the uart's clocks to the xilinx_zynq platform
  as an example for this framework. It updates the zynq's slcr clock
  controller, the cadence_uart device, and the zynq toplevel platform.
+ Patch 9 adds clock info to monitor "info qtree" command

Changes since v7:
https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg06451.html
 - rst errors in doc
 - Alistair's comments on patch 1 and 3

Changes since v6:
https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg00599.html
 - switch from frequency to period based clock state
 - single Clock type (no more ClockIn and ClockOut)
 - doc converted in rst format (Peter)
 - various fixes (Peter and Philippe)
 - better migration support for zynq devices (Peter)

Thanks to the Xilinx QEMU team who sponsored this development.

Damien Hedde (9):
  hw/core/clock: introduce clock object
  hw/core/clock-vmstate: define a vmstate entry for clock state
  qdev: add clock input&output support to devices.
  qdev-clock: introduce an init array to ease the device construction
  docs/clocks: add device's clock documentation
  hw/misc/zynq_slcr: add clock generation for uarts
  hw/char/cadence_uart: add clock support
  hw/arm/xilinx_zynq: connect uart clocks to slcr
  qdev-monitor: print the device's clock with info qtree

 docs/devel/clocks.rst          | 360 +++++++++++++++++++++++++++++++++
 docs/devel/index.rst           |   1 +
 include/hw/char/cadence_uart.h |   1 +
 include/hw/clock.h             | 225 +++++++++++++++++++++
 include/hw/qdev-clock.h        | 159 +++++++++++++++
 include/hw/qdev-core.h         |  12 ++
 hw/arm/xilinx_zynq.c           |  57 +++++-
 hw/char/cadence_uart.c         |  73 ++++++-
 hw/core/clock-vmstate.c        |  25 +++
 hw/core/clock.c                | 130 ++++++++++++
 hw/core/qdev-clock.c           | 185 +++++++++++++++++
 hw/core/qdev.c                 |  12 ++
 hw/misc/zynq_slcr.c            | 172 +++++++++++++++-
 qdev-monitor.c                 |   9 +
 hw/char/trace-events           |   3 +
 hw/core/Makefile.objs          |   2 +
 hw/core/trace-events           |   7 +
 tests/Makefile.include         |   1 +
 18 files changed, 1412 insertions(+), 22 deletions(-)
 create mode 100644 docs/devel/clocks.rst
 create mode 100644 include/hw/clock.h
 create mode 100644 include/hw/qdev-clock.h
 create mode 100644 hw/core/clock-vmstate.c
 create mode 100644 hw/core/clock.c
 create mode 100644 hw/core/qdev-clock.c

--=20
2.25.1


