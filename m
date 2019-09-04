Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C2EA8354
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 15:03:02 +0200 (CEST)
Received: from localhost ([::1]:57496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5Uw9-00010M-8t
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 09:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53545)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1i5UpX-0006QI-Di
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 08:56:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1i5UpW-0005WF-5K
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 08:56:11 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:45856)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1i5UpS-0005St-NB; Wed, 04 Sep 2019 08:56:07 -0400
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id E8D4B96F65;
 Wed,  4 Sep 2019 12:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1567601764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1+QpTuKPzLpqWk6K/fjFevUQyfLtfTdEWCHGyh/r7YE=;
 b=muFZCFOTKGhiD0N4ppTsXwIsQbYUu0McDe43x77pZmOBHEekxahMyP+r90uF19NeIt2B0L
 bNmxw5ZQ2ggyuaQJ4Z4b9eB/5KtVNzQqIekBHiv6dvzG1eR4qnDCyHJiV8cr/B650K13hC
 /bRIGtZYp45UeXpMogUhCNJLrAs34+c=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 14:55:22 +0200
Message-Id: <20190904125531.27545-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1567601764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1+QpTuKPzLpqWk6K/fjFevUQyfLtfTdEWCHGyh/r7YE=;
 b=q1VbuwFVd6CqvwaWkDQHtFJYFTZCJF3JClFXLFu6y7x3R0sgk2gl7c3enyG2WO/cV+dA+d
 B+VsNEhnJx/aZ3JCkWLdh/F7o4p0unBVYlWjMeJL2kWsWRebFUuZWTzbCU0uBYBsc5FxKT
 vGg6iuDSBsD+fuqpcBoXQ8TJwZfC+Pk=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1567601764; a=rsa-sha256; cv=none;
 b=oCRTpWdqjcJM76aUF9NVb35JPTQz2A9NM4uHSLXwDgsDpRPYuboeldaRQ4veiUO3fraWBv
 0qykfxbpQPaPOCW7XQCiyraW5WP/7oMcTQo4wimjblIVNbxsT04khRbGa2nHIOXtcZfZTe
 UwPsbwy67XwR9x7s7wyfgF7ABMdmo/k=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-devel] [PATCH v6 0/9] Clock framework API
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
 berrange@redhat.com, ehabkost@redhat.com, alistair@alistair23.me,
 mark.burton@greensocs.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, edgar.iglesias@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series aims to add a way to model clock distribution in qemu. This a=
llows
to model the clock tree of a platform allowing us to inspect clock
configuration and detect problems such as disabled clock or bad configure=
d
pll.

The added clock api is very similar the the gpio api for devices. We can =
add
input and output and connect them together.

Very few changes since v5 in the core patches: we were waiting for multi =
phase
ability to allow proper initialization of the clock tree. So this is almo=
st a
simple rebase on top of the current "Multi-phase reset mechanism" series.
Based-on: <20190821163341.16309-1-damien.hedde@greensocs.com>

Changes since v5:
 - drop the "-port" in file names
 - new patch 2, extracted from patch 1 (to fix some problem with linux-us=
er builds)
 - patch 3, minor modification to better match gpios api and allow non de=
vice-related clock
   (I've dropped the reviewed-by, see the patch message for the details o=
f what has changed).
 - patch 6, Philippe's comments and various improvement
 - patches 7/8/9, multi-phase reset addition and scope reduced to uart re=
f clocks

The patches are organised as follows:
+ Patches 1 to 5 adds the clock support in qemu (1, 4 and 5 are already r=
eviewed and
  also a big part of the 3)
+ Patch 6 add some documentation in docs/devel
+ Patches 7 to 9 adds the uart's clocks to the xilinx_zynq platform as an
example for this framework. It updates the zynq's slcr clock controller, =
the=20
cadence_uart device, and the zynq toplevel platform.

I've tested this patchset on the xilinx-zynq-a9 machine with the buildroo=
t's
zynq_zc706_defconfig which package the Xilinx's Linux.
Clocks are correctly updated and we ends up with a configured baudrate of=
 115601
on the console uart (for a theoretical 115200) which is nice. "cadence_ua=
rt*" and
"clock*" traces can be enabled to see what's going on in this platform.

Any comments and suggestion are welcomed.

Thanks to the Xilinx QEMU team who sponsored this development.

Damien Hedde (9):
  hw/core/clock: introduce clock objects
  hw/core/clock-vmstate: define a vmstate entry for clock state
  qdev: add clock input&output support to devices.
  qdev-monitor: print the device's clock with info qtree
  qdev-clock: introduce an init array to ease the device construction
  docs/clocks: add device's clock documentation
  hw/misc/zynq_slcr: add clock generation for uarts
  hw/char/cadence_uart: add clock support
  hw/arm/xilinx_zynq: connect uart clocks to slcr

 Makefile.objs                  |   1 +
 docs/devel/clock.txt           | 246 +++++++++++++++++++++++++++++++++
 hw/arm/xilinx_zynq.c           |  64 +++++++--
 hw/char/cadence_uart.c         |  85 ++++++++++--
 hw/char/trace-events           |   3 +
 hw/core/Makefile.objs          |   4 +-
 hw/core/clock-vmstate.c        |  25 ++++
 hw/core/clock.c                | 144 +++++++++++++++++++
 hw/core/qdev-clock.c           | 181 ++++++++++++++++++++++++
 hw/core/qdev.c                 |  32 +++++
 hw/core/trace-events           |   6 +
 hw/misc/zynq_slcr.c            | 145 ++++++++++++++++++-
 include/hw/char/cadence_uart.h |   1 +
 include/hw/clock.h             | 133 ++++++++++++++++++
 include/hw/qdev-clock.h        | 134 ++++++++++++++++++
 include/hw/qdev-core.h         |  14 ++
 qdev-monitor.c                 |  13 ++
 tests/Makefile.include         |   1 +
 18 files changed, 1210 insertions(+), 22 deletions(-)
 create mode 100644 docs/devel/clock.txt
 create mode 100644 hw/core/clock-vmstate.c
 create mode 100644 hw/core/clock.c
 create mode 100644 hw/core/qdev-clock.c
 create mode 100644 include/hw/clock.h
 create mode 100644 include/hw/qdev-clock.h

--=20
2.22.0


