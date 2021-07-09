Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56393C22AD
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 13:19:07 +0200 (CEST)
Received: from localhost ([::1]:60416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1oXC-0005oQ-Qe
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 07:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oSb-0005hN-3A
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:14:21 -0400
Received: from mga06.intel.com ([134.134.136.31]:37155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oSX-0004xl-AS
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:14:20 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="270800757"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="270800757"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 04:14:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="428730123"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2021 04:14:07 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/33] Qemu SGX virtualization
Date: Fri,  9 Jul 2021 19:09:22 +0800
Message-Id: <20210709110955.73256-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since Sean Christopherson has left Intel and i am responsible for Qemu SGX
upstream work. His @intel.com address will be bouncing and his new email(
seanjc@google.com) is also in CC lists.

This series is Qemu SGX virtualization implementation rebased on latest
Qemu release. The numa support for SGX will be sent in another patchset
once this basic SGX patchset are merged.

You can find Qemu repo here:

     https://github.com/intel/qemu-sgx.git upstream

If you want to try SGX, you can directly install the linux release(at least 5.13.0-rc1+)
since kvm SGX has been merged into linux release.

     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

To simplify, you'd better install linux on host and guest, which can support
SGX on host and guest kernel. And to me, use below reference command to boot
SGX guest:

     #qemu-system-x86_64 \
         ...... \
         -cpu host,+sgx-provisionkey \
         -object memory-backend-epc,id=mem1,size=64M,prealloc=on \
         -object memory-backend-epc,id=mem2,size=28M \
         -M sgx-epc.id.0=epc1,sgx-epc.memdev.0=mem1,sgx-epc.id.1=epc2,sgx-epc.memdev.1=mem2

Overview
========

Intel Software Guard eXtensions (SGX) is a set of instructions and mechanisms
for memory accesses in order to provide security accesses for sensitive
applications and data. SGX allows an application to use it's pariticular
address space as an *enclave*, which is a protected area provides confidentiality
and integrity even in the presence of privileged malware. Accesses to the
enclave memory area from any software not resident in the enclave are prevented,
including those from privileged software.

SGX virtaulization
==================

The KVM SGX creates one new misc device, sgx_vepc, and Qemu will open '/dev/sgx_vepc'
device node to mmap() host EPC memory to guest. The Qemu also adds 'sgx-epc' device
to expose EPC sections to guest through CPUID and ACPI table.  The Qemu SGX also
supports multiple virtual EPC sections to guest, we just put them together physically
contiguous for the sake of simplicity. The kernel SGX NUMA has been merged into Linux
tip tree, we will support this function in the next phase.

Although the current host SGX subsystem can not support SGX2 feature, the KVM/Qemu
implementation still expose this feature to guest. Guest SGX2 support doesn't have
interaction with host kernel SGX driver, the SGX guest can normally use those new
instructions.

As for SGX virtualization detailed infomation, please reference docs/intel-sgx.txt
docuement(patch 33).

Changelog:
=========

(Changelog here is for global changes, please see each patch's changelog for changes
 made to specific patch.)

v2-->v3:
   - Rebased the sgx patches into latest Qemu release.
   - Implemented the compound property for SGX, ref patch5, the command from '-sgx-epc'
     to '-M'.
   - Moved the sgx common code from sgx-epc.c to sgx.c. The sgx-epc.c is
     only responsible for virtual epc device.
   - Removed the previous patch13(linux-headers: Add placeholder for KVM_CAP_SGX_ATTRIBUTE)
     because ehabkost@redhat.com updated Linux headers to 5.13-rc4 with commit 278f064e452.
   - Updated the patch1 because ram_flags were changed by David Hildenbra.
   - Added one patch24, which avoid reset operation caused by bios reset.
   - Added one patch25, which make prealloc property consistent with Qemu cmdline during VM
     reset.

v1-->v2:
   - Rebased the sgx patches into latest Qemu release.
   - Unified the "share" and "protected" arguments with ram_flags in the
     memory_region_init_ram_from_fd()(Paolo).
   - Added the new MemoryBackendEpcProperties and related documents(Eric Blake).
   - Changed the KVM_CAP_SGX_ATTRIBUTE from 195 to 196(Kai).
   - Changed the version and some grammar issues(Eric Blake).


Sean Christopherson (21):
  memory: Add RAM_PROTECTED flag to skip IOMMU mappings
  hostmem: Add hostmem-epc as a backend for SGX EPC
  i386: Add 'sgx-epc' device to expose EPC sections to guest
  vl: Add sgx compound properties to expose SGX EPC sections to guest
  i386: Add primary SGX CPUID and MSR defines
  i386: Add SGX CPUID leaf FEAT_SGX_12_0_EAX
  i386: Add SGX CPUID leaf FEAT_SGX_12_0_EBX
  i386: Add SGX CPUID leaf FEAT_SGX_12_1_EAX
  i386: Add get/set/migrate support for SGX_LEPUBKEYHASH MSRs
  i386: Add feature control MSR dependency when SGX is enabled
  i386: Update SGX CPUID info according to hardware/KVM/user input
  i386: kvm: Add support for exposing PROVISIONKEY to guest
  i386: Propagate SGX CPUID sub-leafs to KVM
  Adjust min CPUID level to 0x12 when SGX is enabled
  hw/i386/fw_cfg: Set SGX bits in feature control fw_cfg accordingly
  hw/i386/pc: Account for SGX EPC sections when calculating device
    memory
  i386/pc: Add e820 entry for SGX EPC section(s)
  i386: acpi: Add SGX EPC entry to ACPI tables
  q35: Add support for SGX EPC
  i440fx: Add support for SGX EPC
  doc: Add the SGX doc

Yang Zhong (12):
  qom: Add memory-backend-epc ObjectOptions support
  hostmem-epc: Add the reset interface for EPC backend reset
  sgx-epc: Add the reset interface for sgx-epc virt device
  sgx-epc: Avoid bios reset during sgx epc initialization
  hostmem-epc: Make prealloc consistent with qemu cmdline during reset
  qmp: Add query-sgx command
  hmp: Add 'info sgx' command
  i386: Add sgx_get_info() interface
  bitops: Support 32 and 64 bit mask macro
  qmp: Add the qmp_query_sgx_capabilities()
  Kconfig: Add CONFIG_SGX support
  sgx-epc: Add the fill_device_info() callback support

 backends/hostmem-epc.c                   | 118 ++++++++++
 backends/meson.build                     |   1 +
 default-configs/devices/i386-softmmu.mak |   1 +
 docs/intel-sgx.txt                       | 167 ++++++++++++++
 hmp-commands-info.hx                     |  15 ++
 hw/core/machine.c                        |  36 +++
 hw/i386/Kconfig                          |   5 +
 hw/i386/acpi-build.c                     |  22 ++
 hw/i386/fw_cfg.c                         |  10 +-
 hw/i386/meson.build                      |   2 +
 hw/i386/pc.c                             |  15 +-
 hw/i386/pc_piix.c                        |   4 +
 hw/i386/pc_q35.c                         |   3 +
 hw/i386/sgx-epc.c                        | 271 +++++++++++++++++++++++
 hw/i386/sgx-stub.c                       |  13 ++
 hw/i386/sgx.c                            | 178 +++++++++++++++
 hw/vfio/common.c                         |   1 +
 include/exec/memory.h                    |  15 +-
 include/hw/boards.h                      |   1 +
 include/hw/i386/pc.h                     |  10 +
 include/hw/i386/sgx-epc.h                |  68 ++++++
 include/monitor/hmp.h                    |   1 +
 include/qemu/bitops.h                    |   7 +
 monitor/hmp-cmds.c                       |  32 +++
 monitor/qmp-cmds.c                       |  19 ++
 qapi/machine.json                        |  43 +++-
 qapi/misc.json                           |  61 +++++
 qapi/qom.json                            |  19 ++
 qemu-options.hx                          |  10 +-
 softmmu/memory.c                         |   5 +
 softmmu/physmem.c                        |   3 +-
 stubs/meson.build                        |   1 +
 stubs/sgx-stub.c                         |  12 +
 target/i386/cpu.c                        | 168 +++++++++++++-
 target/i386/cpu.h                        |  16 ++
 target/i386/kvm/kvm.c                    |  75 +++++++
 target/i386/kvm/kvm_i386.h               |   2 +
 target/i386/machine.c                    |  20 ++
 tests/qtest/qmp-cmd-test.c               |   2 +
 39 files changed, 1442 insertions(+), 10 deletions(-)
 create mode 100644 backends/hostmem-epc.c
 create mode 100644 docs/intel-sgx.txt
 create mode 100644 hw/i386/sgx-epc.c
 create mode 100644 hw/i386/sgx-stub.c
 create mode 100644 hw/i386/sgx.c
 create mode 100644 include/hw/i386/sgx-epc.h
 create mode 100644 stubs/sgx-stub.c

-- 
2.29.2.334.gfaefdd61ec


