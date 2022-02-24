Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CC34C36B0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:14:14 +0100 (CET)
Received: from localhost ([::1]:49702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKVB-0003mm-B6
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:14:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNKTv-00033I-Cw
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:12:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNKTo-000274-3y
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645733566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nvhjh3lRIIlY5qNjYqyl98dcnc9CA6x/Ngj8gP6mzGk=;
 b=HMAvJYTX7jI1L9Eh4aq8OrH190DuteiKQ5OslcsWUTcD4KD6/Q59tmnyJuYFNkTDE/xfao
 DFPDh1CE4nf3T75VnN6E5nABCy7YeTP1b2SpNY+kfsM3xxL9PAWNV5ugi1P1zAaPH5Epl3
 BI8EX1NzSmCQFvzQ3RT/U+tRyBu3KJs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-oP1iCxZlPbGYRUP6I3xQlw-1; Thu, 24 Feb 2022 15:12:45 -0500
X-MC-Unique: oP1iCxZlPbGYRUP6I3xQlw-1
Received: by mail-wr1-f69.google.com with SMTP id
 p9-20020adf9589000000b001e333885ac1so350689wrp.10
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 12:12:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nvhjh3lRIIlY5qNjYqyl98dcnc9CA6x/Ngj8gP6mzGk=;
 b=xVid9gIqJd9ZkuhJM2Fvhqu5NNi3P2FuOiWqZY+WaLAR/fvBhjBFLYb2ChTZIZPFy+
 e6l3AFdLzy39niF3Z1eGSGeVGOR5SVtMAkiI8RE1XHOL+c/rE/esbC+y1rGN++/foazt
 9PLJZJLxFIrq2rs+cw+791hl+hA3HBH7doL1JnDvYPKagtRdP6N1WjktI5DM/6jsFKly
 GCn15qt0sNgnzPIVkluP3VB6uXnnxMjthx9GYwdr3qzKLkSkKDDrxLGfC4hD6Pcl09xN
 JNvtjGJ7G+bNU6rVAlx+ZjPlsl1rKWTYHOdBJcf3rW9kEfx6e6uNyRI2o+AZfWnroPeJ
 37Eg==
X-Gm-Message-State: AOAM533OFUZW1UTY6NR+nM9qbdi8xDDuPAOH3oySe2fThvAF5BIVXP33
 KbnIVOjJkPYZx3GD4LGOVC1AyDSMFlK8AGFsuN/WnTib7hGuiBOPp4Oj6UYW8FhUiWjaeXObUrJ
 BewvtK+ViWyYwgGc=
X-Received: by 2002:a05:600c:4ec6:b0:352:cc24:1754 with SMTP id
 g6-20020a05600c4ec600b00352cc241754mr12802012wmq.184.1645733564146; 
 Thu, 24 Feb 2022 12:12:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYokOVTFMEQWcloI4ptZn6wKQ7MD72zKatkap8KeTgcy85iY6DJ1ijtK/UpTge8w3wGZi62g==
X-Received: by 2002:a05:600c:4ec6:b0:352:cc24:1754 with SMTP id
 g6-20020a05600c4ec600b00352cc241754mr12801985wmq.184.1645733563698; 
 Thu, 24 Feb 2022 12:12:43 -0800 (PST)
Received: from redhat.com ([2.55.165.55]) by smtp.gmail.com with ESMTPSA id
 p16-20020a7bcc90000000b003811049eb5asm2453297wma.21.2022.02.24.12.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 12:12:43 -0800 (PST)
Date: Thu, 24 Feb 2022 15:12:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Message-ID: <20220224150626-mutt-send-email-mst@kernel.org>
References: <20220223184455.9057-5-joao.m.martins@oracle.com>
 <20220223161744-mutt-send-email-mst@kernel.org>
 <5fee0e05-e4d1-712b-9ad1-f009aba431ea@oracle.com>
 <c28ade30-fbea-4d3a-3b11-356c02abaabb@oracle.com>
 <20220224122146-mutt-send-email-mst@kernel.org>
 <7afb8caf-5c98-d6db-d3e5-6e08b2832d57@oracle.com>
 <20220224131607-mutt-send-email-mst@kernel.org>
 <f19dd8be-f923-fd7d-c54d-a54fd775dcc5@oracle.com>
 <20220224144800-mutt-send-email-mst@kernel.org>
 <37df5f3a-283a-a016-311f-8281bbacda19@oracle.com>
MIME-Version: 1.0
In-Reply-To: <37df5f3a-283a-a016-311f-8281bbacda19@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 08:04:48PM +0000, Joao Martins wrote:
> 
> 
> On 2/24/22 19:54, Michael S. Tsirkin wrote:
> > On Thu, Feb 24, 2022 at 07:44:26PM +0000, Joao Martins wrote:
> >> On 2/24/22 18:30, Michael S. Tsirkin wrote:
> >>> On Thu, Feb 24, 2022 at 05:54:58PM +0000, Joao Martins wrote:
> >>>> On 2/24/22 17:23, Michael S. Tsirkin wrote:
> >>>>> On Thu, Feb 24, 2022 at 04:07:22PM +0000, Joao Martins wrote:
> >>>>>> On 2/23/22 23:35, Joao Martins wrote:
> >>>>>>> On 2/23/22 21:22, Michael S. Tsirkin wrote:
> >>>>>>>>> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
> >>>>>>>>> +                                          uint64_t pci_hole64_size)
> >>>>>>>>> +{
> >>>>>>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> >>>>>>>>> +    uint32_t eax, vendor[3];
> >>>>>>>>> +
> >>>>>>>>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
> >>>>>>>>> +    if (!IS_AMD_VENDOR(vendor)) {
> >>>>>>>>> +        return;
> >>>>>>>>> +    }
> >>>>>>>>
> >>>>>>>> Wait a sec, should this actually be tying things to the host CPU ID?
> >>>>>>>> It's really about what we present to the guest though,
> >>>>>>>> isn't it?
> >>>>>>>
> >>>>>>> It was the easier catch all to use cpuid without going into
> >>>>>>> Linux UAPI specifics. But it doesn't have to tie in there, it is only
> >>>>>>> for systems with an IOMMU present.
> >>>>>>>
> >>>>>>>> Also, can't we tie this to whether the AMD IOMMU is present?
> >>>>>>>>
> >>>>>>> I think so, I can add that. Something like a amd_iommu_exists() helper
> >>>>>>> in util/vfio-helpers.c which checks if there's any sysfs child entries
> >>>>>>> that start with ivhd in /sys/class/iommu/. Given that this HT region is
> >>>>>>> hardcoded in iommu reserved regions since >=4.11 (to latest) I don't think it's
> >>>>>>> even worth checking the range exists in:
> >>>>>>>
> >>>>>>> 	/sys/kernel/iommu_groups/0/reserved_regions
> >>>>>>>
> >>>>>>> (Also that sysfs ABI is >= 4.11 only)
> >>>>>>
> >>>>>> Here's what I have staged in local tree, to address your comment.
> >>>>>>
> >>>>>> Naturally the first chunk is what's affected by this patch the rest is a
> >>>>>> precedessor patch to introduce qemu_amd_iommu_is_present(). Seems to pass
> >>>>>> all the tests and what not.
> >>>>>>
> >>>>>> I am not entirely sure this is the right place to put such a helper, open
> >>>>>> to suggestions. wrt to the naming of the helper, I tried to follow the rest
> >>>>>> of the file's style.
> >>>>>>
> >>>>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >>>>>> index a9be5d33a291..2ea4430d5dcc 100644
> >>>>>> --- a/hw/i386/pc.c
> >>>>>> +++ b/hw/i386/pc.c
> >>>>>> @@ -868,10 +868,8 @@ static void x86_update_above_4g_mem_start(PCMachineState *pcms,
> >>>>>>                                            uint64_t pci_hole64_size)
> >>>>>>  {
> >>>>>>      X86MachineState *x86ms = X86_MACHINE(pcms);
> >>>>>> -    uint32_t eax, vendor[3];
> >>>>>>
> >>>>>> -    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
> >>>>>> -    if (!IS_AMD_VENDOR(vendor)) {
> >>>>>> +    if (!qemu_amd_iommu_is_present()) {
> >>>>>>          return;
> >>>>>>      }
> >>>>>>
> >>>>>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> >>>>>> index 7bcce3bceb0f..eb4ea071ecec 100644
> >>>>>> --- a/include/qemu/osdep.h
> >>>>>> +++ b/include/qemu/osdep.h
> >>>>>> @@ -637,6 +637,15 @@ char *qemu_get_host_name(Error **errp);
> >>>>>>   */
> >>>>>>  size_t qemu_get_host_physmem(void);
> >>>>>>
> >>>>>> +/**
> >>>>>> + * qemu_amd_iommu_is_present:
> >>>>>> + *
> >>>>>> + * Operating system agnostic way of querying if an AMD IOMMU
> >>>>>> + * is present.
> >>>>>> + *
> >>>>>> + */
> >>>>>> +bool qemu_amd_iommu_is_present(void);
> >>>>>> +
> >>>>>>  /*
> >>>>>>   * Toggle write/execute on the pages marked MAP_JIT
> >>>>>>   * for the current thread.
> >>>>>> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> >>>>>> index f2be7321c59f..54cef21217c4 100644
> >>>>>> --- a/util/oslib-posix.c
> >>>>>> +++ b/util/oslib-posix.c
> >>>>>> @@ -982,3 +982,32 @@ size_t qemu_get_host_physmem(void)
> >>>>>>  #endif
> >>>>>>      return 0;
> >>>>>>  }
> >>>>>> +
> >>>>>> +bool qemu_amd_iommu_is_present(void)
> >>>>>> +{
> >>>>>> +    bool found = false;
> >>>>>> +#ifdef CONFIG_LINUX
> >>>>>> +    struct dirent *entry;
> >>>>>> +    char *path;
> >>>>>> +    DIR *dir;
> >>>>>> +
> >>>>>> +    path = g_strdup_printf("/sys/class/iommu");
> >>>>>> +    dir = opendir(path);
> >>>>>> +    if (!dir) {
> >>>>>> +        g_free(path);
> >>>>>> +        return found;
> >>>>>> +    }
> >>>>>> +
> >>>>>> +    do {
> >>>>>> +            entry = readdir(dir);
> >>>>>> +            if (entry && !strncmp(entry->d_name, "ivhd", 4)) {
> >>>>>> +                found = true;
> >>>>>> +                break;
> >>>>>> +            }
> >>>>>> +    } while (entry);
> >>>>>> +
> >>>>>> +    g_free(path);
> >>>>>> +    closedir(dir);
> >>>>>> +#endif
> >>>>>> +    return found;
> >>>>>> +}
> >>>>>
> >>>>> why are we checking whether an AMD IOMMU is present
> >>>>> on the host? 
> >>>>> Isn't what we care about whether it's
> >>>>> present in the VM? What we are reserving after all
> >>>>> is a range of GPAs, not actual host PA's ...
> >>>>>
> >>>> Right.
> >>>>
> >>>> But any DMA map done by VFIO/IOMMU using those GPA ranges will fail,
> >>>> and so we need to not map that portion of address space entirely
> >>>> and use some other portion of the GPA-space. This has to
> >>>> do with host IOMMU which is where the DMA mapping of guest PA takes
> >>>> place. So, if you do not have an host IOMMU, you can't
> >>>> service guest DMA/PCIe services via VFIO through the host IOMMU, therefore you
> >>>> don't need this problem.
> >>>>
> >>>> Whether one uses a guest IOMMU or not does not affect the result,
> >>>> it would be more of a case of mimicking real hardware not fixing
> >>>> the issue of this series.
> >>>
> >>>
> >>> Hmm okay ... my first reaction was to say let's put it under VFIO then.
> >>> And ideally move the logic reporting reserved ranges there too.
> >>> However, I think vdpa has the same issue too.
> >>> CC Jason for an opinion.
> >>
> >> It does have the same problem.
> >>
> >> This is not specific to VFIO, it's to anything that uses the iommu.
> > 
> > Right. Most VMs don't use the host IOMMU though ;) It's unfortunate
> > that we don't have a global "enable-vfio" flag since vfio devices
> > can be hot-plugged. I think this is not the first time we wanted
> > something like this, right Alex?
> > 
> >> It's
> >> just that VFIO doesn't let you shoot in the foot :)
> >>
> >> vDPA would need to validate iova ranges as well to prevent mapping on
> >> reserved IOVAs similar to commit 9b77e5c7984 ("vfio/type1: check dma
> >> map request is within a valid iova range"). Now you could argue that
> >> it's an IOMMU core problem, maybe.
> >>
> >> But I this as a separate problem,
> >> because regardless of said validation, your guest provisioning
> >> is still going to fail for guests with >=1010G of max GPA and even if
> >> it doesn't fail you shouldn't be letting it DMA map those in the first
> >> place (e.g. you could see spurious INVALID_DEVICE_REQUEST fault events
> >> from IOMMU if DMA is attempted over the first megabyte of that 1T hole).
> > 
> > I wonder what's the status on a system without an IOMMU.
> > 
> In theory you should be OK. Also it's worth keeping in mind that AMD machines
> with >=1T have this 12G hole marked as Reserved, so even DMA at last when CPU
> is the initiator should be fine on worst case scenario.

Not sure I understand this last sentence.

> >>> Also, some concerns
> >>> - I think this changes memory layout for working VMs not using VFIO.
> >>>   Better preserve the old layout for old machine types?
> >>>
> >> Oh definitely, and I do that in this series. See the last commit, and
> >> in the past it was also a machine-property exposed to userspace.
> >> Otherwise I would be breaking (badly) compat/migration.
> >>
> >> I would like to emphasize that these memory layout changes are *exclusive* and
> >> *only* for hosts on AMD with guests memory being bigger than ~950G-~1010G.
> >> It's not every guest, but a fairly limited subset of big-memory guests that
> >> are not the norm.
> >>
> >> Albeit the phys-bits property errors might gives us a bit more trouble, so
> >> it might help being more conservative.
> >>
> >>> - You mention the phys bits issue very briefly, and it's pretty
> >>>   concerning.  Do we maybe want to also disable the work around if phys
> >>>   bits is too small? 
> >>
> >> We are doing that here (well, v4), as suggested by Igor. Note that in this series
> >> it's a warning, but v4 I have it as an error and with the 32-bit issues that
> >> I found through qtest.
> >>
> >> I share the same concern as you over making this an error because of compatibility.
> >> Perhaps, we could go back to the previous version and turn back into a warning and
> >> additionally even disabling the relocation all together. Or if desired even
> >> depending on a machine-property to enable it.
> > 
> > I would be inclined to disable the relocation. And maybe block vfio? I'm
> > not 100% sure about that last one, but this can be a vfio decision to
> > make.
> > 
> I don't see this as a VFIO problem (VFIO is actually being a good citizen and doing the
> right thing :)). From my perspective this fix is also useful to vDPA (which we also care),
> and thus will also let us avoid DMA mapping in these GPA ranges.
> 
> The reason I mention VFIO in cover letter is that it's one visible UAPI change that
> users will notice that suddenly their 1TB+ VMs break.

What I mean is that most VMs don't use either VFIO or VDPA.
If we had VFIO,VDPA as an accelerator that needs to be listed
upfront when qemu is started, we could solve this with
a bit less risk by not changing anything for VMs without these two.

Alex what do you think about adding this?

Given we do not have such a thing right now, one can get
into a situation where phys bits limit CPU, then
more memory is supplied than would fit above reserved region, then
we stick the memory over the reserved region, and finally
then vfio device is added.

In this last configuration, should vfio device add fail?
Or just warn and try to continue? I think we can code this last
decision as part of vfio code and then Alex will get to decide ;)
And yes, a similar thing with vdpa.


> >>> Also, we'd need to test a bunch of old
> >>>   guests to see what happens. Which guests were tested? 
> >>>
> >> Do you envision that old guests would run (or care) into this sort of 1TB config? Mainly
> >> testing more modern guests on Linux (>= 4.14) over this last set of versions, and in the
> >> past Windows 2012+. Let me be extra extra pedantic on this part for the next submission
> >> (and report back if something odd happens).
> > 
> > Not 100% sure but let's at least document.
> > 


