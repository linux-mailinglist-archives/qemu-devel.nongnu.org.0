Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA89374CF7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 03:42:32 +0200 (CEST)
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leT27-00030d-Ic
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 21:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT0Z-0002MR-OO
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:40:55 -0400
Received: from mga18.intel.com ([134.134.136.126]:19041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT0W-0007OU-GP
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:40:55 -0400
IronPort-SDR: Xh142aV7VRN3F6dgURl1FOfIytIPNrfOk17X8e3l16qv0VU3yp9n2wyHp7VyQGktPCmYdvYz41
 Rt7SLlfnPRpg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="185813676"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="185813676"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:40:46 -0700
IronPort-SDR: zQ7EbdqEJwrBw+4OMqt9VyMttbWhq7tYPmxvfMikKcLBu9QuvwYJtGo5L8CSQLzE7xehyIKi0b
 /X6YY9A5P1nQ==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="469220276"
Received: from yy-desk-7060.sh.intel.com ([10.239.159.38])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:40:42 -0700
From: Yuan Yao <yuan.yao@linux.intel.com>
To: pbonzini@redhat.com
Subject: [RFC][PATCH v1 00/10] Enable encrypted guest memory access in QEMU
Date: Thu,  6 May 2021 09:40:27 +0800
Message-Id: <20210506014037.11982-1-yuan.yao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=yuan.yao@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Thomas.Lendacky@amd.com, ashish.kalra@amd.com,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, mtosatti@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 yuan.yao@intel.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuan Yao <yuan.yao@intel.com>

This RFC series introduces the basic framework and a common
implementation on x86 to handle encrypted guest memory
reading/writing, to support QEMU's built-in guest debugging
features, like the monitor command xp and gdbstub.

The encrypted guest which its memory and/or register context
is encrypted by vendor specific technology(AMD SEV/INTEL TDX),
is able to resist the attack from malicious VMM or other
privileged components in host side, however, this ability also
breaks down the QEMU's built-in guest debugging features,
because it prohibits the direct guest memory accessing
(memcpy() with HVA) from QEMU which is the base of these
debugging features.

The framework part based on the previous patche set from
AMD[1] and some discussion result in community[2]. The main
idea is, introduce some new debug interfaces to handle the
encrypted guest physical memory accessing, also introduce
new interfaces in MemoryRegion to handle the actual accessing
there with KVM, don't bother the exist memory access logic or
callbacks as far as possible. 

[1] https://lore.kernel.org/qemu-devel/
    cover.1605316268.git.ashish.kalra@amd.com/
[2] https://lore.kernel.org/qemu-devel/
    20200922201124.GA6606@ashkalra_ubuntu_server/

 - The difference part in this patch series:
   - We introduce another new vm level ioctl focus on the encrypted
     guest memory accessing:

     KVM_MEMORY_ENCRYPT_{READ,WRITE}_MEMORY

     struct kvm_rw_memory rw;
     rw.addr = gpa_OR_hva;
     rw.buf = (__u64)src;
     rw.len = len;
     kvm_vm_ioctl(kvm_state,
                  KVM_MEMORY_ENCRYPT_{READ,WRITE}_MEMORY,
                  &rw);

     This new ioctl has more neutral and general name for its
     purpose, the debugging support of AMD SEV and INTEL TDX
     can be covered by a unify QEMU implementation on x86 with this
     ioctl. Although only INTEL TD guest is supported in this series,
     AMD SEV could be also supported with implementation of this
     ioctl in KVM, plus small modifications in QEMU to enable the
     unify part.

   - The MemoryRegion interface introduced by AMD before now has
     addtional GPA parameter(only HVA before).
     This is for INTEL TDX which uses GPA to do guest memory
     accessing. This change won't impact AMD SEV which is using
     HVA to access the guest memory.

 - New APIs in QEMU:
   - Physical memory accessing:
     - cpu_physical_memory_rw_debug().
     - cpu_physical_memory_read_debug().
     - cpu_physical_memory_write_debug().
     - x86_ldl_phys_debug().
     - x86_ldq_phys_debug().
   - Access from address_space:
     - address_space_read_debug().
     - address_space_write_rom_debug().
   - Virtual memory accessing and page table walking:
     - cpu_memory_rw_debug().
     - x86_cpu_get_phys_page_attrs_encrypted_debug().

 - New intrfaces in QEMU:
   - MemoryDebugOps *physical_memory_debug_op
     - For normal guest:
       Just call the old exist memory RW functions.
     - For encrypted guest:
       Forward the request to MemoryRegion->ram_debug_ops

   - MemoryRegionRAMReadWriteOps MemoryRegion::*ram_debug_ops
     - For normal guest:
       NULL and nobody use it.
     - For encrypted guest:
       Forward the request to common/vendor specific implementation.

 - The relationship diagram of the APIs and interfaces:

                 +---------------------------------------------+
                 |x86_cpu_get_phys_page_attrs_encrypted_debug()|
                 +----------------------------------+----------+
                                                    |
          +---------------------------------+       |
          |cpu_physical_memory_rw_debug()   |       |
          |cpu_physical_memory_read_debug() |       |
          |cpu_physical_memory_write_debug()|       |
          +----------------------+----------+       |
                                 |                  |
   +---------------------+       |        +---------v----------+
   |cpu_memory_rw_debug()|       |        |x86_ldl_phys_debug()|
   +-------------------+-+       |        |x86_ldq_phys_debug()|
                       |         |        +-------+------------+
                       |         |                |
                       |         |                |
  +--------------------v---------v----------------v------------+
  |         MemoryDebugOps *physical_memory_debug_op           |
  +----------------------+--------------------------+----------+
                         |                          |
                         |Encrypted guest           |Normal guest
                         |                          |
    +--------------------v-----------------------+  |
    |address_space_encrypted_memory_read_debug() |  |
    |address_space_encrypted_rom_write_debug()   |  |
    +--------------------+-----------------------+  |
                         |                          | 
                         |          +---------------v----------+
                         |          |address_space_read()      |
                         |          |address_space_write_rom() |
                         |          +--------------------------+
                         |
        +----------------v----------------+
        | address_space_read_debug()      |
        | address_space_write_rom_debug() |
        +----------------+----------------+
                         |
                         |
                         |
        +----------------v----------------+
        |  MemoryRegionRAMReadWriteOps    |
        |  MemoryRegion::*ram_debug_ops   |
        +--------+--------------+---------+
                 |              |
                 |              |Normal guest
                 |              |
  Encrypted guest|          +---v-------------------+
                 |          | NULL(nobody using it) |
                 |          +-----------------------+
                 |
       +---------v----------------------------+
       |  kvm_encrypted_guest_read_memory()   |
       |  kvm_encrypted_guest_write_memory()  |
       +--------------------------------------+

Ashish Kalra (2):
  Introduce new MemoryDebugOps which hook into guest virtual and
    physical memory debug interfaces such as cpu_memory_rw_debug, to
    allow vendor specific assist/hooks for debugging and delegating
    accessing the guest memory. This is required for example in case of
    AMD SEV platform where the guest memory is encrypted and a SEV
    specific debug assist/hook will be required to access the guest
    memory.
  Add new address_space_read and address_space_write debug helper
    interfaces which can be invoked by vendor specific guest memory
    debug assist/hooks to do guest RAM memory accesses using the added
    MemoryRegion callbacks.

Brijesh Singh (2):
  Extend the MemTxAttrs to include a 'debug' flag. The flag can be used
    as general indicator that operation was triggered by the debugger.
  Currently, guest memory access for debugging purposes is performed
    using memcpy(). Extend the 'struct MemoryRegion' to include new
    callbacks that can be used to override the use of memcpy() with
    something else.

Yuan Yao (6):
  Introduce new interface KVMState::set_mr_debug_ops and its wrapper
  Implements the common MemoryRegion::ram_debug_ops for encrypted guests
  Set the RAM's MemoryRegion::debug_ops for INTEL TD guests
  Introduce debug version of physical memory read/write API
  Change the monitor and other commands and gdbstub to use the debug API
  Introduce new CPUClass::get_phys_page_attrs_debug implementation for
    encrypted guests

 accel/kvm/kvm-all.c       |  17 +++++
 accel/stubs/kvm-stub.c    |  11 +++
 dump/dump.c               |   2 +-
 gdbstub.c                 |   4 +-
 hw/i386/pc.c              |   4 +
 include/exec/cpu-common.h |  14 ++++
 include/exec/memattrs.h   |   4 +
 include/exec/memory.h     |  54 +++++++++++++
 include/sysemu/kvm.h      |   5 ++
 include/sysemu/tdx.h      |   3 +
 monitor/misc.c            |  12 ++-
 softmmu/cpus.c            |   2 +-
 softmmu/physmem.c         | 154 +++++++++++++++++++++++++++++++++++++-
 target/i386/cpu.h         |   4 +
 target/i386/helper.c      |  64 +++++++++++++---
 target/i386/kvm/kvm.c     |  68 +++++++++++++++++
 target/i386/kvm/tdx.c     |  21 ++++++
 target/i386/monitor.c     |  52 ++++++-------
 18 files changed, 447 insertions(+), 48 deletions(-)

-- 
2.20.1


