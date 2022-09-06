Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441FC5ADD79
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 04:42:05 +0200 (CEST)
Received: from localhost ([::1]:33232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVOXL-0006Xe-U6
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 22:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oVOVZ-0004ql-Tl
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 22:40:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oVOVW-0007WU-8L
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 22:40:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662432009;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nF93GbjaIuUbnUX7ORU1UP25YtmkaOPvLk398vrAK5E=;
 b=YrK0V1t+XOsN26VDjII2sFNTfSpQAbWAfnMBlVu0aUWvMbu3SHb/HGfpcl6kFlaiBdpT6B
 iRWoBO+0UPjd5RZIBfiTiyU9dfvleuAenx/UCCIAAv3yW3mfqJwOiXtJsGt8VyQtbngfW0
 RC0it9WA2kwCultBrsw1ne9YSWymdx0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-6VDYHsBuPCyA3nlKrvhX0g-1; Mon, 05 Sep 2022 22:40:06 -0400
X-MC-Unique: 6VDYHsBuPCyA3nlKrvhX0g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFBF03804509;
 Tue,  6 Sep 2022 02:40:05 +0000 (UTC)
Received: from [10.64.54.16] (vpn2-54-16.bne.redhat.com [10.64.54.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01238492C3B;
 Tue,  6 Sep 2022 02:40:01 +0000 (UTC)
Subject: Re: [PATCH v2 0/4] hw/arm/virt: Improve address assignment for high
 memory regions
To: eric.auger@redhat.com, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, peter.maydell@linaro.org, richard.henderson@linaro.org,
 shan.gavin@gmail.com
References: <20220815062958.100366-1-gshan@redhat.com>
 <8f219b9f-d5ee-aa9d-519e-e3a7623c2c63@redhat.com>
 <67f44b09-7c9a-fd83-d222-f505a91ca99e@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <679401b5-abb3-fb2b-38d4-017fd40d0fbf@redhat.com>
Date: Tue, 6 Sep 2022 12:39:58 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <67f44b09-7c9a-fd83-d222-f505a91ca99e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 8/24/22 6:06 PM, Eric Auger wrote:
> On 8/24/22 05:29, Gavin Shan wrote:
>> On 8/15/22 4:29 PM, Gavin Shan wrote:
>>> There are three high memory regions, which are VIRT_HIGH_REDIST2,
>>> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
>>> are floating on highest RAM address. However, they can be disabled
>>> in several cases.
>>>       (1) One specific high memory region is disabled by developer by
>>>       toggling vms->highmem_{redists, ecam, mmio}.
>>>       (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>>>       'virt-2.12' or ealier than it.
>>>       (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>>>       on 32-bits system.
>>>       (4) One specific high memory region is disabled when it breaks the
>>>       PA space limit.
>>>       The current implementation of virt_set_memmap() isn't comprehensive
>>> because the space for one specific high memory region is always
>>> reserved from the PA space for case (1), (2) and (3). In the code,
>>> 'base' and 'vms->highest_gpa' are always increased for those three
>>> cases. It's unnecessary since the assigned space of the disabled
>>> high memory region won't be used afterwards.
>>>
>>> The series intends to improve the address assignment for these
>>> high memory regions:
>>>
>>> PATCH[1] and PATCH[2] are cleanup and preparatory works.
>>> PATCH[3] improves address assignment for these high memory regions
>>> PATCH[4] moves the address assignment logic into standalone helper
>>>
>>> History
>>> =======
>>> v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html
>>>
>>> Changelog
>>> =========
>>> v2:
>>>     * Split the patches for easier review                        (Gavin)
>>>     * Improved changelog                                         (Marc)
>>>     * Use 'bool fits' in virt_set_high_memmap()                  (Eric)
>>>
> You did not really convince me about migration compat wrt the high MMIO
> region. Aren't the PCI BARs saved/restored meaning the device driver is
> expecting to find data at the same GPA. But what if your high MMIO
> region was relocated in the dest QEMU with a possibly smaller VM IPA?
> Don't you have MMIO regions now allocated outside of the dest MMIO
> region? How does the PCI host bridge route accesses to those regions?
> What do I miss?
> 

[...]

Sorry for the delay because I was offline last week. I was intending
to explain the migration on virtio-net device and spent some time to
go through the code. I found it's still complicated for an example
because PCI and virtio device models are involved. So lets still use
e1000e.c as an example here.

There are lots of registers residing in MMIO region, including MSIx
table. The MSIx table is backed by PCIDevice::msix_table, which is
a buffer. The access to MSIx table is read from or write to the buffer.
The corresponding handler is hw/msix.c::msix_table_mmio_ops. msix_init()
is called by e1000e.c to setup the MSIx table, which is associated with
memory BAR#3. As the registers in MSIx table is totally emulated by
QEMU, the BAR's base address isn't a concern.

   struct PCIDevice {
      :
      uint8_t *msix_table;
      :
      MemoryRegion msix_table_mmio;
      :
   };

   /* @table_bar is registered as memory BAR#3 in e1000e_pci_realize() */
   int msix_init(struct PCIDevice *dev, unsigned short nentries,
                 MemoryRegion *table_bar, uint8_t table_bar_nr,
                 unsigned table_offset, MemoryRegion *pba_bar,
                 uint8_t pba_bar_nr, unsigned pba_offset, uint8_t cap_pos,
                 Error **errp)
   {
        :
     memory_region_init_io(&dev->msix_table_mmio, OBJECT(dev), &msix_table_mmio_ops, dev,
                           "msix-table", table_size);
     memory_region_add_subregion(table_bar, table_offset, &dev->msix_table_mmio);
        :
   }

As we concerned, the BAR's base addresses for MSIx tables are different on source
and destination VMs. It's still not a problem because the registers in MSIx table
are migrated, saved on source VM and restored on destination VM one by one. It's
to say, not the whole buffer (PCIDevice::msix_table) is saved and restored at once.
Further more, the unique ID string, instead the corresponding BAR's base address,
is used to identify the MSIx table. For this particular case, the ID string is
something like "e1000e_dev_id/pci-0000:05:00.0/msix state". With this ID string
is received on the destination VM, the object and PCI device is located and the
forth-coming data is saved to PCIDevice::msix_table.

   static const VMStateDescription e1000e_vmstate = {
     .name = "e1000e",
     .version_id = 1,
     .minimum_version_id = 1,
     .pre_save = e1000e_pre_save,
     .post_load = e1000e_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(parent_obj, E1000EState),
         VMSTATE_MSIX(parent_obj, E1000EState),
         :
     }
   };

   #define VMSTATE_MSIX_TEST(_field, _state, _test) {                 \
     .name         = (stringify(_field)),                             \
     .size         = sizeof(PCIDevice),                               \
     .vmsd         = &vmstate_msix,                                   \
     .flags        = VMS_STRUCT,                                      \
     .offset       = vmstate_offset_value(_state, _field, PCIDevice), \
     .field_exists = (_test)                                          \
   }

   #define VMSTATE_MSIX(_f, _s)                                       \
       VMSTATE_MSIX_TEST(_f, _s, NULL)


   /* On source VM, PCIDevice::msix_table is transferred to destination VM */
   void msix_save(PCIDevice *dev, QEMUFile *f)
   {
     :
     qemu_put_buffer(f, dev->msix_table, n * PCI_MSIX_ENTRY_SIZE);
     qemu_put_buffer(f, dev->msix_pba, DIV_ROUND_UP(n, 8));
   }

   /* On destination VM, the received data is write to PCIDevice::msix_table */
   void msix_load(PCIDevice *dev, QEMUFile *f)
   {
     :
     qemu_get_buffer(f, dev->msix_table, n * PCI_MSIX_ENTRY_SIZE);
     qemu_get_buffer(f, dev->msix_pba, DIV_ROUND_UP(n, 8));
     :
   }

   static int put_msix_state(QEMUFile *f, void *pv, size_t size,
                             const VMStateField *field, JSONWriter *vmdesc)
   {
     msix_save(pv, f);

     return 0;
   }

   static int get_msix_state(QEMUFile *f, void *pv, size_t size,
                             const VMStateField *field)
   {
     msix_load(pv, f);
     return 0;
   }

   static VMStateInfo vmstate_info_msix = {
     .name = "msix state",
     .get  = get_msix_state,
     .put  = put_msix_state,
   };

   const VMStateDescription vmstate_msix = {
     .name = "msix",
     .fields = (VMStateField[]) {
         {
             .name         = "msix",
             .version_id   = 0,
             .field_exists = NULL,
             .size         = 0,   /* ouch */
             .info         = &vmstate_info_msix,
             .flags        = VMS_SINGLE,
             .offset       = 0,
         },
     }
  };

Thanks,
Gavin


