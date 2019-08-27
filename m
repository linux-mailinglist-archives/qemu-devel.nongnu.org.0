Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896879E87A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 14:57:41 +0200 (CEST)
Received: from localhost ([::1]:51242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2b2a-0004pa-KX
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 08:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1i2b1c-0004L0-Fw
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 08:56:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1i2b1Z-0003eT-AV
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 08:56:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44668)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1i2b1Z-0003dn-20; Tue, 27 Aug 2019 08:56:37 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3192D18B3D83;
 Tue, 27 Aug 2019 12:56:36 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57EFB600D1;
 Tue, 27 Aug 2019 12:56:30 +0000 (UTC)
Date: Tue, 27 Aug 2019 14:56:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20190827145629.62c5839e@redhat.com>
In-Reply-To: <20190820180727.32cf4891.cohuck@redhat.com>
References: <20190806094834.7691-2-imammedo@redhat.com>
 <20190807153241.24050-1-imammedo@redhat.com>
 <20190820180727.32cf4891.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Tue, 27 Aug 2019 12:56:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-4.2 v5 1/2] kvm: s390: split too big
 memory section on several memslots
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
Cc: thuth@redhat.com, david@redhat.com, qemu-devel@nongnu.org,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Aug 2019 18:07:27 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Wed,  7 Aug 2019 11:32:41 -0400
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > Max memslot size supported by kvm on s390 is 8Tb,
> > move logic of splitting RAM in chunks upto 8T to KVM code.
> > 
> > This way it will hide KVM specific restrictions in KVM code
> > and won't affect baord level design decisions. Which would allow
> > us to avoid misusing memory_region_allocate_system_memory() API
> > and eventually use a single hostmem backend for guest RAM.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v5:
> >   * move computation 'size -= slot_size' inside of loop body
> >           (David Hildenbrand <david@redhat.com>)
> > v4:
> >   * fix compilation issue
> >           (Christian Borntraeger <borntraeger@de.ibm.com>)
> >   * advance HVA along with GPA in kvm_set_phys_mem()
> >           (Christian Borntraeger <borntraeger@de.ibm.com>)
> > 
> > patch prepares only KVM side for switching to single RAM memory region
> > another patch will take care of  dropping manual RAM partitioning in
> > s390 code.  
> 
> I may have lost track a bit -- what is the status of this patch (and
> the series)?

Christian,

could you test it on a host that have sufficient amount of RAM?

PS:
I've only simulated test on smaller host with KVM enabled
(by reducing KVM_SLOT_MAX_BYTES size) to verify that KVM code splits
RAM on smaller chunks.

PS2:
Also considering we decided to drop migration concerns there
is no need to check migration on a large enough host anymore.


> 
> > ---
> >  include/sysemu/kvm_int.h   |  1 +
> >  accel/kvm/kvm-all.c        | 82 ++++++++++++++++++++++++--------------
> >  hw/s390x/s390-virtio-ccw.c |  9 -----
> >  target/s390x/kvm.c         | 12 ++++++
> >  4 files changed, 64 insertions(+), 40 deletions(-)
> > 
> > diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
> > index 31df465fdc..7f7520bce2 100644
> > --- a/include/sysemu/kvm_int.h
> > +++ b/include/sysemu/kvm_int.h
> > @@ -41,4 +41,5 @@ typedef struct KVMMemoryListener {
> >  void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
> >                                    AddressSpace *as, int as_id);
> >  
> > +void kvm_set_max_memslot_size(hwaddr max_slot_size);
> >  #endif
> > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > index f450f25295..8153556335 100644
> > --- a/accel/kvm/kvm-all.c
> > +++ b/accel/kvm/kvm-all.c
> > @@ -138,6 +138,7 @@ bool kvm_direct_msi_allowed;
> >  bool kvm_ioeventfd_any_length_allowed;
> >  bool kvm_msi_use_devid;
> >  static bool kvm_immediate_exit;
> > +static hwaddr kvm_max_slot_size = ~0;
> >  
> >  static const KVMCapabilityInfo kvm_required_capabilites[] = {
> >      KVM_CAP_INFO(USER_MEMORY),
> > @@ -951,6 +952,14 @@ kvm_check_extension_list(KVMState *s, const KVMCapabilityInfo *list)
> >      return NULL;
> >  }
> >  
> > +void kvm_set_max_memslot_size(hwaddr max_slot_size)
> > +{
> > +    g_assert(
> > +        ROUND_UP(max_slot_size, qemu_real_host_page_size) == max_slot_size
> > +    );
> > +    kvm_max_slot_size = max_slot_size;
> > +}
> > +
> >  static void kvm_set_phys_mem(KVMMemoryListener *kml,
> >                               MemoryRegionSection *section, bool add)
> >  {
> > @@ -958,7 +967,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
> >      int err;
> >      MemoryRegion *mr = section->mr;
> >      bool writeable = !mr->readonly && !mr->rom_device;
> > -    hwaddr start_addr, size;
> > +    hwaddr start_addr, size, slot_size;
> >      void *ram;
> >  
> >      if (!memory_region_is_ram(mr)) {
> > @@ -983,41 +992,52 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
> >      kvm_slots_lock(kml);
> >  
> >      if (!add) {
> > -        mem = kvm_lookup_matching_slot(kml, start_addr, size);
> > -        if (!mem) {
> > -            goto out;
> > -        }
> > -        if (mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
> > -            kvm_physical_sync_dirty_bitmap(kml, section);
> > -        }
> > +        do {
> > +            slot_size = kvm_max_slot_size < size ? kvm_max_slot_size : size;
> > +            mem = kvm_lookup_matching_slot(kml, start_addr, slot_size);
> > +            if (!mem) {
> > +                goto out;
> > +            }
> > +            if (mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
> > +                kvm_physical_sync_dirty_bitmap(kml, section);
> > +            }
> >  
> > -        /* unregister the slot */
> > -        g_free(mem->dirty_bmap);
> > -        mem->dirty_bmap = NULL;
> > -        mem->memory_size = 0;
> > -        mem->flags = 0;
> > -        err = kvm_set_user_memory_region(kml, mem, false);
> > -        if (err) {
> > -            fprintf(stderr, "%s: error unregistering slot: %s\n",
> > -                    __func__, strerror(-err));
> > -            abort();
> > -        }
> > +            /* unregister the slot */
> > +            g_free(mem->dirty_bmap);
> > +            mem->dirty_bmap = NULL;
> > +            mem->memory_size = 0;
> > +            mem->flags = 0;
> > +            err = kvm_set_user_memory_region(kml, mem, false);
> > +            if (err) {
> > +                fprintf(stderr, "%s: error unregistering slot: %s\n",
> > +                        __func__, strerror(-err));
> > +                abort();
> > +            }
> > +            start_addr += slot_size;
> > +            size -= slot_size;
> > +        } while (size);
> >          goto out;
> >      }
> >  
> >      /* register the new slot */
> > -    mem = kvm_alloc_slot(kml);
> > -    mem->memory_size = size;
> > -    mem->start_addr = start_addr;
> > -    mem->ram = ram;
> > -    mem->flags = kvm_mem_flags(mr);
> > -
> > -    err = kvm_set_user_memory_region(kml, mem, true);
> > -    if (err) {
> > -        fprintf(stderr, "%s: error registering slot: %s\n", __func__,
> > -                strerror(-err));
> > -        abort();
> > -    }
> > +    do {
> > +        slot_size = kvm_max_slot_size < size ? kvm_max_slot_size : size;
> > +        mem = kvm_alloc_slot(kml);
> > +        mem->memory_size = slot_size;
> > +        mem->start_addr = start_addr;
> > +        mem->ram = ram;
> > +        mem->flags = kvm_mem_flags(mr);
> > +
> > +        err = kvm_set_user_memory_region(kml, mem, true);
> > +        if (err) {
> > +            fprintf(stderr, "%s: error registering slot: %s\n", __func__,
> > +                    strerror(-err));
> > +            abort();
> > +        }
> > +        start_addr += slot_size;
> > +        ram += slot_size;
> > +        size -= slot_size;
> > +    } while (size);
> >  
> >  out:
> >      kvm_slots_unlock(kml);
> > diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> > index 5b6a9a4e55..0c03ffb7c7 100644
> > --- a/hw/s390x/s390-virtio-ccw.c
> > +++ b/hw/s390x/s390-virtio-ccw.c
> > @@ -151,15 +151,6 @@ static void virtio_ccw_register_hcalls(void)
> >                                     virtio_ccw_hcall_early_printk);
> >  }
> >  
> > -/*
> > - * KVM does only support memory slots up to KVM_MEM_MAX_NR_PAGES pages
> > - * as the dirty bitmap must be managed by bitops that take an int as
> > - * position indicator. If we have a guest beyond that we will split off
> > - * new subregions. The split must happen on a segment boundary (1MB).
> > - */
> > -#define KVM_MEM_MAX_NR_PAGES ((1ULL << 31) - 1)
> > -#define SEG_MSK (~0xfffffULL)
> > -#define KVM_SLOT_MAX_BYTES ((KVM_MEM_MAX_NR_PAGES * TARGET_PAGE_SIZE) & SEG_MSK)
> >  static void s390_memory_init(ram_addr_t mem_size)
> >  {
> >      MemoryRegion *sysmem = get_system_memory();
> > diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> > index 6e814c230b..6b1428a760 100644
> > --- a/target/s390x/kvm.c
> > +++ b/target/s390x/kvm.c
> > @@ -28,6 +28,7 @@
> >  #include "cpu.h"
> >  #include "internal.h"
> >  #include "kvm_s390x.h"
> > +#include "sysemu/kvm_int.h"
> >  #include "qapi/error.h"
> >  #include "qemu/error-report.h"
> >  #include "qemu/timer.h"
> > @@ -122,6 +123,16 @@
> >  #define VCPU_IRQ_BUF_SIZE(max_cpus) (sizeof(struct kvm_s390_irq) * \
> >                                       (max_cpus + NR_LOCAL_IRQS))
> >  
> > +/*
> > + * KVM does only support memory slots up to KVM_MEM_MAX_NR_PAGES pages
> > + * as the dirty bitmap must be managed by bitops that take an int as
> > + * position indicator. If we have a guest beyond that we will split off
> > + * new subregions. The split must happen on a segment boundary (1MB).
> > + */
> > +#define KVM_MEM_MAX_NR_PAGES ((1ULL << 31) - 1)
> > +#define SEG_MSK (~0xfffffULL)
> > +#define KVM_SLOT_MAX_BYTES ((KVM_MEM_MAX_NR_PAGES * TARGET_PAGE_SIZE) & SEG_MSK)
> > +
> >  static CPUWatchpoint hw_watchpoint;
> >  /*
> >   * We don't use a list because this structure is also used to transmit the
> > @@ -347,6 +358,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
> >       */
> >      /* kvm_vm_enable_cap(s, KVM_CAP_S390_AIS, 0); */
> >  
> > +    kvm_set_max_memslot_size(KVM_SLOT_MAX_BYTES);
> >      return 0;
> >  }
> >    
> 


