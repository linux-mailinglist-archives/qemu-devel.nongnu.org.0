Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0EB4C37F9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 22:44:28 +0100 (CET)
Received: from localhost ([::1]:42086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNLuV-0007ir-Lz
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 16:44:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nNLrV-000659-9C
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 16:41:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nNLrH-0001zg-Dy
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 16:41:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645738858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iqP0CRPj1mb1GXdXDEEmhqWwLj4sDf61M8jTYvSRX0o=;
 b=Pa7vyjaQUsWJRkEsQzKWESr9KsScyuFxcYdX9vC6amd1FF9RuD9PWtIKRlRsdRUIN5tCtu
 HhSaMPEBy229D3tJ7/V7mLTDNJt/j7YcBBj4Kplwh1dU5P314kuvvx8zD/KwjRqmAR0DFj
 BMBlip9KX/TKhEpt/o5S4EKe+9Jxbt8=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-35BSN_HFNxuIDGW3W0oH1w-1; Thu, 24 Feb 2022 16:40:57 -0500
X-MC-Unique: 35BSN_HFNxuIDGW3W0oH1w-1
Received: by mail-oi1-f200.google.com with SMTP id
 k11-20020a54470b000000b002d538f56e6bso1951916oik.22
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 13:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=iqP0CRPj1mb1GXdXDEEmhqWwLj4sDf61M8jTYvSRX0o=;
 b=oMTpPctscCr88ZnYh/GVIgR62aq/1fF9q7lo87mmOeICHQW/GtDFdPYHMJFjk6gAdx
 uCy9RYg6P0RI0X8FJlQEOCww6D4PQ8kMFbWa4QQb+Rocv+Cf9P9QZ3juZNdNZdvfViV7
 2fpO7SyAy5oXkBObZLijYfbaV6vu6vrk4v4Keaec3Z7nL0U1bhY754O/X72Cr0tkUIUC
 rDxAg/BpyrVSjVxlBbxXwI7sWKpLSUc91tNVSTPPrbu3yWQsDmPQImOCD23vXSq62rhV
 Laws6gcr0xn6au8GUkl+Bp+tEq94GgJoT0Yho7q30ZbLIledqRNvkKDAUqBAoQ4YHlX+
 q0Nw==
X-Gm-Message-State: AOAM533PDM6c/MiWlqmwvaV4C1G5fYZsEg+sm3SUpoGFaQ4aSM19+RcL
 KVnK/HCWZDrIp++jBJX6bRswsNfdTNRHBpPMprQu26kwZ7DK06rVckGWVn48US0950XH9UqN0HR
 3Nz0flx0CxScw1Zk=
X-Received: by 2002:a05:6830:1de7:b0:59e:7ffd:902a with SMTP id
 b7-20020a0568301de700b0059e7ffd902amr1762555otj.48.1645738856347; 
 Thu, 24 Feb 2022 13:40:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzXJ550eK/xVzTuHjbPZ9h1yUpDD8GQrdzJrEXgwts5ZOgElpVry7XUgb2JQ+5vr/wwrRLAA==
X-Received: by 2002:a05:6830:1de7:b0:59e:7ffd:902a with SMTP id
 b7-20020a0568301de700b0059e7ffd902amr1762541otj.48.1645738855911; 
 Thu, 24 Feb 2022 13:40:55 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 be40-20020a05680821a800b002d06df28063sm431686oib.5.2022.02.24.13.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 13:40:55 -0800 (PST)
Date: Thu, 24 Feb 2022 14:40:53 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Message-ID: <20220224144053.3fbe234d.alex.williamson@redhat.com>
In-Reply-To: <5cae0afc-df3e-5dc6-d11b-2f7d931ba5e6@oracle.com>
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
 <20220224150626-mutt-send-email-mst@kernel.org>
 <5cae0afc-df3e-5dc6-d11b-2f7d931ba5e6@oracle.com>
Organization: Red Hat
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Feb 2022 20:34:40 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 2/24/22 20:12, Michael S. Tsirkin wrote:
> > On Thu, Feb 24, 2022 at 08:04:48PM +0000, Joao Martins wrote:  
> >> On 2/24/22 19:54, Michael S. Tsirkin wrote:  
> >>> On Thu, Feb 24, 2022 at 07:44:26PM +0000, Joao Martins wrote:  
> >>>> On 2/24/22 18:30, Michael S. Tsirkin wrote:  
> >>>>> On Thu, Feb 24, 2022 at 05:54:58PM +0000, Joao Martins wrote:  
> >>>>>> On 2/24/22 17:23, Michael S. Tsirkin wrote:  
> >>>>>>> On Thu, Feb 24, 2022 at 04:07:22PM +0000, Joao Martins wrote:  
> >>>>>>>> On 2/23/22 23:35, Joao Martins wrote:  
> >>>>>>>>> On 2/23/22 21:22, Michael S. Tsirkin wrote:  
> >>>>>>>>>>> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
> >>>>>>>>>>> +                                          uint64_t pci_hole64_size)
> >>>>>>>>>>> +{
> >>>>>>>>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> >>>>>>>>>>> +    uint32_t eax, vendor[3];
> >>>>>>>>>>> +
> >>>>>>>>>>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
> >>>>>>>>>>> +    if (!IS_AMD_VENDOR(vendor)) {
> >>>>>>>>>>> +        return;
> >>>>>>>>>>> +    }  
> >>>>>>>>>>
> >>>>>>>>>> Wait a sec, should this actually be tying things to the host CPU ID?
> >>>>>>>>>> It's really about what we present to the guest though,
> >>>>>>>>>> isn't it?  
> >>>>>>>>>
> >>>>>>>>> It was the easier catch all to use cpuid without going into
> >>>>>>>>> Linux UAPI specifics. But it doesn't have to tie in there, it is only
> >>>>>>>>> for systems with an IOMMU present.
> >>>>>>>>>  
> >>>>>>>>>> Also, can't we tie this to whether the AMD IOMMU is present?
> >>>>>>>>>>  
> >>>>>>>>> I think so, I can add that. Something like a amd_iommu_exists() helper
> >>>>>>>>> in util/vfio-helpers.c which checks if there's any sysfs child entries
> >>>>>>>>> that start with ivhd in /sys/class/iommu/. Given that this HT region is
> >>>>>>>>> hardcoded in iommu reserved regions since >=4.11 (to latest) I don't think it's
> >>>>>>>>> even worth checking the range exists in:
> >>>>>>>>>
> >>>>>>>>> 	/sys/kernel/iommu_groups/0/reserved_regions
> >>>>>>>>>
> >>>>>>>>> (Also that sysfs ABI is >= 4.11 only)  
> >>>>>>>>
> >>>>>>>> Here's what I have staged in local tree, to address your comment.
> >>>>>>>>
> >>>>>>>> Naturally the first chunk is what's affected by this patch the rest is a
> >>>>>>>> precedessor patch to introduce qemu_amd_iommu_is_present(). Seems to pass
> >>>>>>>> all the tests and what not.
> >>>>>>>>
> >>>>>>>> I am not entirely sure this is the right place to put such a helper, open
> >>>>>>>> to suggestions. wrt to the naming of the helper, I tried to follow the rest
> >>>>>>>> of the file's style.
> >>>>>>>>
> >>>>>>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >>>>>>>> index a9be5d33a291..2ea4430d5dcc 100644
> >>>>>>>> --- a/hw/i386/pc.c
> >>>>>>>> +++ b/hw/i386/pc.c
> >>>>>>>> @@ -868,10 +868,8 @@ static void x86_update_above_4g_mem_start(PCMachineState *pcms,
> >>>>>>>>                                            uint64_t pci_hole64_size)
> >>>>>>>>  {
> >>>>>>>>      X86MachineState *x86ms = X86_MACHINE(pcms);
> >>>>>>>> -    uint32_t eax, vendor[3];
> >>>>>>>>
> >>>>>>>> -    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
> >>>>>>>> -    if (!IS_AMD_VENDOR(vendor)) {
> >>>>>>>> +    if (!qemu_amd_iommu_is_present()) {
> >>>>>>>>          return;
> >>>>>>>>      }
> >>>>>>>>
> >>>>>>>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> >>>>>>>> index 7bcce3bceb0f..eb4ea071ecec 100644
> >>>>>>>> --- a/include/qemu/osdep.h
> >>>>>>>> +++ b/include/qemu/osdep.h
> >>>>>>>> @@ -637,6 +637,15 @@ char *qemu_get_host_name(Error **errp);
> >>>>>>>>   */
> >>>>>>>>  size_t qemu_get_host_physmem(void);
> >>>>>>>>
> >>>>>>>> +/**
> >>>>>>>> + * qemu_amd_iommu_is_present:
> >>>>>>>> + *
> >>>>>>>> + * Operating system agnostic way of querying if an AMD IOMMU
> >>>>>>>> + * is present.
> >>>>>>>> + *
> >>>>>>>> + */
> >>>>>>>> +bool qemu_amd_iommu_is_present(void);
> >>>>>>>> +
> >>>>>>>>  /*
> >>>>>>>>   * Toggle write/execute on the pages marked MAP_JIT
> >>>>>>>>   * for the current thread.
> >>>>>>>> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> >>>>>>>> index f2be7321c59f..54cef21217c4 100644
> >>>>>>>> --- a/util/oslib-posix.c
> >>>>>>>> +++ b/util/oslib-posix.c
> >>>>>>>> @@ -982,3 +982,32 @@ size_t qemu_get_host_physmem(void)
> >>>>>>>>  #endif
> >>>>>>>>      return 0;
> >>>>>>>>  }
> >>>>>>>> +
> >>>>>>>> +bool qemu_amd_iommu_is_present(void)
> >>>>>>>> +{
> >>>>>>>> +    bool found = false;
> >>>>>>>> +#ifdef CONFIG_LINUX
> >>>>>>>> +    struct dirent *entry;
> >>>>>>>> +    char *path;
> >>>>>>>> +    DIR *dir;
> >>>>>>>> +
> >>>>>>>> +    path = g_strdup_printf("/sys/class/iommu");
> >>>>>>>> +    dir = opendir(path);
> >>>>>>>> +    if (!dir) {
> >>>>>>>> +        g_free(path);
> >>>>>>>> +        return found;
> >>>>>>>> +    }
> >>>>>>>> +
> >>>>>>>> +    do {
> >>>>>>>> +            entry = readdir(dir);
> >>>>>>>> +            if (entry && !strncmp(entry->d_name, "ivhd", 4)) {
> >>>>>>>> +                found = true;
> >>>>>>>> +                break;
> >>>>>>>> +            }
> >>>>>>>> +    } while (entry);
> >>>>>>>> +
> >>>>>>>> +    g_free(path);
> >>>>>>>> +    closedir(dir);
> >>>>>>>> +#endif
> >>>>>>>> +    return found;
> >>>>>>>> +}  
> >>>>>>>
> >>>>>>> why are we checking whether an AMD IOMMU is present
> >>>>>>> on the host? 
> >>>>>>> Isn't what we care about whether it's
> >>>>>>> present in the VM? What we are reserving after all
> >>>>>>> is a range of GPAs, not actual host PA's ...
> >>>>>>>  
> >>>>>> Right.
> >>>>>>
> >>>>>> But any DMA map done by VFIO/IOMMU using those GPA ranges will fail,
> >>>>>> and so we need to not map that portion of address space entirely
> >>>>>> and use some other portion of the GPA-space. This has to
> >>>>>> do with host IOMMU which is where the DMA mapping of guest PA takes
> >>>>>> place. So, if you do not have an host IOMMU, you can't
> >>>>>> service guest DMA/PCIe services via VFIO through the host IOMMU, therefore you
> >>>>>> don't need this problem.
> >>>>>>
> >>>>>> Whether one uses a guest IOMMU or not does not affect the result,
> >>>>>> it would be more of a case of mimicking real hardware not fixing
> >>>>>> the issue of this series.  
> >>>>>
> >>>>>
> >>>>> Hmm okay ... my first reaction was to say let's put it under VFIO then.
> >>>>> And ideally move the logic reporting reserved ranges there too.
> >>>>> However, I think vdpa has the same issue too.
> >>>>> CC Jason for an opinion.  
> >>>>
> >>>> It does have the same problem.
> >>>>
> >>>> This is not specific to VFIO, it's to anything that uses the iommu.  
> >>>
> >>> Right. Most VMs don't use the host IOMMU though ;) It's unfortunate
> >>> that we don't have a global "enable-vfio" flag since vfio devices
> >>> can be hot-plugged. I think this is not the first time we wanted
> >>> something like this, right Alex?


I would very much NOT like to see such a flag ever existing.


> >>>> It's
> >>>> just that VFIO doesn't let you shoot in the foot :)
> >>>>
> >>>> vDPA would need to validate iova ranges as well to prevent mapping on
> >>>> reserved IOVAs similar to commit 9b77e5c7984 ("vfio/type1: check dma
> >>>> map request is within a valid iova range"). Now you could argue that
> >>>> it's an IOMMU core problem, maybe.
> >>>>
> >>>> But I this as a separate problem,
> >>>> because regardless of said validation, your guest provisioning
> >>>> is still going to fail for guests with >=1010G of max GPA and even if
> >>>> it doesn't fail you shouldn't be letting it DMA map those in the first
> >>>> place (e.g. you could see spurious INVALID_DEVICE_REQUEST fault events
> >>>> from IOMMU if DMA is attempted over the first megabyte of that 1T hole).  
> >>>
> >>> I wonder what's the status on a system without an IOMMU.
> >>>  
> >> In theory you should be OK. Also it's worth keeping in mind that AMD machines
> >> with >=1T have this 12G hole marked as Reserved, so even DMA at last when CPU
> >> is the initiator should be fine on worst case scenario.  
> > 
> > Not sure I understand this last sentence.
> >   
> I was trying to say that the E820 from hardware is marked as Reserved and any DMA
> from/to endpoints from kernel-supplied CPU addresses will use those reserved ranges.
> 
> >>>>> Also, some concerns
> >>>>> - I think this changes memory layout for working VMs not using VFIO.
> >>>>>   Better preserve the old layout for old machine types?
> >>>>>  
> >>>> Oh definitely, and I do that in this series. See the last commit, and
> >>>> in the past it was also a machine-property exposed to userspace.
> >>>> Otherwise I would be breaking (badly) compat/migration.
> >>>>
> >>>> I would like to emphasize that these memory layout changes are *exclusive* and
> >>>> *only* for hosts on AMD with guests memory being bigger than ~950G-~1010G.
> >>>> It's not every guest, but a fairly limited subset of big-memory guests that
> >>>> are not the norm.
> >>>>
> >>>> Albeit the phys-bits property errors might gives us a bit more trouble, so
> >>>> it might help being more conservative.
> >>>>  
> >>>>> - You mention the phys bits issue very briefly, and it's pretty
> >>>>>   concerning.  Do we maybe want to also disable the work around if phys
> >>>>>   bits is too small?   
> >>>>
> >>>> We are doing that here (well, v4), as suggested by Igor. Note that in this series
> >>>> it's a warning, but v4 I have it as an error and with the 32-bit issues that
> >>>> I found through qtest.
> >>>>
> >>>> I share the same concern as you over making this an error because of compatibility.
> >>>> Perhaps, we could go back to the previous version and turn back into a warning and
> >>>> additionally even disabling the relocation all together. Or if desired even
> >>>> depending on a machine-property to enable it.  
> >>>
> >>> I would be inclined to disable the relocation. And maybe block vfio? I'm
> >>> not 100% sure about that last one, but this can be a vfio decision to
> >>> make.
> >>>  
> >> I don't see this as a VFIO problem (VFIO is actually being a good citizen and doing the
> >> right thing :)). From my perspective this fix is also useful to vDPA (which we also care),
> >> and thus will also let us avoid DMA mapping in these GPA ranges.
> >>
> >> The reason I mention VFIO in cover letter is that it's one visible UAPI change that
> >> users will notice that suddenly their 1TB+ VMs break.  
> > 
> > What I mean is that most VMs don't use either VFIO or VDPA.
> > If we had VFIO,VDPA as an accelerator that needs to be listed
> > upfront when qemu is started, we could solve this with
> > a bit less risk by not changing anything for VMs without these two.
> >   
> That wouldn't work for the vfio/vdpa hotplug case (which we do use),
> and part of the reason I picked to always avoid the 1TB hole. VFIO even tells
> you what are those allowed IOVA ranges when you create the container.
> 
> The machine property, though, could communicate /the intent/ to add
> any VFIO or vDPA devices in the future and maybe cover for that. That
> let's one avoid any 'accelerator-only' problems and restrict the issues
> of this series to VMs with VFIO/VDPA if the risk is a concern.
> 
> > Alex what do you think about adding this?
> > 
> > Given we do not have such a thing right now, one can get
> > into a situation where phys bits limit CPU, then
> > more memory is supplied than would fit above reserved region, then
> > we stick the memory over the reserved region, and finally
> > then vfio device is added.
> >   
> The current code considers the maximum possible address considering
> memory hotplug, PCI hole64 and etc. So we would need to worry about
> whether VFIO or VDPA is going to be hotplugged at some point in the
> future during guest lifecycle, do decide to alter the memory layout
> at guest provisioning.
> 
> > In this last configuration, should vfio device add fail?
> > Or just warn and try to continue? I think we can code this last
> > decision as part of vfio code and then Alex will get to decide ;)
> > And yes, a similar thing with vdpa.
> >   
> 
> Of all those cases I would feel the machine-property is better,
> and more flexible than having VFIO/VDPA deal with a bad memory-layout and
> discovering late stage that the user is doing something wrong (and thus
> fail the DMA_MAP operation for those who do check invalid iovas)

The trouble is that anything we can glean from the host system where we
instantiate the VM is mostly meaningless relative to data center
orchestration.  We're relatively insulated from these sorts of issues
on x86 (apparently aside from this case), AIUI ARM is even worse about
having arbitrary reserved ranges within their IOVA space.

For a comprehensive solution, it's not a machine accelerator property
or enable such-and-such functionality flag, it's the ability to specify
a VM memory map on the QEMU command line and data center orchestration
tools gaining insight across all their systems to specify a memory
layout that can work regardless of how a VM might be migrated.  Maybe
there's a "host" option to that memory map command line option that
would take into account the common case of a static host or at least
homogeneous set of hosts.  Overall, it's not unlike specifying CPU flags
to generate a least common denominator set such that the VM is
compatible to any host in the cluster.

On the device end, I really would prefer not to see device driver
specific enables and we simply cannot hot-add a device of the given
type without a pre-enabled VM.  Give the user visibility and
configurability to the issue and simply fail the device add (ideally
with a useful error message) if the device IOVA space cannot support
the VM memory layout (this is what vfio already does afaik).

When we have iommufd support common for vfio and vdpa, hopefully we'll
also be able to recommend a common means for learning about system and
IOMMU restrictions to IOVA spaces.  For now we have reserved_regions
reported in sysfs per IOMMU group:

 $ grep -h . /sys/kernel/iommu_groups/*/reserved_regions | sort -u | grep -v direct-relaxable

Thanks,

Alex


