Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71449667F9F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 20:51:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG3b0-0002Uy-Lx; Thu, 12 Jan 2023 14:50:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG3ay-0002Up-Ie
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 14:50:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG3aw-0005Cz-G4
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 14:50:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673553037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Im9pcxNI9Da50O8qUUB2oZBK2KckXG3c/qtIhZhP8A=;
 b=J4RvFWPz4A+eygs90wuVo4GSZ+UzDmzbTu5bxdwFnKiiIMvm1YM4G0OZBxsFQt/jPmS7Wq
 VrsQwuZhlCmC+zVGN+J1RGPiFyUr5Qm31PcaKGQpPjERMqgJii7QSAPIMngZ40/y3vD6Q2
 ua1OEyBkfSZti62pi4rNtAO8DwX5hQw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-361-2GFGgMrGMmeiC4BQHYVsqA-1; Thu, 12 Jan 2023 14:50:35 -0500
X-MC-Unique: 2GFGgMrGMmeiC4BQHYVsqA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n9-20020a05600c3b8900b003d9f14e904eso6985518wms.9
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 11:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Im9pcxNI9Da50O8qUUB2oZBK2KckXG3c/qtIhZhP8A=;
 b=oyHGMKlwwLWUmOzSk8ZUUqnyCsUeKoE6t7SQ5m+KY7WhuiiD/A2Qdx51aV8s7Kpy7t
 kNxg93y2uObfHlad+FiKIF1S7Zqw0B5mDfhTr+yVuoXRogU//1S7KxU3DZuPmr9WMALb
 PefS20Fip029TgAem/gVKiaf/jOlj9qzRMJV4Kold+1ygFVrfPlyGYFTyaAD6bVmisZv
 gqTL9uk3/1EkdHAQMltHa92aFXVeSQnM/ZepOabDL3w+V9O5oIJiampgZKFDAD/obZLO
 DNuFe/UUrH/K2aF9rxX3lolLnXG7/MGWcKBEXBW/UCf+sh+lBp9snKepygCsuxm8/CJX
 u6sw==
X-Gm-Message-State: AFqh2kqLuD9MLNGOmgEGpM2v3GPmV/Pit+ooGSqmrj9ga53KVIDWSQjI
 aWu+zwd1ZMm4rcIBtq6iXqXkwRzfZjMVj/nb9Kvse2+ypJpuJ4J3Rwuj7G+jJyT8GrVVEqqlpIW
 IGpb/ua8hoNIqvZs=
X-Received: by 2002:a5d:4483:0:b0:2bd:d4bd:581d with SMTP id
 j3-20020a5d4483000000b002bdd4bd581dmr2118075wrq.53.1673553034227; 
 Thu, 12 Jan 2023 11:50:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXveDH8Ov/Cze0YPnnNGPfh8Q02TdzzeNEfQs4Gfubc8PhB/n30elwyCVidHKGqfmtq6lgwKEg==
X-Received: by 2002:a5d:4483:0:b0:2bd:d4bd:581d with SMTP id
 j3-20020a5d4483000000b002bdd4bd581dmr2118057wrq.53.1673553033916; 
 Thu, 12 Jan 2023 11:50:33 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 q4-20020adfdfc4000000b002bc6c180738sm12453335wrn.90.2023.01.12.11.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 11:50:33 -0800 (PST)
Date: Thu, 12 Jan 2023 19:50:31 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, Jing Qi <jinqi@redhat.com>
Subject: Re: [PATCH v3 8/8] virtio-mem: Proper support for preallocation with
 migration
Message-ID: <Y8Bkh9FXOUj9mwDN@work-vm>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-9-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112164403.105085-9-david@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* David Hildenbrand (david@redhat.com) wrote:
> Ordinary memory preallocation runs when QEMU starts up and creates the
> memory backends, before processing the incoming migration stream. With
> virtio-mem, we don't know which memory blocks to preallocate before
> migration started. Now that we migrate the virtio-mem bitmap early, before
> migrating any RAM content, we can safely preallocate memory for all plugged
> memory blocks before migrating any RAM content.
> 
> This is especially relevant for the following cases:
> 
> (1) User errors
> 
> With hugetlb/files, if we don't have sufficient backend memory available on
> the migration destination, we'll crash QEMU (SIGBUS) during RAM migration
> when running out of backend memory. Preallocating memory before actual
> RAM migration allows for failing gracefully and informing the user about
> the setup problem.
> 
> (2) Excluded memory ranges during migration
> 
> For example, virtio-balloon free page hinting will exclude some pages
> from getting migrated. In that case, we won't crash during RAM
> migration, but later, when running the VM on the destination, which is
> bad.
> 
> To fix this for new QEMU machines that migrate the bitmap early,
> preallocate the memory early, before any RAM migration. Warn with old
> QEMU machines.
> 
> Getting postcopy right is a bit tricky, but we essentially now implement
> the same (problematic) preallocation logic as ordinary preallocation:
> preallocate memory early and discard it again before precopy starts. During
> ordinary preallocation, discarding of RAM happens when postcopy is advised.
> As the state (bitmap) is loaded after postcopy was advised but before
> postcopy starts listening, we have to discard memory we preallocated
> immediately again ourselves.
> 
> Note that nothing (not even hugetlb reservations) guarantees for postcopy
> that backend memory (especially, hugetlb pages) are still free after they
> were freed ones while discarding RAM. Still, allocating that memory at
> least once helps catching some basic setup problems.
> 
> Before this change, trying to restore a VM when insufficient hugetlb
> pages are around results in the process crashing to to a "Bus error"
> (SIGBUS). With this change, QEMU fails gracefully:
> 
>   qemu-system-x86_64: qemu_prealloc_mem: preallocating memory failed: Bad address
>   qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-mem-device-early'
>   qemu-system-x86_64: load of migration failed: Cannot allocate memory
> 
> And we can even introspect the early migration data, including the
> bitmap:
>   $ ./scripts/analyze-migration.py -f STATEFILE
>   {
>   "ram (2)": {
>       "section sizes": {
>           "0000:00:03.0/mem0": "0x0000000780000000",
>           "0000:00:04.0/mem1": "0x0000000780000000",
>           "pc.ram": "0x0000000100000000",
>           "/rom@etc/acpi/tables": "0x0000000000020000",
>           "pc.bios": "0x0000000000040000",
>           "0000:00:02.0/e1000.rom": "0x0000000000040000",
>           "pc.rom": "0x0000000000020000",
>           "/rom@etc/table-loader": "0x0000000000001000",
>           "/rom@etc/acpi/rsdp": "0x0000000000001000"
>       }
>   },
>   "0000:00:03.0/virtio-mem-device-early (51)": {
>       "tmp": "00 00 00 01 40 00 00 00 00 00 00 07 80 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00",
>       "size": "0x0000000040000000",
>       "bitmap": "ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff [...]
>   },
>   "0000:00:04.0/virtio-mem-device-early (53)": {
>       "tmp": "00 00 00 08 c0 00 00 00 00 00 00 07 80 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00",
>       "size": "0x00000001fa400000",
>       "bitmap": "ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff [...]
>   },
>   [...]
> 
> Reported-by: Jing Qi <jinqi@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/virtio/virtio-mem.c | 87 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index 51666baa01..4c3720249c 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -204,6 +204,30 @@ static int virtio_mem_for_each_unplugged_range(const VirtIOMEM *vmem, void *arg,
>      return ret;
>  }
>  
> +static int virtio_mem_for_each_plugged_range(const VirtIOMEM *vmem, void *arg,
> +                                             virtio_mem_range_cb cb)
> +{
> +    unsigned long first_bit, last_bit;
> +    uint64_t offset, size;
> +    int ret = 0;
> +
> +    first_bit = find_first_bit(vmem->bitmap, vmem->bitmap_size);
> +    while (first_bit < vmem->bitmap_size) {
> +        offset = first_bit * vmem->block_size;
> +        last_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size,
> +                                      first_bit + 1) - 1;
> +        size = (last_bit - first_bit + 1) * vmem->block_size;
> +
> +        ret = cb(vmem, arg, offset, size);
> +        if (ret) {
> +            break;
> +        }
> +        first_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size,
> +                                  last_bit + 2);
> +    }
> +    return ret;
> +}
> +
>  /*
>   * Adjust the memory section to cover the intersection with the given range.
>   *
> @@ -938,6 +962,10 @@ static int virtio_mem_post_load(void *opaque, int version_id)
>      RamDiscardListener *rdl;
>      int ret;
>  
> +    if (vmem->prealloc && !vmem->early_migration) {
> +        warn_report("Proper preallocation with migration requires a newer QEMU machine");
> +    }
> +
>      /*
>       * We started out with all memory discarded and our memory region is mapped
>       * into an address space. Replay, now that we updated the bitmap.
> @@ -957,6 +985,64 @@ static int virtio_mem_post_load(void *opaque, int version_id)
>      return virtio_mem_restore_unplugged(vmem);
>  }
>  
> +static int virtio_mem_prealloc_range_cb(const VirtIOMEM *vmem, void *arg,
> +                                        uint64_t offset, uint64_t size)
> +{
> +    void *area = memory_region_get_ram_ptr(&vmem->memdev->mr) + offset;
> +    int fd = memory_region_get_fd(&vmem->memdev->mr);
> +    Error *local_err = NULL;
> +
> +    qemu_prealloc_mem(fd, area, size, 1, NULL, &local_err);
> +    if (local_err) {
> +        error_report_err(local_err);
> +        return -ENOMEM;
> +    }
> +    return 0;
> +}
> +
> +static int virtio_mem_post_load_early(void *opaque, int version_id)
> +{
> +    VirtIOMEM *vmem = VIRTIO_MEM(opaque);
> +    RAMBlock *rb = vmem->memdev->mr.ram_block;
> +    int ret;
> +
> +    if (!vmem->prealloc) {
> +        return 0;
> +    }
> +
> +    /*
> +     * We restored the bitmap and verified that the basic properties
> +     * match on source and destination, so we can go ahead and preallocate
> +     * memory for all plugged memory blocks, before actual RAM migration starts
> +     * touching this memory.
> +     */
> +    ret = virtio_mem_for_each_plugged_range(vmem, NULL,
> +                                            virtio_mem_prealloc_range_cb);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    /*
> +     * This is tricky: postcopy wants to start with a clean slate. On
> +     * POSTCOPY_INCOMING_ADVISE, postcopy code discards all (ordinarily
> +     * preallocated) RAM such that postcopy will work as expected later.
> +     *
> +     * However, we run after POSTCOPY_INCOMING_ADVISE -- but before actual
> +     * RAM migration. So let's discard all memory again. This looks like an
> +     * expensive NOP, but actually serves a purpose: we made sure that we
> +     * were able to allocate all required backend memory once. We cannot
> +     * guarantee that the backend memory we will free will remain free
> +     * until we need it during postcopy, but at least we can catch the
> +     * obvious setup issues this way.
> +     */
> +    if (migration_incoming_postcopy_advised()) {
> +        if (ram_block_discard_range(rb, 0, qemu_ram_get_used_length(rb))) {
> +            return -EBUSY;
> +        }
> +    }
> +    return 0;
> +}
> +
>  typedef struct VirtIOMEMMigSanityChecks {
>      VirtIOMEM *parent;
>      uint64_t addr;
> @@ -1068,6 +1154,7 @@ static const VMStateDescription vmstate_virtio_mem_device_early = {
>      .minimum_version_id = 1,
>      .version_id = 1,
>      .immutable = 1,
> +    .post_load = virtio_mem_post_load_early,
>      .fields = (VMStateField[]) {
>          VMSTATE_WITH_TMP(VirtIOMEM, VirtIOMEMMigSanityChecks,
>                           vmstate_virtio_mem_sanity_checks),
> -- 
> 2.39.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


