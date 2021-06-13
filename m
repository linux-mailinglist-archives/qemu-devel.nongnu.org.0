Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5099F3A59A2
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 18:39:39 +0200 (CEST)
Received: from localhost ([::1]:40456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsT97-0000vw-Qe
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 12:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsT7P-0006rw-2h
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 12:37:51 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41216
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsT7M-0001Z0-Kx
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 12:37:50 -0400
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsT76-0006x0-Lt; Sun, 13 Jun 2021 17:37:36 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 jasowang@redhat.com
Date: Sun, 13 Jun 2021 17:37:33 +0100
Message-Id: <20210613163738.2141-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.109.72
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/5] dp8393x: fixes for MacOS toolbox ROM
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

Here is the next set of patches from my attempts to boot MacOS under QEMU's
Q800 machine related to the Sonic network adapter.

Patches 1 and 2 sort out checkpatch and convert from DPRINTF macros to
trace-events.

Patch 3 fixes the PROM checksum and MAC address storage format as found by
stepping through the MacOS toolbox.

Patch 4 ensures that the CPU loads/stores are correctly converted to 16-bit
accesses for the network card and patch 5 fixes a bug when selecting the
index specified for CAM entries.

NOTE TO MIPS MAINTAINERS:

- The Sonic network adapter is used as part of the MIPS jazz machine, however
  I don't have a working kernel and system to test it with. Any pointers to
  test images would be appreciated.

- The changes to the PROM checksum in patch 3 were determined by stepping
  through the MacOS toolbox, and is different from the existing algorithm.
  Has the current PROM checksum algorithm been validated on a MIPS guest or
  was it just a guess? It might be that 2 different algorithms are needed for
  the Q800 vs. Jazz machine.

- My current guess is the jazzsonic driver is broken since the last set of
  dp8393x changes as the MIPS jazz machine does not set the "big_endian"
  property on the dp8393x device. I'd expect that the following diff would
  be needed, but I can't confirm this without a suitable test image.

diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 1e1cf8154e..1df67035aa 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -280,6 +280,7 @@ static void mips_jazz_init(MachineState *machine,
             dev = qdev_new("dp8393x");
             qdev_set_nic_properties(dev, nd);
             qdev_prop_set_uint8(dev, "it_shift", 2);
+            qdev_prop_set_bit(dev, "big_endian", true);
             object_property_set_link(OBJECT(dev), "dma_mr",
                                      OBJECT(rc4030_dma_mr), &error_abort);
             sysbus = SYS_BUS_DEVICE(dev);

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

[q800-macos-upstream patchset series: 3]

Mark Cave-Ayland (5):
  dp8393x: checkpatch fixes
  dp8393x: convert to trace-events
  dp8393x: fix PROM checksum and MAC address storage
  dp8393x: don't force 32-bit register access
  dp8393x: fix CAM descriptor entry index

 hw/net/dp8393x.c    | 332 ++++++++++++++++++++++++--------------------
 hw/net/trace-events |  17 +++
 2 files changed, 198 insertions(+), 151 deletions(-)

-- 
2.20.1


