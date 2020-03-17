Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9510E1888D7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 16:16:16 +0100 (CET)
Received: from localhost ([::1]:34474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEDx1-0000TG-Jx
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 11:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jEDuf-00077g-T9
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:13:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jEDue-0001IU-Kl
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:13:49 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:49473)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jEDua-0000sV-R0; Tue, 17 Mar 2020 11:13:45 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C9318747E16;
 Tue, 17 Mar 2020 16:13:42 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 52231745953; Tue, 17 Mar 2020 16:13:42 +0100 (CET)
Message-Id: <cover.1584457537.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 0/8] Misc hw/ide legacy clean up
Date: Tue, 17 Mar 2020 16:05:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: qemu-devel@nongnu.org,
    qemu-block@nongnu.org
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, hpoussin@reactos.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid problems from reassigning variable in piix4_create and fix
compilation problem with mips_r4k

BALATON Zoltan (8):
  hw/ide: Get rid of piix3_init functions
  hw/isa/piix4.c: Introduce variable to store devfn
  hw/ide: Get rid of piix4_init function
  hw/ide: Remove now unneded #include "hw/pci/pci.h" from hw/ide.h
  hw/ide/pci.c: Coding style update to fix checkpatch errors
  hw/ide: Do ide_drive_get() within pci_ide_create_devs()
  hw/ide: Move MAX_IDE_DEVS define to hw/ide/internal.h
  hw/ide: Remove unneeded inclusion of hw/ide.h

 hw/alpha/dp264.c              | 13 +++----------
 hw/hppa/hppa_sys.h            |  1 -
 hw/hppa/machine.c             |  1 -
 hw/i386/pc_piix.c             | 18 +++++++++---------
 hw/ide/ahci_internal.h        |  1 +
 hw/ide/pci.c                  | 11 +++++++----
 hw/ide/piix.c                 | 31 +------------------------------
 hw/isa/piix4.c                | 23 ++++++++++-------------
 hw/mips/mips_fulong2e.c       |  5 +----
 hw/mips/mips_malta.c          |  2 +-
 hw/mips/mips_r4k.c            |  1 +
 hw/ppc/mac_newworld.c         |  1 -
 hw/ppc/mac_oldworld.c         |  1 -
 hw/ppc/prep.c                 |  1 -
 hw/sparc64/sun4u.c            |  6 +-----
 include/hw/ide.h              |  6 ------
 include/hw/ide/internal.h     |  2 ++
 include/hw/ide/pci.h          |  3 ++-
 include/hw/misc/macio/macio.h |  1 +
 include/hw/southbridge/piix.h |  3 +--
 20 files changed, 41 insertions(+), 90 deletions(-)

--=20
2.21.1


