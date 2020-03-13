Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F77918510C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 22:24:55 +0100 (CET)
Received: from localhost ([::1]:37620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCrna-0001X5-Je
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 17:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46466)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jCrlv-0007gF-Th
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 17:23:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jCrlu-0000H2-I9
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 17:23:11 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57629)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jCrlr-0008TE-De; Fri, 13 Mar 2020 17:23:07 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 86837747E19;
 Fri, 13 Mar 2020 22:23:05 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6383D747E0F; Fri, 13 Mar 2020 22:23:05 +0100 (CET)
Message-Id: <cover.1584134074.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 0/8] Misc hw/ide legacy clean up
Date: Fri, 13 Mar 2020 22:14:34 +0100
To: qemu-devel@nongnu.org,
    qemu-block@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, hpoussin@reactos.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are some clean ups to remove more legacy init functions and
lessen dependence on include/hw/ide.h with some simplifications in
board code. There should be no functional change.

BALATON Zoltan (8):
  hw/ide: Get rid of piix3_init functions
  hw/ide: Get rid of piix4_init function
  hw/ide: Remove now unneded #include "hw/pci/pci.h" from hw/ide.h
  hw/ide: Move MAX_IDE_BUS define to one header
  hw/ide/pci.c: Coding style update to fix checkpatch errors
  hw/ide: Do ide_drive_get() within pci_ide_create_devs()
  hw/ide: Move MAX_IDE_DEVS define to hw/ide/internal.h
  hw/ide: Remove unneeded inclusion of hw/ide.h

 hw/alpha/dp264.c              | 15 +++------------
 hw/hppa/hppa_sys.h            |  1 -
 hw/hppa/machine.c             |  3 ---
 hw/i386/pc_piix.c             | 20 +++++++++-----------
 hw/ide/ahci_internal.h        |  1 +
 hw/ide/pci.c                  | 10 ++++++----
 hw/ide/piix.c                 | 31 +------------------------------
 hw/isa/piix4.c                | 14 +++++---------
 hw/mips/mips_fulong2e.c       |  6 +-----
 hw/mips/mips_malta.c          |  6 ++----
 hw/mips/mips_r4k.c            |  4 +---
 hw/ppc/mac_newworld.c         |  2 --
 hw/ppc/mac_oldworld.c         |  2 --
 hw/ppc/prep.c                 |  3 ---
 hw/sparc64/sun4u.c            |  7 +------
 include/hw/ide.h              |  6 ------
 include/hw/ide/internal.h     |  3 +++
 include/hw/ide/pci.h          |  3 ++-
 include/hw/misc/macio/macio.h |  1 +
 include/hw/southbridge/piix.h |  3 +--
 20 files changed, 37 insertions(+), 104 deletions(-)

-- 
2.21.1


