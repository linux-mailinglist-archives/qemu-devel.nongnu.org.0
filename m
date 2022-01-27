Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F9849ECE9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 21:59:36 +0100 (CET)
Received: from localhost ([::1]:34288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDBrj-0001OH-1i
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 15:59:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBmd-0007IJ-CX
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:54:19 -0500
Received: from [2001:41c9:1:41f::167] (port=36798
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBmb-0004uZ-Nq
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:54:19 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBm5-000BHM-KQ; Thu, 27 Jan 2022 20:53:49 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Thu, 27 Jan 2022 20:53:54 +0000
Message-Id: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 00/11] mos6522: switch to gpios,
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Patches 9 and 10 implement edge-triggering for the CA1/2 and CB1/2 control lines as
documented in the datasheet, including updating the relevant inputs for negative
edge-triggering if required. Note that the introduction of last_irq_levels to enable
detection of the edge transition causes a migration break for the q800 and
g3beige/mac99 machines.

Finally patch 11 removes some old code in the PMU mos6522 instance which is now no
longer required with these latest changes.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (11):
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
  mos6522: implement edge-triggering for CA1/2 and CB1/2 control line
    IRQs
  macio/pmu.c: remove redundant code

 hmp-commands-info.hx        |  12 ++
 hw/m68k/q800.c              |   9 +-
 hw/misc/mac_via.c           |  68 ++++--------
 hw/misc/macio/cuda.c        |   8 +-
 hw/misc/macio/pmu.c         |  40 +------
 hw/misc/mos6522.c           | 212 +++++++++++++++++++++++++++++++++---
 hw/misc/trace-events        |   4 +-
 include/hw/misc/mac_via.h   |  25 ++---
 include/hw/misc/macio/pmu.h |   2 -
 include/hw/misc/mos6522.h   |  42 +++++--
 10 files changed, 288 insertions(+), 134 deletions(-)

-- 
2.20.1


