Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010363926D3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 07:24:08 +0200 (CEST)
Received: from localhost ([::1]:38796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm8V4-0002XM-Cg
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 01:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1lm8Se-0008KX-ML
 for qemu-devel@nongnu.org; Thu, 27 May 2021 01:21:36 -0400
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:38755)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1lm8Sc-00063w-1m
 for qemu-devel@nongnu.org; Thu, 27 May 2021 01:21:36 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id E15FF3D15A;
 Thu, 27 May 2021 14:21:29 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (y245018.dynamic.ppp.asahi-net.or.jp [118.243.245.18])
 by sakura.ysato.name (Postfix) with ESMTPSA id 9AD181C0077;
 Thu, 27 May 2021 14:21:28 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] Unified peripheral emulation for Renesas chips
Date: Thu, 27 May 2021 14:21:11 +0900
Message-Id: <20210527052122.97103-1-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.14;
 envelope-from=ysato@users.sourceforge.jp; helo=mail02.asahi-net.or.jp
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Renesas SH4 and RX have similar peripherals.
Integrate the emulation code for these peripherals.

Migrate peripherals.
SH4 sh_timer(TMU) -> renesas_timer
SH4 sh_serial(SCI/SCIF) -> renesas_sci
RX renesas_cmt(CMT) -> renesas_timer
RX renesas_sci(SCIa) -> renesas_sci

I want to process the peripheral clocks of SH4 and RX in the same way,
so I added a new clock generator. This will generate a peripheral clock
from the master clock.

Yoshinori Sato (11):
  hw/char: Renesas SCI module.
  hw/char: remove sh_serial.
  hw/timer: Renesas TMU/CMT module.
  hw/timer: Remove sh_timer.
  hw/timer: Remove renesas_cmt.
  hw/rx: Add RX62N Clock generator
  hw/timer: Renesas 8bit timer.
  hw/rx: rx62n use new hw modules.
  hw/sh4: sh7750 Add CPG.
  hw/sh4: sh7750 use new hw modules.
  hw/rx: rx-gdbsim Add bootstrup for linux

 include/hw/char/renesas_sci.h    |  129 +++-
 include/hw/rx/rx62n-cpg.h        |   72 +++
 include/hw/rx/rx62n.h            |   34 +-
 include/hw/sh4/sh.h              |    8 -
 include/hw/sh4/sh7751-cpg.h      |   94 +++
 include/hw/timer/renesas_cmt.h   |   43 --
 include/hw/timer/renesas_timer.h |   96 +++
 include/hw/timer/renesas_tmr.h   |   58 --
 include/hw/timer/renesas_tmr8.h  |   67 ++
 include/hw/timer/tmu012.h        |   23 -
 hw/char/renesas_sci.c            | 1039 +++++++++++++++++++++++++-----
 hw/char/sh_serial.c              |  431 -------------
 hw/rx/rx-gdbsim.c                |   89 +--
 hw/rx/rx62n-cpg.c                |  344 ++++++++++
 hw/rx/rx62n.c                    |   64 +-
 hw/sh4/sh7750.c                  |  110 +++-
 hw/sh4/sh7751-cpg.c              |  457 +++++++++++++
 hw/timer/renesas_cmt.c           |  283 --------
 hw/timer/renesas_timer.c         |  644 ++++++++++++++++++
 hw/timer/renesas_tmr.c           |  493 --------------
 hw/timer/renesas_tmr8.c          |  540 ++++++++++++++++
 hw/timer/sh_timer.c              |  368 -----------
 MAINTAINERS                      |    8 +-
 hw/char/Kconfig                  |    3 -
 hw/char/meson.build              |    1 -
 hw/rx/Kconfig                    |    4 +-
 hw/rx/meson.build                |    2 +-
 hw/sh4/Kconfig                   |    4 +-
 hw/sh4/meson.build               |    1 +
 hw/timer/Kconfig                 |   12 +-
 hw/timer/meson.build             |    5 +-
 31 files changed, 3501 insertions(+), 2025 deletions(-)
 create mode 100644 include/hw/rx/rx62n-cpg.h
 create mode 100644 include/hw/sh4/sh7751-cpg.h
 delete mode 100644 include/hw/timer/renesas_cmt.h
 create mode 100644 include/hw/timer/renesas_timer.h
 delete mode 100644 include/hw/timer/renesas_tmr.h
 create mode 100644 include/hw/timer/renesas_tmr8.h
 delete mode 100644 include/hw/timer/tmu012.h
 delete mode 100644 hw/char/sh_serial.c
 create mode 100644 hw/rx/rx62n-cpg.c
 create mode 100644 hw/sh4/sh7751-cpg.c
 delete mode 100644 hw/timer/renesas_cmt.c
 create mode 100644 hw/timer/renesas_timer.c
 delete mode 100644 hw/timer/renesas_tmr.c
 create mode 100644 hw/timer/renesas_tmr8.c
 delete mode 100644 hw/timer/sh_timer.c

-- 
2.20.1


