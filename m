Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8515D2FCBE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 15:58:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWLZA-0005UR-Oz
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 09:58:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hWLV4-0002Sp-GT
	for qemu-devel@nongnu.org; Thu, 30 May 2019 09:53:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hWLV0-0007pb-Lv
	for qemu-devel@nongnu.org; Thu, 30 May 2019 09:53:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43486)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hWLUz-0007nl-Of
	for qemu-devel@nongnu.org; Thu, 30 May 2019 09:53:41 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C85ED9FFC0
	for <qemu-devel@nongnu.org>; Thu, 30 May 2019 13:53:37 +0000 (UTC)
Received: from work-vm (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DE041009976;
	Thu, 30 May 2019 13:53:34 +0000 (UTC)
Date: Thu, 30 May 2019 14:53:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Message-ID: <20190530135329.GG2823@work-vm>
References: <20190530092919.26059-1-peterx@redhat.com>
	<20190530092919.26059-10-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190530092919.26059-10-peterx@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 30 May 2019 13:53:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 09/12] kvm: Persistent per kvmslot dirty
 bitmap
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> When synchronizing dirty bitmap from kernel KVM we do it in a
> per-kvmslot fashion and we allocate the userspace bitmap for each of
> the ioctl.  This patch instead make the bitmap cache be persistent
> then we don't need to g_malloc0() every time.
> 
> More importantly, the cached per-kvmslot dirty bitmap will be further
> used when we want to add support for the KVM_CLEAR_DIRTY_LOG and this
> cached bitmap will be used to guarantee we won't clear any unknown
> dirty bits otherwise that can be a severe data loss issue for
> migration code.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Is there no way to make this get allocated the first time it's needed?
I'm thinking here of the VM most of the time not being migrated so we're
allocating this structure for no benefit.

Dave

> ---
>  accel/kvm/kvm-all.c      | 39 +++++++++++++++++++++------------------
>  include/sysemu/kvm_int.h |  2 ++
>  2 files changed, 23 insertions(+), 18 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index b686531586..334c610918 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -497,31 +497,14 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
>              return 0;
>          }
>  
> -        /* XXX bad kernel interface alert
> -         * For dirty bitmap, kernel allocates array of size aligned to
> -         * bits-per-long.  But for case when the kernel is 64bits and
> -         * the userspace is 32bits, userspace can't align to the same
> -         * bits-per-long, since sizeof(long) is different between kernel
> -         * and user space.  This way, userspace will provide buffer which
> -         * may be 4 bytes less than the kernel will use, resulting in
> -         * userspace memory corruption (which is not detectable by valgrind
> -         * too, in most cases).
> -         * So for now, let's align to 64 instead of HOST_LONG_BITS here, in
> -         * a hope that sizeof(long) won't become >8 any time soon.
> -         */
> -        size = ALIGN(((mem->memory_size) >> TARGET_PAGE_BITS),
> -                     /*HOST_LONG_BITS*/ 64) / 8;
> -        d.dirty_bitmap = g_malloc0(size);
> -
> +        d.dirty_bitmap = mem->dirty_bmap;
>          d.slot = mem->slot | (kml->as_id << 16);
>          if (kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) == -1) {
>              DPRINTF("ioctl failed %d\n", errno);
> -            g_free(d.dirty_bitmap);
>              return -1;
>          }
>  
>          kvm_get_dirty_pages_log_range(section, d.dirty_bitmap);
> -        g_free(d.dirty_bitmap);
>      }
>  
>      return 0;
> @@ -765,6 +748,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
>      MemoryRegion *mr = section->mr;
>      bool writeable = !mr->readonly && !mr->rom_device;
>      hwaddr start_addr, size;
> +    unsigned long bmap_size;
>      void *ram;
>  
>      if (!memory_region_is_ram(mr)) {
> @@ -796,6 +780,8 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
>          }
>  
>          /* unregister the slot */
> +        g_free(mem->dirty_bmap);
> +        mem->dirty_bmap = NULL;
>          mem->memory_size = 0;
>          mem->flags = 0;
>          err = kvm_set_user_memory_region(kml, mem, false);
> @@ -807,12 +793,29 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
>          return;
>      }
>  
> +    /*
> +     * XXX bad kernel interface alert For dirty bitmap, kernel
> +     * allocates array of size aligned to bits-per-long.  But for case
> +     * when the kernel is 64bits and the userspace is 32bits,
> +     * userspace can't align to the same bits-per-long, since
> +     * sizeof(long) is different between kernel and user space.  This
> +     * way, userspace will provide buffer which may be 4 bytes less
> +     * than the kernel will use, resulting in userspace memory
> +     * corruption (which is not detectable by valgrind too, in most
> +     * cases).  So for now, let's align to 64 instead of
> +     * HOST_LONG_BITS here, in a hope that sizeof(long) won't become
> +     * >8 any time soon.
> +     */
> +    bmap_size = ALIGN((size >> TARGET_PAGE_BITS),
> +                      /*HOST_LONG_BITS*/ 64) / 8;
> +
>      /* register the new slot */
>      mem = kvm_alloc_slot(kml);
>      mem->memory_size = size;
>      mem->start_addr = start_addr;
>      mem->ram = ram;
>      mem->flags = kvm_mem_flags(mr);
> +    mem->dirty_bmap = g_malloc0(bmap_size);
>  
>      err = kvm_set_user_memory_region(kml, mem, true);
>      if (err) {
> diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
> index f838412491..687a2ee423 100644
> --- a/include/sysemu/kvm_int.h
> +++ b/include/sysemu/kvm_int.h
> @@ -21,6 +21,8 @@ typedef struct KVMSlot
>      int slot;
>      int flags;
>      int old_flags;
> +    /* Dirty bitmap cache for the slot */
> +    unsigned long *dirty_bmap;
>  } KVMSlot;
>  
>  typedef struct KVMMemoryListener {
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

