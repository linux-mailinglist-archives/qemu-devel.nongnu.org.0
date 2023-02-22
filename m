Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FF469FE2F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 23:12:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUxK5-00073E-NT; Wed, 22 Feb 2023 17:10:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pUxK3-00072v-MW
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 17:10:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pUxK1-000277-H2
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 17:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677103844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0FSYaG7i1Jt2zKo92wobN738s5Crq+tGrewgUJBfQsI=;
 b=e6mWcjll5SyFjL3sQSylioqw8z1TalaNJTsF+rb+niM6E9thkbwXyAHh1fvVLPwlxoy0Ga
 HMTsDlxsQ9ffj1hmv/dzDFEHrBaHYxjImIqOKHtRyicfcuEsWAcrH8pCWacc4MnFdPL2sq
 J5wXFDj7LxbqAWyuGGiExJtoZgdKwPs=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-578-xq6yXixuMG-p-7mHjLc6Dg-1; Wed, 22 Feb 2023 17:10:42 -0500
X-MC-Unique: xq6yXixuMG-p-7mHjLc6Dg-1
Received: by mail-io1-f70.google.com with SMTP id
 22-20020a05660220d600b0074c8b57746cso3190747ioz.9
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 14:10:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0FSYaG7i1Jt2zKo92wobN738s5Crq+tGrewgUJBfQsI=;
 b=4YgBzzaFOmJOz+G8lgtWOg1BL9g+4K374ROQfHg1CbC0VRZ/0B0DlaJGZ1zZ5Q0gix
 yqPZO4ePSsVyaffjTKT38zygLCg8SHTYSRV9T7mJJsUDaSBl6Wv+tbYbW/T7pRXQcuVm
 olXFybsKzwmcc3jBaIK5Lz4TdeKCnx8uZhOhOZFCYdY1/kMyhDG2pF4ymf33TKfot7TT
 cbdjrZSg36fmCW+kFNT2tCfUVaoHLAT46ecNB+62h9XNmKclIgUM05Ym7Z0rcdwLa7O1
 M1l3lZd9OkR6NEBtVCPQjCUx22kc55djq3K8m07mQ6cWUuNVcekHtUrvngxPQz4lc9n6
 me3A==
X-Gm-Message-State: AO0yUKWJZus02eSZdYN5JIGFRuHycB1zV5iloSQ6Hw/GC/Dv8Hgbsl1l
 06hm3vs/5+bTaNkwe5NGJ0MHnuZ+sWgscTTOKBuYS7/p8/PNi7nnHxeXiv3gzO89fUhLNEjAVxf
 PhnM8UfMdUOakUf4=
X-Received: by 2002:a05:6e02:12c3:b0:316:f99d:9ea2 with SMTP id
 i3-20020a056e0212c300b00316f99d9ea2mr1080197ilm.17.1677103842066; 
 Wed, 22 Feb 2023 14:10:42 -0800 (PST)
X-Google-Smtp-Source: AK7set+RJA4VdhSMcMF7zRjNxgmzHmRSBkR5xiBfgrqoLm5IgfGIfJDu1gxhuMbwjITwhC6lepx85Q==
X-Received: by 2002:a05:6e02:12c3:b0:316:f99d:9ea2 with SMTP id
 i3-20020a056e0212c300b00316f99d9ea2mr1080178ilm.17.1677103841758; 
 Wed, 22 Feb 2023 14:10:41 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 r8-20020a028808000000b00363d6918540sm1385804jai.171.2023.02.22.14.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 14:10:41 -0800 (PST)
Date: Wed, 22 Feb 2023 15:10:39 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Jason Wang" <jasowang@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "David Hildenbrand"
 <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 10/20] vfio/common: Record DMA mapped IOVA ranges
Message-ID: <20230222151039.1de95db4.alex.williamson@redhat.com>
In-Reply-To: <20230222174915.5647-11-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-11-avihaih@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

On Wed, 22 Feb 2023 19:49:05 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> From: Joao Martins <joao.m.martins@oracle.com>
> 
> According to the device DMA logging uAPI, IOVA ranges to be logged by
> the device must be provided all at once upon DMA logging start.
> 
> As preparation for the following patches which will add device dirty
> page tracking, keep a record of all DMA mapped IOVA ranges so later they
> can be used for DMA logging start.
> 
> Note that when vIOMMU is enabled DMA mapped IOVA ranges are not tracked.
> This is due to the dynamic nature of vIOMMU DMA mapping/unmapping.
> Following patches will address the vIOMMU case specifically.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  include/hw/vfio/vfio-common.h |  3 ++
>  hw/vfio/common.c              | 86 +++++++++++++++++++++++++++++++++--
>  2 files changed, 86 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index ee55d442b4..6f36876ce0 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -23,6 +23,7 @@
>  
>  #include "exec/memory.h"
>  #include "qemu/queue.h"
> +#include "qemu/iova-tree.h"
>  #include "qemu/notify.h"
>  #include "ui/console.h"
>  #include "hw/display/ramfb.h"
> @@ -92,6 +93,8 @@ typedef struct VFIOContainer {
>      uint64_t max_dirty_bitmap_size;
>      unsigned long pgsizes;
>      unsigned int dma_max_mappings;
> +    IOVATree *mappings;
> +    QemuMutex mappings_mutex;
>      QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
>      QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
>      QLIST_HEAD(, VFIOGroup) group_list;
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 84f08bdbbb..6041da6c7e 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -44,6 +44,7 @@
>  #include "migration/blocker.h"
>  #include "migration/qemu-file.h"
>  #include "sysemu/tpm.h"
> +#include "qemu/iova-tree.h"
>  
>  VFIOGroupList vfio_group_list =
>      QLIST_HEAD_INITIALIZER(vfio_group_list);
> @@ -426,6 +427,11 @@ void vfio_unblock_multiple_devices_migration(void)
>      multiple_devices_migration_blocker = NULL;
>  }
>  
> +static bool vfio_have_giommu(VFIOContainer *container)
> +{
> +    return !QLIST_EMPTY(&container->giommu_list);
> +}
> +
>  static void vfio_set_migration_error(int err)
>  {
>      MigrationState *ms = migrate_get_current();
> @@ -499,6 +505,51 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>      return true;
>  }
>  
> +static int vfio_record_mapping(VFIOContainer *container, hwaddr iova,
> +                               hwaddr size, bool readonly)
> +{
> +    DMAMap map = {
> +        .iova = iova,
> +        .size = size - 1, /* IOVATree is inclusive, so subtract 1 from size */
> +        .perm = readonly ? IOMMU_RO : IOMMU_RW,
> +    };
> +    int ret;
> +
> +    if (vfio_have_giommu(container)) {
> +        return 0;
> +    }
> +
> +    WITH_QEMU_LOCK_GUARD(&container->mappings_mutex) {
> +        ret = iova_tree_insert(container->mappings, &map);
> +        if (ret) {
> +            if (ret == IOVA_ERR_INVALID) {
> +                ret = -EINVAL;
> +            } else if (ret == IOVA_ERR_OVERLAP) {
> +                ret = -EEXIST;
> +            }
> +        }
> +    }
> +
> +    return ret;
> +}
> +
> +static void vfio_erase_mapping(VFIOContainer *container, hwaddr iova,
> +                                hwaddr size)
> +{
> +    DMAMap map = {
> +        .iova = iova,
> +        .size = size - 1, /* IOVATree is inclusive, so subtract 1 from size */
> +    };
> +
> +    if (vfio_have_giommu(container)) {
> +        return;
> +    }
> +
> +    WITH_QEMU_LOCK_GUARD(&container->mappings_mutex) {
> +        iova_tree_remove(container->mappings, map);
> +    }
> +}

Nit, 'insert' and 'remove' to match the IOVATree semantics?

>  static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>                                   hwaddr iova, ram_addr_t size,
>                                   IOMMUTLBEntry *iotlb)
> @@ -599,6 +650,8 @@ static int vfio_dma_unmap(VFIOContainer *container,
>                                              DIRTY_CLIENTS_NOCODE);
>      }
>  
> +    vfio_erase_mapping(container, iova, size);
> +
>      return 0;
>  }
>  
> @@ -612,6 +665,16 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>          .iova = iova,
>          .size = size,
>      };
> +    int ret;
> +
> +    ret = vfio_record_mapping(container, iova, size, readonly);
> +    if (ret) {
> +        error_report("vfio: Failed to record mapping, iova: 0x%" HWADDR_PRIx
> +                     ", size: 0x" RAM_ADDR_FMT ", ret: %d (%s)",
> +                     iova, size, ret, strerror(-ret));
> +
> +        return ret;
> +    }

Is there no way to replay the mappings when a migration is started?
This seems like a horrible latency and bloat trade-off for the
possibility that the VM might migrate and the device might support
these features.  Our performance with vIOMMU is already terrible, I
can't help but believe this makes it worse.  Thanks,

Alex


