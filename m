Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85982E7A79
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:41:25 +0100 (CET)
Received: from localhost ([::1]:42274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kudbI-0001m9-Dj
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYC-00008O-A7
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:38:12 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50714
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudY7-0001vm-Jf
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:38:12 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudXu-00070L-F7; Wed, 30 Dec 2020 15:38:00 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:20 +0000
Message-Id: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 00/25] esp: consolidate PDMA transfer buffers
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

- Patches 1-4 are minor patches which make esp.c checkpatch friendly whilst also
  fixing up some trace events ready for later patches in the series
  
- Patches 5-11 unify the DMA transfer count. In particular there are 2 synthetic
  variables dma_counter and dma_left within ESPState which do not need to exist. 
  DMA transfer lengths are programmed into the TC (transfer count) register which is 
  decremented for each byte transferred, generating an interrupt when it reaches zero.
  These patches add helper functions to read the TC and STC registers directly and
  remove these synthetic variables so that the DMA transfer length is now tracked in
  a single place.

- Now that the TC register represents the authoritative DMA transfer length, patches
  12-20 work to eliminate the separate PDMA variables pdma_start, pdma_cur, pdma_len
  and separate PDMA buffers PDMA and CMD. The PDMA position variables can be replaced
  by the existing ESP cmdlen and ti_wptr/ti_rptr, whilst the FIFO (TI) buffer is used
  for incoming data with commands being accumulated in cmdbuf as per standard DMA
  requests.

- Patches 21 and 22 fix the detection of missing SCSI targets by the MacOS toolbox ROM
  on startup at which point it will attempt to start reading information from a CDROM
  attached to the q800 machine.

- Patch 23 is the main rework of the PDMA buffer transfers: instead of tracking the
  SCSI transfers using a separate ASYNC pdma_origin, the contents of the ESPState
  async_buf are copied to the FIFO buffer in 16-byte chunks with the transfer status
  and IRQs being set accordingly.

- Patch 24 removes the last separate PDMA variable pdma_origin, including the separate
  PDMA migration subsection which is no longer required (see note below about migration
  compatibility).
  
- Finally patch 25 enables 4 byte PDMA reads/writes over the SCSI bus which are used
  by MacOS when reading the next stage bootloader from CDROM (this is an increase from
  2 bytes currently implemented and used by Linux).


Testing
=======

I've tested this on my SPARC32 OpenBIOS images which include Linux, OpenBSD, NetBSD,
and Solaris and all of these continue to boot as before.

Similarly the q800 m68k Linux test image still boots as before with these patches
applied. It is possible with lots of hacks to load Laurent's EMILE bootloader using
a MacOS toolbox ROM - the hope is to try and start upstreaming more of these changes
as time allows.


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


Mark Cave-Ayland (25):
  esp: checkpatch fixes
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

 hw/scsi/esp.c         | 461 +++++++++++++++++++++++++-----------------
 hw/scsi/trace-events  |   5 +
 include/hw/scsi/esp.h |  20 +-
 3 files changed, 279 insertions(+), 207 deletions(-)

-- 
2.20.1


