Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB30421957
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:35:03 +0200 (CEST)
Received: from localhost ([::1]:44558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVby-0007nn-E1
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXVN6-00019x-83
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:19:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35824
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXVN4-0001qZ-7v
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:19:39 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXVMp-0008kv-2x; Mon, 04 Oct 2021 22:19:27 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Mon,  4 Oct 2021 22:19:16 +0100
Message-Id: <20211004211928.15803-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 00/12] macfb: fixes for booting MacOS
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the next set of patches to allow users to boot MacOS in QEMU's
q800 machine.

Patches 1 to 3 are fixes for existing bugs that I discovered whilst
developing the remainder of the patchset whilst patch 4 simplifies the
registration of the framebuffer RAM.

Patch 5 adds trace events to the framebuffer register accesses. The
framebuffer registers are not officially documented, so the macfb
device changes here are based upon reading of Linux/NetBSD source code,
using gdbstub during the MacOS toolbox ROM initialisation, and changing
the framebuffer size/depth within MacOS itself with these trace events
enabled.

Patches 6 and 7 implement the mode sense logic documented in Apple
Technical Note HW26 "Macintosh Quadra Built-In Video" and configure the
default display type to be VGA.

Patch 8 implements the common monitor modes used for VGA at 640x480 and
800x600 for 1, 2, 4, 8 and 24-bit depths and also the Apple 21" color
monitor at 1152x870 with 8-bit depth.

Patches 9 and 10 fix up errors in the 1-bit and 24-bit pixel encodings
discovered when testing these color depths in MacOS.

Patch 11 adds a timer to implement the 60.15Hz VBL interrupt which is
required for MacOS to process mouse movements, whilst patch 12 wires the
same interrupt to a dedicated pin on VIA2 reserved for the video
interrupt on the Quadra 800.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


v2:
- Rebase onto master
- Add R-B tags from Zoltan, Philippe and Laurent
- Rework macfb_common_realize() to return a bool in patch 1
- Add Fixes tag to patch 2
- Use Laurent's suggested change for s->current_palette (slightly modified) in patch 3
- Change size trace-events parameter to unsigned int in patch 5
- Add assert() as suggested by Philippe in patch 7
- Move calculation of next VBL time into a separate macfb_next_vbl() function in patch 11


Mark Cave-Ayland (12):
  macfb: handle errors that occur during realize
  macfb: fix invalid object reference in macfb_common_realize()
  macfb: fix overflow of color_palette array
  macfb: use memory_region_init_ram() in macfb_common_realize() for the
    framebuffer
  macfb: add trace events for reading and writing the control registers
  macfb: implement mode sense to allow display type to be detected
  macfb: add qdev property to specify display type
  macfb: add common monitor modes supported by the MacOS toolbox ROM
  macfb: fix up 1-bit pixel encoding
  macfb: fix 24-bit RGB pixel encoding
  macfb: add vertical blank interrupt
  q800: wire macfb IRQ to separate video interrupt on VIA2

 hw/display/macfb.c         | 361 ++++++++++++++++++++++++++++++++++---
 hw/display/trace-events    |   7 +
 hw/m68k/q800.c             |  23 ++-
 include/hw/display/macfb.h |  43 +++++
 4 files changed, 404 insertions(+), 30 deletions(-)

-- 
2.20.1


