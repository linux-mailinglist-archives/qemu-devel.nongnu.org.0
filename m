Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D46B31570D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:47:00 +0100 (CET)
Received: from localhost ([::1]:59796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YyR-0004ZV-Bl
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yie-0003iX-9X
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:30:40 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56724
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YiY-0001zG-MC
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:30:38 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yil-0007pt-VT; Tue, 09 Feb 2021 19:30:52 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:29:36 +0000
Message-Id: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 00/42] esp: consolidate PDMA transfer buffers and other
 fixes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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

This patch series comes from an experimental branch that I've been working on
to try and boot a MacOS toolbox ROM under the QEMU q800 machine. The effort is
far from complete, but it seems worth submitting these patches separately since
they are limited to the ESP device and form a substantial part of the work to
date.

As part of Laurent's recent q800 work so-called PDMA (pseudo-DMA) support was
added to the ESP device. This is whereby the DREQ (DMA request) line is used
to signal to the host CPU that it can transfer data to/from the device over
the SCSI bus.

The existing PDMA tracks 4 separate transfer data sources as indicated by the
ESP pdma_origin variable: PDMA, TI, CMD and ASYNC with an independent variable
pdma_len to store the transfer length. This works well with Linux which uses a
single PDMA request to transfer a number of sectors in a single request.

Unfortunately the MacOS toolbox ROM has other ideas here: it sends data to the
ESP as a mixture of FIFO and PDMA transfers and then uses a mixture of the FIFO
and DMA counters to confirm that the correct number of bytes have been
transferred. For this to work correctly the PDMA buffers and separate pdma_len
transfer counter must be consolidated into the FIFO to allow mixing of both
types of transfer within a single request.

The patchset is split into several sections:

- Patches 1-7 are minor patches which make esp.c checkpatch friendly, QOMify ESPState,
  and also fix up some trace events ready for later patches in the series

- Patches 8-13 unify the DMA transfer count. In particular there are 2 synthetic
  variables dma_counter and dma_left within ESPState which do not need to exist. 
  DMA transfer lengths are programmed into the TC (transfer count) register which is 
  decremented for each byte transferred, generating an interrupt when it reaches zero.
  These patches add helper functions to read the TC and STC registers directly and
  remove these synthetic variables so that the DMA transfer length is now tracked in
  a single place.

- Now that the TC register represents the authoritative DMA transfer length, patches
  14-25 work to eliminate the separate PDMA variables pdma_start, pdma_cur, pdma_len
  and separate PDMA buffers PDMA and CMD. The PDMA position variables can be replaced
  by the existing ESP cmdlen and ti_wptr/ti_rptr, whilst the FIFO (TI) buffer is used
  for incoming data with commands being accumulated in cmdbuf as per standard DMA
  requests.

- Patches 26 and 27 fix the detection of missing SCSI targets by the MacOS toolbox ROM
  on startup at which point it will attempt to start reading information from a CDROM
  attached to the q800 machine.

- Patch 28 is the main rework of the PDMA buffer transfers: instead of tracking the
  SCSI transfers using a separate ASYNC pdma_origin, the contents of the ESPState
  async_buf are copied to the FIFO buffer in 16-byte chunks with the transfer status
  and IRQs being set accordingly.

- Patch 29 removes the last separate PDMA variable pdma_origin, including the separate
  PDMA migration subsection which is no longer required (see note below about migration
  compatibility).
  
- Patch 30 enables 4 byte PDMA reads/writes over the SCSI bus which are used by MacOS
  when reading the next stage bootloader from CDROM (this is an increase from
  2 bytes currently implemented and used by Linux).

- Patches 31-34 fix an issue whereby the MacOS toolbox ROM tries to read incoming data
  from the target within a few instructions of receiving the command complete interrupt.
  Since IO is asynchronous in QEMU, it is necessary to delay the command complete
  interrupt for incoming data to avoid underflow.

- Patches 35-37 fix a problem with the SATN and stop command not changing the SCSI bus
  to message out phase. This actually first manifested itself after the Fifo8 conversion
  with guests that mix DMA/non-DMA commands but it is moved forward to aid bisection.

- Patches 38-39 convert ti_buf and cmdbuf from simple arrays to QEMU's Fifo8 type which
  helped locate a handful of bugs around handling the buffer pointers which are
  incorpated within earlier patches within the series.
  
- Finally patches 40-42 add support for the FIFO count registers, non-DMA transfers and
  unaligned accesses which are required for the MacOS toolbox ROM to successful read
  files from disk.

  
Testing
=======

I've tested this on my SPARC32 OpenBIOS images which include Linux, OpenBSD, NetBSD,
and Solaris and all of these continue to boot as before.

Similarly the q800 m68k Linux test image still boots as before with these patches
applied. It is possible with lots of hacks to load Laurent's EMILE bootloader using
a MacOS toolbox ROM - the hope is to try and start upstreaming more of these changes
as time allows.

Many thanks to Guenter Roeck <linux@roeck-us.net> who provided me a test image for
the deferred interrupt test case, and also confirmed the updated version still
worked fine in his tests.


Migration
=========

The patchset ensures that ESP devices without PDMA (i.e. everything except the q800
machine) will migrate successfully. This is fairly simple: the only change required
here is to copy the old synthetic dma_left value over into the TC.

Unfortunately migrating the PDMA subsection is a lot harder due to the change in the
way that the DMA TC and changes to the point at which transfer counters are updated.
For this reason the patchset will not migrate from older q800 snapshots: I don't
believe this to be a problem since some devices are still missing VMStateDescription
plus there are likely to be more breaking changes as the q800 machine matures.


Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


v2:
- Rebase onto master
- Add R-B tags from Philippe
- Add QOMification, Fifo8 conversion, deferred interrupt for incoming data, message
  out phase fixes, non-DMA commands, and unaligned access support


Mark Cave-Ayland (42):
  esp: checkpatch fixes
  esp: rename existing ESP QOM type to SYSBUS_ESP
  esp: QOMify the internal ESP device state
  esp: add vmstate_esp version to embedded ESPState
  esp: add trace event when receiving a TI command
  esp: fix esp_reg_read() trace event
  esp: add PDMA trace events
  esp: determine transfer direction directly from SCSI phase
  esp: introduce esp_get_tc() and esp_set_tc()
  esp: introduce esp_get_stc()
  esp: apply transfer length adjustment when STC is zero at TC load time
  esp: remove dma_counter from ESPState
  esp: remove dma_left from ESPState
  esp: remove minlen restriction in handle_ti
  esp: introduce esp_pdma_read() and esp_pdma_write() functions
  esp: use pdma_origin directly in esp_pdma_read()/esp_pdma_write()
  esp: move pdma_len and TC logic into esp_pdma_read()/esp_pdma_write()
  esp: accumulate SCSI commands for PDMA transfers in cmdbuf instead of
    pdma_buf
  esp: remove buf parameter from do_cmd()
  esp: remove the buf and buflen parameters from get_cmd()
  esp: remove redundant pdma_start from ESPState
  esp: move PDMA length adjustments into
    esp_pdma_read()/esp_pdma_write()
  esp: use ti_wptr/ti_rptr to manage the current FIFO position for PDMA
  esp: use in-built TC to determine PDMA transfer length
  esp: remove CMD pdma_origin
  esp: rename get_cmd_cb() to esp_select()
  esp: fix PDMA target selection
  esp: use FIFO for PDMA transfers between initiator and device
  esp: remove pdma_origin from ESPState
  esp: add 4 byte PDMA read and write transfers
  esp: implement FIFO flush command
  esp: latch individual bits in ESP_RINTR register
  esp: defer command completion interrupt on incoming data transfers
  esp: remove old deferred command completion mechanism  
  esp: raise interrupt after every non-DMA byte transferred to the FIFO
  esp: add maxlen parameter to get_cmd()
  esp: transition to message out phase after SATN and stop command
  esp: convert ti_buf from array to Fifo8
  esp: convert cmdbuf from array to Fifo8
  esp: add trivial implementation of the ESP_RFLAGS register
  esp: implement non-DMA transfers in PDMA mode
  esp: add support for unaligned accesses

 hw/dma/sparc32_dma.c  |   4 +-
 hw/m68k/q800.c        |   4 +-
 hw/mips/jazz.c        |   4 +-
 hw/scsi/esp-pci.c     |  51 ++-
 hw/scsi/esp.c         | 978 +++++++++++++++++++++++++++++-------------
 hw/scsi/trace-events  |   5 +
 hw/sparc/sun4m.c      |   2 +-
 include/hw/scsi/esp.h |  52 +--
 8 files changed, 750 insertions(+), 350 deletions(-)

-- 
2.20.1


