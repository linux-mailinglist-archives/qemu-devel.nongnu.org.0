Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE9652432C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 05:21:18 +0200 (CEST)
Received: from localhost ([::1]:46450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nozO8-0003SW-LQ
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 23:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nozLH-00015x-6I
 for qemu-devel@nongnu.org; Wed, 11 May 2022 23:18:19 -0400
Received: from mga18.intel.com ([134.134.136.126]:33504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nozLE-0002mx-7I
 for qemu-devel@nongnu.org; Wed, 11 May 2022 23:18:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652325496; x=1683861496;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vKN9sNlorYxpIyi3cxTi9JAciAKs6kTYdgkNZtndWos=;
 b=W1USjPKvFu8JZWwO3+YUUj7WSMyxAklkXBJJt52Hoy1QfFjPP1pbgxPC
 p2h+EOfJ5xBjQHO1cE6+c6OdE8dIyvv2w4dwGVF94ZsUsV2o/IHdOOPqy
 wFHAZJq2O57xjFY+g3/tl+2px4DzqYsUw1GkUl9m5cBAH2KUSVE5fom75
 ETYmTCiunbGHnUMbmHYwlUmyoFqsC9LLDp7INXz1U+v209FKy621y6OED
 c5zOaRe0cbQvus4QKbJ0NnCkGtdBr+1JZ2KNFdyfeHfNgrzsHqPQ6FGGj
 HdwcNUTjdElRfp7/NzOfNQL5ZGFfGATAQPT7RDB6dZyY40HzHdme7pe8z w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="251928040"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="251928040"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 20:18:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="594455230"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2022 20:18:04 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com,
 xiaoyao.li@intel.com
Subject: [RFC PATCH v4 00/36] TDX QEMU support
Date: Thu, 12 May 2022 11:17:27 +0800
Message-Id: <20220512031803.3315890-1-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=xiaoyao.li@intel.com; helo=mga18.intel.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This is the v4 RFC, I would like to get feedback on whether the design
in this series is the good direction to enable TDX on QEMU.

This patch series aims to enable TDX support to allow creating and booting a
TD (TDX VM) with QEMU. It needs to work with corresponding v6 KVM patch
for TDX [1]. You can find TDX related documents in [2].

You can also find this series in below repo in github:

https://github.com/intel/qemu-tdx/tree/tdx-qemu-upstream-rfc-v4

and it's based on two cleanup patches

https://lore.kernel.org/qemu-devel/20220310122811.807794-1-xiaoyao.li@intel.com/


To boot a TDX VM, it requires several changes/additional steps in the flow:

 1. specify the vm type KVM_X86_TDX_VM when creating VM with
    IOCTL(KVM_CREATE_VM);
 2. initialize VM scope configuration before creating any VCPU;
 3. initialize VCPU scope configuration;
 4. initialize virtual firmware in guest private memory before vcpu running;

Besides, TDX VM needs to boot with TDVF (TDX virtual firmware) and currently
upstream OVMF can serve as TDVF. This series adds the support of parsing TDVF,
loading TDVF into guest's private memory and preparing TD HOB info for TDVF.

[1] KVM TDX basic feature support
https://lore.kernel.org/all/cover.1646422845.git.isaku.yamahata@intel.com/

[2] https://www.intel.com/content/www/us/en/developer/articles/technical/intel-trust-domain-extensions.html

== Limitation and future work ==
- Readonly memslot

  TDX only support readonly (write protection) memslot for shared memory, but
  not for private memory. For simplicity, just mark readonly memslot not
  supported entirely for TDX. 

- CPU model

  We cannot create a TD with arbitrary CPU model like what for non-TDX VMs,
  because only a subset of features can be configured for TD.
  
  - It's recommended to use '-cpu host' to create TD;
  - '+feature/-feature' might not work as expected;

  future work: To introduce specific CPU model for TDs and enhance +/-features
               for TDs.

- gdb suppport

  gdb support to debug a TD of off-debug mode is future work.

== Patch organization ==
1           Manually fetch Linux UAPI changes for TDX;
2-15,25-26  Basic TDX support that parses vm-type and invoke TDX
            specific IOCTLs
16-24       Load, parse and initialize TDVF for TDX VM;
27-31       Disable unsupported functions for TDX VM;
32-35       Avoid errors due to KVM's requirement on TDX;
36          Add documentation of TDX;

== Change history ==
Changes from RFC v3:
- Load TDVF with -bios interface;
- Adapt to KVM API changes;
	- KVM_TDX_CAPABILITIES changes back to KVM-scope;
	- struct kvm_tdx_init_vm changes;
- Define TDX_SUPPORTED_KVM_FEATURES;
- Drop the patch of introducing property sept-ve-disable since it's not
  public yet;
- some misc cleanups

Changes from RFC v2:
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

Changes from RFC v1:
- suppress level trigger/SMI/INIT/SIPI related to IOAPIC.
- add VM attribute sha384 to TD measurement.
- guest TSC Hz specification

[v1] https://lore.kernel.org/qemu-devel/cover.1613188118.git.isaku.yamahata@intel.com/

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
  i386/tdx: Wire CPU features up with attributes of TD guest
  i386/tdx: Validate TD attributes
  i386/tdx: Implement user specified tsc frequency
  i386/tdx: Set kvm_readonly_mem_enabled to false for TDX VM
  i386/tdx: Parse TDVF metadata for TDX VM
  i386/tdx: Skip BIOS shadowing setup
  i386/tdx: Don't initialize pc.rom for TDX VMs
  i386/tdx: Register a machine_init_done callback for TD
  i386/tdx: Track mem_ptr for each firmware entry of TDVF
  i386/tdx: Track RAM entries for TDX VM
  i386/tdx: Setup the TD HOB list
  i386/tdx: Call KVM_TDX_INIT_VCPU to initialize TDX vcpu
  i386/tdx: Finalize TDX VM
  i386/tdx: Disable SMM for TDX VMs
  i386/tdx: Disable PIC for TDX VMs
  i386/tdx: Don't allow system reset for TDX VMs
  hw/i386: add eoi_intercept_unsupported member to X86MachineState
  i386/tdx: Only configure MSR_IA32_UCODE_REV in kvm_init_msrs() for TDs
  i386/tdx: Skip kvm_put_apicbase() for TDs
  docs: Add TDX documentation

 accel/kvm/kvm-all.c                        |  21 +-
 configs/devices/i386-softmmu/default.mak   |   1 +
 docs/system/confidential-guest-support.rst |   1 +
 docs/system/i386/tdx.rst                   | 103 +++++
 docs/system/target-i386.rst                |   1 +
 hw/i386/Kconfig                            |   6 +
 hw/i386/acpi-build.c                       |  99 ++--
 hw/i386/acpi-common.c                      |  50 +-
 hw/i386/meson.build                        |   1 +
 hw/i386/pc.c                               |  21 +-
 hw/i386/pc_sysfw.c                         |   7 +
 hw/i386/tdvf-hob.c                         | 212 +++++++++
 hw/i386/tdvf-hob.h                         |  25 +
 hw/i386/tdvf.c                             | 198 ++++++++
 hw/i386/uefi.h                             | 198 ++++++++
 hw/i386/x86.c                              |  34 +-
 include/hw/i386/tdvf.h                     |  58 +++
 include/hw/i386/x86.h                      |   1 +
 include/sysemu/kvm.h                       |   1 +
 linux-headers/asm-x86/kvm.h                |  95 ++++
 linux-headers/linux/kvm.h                  |   2 +
 qapi/qom.json                              |  14 +
 target/i386/cpu.h                          |   5 +
 target/i386/kvm/kvm.c                      | 362 +++++++++------
 target/i386/kvm/kvm_i386.h                 |   5 +
 target/i386/kvm/meson.build                |   2 +
 target/i386/kvm/tdx-stub.c                 |  19 +
 target/i386/kvm/tdx.c                      | 505 +++++++++++++++++++++
 target/i386/kvm/tdx.h                      |  55 +++
 target/i386/sev.c                          |   1 -
 target/i386/sev.h                          |   2 +
 31 files changed, 1897 insertions(+), 208 deletions(-)
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


