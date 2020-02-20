Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65043165771
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 07:17:47 +0100 (CET)
Received: from localhost ([::1]:36668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4f9e-0000aU-4x
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 01:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56233)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1j4f8V-0007qj-5B
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 01:16:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1j4f8T-000558-KI
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 01:16:34 -0500
Received: from [107.174.27.60] (port=52466 helo=ozlabs.ru)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1j4f8T-00054W-Es; Thu, 20 Feb 2020 01:16:33 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 21AA4AE80017;
 Thu, 20 Feb 2020 01:14:56 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH qemu v7 0/5] spapr: Kill SLOF
Date: Thu, 20 Feb 2020 17:16:17 +1100
Message-Id: <20200220061622.15064-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 107.174.27.60
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is another attempt to implement minimalistic
Open Firmware Client Interface in QEMU.

With this thing, I can boot unmodified Ubuntu 18.04 and Fedora 30
directly from the disk without SLOF.

A useful discussion happened esrlier:
https://lore.kernel.org/qemu-devel/f881c2e7-be92-9695-6e19-2dd88cbc63c1@ozlabs.ru/

5/5 is kind of controvertial though. This respin does not include
networking.

This is based on sha1
015fb0ead60d Chen Qun "hw/ppc/virtex_ml507:fix leak of fdevice tree blob".

Please comment. Thanks.



Alexey Kardashevskiy (5):
  ppc/spapr: Move GPRs setup to one place
  spapr/spapr: Make vty_getchars public
  spapr/cas: Separate CAS handling from rebuilding the FDT
  spapr: Implement Open Firmware client interface
  spapr/vof: Add basic support for MBR/GPT/GRUB

 hw/ppc/Makefile.objs            |    1 +
 pc-bios/vof/Makefile            |   18 +
 include/hw/ppc/spapr.h          |   27 +-
 include/hw/ppc/spapr_cpu_core.h |    4 +-
 include/hw/ppc/spapr_vio.h      |    1 +
 pc-bios/vof/vof.h               |   63 ++
 hw/char/spapr_vty.c             |    2 +-
 hw/ppc/spapr.c                  |   69 +-
 hw/ppc/spapr_cpu_core.c         |    6 +-
 hw/ppc/spapr_hcall.c            |   73 +-
 hw/ppc/spapr_of_client.c        | 1285 +++++++++++++++++++++++++++++++
 hw/ppc/spapr_rtas.c             |    2 +-
 pc-bios/vof/bootblock.c         |  242 ++++++
 pc-bios/vof/bootmem.c           |   13 +
 pc-bios/vof/ci.c                |  147 ++++
 pc-bios/vof/elf32.c             |  273 +++++++
 pc-bios/vof/libc.c              |   91 +++
 pc-bios/vof/main.c              |   24 +
 hw/ppc/trace-events             |   25 +
 pc-bios/README                  |    2 +
 pc-bios/vof.bin                 |  Bin 0 -> 9180 bytes
 pc-bios/vof/entry.S             |   58 ++
 pc-bios/vof/l.lds               |   48 ++
 23 files changed, 2429 insertions(+), 45 deletions(-)
 create mode 100644 pc-bios/vof/Makefile
 create mode 100644 pc-bios/vof/vof.h
 create mode 100644 hw/ppc/spapr_of_client.c
 create mode 100644 pc-bios/vof/bootblock.c
 create mode 100644 pc-bios/vof/bootmem.c
 create mode 100644 pc-bios/vof/ci.c
 create mode 100644 pc-bios/vof/elf32.c
 create mode 100644 pc-bios/vof/libc.c
 create mode 100644 pc-bios/vof/main.c
 create mode 100755 pc-bios/vof.bin
 create mode 100644 pc-bios/vof/entry.S
 create mode 100644 pc-bios/vof/l.lds

-- 
2.17.1


