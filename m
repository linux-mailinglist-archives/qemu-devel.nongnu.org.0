Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 425DD64CF0C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 19:01:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5W2o-0002uR-Vp; Wed, 14 Dec 2022 12:59:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p5W2m-0002sX-FZ
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 12:59:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p5W2j-0007OM-75
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 12:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671040784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IUjkcB0py5G1FLXFZD8Dvm3Q1IE7R+1aUiH1OwOZEp4=;
 b=A/aNH3/yXRd9I/xG+YSw0TpLIiGp1eH0hUjidlFeLj8OAgIudBkURGLZTJqwHY9sABRlf+
 OBgs81r2Ttj392BM/4kXhh0valfRWfe8mTrBY4Dsai93wS5F3TL6XIZ2K92zYOg+nGbiL3
 up+A6duGn9WjJj6gHqbxain56Ms+1jw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-KjZpVS4OM4WzFGe5p2g8bw-1; Wed, 14 Dec 2022 12:59:42 -0500
X-MC-Unique: KjZpVS4OM4WzFGe5p2g8bw-1
Received: by mail-qt1-f198.google.com with SMTP id
 fw8-20020a05622a4a8800b003a64f82fe73so2881220qtb.3
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 09:59:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IUjkcB0py5G1FLXFZD8Dvm3Q1IE7R+1aUiH1OwOZEp4=;
 b=OWp35qNPoYcxNeZFY2Ul/rqBuwJfx7iYiCp/VCPPpQX4kXja89EiU+ESZbfD3agmeL
 h4P2LNHF5DTmEeQiOOZM5Q51B+eGHIvxmuOdHF8RHcP9Mc5pv6wo9aISrLhB1Jv445Xu
 THx0v5K9ODF0tvTnU/fcNC8jN/qCCceGs0il+r1Amgu3MaK8hakjGxAypZmAeHYSH66A
 0wVmp/8I6YRSm7nVyNi3L1z453bF1r6aU8cX+RMhFijX9zOE+0ReknVlDvt1mrnRQoEu
 5KMMTb/ESJft6JVe2Uwh+5b+nlCmRTNyDpzdwq7uyOqWyJWwmYjrs5PapK5IAuBCGotF
 q38A==
X-Gm-Message-State: ANoB5pkZgnUxIN9feVOJez8sX7eFoQxoAJ+6eP/b4Odjp9d+Y013fSuY
 GAGFTayI7ly/Pks301PwQ4wwzhwi07UYT+NGp33/cIC1Z+glPJiIR6qFdK50uQILnXmY/Ao3sgN
 BFJUUEE46YFI1d1g=
X-Received: by 2002:a05:622a:408e:b0:3a6:21cb:cca4 with SMTP id
 cg14-20020a05622a408e00b003a621cbcca4mr8232168qtb.10.1671040781786; 
 Wed, 14 Dec 2022 09:59:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf47kJxnSMrO+gmnSI29ReegK/TzFZ9sPTsIfRLA3dE3q2rjxzEPcb7eUmu17Zb6cnBDpiK34Q==
X-Received: by 2002:a05:622a:408e:b0:3a6:21cb:cca4 with SMTP id
 cg14-20020a05622a408e00b003a621cbcca4mr8232134qtb.10.1671040781389; 
 Wed, 14 Dec 2022 09:59:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 e24-20020ac84918000000b003a6947863e1sm2038866qtq.11.2022.12.14.09.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 09:59:40 -0800 (PST)
Message-ID: <8d78a8e0-18a9-a86a-6b97-1e300aa27def@redhat.com>
Date: Wed, 14 Dec 2022 18:59:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 16/24] vfio-user: proxy container connect/disconnect
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <61dd08e18705b335f8cd02f69698aa8248ebaf96.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <61dd08e18705b335f8cd02f69698aa8248ebaf96.1667542066.git.john.g.johnson@oracle.com>
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
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>   hw/vfio/common.c              | 207 +++++++++++++++++++++++++++++++++++++++++-
>   hw/vfio/pci.c                 |  18 +++-
>   hw/vfio/user.c                |   3 +
>   hw/vfio/user.h                |   1 +
>   include/hw/vfio/vfio-common.h |   6 ++
>   5 files changed, 231 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index b540195..e73a772 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -19,6 +19,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include CONFIG_DEVICES
>   #include <sys/ioctl.h>
>   #ifdef CONFIG_KVM
>   #include <linux/kvm.h>
> @@ -2267,6 +2268,208 @@ put_space_exit:
>       return ret;
>   }
>   
> +
> +#ifdef CONFIG_VFIO_USER

this code belongs to hw/vfio/user.c. You will need to export the required
vfio subroutines for it.


> +
> +static int vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group,
> +                              AddressSpace *as, Error **errp)
> +{
> +    VFIOAddressSpace *space;
> +    VFIOContainer *container;
> +    int ret;
> +
> +    /*
> +     * try to mirror vfio_connect_container()
> +     * as much as possible
> +     */

Yes. This is very much like the VFIO_TYPE1_IOMMU case.

Could we wrap the vfio_get_iommu_info() routine in some way to bring it
even close ? to avoid all this code duplication.

> +
> +    space = vfio_get_address_space(as);
> +
> +    container = g_malloc0(sizeof(*container));
> +    container->space = space;
> +    container->fd = -1;
> +    container->error = NULL;
> +    container->io_ops = &vfio_cont_io_sock;
> +    QLIST_INIT(&container->giommu_list);
> +    QLIST_INIT(&container->hostwin_list);
> +    QLIST_INIT(&container->vrdl_list);
> +    container->proxy = proxy;
> +
> +    /*
> +     * The proxy uses a SW IOMMU in lieu of the HW one
> +     * used in the ioctl() version.  Mascarade as TYPE1
> +     * for maximum capatibility
> +     */
> +    container->iommu_type = VFIO_TYPE1_IOMMU;
> +
> +    /*
> +     * VFIO user allows the device server to map guest
> +     * memory so it has the same issue with discards as
> +     * a local IOMMU has.
> +     */
> +    ret = vfio_ram_block_discard_disable(container, true);
> +    if (ret) {
> +        error_setg_errno(errp, -ret, "Cannot set discarding of RAM broken");
> +        goto free_container_exit;
> +    }
> +
> +    vfio_host_win_add(container, 0, (hwaddr)-1, proxy->dma_pgsizes);
> +    container->pgsizes = proxy->dma_pgsizes;
> +    container->dma_max_mappings = proxy->max_dma;
> +
> +    /* setup bitmask now, but migration support won't be ready until v2 */
> +    container->dirty_pages_supported = true;
> +    container->max_dirty_bitmap_size = proxy->max_bitmap;
> +    container->dirty_pgsizes = proxy->migr_pgsize;
> +
> +    QLIST_INIT(&container->group_list);
> +    QLIST_INSERT_HEAD(&space->containers, container, next);
> +
> +    group->container = container;
> +    QLIST_INSERT_HEAD(&container->group_list, group, container_next);
> +
> +    container->listener = vfio_memory_listener;
> +    memory_listener_register(&container->listener, container->space->as);
> +
> +    if (container->error) {
> +        ret = -1;
> +        error_propagate_prepend(errp, container->error,
> +            "memory listener initialization failed: ");
> +        goto listener_release_exit;
> +    }
> +
> +    container->initialized = true;
> +
> +    return 0;
> +
> +listener_release_exit:
> +    QLIST_REMOVE(group, container_next);
> +    QLIST_REMOVE(container, next);
> +    vfio_listener_release(container);
> +    vfio_ram_block_discard_disable(container, false);
> +
> +free_container_exit:
> +    g_free(container);
> +
> +    vfio_put_address_space(space);
> +
> +    return ret;
> +}
> +
> +static void vfio_disconnect_proxy(VFIOGroup *group)
> +{
> +    VFIOContainer *container = group->container;
> +    VFIOAddressSpace *space = container->space;
> +    VFIOGuestIOMMU *giommu, *tmp;
> +    VFIOHostDMAWindow *hostwin, *next;
> +
> +    /*
> +     * try to mirror vfio_disconnect_container()

same comment.

Given the code that follows, I wonder if we shouldn't introduce new
VFIOGroup models: Base, PCI, User, to isolate the differences and
reduce duplication.

Thanks,

C.


> +     * as much as possible, knowing each device
> +     * is in one group and one container
> +     */
> +
> +    QLIST_REMOVE(group, container_next);
> +    group->container = NULL;
> +
> +    /*
> +     * Explicitly release the listener first before unset container,
> +     * since unset may destroy the backend container if it's the last
> +     * group.
> +     */
> +    memory_listener_unregister(&container->listener);
> +
> +    QLIST_REMOVE(container, next);
> +
> +    QLIST_FOREACH_SAFE(giommu, &container->giommu_list, giommu_next, tmp) {
> +        memory_region_unregister_iommu_notifier(
> +            MEMORY_REGION(giommu->iommu_mr), &giommu->n);
> +        QLIST_REMOVE(giommu, giommu_next);
> +        g_free(giommu);
> +    }
> +
> +    QLIST_FOREACH_SAFE(hostwin, &container->hostwin_list, hostwin_next,
> +                       next) {
> +        QLIST_REMOVE(hostwin, hostwin_next);
> +        g_free(hostwin);
> +    }
> +
> +    g_free(container);
> +    vfio_put_address_space(space);
> +}
> +
> +int vfio_user_get_device(VFIOGroup *group, VFIODevice *vbasedev, Error **errp)
> +{
> +    struct vfio_device_info info = { .argsz = sizeof(info) };
> +    int ret;
> +
> +    ret = VDEV_GET_INFO(vbasedev, &info);
> +    if (ret) {
> +        error_setg_errno(errp, -ret, "get info failure");
> +        return ret;
> +    }
> +
> +    vbasedev->fd = -1;
> +    vbasedev->group = group;
> +    QLIST_INSERT_HEAD(&group->device_list, vbasedev, next);
> +
> +    vbasedev->num_irqs = info.num_irqs;
> +    vbasedev->num_regions = info.num_regions;
> +    vbasedev->flags = info.flags;
> +
> +    vfio_get_all_regions(vbasedev);
> +    vbasedev->reset_works = !!(info.flags & VFIO_DEVICE_FLAGS_RESET);
> +    return 0;
> +}
> +
> +VFIOGroup *vfio_user_get_group(VFIOProxy *proxy, AddressSpace *as, Error **errp)
> +{
> +    VFIOGroup *group;
> +
> +    /*
> +     * Mirror vfio_get_group(), except that each
> +     * device gets its own group and container,
> +     * unrelated to any host IOMMU groupings
> +     */
> +    group = g_malloc0(sizeof(*group));
> +    group->fd = -1;
> +    group->groupid = -1;
> +    QLIST_INIT(&group->device_list);
> +
> +    if (vfio_connect_proxy(proxy, group, as, errp)) {
> +        error_prepend(errp, "failed to connect proxy");
> +        g_free(group);
> +        group = NULL;
> +    }
> +
> +    if (QLIST_EMPTY(&vfio_group_list)) {
> +        qemu_register_reset(vfio_reset_handler, NULL);
> +    }
> +
> +    QLIST_INSERT_HEAD(&vfio_group_list, group, next);
> +
> +    return group;
> +}
> +
> +void vfio_user_put_group(VFIOGroup *group)
> +{
> +    if (!group || !QLIST_EMPTY(&group->device_list)) {
> +        return;
> +    }
> +
> +    vfio_ram_block_discard_disable(group->container, false);
> +    vfio_disconnect_proxy(group);
> +    QLIST_REMOVE(group, next);
> +    g_free(group);
> +
> +    if (QLIST_EMPTY(&vfio_group_list)) {
> +        qemu_unregister_reset(vfio_reset_handler, NULL);
> +    }
> +}
> +
> +#endif /* CONFIG_VFIO_USER */
> +
> +
>   static void vfio_disconnect_container(VFIOGroup *group)
>   {
>       VFIOContainer *container = group->container;
> @@ -2499,7 +2702,9 @@ void vfio_put_base_device(VFIODevice *vbasedev)
>       QLIST_REMOVE(vbasedev, next);
>       vbasedev->group = NULL;
>       trace_vfio_put_base_device(vbasedev->fd);
> -    close(vbasedev->fd);
> +    if (vbasedev->fd != -1) {
> +        close(vbasedev->fd);
> +    }
>   }
>   
>   int vfio_get_region_info(VFIODevice *vbasedev, int index,
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index a1ae3fb..53e3bb8 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3584,7 +3584,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>       VFIODevice *vbasedev = &vdev->vbasedev;
>       SocketAddress addr;
>       VFIOProxy *proxy;
> -    struct vfio_device_info info;
> +    VFIOGroup *group = NULL;
>       int ret;
>       Error *err = NULL;
>   
> @@ -3630,9 +3630,15 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>       vbasedev->io_ops = &vfio_dev_io_sock;
>       vdev->vbasedev.irq_mask_works = true;
>   
> -    ret = VDEV_GET_INFO(vbasedev, &info);
> +    group = vfio_user_get_group(proxy, pci_device_iommu_address_space(pdev),
> +                                errp);
> +    if (!group) {
> +        goto error;
> +    }
> +
> +    ret = vfio_user_get_device(group, vbasedev, errp);
>       if (ret) {
> -        error_setg_errno(errp, -ret, "get info failure");
> +        vfio_user_put_group(group);
>           goto error;
>       }
>   
> @@ -3692,12 +3698,18 @@ static void vfio_user_instance_finalize(Object *obj)
>   {
>       VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
>       VFIODevice *vbasedev = &vdev->vbasedev;
> +    VFIOGroup *group = vbasedev->group;
> +
> +    vfio_bars_finalize(vdev);
> +    g_free(vdev->emulated_config_bits);
> +    g_free(vdev->rom);
>   
>       if (vdev->msix != NULL) {
>           vfio_user_msix_teardown(vdev);
>       }
>   
>       vfio_put_device(vdev);
> +    vfio_user_put_group(group);
>   
>       if (vbasedev->proxy != NULL) {
>           vfio_user_disconnect(vbasedev->proxy);
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index 815385b..2d35f83 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -1433,3 +1433,6 @@ VFIODevIO vfio_dev_io_sock = {
>       .region_write = vfio_user_io_region_write,
>   };
>   
> +
> +VFIOContIO vfio_cont_io_sock = {
> +};
> diff --git a/hw/vfio/user.h b/hw/vfio/user.h
> index 359a029..19b8a29 100644
> --- a/hw/vfio/user.h
> +++ b/hw/vfio/user.h
> @@ -94,5 +94,6 @@ void vfio_user_set_handler(VFIODevice *vbasedev,
>   int vfio_user_validate_version(VFIOProxy *proxy, Error **errp);
>   
>   extern VFIODevIO vfio_dev_io_sock;
> +extern VFIOContIO vfio_cont_io_sock;
>   
>   #endif /* VFIO_USER_H */
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 793ca94..312ef9c 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -94,6 +94,7 @@ typedef struct VFIOContainer {
>       uint64_t max_dirty_bitmap_size;
>       unsigned long pgsizes;
>       unsigned int dma_max_mappings;
> +    VFIOProxy *proxy;
>       QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
>       QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
>       QLIST_HEAD(, VFIOGroup) group_list;
> @@ -282,6 +283,11 @@ void vfio_put_group(VFIOGroup *group);
>   int vfio_get_device(VFIOGroup *group, const char *name,
>                       VFIODevice *vbasedev, Error **errp);
>   
> +int vfio_user_get_device(VFIOGroup *group, VFIODevice *vbasedev, Error **errp);
> +VFIOGroup *vfio_user_get_group(VFIOProxy *proxy, AddressSpace *as,
> +                               Error **errp);
> +void vfio_user_put_group(VFIOGroup *group);
> +
>   extern const MemoryRegionOps vfio_region_ops;
>   typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
>   extern VFIOGroupList vfio_group_list;


