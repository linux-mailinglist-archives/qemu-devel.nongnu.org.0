Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5953B3CD6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 08:56:14 +0200 (CEST)
Received: from localhost ([::1]:48680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwfl7-0007xp-Ej
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 02:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwfjD-0005fu-Pv
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 02:54:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:58682
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwfjA-0001ml-Kw
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 02:54:15 -0400
Received: from host109-153-84-9.range109-153.btcentralplus.com ([109.153.84.9]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwfir-0006FO-Da; Fri, 25 Jun 2021 07:53:57 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 jasowang@redhat.com, fthain@telegraphics.com.au, laurent@vivier.eu
Date: Fri, 25 Jun 2021 07:53:51 +0100
Message-Id: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 00/10] dp8393x: fixes for MacOS toolbox ROM
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

The discussion for the v1 patchset concluded that the dp8393x device does
NOT have its own NVRAM (there is no mention of it on the datasheet) and so
patches 3 to 5 move the generation of the PROM to the q800 and jazz boards
separately to allow the formats to diverge.

Patch 6 adds an implementation of bitrev8 to bitops.h in preparation for
changing the q800 PROM storage format, whilst patch 7 updates the MAC address
storage and checksum for the q800 machine to match the format expected by the
MacOS toolbox ROM.

Patch 8 ensures that the CPU loads/stores are correctly converted to 16-bit
accesses for the network card and patch 9 fixes a bug when selecting the
index specified for CAM entries.

Finally since the MIPS magnum machine exists for both big-endian (mips64) and
little-endian (mips64el) configurations, patch 10 sets the dp8393x big_endian
property accordingly using a similar technique already used for the MIPS malta
machines.

Migration notes: the changes to the dp8393x PROM are a migration break, but we
don't care about this for now since a) the q800 machine will have more
breaking migration changes as further MacOS toolbox ROM support is upstreamed
and b) the magnum machine migration is currently broken (and has been for
quite some time).

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


v2:
- Move PROM generation from dp8393x to q800 and magnum machines and remove
  the existing code from the device itself
- Add bitrev8 implementation to bitops.h so it can be used elsewhere in
  future. Use a shift/merge technique rather than a massive table lookup
  as we don't care about speed
- Add patch to set the big_endian property correctly depending upon whether
  a big-endian or little-endian configuration is being used


Mark Cave-Ayland (10):
  dp8393x: checkpatch fixes
  dp8393x: convert to trace-events
  hw/mips/jazz: move PROM and checksum calculation from dp8393x device
    to board
  hw/m68k/q800: move PROM and checksum calculation from dp8393x device
    to board
  dp8393x: remove onboard PROM containing MAC address and checksum
  qemu/bitops.h: add bitrev8 implementation
  hw/m68k/q800: fix PROM checksum and MAC address storage
  dp8393x: don't force 32-bit register access
  dp8393x: fix CAM descriptor entry index
  hw/mips/jazz: specify correct endian for dp8393x device

 hw/m68k/q800.c        |  21 ++-
 hw/mips/jazz.c        |  32 ++++-
 hw/net/dp8393x.c      | 313 +++++++++++++++++++-----------------------
 hw/net/trace-events   |  17 +++
 include/qemu/bitops.h |  22 +++
 5 files changed, 231 insertions(+), 174 deletions(-)

-- 
2.20.1


