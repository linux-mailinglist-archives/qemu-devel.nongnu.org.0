Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29B6454CD4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 19:11:07 +0100 (CET)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnPOk-0003vS-FD
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 13:11:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mnPMW-0002hz-TU
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 13:08:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mnPMT-0004wm-BY
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 13:08:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637172513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YbJ+LS1HSRNOeIco5WxypoebZCT55o/yHh6/ZBbxr3I=;
 b=f6dQ5dXXd9mAnlUc3X2+krs48eJ08Xn8zEDVoVG2QQ7xeI6bapII+RpeSFvNCNQa3c53Iu
 rPLjBen8gsi5N8A4KsIlYteVbJzlW1WQnQOo4CIGWEfJcJWN6lG0Wq/f6NCxnMfsBLW6Ch
 x8ChWwNolEGD1zQb2TFHe260ToYrPv8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-s_DFYMw5O_S-Od_TRYVTmQ-1; Wed, 17 Nov 2021 13:08:31 -0500
X-MC-Unique: s_DFYMw5O_S-Od_TRYVTmQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r129-20020a1c4487000000b00333629ed22dso3169151wma.6
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 10:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=YbJ+LS1HSRNOeIco5WxypoebZCT55o/yHh6/ZBbxr3I=;
 b=pblWk5p1DwOgPufzUBEu5sDNa0DHLsWFPzejFHCYYa4qztGa97uVDnqqNe22WlmPMV
 LFHhcTYl1FEH9Gl4WsifpEbb0VTUdNMuAhjkt9FgVp7qDymKV8GzvcvNSOl+VIqgQvbo
 g03mHgQ/u7sE3usf2LFdVpG1OSBRLikH+P9Vpeo2gmWMZs2OYzK2TBO742KetqYNITSr
 uUXTZCNQxJTicRYnuuc9ErXDnIv0ifVCMGhIMJ4hYQWXEFvmL5PrSTXxc8nAp8IQZevE
 e+6luC7rRDMr2/y3DBwe36kpwfCsiGr4hOX5oMxyB5d6gwEEDFIHxCYhH0DNlFuhcB7L
 ddrw==
X-Gm-Message-State: AOAM530Gai8rHTXBHbbH8/ArdmTISbpIGauRPfgDzBr2dwAEbngJ6q+b
 euFY3uIak8xTUJwGvDqW5ScBO1kEJrqWRxXb4VgEIIDguGtmUVlSp5sfzXpBye34qRsh02xDCXM
 O+OkgUTE/m/zKkyU=
X-Received: by 2002:a5d:550f:: with SMTP id b15mr21384353wrv.212.1637172510132; 
 Wed, 17 Nov 2021 10:08:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuAXAKBSswVNfClBUyUeRpzqaCYaemkwpeWyGC0r9CGpfUuI65bWllIZlawfrH/Rc6A3POzA==
X-Received: by 2002:a5d:550f:: with SMTP id b15mr21384285wrv.212.1637172509697; 
 Wed, 17 Nov 2021 10:08:29 -0800 (PST)
Received: from [192.168.3.132] (p5b0c6882.dip0.t-ipconnect.de. [91.12.104.130])
 by smtp.gmail.com with ESMTPSA id o3sm7300652wms.10.2021.11.17.10.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 10:08:29 -0800 (PST)
Message-ID: <8576e0e8-aa06-1c05-9849-806c2bce4141@redhat.com>
Date: Wed, 17 Nov 2021 19:08:28 +0100
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
In-Reply-To: <20211117143015.00002e0a@Huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 17.11.21 15:30, Jonathan Cameron wrote:
> On Tue, 16 Nov 2021 12:11:29 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>>>>
>>>> Examples include exposing HBM or PMEM to the VM. Just like on real HW,
>>>> this memory is exposed via cpu-less, special nodes. In contrast to real
>>>> HW, the memory is hotplugged later (I don't think HW supports hotplug
>>>> like that yet, but it might just be a matter of time).  
>>>
>>> I suppose some of that maybe covered by GENERIC_AFFINITY entries in SRAT
>>> some by MEMORY entries. Or nodes created dynamically like with normal
>>> hotplug memory.
>>>   
> 

Hi Jonathan,

> The naming of the define is unhelpful.  GENERIC_AFFINITY here corresponds
> to Generic Initiator Affinity.  So no good for memory. This is meant for
> representation of accelerators / network cards etc so you can get the NUMA
> characteristics for them accessing Memory in other nodes.
> 
> My understanding of 'traditional' memory hotplug is that typically the
> PA into which memory is hotplugged is known at boot time whether or not
> the memory is physically present.  As such, you present that in SRAT and rely
> on the EFI memory map / other information sources to know the memory isn't
> there.  When it is hotplugged later the address is looked up in SRAT to identify
> the NUMA node.

in virtualized environments we use the SRAT only to indicate the hotpluggable
region (-> indicate maximum possible PFN to the guest OS), the actual present
memory+PXM assignment is not done via SRAT. We differ quite a lot here from
actual hardware I think.

> 
> That model is less useful for more flexible entities like virtio-mem or
> indeed physical hardware such as CXL type 3 memory devices which typically
> need their own nodes.
> 
> For the CXL type 3 option, currently proposal is to use the CXL table entries
> representing Physical Address space regions to work out how many NUMA nodes
> are needed and just create extra ones at boot.
> https://lore.kernel.org/linux-cxl/163553711933.2509508.2203471175679990.stgit@dwillia2-desk3.amr.corp.intel.com
> 
> It's a heuristic as we might need more nodes to represent things well kernel
> side, but it's better than nothing and less effort that true dynamic node creation.
> If you chase through the earlier versions of Alison's patch you will find some
> discussion of that.
> 
> I wonder if virtio-mem should just grow a CDAT instance via a DOE?
> 
> That would make all this stuff discoverable via PCI config space rather than ACPI
> CDAT is at:
> https://uefi.org/sites/default/files/resources/Coherent%20Device%20Attribute%20Table_1.01.pdf
> but the table access protocol over PCI DOE is currently in the CXL 2.0 spec
> (nothing stops others using it though AFAIK).
> 
> However, then we'd actually need either dynamic node creation in the OS, or
> some sort of reserved pool of extra nodes.  Long term it may be the most
> flexible option.


I think for virtio-mem it's actually a bit simpler:

a) The user defined on the QEMU cmdline an empty node
b) The user assigned a virtio-mem device to a node, either when 
   coldplugging or hotplugging the device.

So we don't actually "hotplug" a new node, the (possible) node is already known
to QEMU right when starting up. It's just a matter of exposing that fact to the
guest OS -- similar to how we expose the maximum possible PFN to the guest OS.
It's seems to boild down to an ACPI limitation.

Conceptually, virtio-mem on an empty node in QEMU is not that different from
hot/coldplugging a CPU to an empty node or hot/coldplugging a DIMM/NVDIMM to
an empty node. But I guess it all just doesn't work with QEMU as of now.


In current x86-64 code, we define the "hotpluggable region" in hw/i386/acpi-build.c via

	build_srat_memory(table_data, machine->device_memory->base,
			  hotpluggable_address_space_size, nb_numa_nodes - 1,
			  MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);

So we tell the guest OS "this range is hotpluggable" and "it contains to
this node unless the device says something different". From both values we
can -- when under QEMU -- conclude the maximum possible PFN and the maximum
possible node. But the latter is not what Linux does: it simply maps the last
numa node (indicated in the memory entry) to a PXM
(-> drivers/acpi/numa/srat.c:acpi_numa_memory_affinity_init()).


I do wonder if we could simply expose the same hotpluggable range via multiple nodes:

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a3ad6abd33..6c0ab442ea 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2084,6 +2084,22 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
      * providing _PXM method if necessary.
      */
     if (hotpluggable_address_space_size) {
+        /*
+         * For the guest to "know" about possible nodes, we'll indicate the
+         * same hotpluggable region to all empty nodes.
+         */
+        for (i = 0; i < nb_numa_nodes - 1; i++) {
+            if (machine->numa_state->nodes[i].node_mem > 0) {
+                continue;
+            }
+            build_srat_memory(table_data, machine->device_memory->base,
+                              hotpluggable_address_space_size, i,
+                              MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
+        }
+        /*
+         * Historically, we always indicated all hotpluggable memory to the
+         * last node -- if it was empty or not.
+         */
         build_srat_memory(table_data, machine->device_memory->base,
                           hotpluggable_address_space_size, nb_numa_nodes - 1,
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);


Of course, this won't make CPU hotplug to empty nodes happy if we don't have
mempory hotplug enabled for a VM. I did not check in detail if that is valid
according to ACPI -- Linux might eat it (did not try yet, though).


-- 
Thanks,

David / dhildenb


