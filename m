Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591B02D4A90
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:39:29 +0100 (CET)
Received: from localhost ([::1]:33880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5JA-0005az-CU
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kn4Bo-0003IY-Oz
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:27:49 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:37369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kn4Bl-0005z3-31
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:27:48 -0500
Received: by mail-io1-xd42.google.com with SMTP id p187so2617727iod.4
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hKzqfrmmEYJRK2dPdiWgotNFrpu50pnluyooBTFkr+M=;
 b=IpVqP0r2zTsM88Z0ujkQ6jV14IM6n6EoHUwBo9WtV4q8IJwb7+icQKBCOxrkGKerYG
 t1BKe9UBSd/lGe36aNm/K92b/n6AZeYPhIRqoHiLunu8gNY/59DadYXHbmTWlGVQDJ0I
 7yj9FH37FqTQl8WgNUlJ9ohutMSWemFUvi6yNvBobcECp0JPZ1j6nMW8hOGKEzxjJHWq
 +3yzSFSHSMjHXWw47FlsHUpuOcA3ttqBDTPXGlF1S55zasCw/SUCuATLtKC7RA7KhB3a
 korfBRPscRsV1JJt0Be2Y80FyDGKrgkd5ATrlogMVyh5sh9CZxAACVxC2C+mFmYCLSkF
 W0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hKzqfrmmEYJRK2dPdiWgotNFrpu50pnluyooBTFkr+M=;
 b=sRfK44Yncl53+OVkM+y7gqJvZ7xLF1JAv7LCMxVMuX6An+0yKauNc47LBvxigwpTc3
 /YZige9EJabcNqaVXUeVm8+mV6ySH/9LwgLbFKN8YVWEqnPM7UgOlGHEuV+/jX3guoV2
 QNT/a/HhtaBbQJuK2VgZ9N+5/Cuv8yYKJwHxhvtbHxzkdlZHMLXinAoXTfIM5thXDsVQ
 WFojBNBmjXAqZAp3rvx/e5Gt9TCxQ2nE9wrZ6eXzziULWYYcTXOh/IirEJ9A8rqSyyuO
 KwlF00GbwSBRh0NxdDazbiZ6z0HQwfraU6lfdW5viNeEfoycIzRq7Fzgd62+aIeliIH/
 2JFA==
X-Gm-Message-State: AOAM530kFwSB4jirYQRspjympOq1JZd+ksDIDrP3lKZK3GuK/avD5xV2
 3qAMFEXB/IeGYJgCH/h9H13OhueqXm/yArWQFCA=
X-Google-Smtp-Source: ABdhPJwEQGcmXRN5a4vHlwGG1YkDAfCWf7J8u3Zl+fGr8R9J+OrVM+10PBpwj55pIGOyr7kanni6FvwSjUIDt26xtv8=
X-Received: by 2002:a5d:9c91:: with SMTP id p17mr4410319iop.36.1607538463420; 
 Wed, 09 Dec 2020 10:27:43 -0800 (PST)
MIME-Version: 1.0
References: <20201208163950.29617-1-david@redhat.com>
 <20201208163950.29617-2-david@redhat.com>
In-Reply-To: <20201208163950.29617-2-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 9 Dec 2020 19:27:32 +0100
Message-ID: <CAM9Jb+h-ehAKbmMCzz8X1PWj2E8q=Mq9_5007vT+kqwRruxLQQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] memory: Introduce RamDiscardMgr for RAM memory
 regions
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd42.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> We have some special RAM memory regions (managed by virtio-mem), whereby
> the guest agreed to only use selected memory ranges. "unused" parts are
> discarded so they won't consume memory - to logically unplug these memory
> ranges. Before the VM is allowed to use such logically unplugged memory
> again, coordination with the hypervisor is required.
>
> This results in "sparse" mmaps/RAMBlocks/memory regions, whereby only
> coordinated parts are valid to be used/accessed by the VM.
>
> In most cases, we don't care about that - e.g., in KVM, we simply have a
> single KVM memory slot. However, in case of vfio, registering the
> whole region with the kernel results in all pages getting pinned, and
> therefore an unexpected high memory consumption - discarding of RAM in
> that context is broken.
>
> Let's introduce a way to coordinate discarding/populating memory within a
> RAM memory region with such special consumers of RAM memory regions: they
> can register as listeners and get updates on memory getting discarded and
> populated. Using this machinery, vfio will be able to map only the
> currently populated parts, resulting in discarded parts not getting pinned
> and not consuming memory.
>
> A RamDiscardMgr has to be set for a memory region before it is getting
> mapped, and cannot change while the memory region is mapped.
>
> Note: At some point, we might want to let RAMBlock users (esp. vfio used
> for nvme://) consume this interface as well. We'll need RAMBlock notifier
> calls when a RAMBlock is getting mapped/unmapped (via the corresponding
> memory region), so we can properly register a listener there as well.
>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Auger Eric <eric.auger@redhat.com>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: teawater <teawaterz@linux.alibaba.com>
> Cc: Marek Kedzierski <mkedzier@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/exec/memory.h | 231 ++++++++++++++++++++++++++++++++++++++++++
>  softmmu/memory.c      |  22 ++++
>  2 files changed, 253 insertions(+)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 0f3e6bcd5e..30d4fcd2c0 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -42,6 +42,12 @@ typedef struct IOMMUMemoryRegionClass IOMMUMemoryRegionClass;
>  DECLARE_OBJ_CHECKERS(IOMMUMemoryRegion, IOMMUMemoryRegionClass,
>                       IOMMU_MEMORY_REGION, TYPE_IOMMU_MEMORY_REGION)
>
> +#define TYPE_RAM_DISCARD_MGR "qemu:ram-discard-mgr"
> +typedef struct RamDiscardMgrClass RamDiscardMgrClass;
> +typedef struct RamDiscardMgr RamDiscardMgr;
> +DECLARE_OBJ_CHECKERS(RamDiscardMgr, RamDiscardMgrClass, RAM_DISCARD_MGR,
> +                     TYPE_RAM_DISCARD_MGR);
> +
>  #ifdef CONFIG_FUZZ
>  void fuzz_dma_read_cb(size_t addr,
>                        size_t len,
> @@ -116,6 +122,66 @@ struct IOMMUNotifier {
>  };
>  typedef struct IOMMUNotifier IOMMUNotifier;
>
> +struct RamDiscardListener;
> +typedef int (*NotifyRamPopulate)(struct RamDiscardListener *rdl,
> +                                 const MemoryRegion *mr, ram_addr_t offset,
> +                                 ram_addr_t size);
> +typedef void (*NotifyRamDiscard)(struct RamDiscardListener *rdl,
> +                                 const MemoryRegion *mr, ram_addr_t offset,
> +                                 ram_addr_t size);
> +typedef void (*NotifyRamDiscardAll)(struct RamDiscardListener *rdl,
> +                                    const MemoryRegion *mr);
> +
> +typedef struct RamDiscardListener {
> +    /*
> +     * @notify_populate:
> +     *
> +     * Notification that previously discarded memory is about to get populated.
> +     * Listeners are able to object. If any listener objects, already
> +     * successfully notified listeners are notified about a discard again.
> +     *
> +     * @rdl: the #RamDiscardListener getting notified
> +     * @mr: the relevant #MemoryRegion
> +     * @offset: offset into the #MemoryRegion, aligned to minimum granularity of
> +     *          the #RamDiscardMgr
> +     * @size: the size, aligned to minimum granularity of the #RamDiscardMgr
> +     *
> +     * Returns 0 on success. If the notification is rejected by the listener,
> +     * an error is returned.
> +     */
> +    NotifyRamPopulate notify_populate;
> +
> +    /*
> +     * @notify_discard:
> +     *
> +     * Notification that previously populated memory was discarded successfully
> +     * and listeners should drop all references to such memory and prevent
> +     * new population (e.g., unmap).
> +     *
> +     * @rdl: the #RamDiscardListener getting notified
> +     * @mr: the relevant #MemoryRegion
> +     * @offset: offset into the #MemoryRegion, aligned to minimum granularity of
> +     *          the #RamDiscardMgr
> +     * @size: the size, aligned to minimum granularity of the #RamDiscardMgr
> +     */
> +    NotifyRamDiscard notify_discard;
> +
> +    /*
> +     * @notify_discard_all:
> +     *
> +     * Notification that all previously populated memory was discarded
> +     * successfully.
> +     *
> +     * Note: this callback is optional. If not set, individual notify_populate()
> +     * notifications are triggered.
> +     *
> +     * @rdl: the #RamDiscardListener getting notified
> +     * @mr: the relevant #MemoryRegion
> +     */
> +    NotifyRamDiscardAll notify_discard_all;
> +    QLIST_ENTRY(RamDiscardListener) next;
> +} RamDiscardListener;
> +
>  /* RAM is pre-allocated and passed into qemu_ram_alloc_from_ptr */
>  #define RAM_PREALLOC   (1 << 0)
>
> @@ -151,6 +217,16 @@ static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
>      n->iommu_idx = iommu_idx;
>  }
>
> +static inline void ram_discard_listener_init(RamDiscardListener *rdl,
> +                                             NotifyRamPopulate populate_fn,
> +                                             NotifyRamDiscard discard_fn,
> +                                             NotifyRamDiscardAll discard_all_fn)
> +{
> +    rdl->notify_populate = populate_fn;
> +    rdl->notify_discard = discard_fn;
> +    rdl->notify_discard_all = discard_all_fn;
> +}
> +
>  /*
>   * Memory region callbacks
>   */
> @@ -425,6 +501,126 @@ struct IOMMUMemoryRegionClass {
>                                       Error **errp);
>  };
>
> +/*
> + * RamDiscardMgrClass:
> + *
> + * A #RamDiscardMgr coordinates which parts of specific RAM #MemoryRegion
> + * regions are currently populated to be used/accessed by the VM, notifying
> + * after parts were discarded (freeing up memory) and before parts will be
> + * populated (consuming memory), to be used/acessed by the VM.
> + *
> + * A #RamDiscardMgr can only be set for a RAM #MemoryRegion while the
> + * #MemoryRegion isn't mapped yet; it cannot change while the #MemoryRegion is
> + * mapped.
> + *
> + * The #RamDiscardMgr is intended to be used by technologies that are
> + * incompatible with discarding of RAM (e.g., VFIO, which may pin all
> + * memory inside a #MemoryRegion), and require proper coordination to only
> + * map the currently populated parts, to hinder parts that are expected to
> + * remain discarded from silently getting populated and consuming memory.
> + * Technologies that support discarding of RAM don't have to bother and can
> + * simply map the whole #MemoryRegion.
> + *
> + * An example #RamDiscardMgr is virtio-mem, which logically (un)plugs
> + * memory within an assigned RAM #MemoryRegion, coordinated with the VM.
> + * Logically unplugging memory consists of discarding RAM. The VM agreed to not
> + * access unplugged (discarded) memory - especially via DMA. virtio-mem will
> + * properly coordinate with listeners before memory is plugged (populated),
> + * and after memory is unplugged (discarded).
> + *
> + * Listeners are called in multiples of the minimum granularity and changes are
> + * aligned to the minimum granularity within the #MemoryRegion. Listeners have
> + * to prepare for memory becomming discarded in a different granularity than it
> + * was populated and the other way around.
> + */
> +struct RamDiscardMgrClass {
> +    /* private */
> +    InterfaceClass parent_class;
> +
> +    /* public */
> +
> +    /**
> +     * @get_min_granularity:
> +     *
> +     * Get the minimum granularity in which listeners will get notified
> +     * about changes within the #MemoryRegion via the #RamDiscardMgr.
> +     *
> +     * @rdm: the #RamDiscardMgr
> +     * @mr: the #MemoryRegion
> +     *
> +     * Returns the minimum granularity.
> +     */
> +    uint64_t (*get_min_granularity)(const RamDiscardMgr *rdm,
> +                                    const MemoryRegion *mr);
> +
> +    /**
> +     * @is_populated:
> +     *
> +     * Check whether the given range within the #MemoryRegion is completely
> +     * populated (i.e., no parts are currently discarded). There are no
> +     * alignment requirements for the range.
> +     *
> +     * @rdm: the #RamDiscardMgr
> +     * @mr: the #MemoryRegion
> +     * @offset: offset into the #MemoryRegion
> +     * @size: size in the #MemoryRegion
> +     *
> +     * Returns whether the given range is completely populated.
> +     */
> +    bool (*is_populated)(const RamDiscardMgr *rdm, const MemoryRegion *mr,
> +                         ram_addr_t start, ram_addr_t offset);
> +
> +    /**
> +     * @register_listener:
> +     *
> +     * Register a #RamDiscardListener for a #MemoryRegion via the
> +     * #RamDiscardMgr and immediately notify the #RamDiscardListener about all
> +     * populated parts within the #MemoryRegion via the #RamDiscardMgr.
> +     *
> +     * In case any notification fails, no further notifications are triggered
> +     * and an error is logged.
> +     *
> +     * @rdm: the #RamDiscardMgr
> +     * @mr: the #MemoryRegion
> +     * @rdl: the #RamDiscardListener
> +     */
> +    void (*register_listener)(RamDiscardMgr *rdm, const MemoryRegion *mr,
> +                              RamDiscardListener *rdl);
> +
> +    /**
> +     * @unregister_listener:
> +     *
> +     * Unregister a previously registered #RamDiscardListener for a
> +     * #MemoryRegion via the #RamDiscardMgr after notifying the
> +     * #RamDiscardListener about all populated parts becoming unpopulated
> +     * within the #MemoryRegion via the #RamDiscardMgr.
> +     *
> +     * @rdm: the #RamDiscardMgr
> +     * @mr: the #MemoryRegion
> +     * @rdl: the #RamDiscardListener
> +     */
> +    void (*unregister_listener)(RamDiscardMgr *rdm, const MemoryRegion *mr,
> +                                RamDiscardListener *rdl);
> +
> +    /**
> +     * @replay_populated:
> +     *
> +     * Notify the #RamDiscardListener about all populated parts within the
> +     * #MemoryRegion via the #RamDiscardMgr.
> +     *
> +     * In case any notification fails, no further notifications are triggered.
> +     * The listener is not required to be registered.
> +     *
> +     * @rdm: the #RamDiscardMgr
> +     * @mr: the #MemoryRegion
> +     * @rdl: the #RamDiscardListener
> +     *
> +     * Returns 0 on success, or a negative error if any notification failed.
> +     */
> +    int (*replay_populated)(const RamDiscardMgr *rdm, const MemoryRegion *mr,
> +                            RamDiscardListener *rdl);
> +};
> +
>  typedef struct CoalescedMemoryRange CoalescedMemoryRange;
>  typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
>
> @@ -471,6 +667,7 @@ struct MemoryRegion {
>      const char *name;
>      unsigned ioeventfd_nb;
>      MemoryRegionIoeventfd *ioeventfds;
> +    RamDiscardMgr *rdm; /* Only for RAM */
>  };
>
>  struct IOMMUMemoryRegion {
> @@ -1965,6 +2162,40 @@ bool memory_region_present(MemoryRegion *container, hwaddr addr);
>   */
>  bool memory_region_is_mapped(MemoryRegion *mr);
>
> +/**
> + * memory_region_get_ram_discard_mgr: get the #RamDiscardMgr for a
> + * #MemoryRegion
> + *
> + * The #RamDiscardMgr cannot change while a memory region is mapped.
> + *
> + * @mr: the #MemoryRegion
> + */
> +RamDiscardMgr *memory_region_get_ram_discard_mgr(MemoryRegion *mr);
> +
> +/**
> + * memory_region_has_ram_discard_mgr: check whether a #MemoryRegion has a
> + * #RamDiscardMgr assigned
> + *
> + * @mr: the #MemoryRegion
> + */
> +static inline bool memory_region_has_ram_discard_mgr(MemoryRegion *mr)
> +{
> +    return !!memory_region_get_ram_discard_mgr(mr);
> +}
> +
> +/**
> + * memory_region_set_ram_discard_mgr: set the #RamDiscardMgr for a
> + * #MemoryRegion
> + *
> + * This function must not be called for a mapped #MemoryRegion, a #MemoryRegion
> + * that does not cover RAM, or a #MemoryRegion that already has a
> + * #RamDiscardMgr assigned.
> + *
> + * @mr: the #MemoryRegion
> + * @urn: #RamDiscardMgr to set
> + */
> +void memory_region_set_ram_discard_mgr(MemoryRegion *mr, RamDiscardMgr *rdm);
> +
>  /**
>   * memory_region_find: translate an address/size relative to a
>   * MemoryRegion into a #MemoryRegionSection.
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 11ca94d037..2f1fefb806 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2020,6 +2020,21 @@ int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr)
>      return imrc->num_indexes(iommu_mr);
>  }
>
> +RamDiscardMgr *memory_region_get_ram_discard_mgr(MemoryRegion *mr)
> +{
> +    if (!memory_region_is_mapped(mr) || !memory_region_is_ram(mr)) {
> +        return NULL;
> +    }
> +    return mr->rdm;
> +}
> +
> +void memory_region_set_ram_discard_mgr(MemoryRegion *mr, RamDiscardMgr *rdm)
> +{
> +    g_assert(memory_region_is_ram(mr) && !memory_region_is_mapped(mr));
> +    g_assert(!rdm || !mr->rdm);
> +    mr->rdm = rdm;
> +}
> +
>  void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
>  {
>      uint8_t mask = 1 << client;
> @@ -3301,10 +3316,17 @@ static const TypeInfo iommu_memory_region_info = {
>      .abstract           = true,
>  };
>
> +static const TypeInfo ram_discard_mgr_info = {
> +    .parent             = TYPE_INTERFACE,
> +    .name               = TYPE_RAM_DISCARD_MGR,
> +    .class_size         = sizeof(RamDiscardMgrClass),
> +};
> +
>  static void memory_register_types(void)
>  {
>      type_register_static(&memory_region_info);
>      type_register_static(&iommu_memory_region_info);
> +    type_register_static(&ram_discard_mgr_info);
>  }
>
>  type_init(memory_register_types)
> --

Class structures and all the stubs looks good to me.

Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>

> 2.28.0
>

