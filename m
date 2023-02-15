Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD42697932
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 10:44:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSEJD-0002Uo-Pn; Wed, 15 Feb 2023 04:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pSEJC-0002Ue-DJ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 04:42:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pSEJ9-0003gW-Gy
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 04:42:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676454154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IMt/K6m55Mpl76SL3Ow0TbtfPEg5xpdk7ttjLbjq9A4=;
 b=haVWGrKiiJ66Dv/9ltkBGu5hdQX57uGfonDcXzuK8Tnf90KDrS9Qe+dtocIqVJLJ/vIjU1
 eF5lZEbGQAEBK8CjlOVM2eUcPvc5LskAx8YfxazSz6xut66foC84JKSvqGgRakDi39QSr0
 ftP7jo5WQkoO1LEYDa/8SQxS2gzu4V0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-k55hKpUsPD6C3QmhRHFRPQ-1; Wed, 15 Feb 2023 04:41:42 -0500
X-MC-Unique: k55hKpUsPD6C3QmhRHFRPQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 x12-20020a05620a258c00b007051ae500a2so11080078qko.15
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 01:41:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IMt/K6m55Mpl76SL3Ow0TbtfPEg5xpdk7ttjLbjq9A4=;
 b=wvS3CMoxOMddqAKANPS1ABFUNJVMxTAqXofl9sc10B5osq0IfrucSfbsnqhKYIDCpv
 Kn8oe3WuRMt6dx48CTN1F4ir5vOeqVNOdiQpjIAdy5xUnEazbmEmmHbI2nwBBkeDsSBR
 GLNrHp4kUdRaCheUQmW/nxxnvdd4md8RKoKg2kQrW/+lKO0EBX+0UjmtA4rQ3+iibhoa
 FumQIKyR6amtb+32yvVnSf5MNKPmOoaaBqgPjacEq0zjIdtvPPWawKiD147ymypU0IIx
 wopDFC1IXGiSAsfZVZruVNXc5vxvoLIiRf2A/QNiifHRBwe/Eqy1pODFAlUFFHf4VH4p
 d7GA==
X-Gm-Message-State: AO0yUKV6e30DWhkFtqljh0lql0EV1mxxaazSwIMHRQYUhYws+WM0KGmF
 jFB2fwdoehe6TbA5l2GtYZ9eJDRonnipwf/5IH6qhLdcCqO0kh/v8+prXHVwt/E1EggX7xWMuij
 /nunSpzDgB06mHXo=
X-Received: by 2002:ac8:671a:0:b0:3bd:1c1:5d6a with SMTP id
 e26-20020ac8671a000000b003bd01c15d6amr520518qtp.7.1676454101637; 
 Wed, 15 Feb 2023 01:41:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/oI3UtWHrD0CKIjR0o0ZFjb723CZqmdAbbaCJASEK1iJuS5/VH/Qnf1krV50aLis8j8iAU1w==
X-Received: by 2002:ac8:671a:0:b0:3bd:1c1:5d6a with SMTP id
 e26-20020ac8671a000000b003bd01c15d6amr520510qtp.7.1676454101355; 
 Wed, 15 Feb 2023 01:41:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 f4-20020ac840c4000000b003b9bb59543fsm12606983qtm.61.2023.02.15.01.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 01:41:41 -0800 (PST)
Message-ID: <719f8f5f-8601-5c99-962a-ce35939cf539@redhat.com>
Date: Wed, 15 Feb 2023 10:41:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 04/18] vfio/common: Abort migration if dirty log
 start/stop/sync fails
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-5-avihaih@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <20230126184948.10478-5-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clegoate@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/26/23 19:49, Avihai Horon wrote:
> If VFIO dirty pages log start/stop/sync fails during migration,
> migration should be aborted as pages dirtied by VFIO devices might not
> be reported properly.
> 
> This is not the case today, where in such scenario only an error is
> printed.
> 
> Fix it by aborting migration in the above scenario.
> 
> Fixes: 758b96b61d5c ("vfio/migrate: Move switch of dirty tracking into vfio_memory_listener")
> Fixes: b6dd6504e303 ("vfio: Add vfio_listener_log_sync to mark dirty pages")
> Fixes: 9e7b0442f23a ("vfio: Add ioctl to get dirty pages bitmap during dma unmap")
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>




Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
>   hw/vfio/common.c | 53 ++++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 45 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 643418f6f1..8e8ffbc046 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -41,6 +41,7 @@
>   #include "qapi/error.h"
>   #include "migration/migration.h"
>   #include "migration/misc.h"
> +#include "migration/qemu-file.h"
>   #include "sysemu/tpm.h"
>   
>   VFIOGroupList vfio_group_list =
> @@ -337,6 +338,19 @@ bool vfio_mig_active(void)
>       return true;
>   }
>   
> +static void vfio_set_migration_error(int err)
> +{
> +    MigrationState *ms = migrate_get_current();
> +
> +    if (migration_is_setup_or_active(ms->state)) {
> +        WITH_QEMU_LOCK_GUARD(&ms->qemu_file_lock) {
> +            if (ms->to_dst_file) {
> +                qemu_file_set_error(ms->to_dst_file, err);
> +            }
> +        }
> +    }
> +}
> +
>   static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>   {
>       VFIOGroup *group;
> @@ -633,6 +647,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>       if (iotlb->target_as != &address_space_memory) {
>           error_report("Wrong target AS \"%s\", only system memory is allowed",
>                        iotlb->target_as->name ? iotlb->target_as->name : "none");
> +        vfio_set_migration_error(-EINVAL);
>           return;
>       }
>   
> @@ -667,6 +682,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>                            "0x%"HWADDR_PRIx") = %d (%s)",
>                            container, iova,
>                            iotlb->addr_mask + 1, ret, strerror(-ret));
> +            vfio_set_migration_error(ret);
>           }
>       }
>   out:
> @@ -1212,7 +1228,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
>       }
>   }
>   
> -static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
> +static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>   {
>       int ret;
>       struct vfio_iommu_type1_dirty_bitmap dirty = {
> @@ -1220,7 +1236,7 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>       };
>   
>       if (!container->dirty_pages_supported) {
> -        return;
> +        return 0;
>       }
>   
>       if (start) {
> @@ -1231,23 +1247,34 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>   
>       ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
>       if (ret) {
> +        ret = -errno;
>           error_report("Failed to set dirty tracking flag 0x%x errno: %d",
>                        dirty.flags, errno);
>       }
> +
> +    return ret;
>   }
>   
>   static void vfio_listener_log_global_start(MemoryListener *listener)
>   {
>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +    int ret;
>   
> -    vfio_set_dirty_page_tracking(container, true);
> +    ret = vfio_set_dirty_page_tracking(container, true);
> +    if (ret) {
> +        vfio_set_migration_error(ret);
> +    }
>   }
>   
>   static void vfio_listener_log_global_stop(MemoryListener *listener)
>   {
>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +    int ret;
>   
> -    vfio_set_dirty_page_tracking(container, false);
> +    ret = vfio_set_dirty_page_tracking(container, false);
> +    if (ret) {
> +        vfio_set_migration_error(ret);
> +    }
>   }
>   
>   static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
> @@ -1323,19 +1350,18 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>       VFIOContainer *container = giommu->container;
>       hwaddr iova = iotlb->iova + giommu->iommu_offset;
>       ram_addr_t translated_addr;
> +    int ret = -EINVAL;
>   
>       trace_vfio_iommu_map_dirty_notify(iova, iova + iotlb->addr_mask);
>   
>       if (iotlb->target_as != &address_space_memory) {
>           error_report("Wrong target AS \"%s\", only system memory is allowed",
>                        iotlb->target_as->name ? iotlb->target_as->name : "none");
> -        return;
> +        goto out;
>       }
>   
>       rcu_read_lock();
>       if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
> -        int ret;
> -
>           ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
>                                       translated_addr);
>           if (ret) {
> @@ -1346,6 +1372,11 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>           }
>       }
>       rcu_read_unlock();
> +
> +out:
> +    if (ret) {
> +        vfio_set_migration_error(ret);
> +    }
>   }
>   
>   static int vfio_ram_discard_get_dirty_bitmap(MemoryRegionSection *section,
> @@ -1438,13 +1469,19 @@ static void vfio_listener_log_sync(MemoryListener *listener,
>           MemoryRegionSection *section)
>   {
>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +    int ret;
>   
>       if (vfio_listener_skipped_section(section)) {
>           return;
>       }
>   
>       if (vfio_devices_all_dirty_tracking(container)) {
> -        vfio_sync_dirty_bitmap(container, section);
> +        ret = vfio_sync_dirty_bitmap(container, section);
> +        if (ret) {
> +            error_report("vfio: Failed to sync dirty bitmap, err: %d (%s)", ret,
> +                         strerror(-ret));
> +            vfio_set_migration_error(ret);
> +        }
>       }
>   }
>   


