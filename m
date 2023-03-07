Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616F96ADC6A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:52:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUvI-0000GB-7Y; Tue, 07 Mar 2023 05:52:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZUvE-0000Bx-J0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:51:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZUv9-0008E4-VH
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678186311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o5jvonjECihz1WGXXygyjA7yvQlq1DKaejebIwhgxtQ=;
 b=DY4G2fHukjFv+vRhugxsIJIxT2kp9PwPbQKQG4nsAdOyVQsr6CudlT0Gmxas0WIrtPJU8B
 nCgLUbpYys93AFlG451spoP4t61uPuJsISQhNBx510e64qvn5OcijQBllEAGK6XhES+SWM
 9ebMpqWq78/FhBSFQK7P2ZiPrLp5WSs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-_yUo0R0pOQeEVFRWpBBlBA-1; Tue, 07 Mar 2023 05:51:49 -0500
X-MC-Unique: _yUo0R0pOQeEVFRWpBBlBA-1
Received: by mail-ed1-f69.google.com with SMTP id
 ev6-20020a056402540600b004bc2358ac04so18520435edb.21
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 02:51:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678186308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o5jvonjECihz1WGXXygyjA7yvQlq1DKaejebIwhgxtQ=;
 b=iX0buw0oHuQxgtTLBQSzLK3eyddi3c95Owuf+ReV0345KnqRYADIPCTQ680n8LR12W
 xeEp14RUyIw8u2weU7CmYFd8wKE4ZaZzU32FdZP4OScwxHrShDqK5NbucdRT8l7nFFhw
 PLPJo6YxxERX6+XMQrzPgPyv4I9jlXnkMsZzCTJ5w/HloAwv3gYREguWD3ZjqOQ6Phbn
 k82XtjxkAyHtEMVoZ6rnm0/TlKO4J3JXAldjeGGRG/2FZXiXH2930lXZ+/ebU4NhHV9t
 GQpAeWxD/to8NMN7edJ4QxB6E3uSMNPs6UmHD2bjf+xmSwt8bpu2K7vD+p27xKLhShwU
 CWGQ==
X-Gm-Message-State: AO0yUKVl0JHTMnEdX3ptzVDDsmvCMhto/PCfowutqJuClsC3isLNREMs
 vJsD4yWQ/Ltyk414m3TQyVOH1GKem3US4FnN6IUsvpKm8IaYeLYCGtNFShU4PqucOIuPapneo0F
 1CYOUw3qwYhZYe5A=
X-Received: by 2002:aa7:cfc2:0:b0:4bf:f9f4:9b1e with SMTP id
 r2-20020aa7cfc2000000b004bff9f49b1emr12548879edy.4.1678186308672; 
 Tue, 07 Mar 2023 02:51:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8Vp9At1cOPLGmvNISTfaCc7fQTXJ6z0LrCHj60TzlPrx91ifjEdXonl7aJbSS/3hecQGopkA==
X-Received: by 2002:aa7:cfc2:0:b0:4bf:f9f4:9b1e with SMTP id
 r2-20020aa7cfc2000000b004bff9f49b1emr12548869edy.4.1678186308393; 
 Tue, 07 Mar 2023 02:51:48 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 n24-20020a509358000000b004af5001c7ecsm6490522eda.12.2023.03.07.02.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 02:51:47 -0800 (PST)
Date: Tue, 7 Mar 2023 11:51:47 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>, Tiwei Bie <tiwei.bie@intel.com>
Subject: Re: [PATCH v1 1/2] vhost: Defer filtering memory sections until
 building the vhost memory structure
Message-ID: <20230307115147.42df4ba0@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230216114752.198627-2-david@redhat.com>
References: <20230216114752.198627-1-david@redhat.com>
 <20230216114752.198627-2-david@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Thu, 16 Feb 2023 12:47:51 +0100
David Hildenbrand <david@redhat.com> wrote:

> Having multiple devices, some filtering memslots and some not filtering
> memslots, messes up the "used_memslot" accounting. If we'd have a device
> the filters out less memory sections after a device that filters out more,
> we'd be in trouble, because our memslot checks stop working reliably.
> For example, hotplugging a device that filters out less memslots might end
> up passing the checks based on max vs. used memslots, but can run out of
> memslots when getting notified about all memory sections.

an hypothetical example of such case would be appreciated
(I don't really get how above can happen, perhaps more detailed explanation
would help)
 
> Further, it will be helpful in memory device context in the near future
> to know that a RAM memory region section will consume a memslot, and be
> accounted for in the used vs. free memslots, such that we can implement
> reservation of memslots for memory devices properly. Whether a device
> filters this out and would theoretically still have a free memslot is
> then hidden internally, making overall vhost memslot accounting easier.
> 
> Let's filter the memslots when creating the vhost memory array,
> accounting all RAM && !ROM memory regions as "used_memslots" even if
> vhost_user isn't interested in anonymous RAM regions, because it needs
> an fd.
> 
> When a device actually filters out regions (which should happen rarely
> in practice), we might detect a layout change although only filtered
> regions changed. We won't bother about optimizing that for now.
> 
> Note: we cannot simply filter out the region and count them as
> "filtered" to add them to used, because filtered regions could get
> merged and result in a smaller effective number of memslots. Further,
> we won't touch the hmp/qmp virtio introspection output.
What output exactly you are talking about?

PS:
If we drop vhost_dev::memm the bulk of this patch would go away

side questions:
do we have MemorySection merging on qemu's kvm side?
also does KVM merge merge memslots?
 
> Fixes: 988a27754bbb ("vhost: allow backends to filter memory sections")
> Cc: Tiwei Bie <tiwei.bie@intel.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/virtio/vhost.c | 79 +++++++++++++++++++++++++++++++++--------------
>  1 file changed, 55 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index eb8c4c378c..b7fb960fa9 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -219,8 +219,13 @@ static void vhost_log_sync_range(struct vhost_dev *dev,
>      int i;
>      /* FIXME: this is N^2 in number of sections */
>      for (i = 0; i < dev->n_mem_sections; ++i) {
> -        MemoryRegionSection *section = &dev->mem_sections[i];
> -        vhost_sync_dirty_bitmap(dev, section, first, last);
> +        MemoryRegionSection *mrs = &dev->mem_sections[i];
> +
> +        if (dev->vhost_ops->vhost_backend_mem_section_filter &&
> +            !dev->vhost_ops->vhost_backend_mem_section_filter(dev, mrs)) {
> +            continue;
> +        }
> +        vhost_sync_dirty_bitmap(dev, mrs, first, last);
>      }
>  }
>  
> @@ -503,12 +508,6 @@ static bool vhost_section(struct vhost_dev *dev, MemoryRegionSection *section)
>              return false;
>          }
>  
> -        if (dev->vhost_ops->vhost_backend_mem_section_filter &&
> -            !dev->vhost_ops->vhost_backend_mem_section_filter(dev, section)) {
> -            trace_vhost_reject_section(mr->name, 2);
> -            return false;
> -        }
> -
>          trace_vhost_section(mr->name);
>          return true;
>      } else {
> @@ -525,6 +524,43 @@ static void vhost_begin(MemoryListener *listener)
>      dev->n_tmp_sections = 0;
>  }
>  
> +static void vhost_realloc_vhost_memory(struct vhost_dev *dev,
> +                                       unsigned int nregions)
> +{
> +    const size_t size = offsetof(struct vhost_memory, regions) +
> +                        nregions * sizeof dev->mem->regions[0];
> +
> +    dev->mem = g_realloc(dev->mem, size);
> +    dev->mem->nregions = nregions;
> +}
> +
> +static void vhost_rebuild_vhost_memory(struct vhost_dev *dev)
> +{
> +    unsigned int nregions = 0;
> +    int i;
> +
> +    vhost_realloc_vhost_memory(dev, dev->n_mem_sections);
> +    for (i = 0; i < dev->n_mem_sections; i++) {
> +        struct MemoryRegionSection *mrs = dev->mem_sections + i;
> +        struct vhost_memory_region *cur_vmr;
> +
> +        if (dev->vhost_ops->vhost_backend_mem_section_filter &&
> +            !dev->vhost_ops->vhost_backend_mem_section_filter(dev, mrs)) {
> +            continue;
> +        }
> +        cur_vmr = dev->mem->regions + nregions;
> +        nregions++;
> +
> +        cur_vmr->guest_phys_addr = mrs->offset_within_address_space;
> +        cur_vmr->memory_size     = int128_get64(mrs->size);
> +        cur_vmr->userspace_addr  =
> +            (uintptr_t)memory_region_get_ram_ptr(mrs->mr) +
> +            mrs->offset_within_region;
> +        cur_vmr->flags_padding   = 0;
> +    }
> +    vhost_realloc_vhost_memory(dev, nregions);
> +}
> +
>  static void vhost_commit(MemoryListener *listener)
>  {
>      struct vhost_dev *dev = container_of(listener, struct vhost_dev,
> @@ -532,7 +568,6 @@ static void vhost_commit(MemoryListener *listener)
>      MemoryRegionSection *old_sections;
>      int n_old_sections;
>      uint64_t log_size;
> -    size_t regions_size;
>      int r;
>      int i;
>      bool changed = false;
> @@ -564,23 +599,19 @@ static void vhost_commit(MemoryListener *listener)
>          goto out;
>      }
>  
> -    /* Rebuild the regions list from the new sections list */
> -    regions_size = offsetof(struct vhost_memory, regions) +
> -                       dev->n_mem_sections * sizeof dev->mem->regions[0];
> -    dev->mem = g_realloc(dev->mem, regions_size);
> -    dev->mem->nregions = dev->n_mem_sections;
> +    /*
> +     * Globally track the used memslots *without* device specific
> +     * filtering. This way, we always know how many memslots are required
> +     * when devices with differing filtering requirements get mixed, and
> +     * all RAM memory regions of memory devices will consume memslots.
> +     */
>      used_memslots = dev->mem->nregions;
> -    for (i = 0; i < dev->n_mem_sections; i++) {
> -        struct vhost_memory_region *cur_vmr = dev->mem->regions + i;
> -        struct MemoryRegionSection *mrs = dev->mem_sections + i;
>  
> -        cur_vmr->guest_phys_addr = mrs->offset_within_address_space;
> -        cur_vmr->memory_size     = int128_get64(mrs->size);
> -        cur_vmr->userspace_addr  =
> -            (uintptr_t)memory_region_get_ram_ptr(mrs->mr) +
> -            mrs->offset_within_region;
> -        cur_vmr->flags_padding   = 0;
> -    }
> +    /*
> +     * Rebuild the regions list from the new sections list, filtering out all
> +     * sections that this device is not interested in.
> +     */
> +    vhost_rebuild_vhost_memory(dev);
>  
>      if (!dev->started) {
>          goto out;


