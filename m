Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FC93FEC25
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:30:15 +0200 (CEST)
Received: from localhost ([::1]:39558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjz4-0003Gj-Ey
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLjrj-0005sD-82
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:22:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57618
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLjrQ-0001G5-UP
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:22:38 -0400
Received: from host86-133-17-27.range86-133.btcentralplus.com ([86.133.17.27]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLjqx-0000t5-3A; Thu, 02 Sep 2021 11:21:56 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu,  2 Sep 2021 11:21:56 +0100
Message-Id: <20210902102205.7554-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.133.17.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 0/9] escc: fix reset and R_STATUS when SDLC mode is enabled
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here are another set of ESCC fixes from my attempts to boot MacOS on the q800
machine.

Patch 1 fixes up the formatting so that the remainder of the patchset keeps
checkpatch happy.

Patches 2-8 rework the reset handling so that the QEMU device reset is separate
from the ESCC in-built hardware and software reset as defined in the datasheet.
The aim here is two-fold: allow QEMU's device reset to place the ESCC device in
a known state (although we assume all registers are zeroed whilst their values are
undefined according to the datasheet) and ensure that the reset commands sent by
the MacOS OpenTransport extension on boot don't re-assert the active low
STATUS_SYNC bit in R_STATUS.

Finally patch 9 is the real fix: when entering SDLC mode using an "Enter hunt"
command the STATUS_SYNC bit in R_STATUS must remain high until the flag byte
is detected. Without this fix the active low STATUS_SYNC is continually asserted
causing the MacOS OpenTransport extension to hang on startup as it believes it is
constantly receiving LocalTalk traffic during its initial negotiation phase.

NOTE: this patchset currently fails CI because it exposed a bug that OpenBIOS
doesn't send ESCC channel reset commands before attempting to configure and use
the serial port. Those patches have just been posted to the OpenBIOS mailing list
here: https://mail.coreboot.org/hyperkitty/list/openbios@openbios.org/thread/PQCW5RDIDIEUYBVAHNIY3OMHCEVYYWPU/.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


v2:
- Rebase onto master
- Rewrite cover letter to cover new reset changes
- Change reset to separate out QEMU device reset, soft reset and hard reset
  (ensuring register values are updated as specified in the datasheet)
- Add R-B tags from Peter


Mark Cave-Ayland (9):
  escc: checkpatch fixes
  escc: reset register values to zero in escc_reset()
  escc: introduce escc_soft_reset_chn() for software reset
  escc: introduce escc_hard_reset_chn() for hardware reset
  escc: implement soft reset as described in the datasheet
  escc: implement hard reset as described in the datasheet
  escc: remove register changes from escc_reset_chn()
  escc: re-use escc_reset_chn() for hard and soft reset
  escc: fix STATUS_SYNC bit in R_STATUS register

 hw/char/escc.c | 281 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 197 insertions(+), 84 deletions(-)

-- 
2.20.1


