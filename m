Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 895C5371E2D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:13:55 +0200 (CEST)
Received: from localhost ([::1]:44364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldc8o-0000nA-L2
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ldbww-00010k-TL
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:01:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ldbwt-0006kk-3i
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:01:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620061291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/EKM8eIoIFxYH5q5AqqFPx0yEJdPnh/pW4JlVAuv2g=;
 b=ARyqMW7n3qOMf38DtqmkWW6jxGEDmhTEZlY13EJB2z+hpAIv28qOLATRLTXOzioSrL7Uzj
 RHCqehqJzODo6hA5KP+sjl2NGmHAN8vsZ6RyiVNCZArgrCgcTHGjUpmj3jmSVD01KNpZDO
 addKFq+OIV5O+Y+fQW6SSUDd4fzKWxc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-7q4jtbgfO_e7bL5TcHAR8Q-1; Mon, 03 May 2021 13:01:30 -0400
X-MC-Unique: 7q4jtbgfO_e7bL5TcHAR8Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 p25-20020a1709061419b0290378364a6464so2322676ejc.15
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X/EKM8eIoIFxYH5q5AqqFPx0yEJdPnh/pW4JlVAuv2g=;
 b=Dqko0g8DINfA/TcMoL0gg9xFnSV5K6aJ0x1Ugj1rgty9eeWMsUwHxsBKJsai0Kj1za
 Td2tc8OcXwwSxlVorc9n4T5Fa6GCBrsPXwQ1XC5tKCuz7UW9X7tcKJqVN5yn/2tEWgKr
 b5k6TTrveAQ8oZpbLCE+lUh5BWvEm+1TD+HxTu8SykyT9jM64aS563KNEEZKg8LY11+w
 UiD1SOt3CKR98X4zmtGMxBXj6kirXczo/kUqFjYjWqwybXf/ApqKIynivkyitC6pxbKr
 Byz95dZPXsbLetbRR12bCVAgNkR2jsrvotbrn1hi9AyKUAKzQropxPR4UbBq6Fq17j+/
 PTRQ==
X-Gm-Message-State: AOAM532szs9DOEhd9LFhkGF5UUeTCCaTPMlUzwzh7X0MQqYw1BWPYh2s
 +wTf+kxAlAxU0PRO+rA4muCDHOg3HAy+exNNd+HLRQOUd1yh8y0fiT0sSdYVphbWkRqt5Ye8TTs
 pPSeVrnk+nMmsIZs=
X-Received: by 2002:aa7:c44b:: with SMTP id n11mr20593148edr.214.1620061288971; 
 Mon, 03 May 2021 10:01:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3ufwrC7cN8N02V+wQhibyWxhekJbdDnNV3n+FyJDSifKBYkI/VuHeaK4aQsBTChJozmvYcg==
X-Received: by 2002:aa7:c44b:: with SMTP id n11mr20593109edr.214.1620061288673; 
 Mon, 03 May 2021 10:01:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q18sm1646462edd.3.2021.05.03.10.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 10:01:28 -0700 (PDT)
Subject: Re: [RESEND PATCH 01/32] memory: Add RAM_PROTECTED flag to skip IOMMU
 mappings
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-2-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b216c2e4-abcb-d7bd-b461-96b731472b4d@redhat.com>
Date: Mon, 3 May 2021 19:01:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430062455.8117-2-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: seanjc@google.com, kai.huang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/04/21 08:24, Yang Zhong wrote:
> From: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> Add a new RAMBlock flag to denote "protected" memory, i.e. memory that
> looks and acts like RAM but is inaccessible via normal mechanisms,
> including DMA.  Use the flag to skip protected memory regions when
> mapping RAM for DMA in VFIO.
> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>

Can you instead unify this with the "share" argument, and pass the 
argument down to qemu_ram_alloc_from_fd?  This removes the "share ? 
RAM_SHARED : 0" conversion.

Paolo

> ---
>   backends/hostmem-memfd.c |  2 +-
>   hw/misc/ivshmem.c        |  2 +-
>   hw/remote/memory.c       |  2 +-
>   hw/vfio/common.c         |  1 +
>   include/exec/memory.h    | 15 +++++++++++++++
>   softmmu/memory.c         | 12 ++++++++++--
>   softmmu/physmem.c        |  2 +-
>   7 files changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
> index 69b0ae30bb..d4267cc35c 100644
> --- a/backends/hostmem-memfd.c
> +++ b/backends/hostmem-memfd.c
> @@ -55,7 +55,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>       name = host_memory_backend_get_name(backend);
>       memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
>                                      name, backend->size,
> -                                   backend->share, fd, 0, errp);
> +                                   backend->share, false, fd, 0, errp);
>       g_free(name);
>   }
>   
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index a1fa4878be..aa3fa80774 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -494,7 +494,7 @@ static void process_msg_shmem(IVShmemState *s, int fd, Error **errp)
>   
>       /* mmap the region and map into the BAR2 */
>       memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s),
> -                                   "ivshmem.bar2", size, true, fd, 0,
> +                                   "ivshmem.bar2", size, true, false, fd, 0,
>                                      &local_err);
>       if (local_err) {
>           error_propagate(errp, local_err);
> diff --git a/hw/remote/memory.c b/hw/remote/memory.c
> index 32085b1e05..5d0a213030 100644
> --- a/hw/remote/memory.c
> +++ b/hw/remote/memory.c
> @@ -48,7 +48,7 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
>           name = g_strdup_printf("remote-mem-%u", suffix++);
>           memory_region_init_ram_from_fd(subregion, NULL,
>                                          name, sysmem_info->sizes[region],
> -                                       true, msg->fds[region],
> +                                       true, false, msg->fds[region],
>                                          sysmem_info->offsets[region],
>                                          errp);
>   
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ae5654fcdb..5bc5d29358 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -538,6 +538,7 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
>   {
>       return (!memory_region_is_ram(section->mr) &&
>               !memory_region_is_iommu(section->mr)) ||
> +           memory_region_is_protected(section->mr) ||
>              /*
>               * Sizing an enabled 64-bit BAR can cause spurious mappings to
>               * addresses in the upper part of the 64-bit address space.  These
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 5728a681b2..2816e52be3 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -155,6 +155,9 @@ typedef struct IOMMUTLBEvent {
>    */
>   #define RAM_UF_WRITEPROTECT (1 << 6)
>   
> +/* RAM that isn't accessible through normal means. */
> +#define RAM_PROTECTED (1 << 7)
> +
>   static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
>                                          IOMMUNotifierFlag flags,
>                                          hwaddr start, hwaddr end,
> @@ -1021,6 +1024,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
>    * @name: the name of the region.
>    * @size: size of the region.
>    * @share: %true if memory must be mmaped with the MAP_SHARED flag
> + * @protected: %true if memory is protected and isn't treated like normal RAM
>    * @fd: the fd to mmap.
>    * @offset: offset within the file referenced by fd
>    * @errp: pointer to Error*, to store an error if it happens.
> @@ -1033,6 +1037,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
>                                       const char *name,
>                                       uint64_t size,
>                                       bool share,
> +                                    bool protected,
>                                       int fd,
>                                       ram_addr_t offset,
>                                       Error **errp);
> @@ -1321,6 +1326,16 @@ static inline bool memory_region_is_romd(MemoryRegion *mr)
>       return mr->rom_device && mr->romd_mode;
>   }
>   
> +/**
> + * memory_region_is_protected: check whether a memory region is protected
> + *
> + * Returns %true if a memory region is protected RAM and cannot be accessed
> + * via standard mechanisms, e.g. DMA.
> + *
> + * @mr: the memory region being queried
> + */
> +bool memory_region_is_protected(MemoryRegion *mr);
> +
>   /**
>    * memory_region_get_iommu: check whether a memory region is an iommu
>    *
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index d4493ef9e4..0c9eb335ca 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1612,18 +1612,21 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
>                                       const char *name,
>                                       uint64_t size,
>                                       bool share,
> +                                    bool protected,
>                                       int fd,
>                                       ram_addr_t offset,
>                                       Error **errp)
>   {
> +    uint32_t ram_flags = (share ? RAM_SHARED : 0) |
> +                         (protected ? RAM_PROTECTED : 0);
>       Error *err = NULL;
>       memory_region_init(mr, owner, name, size);
>       mr->ram = true;
>       mr->terminates = true;
>       mr->destructor = memory_region_destructor_ram;
> -    mr->ram_block = qemu_ram_alloc_from_fd(size, mr,
> -                                           share ? RAM_SHARED : 0,
> +    mr->ram_block = qemu_ram_alloc_from_fd(size, mr, ram_flags,
>                                              fd, offset, false, &err);
> +
>       if (err) {
>           mr->size = int128_zero();
>           object_unparent(OBJECT(mr));
> @@ -1810,6 +1813,11 @@ bool memory_region_is_ram_device(MemoryRegion *mr)
>       return mr->ram_device;
>   }
>   
> +bool memory_region_is_protected(MemoryRegion *mr)
> +{
> +    return mr->ram && (mr->ram_block->flags & RAM_PROTECTED);
> +}
> +
>   uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
>   {
>       uint8_t mask = mr->dirty_log_mask;
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 85034d9c11..ae79cbea96 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2022,7 +2022,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
>       int64_t file_size, file_align;
>   
>       /* Just support these ram flags by now. */
> -    assert((ram_flags & ~(RAM_SHARED | RAM_PMEM)) == 0);
> +    assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_PROTECTED)) == 0);
>   
>       if (xen_enabled()) {
>           error_setg(errp, "-mem-path not supported with Xen");
> 


