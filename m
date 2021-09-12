Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4B0407C45
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 09:52:26 +0200 (CEST)
Received: from localhost ([::1]:59874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPKHp-0004mP-6m
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 03:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKEz-0002Hq-CZ
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 03:49:29 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:34982
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKEx-0002IL-Pz
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 03:49:29 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKEn-00034U-QX; Sun, 12 Sep 2021 08:49:21 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Sun, 12 Sep 2021 08:48:54 +0100
Message-Id: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 00/20] nubus: bus, device, bridge,
 IRQ and address space improvements
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

This patchset is the next set of changes required to boot MacOS on the q800 machine. The
main aim of these patches is to improve the Nubus support so that devices can be plugged
into the Nubus from the command line i.e.

    -device nubus-macfb[,romfile=decl.rom]

At the moment the only device that can be plugged into the Nubus is the macfb framebuffer
however with these changes it is possible to take a ROM from a real Nubus card and
attempt to use it in QEMU, and also allow for future interfaces such as virtio.

Patches 1 to 6 move the logic which manages bus addresses from the NubusDevice into
the NubusBus itself, including the introduction of a bitmap to manage available
slots on the bus.

Patches 7 and 8 change the handling for unassigned (empty) slots to generate a bus
fault and add trace events to allow logging of empty slot accesses during Nubus
enumeration.

Patches 9 to 11 remove the existing stubs for generating the format block (the epilogue
of the Nubus device embedded ROM consisting of metadata and a checksum) and replace them
with a romfile device property to allow the entire Nubus ROM to be loaded from a file
into the ROM area, similar to a PCI option ROM.

Patch 12 moves the Nubus into its own separate address space whilst patches 13 to 17
update the NubusBridge (and MacNubusBridge) devices to allow machines to map the
required slots from the Nubus address space using sysbus_mmio_map().

Finally patches 18 to 20 add support for Nubus IRQs and wire them up appropriately for
the q800 machine through VIA2, which is required for the next set of macfb updates.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (20):
  nubus-device: rename slot_nb variable to slot
  nubus-device: expose separate super slot memory region
  nubus-device: add device slot parameter
  nubus: use bitmap to manage available slots
  nubus: move slot bitmap checks from NubusDevice realize() to BusClass
    check_address()
  nubus: implement BusClass get_dev_path()
  nubus: add trace-events for unassigned slot accesses
  nubus: generate bus error when attempting to access empty slots
  macfb: don't register declaration ROM
  nubus-device: remove nubus_register_rom() and
    nubus_register_format_block()
  nubus-device: add romfile property for loading declaration ROMs
  nubus: move nubus to its own 32-bit address space
  nubus-bridge: introduce separate NubusBridge structure
  mac-nubus-bridge: rename MacNubusState to MacNubusBridge
  nubus: move NubusBus from mac-nubus-bridge to nubus-bridge
  nubus-bridge: embed the NubusBus object directly within nubus-bridge
  nubus-bridge: make slot_available_mask a qdev property
  nubus: add support for slot IRQs
  q800: wire up nubus IRQs
  q800: configure nubus available slots for Quadra 800

 hw/display/macfb.c                  |   6 -
 hw/m68k/q800.c                      |  24 ++-
 hw/nubus/mac-nubus-bridge.c         |  28 +++-
 hw/nubus/nubus-bridge.c             |  23 ++-
 hw/nubus/nubus-bus.c                | 117 +++++++++++---
 hw/nubus/nubus-device.c             | 226 ++++++++--------------------
 hw/nubus/trace-events               |   7 +
 hw/nubus/trace.h                    |   1 +
 include/hw/nubus/mac-nubus-bridge.h |   9 +-
 include/hw/nubus/nubus.h            |  47 +++---
 meson.build                         |   1 +
 11 files changed, 263 insertions(+), 226 deletions(-)
 create mode 100644 hw/nubus/trace-events
 create mode 100644 hw/nubus/trace.h

-- 
2.20.1


