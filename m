Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A30E50D3A6
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 18:52:45 +0200 (CEST)
Received: from localhost ([::1]:40098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nifTV-0004jA-Hb
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 12:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifQp-0001yC-5s; Sun, 24 Apr 2022 12:49:55 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:36086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifQn-0000r5-FU; Sun, 24 Apr 2022 12:49:54 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifPm-000BIt-N7; Sun, 24 Apr 2022 17:48:54 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Sun, 24 Apr 2022 17:49:24 +0100
Message-Id: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 00/11] scsi: add quirks and features to support m68k Macs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Here are the next set of patches from my ongoing work to allow the q800
machine to boot MacOS related to SCSI devices.

The first patch implements a dummy FORMAT UNIT command which is used by
the Apple HD SC Setup program when preparing an empty disk to install
MacOS.

Patch 2 adds a new quirks bitmap to SCSIDiskState to allow buggy and/or
legacy features to enabled on an individual device basis. Once the quirks
bitmap has been added, patch 3 uses the quirks feature to implement an
Apple-specific mode page which is required to allow the disk to be recognised
and used by Apple HD SC Setup.

Patch 4 adds compat_props to the q800 machine which enable the new
MODE_PAGE_APPLE_VENDOR quirk for all scsi-hd devices attached to the machine.

Patch 5 adds a new quirk to force SCSI CDROMs to always return the block
descriptor for a MODE SENSE command which is expected by A/UX, whilst patch 6
enables the quirk for all scsi-cd devices on the q800 machine.

Patch 7 adds support for truncated MODE SELECT requests which are sent by
A/UX (and also MacOS in some circumstances) when enumerating a SCSI CDROM device
which are shown to be accepted on real hardware as documented in [1].

Patch 8 allows the MODE_PAGE_R_W_ERROR AWRE bit to be changeable since the A/UX
MODE SELECT request sets this bit to 0 rather than the QEMU default which is 1.

Patch 9 adds support for setting the CDROM block size via a MODE SELECT request
which is supported by older CDROMs to allow the block size to be changed from
the default of 2048 bytes to 512 bytes for compatibility purposes. This is used
by A/UX which otherwise fails with SCSI errors if the block size is not set to
512 bytes when accessing CDROMs.

Finally patches 10 and 11 augment the compat_props to set the default vendor,
product and version information for all scsi-hd and scsi-cd devices attached
to the q800 machine, taken from real drives. This is because MacOS will only
allow a known set of SCSI devices to be recognised during the installation
process.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

[1] https://68kmla.org/bb/index.php?threads/scsi2sd-project-anyone-interested.29040/page-7#post-316444


v2:
- Change patchset title from "scsi: add support for FORMAT UNIT command and quirks"
  to "scsi: add quirks and features to support m68k Macs"
- Fix missing shift in patch 2 as pointed out by Fam
- Rename MODE_PAGE_APPLE to MODE_PAGE_APPLE_VENDOR
- Add SCSI_DISK_QUIRK_MODE_SENSE_ROM_FORCE_DBD quirk
- Add support for truncated MODE SELECT requests
- Allow MODE_PAGE_R_W_ERROR AWRE bit to be changeable for CDROM devices
- Allow the MODE SELECT block descriptor to set the CDROM block size


Mark Cave-Ayland (11):
  scsi-disk: add FORMAT UNIT command
  scsi-disk: add new quirks bitmap to SCSIDiskState
  scsi-disk: add MODE_PAGE_APPLE_VENDOR quirk for Macintosh
  q800: implement compat_props to enable quirk_mode_page_apple_vendor
    for scsi-hd devices
  scsi-disk: add SCSI_DISK_QUIRK_MODE_SENSE_ROM_FORCE_DBD quirk for
    Macintosh
  q800: implement compat_props to enable quirk_mode_sense_rom_force_dbd
    for scsi-cd devices
  scsi-disk: allow truncated MODE SELECT requests
  scsi-disk: allow the MODE_PAGE_R_W_ERROR AWRE bit to be changeable for
    CDROM drives
  scsi-disk: allow MODE SELECT block descriptor to set the ROM device
    block size
  q800: add default vendor and product information for scsi-hd devices
  q800: add default vendor and product information for scsi-cd devices

 hw/m68k/q800.c           | 13 ++++++++++
 hw/scsi/scsi-disk.c      | 53 +++++++++++++++++++++++++++++++++++-----
 hw/scsi/trace-events     |  3 +++
 include/hw/scsi/scsi.h   |  4 +++
 include/scsi/constants.h |  1 +
 5 files changed, 68 insertions(+), 6 deletions(-)

-- 
2.20.1


