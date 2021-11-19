Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60158456E4D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 12:36:34 +0100 (CET)
Received: from localhost ([::1]:40474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo2C1-0001eA-7o
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 06:36:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mo29C-000813-Vg
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 06:33:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mo29A-000649-CG
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 06:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637321615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwciPD5UiGsKX6xORlSa6e928CleUwxw1f3iMdWmRec=;
 b=TCP7SLot+qyXJuVV3zrBp8gCNtRXM2Wy/pyhdy9DvEvJ8jt2853gx1su6kt7QTrw9+h1YB
 ucPALvkvBWQlZoY+LulxFnzYlNIGfrw65LOSMBBVZF8910UpUcYiACzSrwumUVNoPGUK2J
 fr71IAV3vxjErQ85d1mB6lDwfJ4WGLs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-nFOrY7JgO_On9KDtbnD1_A-1; Fri, 19 Nov 2021 06:33:30 -0500
X-MC-Unique: nFOrY7JgO_On9KDtbnD1_A-1
Received: by mail-wm1-f70.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so5759538wma.5
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 03:33:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=ZwciPD5UiGsKX6xORlSa6e928CleUwxw1f3iMdWmRec=;
 b=rRowXVlFpCv/u3TK/CIkLJRm0W/mZXL00mop3WyjE+Be8WVsplPbtj03oDUCHqSn9f
 ZyJSESh1U3ktPjzsGj+jA5U6xEr0M8ZAqkSLoT0c8nGAv9WWJpTYf6QWMmN5s9AgJjLK
 gBSz1rg4QSszCA6bMQBNP9JdHHlAYETpXKx84xcs32WKRt28Hhgg5wkWKKl55aYEeKDW
 zDuDNhiU12YC3AsnInFbqiRd49deNABAYvoFeiuCOOGlOLJOwdw3qj8ykh8q8yqhnc9k
 ZQ72F2xNZiqjsy2+xIKUS91mNbgz88Q1TNpf35cmbEc1ga3xwwV17IG1dmOuGp8L3dbE
 TzHQ==
X-Gm-Message-State: AOAM530jhevPnWfKq+9eFB0Ljq4YybX9zxsTYn6QdncYmOs3f1BWXnEx
 QxJ8/aa7T2Fg2OuAqPmiqXZ4lPE9pe1FiPupRk8MX1rDJpcXQ8MrQJPGPQfHduiibf4ve1+SBmc
 +BxarYHBrQ5wKh6U=
X-Received: by 2002:adf:e38d:: with SMTP id e13mr6463965wrm.402.1637321609490; 
 Fri, 19 Nov 2021 03:33:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIAt2VmdNhdD0JE7I/OcMUHmEmc/CnUvw4QqvV+llLnvrZtgYk959x4UykWEnfg4O4n6wgdw==
X-Received: by 2002:adf:e38d:: with SMTP id e13mr6463908wrm.402.1637321609137; 
 Fri, 19 Nov 2021 03:33:29 -0800 (PST)
Received: from [192.168.3.132] (p5b0c6271.dip0.t-ipconnect.de. [91.12.98.113])
 by smtp.gmail.com with ESMTPSA id
 j40sm3029189wms.16.2021.11.19.03.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 03:33:28 -0800 (PST)
Message-ID: <33b10c1b-46c2-3107-ddad-ca532b2c40e4@redhat.com>
Date: Fri, 19 Nov 2021 12:33:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
References: <20211027052958.280741-1-gshan@redhat.com>
 <20211027174028.1f16fcfb@redhat.com>
 <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
 <20211101094431.71e1a50a@redhat.com>
 <47dc3a95-ed77-6c0e-d024-27cb22c338eb@redhat.com>
 <20211102073948.am3p3hcqqd3cfvru@gator.home>
 <b8ed4687-e30a-d70f-0816-bd8ba490ceb7@redhat.com>
 <20211110113304.2d713d4a@redhat.com>
 <5180ecee-62e2-cd6f-d595-c7c29eff6039@redhat.com>
 <20211112142751.4807ab50@redhat.com>
 <188faab7-1e57-2bc1-846f-9457433c2f9d@redhat.com>
 <20211117143015.00002e0a@Huawei.com>
 <8576e0e8-aa06-1c05-9849-806c2bce4141@redhat.com>
 <20211118102837.00002069@Huawei.com>
 <655c65af-fd7a-8007-37b3-a56c60a0ec5b@redhat.com>
 <20211118112306.00004b55@Huawei.com> <20211119105851.0000594a@Huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
In-Reply-To: <20211119105851.0000594a@Huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 Gavin Shan <gshan@redhat.com>, ehabkost@redhat.com,
 richard.henderson@linaro.org, alison.schofield@intel.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 kangkang.shen@futurewei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.11.21 11:58, Jonathan Cameron wrote:
> On Thu, 18 Nov 2021 11:23:06 +0000
> Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:
> 
>> On Thu, 18 Nov 2021 12:06:27 +0100
>> David Hildenbrand <david@redhat.com> wrote:
>>
>>> On 18.11.21 11:28, Jonathan Cameron wrote:  
>>>> On Wed, 17 Nov 2021 19:08:28 +0100
>>>> David Hildenbrand <david@redhat.com> wrote:
>>>>     
>>>>> On 17.11.21 15:30, Jonathan Cameron wrote:    
>>>>>> On Tue, 16 Nov 2021 12:11:29 +0100
>>>>>> David Hildenbrand <david@redhat.com> wrote:
>>>>>>       
>>>>>>>>>
>>>>>>>>> Examples include exposing HBM or PMEM to the VM. Just like on real HW,
>>>>>>>>> this memory is exposed via cpu-less, special nodes. In contrast to real
>>>>>>>>> HW, the memory is hotplugged later (I don't think HW supports hotplug
>>>>>>>>> like that yet, but it might just be a matter of time).        
>>>>>>>>
>>>>>>>> I suppose some of that maybe covered by GENERIC_AFFINITY entries in SRAT
>>>>>>>> some by MEMORY entries. Or nodes created dynamically like with normal
>>>>>>>> hotplug memory.
>>>>>>>>         
>>>>>>       
>>>>>
>>>>> Hi Jonathan,
>>>>>    
>>>>>> The naming of the define is unhelpful.  GENERIC_AFFINITY here corresponds
>>>>>> to Generic Initiator Affinity.  So no good for memory. This is meant for
>>>>>> representation of accelerators / network cards etc so you can get the NUMA
>>>>>> characteristics for them accessing Memory in other nodes.
>>>>>>
>>>>>> My understanding of 'traditional' memory hotplug is that typically the
>>>>>> PA into which memory is hotplugged is known at boot time whether or not
>>>>>> the memory is physically present.  As such, you present that in SRAT and rely
>>>>>> on the EFI memory map / other information sources to know the memory isn't
>>>>>> there.  When it is hotplugged later the address is looked up in SRAT to identify
>>>>>> the NUMA node.      
>>>>>
>>>>> in virtualized environments we use the SRAT only to indicate the hotpluggable
>>>>> region (-> indicate maximum possible PFN to the guest OS), the actual present
>>>>> memory+PXM assignment is not done via SRAT. We differ quite a lot here from
>>>>> actual hardware I think.
>>>>>    
>>>>>>
>>>>>> That model is less useful for more flexible entities like virtio-mem or
>>>>>> indeed physical hardware such as CXL type 3 memory devices which typically
>>>>>> need their own nodes.
>>>>>>
>>>>>> For the CXL type 3 option, currently proposal is to use the CXL table entries
>>>>>> representing Physical Address space regions to work out how many NUMA nodes
>>>>>> are needed and just create extra ones at boot.
>>>>>> https://lore.kernel.org/linux-cxl/163553711933.2509508.2203471175679990.stgit@dwillia2-desk3.amr.corp.intel.com
>>>>>>
>>>>>> It's a heuristic as we might need more nodes to represent things well kernel
>>>>>> side, but it's better than nothing and less effort that true dynamic node creation.
>>>>>> If you chase through the earlier versions of Alison's patch you will find some
>>>>>> discussion of that.
>>>>>>
>>>>>> I wonder if virtio-mem should just grow a CDAT instance via a DOE?
>>>>>>
>>>>>> That would make all this stuff discoverable via PCI config space rather than ACPI
>>>>>> CDAT is at:
>>>>>> https://uefi.org/sites/default/files/resources/Coherent%20Device%20Attribute%20Table_1.01.pdf
>>>>>> but the table access protocol over PCI DOE is currently in the CXL 2.0 spec
>>>>>> (nothing stops others using it though AFAIK).
>>>>>>
>>>>>> However, then we'd actually need either dynamic node creation in the OS, or
>>>>>> some sort of reserved pool of extra nodes.  Long term it may be the most
>>>>>> flexible option.      
>>>>>
>>>>>
>>>>> I think for virtio-mem it's actually a bit simpler:
>>>>>
>>>>> a) The user defined on the QEMU cmdline an empty node
>>>>> b) The user assigned a virtio-mem device to a node, either when 
>>>>>    coldplugging or hotplugging the device.
>>>>>
>>>>> So we don't actually "hotplug" a new node, the (possible) node is already known
>>>>> to QEMU right when starting up. It's just a matter of exposing that fact to the
>>>>> guest OS -- similar to how we expose the maximum possible PFN to the guest OS.
>>>>> It's seems to boild down to an ACPI limitation.
>>>>>
>>>>> Conceptually, virtio-mem on an empty node in QEMU is not that different from
>>>>> hot/coldplugging a CPU to an empty node or hot/coldplugging a DIMM/NVDIMM to
>>>>> an empty node. But I guess it all just doesn't work with QEMU as of now.    
>>>>
>>>> A side distraction perhaps, but there is a code first acpi proposal to add
>>>> a 'softer' form of CPU hotplug 
>>>> https://bugzilla.tianocore.org/show_bug.cgi?id=3706
>>>>
>>>> Whilst the reason for that proposal was for arm64 systems where there is no architected
>>>> physical hotplug, it might partly solve the empty node question for CPUs.  They won't
>>>> be empty, there will simply be CPUs that are marked as 'Online capable'.
>>>>     
>>>>>
>>>>> In current x86-64 code, we define the "hotpluggable region" in hw/i386/acpi-build.c via
>>>>>
>>>>> 	build_srat_memory(table_data, machine->device_memory->base,
>>>>> 			  hotpluggable_address_space_size, nb_numa_nodes - 1,
>>>>> 			  MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
>>>>>
>>>>> So we tell the guest OS "this range is hotpluggable" and "it contains to
>>>>> this node unless the device says something different". From both values we
>>>>> can -- when under QEMU -- conclude the maximum possible PFN and the maximum
>>>>> possible node. But the latter is not what Linux does: it simply maps the last
>>>>> numa node (indicated in the memory entry) to a PXM
>>>>> (-> drivers/acpi/numa/srat.c:acpi_numa_memory_affinity_init()).    
>>>> yeah.  There is nothing in ACPI that says there can't be holes in the node numbering
>>>> so Linux does a remapping as you point out.
>>>>     
>>>>>
>>>>>
>>>>> I do wonder if we could simply expose the same hotpluggable range via multiple nodes:    
>>>>
>>>> Fairly sure the answer to this is no.  You'd have to indicate different ranges and
>>>> then put the virtio-mem in the right one.     
>>>
>>> And I repeat, this is in no way different to DIMMs/NVDIMMs. We cannot predict
>>> the future when hotplugging DIMMS/NVDIMMs/virtio-mem/... to some node later. We only
>>> have access to that information when coldplugging devices, but even a
>>> hotunplug+hotplug can change that info. Whatever we expose via ACPI is moot
>>> already and just a hint to the guest OS "maximum possible PFN".  
>>
>> Sure, so the solution is a large non overlapping extra node for each node on the
>> underlying physical system.  It uses a lot of PA space, but I'm going to assume
>> the system isn't so big that that PA space exhaustion is a problem?  For a sensible setup
>> those node would match the actual memory present on the underlying system.
>>
>> For physical CCIX systems we did this with SRAT entries with XTB per node to match
>> what the host supported.  On our particular platform those PA ranges were well separated
>> from each other due to how the system routing worked, but the principal is the same.
>> Those supported a huge amount of memory being hotplugged.
>>
>>>
>>> We've been abusing ACPI hotpluggable region for years for virt DIMM hotplug,
>>> putting it to some fantasy node and having it just work with hotplug of
>>> DIMMs/NVDIMMs. The only issue we have is empty nodes. We differ from real
>>> HW already significantly (especially, never exposing DIMMs via e820 to
>>> the guest, which I call a feature and not a bug).  
>>
>> Understood.
>>>   
>>>> Now I can't actually find anywhere in the
>>>> ACPI spec that says that but I'm 99% sure Linux won't like and I'm fairly sure if we
>>>> query it with ACPI folks the answer will be a no you can't don't that.    
>>>
>>> I didn't find anything that contradicts it in the spec as well. It's not really
>>> specified what's allowed and what's not :)
>>>
>>> FWIW, the code I shared works with 5.11.12-300.fc34.x86_64 inside the guest flawlessly.  
>>
>> Hmm. I'm surprised that works at all and my worry is there is no reason it will continue
>> to work.
> 
> I've checked with some of our firmware people and the response was very much against doing this
> on the basis it makes no sense in any physical system to have overlapping regions.
> 
> I'll reach out to our ASWG representatives to see if we can get the ACPI spec clarified.
> (Given question is from a public mailing list this should be under the code first policy).
> 
> My view is that a clarification should be added to state that these regions must not overlap.

I'd really appreciate if we could instead have something that makes virt
happy as well ("makes no sense in any physical system"), because virt is
most probably the biggest actual consumer of ACPI memory hotplug out
there (!).

I mean, for virt as is we will never know which PA range will belong to
which node upfront. All we know is that there is a PA range that could
belong to node X-Z. Gluing a single range to a single node doesn't make
too much sense for virt, which is why we have just been using it to
indicate the maximum possible PFN with a fantasy node.

Overlapping regions would really simplify the whole thing, and I think
if we go down that path we should go one step further and indicate the
hotpluggable region to all nodes that might see hotplug (QEMU -> all
nodes). The ACPI clarification would then be that we can have
overlapping ranges and that on overlapping ranges all indicated nodes
would be a possible target later. That would make perfect sense to me
and make both phys and virt happy.



Two ways to avoid overlapping regions, which aren't much better:

1) Split the hotpluggable region up into fantasy regions and assign one
fantasy region to each actual node.

The fantasy regions will have nothing to do with reality late (just like
what we have right now with the last node getting assigned the whole
hotpluggable region) and devices might overlap, but we don't really
care, because the devices expose the actual node themselves.


2) Duplicate the hotpluggable region accross all nodes

We would have one hotpluggable region with a dedicate PA space, and
hotplug the device into the respective node PA space.

That can be problematic, though, as we can easily run out of PA space.
For example, my Ryzen 9 cannot address anything above 1 TiB. So if we'd
have a hotpluggable region of 256 GiB, we'll already be in trouble with
more than 3 nodes.

-- 
Thanks,

David / dhildenb


