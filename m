Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1EE560CDD
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 00:59:22 +0200 (CEST)
Received: from localhost ([::1]:53264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6geX-0006Jy-48
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 18:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1o6gdZ-0005du-B8
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 18:58:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1o6gdT-0003Dl-T4
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 18:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656543494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zayr6L+EGTu40pj777408lQ+wMSauGkfv5TUG93AJCM=;
 b=bsdO4nTEk0wkqiX2sGuOIA8f06AIumCSAQcwIgyx/zr/xqRjs2gZ5LgUg8erPewZ/3labr
 VPjtbfOxCbvl5Q2EBtK/mn2RfCXSjb5o8dUQh0eAakIf+jl9i4ELHiYXFhS6txasp0v4Kt
 wG/iSWe7jOOQkG4kcvupKofhbdkkXmg=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-CRRBfYlVOfSSL2iCZCmxTQ-1; Wed, 29 Jun 2022 18:58:13 -0400
X-MC-Unique: CRRBfYlVOfSSL2iCZCmxTQ-1
Received: by mail-io1-f69.google.com with SMTP id
 f1-20020a056602070100b00674f8035487so9278475iox.17
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 15:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=Zayr6L+EGTu40pj777408lQ+wMSauGkfv5TUG93AJCM=;
 b=lXmddZhNCcIuCLYidCLW7Va8/AjaA/kaVGc1KsbR03veETCLTl1CeNAqnBeu19FANp
 r9V4bT3csGnx3arrC2XOjQOS0nE3/ZW0iyEx7Vl1SxWUtuPBdex9OgNRs82CpWjs7gqo
 6Pc3+puENo4uN4AZKrZ+89SryyWKIeU56v0RW2IBngNjC/c3qLJmn2UooYfn96fmIzO0
 ySHg9nhODm1tB7E4Cbm6DqUvRZAfzmuw7KPwD7P6Oo7jrtV2UQgg0Evy4uymCiRYkml3
 m5bxp/fbjnaDpGrjDItlOksfEeeyYQVDpmt/bfBIxF1j8grxosdVJ88hXWyTPkyeaSCz
 AQvg==
X-Gm-Message-State: AJIora9h6QNLciftGMCIhl9kXvX+ZXjsypsOvVXdKfLUeN1GrpgzWEh7
 sFm0OxeZ31QCQwQlLjwYURd3BAQ/WqMr3yOybE7Q0dR3H7fR9epY4yC+Vu3GY5c1VnqmWY9ueaE
 o84rIc18l+q4vdJQ=
X-Received: by 2002:a05:6602:17ce:b0:675:e5a:b7a6 with SMTP id
 z14-20020a05660217ce00b006750e5ab7a6mr2899883iox.82.1656543492200; 
 Wed, 29 Jun 2022 15:58:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u833nsVa8MFAB8yCUutSwREbm0o7fphaMG4UdtjSuPrxk4E/+I+Ftswfx8FkH/fZHJnxd30A==
X-Received: by 2002:a05:6602:17ce:b0:675:e5a:b7a6 with SMTP id
 z14-20020a05660217ce00b006750e5ab7a6mr2899857iox.82.1656543491864; 
 Wed, 29 Jun 2022 15:58:11 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 m29-20020a02a15d000000b00339ceeec5edsm7778344jah.12.2022.06.29.15.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 15:58:11 -0700 (PDT)
Date: Wed, 29 Jun 2022 16:58:09 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>, Mark Kanda <mark.kanda@oracle.com>,
 Guoyi Tu <tugy@chinatelecom.cn>, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philippe.mathieu.daude@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH V8 30/39] vfio-pci: recover from unmap-all-vaddr failure
Message-ID: <20220629165809.1456cb5d.alex.williamson@redhat.com>
In-Reply-To: <1655304746-102776-31-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-31-git-send-email-steven.sistare@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Jun 2022 07:52:17 -0700
Steve Sistare <steven.sistare@oracle.com> wrote:

> If vfio_cpr_save fails to unmap all vaddr's, then recover by walking all
> flat sections to restore the vaddr for each.  Do so by invoking the
> vfio listener callback, and passing a new "replay" flag that tells it
> to replay a mapping without re-allocating new userland data structures.

Is this comment accurate?  I thought we had unwind in the kernel for
vaddr invalidation, and the notifier here is hooked up to any fault, so
it's at least misleading regarding vaddr.  The replay option really
needs some documentation in comments.

> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  hw/vfio/common.c              | 66 ++++++++++++++++++++++++++++++++-----------
>  hw/vfio/cpr.c                 | 29 +++++++++++++++++++
>  include/hw/vfio/vfio-common.h |  2 +-
>  3 files changed, 80 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index c7d73b6..5f2bd50 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -895,15 +895,35 @@ static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
>      return true;
>  }
>  
> +static VFIORamDiscardListener *vfio_find_ram_discard_listener(
> +    VFIOContainer *container, MemoryRegionSection *section)
> +{
> +    VFIORamDiscardListener *vrdl = NULL;

This initialization was copied from current code, but...

#define QLIST_FOREACH(var, head, field)                                 \
        for ((var) = ((head)->lh_first);                                \
               ...

it doesn't look necessary.  Thanks,

Alex

> +
> +    QLIST_FOREACH(vrdl, &container->vrdl_list, next) {
> +        if (vrdl->mr == section->mr &&
> +            vrdl->offset_within_address_space ==
> +            section->offset_within_address_space) {
> +            break;
> +        }
> +    }
> +
> +    if (!vrdl) {
> +        hw_error("vfio: Trying to sync missing RAM discard listener");
> +        /* does not return */
> +    }
> +    return vrdl;
> +}
> +
>  static void vfio_listener_region_add(MemoryListener *listener,
>                                       MemoryRegionSection *section)
>  {
>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> -    vfio_container_region_add(container, section);
> +    vfio_container_region_add(container, section, false);
>  }
>  
>  void vfio_container_region_add(VFIOContainer *container,
> -                               MemoryRegionSection *section)
> +                               MemoryRegionSection *section, bool replay)
>  {
>      hwaddr iova, end;
>      Int128 llend, llsize;
> @@ -1033,6 +1053,23 @@ void vfio_container_region_add(VFIOContainer *container,
>          int iommu_idx;
>  
>          trace_vfio_listener_region_add_iommu(iova, end);
> +
> +        if (replay) {
> +            hwaddr as_offset = section->offset_within_address_space;
> +            hwaddr iommu_offset = as_offset - section->offset_within_region;
> +
> +            QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
> +                if (giommu->iommu_mr == iommu_mr &&
> +                    giommu->iommu_offset == iommu_offset) {
> +                    memory_region_iommu_replay(giommu->iommu_mr, &giommu->n);
> +                    return;
> +                }
> +            }
> +            error_report("Container cannot find iommu region %s offset %lx",
> +                memory_region_name(section->mr), iommu_offset);
> +            goto fail;
> +        }
> +
>          /*
>           * FIXME: For VFIO iommu types which have KVM acceleration to
>           * avoid bouncing all map/unmaps through qemu this way, this
> @@ -1083,7 +1120,15 @@ void vfio_container_region_add(VFIOContainer *container,
>       * about changes.
>       */
>      if (memory_region_has_ram_discard_manager(section->mr)) {
> -        vfio_register_ram_discard_listener(container, section);
> +        if (replay)  {
> +            VFIORamDiscardListener *vrdl =
> +                vfio_find_ram_discard_listener(container, section);
> +            if (vfio_ram_discard_notify_populate(&vrdl->listener, section)) {
> +                error_report("ram_discard_manager_replay_populated failed");
> +            }
> +        } else {
> +            vfio_register_ram_discard_listener(container, section);
> +        }
>          return;
>      }
>  
> @@ -1417,19 +1462,8 @@ static int vfio_sync_ram_discard_listener_dirty_bitmap(VFIOContainer *container,
>                                                     MemoryRegionSection *section)
>  {
>      RamDiscardManager *rdm = memory_region_get_ram_discard_manager(section->mr);
> -    VFIORamDiscardListener *vrdl = NULL;
> -
> -    QLIST_FOREACH(vrdl, &container->vrdl_list, next) {
> -        if (vrdl->mr == section->mr &&
> -            vrdl->offset_within_address_space ==
> -            section->offset_within_address_space) {
> -            break;
> -        }
> -    }
> -
> -    if (!vrdl) {
> -        hw_error("vfio: Trying to sync missing RAM discard listener");
> -    }
> +    VFIORamDiscardListener *vrdl =
> +        vfio_find_ram_discard_listener(container, section);
>  
>      /*
>       * We only want/can synchronize the bitmap for actually mapped parts -
> diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
> index a227d5e..2b5e77c 100644
> --- a/hw/vfio/cpr.c
> +++ b/hw/vfio/cpr.c
> @@ -32,6 +32,15 @@ vfio_dma_unmap_vaddr_all(VFIOContainer *container, Error **errp)
>      return 0;
>  }
>  
> +static int
> +vfio_region_remap(MemoryRegionSection *section, void *handle, Error **errp)
> +{
> +    VFIOContainer *container = handle;
> +    vfio_container_region_add(container, section, true);
> +    container->vaddr_unmapped = false;
> +    return 0;
> +}
> +
>  static bool vfio_is_cpr_capable(VFIOContainer *container, Error **errp)
>  {
>      if (!ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UPDATE_VADDR) ||
> @@ -98,6 +107,22 @@ static const VMStateDescription vfio_container_vmstate = {
>      }
>  };
>  
> +static void vfio_cpr_save_failed_notifier(Notifier *notifier, void *data)
> +{
> +    Error *err;
> +    VFIOContainer *container =
> +        container_of(notifier, VFIOContainer, cpr_notifier);
> +
> +    /* Set reused so vfio_dma_map restores vaddr */
> +    container->reused = true;
> +    if (address_space_flat_for_each_section(container->space->as,
> +                                            vfio_region_remap,
> +                                            container, &err)) {
> +        error_report_err(err);
> +    }
> +    container->reused = false;
> +}
> +
>  int vfio_cpr_register_container(VFIOContainer *container, Error **errp)
>  {
>      container->cpr_blocker = NULL;
> @@ -108,6 +133,8 @@ int vfio_cpr_register_container(VFIOContainer *container, Error **errp)
>  
>      vmstate_register(NULL, -1, &vfio_container_vmstate, container);
>  
> +    cpr_add_notifier(&container->cpr_notifier, vfio_cpr_save_failed_notifier,
> +                     CPR_NOTIFY_SAVE_FAILED);
>      return 0;
>  }
>  
> @@ -116,4 +143,6 @@ void vfio_cpr_unregister_container(VFIOContainer *container)
>      cpr_del_blocker(&container->cpr_blocker);
>  
>      vmstate_unregister(NULL, &vfio_container_vmstate, container);
> +
> +    cpr_remove_notifier(&container->cpr_notifier);
>  }
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 17ad9ba..dd6bbcf 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -244,7 +244,7 @@ vfio_get_device_info_cap(struct vfio_device_info *info, uint16_t id);
>  extern const MemoryListener vfio_prereg_listener;
>  void vfio_listener_register(VFIOContainer *container);
>  void vfio_container_region_add(VFIOContainer *container,
> -                               MemoryRegionSection *section);
> +                               MemoryRegionSection *section, bool replay);
>  
>  int vfio_spapr_create_window(VFIOContainer *container,
>                               MemoryRegionSection *section,


