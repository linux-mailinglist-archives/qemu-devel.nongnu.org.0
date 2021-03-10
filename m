Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B353333AA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 04:13:20 +0100 (CET)
Received: from localhost ([::1]:44854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJpHj-0004QB-Jz
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 22:13:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJpFs-0002eB-PL; Tue, 09 Mar 2021 22:11:24 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:63538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJpFp-0006al-HU; Tue, 09 Mar 2021 22:11:24 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A56B7746392;
 Wed, 10 Mar 2021 04:11:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7FFEB7456B7; Wed, 10 Mar 2021 04:11:18 +0100 (CET)
Message-Id: <cover.1615345138.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v7 0/8] Pegasos2 emulation
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Wed, 10 Mar 2021 03:58:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, f4bug@amsat.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This is adding a new PPC board called pegasos2. More info on it can be
found at:

https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2

Currently it needs a firmware ROM image that I cannot include due to
original copyright holder (bPlan) did not release it under a free
licence but I have plans to write a replacement in the future. With
the original board firmware it can boot MorphOS now as:

qemu-system-ppc -M pegasos2 -cdrom morphos.iso -device ati-vga,romfile="" -serial stdio

then enter "boot cd boot.img" at the firmware "ok" prompt as described
in the MorphOS.readme. To boot Linux use same command line with e.g.
-cdrom debian-8.11.0-powerpc-netinst.iso then enter
"boot cd install/pegasos"

The last patch adds the actual board code after previous patches
adding VT8231 and MV64361 system controller chip emulation.

Regards,
BALATON Zoltan

v7: Fix errp usage in patch 2

v6: Rebased on master, updated commit message about migration change

v5: Changes for review comments from David and Philippe

V4: Rename pegasos2_reset to pegasos2_cpu_reset
    Add new files to MAINTAINERS

BALATON Zoltan (7):
  vt82c686: Implement control of serial port io ranges via config regs
  vt82c686: QOM-ify superio related functionality
  vt82c686: Add VT8231_SUPERIO based on VIA_SUPERIO
  vt82c686: Introduce abstract TYPE_VIA_ISA and base vt82c686b_isa on it
  vt82c686: Add emulation of VT8231 south bridge
  hw/pci-host: Add emulation of Marvell MV64361 PPC system controller
  hw/ppc: Add emulation of Genesi/bPlan Pegasos II

Philippe Mathieu-Daudé (1):
  hw/isa/Kconfig: Add missing dependency VIA VT82C686 -> APM

 MAINTAINERS                             |  10 +
 default-configs/devices/ppc-softmmu.mak |   2 +
 hw/isa/Kconfig                          |   1 +
 hw/isa/vt82c686.c                       | 517 +++++++++++--
 hw/pci-host/Kconfig                     |   4 +
 hw/pci-host/meson.build                 |   2 +
 hw/pci-host/mv64361.c                   | 966 ++++++++++++++++++++++++
 hw/pci-host/mv643xx.h                   | 918 ++++++++++++++++++++++
 hw/pci-host/trace-events                |   6 +
 hw/ppc/Kconfig                          |   9 +
 hw/ppc/meson.build                      |   2 +
 hw/ppc/pegasos2.c                       | 144 ++++
 include/hw/isa/vt82c686.h               |   2 +-
 include/hw/pci-host/mv64361.h           |   8 +
 include/hw/pci/pci_ids.h                |   4 +-
 15 files changed, 2512 insertions(+), 83 deletions(-)
 create mode 100644 hw/pci-host/mv64361.c
 create mode 100644 hw/pci-host/mv643xx.h
 create mode 100644 hw/ppc/pegasos2.c
 create mode 100644 include/hw/pci-host/mv64361.h

-- 
2.21.3


