Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAA5554570
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:55:41 +0200 (CEST)
Received: from localhost ([::1]:42870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3y1M-0006bc-GD
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzU-0003Xw-Jl; Wed, 22 Jun 2022 06:53:45 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzS-0005Qu-TE; Wed, 22 Jun 2022 06:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s4D+74/x79Kbi0ytDFlXUpFXd8T6H404uDYoAwj07o0=; b=Z6DQyCTv0Qqm7s0zjRCNRHcMup
 XIIdOImcpGlgWmrJUQVeYgFwqz8vcn5ESn6JJQ3nS9k9L6EHauQRYMSDo3aPwaEqX2JlIVRoJkCE5
 XOCylbThbaLsXh/6CDp7CnzVDmmFe0xsAsmGbcFVQGD2QK7xZm1ch7oI0x+un77x5U6KG88FOjICh
 /S87xDaB/XqXnw4j1yyoQ11EKX+s5Vc6OAWDhrujJ82mT/PYIsA6omshU4ib2UFnWQuGL/xHrh1lv
 kVYvsnrINK3JP/XoiabWWfpnwCCnKc3itGMokKn1GFZrqvE4QoXRIEBgNz13upEWhXZtCjfgF+lLn
 yuavc2rK/iFy5Qjoeb+JZt6fJyyOCCVG0OQiZbRrHnr+qQX3kNcDYVY2ss+piOoPakNyPu67dQZGN
 OsiJq136EfWCiILW6dDvqHm4fWwerd9BIZ+Fl0F0akdjNVF1c4DRQIdyhFR9A4rWxiKZ8KP0ax6Ep
 fiGGnvzWQKZCdPAtlYLDMlrPWuiiTic35ZfFkdVg4tJRoIG2phFB+26+xKcI3Xybp31jp+Y1NgcOF
 dyNDiY17qktRQaVU33h9w4SlcWZ3GOmNbVKt/eIRvwmyzf89LVhSimvifU9EwTpoGgFQtBjTBFmH6
 baMDAblUt5BMdPgB+fJ42sP6Ps0qha1TH2e/NtvwM=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xy8-000CTX-L9; Wed, 22 Jun 2022 11:52:24 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Wed, 22 Jun 2022 11:53:00 +0100
Message-Id: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 00/14] scsi: add quirks and features to support m68k Macs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Patch 1 adds a new quirks bitmap to SCSIDiskState to allow buggy and/or
legacy features to enabled on an individual device basis. Once the quirks
bitmap has been added, patch 2 uses the quirks feature to implement an
Apple-specific mode page which is required to allow the disk to be recognised
and used by Apple HD SC Setup.

Patch 3 adds compat_props to the q800 machine which enable the new
MODE_PAGE_APPLE_VENDOR quirk for all scsi-cd devices attached to the machine.

Patch 4 adds a new quirk to force SCSI CDROMs to always honour the block
descriptor for a MODE SENSE command which is expected by A/UX, whilst patch 5
enables the quirk for all scsi-cd devices on the q800 machine.

Patches 6 and 7 implement a new MODE_PAGE_VENDOR_SPECIFIC_APPLE quirk to
allow PF=0 MODE SELECT requests which are used by both MacOS and A/UX, along
with a MODE_PAGE_VENDOR_SPECIFIC (0x0) mode page compatible with MacOS. Once
again this quirk is only enabled for SCSI devices on the q800 machine.

Patch 8 implements a dummy FORMAT UNIT command which is used by the Apple HD SC
Setup program when preparing an empty disk to install MacOS.

Patches 9 and 10 add support for allowing truncated MODE SELECT requests which are
sent by A/UX when enumerating a SCSI CDROM device. Allowing these broken requests
is protected by a new MODE_PAGE_TRUNCATED quirk which is only enabled for SCSI
CDROM devices attached to the q800 machine.

Patch 11 allows the MODE_PAGE_R_W_ERROR AWRE bit to be changeable since the A/UX
MODE SELECT request sets this bit to 0 rather than the QEMU default which is 1.

Patch 12 adds support for setting the SCSI block size via a MODE SELECT request
which is most commonly used by older CDROMs to allow the block size to be changed
from the default of 2048 bytes to 512 bytes for compatibility purposes. This is
used by A/UX which otherwise fails with SCSI errors if the block size is not set
to 512 bytes when accessing CDROMs.

Finally patches 13 and 14 augment the compat_props to set the default vendor,
product and version information for all scsi-hd and scsi-cd devices attached
to the q800 machine, taken from real drives. This is because MacOS will only
allow a known set of SCSI devices to be detected and initialised during the
installation process.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

v3:
[Note from v2: this series has changed in structure and functionality based upon
bug reports from Howard off-list regarding detection/changing of CDROM media in
both A/UX and MacOS]

- Rearrange order to aid bisecting differences between CDROM and DISK quirks
- Add R-B tags from Laurent and Phil
- Replace %zd with %zu in trace-events in patch 8
- Add a new SCSI_DISK_QUIRK_MODE_PAGE_TRUNCATED quirk to handle truncated MODE SELECT
  requests
- Rename SCSI_DISK_QUIRK_MODE_SENSE_ROM_FORCE_DBD quirk to
  SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD since due to additional changes in this series
  the DBD bit can be honoured rather than forced off
- Add support for PF=0 MODE SELECT commands a and new MODE_PAGE_VENDOR_SPECIFIC (0x0) page
  with a suitable implementation for MacOS protected by a new
  SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE quirk (this fixes detection of CDROM
  media in some cases)
- Allow the SCSI block size to be set for both CDROMs and DISKs as requested by Paolo

v2:
- Change patchset title from "scsi: add support for FORMAT UNIT command and quirks"
  to "scsi: add quirks and features to support m68k Macs"
- Fix missing shift in patch 2 as pointed out by Fam
- Rename MODE_PAGE_APPLE to MODE_PAGE_APPLE_VENDOR
- Add SCSI_DISK_QUIRK_MODE_SENSE_ROM_FORCE_DBD quirk
- Add support for truncated MODE SELECT requests
- Allow MODE_PAGE_R_W_ERROR AWRE bit to be changeable for CDROM devices
- Allow the MODE SELECT block descriptor to set the CDROM block size


Mark Cave-Ayland (14):
  scsi-disk: add new quirks bitmap to SCSIDiskState
  scsi-disk: add MODE_PAGE_APPLE_VENDOR quirk for Macintosh
  q800: implement compat_props to enable quirk_mode_page_apple_vendor
    for scsi-cd devices
  scsi-disk: add SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD quirk for
    Macintosh
  q800: implement compat_props to enable quirk_mode_sense_rom_use_dbd
    for scsi-cd devices
  scsi-disk: add SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE quirk
    for Macintosh
  q800: implement compat_props to enable
    quirk_mode_page_vendor_specific_apple for scsi devices
  scsi-disk: add FORMAT UNIT command
  scsi-disk: add SCSI_DISK_QUIRK_MODE_PAGE_TRUNCATED quirk for Macintosh
  q800: implement compat_props to enable quirk_mode_page_truncated for
    scsi-cd devices
  scsi-disk: allow the MODE_PAGE_R_W_ERROR AWRE bit to be changeable for
    CDROM drives
  scsi-disk: allow MODE SELECT block descriptor to set the block size
  q800: add default vendor and product information for scsi-hd devices
  q800: add default vendor and product information for scsi-cd devices

 hw/m68k/q800.c           | 16 +++++++
 hw/scsi/scsi-disk.c      | 96 +++++++++++++++++++++++++++++++++++++---
 hw/scsi/trace-events     |  3 ++
 include/hw/scsi/scsi.h   |  6 +++
 include/scsi/constants.h |  2 +
 5 files changed, 116 insertions(+), 7 deletions(-)

-- 
2.30.2


