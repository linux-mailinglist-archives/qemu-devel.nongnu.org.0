Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D499B4559B4
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 12:09:52 +0100 (CET)
Received: from localhost ([::1]:43522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnfId-00082U-DT
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 06:09:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mnfFZ-0004o7-Ge
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:06:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mnfFV-0001iu-5d
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637233593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAI2M8NZlc8hgjyUOxGfmqByiVRgk4Xhp1LF6R2ExZo=;
 b=E3yqvzC9xg4D9Wkhm62cgAal/7NWIDKiwVjOKguYTMDhfy7Wy2viF0Tm8l7Wc3AAh+7Gn5
 5xIbUuc9D5biN4EYeWEPnRIsIi/v/BQPjxtKCA430hcFNGn/0xszpcTrdtXJchUC0HjRgq
 rIc9/ss3gfnlXGKeT/It6PzpuSdn5j0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-_pt2ib9IMLStp4zLaPo2kQ-1; Thu, 18 Nov 2021 06:06:30 -0500
X-MC-Unique: _pt2ib9IMLStp4zLaPo2kQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o10-20020a05600c4fca00b0033312e1ed8bso2944443wmq.2
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 03:06:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=CAI2M8NZlc8hgjyUOxGfmqByiVRgk4Xhp1LF6R2ExZo=;
 b=YD2sr4sp+T4tuQxKqkbmC9K9zLpdP44p+gELSI5nmbeROtmZ97V7+6W14N8yk0ierH
 yNLWhLeh6MSlfcO+pzD7jPjMMrzurZ+b/GJ2KrO1oYxGjmNVhNbGSZXmzcz1HT2CdUBa
 d4bFWA1SHU2K2TnP9m/QyWWGqoOEqnOzt3tF1v19Mbry/FjKLkQVjT04Br4D5K7D0Rkx
 qtNKBfIRNxzcDHPW2BBpg2ZrvyOCgjobVkzQxf909leEwMP5gP+J7viflirSye0C+pAR
 M4euWmKeRw4xGEm39fqr1K/sfdEyMdgIq3mShZkQn56gn7r3TItW4Id10BhyG75aU/NZ
 sAgA==
X-Gm-Message-State: AOAM530CZxCY//5DIn+B4v9Xr8G68gNhKVYF1s9eVU2MFLpsAT3AwjEw
 2j0tKLRPPiAR7UCs+OlwFqFKKXaw0W9zTd1IDEfC2nXM8suocNPtyibon2QeD/RoHjet8ndLIfS
 Kg+LCifIq7oBlfL0=
X-Received: by 2002:a1c:9d13:: with SMTP id g19mr9080767wme.41.1637233589053; 
 Thu, 18 Nov 2021 03:06:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+VhQvIrQbyLT2pbAClsf2NGWAQ7re7WfgxYQCbEndVixb5rU4cZXC70MsTS+9h6T3oJx/Vw==
X-Received: by 2002:a1c:9d13:: with SMTP id g19mr9080704wme.41.1637233588667; 
 Thu, 18 Nov 2021 03:06:28 -0800 (PST)
Received: from [192.168.3.132] (p5b0c62b7.dip0.t-ipconnect.de. [91.12.98.183])
 by smtp.gmail.com with ESMTPSA id
 y6sm2923269wrh.18.2021.11.18.03.06.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 03:06:28 -0800 (PST)
Message-ID: <655c65af-fd7a-8007-37b3-a56c60a0ec5b@redhat.com>
Date: Thu, 18 Nov 2021 12:06:27 +0100
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
In-Reply-To: <20211118102837.00002069@Huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.11.21 11:28, Jonathan Cameron wrote:
> On Wed, 17 Nov 2021 19:08:28 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>> On 17.11.21 15:30, Jonathan Cameron wrote:
>>> On Tue, 16 Nov 2021 12:11:29 +0100
>>> David Hildenbrand <david@redhat.com> wrote:
>>>   
>>>>>>
>>>>>> Examples include exposing HBM or PMEM to the VM. Just like on real HW,
>>>>>> this memory is exposed via cpu-less, special nodes. In contrast to real
>>>>>> HW, the memory is hotplugged later (I don't think HW supports hotplug
>>>>>> like that yet, but it might just be a matter of time).    
>>>>>
>>>>> I suppose some of that maybe covered by GENERIC_AFFINITY entries in SRAT
>>>>> some by MEMORY entries. Or nodes created dynamically like with normal
>>>>> hotplug memory.
>>>>>     
>>>   
>>
>> Hi Jonathan,
>>
>>> The naming of the define is unhelpful.  GENERIC_AFFINITY here corresponds
>>> to Generic Initiator Affinity.  So no good for memory. This is meant for
>>> representation of accelerators / network cards etc so you can get the NUMA
>>> characteristics for them accessing Memory in other nodes.
>>>
>>> My understanding of 'traditional' memory hotplug is that typically the
>>> PA into which memory is hotplugged is known at boot time whether or not
>>> the memory is physically present.  As such, you present that in SRAT and rely
>>> on the EFI memory map / other information sources to know the memory isn't
>>> there.  When it is hotplugged later the address is looked up in SRAT to identify
>>> the NUMA node.  
>>
>> in virtualized environments we use the SRAT only to indicate the hotpluggable
>> region (-> indicate maximum possible PFN to the guest OS), the actual present
>> memory+PXM assignment is not done via SRAT. We differ quite a lot here from
>> actual hardware I think.
>>
>>>
>>> That model is less useful for more flexible entities like virtio-mem or
>>> indeed physical hardware such as CXL type 3 memory devices which typically
>>> need their own nodes.
>>>
>>> For the CXL type 3 option, currently proposal is to use the CXL table entries
>>> representing Physical Address space regions to work out how many NUMA nodes
>>> are needed and just create extra ones at boot.
>>> https://lore.kernel.org/linux-cxl/163553711933.2509508.2203471175679990.stgit@dwillia2-desk3.amr.corp.intel.com
>>>
>>> It's a heuristic as we might need more nodes to represent things well kernel
>>> side, but it's better than nothing and less effort that true dynamic node creation.
>>> If you chase through the earlier versions of Alison's patch you will find some
>>> discussion of that.
>>>
>>> I wonder if virtio-mem should just grow a CDAT instance via a DOE?
>>>
>>> That would make all this stuff discoverable via PCI config space rather than ACPI
>>> CDAT is at:
>>> https://uefi.org/sites/default/files/resources/Coherent%20Device%20Attribute%20Table_1.01.pdf
>>> but the table access protocol over PCI DOE is currently in the CXL 2.0 spec
>>> (nothing stops others using it though AFAIK).
>>>
>>> However, then we'd actually need either dynamic node creation in the OS, or
>>> some sort of reserved pool of extra nodes.  Long term it may be the most
>>> flexible option.  
>>
>>
>> I think for virtio-mem it's actually a bit simpler:
>>
>> a) The user defined on the QEMU cmdline an empty node
>> b) The user assigned a virtio-mem device to a node, either when 
>>    coldplugging or hotplugging the device.
>>
>> So we don't actually "hotplug" a new node, the (possible) node is already known
>> to QEMU right when starting up. It's just a matter of exposing that fact to the
>> guest OS -- similar to how we expose the maximum possible PFN to the guest OS.
>> It's seems to boild down to an ACPI limitation.
>>
>> Conceptually, virtio-mem on an empty node in QEMU is not that different from
>> hot/coldplugging a CPU to an empty node or hot/coldplugging a DIMM/NVDIMM to
>> an empty node. But I guess it all just doesn't work with QEMU as of now.
> 
> A side distraction perhaps, but there is a code first acpi proposal to add
> a 'softer' form of CPU hotplug 
> https://bugzilla.tianocore.org/show_bug.cgi?id=3706
> 
> Whilst the reason for that proposal was for arm64 systems where there is no architected
> physical hotplug, it might partly solve the empty node question for CPUs.  They won't
> be empty, there will simply be CPUs that are marked as 'Online capable'.
> 
>>
>> In current x86-64 code, we define the "hotpluggable region" in hw/i386/acpi-build.c via
>>
>> 	build_srat_memory(table_data, machine->device_memory->base,
>> 			  hotpluggable_address_space_size, nb_numa_nodes - 1,
>> 			  MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
>>
>> So we tell the guest OS "this range is hotpluggable" and "it contains to
>> this node unless the device says something different". From both values we
>> can -- when under QEMU -- conclude the maximum possible PFN and the maximum
>> possible node. But the latter is not what Linux does: it simply maps the last
>> numa node (indicated in the memory entry) to a PXM
>> (-> drivers/acpi/numa/srat.c:acpi_numa_memory_affinity_init()).
> yeah.  There is nothing in ACPI that says there can't be holes in the node numbering
> so Linux does a remapping as you point out.
> 
>>
>>
>> I do wonder if we could simply expose the same hotpluggable range via multiple nodes:
> 
> Fairly sure the answer to this is no.  You'd have to indicate different ranges and
> then put the virtio-mem in the right one. 

And I repeat, this is in no way different to DIMMs/NVDIMMs. We cannot predict
the future when hotplugging DIMMS/NVDIMMs/virtio-mem/... to some node later. We only
have access to that information when coldplugging devices, but even a
hotunplug+hotplug can change that info. Whatever we expose via ACPI is moot
already and just a hint to the guest OS "maximum possible PFN".

We've been abusing ACPI hotpluggable region for years for virt DIMM hotplug,
putting it to some fantasy node and having it just work with hotplug of
DIMMs/NVDIMMs. The only issue we have is empty nodes. We differ from real
HW already significantly (especially, never exposing DIMMs via e820 to
the guest, which I call a feature and not a bug).

> Now I can't actually find anywhere in the
> ACPI spec that says that but I'm 99% sure Linux won't like and I'm fairly sure if we
> query it with ACPI folks the answer will be a no you can't don't that.

I didn't find anything that contradicts it in the spec as well. It's not really
specified what's allowed and what's not :)

FWIW, the code I shared works with 5.11.12-300.fc34.x86_64 inside the guest flawlessly.

#! /bin/bash
sudo build/qemu-system-x86_64 \
    --enable-kvm \
    -m 8G,maxmem=32G,slots=1 \
    -object memory-backend-memfd,id=mem,size=8G \
    -numa node,nodeid=0,memdev=mem,cpus=0-4 \
    -numa node,nodeid=1 -numa node,nodeid=2 \
    -numa node,nodeid=3 -numa node,nodeid=4 \
    -smp sockets=2,cores=4 \
    -nographic \
    -nodefaults \
    -net nic -net user \
    -chardev stdio,nosignal,id=serial \
    -hda Fedora-Cloud-Base-34-1.2.x86_64.qcow2 \
    -cdrom /home/dhildenb/git/cloud-init/cloud-init.iso \
    -device isa-serial,chardev=serial \
    -chardev socket,id=monitor,path=/var/tmp/mon_src,server,nowait \
    -mon chardev=monitor,mode=readline \
    -object memory-backend-memfd,id=mem0,size=8G \
    -device virtio-mem-pci,id=vmem0,memdev=mem0,node=1,requested-size=128M \
    -object memory-backend-memfd,id=mem1,size=8G \
    -device virtio-mem-pci,id=vmem1,memdev=mem1,node=2,requested-size=128M \
    -object memory-backend-memfd,id=mem2,size=8G \
    -device virtio-mem-pci,id=vmem2,memdev=mem2,node=3,requested-size=128M

[root@vm-0 ~]# dmesg | grep "ACPI: SRAT: Node"
[    0.009933] ACPI: SRAT: Node 0 PXM 0 [mem 0x00000000-0x0009ffff]
[    0.009939] ACPI: SRAT: Node 0 PXM 0 [mem 0x00100000-0xbfffffff]
[    0.009941] ACPI: SRAT: Node 0 PXM 0 [mem 0x100000000-0x23fffffff]
[    0.009942] ACPI: SRAT: Node 1 PXM 1 [mem 0x240000000-0x87fffffff] hotplug
[    0.009944] ACPI: SRAT: Node 2 PXM 2 [mem 0x240000000-0x87fffffff] hotplug
[    0.009946] ACPI: SRAT: Node 3 PXM 3 [mem 0x240000000-0x87fffffff] hotplug
[    0.009947] ACPI: SRAT: Node 4 PXM 4 [mem 0x240000000-0x87fffffff] hotplug
[root@vm-0 ~]# numactl --hardware
available: 4 nodes (0-3)
node 0 cpus: 0 1 2 3 4 5 6 7
node 0 size: 7950 MB
node 0 free: 7692 MB
node 1 cpus:
node 1 size: 128 MB
node 1 free: 123 MB
node 2 cpus:
node 2 size: 128 MB
node 2 free: 127 MB
node 3 cpus:
node 3 size: 128 MB
node 3 free: 127 MB
node distances:
node   0   1   2   3 
  0:  10  20  20  20 
  1:  20  10  20  20 
  2:  20  20  10  20 
  3:  20  20  20  10 



-- 
Thanks,

David / dhildenb


