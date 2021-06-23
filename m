Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944573B1EC1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 18:35:13 +0200 (CEST)
Received: from localhost ([::1]:45050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw5qK-0002df-7H
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 12:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lw5pG-0001vm-QX
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 12:34:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lw5pB-0004Wd-FP
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 12:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624466039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i+Fev1UTNZ7HJ+3uDYXMv2LvRWgHa6UpQIPUsDUf5nM=;
 b=OLQ0+IVN2zufAgC27HexgpwG71PM9AdRnauviX3dZjostrRGMSaXKixiSATcKOztURei7h
 TjS+KbvebDSSqLqiTmU++QfoBJV4yA7Uu7a4Ed/e8H3e0ff0mTaGTFIsYPrh8YLK87lPlD
 Zjtjs/fu9eVn0fStQ5jR35fqSyzUeE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-nA5ADT28PU214XyErH8G8A-1; Wed, 23 Jun 2021 12:33:55 -0400
X-MC-Unique: nA5ADT28PU214XyErH8G8A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9212779EE0;
 Wed, 23 Jun 2021 16:33:54 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-200.ams2.redhat.com
 [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC9665D9F0;
 Wed, 23 Jun 2021 16:33:41 +0000 (UTC)
Subject: Re: [PATCH RFC 4/6] i386/pc: Keep PCI 64-bit hole within usable IOVA
 space
To: Igor Mammedov <imammedo@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622154905.30858-5-joao.m.martins@oracle.com>
 <20210623143031.1dd7faa1@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <e0fa96c9-34e1-1ce7-b3fa-f82b75219b06@redhat.com>
Date: Wed, 23 Jun 2021 18:33:39 +0200
MIME-Version: 1.0
In-Reply-To: <20210623143031.1dd7faa1@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding Marcel and Dave.

Adding Alex (seriously, a vfio- / iommu-related patch set without Alex on CC?)

comments below

On 06/23/21 14:30, Igor Mammedov wrote:
> On Tue, 22 Jun 2021 16:49:03 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> pci_memory initialized by q35 and i440fx is set to a range
>> of 0 .. UINT64_MAX, and as a consequence when ACPI and pci-host
>> pick the hole64_start it does not account for allowed IOVA ranges.
>>
>> Rather than blindly returning, round up the hole64_start
>> value to the allowable IOVA range, such that it accounts for
>> the 1Tb hole *on AMD*. On Intel it returns the input value
>> for hole64 start.
> 
> wouldn't that work only in case where guest firmware hadn't
> mapped any PCI bars above 4Gb (possibly in not allowed region).
> 
> Looking at Seabios, it uses reserved_memory_end as the start
> of PCI64 window. Not sure about OVMF,
>  CCing Laszlo.

(thanks for the CC)

Yes, see "OvmfPkg/PlatformPei/MemDetect.c":

  //
  // The "etc/reserved-memory-end" fw_cfg file, when present, contains an
  // absolute, exclusive end address for the memory hotplug area. This area
  // starts right at the end of the memory above 4GB. The 64-bit PCI host
  // aperture must be placed above it.
  //
  Status = QemuFwCfgFindFile ("etc/reserved-memory-end", &FwCfgItem,
             &FwCfgSize);


> 
>> Suggested-by: David Edmondson <david.edmondson@oracle.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc.c         | 17 +++++++++++++++--
>>  hw/pci-host/i440fx.c |  4 +++-
>>  hw/pci-host/q35.c    |  4 +++-
>>  include/hw/i386/pc.h |  3 ++-
>>  4 files changed, 23 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 2e2ea82a4661..65885cc16037 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -1141,7 +1141,7 @@ void pc_memory_init(PCMachineState *pcms,
>>   * The 64bit pci hole starts after "above 4G RAM" and
>>   * potentially the space reserved for memory hotplug.
>>   */
>> -uint64_t pc_pci_hole64_start(void)
>> +uint64_t pc_pci_hole64_start(uint64_t size)
>>  {
>>      PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>> @@ -1155,12 +1155,25 @@ uint64_t pc_pci_hole64_start(void)
>>              hole64_start += memory_region_size(&ms->device_memory->mr);
>>          }
>>      } else {
>> -        hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
>> +        if (!x86ms->above_1t_mem_size) {
>> +            hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
>> +        } else {
>> +            hole64_start = x86ms->above_1t_maxram_start;
>> +        }
>>      }
> 
>> +    hole64_start = allowed_round_up(hole64_start, size);
> 
> I'm not sure but, might it cause problems if there were BARs placed
> by firmware in region below rounded up value?
> (i.e. ACPI description which uses PCI_HOST_PROP_PCI_HOLE_START property
> won't match whatever firmware programmed due to rounding pushing hole
> start up)

This code is a hornets' nest. Marcel and MST too surely remember the troubles between it and OVMF from the past years.

The firmware assigns BARs, then distinctly later, the firmware temporarily reenables MMIO decoding for all PCI devices, and fetches the ACPI tables blob via fw_cfg. At that point, the ACPI content is re-generated by QEMU, which (due to all PCI devices having MMIO decoding enabled) involves computing "bounding boxes" over the programmed BARs (32-bit and 64-bit). Said "bounding boxes" are exposed in the _CRS. If the bounding boxes exposed in the _CRS are shrunk after the BAR assignment by the firmware, the guest OS will almost certainly reject at least some pre-existent BAR assignments by the firmware, by virtue of them falling outside of the _CRS windows.

If you want to keep the 64-bit PCI MMIO *aperture* restricted to a particular area, then you need to steer the guest firmware to allocate the BARs from that area in the first place.

In OVMF, we have an experimental fw_cfg knob for controlling the *size* of the aperture. Search the above-referenced OVMF source file for the string "opt/ovmf/X-PciMmio64Mb".

Regarding the *base* of the aperture, its calculation in OVMF is already non-trivial; please refer to the GetFirstNonAddress() function in the same file. I'm not sure what you're trying to do, but you might need another piece of guest enlightenment (fw_cfg?) for steering OVMF to place the base at a higher address (if that's what you want to do). If you can recognize the AMD IOMMU limitation in the guest without explicit paravirt stuff, then migrating part of the logic to OVMF could be easier (not that I look forward to reviewing related firmware patches, TBH).

The topic overlaps with the vCPU physical address width problem, for which QEMU guests cannot trust the otherwise appropriate CPUID leaf. Refer to the following upstream TianoCore BZ for details: <https://bugzilla.tianocore.org/show_bug.cgi?id=2796>.

Hmmmmm. How about this workaround. Might be worth a shot. The 64-bit PCI MMIO aperture in OVMF is "naturally aligned":

  //
  // The 64-bit PCI host aperture should also be "naturally" aligned. The
  // alignment is determined by rounding the size of the aperture down to the
  // next smaller or equal power of two. That is, align the aperture by the
  // largest BAR size that can fit into it.
  //
  Pci64Base = ALIGN_VALUE (Pci64Base, GetPowerOfTwo64 (Pci64Size));

This means that, if you specify a huge enough count of megabytes for the *size*, for example 1TB in total:

  -fw_cfg opt/ovmf/X-PciMmio64Mb,string=$((1024*1024))

then you'll also end up with a high-enough *base* (1 TB). From the blurb, I reckon that should work, without any patches at all for QEMU?

(OVMF currently allows a 16 TB aperture size via the above knob:

  //
  // See if the user specified the number of megabytes for the 64-bit PCI host
  // aperture. Accept an aperture size up to 16TB.
  //
)

Thanks
Laszlo


> 
>>      return ROUND_UP(hole64_start, 1 * GiB);
>>  }
>>  
>> +uint64_t pc_pci_hole64_start_aligned(uint64_t start, uint64_t size)
>> +{
>> +    if (nb_iova_ranges == DEFAULT_NR_USABLE_IOVAS) {
>> +        return start;
>> +    }
>> +    return allowed_round_up(start, size);
>> +}
>> +
>>  DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus)
>>  {
>>      DeviceState *dev = NULL;
>> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
>> index 28c9bae89944..e8eaebfe1034 100644
>> --- a/hw/pci-host/i440fx.c
>> +++ b/hw/pci-host/i440fx.c
>> @@ -163,8 +163,10 @@ static uint64_t i440fx_pcihost_get_pci_hole64_start_value(Object *obj)
>>      pci_bus_get_w64_range(h->bus, &w64);
>>      value = range_is_empty(&w64) ? 0 : range_lob(&w64);
>>      if (!value && s->pci_hole64_fix) {
>> -        value = pc_pci_hole64_start();
>> +        value = pc_pci_hole64_start(s->pci_hole64_size);
>>      }
>> +    /* This returns @value when not on AMD */
>> +    value = pc_pci_hole64_start_aligned(value, s->pci_hole64_size);
>>      return value;
>>  }
>>  
>> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
>> index 2eb729dff585..d556eb965ddb 100644
>> --- a/hw/pci-host/q35.c
>> +++ b/hw/pci-host/q35.c
>> @@ -126,8 +126,10 @@ static uint64_t q35_host_get_pci_hole64_start_value(Object *obj)
>>      pci_bus_get_w64_range(h->bus, &w64);
>>      value = range_is_empty(&w64) ? 0 : range_lob(&w64);
>>      if (!value && s->pci_hole64_fix) {
>> -        value = pc_pci_hole64_start();
>> +        value = pc_pci_hole64_start(s->mch.pci_hole64_size);
>>      }
>> +    /* This returns @value when not on AMD */
>> +    value = pc_pci_hole64_start_aligned(value, s->mch.pci_hole64_size);
>>      return value;
>>  }
>>  
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index 73b8e2900c72..b924aef3a218 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -217,7 +217,8 @@ void pc_memory_init(PCMachineState *pcms,
>>                      MemoryRegion *system_memory,
>>                      MemoryRegion *rom_memory,
>>                      MemoryRegion **ram_memory);
>> -uint64_t pc_pci_hole64_start(void);
>> +uint64_t pc_pci_hole64_start(uint64_t size);
>> +uint64_t pc_pci_hole64_start_aligned(uint64_t value, uint64_t size);
>>  DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
>>  void pc_basic_device_init(struct PCMachineState *pcms,
>>                            ISABus *isa_bus, qemu_irq *gsi,
> 


