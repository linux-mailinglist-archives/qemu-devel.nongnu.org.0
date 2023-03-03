Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3506AA5CF
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 00:49:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYF7u-0002GC-LL; Fri, 03 Mar 2023 18:47:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pYF7s-0002Fw-SX
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 18:47:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pYF7q-0003Lq-6f
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 18:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677887265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BgoMwwcLKM7PWyjambsbnSOt+BreGFz/Fmwax7rQmEY=;
 b=Y2HWakv9kXHsSEsj9smtlaw62ELDUysVFzHIAO4/lnJ7aOKh5Cg6atIEIxGqx6o4ssOOsw
 3rh18dcKKl9Uo8C1uSDa3s1uyAsXj/T3E/KKKqxk00n2lDwARPSpPfzDLFmmJyQOWmFJgy
 mG/oqLorp77z2FTPGZRhiHVyh15TPmU=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-ULDgbTRjN4iVsUK491zB_g-1; Fri, 03 Mar 2023 18:47:44 -0500
X-MC-Unique: ULDgbTRjN4iVsUK491zB_g-1
Received: by mail-il1-f199.google.com with SMTP id
 r13-20020a92c5ad000000b00316ecbf63c9so2179828ilt.13
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 15:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BgoMwwcLKM7PWyjambsbnSOt+BreGFz/Fmwax7rQmEY=;
 b=HZzC20zXDZL7sbHf+8+HEWqThpGiHVd1a9ucZlQxONyCJam2wrLZH/w17AQ1AIoe4z
 QeKVGy1aUOoDfF3HFF75SscMiLhqoy4wA80aBE/jQd6p1BBg+1JKst6D7NoLfGb0hj+R
 Typw782R2Rn6yE63138+npzUsISVNxy/1t4O/83ON2Kjn8PtPBnQOiP6GnZFtXxcmN+a
 LS5x0JaaLfIdrGOk9FmQhEKVqqXxaVvo/csgckjf8PlxRJ2+dXcVhKDwemP0aILTsBUI
 obzI9n7fybEGj/s8oeHtfdgktXnGPpbasc158jW13ITxH8FqBbQdYOR+LiD+smUD8Lr4
 3c0w==
X-Gm-Message-State: AO0yUKUQYDdKQj2bwZDZhSEmI3Dm0AhlODWksTEY+eq3qET0u0JbjFZj
 xiYhtXvQ8OHVo76GrlUlOwp8eBsc1pztScpmscIqPgRoS++ItFOyUelrr77vltZuXHHM8drNWaY
 IJSgLUdPMhE9RbBI=
X-Received: by 2002:a92:c542:0:b0:316:e54a:69ac with SMTP id
 a2-20020a92c542000000b00316e54a69acmr2984519ilj.4.1677887263274; 
 Fri, 03 Mar 2023 15:47:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+k+dvMkp5lxPA0IE8WldjwOyqRcxK0glC982Dw+NaE0fY2dDBb7+CSWQD658JYvLWq8dVLBA==
X-Received: by 2002:a92:c542:0:b0:316:e54a:69ac with SMTP id
 a2-20020a92c542000000b00316e54a69acmr2984492ilj.4.1677887262985; 
 Fri, 03 Mar 2023 15:47:42 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 u11-20020a02cbcb000000b003ed8808d450sm1069820jaq.161.2023.03.03.15.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 15:47:42 -0800 (PST)
Date: Fri, 3 Mar 2023 16:47:40 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti
 Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v2 10/20] vfio/common: Record DMA mapped IOVA ranges
Message-ID: <20230303164740.00c2e352.alex.williamson@redhat.com>
In-Reply-To: <de73073a-821d-4c31-a8a7-80c054ca5f3a@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-11-avihaih@nvidia.com>
 <20230222151039.1de95db4.alex.williamson@redhat.com>
 <83238759-4808-1e41-824b-865c330a431a@oracle.com>
 <20230223140527.096dc42b.alex.williamson@redhat.com>
 <a53767f9-b630-8f2e-0523-bd47d4539c61@oracle.com>
 <20230223145018.3c46a966.alex.williamson@redhat.com>
 <617b396a-d5e2-8c10-9717-1cc6fc9d43dd@oracle.com>
 <20230228133653.2f911490.alex.williamson@redhat.com>
 <114233e8-bdb8-21f5-ade9-0163658feb84@oracle.com>
 <20230302114248.41b6c21b.alex.williamson@redhat.com>
 <c1e5fa47-7028-5e24-2158-2e64aa44006a@oracle.com>
 <9e219add-ec7c-4408-902f-fce8c5c64020@oracle.com>
 <20230303100551.435e8cd3.alex.williamson@redhat.com>
 <87b39028-4b65-36bb-6b41-9d8ac56164a9@oracle.com>
 <20230303124025.64c35d87.alex.williamson@redhat.com>
 <de73073a-821d-4c31-a8a7-80c054ca5f3a@oracle.com>
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

On Fri, 3 Mar 2023 20:16:19 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 03/03/2023 19:40, Alex Williamson wrote:
> > On Fri, 3 Mar 2023 19:14:50 +0000
> > Joao Martins <joao.m.martins@oracle.com> wrote:
> >   
> >> On 03/03/2023 17:05, Alex Williamson wrote:  
> >>> On Fri, 3 Mar 2023 16:58:55 +0000
> >>> Joao Martins <joao.m.martins@oracle.com> wrote:
> >>>     
> >>>> On 03/03/2023 00:19, Joao Martins wrote:    
> >>>>> On 02/03/2023 18:42, Alex Williamson wrote:      
> >>>>>> On Thu, 2 Mar 2023 00:07:35 +0000
> >>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:      
> >>>>>>> @@ -426,6 +427,11 @@ void vfio_unblock_multiple_devices_migration(void)
> >>>>>>>      multiple_devices_migration_blocker = NULL;
> >>>>>>>  }
> >>>>>>>
> >>>>>>> +static bool vfio_have_giommu(VFIOContainer *container)
> >>>>>>> +{
> >>>>>>> +    return !QLIST_EMPTY(&container->giommu_list);
> >>>>>>> +}      
> >>>>>>
> >>>>>> I think it's the case, but can you confirm we build the giommu_list
> >>>>>> regardless of whether the vIOMMU is actually enabled?
> >>>>>>      
> >>>>> I think that is only non-empty when we have the first IOVA mappings e.g. on
> >>>>> IOMMU passthrough mode *I think* it's empty. Let me confirm.
> >>>>>       
> >>>> Yeap, it's empty.
> >>>>    
> >>>>> Otherwise I'll have to find a TYPE_IOMMU_MEMORY_REGION object to determine if
> >>>>> the VM was configured with a vIOMMU or not. That is to create the LM blocker.
> >>>>>       
> >>>> I am trying this way, with something like this, but neither
> >>>> x86_iommu_get_default() nor below is really working out yet. A little afraid of
> >>>> having to add the live migration blocker on each machine_init_done hook, unless
> >>>> t here's a more obvious way. vfio_realize should be at a much later stage, so I
> >>>> am surprised how an IOMMU object doesn't exist at that time.    
> >>>
> >>> Can we just test whether the container address space is system_memory?    
> >>
> >> IIUC, it doesn't work (see below snippet).
> >>
> >> The problem is that you start as a regular VFIO guest, and when the guest boot
> >> is when new mappings get established/invalidated and propagated into listeners
> >> (vfio_listener_region_add) and they morph into having a giommu. And that's when
> >> you can figure out in higher layers that 'you have a vIOMMU' as that's when the
> >> address space gets changed? That is without being specific to a particular IOMMU
> >> model. Maybe region_add is where to add, but then it then depends on the guest.  
> > 
> > This doesn't seem right to me, look for instance at
> > pci_device_iommu_address_space() which returns address_space_memory
> > when there is no vIOMMU.  If devices share an address space, they can
> > share a container.  When a vIOMMU is present (not even enabled), each
> > device gets it's own container due to the fact that it's in its own
> > address space (modulo devices within the same address space due to
> > aliasing).  
> 
> You're obviously right, I was reading this whole thing wrong. This works as far
> as I tested with an iommu=pt guest (and without an vIOMMU).
> 
> I am gonna shape this up, and hopefully submit v3 during over night.
> 
> @@ -416,9 +416,26 @@ void vfio_unblock_multiple_devices_migration(void)
>      multiple_devices_migration_blocker = NULL;
>  }
> 
> -static bool vfio_have_giommu(VFIOContainer *container)
> +static VFIOAddressSpace *vfio_get_address_space(AddressSpace *as);
> +
> +int vfio_block_giommu_migration(VFIODevice *vbasedev, Error **errp)
>  {
> -    return !QLIST_EMPTY(&container->giommu_list);
> +    int ret;
> +
> +    if (vbasedev->type == VFIO_DEVICE_TYPE_PCI &&
> +       !vfio_has_iommu(vbasedev)) {
> +       return 0;
> +    }
> +
> +    error_setg(&giommu_migration_blocker,
> +               "Migration is currently not supported with vIOMMU enabled");
> +    ret = migrate_add_blocker(giommu_migration_blocker, errp);
> +    if (ret < 0) {
> +        error_free(giommu_migration_blocker);
> +        giommu_migration_blocker = NULL;
> +    }
> +
> +    return ret;
>  }
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 939dcc3d4a9e..f4cf0b41a157 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -2843,6 +2843,15 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
>      vdev->req_enabled = false;
>  }
> 
> +bool vfio_has_iommu(VFIODevice *vbasedev)
> +{
> +    VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
> +    PCIDevice *pdev = &vdev->pdev;
> +    AddressSpace *as = &address_space_memory;
> +
> +    return !(pci_device_iommu_address_space(pdev) == as);
> +}


Shouldn't this be something non-PCI specific like:

    return vbasedev->group->container->space != &address_space_memory;

Thanks,
Alex


