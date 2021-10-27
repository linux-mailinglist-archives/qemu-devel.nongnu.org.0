Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FFF43CC92
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:42:35 +0200 (CEST)
Received: from localhost ([::1]:35360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfk8Q-0005P1-8s
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfjS5-0003tp-Ej
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:58:50 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:28114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfjS0-0004Ts-Rh
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:58:49 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A583775605A;
 Wed, 27 Oct 2021 15:58:41 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 858F2746353; Wed, 27 Oct 2021 15:58:41 +0200 (CEST)
Message-Id: <cover.1635342377.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 00/11] More SH4 clean ups
Date: Wed, 27 Oct 2021 15:46:17 +0200
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

Based-on: <cover.1635036053.git.balaton@eik.bme.hu>
^ (hw/sh4: Codeing style fixes)

Continuing the clean up stared in previous series this now removes
printfs and QOM-ify sh_serial.

v2: separate sh_serial trace events, split QOM-ify patch for easier
review and some more patches to clean up sh_intc a bit

Regards,
BALATON Zoltan

BALATON Zoltan (11):
  hw/sh4: Fix a typo in a comment
  hw//sh4: Use qemu_log instead of fprintf to stderr
  hw/sh4: Change debug printfs to traces
  hw/sh4/r2d: Use error_report instead of fprintf to stderr
  hw/char/sh_serial: Rename type sh_serial_state to SHSerialState
  hw/char/sh_serial: QOM-ify
  hw/char/sh_serial: Add device id to trace output
  hw/intc/sh_intc: Use existing macro instead of local one
  hw/intc/sh_intc: Turn some defines into an enum
  hw/intc/sh_intc: Clean up iomem region
  hw/intc/sh_intc: Drop another useless macro

 hw/char/sh_serial.c   | 149 +++++++++++++++++++++++------------------
 hw/char/trace-events  |   4 ++
 hw/intc/sh_intc.c     | 151 +++++++++++++-----------------------------
 hw/intc/trace-events  |   8 +++
 hw/sh4/r2d.c          |   5 +-
 hw/sh4/sh7750.c       |  83 +++++++++++++++--------
 hw/sh4/trace-events   |   3 +
 hw/sh4/trace.h        |   1 +
 hw/timer/sh_timer.c   |  14 +---
 hw/timer/trace-events |   3 +
 include/hw/sh4/sh.h   |   9 +--
 meson.build           |   1 +
 12 files changed, 214 insertions(+), 217 deletions(-)
 create mode 100644 hw/sh4/trace-events
 create mode 100644 hw/sh4/trace.h

-- 
2.21.4


