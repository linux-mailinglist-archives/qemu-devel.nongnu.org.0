Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AC74CE529
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 15:14:04 +0100 (CET)
Received: from localhost ([::1]:51978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQVAZ-00056q-GO
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 09:14:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQV7b-0006lF-Ry
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:10:59 -0500
Received: from [2001:41c9:1:41f::167] (port=58902
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQV7a-0006sh-47
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:10:59 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQV6q-00082l-Q4; Sat, 05 Mar 2022 14:10:16 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sat,  5 Mar 2022 14:10:32 +0000
Message-Id: <20220305141044.31911-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 00/12] mos6522: switch to gpios,
 add control line edge-triggering and extra debugging
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Here is another patchset taken from my series to enable MacOS to boot on the q800
machine.

Patches 1-3 define the IFR bit flags in terms of the physical control lines and
update mac_via to use them.

Patch 4 does the main switch from custom methods in MOS6522DeviceClass to using
standard gpios whilst patch 5 removes these now-obsolete methods.

Patch 6 updates mos6522 instances to use the recommended method of calling
device_class_set_parent_reset() to propagate the device reset to the parent.

Patches 7 and 8 add more support for debugging guests using the mos6522 devices
by adding register names into the trace-event output and implementing a new
"info via" HMP command to give detailed information about the registers and timer
states.

Patch 9 introduces a new last_irq_levels field within MOS6522State to enable detection
of edge transitions, which is also a migration break for the q800 and g3beige/mac99
machines.

Patch 10 ensures that the SCSI_DATA (DRQ) bit in VIA2 is unlatched since in the q800
machine VIA2 is integrated within the on-board logic, and analysis of the MacOS
toolbox ROM suggests that the DRQ bit is expected to be live compared with older
Macs which use a real (latched) VIA.

Patches 11 implement edge-triggering for the CA1/2 and CB1/2 control lines as
documented in the datasheet, including updating the relevant inputs for negative
edge-triggering if required.

Finally patch 12 removes some old code in the PMU mos6522 instance which is now no
longer required with these latest changes.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

v3:
- Rebase onto master
- Add R-B tags from Laurent
- Introduce MOS6522_NUM_REGS in patch 7 as suggested by Phil

v2:
- Update patches 1-3 to use the BIT() macro
- Add R-B tags from Peter
- Update "info via" patch to use a target-specific HMP command as discussed on-list
- Add patch 10 "mac_via: make SCSI_DATA (DRQ) bit live rather than latched"


Mark Cave-Ayland (12):
  mos6522: add defines for IFR bit flags
  mac_via: use IFR bit flag constants for VIA1 IRQs
  mac_via: use IFR bit flag constants for VIA2 IRQs
  mos6522: switch over to use qdev gpios for IRQs
  mos6522: remove update_irq() and set_sr_int() methods from
    MOS6522DeviceClass
  mos6522: use device_class_set_parent_reset() to propagate reset to
    parent
  mos6522: add register names to register read/write trace events
  mos6522: add "info via" HMP command for debugging
  mos6522: record last_irq_levels in mos6522_set_irq()
  mac_via: make SCSI_DATA (DRQ) bit live rather than latched
  mos6522: implement edge-triggering for CA1/2 and CB1/2 control line
    IRQs
  macio/pmu.c: remove redundant code

 hmp-commands-info.hx         |  15 +++
 hw/m68k/q800.c               |   9 +-
 hw/misc/mac_via.c            |  87 ++++++--------
 hw/misc/macio/cuda.c         |   8 +-
 hw/misc/macio/pmu.c          |  40 +------
 hw/misc/mos6522.c            | 226 ++++++++++++++++++++++++++++++++---
 hw/misc/trace-events         |   4 +-
 include/hw/misc/mac_via.h    |  46 ++++---
 include/hw/misc/macio/pmu.h  |   2 -
 include/hw/misc/mos6522.h    |  46 +++++--
 include/monitor/hmp-target.h |   1 +
 11 files changed, 337 insertions(+), 147 deletions(-)

-- 
2.20.1


