Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A8F2F03D5
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 22:32:20 +0100 (CET)
Received: from localhost ([::1]:55884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyLqM-0007ND-I7
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 16:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyLor-0006ax-C4; Sat, 09 Jan 2021 16:30:45 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:14764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyLoo-0002Ti-2X; Sat, 09 Jan 2021 16:30:44 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 764FE7475FD;
 Sat,  9 Jan 2021 22:30:38 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 45BA074645B; Sat,  9 Jan 2021 22:30:38 +0100 (CET)
Message-Id: <cover.1610224245.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [RFC PATCH v2 0/2] Pegasos2 emulation
Date: Sat, 09 Jan 2021 21:30:45 +0100
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

v2 adds missing file that's omitted from original series, still based
on "[PATCH v2 0/3] Fix up sam460ex fixes"

Based-on: <cover.1610143658.git.balaton@eik.bme.hu>

This is adding a new PPC board called pegasos2 currently posted as RFC
because it depends on not yet merged VT8231 emulation currently under
review. A working version with all patches can be found here:

https://osdn.net/projects/qmiga/scm/git/qemu/tree/pegasos2/

This may need some changes like a test case but I'm posting it now for
getting feedback on what's needed to merge this. More info on it can
be found at:

https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2

Currently it needs a firmware ROM image that I cannot include due to
original copyright holder (bPlan) did not release it under a free
licence but I have plans to write a replacement in the future. With
that firmware it can boot MorphOS now as:

qemu-system-ppc -M pegasos2 -cdrom morphos.iso -device ati-vga,romfile="" -serial stdio

then enter "boot cd boot.img" at the firmware "ok" prompt as described
in the MorphOS.readme. To boot Linux use same command line with e.g.
-cdrom debian-8.11.0-powerpc-netinst.iso then enter
"boot cd install/pegasos"

Patch 2 adds the actual board code after patch 1 adding MV64361 system
controller chip. The mv643xx.h header file is taken from Linux and
produces a bunch of checkpatch warnings due to different formatting
rules it follows, I'm not sure we want to adopt it or keep it as it is
given that it does not appear any more in recent Linux versions so we
could reformat it as it's unlikely to get updated in the future.

Regards,
BALATON Zoltan

BALATON Zoltan (2):
  hw/pci-host: Add emulation of Marvell MV64361 PPC system controller
  hw/ppc: Add emulation of Genesi/bPlan Pegasos II

 default-configs/devices/ppc-softmmu.mak |   2 +
 hw/pci-host/Kconfig                     |   3 +
 hw/pci-host/meson.build                 |   2 +
 hw/pci-host/mv64361.c                   | 966 ++++++++++++++++++++++++
 hw/pci-host/mv643xx.h                   | 919 ++++++++++++++++++++++
 hw/pci-host/trace-events                |   6 +
 hw/ppc/Kconfig                          |  10 +
 hw/ppc/meson.build                      |   2 +
 hw/ppc/pegasos2.c                       | 144 ++++
 include/hw/pci-host/mv64361.h           |   8 +
 include/hw/pci/pci_ids.h                |   1 +
 11 files changed, 2063 insertions(+)
 create mode 100644 hw/pci-host/mv64361.c
 create mode 100644 hw/pci-host/mv643xx.h
 create mode 100644 hw/ppc/pegasos2.c
 create mode 100644 include/hw/pci-host/mv64361.h

-- 
2.21.3


