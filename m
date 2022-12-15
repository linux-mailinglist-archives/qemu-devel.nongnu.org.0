Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5FB64DB61
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:40:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nXQ-00036Q-1K; Thu, 15 Dec 2022 07:40:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p5nWx-00035B-Nd
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:40:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p5nWt-0008Ms-UY
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671108003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aD/UeCfCDgKalmUa1x79gyFdLr3F+vkuYPHOq045YJ0=;
 b=PYlhia72bpos15wuHfgSXkieLMCsxwmANpAXSdKUkZmrJQ47eeaN+4s5qqLEnI0gJcIgMt
 S67cbZeWRNA68RXP1kZL14rj327b95RdSyYMs2NZYAh7TorbyPnnljnmUFAxHENwOMwLpi
 TsR4D+PJb2pWZtJ+A74e01sHZ6EybaI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-673-sv3eZYHJMbqV_lgerwCIWQ-1; Thu, 15 Dec 2022 07:40:01 -0500
X-MC-Unique: sv3eZYHJMbqV_lgerwCIWQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 c13-20020adfa70d000000b0024853fb8766so606744wrd.11
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aD/UeCfCDgKalmUa1x79gyFdLr3F+vkuYPHOq045YJ0=;
 b=qOFgPw2yrtORH8vDG56Af85WvERUYvYeXE/INnjsgk6CIqSSMh6PE4Z4chNL27Vi7d
 HzGhHPSi44X8Yii1ZqwrnyM6PyiblNCBAg+Qm9kj1GiMvWCH25lrjRt3i8UEbc9jwz3k
 KNswlCVQyp4TpXPTjVega7aW1rHKT1hImPvMZnSjo6iCh64ZgjfQLUnF3TngIqL04ge8
 DR74jJxos5Wgx0bJmp4ysdZW2CRRL9uDhemQ+WjfUCi5PytsnRHEnMDY0XnAw5o1RCQO
 fSahCrMFk22eCQnRRaeZ6otQS/Possjjy42mZ/EzxRjLnkm1yww8QpmAMkaGyf7NS37z
 AubA==
X-Gm-Message-State: ANoB5plSe2nqMCu6d7cDjkFBkKJsZwSkeTNIlWUwzy/a1f/sxLoIPUJd
 GVkGLi/NEwuCvJOJGStTLtJUp5g0QnMgUl/l8/keh5CaSR4GDetzr2GZe4WNLH7OZpreVdtIuTq
 DHRutxseeDMV5kv+LRZ+YZA1fEhFFlNzOgnFkpgSaV6PJvIDoX4lSRtlRXZ6B
X-Received: by 2002:a05:6000:1e06:b0:242:eda:dda5 with SMTP id
 bj6-20020a0560001e0600b002420edadda5mr18523090wrb.25.1671108000352; 
 Thu, 15 Dec 2022 04:40:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7k+I6P3AMdl//S7suxsEZwZZJIBjO2KDbu9ueaUc+YCpzlw2cEFFlvRgFTMiygetePfuTThQ==
X-Received: by 2002:a05:6000:1e06:b0:242:eda:dda5 with SMTP id
 bj6-20020a0560001e0600b002420edadda5mr18523067wrb.25.1671107999821; 
 Thu, 15 Dec 2022 04:39:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a5d4042000000b002421db5f279sm6037712wrp.78.2022.12.15.04.39.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 04:39:59 -0800 (PST)
Message-ID: <9cab42e5-54ac-0e30-bc23-b1f7838cb1d5@redhat.com>
Date: Thu, 15 Dec 2022 13:39:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 17/24] vfio-user: dma map/unmap operations
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <2f842a47474f4369b9f41b22d72277abf5b3b31b.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <2f842a47474f4369b9f41b22d72277abf5b3b31b.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/9/22 00:13, John Johnson wrote:
> Add ability to do async operations during memory transactions
> 
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> ---
>   hw/vfio/common.c              |  63 +++++++++---
>   hw/vfio/user-protocol.h       |  32 ++++++
>   hw/vfio/user.c                | 220 ++++++++++++++++++++++++++++++++++++++++++
>   include/hw/vfio/vfio-common.h |   9 +-
>   4 files changed, 308 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index e73a772..fe6eddd 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -507,7 +507,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
>       return CONT_DMA_UNMAP(container, &unmap, NULL);
>   }
>   
> -static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
> +static int vfio_dma_map(VFIOContainer *container, MemoryRegion *mr, hwaddr iova,
>                           ram_addr_t size, void *vaddr, bool readonly)
>   {
>       struct vfio_iommu_type1_dma_map map = {
> @@ -523,7 +523,7 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>           map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
>       }
>   
> -    ret = CONT_DMA_MAP(container, &map);
> +    ret = CONT_DMA_MAP(container, mr, &map);
>   
>       if (ret < 0) {
>           error_report("VFIO_MAP_DMA failed: %s", strerror(-ret));
> @@ -586,7 +586,8 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
>   
>   /* Called with rcu_read_lock held.  */
>   static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> -                               ram_addr_t *ram_addr, bool *read_only)
> +                               ram_addr_t *ram_addr, bool *read_only,
> +                               MemoryRegion **mrp)
>   {

This needs a small update. A memory_get_xlat_addr() routine was introduced since.

>       MemoryRegion *mr;
>       hwaddr xlat;
> @@ -667,6 +668,10 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
>           *read_only = !writable || mr->readonly;
>       }
>   
> +    if (mrp != NULL) {
> +        *mrp = mr;
> +    }
> +
>       return true;
>   }
>   
> @@ -674,6 +679,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>   {
>       VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
>       VFIOContainer *container = giommu->container;
> +    MemoryRegion *mr;
>       hwaddr iova = iotlb->iova + giommu->iommu_offset;
>       void *vaddr;
>       int ret;
> @@ -692,7 +698,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>       if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
>           bool read_only;
>   
> -        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)) {
> +        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, &mr)) {
>               goto out;
>           }
>           /*
> @@ -702,14 +708,14 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>            * of vaddr will always be there, even if the memory object is
>            * destroyed and its backing memory munmap-ed.
>            */
> -        ret = vfio_dma_map(container, iova,
> +        ret = vfio_dma_map(container, mr, iova,
>                              iotlb->addr_mask + 1, vaddr,
>                              read_only);
>           if (ret) {
>               error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
> -                         "0x%"HWADDR_PRIx", %p) = %d (%m)",
> +                         "0x%"HWADDR_PRIx", %p)",
>                            container, iova,
> -                         iotlb->addr_mask + 1, vaddr, ret);
> +                         iotlb->addr_mask + 1, vaddr);
>           }
>       } else {
>           ret = vfio_dma_unmap(container, iova, iotlb->addr_mask + 1, iotlb);
> @@ -764,7 +770,7 @@ static int vfio_ram_discard_notify_populate(RamDiscardListener *rdl,
>                  section->offset_within_address_space;
>           vaddr = memory_region_get_ram_ptr(section->mr) + start;
>   
> -        ret = vfio_dma_map(vrdl->container, iova, next - start,
> +        ret = vfio_dma_map(vrdl->container, section->mr, iova, next - start,
>                              vaddr, section->readonly);
>           if (ret) {
>               /* Rollback */
> @@ -888,6 +894,29 @@ static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
>       return true;
>   }
>   
> +static void vfio_listener_begin(MemoryListener *listener)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +
> +    /*
> +     * When DMA space is the physical address space,
> +     * the region add/del listeners will fire during
> +     * memory update transactions.  These depend on BQL
> +     * being held, so do any resulting map/demap ops async
> +     * while keeping BQL.
> +     */
> +    container->async_ops = true;
> +}
> +
> +static void vfio_listener_commit(MemoryListener *listener)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +
> +    /* wait here for any async requests sent during the transaction */
> +    CONT_WAIT_COMMIT(container);
> +    container->async_ops = false;
> +}
> +
>   static void vfio_listener_region_add(MemoryListener *listener,
>                                        MemoryRegionSection *section)
>   {
> @@ -1095,12 +1124,12 @@ static void vfio_listener_region_add(MemoryListener *listener,
>           }
>       }
>   
> -    ret = vfio_dma_map(container, iova, int128_get64(llsize),
> +    ret = vfio_dma_map(container, section->mr, iova, int128_get64(llsize),
>                          vaddr, section->readonly);
>       if (ret) {
>           error_setg(&err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
> -                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
> -                   container, iova, int128_get64(llsize), vaddr, ret);
> +                   "0x%"HWADDR_PRIx", %p)",
> +                   container, iova, int128_get64(llsize), vaddr);
>           if (memory_region_is_ram_device(section->mr)) {
>               /* Allow unexpected mappings not to be fatal for RAM devices */
>               error_report_err(err);
> @@ -1369,7 +1398,7 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>       }
>   
>       rcu_read_lock();
> -    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
> +    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL, NULL)) {
>           int ret;
>   
>           ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
> @@ -1487,6 +1516,8 @@ static void vfio_listener_log_sync(MemoryListener *listener,
>   
>   static const MemoryListener vfio_memory_listener = {
>       .name = "vfio",
> +    .begin = vfio_listener_begin,
> +    .commit = vfio_listener_commit,
>       .region_add = vfio_listener_region_add,
>       .region_del = vfio_listener_region_del,
>       .log_global_start = vfio_listener_log_global_start,
> @@ -2977,7 +3008,7 @@ VFIODevIO vfio_dev_io_ioctl = {
>       .region_write = vfio_io_region_write,
>   };
>   
> -static int vfio_io_dma_map(VFIOContainer *container,
> +static int vfio_io_dma_map(VFIOContainer *container, MemoryRegion *mr,
>                              struct vfio_iommu_type1_dma_map *map)
>   {
>   
> @@ -3037,8 +3068,14 @@ static int vfio_io_dirty_bitmap(VFIOContainer *container,
>       return ret < 0 ? -errno : ret;
>   }
>   
> +static void vfio_io_wait_commit(VFIOContainer *container)
> +{
> +    /* ioctl()s are synchronous */
> +}
> +
>   VFIOContIO vfio_cont_io_ioctl = {
>       .dma_map = vfio_io_dma_map,
>       .dma_unmap = vfio_io_dma_unmap,
>       .dirty_bitmap = vfio_io_dirty_bitmap,
> +    .wait_commit = vfio_io_wait_commit,
>   };
> diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
> index 31704cf..e9fcf64 100644
> --- a/hw/vfio/user-protocol.h
> +++ b/hw/vfio/user-protocol.h
> @@ -114,6 +114,31 @@ typedef struct {
>   #define VFIO_USER_DEF_MAX_BITMAP (256 * 1024 * 1024)
>   
>   /*
> + * VFIO_USER_DMA_MAP
> + * imported from struct vfio_iommu_type1_dma_map
> + */
> +typedef struct {
> +    VFIOUserHdr hdr;
> +    uint32_t argsz;
> +    uint32_t flags;
> +    uint64_t offset;    /* FD offset */
> +    uint64_t iova;
> +    uint64_t size;
> +} VFIOUserDMAMap;
> +
> +/*
> + * VFIO_USER_DMA_UNMAP
> + * imported from struct vfio_iommu_type1_dma_unmap
> + */
> +typedef struct {
> +    VFIOUserHdr hdr;
> +    uint32_t argsz;
> +    uint32_t flags;
> +    uint64_t iova;
> +    uint64_t size;
> +} VFIOUserDMAUnmap;
> +
> +/*
>    * VFIO_USER_DEVICE_GET_INFO
>    * imported from struct_device_info
>    */
> @@ -177,4 +202,11 @@ typedef struct {
>       char data[];
>   } VFIOUserRegionRW;
>   
> +/*imported from struct vfio_bitmap */
> +typedef struct {
> +    uint64_t pgsize;
> +    uint64_t size;
> +    char data[];
> +} VFIOUserBitmap;
> +
>   #endif /* VFIO_USER_PROTOCOL_H */
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index 2d35f83..1fd37cc 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -59,8 +59,11 @@ static void vfio_user_request(void *opaque);
>   static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg);
>   static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
>                                    VFIOUserFDs *fds);
> +static void vfio_user_send_nowait(VFIOProxy *proxy, VFIOUserHdr *hdr,
> +                                  VFIOUserFDs *fds, int rsize);
>   static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
>                                   VFIOUserFDs *fds, int rsize, bool nobql);
> +static void vfio_user_wait_reqs(VFIOProxy *proxy);
>   static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
>                                     uint32_t size, uint32_t flags);
>   
> @@ -647,6 +650,36 @@ static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
>       }
>   }
>   
> +/*
> + * nowait send - vfio_wait_reqs() can wait for it later
> + */
> +static void vfio_user_send_nowait(VFIOProxy *proxy, VFIOUserHdr *hdr,
> +                                  VFIOUserFDs *fds, int rsize)
> +{
> +    VFIOUserMsg *msg;
> +    int ret;
> +
> +    if (hdr->flags & VFIO_USER_NO_REPLY) {
> +        error_printf("vfio_user_send_nowait on async message\n");
> +        return;
> +    }
> +
> +    QEMU_LOCK_GUARD(&proxy->lock);
> +
> +    msg = vfio_user_getmsg(proxy, hdr, fds);
> +    msg->id = hdr->id;
> +    msg->rsize = rsize ? rsize : hdr->size;
> +    msg->type = VFIO_MSG_NOWAIT;
> +
> +    ret = vfio_user_send_queued(proxy, msg);
> +    if (ret < 0) {
> +        vfio_user_recycle(proxy, msg);
> +        return;
> +    }
> +
> +    proxy->last_nowait = msg;
> +}
> +
>   static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
>                                   VFIOUserFDs *fds, int rsize, bool nobql)
>   {
> @@ -699,6 +732,60 @@ static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
>       }
>   }
>   
> +static void vfio_user_wait_reqs(VFIOProxy *proxy)
> +{
> +    VFIOUserMsg *msg;
> +    bool iolock = false;
> +
> +    /*
> +     * Any DMA map/unmap requests sent in the middle
> +     * of a memory region transaction were sent nowait.
> +     * Wait for them here.
> +     */
> +    qemu_mutex_lock(&proxy->lock);
> +    if (proxy->last_nowait != NULL) {
> +        iolock = qemu_mutex_iothread_locked();
> +        if (iolock) {
> +            qemu_mutex_unlock_iothread();
> +        }
> +
> +        /*
> +         * Change type to WAIT to wait for reply
> +         */
> +        msg = proxy->last_nowait;
> +        msg->type = VFIO_MSG_WAIT;
> +        while (!msg->complete) {
> +            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
> +                VFIOUserMsgQ *list;
> +
> +                list = msg->pending ? &proxy->pending : &proxy->outgoing;
> +                QTAILQ_REMOVE(list, msg, next);
> +                error_printf("vfio_wait_reqs - timed out\n");
> +                break;
> +            }
> +        }
> +
> +        if (msg->hdr->flags & VFIO_USER_ERROR) {
> +            error_printf("vfio_user_wait_reqs - error reply on async request ");
> +            error_printf("command %x error %s\n", msg->hdr->command,
> +                         strerror(msg->hdr->error_reply));
> +        }
> +
> +        proxy->last_nowait = NULL;
> +        /*
> +         * Change type back to NOWAIT to free
> +         */
> +        msg->type = VFIO_MSG_NOWAIT;
> +        vfio_user_recycle(proxy, msg);
> +    }
> +
> +    /* lock order is BQL->proxy - don't hold proxy when getting BQL */
> +    qemu_mutex_unlock(&proxy->lock);
> +    if (iolock) {
> +        qemu_mutex_lock_iothread();
> +    }
> +}
> +
>   static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
>       QLIST_HEAD_INITIALIZER(vfio_user_sockets);
>   
> @@ -1113,6 +1200,103 @@ int vfio_user_validate_version(VFIOProxy *proxy, Error **errp)
>       return 0;
>   }
>   
> +static int vfio_user_dma_map(VFIOProxy *proxy,
> +                             struct vfio_iommu_type1_dma_map *map,
> +                             int fd, bool will_commit)
> +{
> +    VFIOUserFDs *fds = NULL;
> +    VFIOUserDMAMap *msgp = g_malloc0(sizeof(*msgp));
> +    int ret;
> +
> +    vfio_user_request_msg(&msgp->hdr, VFIO_USER_DMA_MAP, sizeof(*msgp), 0);
> +    msgp->argsz = map->argsz;
> +    msgp->flags = map->flags;
> +    msgp->offset = map->vaddr;
> +    msgp->iova = map->iova;
> +    msgp->size = map->size;
> +
> +    /*
> +     * The will_commit case sends without blocking or dropping BQL.
> +     * They're later waited for in vfio_send_wait_reqs.
> +     */
> +    if (will_commit) {
> +        /* can't use auto variable since we don't block */
> +        if (fd != -1) {
> +            fds = vfio_user_getfds(1);


It is difficult to see where vfio_user_putfds() is called to free fds.

> +            fds->send_fds = 1;
> +            fds->fds[0] = fd;
> +        }
> +        vfio_user_send_nowait(proxy, &msgp->hdr, fds, 0);
> +        ret = 0;
> +    } else {
> +        VFIOUserFDs local_fds = { 1, 0, &fd };
> +
> +        fds = fd != -1 ? &local_fds : NULL;
> +        vfio_user_send_wait(proxy, &msgp->hdr, fds, 0, will_commit);
> +        ret = (msgp->hdr.flags & VFIO_USER_ERROR) ? -msgp->hdr.error_reply : 0;
> +        g_free(msgp);
> +    }
> +
> +    return ret;
> +}
> +
> +static int vfio_user_dma_unmap(VFIOProxy *proxy,
> +                               struct vfio_iommu_type1_dma_unmap *unmap,
> +                               struct vfio_bitmap *bitmap, bool will_commit)
> +{
> +    struct {
> +        VFIOUserDMAUnmap msg;
> +        VFIOUserBitmap bitmap;
> +    } *msgp = NULL;
> +    int msize, rsize;
> +    bool blocking = !will_commit;
> +
> +    if (bitmap == NULL &&
> +        (unmap->flags & VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP)) {
> +        error_printf("vfio_user_dma_unmap mismatched flags and bitmap\n");
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * If a dirty bitmap is returned, allocate extra space for it
> +     * and block for reply even in the will_commit case.
> +     * Otherwise, can send the unmap request without waiting.
> +     */
> +    if (bitmap != NULL) {
> +        blocking = true;
> +        msize = sizeof(*msgp);
> +        rsize = msize + bitmap->size;
> +        msgp = g_malloc0(rsize);
> +        msgp->bitmap.pgsize = bitmap->pgsize;
> +        msgp->bitmap.size = bitmap->size;
> +    } else {
> +        msize = rsize = sizeof(VFIOUserDMAUnmap);
> +        msgp = g_malloc0(rsize);
> +    }
> +
> +    vfio_user_request_msg(&msgp->msg.hdr, VFIO_USER_DMA_UNMAP, msize, 0);
> +    msgp->msg.argsz = rsize - sizeof(VFIOUserHdr);
> +    msgp->msg.argsz = unmap->argsz;
> +    msgp->msg.flags = unmap->flags;
> +    msgp->msg.iova = unmap->iova;
> +    msgp->msg.size = unmap->size;
> +
> +    if (blocking) {
> +        vfio_user_send_wait(proxy, &msgp->msg.hdr, NULL, rsize, will_commit);
> +        if (msgp->msg.hdr.flags & VFIO_USER_ERROR) {
> +            return -msgp->msg.hdr.error_reply;
> +        }
> +        if (bitmap != NULL) {
> +            memcpy(bitmap->data, &msgp->bitmap.data, bitmap->size);
> +        }
> +        g_free(msgp);
> +    } else {
> +        vfio_user_send_nowait(proxy, &msgp->msg.hdr, NULL, rsize);
> +    }
> +
> +    return 0;
> +}
> +
>   static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
>   {
>       VFIOUserDeviceInfo msg;
> @@ -1434,5 +1618,41 @@ VFIODevIO vfio_dev_io_sock = {
>   };
>   
>   
> +static int vfio_user_io_dma_map(VFIOContainer *container, MemoryRegion *mr,
> +                                struct vfio_iommu_type1_dma_map *map)
> +{
> +    int fd = memory_region_get_fd(mr);
> +
> +    /*
> +     * map->vaddr enters as a QEMU process address
> +     * make it either a file offset for mapped areas or 0
> +     */
> +    if (fd != -1) {
> +        void *addr = (void *)(uintptr_t)map->vaddr;
> +
> +        map->vaddr = qemu_ram_block_host_offset(mr->ram_block, addr);
> +    } else {
> +        map->vaddr = 0;
> +    }
> +
> +    return vfio_user_dma_map(container->proxy, map, fd, container->async_ops);
> +}
> +
> +static int vfio_user_io_dma_unmap(VFIOContainer *container,
> +                                  struct vfio_iommu_type1_dma_unmap *unmap,
> +                                  struct vfio_bitmap *bitmap)
> +{
> +    return vfio_user_dma_unmap(container->proxy, unmap, bitmap,
> +                               container->async_ops);
> +}
> +
> +static void vfio_user_io_wait_commit(VFIOContainer *container)
> +{
> +    vfio_user_wait_reqs(container->proxy);
> +}
> +
>   VFIOContIO vfio_cont_io_sock = {
> +    .dma_map = vfio_user_io_dma_map,
> +    .dma_unmap = vfio_user_io_dma_unmap,
> +    .wait_commit = vfio_user_io_wait_commit,
>   };
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 312ef9c..413dafc 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -90,6 +90,7 @@ typedef struct VFIOContainer {
>       VFIOContIO *io_ops;
>       bool initialized;
>       bool dirty_pages_supported;
> +    bool async_ops;
>       uint64_t dirty_pgsizes;
>       uint64_t max_dirty_bitmap_size;
>       unsigned long pgsizes;
> @@ -200,7 +201,7 @@ struct VFIODevIO {
>       ((vdev)->io_ops->region_write((vdev), (nr), (off), (size), (data), (post)))
>   
>   struct VFIOContIO {
> -    int (*dma_map)(VFIOContainer *container,
> +    int (*dma_map)(VFIOContainer *container, MemoryRegion *mr,
>                      struct vfio_iommu_type1_dma_map *map);
>       int (*dma_unmap)(VFIOContainer *container,
>                        struct vfio_iommu_type1_dma_unmap *unmap,
> @@ -208,14 +209,16 @@ struct VFIOContIO {
>       int (*dirty_bitmap)(VFIOContainer *container,
>                           struct vfio_iommu_type1_dirty_bitmap *bitmap,
>                           struct vfio_iommu_type1_dirty_bitmap_get *range);
> +    void (*wait_commit)(VFIOContainer *container);
>   };
>   
> -#define CONT_DMA_MAP(cont, map) \
> -    ((cont)->io_ops->dma_map((cont), (map)))
> +#define CONT_DMA_MAP(cont, mr, map) \
> +    ((cont)->io_ops->dma_map((cont), (mr), (map)))
>   #define CONT_DMA_UNMAP(cont, unmap, bitmap) \
>       ((cont)->io_ops->dma_unmap((cont), (unmap), (bitmap)))
>   #define CONT_DIRTY_BITMAP(cont, bitmap, range) \
>       ((cont)->io_ops->dirty_bitmap((cont), (bitmap), (range)))
> +#define CONT_WAIT_COMMIT(cont) ((cont)->io_ops->wait_commit(cont))
>   
>   extern VFIODevIO vfio_dev_io_ioctl;
>   extern VFIOContIO vfio_cont_io_ioctl;


