Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4527925CFE5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 05:48:58 +0200 (CEST)
Received: from localhost ([::1]:33282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE2ie-0004CJ-MK
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 23:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2hQ-0002KY-7p; Thu, 03 Sep 2020 23:47:40 -0400
Received: from ozlabs.org ([203.11.71.1]:46177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2hN-0004sL-Hs; Thu, 03 Sep 2020 23:47:39 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BjNsn0DYfz9sTv; Fri,  4 Sep 2020 13:47:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599191245;
 bh=gebdWUkVpMaVkgmdkTIDcNjZehZTWbjiHKrhS+Uaw2M=;
 h=From:To:Cc:Subject:Date:From;
 b=U2SshrWONoSK1Vfk12ves/8giCEpBnKzOXvMMTccQOF7vXkDDQ3GQoUyN8cPZfHmU
 mjAoQ8HJgtyOtVhFQuFXp8XxXMLuDbw5NaidFndoa22TiKn+kLhTH3YZksRh+6R6v2
 M1ki+b7CMM0qytcNExD6E+xWsRbnruZQqPm50NJk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 00/30] ppc-for-5.2 queue 20200904
Date: Fri,  4 Sep 2020 13:46:49 +1000
Message-Id: <20200904034719.673626-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 23:47:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, bauerman@linux.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 67a7bfe560a1bba59efab085cb3430f45176d382:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-09-03' into staging (2020-09-03 16:58:25 +0100)

are available in the Git repository at:

  git://github.com/dgibson/qemu.git tags/ppc-for-5.2-20200904

for you to fetch changes up to b172606ecf29a140073f7787251a9d70ecb53b6e:

  spapr_numa: move NVLink2 associativity handling to spapr_numa.c (2020-09-04 13:40:09 +1000)

----------------------------------------------------------------
ppc patch queue 2020-09-04

Next pull request for qemu-5.2.  The biggest thing here is the
generalization of ARM's start-powered-off machine property to all
targets.  This can fix a number of odd little edge cases where KVM
could run vcpus before they were properly initialized.  This does
include changes to a number of files that aren't normally in my
purview.  There are suitable Acked-by lines and Peter requested this
come in via my tree, since the most pressing requirement for it is in
pseries machines with the POWER secure virtual machine facility.

In addition we have:
 * The start of Daniel Barboza's rework and clean up of pseries
   machine NUMA handling
 * Correction to behaviour of the nvdimm= generic machine property on
   pseries
 * An optimization to the allocation of XIVE interrupts on KVM
 * Some fixes for confused behaviour with kernel_irqchip when both
   XICS and XIVE are in play
 * Add HIOMAP comamnd to pnv flash
 * Properly advertise the fact that spapr_vscsi doesn't handle
   hotplugged disks
 * Some assorted minor enhancements

----------------------------------------------------------------
Cédric Le Goater (8):
      ppc/pnv: Fix TypeInfo of PnvLpcController abstract class
      spapr/xive: Add a 'hv-prio' property to represent the KVM escalation priority
      ppc/pnv: Add a HIOMAP erase command
      spapr/xive: Use the xics flag to check for XIVE-only IRQ backends
      spapr/xive: Modify kvm_cpu_is_enabled() interface
      spapr/xive: Use kvmppc_xive_source_reset() in post_load
      spapr/xive: Allocate IPIs independently from the other sources
      spapr/xive: Allocate vCPU IPIs from the vCPU contexts

Daniel Henrique Barboza (10):
      spapr_vscsi: do not allow device hotplug
      ppc/spapr_nvdimm: use g_autofree in spapr_nvdimm_validate_opts()
      spapr, spapr_nvdimm: fold NVDIMM validation in the same place
      ppc/spapr_nvdimm: do not enable support with 'nvdimm=off'
      ppc: introducing spapr_numa.c NUMA code helper
      ppc/spapr_nvdimm: turn spapr_dt_nvdimm() static
      spapr: introduce SpaprMachineState::numa_assoc_array
      spapr, spapr_numa: handle vcpu ibm,associativity
      spapr, spapr_numa: move lookup-arrays handling to spapr_numa.c
      spapr_numa: move NVLink2 associativity handling to spapr_numa.c

David Gibson (2):
      adb: Correct class size on TYPE_ADB_DEVICE
      spapr: Remove unnecessary DRC type-checker macros

Philippe Mathieu-Daudé (2):
      hw/ppc/ppc4xx_pci: Use ARRAY_SIZE() instead of magic value
      hw/ppc/ppc4xx_pci: Replace pointless warning by assert()

Thiago Jung Bauermann (8):
      target/arm: Move start-powered-off property to generic CPUState
      target/arm: Move setting of CPU halted state to generic code
      ppc/spapr: Use start-powered-off CPUState property
      ppc/e500: Use start-powered-off CPUState property
      mips/cps: Use start-powered-off CPUState property
      sparc/sun4m: Don't set cs->halted = 0 in main_cpu_reset()
      sparc/sun4m: Use start-powered-off CPUState property
      target/s390x: Use start-powered-off CPUState property

 exec.c                        |   1 +
 hw/core/cpu.c                 |   2 +-
 hw/input/adb.c                |   1 +
 hw/intc/spapr_xive.c          |  33 ++++-----
 hw/intc/spapr_xive_kvm.c      | 102 +++++++++++++++++++++-----
 hw/mips/cps.c                 |  15 +++-
 hw/ppc/e500.c                 |  13 +++-
 hw/ppc/meson.build            |   3 +-
 hw/ppc/pnv_bmc.c              |  29 +++++++-
 hw/ppc/pnv_lpc.c              |   3 +-
 hw/ppc/ppc4xx_pci.c           |   8 +-
 hw/ppc/spapr.c                | 109 ++++++---------------------
 hw/ppc/spapr_cpu_core.c       |  10 +--
 hw/ppc/spapr_irq.c            |   2 +-
 hw/ppc/spapr_numa.c           | 167 ++++++++++++++++++++++++++++++++++++++++++
 hw/ppc/spapr_nvdimm.c         |  68 ++++++++++-------
 hw/ppc/spapr_pci.c            |   9 +--
 hw/ppc/spapr_pci_nvlink2.c    |  20 +----
 hw/scsi/spapr_vscsi.c         |   3 +
 hw/sparc/sun4m.c              |  26 ++-----
 include/hw/core/cpu.h         |   4 +
 include/hw/ipmi/ipmi.h        |   1 +
 include/hw/ppc/spapr.h        |  12 +++
 include/hw/ppc/spapr_drc.h    |  43 +----------
 include/hw/ppc/spapr_numa.h   |  35 +++++++++
 include/hw/ppc/spapr_nvdimm.h |   7 +-
 include/hw/ppc/spapr_xive.h   |   2 +
 target/arm/cpu.c              |   4 +-
 target/arm/cpu.h              |   3 -
 target/arm/kvm32.c            |   2 +-
 target/arm/kvm64.c            |   2 +-
 target/s390x/cpu.c            |   2 +-
 32 files changed, 468 insertions(+), 273 deletions(-)
 create mode 100644 hw/ppc/spapr_numa.c
 create mode 100644 include/hw/ppc/spapr_numa.h

