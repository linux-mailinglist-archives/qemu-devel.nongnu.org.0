Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEFF6A88AA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 19:43:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXntO-0007pr-KO; Thu, 02 Mar 2023 13:43:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pXntK-0007ja-Sa
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:43:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pXntH-0003nh-Im
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677782574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6jF/XGlTxBAQwhvq8vWbxw8wrLzV3aJen3b7kQyMDaU=;
 b=M0sim5iXhhfZ01OrYdts0eP5IsBvlrQLA3O0W3KjVDiyYa1zK3Lmw7kG1JZHiVwMFlaj4S
 pmmjODJhVDYnHm6ksw9/DZFS4/SPPS8xW8VDzDyWiy8KTv3cbvlgyoIxn+YBNWSbN5T+CK
 IWO1Zq0X/6pvriWt4WjCpyUdpzUmyjg=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-wvgbL1gOOH-5gnXX6V8DEg-1; Thu, 02 Mar 2023 13:42:53 -0500
X-MC-Unique: wvgbL1gOOH-5gnXX6V8DEg-1
Received: by mail-il1-f200.google.com with SMTP id
 a5-20020a92ce45000000b00318aa18d2fbso164978ilr.23
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 10:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6jF/XGlTxBAQwhvq8vWbxw8wrLzV3aJen3b7kQyMDaU=;
 b=XdyLj243eiQ+4DonkJA7Tqt7DXY222M2FSIor71p8kOjA9QIj0WM8v0RP4gtBRTSp+
 TZGseZBoLsDNH5cWyD9IIOBn5VsDcPY4K2ERjL87mCLd6YhaKxVyCP6UEcZv4qN0B23Z
 qGpjUpGPA/9MueWesmVnxu1NTtFolWXW8k/1cffWsflcWLa4xhJMz2gTYPh0zrjm45VA
 Q3OHjdW7YBB1m123e7qOqZdH0RpX8AJVMFubRdRf+47VJBcdHY+qnCCF9nfljZSa9fkb
 a03n0uLf14K+pdz9+DA7UlE11qvsIllWUIY4H/Wdas24YI4fukVmoayI5MIwuQoOFBF9
 0LuA==
X-Gm-Message-State: AO0yUKWObYGne4qvfalcgG2EWkckMpzkxUIs5G5pfwuf+2y5qpHiaQvD
 TZrICIn2K6d5f8ke7Dh/0bY8uKhTgtDjS2gkhbpVHhvl3XfuyzsQ5xZNV+vQ66ZQQnRcM0h6A3O
 YMuUg91aH+EPH4Gg=
X-Received: by 2002:a05:6e02:1c03:b0:310:dbcd:942c with SMTP id
 l3-20020a056e021c0300b00310dbcd942cmr8267680ilh.21.1677782572106; 
 Thu, 02 Mar 2023 10:42:52 -0800 (PST)
X-Google-Smtp-Source: AK7set+mOeW2lsjmoAWp66jnNac9CE3OLL1O4yY6HUheAaSjDN6bP0XU+MIyjBBCrOTufgmla9hZdA==
X-Received: by 2002:a05:6e02:1c03:b0:310:dbcd:942c with SMTP id
 l3-20020a056e021c0300b00310dbcd942cmr8267653ilh.21.1677782571726; 
 Thu, 02 Mar 2023 10:42:51 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 k17-20020a02cb51000000b003f172fe465esm75866jap.80.2023.03.02.10.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 10:42:50 -0800 (PST)
Date: Thu, 2 Mar 2023 11:42:48 -0700
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
Message-ID: <20230302114248.41b6c21b.alex.williamson@redhat.com>
In-Reply-To: <114233e8-bdb8-21f5-ade9-0163658feb84@oracle.com>
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

On Thu, 2 Mar 2023 00:07:35 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 28/02/2023 20:36, Alex Williamson wrote:
> > On Tue, 28 Feb 2023 12:11:06 +0000
> > Joao Martins <joao.m.martins@oracle.com> wrote:  
> >> On 23/02/2023 21:50, Alex Williamson wrote:  
> >>> On Thu, 23 Feb 2023 21:19:12 +0000
> >>> Joao Martins <joao.m.martins@oracle.com> wrote:    
> >>>> On 23/02/2023 21:05, Alex Williamson wrote:    
> >>>>> On Thu, 23 Feb 2023 10:37:10 +0000
> >>>>> Joao Martins <joao.m.martins@oracle.com> wrote:      
> >>>>>> On 22/02/2023 22:10, Alex Williamson wrote:      
> >>>>>>> On Wed, 22 Feb 2023 19:49:05 +0200
> >>>>>>> Avihai Horon <avihaih@nvidia.com> wrote:        
> >>>>>>>> From: Joao Martins <joao.m.martins@oracle.com>
> >>>>>>>> @@ -612,6 +665,16 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
> >>>>>>>>          .iova = iova,
> >>>>>>>>          .size = size,
> >>>>>>>>      };
> >>>>>>>> +    int ret;
> >>>>>>>> +
> >>>>>>>> +    ret = vfio_record_mapping(container, iova, size, readonly);
> >>>>>>>> +    if (ret) {
> >>>>>>>> +        error_report("vfio: Failed to record mapping, iova: 0x%" HWADDR_PRIx
> >>>>>>>> +                     ", size: 0x" RAM_ADDR_FMT ", ret: %d (%s)",
> >>>>>>>> +                     iova, size, ret, strerror(-ret));
> >>>>>>>> +
> >>>>>>>> +        return ret;
> >>>>>>>> +    }        
> >>>>>>>
> >>>>>>> Is there no way to replay the mappings when a migration is started?
> >>>>>>> This seems like a horrible latency and bloat trade-off for the
> >>>>>>> possibility that the VM might migrate and the device might support
> >>>>>>> these features.  Our performance with vIOMMU is already terrible, I
> >>>>>>> can't help but believe this makes it worse.  Thanks,
> >>>>>>>         
> >>>>>>
> >>>>>> It is a nop if the vIOMMU is being used (entries in container->giommu_list) as
> >>>>>> that uses a max-iova based IOVA range. So this is really for iommu identity
> >>>>>> mapping and no-VIOMMU.      
> >>>>>
> >>>>> Ok, yes, there are no mappings recorded for any containers that have a
> >>>>> non-empty giommu_list.
> >>>>>       
> >>>>>> We could replay them if they were tracked/stored anywhere.      
> >>>>>
> >>>>> Rather than piggybacking on vfio_memory_listener, why not simply
> >>>>> register a new MemoryListener when migration is started?  That will
> >>>>> replay all the existing ranges and allow tracking to happen separate
> >>>>> from mapping, and only when needed.  
> >>>>
> >>>> The problem with that is that *starting* dirty tracking needs to have all the
> >>>> range, we aren't supposed to start each range separately. So on a memory
> >>>> listener callback you don't have introspection when you are dealing with the
> >>>> last range, do we?    
> >>>
> >>> As soon as memory_listener_register() returns, all your callbacks to
> >>> build the IOVATree have been called and you can act on the result the
> >>> same as if you were relying on the vfio mapping MemoryListener.  I'm
> >>> not seeing the problem.  Thanks,
> >>>     
> >>
> >> While doing these changes, the nice thing of the current patch is that whatever
> >> changes apply to vfio_listener_region_add() will be reflected in the mappings
> >> tree that stores what we will dirty track. If we move the mappings calculation
> >> necessary for dirty tracking only when we start, we will have to duplicate the
> >> same checks, and open for bugs where we ask things to be dirty track-ed that
> >> haven't been DMA mapped. These two aren't necessarily tied, but felt like I
> >> should raise the potentially duplication of the checks (and the same thing
> >> applies for handling virtio-mem and what not).
> >>
> >> I understand that if we were going to store *a lot* of mappings that this would
> >> add up in space requirements. But for no-vIOMMU (or iommu=pt) case this is only
> >> about 12ranges or so, it is much simpler to piggyback the existing listener.
> >> Would you still want to move this to its own dedicated memory listener?  
> > 
> > Code duplication and bugs are good points, but while typically we're
> > only seeing a few handfuls of ranges, doesn't virtio-mem in particular
> > allow that we could be seeing quite a lot more?
> >   
> Ugh yes, it could be.
> 
> > We used to be limited to a fairly small number of KVM memory slots,
> > which effectively bounded non-vIOMMU DMA mappings, but that value is
> > now 2^15, so we need to anticipate that we could see many more than a
> > dozen mappings.
> >   
> 
> Even with 32k memory slots today we are still reduced on a handful. hv-balloon
> and virtio-mem approaches though are the ones that may stress such limit IIUC
> prior to starting migration.
> 
> > Can we make the same argument that the overhead is negligible if a VM
> > makes use of 10s of GB of virtio-mem with 2MB block size?
> > 
> > But then on a 4KB host we're limited to 256 tracking entries, so
> > wasting all that time and space on a runtime IOVATree is even more
> > dubious.
> >
> > In fact, it doesn't really matter that vfio_listener_region_add and
> > this potentially new listener come to the same result, as long as the
> > new listener is a superset of the existing listener.   
> 
> I am trying to put this in a way that's not too ugly to reuse the most between
> vfio_listener_region_add() and the vfio_migration_mapping_add().
> 
> For you to have an idea, here's so far how it looks thus far:
> 
> https://github.com/jpemartins/qemu/commits/vfio-dirty-tracking
> 
> Particularly this one:
> 
> https://github.com/jpemartins/qemu/commit/3b11fa0e4faa0f9c0f42689a7367284a25d1b585
> 
> vfio_get_section_iova_range() is where most of these checks are that are sort of
> a subset of the ones in vfio_listener_region_add().
> 
> > So I think we can
> > simplify out a lot of the places we'd see duplication and bugs.  I'm
> > not even really sure why we wouldn't simplify things further and only
> > record a single range covering the low and high memory marks for a
> > non-vIOMMU VMs, or potentially an approximation removing gaps of 1GB or
> > more, for example.  Thanks,  
> 
> Yes, for Qemu, to have one single artificial range with a computed min IOVA and
> max IOVA is the simplest to get it implemented. It would avoid us maintaining an
> IOVATree as you would only track min/max pair (maybe max_below).
> 
> My concern with a reduced single range is 1) big holes in address space leading
> to asking more than you need[*] and then 2) device dirty tracking limits e.g.
> hardware may have upper limits, so you may prematurely exercise those. So giving
> more choice to the vfio drivers to decide how to cope with the mapped address
> space description looks to have a bit more longevity.

The fact that we don't know anything about the device dirty tracking
limits worries me.  If QEMU reports the VM is migratable, ie. lacking
migration blockers, then we really shouldn't have non-extraordinary
things like the VM actually having a bigger address space than the
device can support, or enabling a vIOMMU, suddenly make the VM
non-migratable.

If we only needed to worry about scenarios like the AMD hypertransport
memory relocation, then tracking ranges for 32-bit and 64-bit RAM
separately would be an easy solution, we always have 1-2 ranges for the
device to track.  That's still a big simplification from tracking every
DMA mappings.

AIUI, we really can't even rely on the device supporting a full host
page size worth of mappings, the uAPI only stipulates that the core
kernel code will support such a request.  So it seems prudent that
userspace should conserve entries wherever it can.  For the
alternative, to provide ranges that closely match actual mappings, I
think we'd need to be able to collapse IOVATree entries with the
smallest gap when we reach the limit, and continue to collapse each time
the driver rejects the number of ranges provided.  That's obviously
much more complicated and I'd prefer to avoid it if there are easier
approximations.

> Anyway the temptation with having a single range is that this can all go away if
> the vfio_listener_region_add() tracks just min/max IOVA pair.
> 
> Below scissors mark it's how this patch is looking like in the commit above
> while being a full list of mappings. It's also stored here:
> 
> https://github.com/jpemartins/qemu/commits/vfio-dirty-tracking
> 
> I'll respond here with a patch on what it looks like with the range watermark
> approach.
> 
> 	Joao
> 
> [0] AMD 1T boundary is what comes to mind, which on Qemu relocates memory above
> 4G into after 1T.
> 
> ------------------>8--------------------  
> 
> From: Joao Martins <joao.m.martins@oracle.com>
> Date: Wed, 22 Feb 2023 19:49:05 +0200
> Subject: [PATCH wip 7/12] vfio/common: Record DMA mapped IOVA ranges
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
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  hw/vfio/common.c              | 147 +++++++++++++++++++++++++++++++++-
>  hw/vfio/trace-events          |   2 +
>  include/hw/vfio/vfio-common.h |   4 +
>  3 files changed, 150 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 655e8dbb74d4..17971e6dbaeb 100644
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

I think it's the case, but can you confirm we build the giommu_list
regardless of whether the vIOMMU is actually enabled?

> +
>  static void vfio_set_migration_error(int err)
>  {
>      MigrationState *ms = migrate_get_current();
> @@ -610,6 +616,7 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>          .iova = iova,
>          .size = size,
>      };
> +    int ret;
> 
>      if (!readonly) {
>          map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
> @@ -626,8 +633,10 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>          return 0;
>      }
> 
> +    ret = -errno;
>      error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
> -    return -errno;
> +
> +    return ret;
>  }
> 
>  static void vfio_host_win_add(VFIOContainer *container,
> @@ -1326,11 +1335,127 @@ static int vfio_set_dirty_page_tracking(VFIOContainer
> *container, bool start)
>      return ret;
>  }
> 
> +static bool vfio_get_section_iova_range(VFIOContainer *container,
> +                                        MemoryRegionSection *section,
> +                                        hwaddr *out_iova, hwaddr *out_end)
> +{
> +    Int128 llend, llsize;
> +    hwaddr iova, end;
> +
> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
> +    llend = int128_make64(section->offset_within_address_space);
> +    llend = int128_add(llend, section->size);
> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
> +
> +    if (int128_ge(int128_make64(iova), llend)) {
> +        return false;
> +    }
> +    end = int128_get64(int128_sub(llend, int128_one()));
> +
> +    if (memory_region_is_iommu(section->mr) ||

Shouldn't there already be a migration blocker in place preventing this
from being possible?

> +        memory_region_has_ram_discard_manager(section->mr)) {

Are we claiming not to support virtio-mem VMs as well?  The current
comment in vfio/common.c that states we only want to map actually
populated parts seems like it doesn't apply here, we'd want dirty
tracking ranges to include these regardless.  Unless there's some
reason virtio-mem changes are blocked during pre-copy.

> +	return false;
> +    }
> +
> +    llsize = int128_sub(llend, int128_make64(iova));
> +
> +    if (memory_region_is_ram_device(section->mr)) {
> +        VFIOHostDMAWindow *hostwin;
> +        hwaddr pgmask;
> +
> +        hostwin = vfio_find_hostwin(container, iova, end);
> +        if (!hostwin) {
> +            return false;
> +        }
> +
> +	pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
> +        if ((iova & pgmask) || (int128_get64(llsize) & pgmask)) {
> +            return false;
> +        }
> +    }

ram_device is intended to be an address range on another device, so do
we really need it in DMA dirty tracking?  ex. we don't include device
BARs in the dirty bitmap, we expect modified device state to be
reported by the device, so it seems like there's no case where we'd
include this in the device dirty tracking ranges.

> +
> +    *out_iova = iova;
> +    *out_end = int128_get64(llend);
> +    return true;
> +}
> +
> +static void vfio_migration_add_mapping(MemoryListener *listener,
> +                                       MemoryRegionSection *section)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer,
> mappings_listener);
> +    hwaddr end = 0;
> +    DMAMap map;
> +    int ret;
> +
> +    if (vfio_have_giommu(container)) {
> +        vfio_set_migration_error(-EOPNOTSUPP);

There should be a migration blocker that prevents this from ever being
called in this case.

> +        return;
> +    }
> +
> +    if (!vfio_listener_valid_section(section) ||
> +        !vfio_get_section_iova_range(container, section, &map.iova, &end)) {
> +        return;
> +    }
> +
> +    map.size = end - map.iova - 1; // IOVATree is inclusive, so subtract 1 from
> size
> +    map.perm = section->readonly ? IOMMU_RO : IOMMU_RW;
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
> +    trace_vfio_migration_mapping_add(map.iova, map.iova + map.size, ret);
> +
> +    if (ret)
> +        vfio_set_migration_error(ret);
> +    return;
> +}
> +
> +static void vfio_migration_remove_mapping(MemoryListener *listener,
> +                                          MemoryRegionSection *section)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer,
> mappings_listener);
> +    hwaddr end = 0;
> +    DMAMap map;
> +
> +    if (vfio_have_giommu(container)) {
> +        vfio_set_migration_error(-EOPNOTSUPP);
> +        return;
> +    }
> +
> +    if (!vfio_listener_valid_section(section) ||
> +        !vfio_get_section_iova_range(container, section, &map.iova, &end)) {
> +        return;
> +    }
> +
> +    WITH_QEMU_LOCK_GUARD(&container->mappings_mutex) {
> +        iova_tree_remove(container->mappings, map);
> +    }
> +
> +    trace_vfio_migration_mapping_del(map.iova, map.iova + map.size);
> +}

Why do we need a region_del callback?  We don't support modifying the
dirty tracking ranges we've provided to the device.

> +
> +
> +static const MemoryListener vfio_dirty_tracking_listener = {
> +    .name = "vfio-migration",
> +    .region_add = vfio_migration_add_mapping,
> +    .region_del = vfio_migration_remove_mapping,
> +};
> +
>  static void vfio_listener_log_global_start(MemoryListener *listener)
>  {
>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>      int ret;
> 
> +    memory_listener_register(&container->mappings_listener, container->space->as);
> +
>      ret = vfio_set_dirty_page_tracking(container, true);
>      if (ret) {
>          vfio_set_migration_error(ret);
> @@ -1346,6 +1471,8 @@ static void vfio_listener_log_global_stop(MemoryListener
> *listener)
>      if (ret) {
>          vfio_set_migration_error(ret);
>      }
> +
> +    memory_listener_unregister(&container->mappings_listener);

We don't have a way to update dirty tracking ranges for a device once
dirty tracking is enabled, so what's the point of this listener running
in more than a one-shot mode?  The only purpose of a listener
continuing to run seems like it would be to generate an error for
untracked ranges and either generate a migration error or mark them
perpetually dirty.

>  }
> 
>  static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
> @@ -2172,16 +2299,24 @@ static int vfio_connect_container(VFIOGroup *group,
> AddressSpace *as,
>      QLIST_INIT(&container->giommu_list);
>      QLIST_INIT(&container->hostwin_list);
>      QLIST_INIT(&container->vrdl_list);
> +    container->mappings = iova_tree_new();
> +    if (!container->mappings) {
> +        error_setg(errp, "Cannot allocate DMA mappings tree");
> +        ret = -ENOMEM;
> +        goto free_container_exit;
> +    }
> +    qemu_mutex_init(&container->mappings_mutex);
> +    container->mappings_listener = vfio_dirty_tracking_listener;

This all seems like code that would only be necessary before starting
the listener.

> 
>      ret = vfio_init_container(container, group->fd, errp);
>      if (ret) {
> -        goto free_container_exit;
> +        goto destroy_mappings_exit;
>      }
> 
>      ret = vfio_ram_block_discard_disable(container, true);
>      if (ret) {
>          error_setg_errno(errp, -ret, "Cannot set discarding of RAM broken");
> -        goto free_container_exit;
> +        goto destroy_mappings_exit;
>      }
> 
>      switch (container->iommu_type) {
> @@ -2317,6 +2452,10 @@ listener_release_exit:
>  enable_discards_exit:
>      vfio_ram_block_discard_disable(container, false);
> 
> +destroy_mappings_exit:
> +    qemu_mutex_destroy(&container->mappings_mutex);
> +    iova_tree_destroy(container->mappings);
> +
>  free_container_exit:
>      g_free(container);
> 
> @@ -2371,6 +2510,8 @@ static void vfio_disconnect_container(VFIOGroup *group)
>          }
> 
>          trace_vfio_disconnect_container(container->fd);
> +        qemu_mutex_destroy(&container->mappings_mutex);
> +        iova_tree_destroy(container->mappings);

The IOVATree should be destroyed as soon as we're done processing the
result upon starting logging.  It serves no purpose to keep it around.

Comparing with the follow-up, setting {min,max}_tracking_iova, many of
the same comments apply.  Both of these are only preparing for the
question of what do we actually do with this data.  In the IOVATree
approach, we have more fine grained information, but we can also exceed
what the device supports and we need to be able to handle that.  If our
fallback is to simply identify the min and max based on the IOVATree,
and we expect that to work better than the more granular approach, why
not start with just min/max?  If we expect there's value to the more
granular approach, then when not proceed to collapse the IOVATree until
we find a set of ranges the device can support?  Thanks,

Alex

>          close(container->fd);
>          g_free(container);
> 
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 669d9fe07cd9..c92eaadcc7c4 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -104,6 +104,8 @@ vfio_known_safe_misalignment(const char *name, uint64_t
> iova, uint64_t offset_wi
>  vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t
> size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not
> aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>  vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING
> region_del 0x%"PRIx64" - 0x%"PRIx64
>  vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64"
> - 0x%"PRIx64
> +vfio_migration_mapping_add(uint64_t start, uint64_t end, int err) "mapping_add
> 0x%"PRIx64" - 0x%"PRIx64" err=%d"
> +vfio_migration_mapping_del(uint64_t start, uint64_t end) "mapping_del
> 0x%"PRIx64" - 0x%"PRIx64
>  vfio_disconnect_container(int fd) "close container->fd=%d"
>  vfio_put_group(int fd) "close group->fd=%d"
>  vfio_get_device(const char * name, unsigned int flags, unsigned int
> num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 87524c64a443..48951da11ab4 100644
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
> @@ -81,6 +82,7 @@ typedef struct VFIOContainer {
>      int fd; /* /dev/vfio/vfio, empowered by the attached groups */
>      MemoryListener listener;
>      MemoryListener prereg_listener;
> +    MemoryListener mappings_listener;
>      unsigned iommu_type;
>      Error *error;
>      bool initialized;
> @@ -89,6 +91,8 @@ typedef struct VFIOContainer {
>      uint64_t max_dirty_bitmap_size;
>      unsigned long pgsizes;
>      unsigned int dma_max_mappings;
> +    IOVATree *mappings;
> +    QemuMutex mappings_mutex;
>      QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
>      QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
>      QLIST_HEAD(, VFIOGroup) group_list;
> --
> 2.17.2
> 


