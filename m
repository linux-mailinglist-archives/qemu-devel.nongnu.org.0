Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12CF43D698
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 00:29:05 +0200 (CEST)
Received: from localhost ([::1]:33880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfrPr-0002EN-V4
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 18:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfrMI-0007vq-QM
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:25:23 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:39496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfrMF-0002kn-BP
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:25:22 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3337F756060;
 Thu, 28 Oct 2021 00:25:16 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1324E7463B7; Thu, 28 Oct 2021 00:25:16 +0200 (CEST)
Message-Id: <cover.1635371671.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Wed, 27 Oct 2021 23:54:31 +0200
Subject: [PATCH v3 00/18] More SH4 clean ups
Date: Wed, 27 Oct 2021 23:54:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, INVALID_DATE=1.096,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Based-on: <cover.1635036053.git.balaton@eik.bme.hu>
^ (hw/sh4: Codeing style fixes)

Continuing the clean up stared in previous series this now removes
printfs and QOM-ify sh_serial.

v3: Correct mistakes found in review, drop size change of sh_intc
iomem as that was wrong so only rename it, more clean ups

v2: separate sh_serial trace events, split QOM-ify patch for easier
review and some more patches to clean up sh_intc a bit

Regards,

BALATON Zoltan (18):
  hw/sh4: Fix typos in a comment
  hw//sh4: Use qemu_log instead of fprintf to stderr
  hw/sh4: Change debug printfs to traces
  hw/sh4/r2d: Use error_report instead of fprintf to stderr
  hw/char/sh_serial: Rename type sh_serial_state to SHSerialState
  hw/char/sh_serial: QOM-ify
  hw/char/sh_serial: Add device id to trace output
  hw/intc/sh_intc: Use existing macro instead of local one
  hw/intc/sh_intc: Turn some defines into an enum
  hw/intc/sh_intc: Rename iomem region
  hw/intc/sh_intc: Drop another useless macro
  hw/intc/sh_intc: Move sh_intc_register() closer to its only user
  hw/intc/sh_intc: Remove excessive parenthesis
  hw/intc/sh_intc: Use array index instead of pointer arithmetics
  hw/sh4/sh_intc: Inline and drop sh_intc_source() function
  hw/intc/sh_intc: Replace abort() with g_assert_not_reached()
  hw/intc/sh_intc: Avoid using continue in loops
  hw/intc/sh_intc: Simplify allocating sources array

 hw/char/sh_serial.c   | 149 ++++++++++--------
 hw/char/trace-events  |   4 +
 hw/intc/sh_intc.c     | 348 ++++++++++++++++--------------------------
 hw/intc/trace-events  |   8 +
 hw/sh4/r2d.c          |   5 +-
 hw/sh4/sh7750.c       |  87 +++++++----
 hw/sh4/trace-events   |   3 +
 hw/sh4/trace.h        |   1 +
 hw/timer/sh_timer.c   |  14 +-
 hw/timer/trace-events |   3 +
 include/hw/sh4/sh.h   |   9 +-
 meson.build           |   1 +
 12 files changed, 304 insertions(+), 328 deletions(-)
 create mode 100644 hw/sh4/trace-events
 create mode 100644 hw/sh4/trace.h

-- 
2.21.4


