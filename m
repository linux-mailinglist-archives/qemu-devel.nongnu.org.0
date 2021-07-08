Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069813BF32D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 02:58:49 +0200 (CEST)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1INM-0005Fk-1a
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 20:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKf-0001la-JF
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:01 -0400
Received: from mga12.intel.com ([192.55.52.136]:57600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKd-0007Kk-0M
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:01 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="189101697"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="189101697"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:51 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="449752007"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:51 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 00/44] TDX support
Date: Wed,  7 Jul 2021 17:54:30 -0700
Message-Id: <cover.1625704980.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=isaku.yamahata@intel.com; helo=mga12.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

This patch series is to enable TDX support.  This needs corresponding KVM patch
for TDX [1].  The patch [1] requires more patches to be function. So this patch
series is RFC.  For those who want to try github repo is available at [2].

Patch series is organized as follows.
 1- 5 code refactoring and simple hooks that will be used later
 6- 9 introduce kvm type and tdx type. disallow non-usable operations
10-15 wire up necessary TDX kvm ioctl to initialize TD guest
16-24 load TDVF and setup necessary info for TDVF
25-26 prohibit unsupported operations related to SMM
28-29 force x2apic and disable PIC
30-31 allows user to specify sha384 value for TD guest
32-33 add qmp operation to query KVM capability and TD info
34    make reboot action shutdown
35-43 suppress level-trigger/SMI/INIT/SIPI
44    suppress S3/S4

TODO:
- gdb support
- sanity check of CPUID

Changes from v1:
- suppress level trigger/SMI/INIT/SIPI related to IOAPIC.
- add VM attribute sha384 to TD measurement.
- guest TSC Hz specification.

Links:
[1] KVM TDX patch series v2
    https://patchwork.kernel.org/project/kvm/list/?series=510271
[2] intel public github
   kvm TDX branch: https://github.com/intel/tdx/tree/kvm
   TDX guest branch: https://github.com/intel/tdx/tree/guest
   qemu TDX https://github.com/intel/qemu-tdx
[3] TDVF
    https://github.com/tianocore/edk2-staging/tree/TDVF
[4] TDX specs
https://software.intel.com/content/www/us/en/develop/articles/intel-trust-domain-extensions.html

Chenyi Qiang (1):
  qmp: add query-tdx-capabilities query-tdx command

Isaku Yamahata (29):
  kvm: Switch KVM_CAP_READONLY_MEM to a per-VM ioctl()
  vl: Introduce machine_init_done_late notifier
  i386/kvm: Skip KVM_X86_SETUP_MCE for TDX guests
  target/i386: kvm: don't synchronize guest tsc for TD guest
  i386/tdx: Frame in the call for KVM_TDX_INIT_VCPU
  hw/i386: Add definitions from UEFI spec for volumes, resources, etc...
  i386/tdx: Add definitions for TDVF metadata
  hw/i386: refactor e820_add_entry()
  hw/i386/e820: introduce a helper function to change type of e820
  i386/tdx: Parse tdx metadata and store the result into TdxGuestState
  i386/tdx: Create the TD HOB list upon machine init done
  i386/tdx: Add TDVF memory via INIT_MEM_REGION
  i386/tdx: Use KVM_TDX_INIT_VCPU to pass HOB to TDVF
  pci-host/q35: Move PAM initialization above SMRAM initialization
  q35: Introduce smm_ranges property for q35-pci-host
  qom: implement property helper for sha384
  target/i386/tdx: Allows mrconfigid/mrowner/mrownerconfig for
    TDX_INIT_VM
  tdx: add kvm_tdx_enabled() accessor for later use
  target/i386/tdx: set reboot action to shutdown when tdx
  ioapic: add property to disable level interrupt
  hw/i386: add eoi_intercept_unsupported member to X86MachineState
  hw/i386: add option to forcibly report edge trigger in acpi tables
  hw/i386: plug eoi_intercept_unsupported to ioapic
  ioapic: add property to disallow SMI delivery mode
  hw/i386: add a flag to disallow SMI
  ioapic: add property to disallow INIT/SIPI delivery mode
  hw/i386: add a flag to disable init/sipi delivery mode of interrupt
  i386/tdx: disallow level interrupt and SMI/INIT/SIPI delivery mode
  i386/tdx: disable S3/S4 unconditionally

Sean Christopherson (9):
  target/i386: Expose x86_cpu_get_supported_feature_word() for TDX
  i386/kvm: Move architectural CPUID leaf generation to separarte helper
  i386/kvm: Squash getting/putting guest state for TDX VMs
  i386/tdx: Frame in tdx_get_supported_cpuid with KVM_TDX_CAPABILITIES
  i386/tdx: Add hook to require generic device loader
  i386/tdx: Add MMIO HOB entries
  q35: Move PCIe BAR check above PAM check in mch_write_config()
  i386/tdx: Force x2apic mode and routing for TDs
  target/i386: Add machine option to disable PIC/8259

Xiaoyao Li (5):
  linux-headers: Update headers to pull in TDX API changes
  hw/i386: Introduce kvm-type for TDX guest
  hw/i386: Initialize TDX via KVM ioctl() when kvm_type is TDX
  i386/tdx: Implement user specified tsc frequency
  target/i386/tdx: Finalize the TD's measurement when machine is done

 accel/kvm/kvm-all.c                      |   4 +-
 default-configs/devices/i386-softmmu.mak |   1 +
 hw/core/generic-loader.c                 |   5 +
 hw/core/machine.c                        |  26 ++
 hw/core/meson.build                      |   3 +
 hw/core/tdvf-stub.c                      |   6 +
 hw/i386/Kconfig                          |   5 +
 hw/i386/acpi-build.c                     | 103 +++--
 hw/i386/acpi-common.c                    |  74 +++-
 hw/i386/e820_memory_layout.c             | 114 +++++-
 hw/i386/e820_memory_layout.h             |   1 +
 hw/i386/meson.build                      |   1 +
 hw/i386/microvm.c                        |   7 +-
 hw/i386/pc.c                             |  18 +
 hw/i386/pc_piix.c                        |   7 +-
 hw/i386/pc_q35.c                         |   9 +-
 hw/i386/pc_sysfw.c                       |   6 +
 hw/i386/tdvf-hob.c                       | 235 +++++++++++
 hw/i386/tdvf-hob.h                       |  25 ++
 hw/i386/tdvf.c                           | 312 ++++++++++++++
 hw/i386/uefi.h                           | 496 +++++++++++++++++++++++
 hw/i386/x86.c                            |  72 +++-
 hw/intc/apic_common.c                    |  12 +
 hw/intc/ioapic.c                         |  57 +++
 hw/intc/ioapic_common.c                  |  68 ++++
 hw/pci-host/q35.c                        |  67 +--
 include/hw/i386/apic.h                   |   1 +
 include/hw/i386/apic_internal.h          |   1 +
 include/hw/i386/ioapic_internal.h        |   3 +
 include/hw/i386/pc.h                     |   3 +
 include/hw/i386/tdvf.h                   |  55 +++
 include/hw/i386/x86.h                    |  14 +-
 include/hw/pci-host/q35.h                |   1 +
 include/qom/object.h                     |  17 +
 include/sysemu/sysemu.h                  |   2 +
 include/sysemu/tdvf.h                    |   6 +
 include/sysemu/tdx.h                     |  22 +
 linux-headers/asm-x86/kvm.h              |  60 +++
 linux-headers/linux/kvm.h                |   2 +
 qapi/misc-target.json                    |  59 +++
 qapi/qom.json                            |  23 ++
 qom/object.c                             |  76 ++++
 target/i386/cpu.c                        |   4 +-
 target/i386/cpu.h                        |   3 +
 target/i386/kvm/kvm-stub.c               |   5 +
 target/i386/kvm/kvm.c                    | 255 +++++++-----
 target/i386/kvm/kvm_i386.h               |   5 +
 target/i386/kvm/meson.build              |   1 +
 target/i386/kvm/tdx-stub.c               |  33 ++
 target/i386/kvm/tdx.c                    | 417 +++++++++++++++++++
 target/i386/kvm/tdx.h                    |  58 +++
 target/i386/monitor.c                    |  23 ++
 52 files changed, 2685 insertions(+), 198 deletions(-)
 create mode 100644 hw/core/tdvf-stub.c
 create mode 100644 hw/i386/tdvf-hob.c
 create mode 100644 hw/i386/tdvf-hob.h
 create mode 100644 hw/i386/tdvf.c
 create mode 100644 hw/i386/uefi.h
 create mode 100644 include/hw/i386/tdvf.h
 create mode 100644 include/sysemu/tdvf.h
 create mode 100644 include/sysemu/tdx.h
 create mode 100644 target/i386/kvm/tdx-stub.c
 create mode 100644 target/i386/kvm/tdx.c
 create mode 100644 target/i386/kvm/tdx.h

-- 
2.25.1


