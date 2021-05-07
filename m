Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07992375FBF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 07:38:21 +0200 (CEST)
Received: from localhost ([::1]:57748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1letBr-0003Rz-Kv
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 01:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1letB4-00032W-CB
 for qemu-devel@nongnu.org; Fri, 07 May 2021 01:37:30 -0400
Received: from mga03.intel.com ([134.134.136.65]:34806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1letB0-00005t-BG
 for qemu-devel@nongnu.org; Fri, 07 May 2021 01:37:29 -0400
IronPort-SDR: nQ7B2rOOYiX4Z8vnuIw7Q/VWbQ8jbuILW1mcNIUGrUthc3cEwyDgNDjUU/nIpjJUPtlZ3JYg4p
 8GmYUprGL7oQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198708125"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; d="scan'208";a="198708125"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 22:37:16 -0700
IronPort-SDR: pX4oiNF6iPM2FkjMVDsbb4DUcvL5rwEyvk9fztlzHAU/fPnwVstKvEnu4HcaeXmMkJpLOwItA4
 G2EpApKr978A==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; d="scan'208";a="533338945"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 06 May 2021 22:37:12 -0700
Date: Fri, 7 May 2021 13:24:43 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RESEND PATCH 01/32] memory: Add RAM_PROTECTED flag to skip
 IOMMU mappings
Message-ID: <20210507052443.GA23130@yangzhon-Virtual>
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-2-yang.zhong@intel.com>
 <b216c2e4-abcb-d7bd-b461-96b731472b4d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b216c2e4-abcb-d7bd-b461-96b731472b4d@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.65; envelope-from=yang.zhong@intel.com;
 helo=mga03.intel.com
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 03, 2021 at 07:01:27PM +0200, Paolo Bonzini wrote:
> On 30/04/21 08:24, Yang Zhong wrote:
> >From: Sean Christopherson <sean.j.christopherson@intel.com>
> >
> >Add a new RAMBlock flag to denote "protected" memory, i.e. memory that
> >looks and acts like RAM but is inaccessible via normal mechanisms,
> >including DMA.  Use the flag to skip protected memory regions when
> >mapping RAM for DMA in VFIO.
> >
> >Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> >Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> 
> Can you instead unify this with the "share" argument, and pass the
> argument down to qemu_ram_alloc_from_fd?  This removes the "share ?
> RAM_SHARED : 0" conversion.
> 

  Paolo, i will revert this patch, but in order to disable sgx epc memory region
  as DMA target, we still need to skip this memory region while adding this memory
  region.

  So, my plan is to revert this patch, and then add one new bool variable in the 
  struct MemoryRegion.

  The new patch as below and it will be as patch 2 in the next version

  diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
  index 0c98812f0d..316e1ee688 100644
  --- a/backends/hostmem-epc.c
  +++ b/backends/hostmem-epc.c
  @@ -67,6 +67,7 @@ void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
       }

       sgx_epc_backend_memory_alloc(backend, errp);
  +    mr->sgx_epc_device = true;
  }

  static void sgx_epc_backend_instance_init(Object *obj)
  diff --git a/hw/vfio/common.c b/hw/vfio/common.c
  index 5bc5d29358..7a53855436 100644
  --- a/hw/vfio/common.c
  +++ b/hw/vfio/common.c
  @@ -538,7 +538,7 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
   {
       return (!memory_region_is_ram(section->mr) &&
               !memory_region_is_iommu(section->mr)) ||
  +            section->mr->sgx_epc_device ||
               /*
                * Sizing an enabled 64-bit BAR can cause spurious mappings to
                * addresses in the upper part of the 64-bit address space.  These
   diff --git a/include/exec/memory.h b/include/exec/memory.h
   index 2816e52be3..9bba0a1590 100644
   --- a/include/exec/memory.h
   +++ b/include/exec/memory.h
   @@ -463,6 +463,7 @@ struct MemoryRegion {
        bool readonly; /* For RAM regions */
        bool nonvolatile;
        bool rom_device;
   +    bool sgx_epc_device;
        bool flush_coalesced_mmio;
        uint8_t dirty_log_mask;
        bool is_iommu;
   
  If this patch is not suitable to skip this memory region, any suggestion is 
  appreciated, thanks!

  Yang




> Paolo
> 
> >---
> >  backends/hostmem-memfd.c |  2 +-
> >  hw/misc/ivshmem.c        |  2 +-
> >  hw/remote/memory.c       |  2 +-
> >  hw/vfio/common.c         |  1 +
> >  include/exec/memory.h    | 15 +++++++++++++++
> >  softmmu/memory.c         | 12 ++++++++++--
> >  softmmu/physmem.c        |  2 +-
> >  7 files changed, 30 insertions(+), 6 deletions(-)
> >
> >diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
> >index 69b0ae30bb..d4267cc35c 100644
> >--- a/backends/hostmem-memfd.c
> >+++ b/backends/hostmem-memfd.c
> >@@ -55,7 +55,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
> >      name = host_memory_backend_get_name(backend);
> >      memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
> >                                     name, backend->size,
> >-                                   backend->share, fd, 0, errp);
> >+                                   backend->share, false, fd, 0, errp);
> >      g_free(name);
> >  }
> >diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> >index a1fa4878be..aa3fa80774 100644
> >--- a/hw/misc/ivshmem.c
> >+++ b/hw/misc/ivshmem.c
> >@@ -494,7 +494,7 @@ static void process_msg_shmem(IVShmemState *s, int fd, Error **errp)
> >      /* mmap the region and map into the BAR2 */
> >      memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s),
> >-                                   "ivshmem.bar2", size, true, fd, 0,
> >+                                   "ivshmem.bar2", size, true, false, fd, 0,
> >                                     &local_err);
> >      if (local_err) {
> >          error_propagate(errp, local_err);
> >diff --git a/hw/remote/memory.c b/hw/remote/memory.c
> >index 32085b1e05..5d0a213030 100644
> >--- a/hw/remote/memory.c
> >+++ b/hw/remote/memory.c
> >@@ -48,7 +48,7 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
> >          name = g_strdup_printf("remote-mem-%u", suffix++);
> >          memory_region_init_ram_from_fd(subregion, NULL,
> >                                         name, sysmem_info->sizes[region],
> >-                                       true, msg->fds[region],
> >+                                       true, false, msg->fds[region],
> >                                         sysmem_info->offsets[region],
> >                                         errp);
> >diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >index ae5654fcdb..5bc5d29358 100644
> >--- a/hw/vfio/common.c
> >+++ b/hw/vfio/common.c
> >@@ -538,6 +538,7 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
> >  {
> >      return (!memory_region_is_ram(section->mr) &&
> >              !memory_region_is_iommu(section->mr)) ||
> >+           memory_region_is_protected(section->mr) ||
> >             /*
> >              * Sizing an enabled 64-bit BAR can cause spurious mappings to
> >              * addresses in the upper part of the 64-bit address space.  These
> >diff --git a/include/exec/memory.h b/include/exec/memory.h
> >index 5728a681b2..2816e52be3 100644
> >--- a/include/exec/memory.h
> >+++ b/include/exec/memory.h
> >@@ -155,6 +155,9 @@ typedef struct IOMMUTLBEvent {
> >   */
> >  #define RAM_UF_WRITEPROTECT (1 << 6)
> >+/* RAM that isn't accessible through normal means. */
> >+#define RAM_PROTECTED (1 << 7)
> >+
> >  static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
> >                                         IOMMUNotifierFlag flags,
> >                                         hwaddr start, hwaddr end,
> >@@ -1021,6 +1024,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
> >   * @name: the name of the region.
> >   * @size: size of the region.
> >   * @share: %true if memory must be mmaped with the MAP_SHARED flag
> >+ * @protected: %true if memory is protected and isn't treated like normal RAM
> >   * @fd: the fd to mmap.
> >   * @offset: offset within the file referenced by fd
> >   * @errp: pointer to Error*, to store an error if it happens.
> >@@ -1033,6 +1037,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
> >                                      const char *name,
> >                                      uint64_t size,
> >                                      bool share,
> >+                                    bool protected,
> >                                      int fd,
> >                                      ram_addr_t offset,
> >                                      Error **errp);
> >@@ -1321,6 +1326,16 @@ static inline bool memory_region_is_romd(MemoryRegion *mr)
> >      return mr->rom_device && mr->romd_mode;
> >  }
> >+/**
> >+ * memory_region_is_protected: check whether a memory region is protected
> >+ *
> >+ * Returns %true if a memory region is protected RAM and cannot be accessed
> >+ * via standard mechanisms, e.g. DMA.
> >+ *
> >+ * @mr: the memory region being queried
> >+ */
> >+bool memory_region_is_protected(MemoryRegion *mr);
> >+
> >  /**
> >   * memory_region_get_iommu: check whether a memory region is an iommu
> >   *
> >diff --git a/softmmu/memory.c b/softmmu/memory.c
> >index d4493ef9e4..0c9eb335ca 100644
> >--- a/softmmu/memory.c
> >+++ b/softmmu/memory.c
> >@@ -1612,18 +1612,21 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
> >                                      const char *name,
> >                                      uint64_t size,
> >                                      bool share,
> >+                                    bool protected,
> >                                      int fd,
> >                                      ram_addr_t offset,
> >                                      Error **errp)
> >  {
> >+    uint32_t ram_flags = (share ? RAM_SHARED : 0) |
> >+                         (protected ? RAM_PROTECTED : 0);
> >      Error *err = NULL;
> >      memory_region_init(mr, owner, name, size);
> >      mr->ram = true;
> >      mr->terminates = true;
> >      mr->destructor = memory_region_destructor_ram;
> >-    mr->ram_block = qemu_ram_alloc_from_fd(size, mr,
> >-                                           share ? RAM_SHARED : 0,
> >+    mr->ram_block = qemu_ram_alloc_from_fd(size, mr, ram_flags,
> >                                             fd, offset, false, &err);
> >+
> >      if (err) {
> >          mr->size = int128_zero();
> >          object_unparent(OBJECT(mr));
> >@@ -1810,6 +1813,11 @@ bool memory_region_is_ram_device(MemoryRegion *mr)
> >      return mr->ram_device;
> >  }
> >+bool memory_region_is_protected(MemoryRegion *mr)
> >+{
> >+    return mr->ram && (mr->ram_block->flags & RAM_PROTECTED);
> >+}
> >+
> >  uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
> >  {
> >      uint8_t mask = mr->dirty_log_mask;
> >diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> >index 85034d9c11..ae79cbea96 100644
> >--- a/softmmu/physmem.c
> >+++ b/softmmu/physmem.c
> >@@ -2022,7 +2022,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
> >      int64_t file_size, file_align;
> >      /* Just support these ram flags by now. */
> >-    assert((ram_flags & ~(RAM_SHARED | RAM_PMEM)) == 0);
> >+    assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_PROTECTED)) == 0);
> >      if (xen_enabled()) {
> >          error_setg(errp, "-mem-path not supported with Xen");
> >

