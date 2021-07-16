Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D999D3CBB5A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 19:46:50 +0200 (CEST)
Received: from localhost ([::1]:59812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4RvD-00045G-B5
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 13:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m4Ru1-0003NK-0V
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 13:45:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m4Rtw-0005h1-AM
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 13:45:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626457527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D09yRcMykVgmhiKkPgWqZDXa68CgcRfCme9raIxbzgc=;
 b=R8Tqt57ao9KWda6qfTyS2hyNhyCSXiczQMnrdpbjNprHCgCsrwzxXvUQCsHr5+PDJ/M9XN
 oupwtQPHIeKt3rw/ZtFLUqZ7kUpY+8sXhbIcE1RPc6kjzMpCPMpuuB+DAHilM7N0GaTTlt
 wAqNRhK+5cFhTNeEHoNJcnYzisUTb94=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-EbBuA5FNPcOIVA0Guu17Kg-1; Fri, 16 Jul 2021 13:45:23 -0400
X-MC-Unique: EbBuA5FNPcOIVA0Guu17Kg-1
Received: by mail-oi1-f199.google.com with SMTP id
 n134-20020acad68c0000b029025a4350857eso6718509oig.8
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 10:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=D09yRcMykVgmhiKkPgWqZDXa68CgcRfCme9raIxbzgc=;
 b=AhnryDJH3hv3vkp21252KzRVT1KR8JYx4AXUPUC0OOwhbL7fvJv/jeWYK7J+m0Y4lS
 61B1nCIJk4fzSMB4uaebUdGPtqBN7/Jc/lCuntjVy7ZvIplDyWElfv2fFHZfkdy6Uitf
 ypfzDVPmj+3GbuKVjPKWIt+yY3IjCp36k2mRi02Q67fr1EMe9xVy4nW0g6Ja7LsfGKXf
 KBLnjIlnPJRH6U7ps37TzVxZAVc3vgzKpKjHpE7SMVcQq7u+Ekd3hlG+FRcYQY8VCles
 7y+KAXhyGmsdYpazpw5CsHdiXFmqvA7fxSowIDT2IGWqyFnAxR05wohBGQIppbYuFOQc
 MHGA==
X-Gm-Message-State: AOAM530wNWphRWHqKLUXC2TtjEYKdya1Gjr+/i68wJGOxb8hB1QjirFC
 Y1RkGGjFEJXZW4Vt6oxWgD4ZqAWaaPe/3u3O+tVyOfZSsKw3oWEoPM7K91gtfU5zVu80Nbp6Jgt
 J5J/KIwXk7ylrIzY=
X-Received: by 2002:a9d:4813:: with SMTP id c19mr9119598otf.208.1626457523134; 
 Fri, 16 Jul 2021 10:45:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdTBy2wcNQg2uVNMQEGgkQQmxlz69qMFT4G4evxJyPwzcHjhwQYaIoCuiBJR8pGcIubwVWhw==
X-Received: by 2002:a9d:4813:: with SMTP id c19mr9119584otf.208.1626457522918; 
 Fri, 16 Jul 2021 10:45:22 -0700 (PDT)
Received: from redhat.com (c-73-14-100-188.hsd1.co.comcast.net.
 [73.14.100.188])
 by smtp.gmail.com with ESMTPSA id 110sm1374713otj.12.2021.07.16.10.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 10:45:22 -0700 (PDT)
Date: Fri, 16 Jul 2021 11:45:20 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V5 16/25] vfio-pci: cpr part 1
Message-ID: <20210716114520.04921106.alex.williamson@redhat.com>
In-Reply-To: <1625678434-240960-17-git-send-email-steven.sistare@oracle.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-17-git-send-email-steven.sistare@oracle.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  7 Jul 2021 10:20:25 -0700
Steve Sistare <steven.sistare@oracle.com> wrote:
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 9220e64..40c882f 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -31,6 +31,7 @@
>  #include "exec/memory.h"
>  #include "exec/ram_addr.h"
>  #include "hw/hw.h"
> +#include "qemu/env.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/range.h"
> @@ -440,6 +441,10 @@ static int vfio_dma_unmap(VFIOContainer *container,
>          return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>      }
>  
> +    if (container->reused) {
> +        return 0;
> +    }
> +
>      while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
>          /*
>           * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
> @@ -463,6 +468,11 @@ static int vfio_dma_unmap(VFIOContainer *container,
>          return -errno;
>      }
>  
> +    if (unmap.size != size) {
> +        warn_report("VFIO_UNMAP_DMA(0x%lx, 0x%lx) only unmaps 0x%llx",
> +                     iova, size, unmap.size);
> +    }
> +

I'm a tad nervous that we have paths that can trigger this, the ioctl
certainly supports that we can call it across multiple mappings and the
size returned is the sum of the previously mapped ranges that were
unmapped.  See for instance vfio_listener_region_del()'s use of this
function.


>      return 0;
>  }
>  
> @@ -477,6 +487,10 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>          .size = size,
>      };
>  
> +    if (container->reused) {
> +        return 0;
> +    }
> +
>      if (!readonly) {
>          map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
>      }
> @@ -1603,6 +1617,10 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
>      if (iommu_type < 0) {
>          return iommu_type;
>      }
> +    if (container->reused) {
> +        container->iommu_type = iommu_type;
> +        return 0;
> +    }

How would this handle the case where SPAPR_TCE_v2 falls back to
SPAPR_TCE (v1)?


>  
>      ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
>      if (ret) {
...
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 9fc12bc..0f5c542 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3264,6 +3272,61 @@ static Property vfio_pci_dev_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +static void vfio_merge_config(VFIOPCIDevice *vdev)
> +{
> +    PCIDevice *pdev = &vdev->pdev;
> +    int size = MIN(pci_config_size(pdev), vdev->config_size);
> +    uint8_t *phys_config = g_malloc(size);
> +    uint32_t mask;
> +    int ret, i;
> +
> +    ret = pread(vdev->vbasedev.fd, phys_config, size, vdev->config_offset);
> +    if (ret < size) {
> +        ret = ret < 0 ? errno : EFAULT;

Leaks phys_config

> +        error_report("failed to read device config space: %s", strerror(ret));
> +        return;
> +    }
> +
> +    for (i = 0; i < size; i++) {
> +        mask = vdev->emulated_config_bits[i];
> +        pdev->config[i] = (pdev->config[i] & mask) | (phys_config[i] & ~mask);
> +    }
> +
> +    g_free(phys_config);
> +}
> +
> +static int vfio_pci_post_load(void *opaque, int version_id)
> +{
> +    VFIOPCIDevice *vdev = opaque;
> +    PCIDevice *pdev = &vdev->pdev;
> +    bool enabled;
> +
> +    vfio_merge_config(vdev);
> +
> +    pdev->reused = false;
> +    enabled = pci_get_word(pdev->config + PCI_COMMAND) & PCI_COMMAND_MASTER;
> +    memory_region_set_enabled(&pdev->bus_master_enable_region, enabled);

This seems generic to any PCI device, I'm surprised we need to do it
explicitly.  Thanks,

Alex

> +
> +    return 0;
> +}
> +


