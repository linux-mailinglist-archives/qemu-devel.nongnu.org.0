Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32214DC86E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:12:12 +0100 (CET)
Received: from localhost ([::1]:35078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUqrL-0004j1-UK
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:12:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqfJ-00083h-G6
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 09:59:45 -0400
Received: from mga12.intel.com ([192.55.52.136]:24858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqfH-0003wz-5D
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 09:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647525583; x=1679061583;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YfZo0YkS6/vhGNbAb0uVlbziBrQQFQYvobwvVingPUw=;
 b=CHTyj5OKaW6lkdgqVm27klf7RUwWfuO5jUkZz1hH4MXdkIyyCJAfxTOF
 rVgIgzfpxstue3QTylKBtV2bk1BiG6Nf8olneFcBvW5g7N+r4jFvQ7LVg
 dKEKXtq7jYvCfGXjB1/yEi9+samcYvrWSG8xZGgSNk6X+H+S9XfCfSi40
 VDWdbKVegWUk4pbjb7kosHGe6IxAThtO0veuuWwd4sTrBNqBpKC4TUrAT
 D9R5Qc66UWpYzGm1C7VW+Q8X0PiJkF8AxGlwvK0YhcAEp96iXWbL6XSIf
 sUPAlBIpntPN3ybFBNHNGG1cL/cXr0qAERZps5RrpKuIMtQ0rUjYdf7i7 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="236816587"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="236816587"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 06:59:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="541377804"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga007.jf.intel.com with ESMTP; 17 Mar 2022 06:59:14 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [RFC PATCH v3 00/36] TDX QEMU support
Date: Thu, 17 Mar 2022 21:58:37 +0800
Message-Id: <20220317135913.2166202-1-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
 Connor Kuehl <ckuehl@redhat.com>, seanjc@google.com, xiaoyao.li@intel.com,
 qemu-devel@nongnu.org, erdemaktas@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series aims to enable TDX support to allow creating and booting a
TD (TDX VM) with QEMU. It needs to work with corresponding KVM patch
for TDX [1]. You can find TDX related documents in [2].

You can also find this series in below repo in github:

https://github.com/intel/qemu-tdx.git

and it's based on two cleanup patches

https://lore.kernel.org/qemu-devel/20220310122811.807794-1-xiaoyao.li@intel.com/


To boot a TDX VM, it requires several changes/additional steps in the flow:

 1. specify the vm type KVM_X86_TDX_VM when creating VM with
    IOCTL(KVM_CREATE_VM);
 2. initialize VM scope configuration before creating any VCPU;
 3. initialize VCPU scope configuration;
 4. initialize virtual firmware in guest private memory before vcpu running;

Besides, TDX VM needs to boot with TDVF (TDX virtual firmware, and come out
as OVMF). This series adds the support of parsing TDVF, loading TDVF into
guest's private memory and preparing TD HOB info for TDVF.

[1] KVM TDX basic feature support
https://lore.kernel.org/all/cover.1646422845.git.isaku.yamahata@intel.com/

[2] https://www.intel.com/content/www/us/en/developer/articles/technical/intel-trust-domain-extensions.html

== Limitation and future work ==
- Readonly memslot

  TDX only support readonly (write protection) memslot for shared memory, but
  not for private memory. For simplicity, just mark readonly memslot not
  supported entirely for TDX. 

- CPU model

  We cannot create a TD with arbitrarily CPU model like what for normal VMs,
  because only a subset of features can be configured for TD.
  
  - It's recommended to use '-cpu host' to create TD;
  - '+feature/-feature' might not work as expected;

  future work: To introduce specific CPU model for TDs and enhance +/-features
               for TDs.

- gdb suppport

  gdb support to debug a TD of off-debug mode is future work.

== Patch organization ==
1           Manually fetch Linux UAPI changes for TDX;
2-15,24,26  Basic TDX support that parses vm-type and invoke TDX
            specific IOCTLs
16-25       Load, parse and initialize TDVF for TDX VM;
27-31       Disable unsupported functions for TDX VM;
32-35       Avoid errors due to KVM's requirement on TDX;
36          Add documentation of TDX;

== Change history ==

Changes from v2:
- Get vm-type from confidential-guest-support object type;
- Drop machine_init_done_late_notifiers;
- Refactor tdx_ioctl implementation;
- re-use existing pflash interface to load TDVF (i.e., OVMF binaries);
- introduce new date structure to track memory type instead of changing
  e820 table;
- Force smm to off for TDX VM;
- Drop the patches that suppress level-trigger/SMI/INIT/SIPI since KVM
  will ingore them;
- Add documentation;

[v2] https://lore.kernel.org/qemu-devel/cover.1625704980.git.isaku.yamahata@intel.com/

Changes from v1:
- suppress level trigger/SMI/INIT/SIPI related to IOAPIC.
- add VM attribute sha384 to TD measurement.
- guest TSC Hz specification

[v1] https://lore.kernel.org/qemu-devel/cover.1613188118.git.isaku.yamahata@intel.com/

---
Isaku Yamahata (4):
  i386/tdvf: Introduce function to parse TDVF metadata
  i386/tdx: Add TDVF memory via KVM_TDX_INIT_MEM_REGION
  hw/i386: add option to forcibly report edge trigger in acpi tables
  i386/tdx: Don't synchronize guest tsc for TDs

Sean Christopherson (2):
  i386/kvm: Move architectural CPUID leaf generation to separate helper
  i386/tdx: Don't get/put guest state for TDX VMs

Xiaoyao Li (30):
  *** HACK *** linux-headers: Update headers to pull in TDX API changes
  i386: Introduce tdx-guest object
  target/i386: Implement mc->kvm_type() to get VM type
  target/i386: Introduce kvm_confidential_guest_init()
  i386/tdx: Implement tdx_kvm_init() to initialize TDX VM context
  i386/tdx: Get tdx_capabilities via KVM_TDX_CAPABILITIES
  i386/tdx: Introduce is_tdx_vm() helper and cache tdx_guest object
  i386/tdx: Adjust get_supported_cpuid() for TDX VM
  KVM: Introduce kvm_arch_pre_create_vcpu()
  i386/tdx: Initialize TDX before creating TD vcpus
  i386/tdx: Add property sept-ve-disable for tdx-guest object
  i386/tdx: Wire CPU features up with attributes of TD guest
  i386/tdx: Validate TD attributes
  i386/tdx: Implement user specified tsc frequency
  i386/tdx: Set kvm_readonly_mem_enabled to false for TDX VM
  pflash_cfi01/tdx: Introduce ram_mode of pflash for TDVF
  i386/tdx: Parse TDVF metadata for TDX VM
  i386/tdx: Get and store the mem_ptr of TDVF firmware
  i386/tdx: Track mem_ptr for each firmware entry of TDVF
  i386/tdx: Track RAM entries for TDX VM
  i386/tdx: Create the TD HOB list upon machine init done
  i386/tdx: Call KVM_TDX_INIT_VCPU to initialize TDX vcpu
  i386/tdx: Finalize TDX VM
  i386/tdx: Disable SMM for TDX VMs
  i386/tdx: Disable PIC for TDX VMs
  i386/tdx: Don't allow system reset for TDX VMs
  hw/i386: add eoi_intercept_unsupported member to X86MachineState
  i386/tdx: Only configure MSR_IA32_UCODE_REV in kvm_init_msrs() for TDs
  i386/tdx: Skip kvm_put_apicbase() for TDs
  docs: Add TDX documentation

 accel/kvm/kvm-all.c                        |  16 +-
 configs/devices/i386-softmmu/default.mak   |   1 +
 docs/system/confidential-guest-support.rst |   1 +
 docs/system/i386/tdx.rst                   | 103 ++++
 docs/system/target-i386.rst                |   1 +
 hw/block/pflash_cfi01.c                    |  25 +-
 hw/i386/Kconfig                            |   6 +
 hw/i386/acpi-build.c                       |  99 ++--
 hw/i386/acpi-common.c                      |  50 +-
 hw/i386/meson.build                        |   1 +
 hw/i386/pc_sysfw.c                         |  49 +-
 hw/i386/tdvf-hob.c                         | 212 ++++++++
 hw/i386/tdvf-hob.h                         |  25 +
 hw/i386/tdvf.c                             | 196 ++++++++
 hw/i386/uefi.h                             | 198 ++++++++
 hw/i386/x86.c                              |   7 +
 include/hw/i386/tdvf.h                     |  60 +++
 include/hw/i386/x86.h                      |   1 +
 include/sysemu/kvm.h                       |   1 +
 linux-headers/asm-x86/kvm.h                |  60 +++
 linux-headers/linux/kvm.h                  |   2 +
 qapi/qom.json                              |  17 +
 target/arm/kvm64.c                         |   5 +
 target/i386/cpu.h                          |   5 +
 target/i386/kvm/kvm.c                      | 362 ++++++++------
 target/i386/kvm/kvm_i386.h                 |   5 +
 target/i386/kvm/meson.build                |   2 +
 target/i386/kvm/tdx-stub.c                 |  24 +
 target/i386/kvm/tdx.c                      | 541 +++++++++++++++++++++
 target/i386/kvm/tdx.h                      |  56 +++
 target/i386/sev.c                          |   1 -
 target/i386/sev.h                          |   2 +
 target/mips/kvm.c                          |   5 +
 target/ppc/kvm.c                           |   5 +
 target/s390x/kvm/kvm.c                     |   5 +
 35 files changed, 1940 insertions(+), 209 deletions(-)
 create mode 100644 docs/system/i386/tdx.rst
 create mode 100644 hw/i386/tdvf-hob.c
 create mode 100644 hw/i386/tdvf-hob.h
 create mode 100644 hw/i386/tdvf.c
 create mode 100644 hw/i386/uefi.h
 create mode 100644 include/hw/i386/tdvf.h
 create mode 100644 target/i386/kvm/tdx-stub.c
 create mode 100644 target/i386/kvm/tdx.c
 create mode 100644 target/i386/kvm/tdx.h

-- 
2.27.0


