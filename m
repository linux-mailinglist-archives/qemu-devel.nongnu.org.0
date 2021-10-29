Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124684404F4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 23:34:23 +0200 (CEST)
Received: from localhost ([::1]:58602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZW2-0006R1-3F
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 17:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgZIy-0006zF-E5
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:20:52 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:19823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgZIv-0005Yl-C0
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:20:51 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9BF47756197;
 Fri, 29 Oct 2021 23:20:43 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6FD8B756036; Fri, 29 Oct 2021 23:20:43 +0200 (CEST)
Message-Id: <cover.1635541329.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 00/30] More SH4 clean ups (including code style series)
Date: Fri, 29 Oct 2021 23:02:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This now includes the previous code style clean up series so
everything is in the series now. This got big enough for now so I'll
wait until these are merged (hopefully before the freeze) before going
on so I don't have to carry them in my tree. Only plan to submit
another version if needed from review otherwise that's it for now,
hopefully this is the last version.

v6: Found some lines with wrong indentation missed in code style clean
up and one line missed removing sh_intc_source from header so I'm
posting the whole series with these two small fixes, otherwise same as
v5 but rebased on fixed code style series which is now also included.

v5: Do not use hw_error, back to qemu_log_mask; split up QOM-ify patch
mode and drop one memory alias for sh_serial

v4: Drop changes from fprintf before abort() as Philippe said, only
change sh_serial now which can use hw_error instead; missed two more
debug printfs in sh_timer that I've also added now; some more clean ups

v3: Correct mistakes found in review, drop size change of sh_intc
iomem as that was wrong so only rename it, more clean ups

v2: separate sh_serial trace events, split QOM-ify patch for easier
review and some more patches to clean up sh_intc a bit

Regards,

BALATON Zoltan (30):
  hw/sh4: Coding style: Remove tabs
  hw/sh4: Coding style: Fix multi-line comments
  hw/sh4: Coding style: White space fixes
  hw/sh4: Coding style: Add missing braces
  hw/sh4: Coding style: Remove unnecessary casts
  hw/sh4: Fix typos in a comment
  hw/sh4: Change debug printfs to traces
  hw/sh4/r2d: Use error_report instead of fprintf to stderr
  hw/char/sh_serial: Do not abort on invalid access
  hw/char/sh_serial: Rename type sh_serial_state to SHSerialState
  hw/char/sh_serial: Embed QEMUTimer in state struct
  hw/char/sh_serial: Split off sh_serial_reset() from sh_serial_init()
  hw/char/sh_serial: QOM-ify
  hw/char/sh_serial: Add device id to trace output
  hw/intc/sh_intc: Use existing macro instead of local one
  hw/intc/sh_intc: Turn some defines into an enum
  hw/intc/sh_intc: Rename iomem region
  hw/intc/sh_intc: Drop another useless macro
  hw/intc/sh_intc: Move sh_intc_register() closer to its only user
  hw/intc/sh_intc: Remove excessive parenthesis
  hw/intc/sh_intc: Use array index instead of pointer arithmetics
  hw/intc/sh_intc: Inline and drop sh_intc_source() function
  hw/intc/sh_intc: Replace abort() with g_assert_not_reached()
  hw/intc/sh_intc: Avoid using continue in loops
  hw/intc/sh_intc: Simplify allocating sources array
  hw/intc/sh_intc: Remove unneeded local variable initialisers
  hw/timer/sh_timer: Rename sh_timer_state to SHTimerState
  hw/timer/sh_timer: Do not wrap lines that are not too long
  hw/timer/sh_timer: Fix timer memory region size
  hw/timer/sh_timer: Remove use of hw_error

 hw/char/sh_serial.c      |  236 +++---
 hw/char/trace-events     |    4 +
 hw/intc/sh_intc.c        |  546 ++++++-------
 hw/intc/trace-events     |    8 +
 hw/pci-host/sh_pci.c     |   10 +-
 hw/sh4/r2d.c             |   69 +-
 hw/sh4/sh7750.c          |  637 ++++++++-------
 hw/sh4/sh7750_regnames.c |  148 ++--
 hw/sh4/sh7750_regs.h     | 1600 +++++++++++++++++++-------------------
 hw/sh4/shix.c            |   12 +-
 hw/sh4/trace-events      |    3 +
 hw/sh4/trace.h           |    1 +
 hw/timer/sh_timer.c      |  147 ++--
 hw/timer/trace-events    |    5 +
 include/hw/sh4/sh.h      |   19 +-
 include/hw/sh4/sh_intc.h |    2 +-
 meson.build              |    1 +
 17 files changed, 1739 insertions(+), 1709 deletions(-)
 create mode 100644 hw/sh4/trace-events
 create mode 100644 hw/sh4/trace.h

-- 
2.21.4


