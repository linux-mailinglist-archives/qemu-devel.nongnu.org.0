Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB87D320783
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 23:33:57 +0100 (CET)
Received: from localhost ([::1]:41978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDap2-00013k-DG
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 17:33:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lDaoF-0000eX-Cs
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 17:33:07 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:61416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lDaoC-0007Q9-1s
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 17:33:06 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AC5937462BD;
 Sat, 20 Feb 2021 23:33:00 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5A55274581E; Sat, 20 Feb 2021 23:33:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 561557456E3;
 Sat, 20 Feb 2021 23:33:00 +0100 (CET)
Date: Sat, 20 Feb 2021 23:33:00 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 04/13] vt82c686: Fix up power management io base and
 config
In-Reply-To: <fe7beb96-28c1-b8d5-3d9e-371078717972@amsat.org>
Message-ID: <a8ad6528-9ebd-abf0-7bf4-7d5a866d5021@eik.bme.hu>
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <cff9b2442d3e2e1cfbdcbc2dfbb559031b4b1cc1.1610223397.git.balaton@eik.bme.hu>
 <fe7beb96-28c1-b8d5-3d9e-371078717972@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-740884809-1613860380=:95909"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-740884809-1613860380=:95909
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 20 Feb 2021, Philippe Mathieu-Daudé wrote:
> On 1/9/21 9:16 PM, BALATON Zoltan wrote:
>> Similar to the SMBus io registers there is a power management io range
>> that is set via similar base address reg and enable bit. Some handling
>> of this was already there but with several problems: using the wrong
>> registers and bits, wrong size range, not acually updating mapping and
>> handling reset correctly, nor emulating any of the actual io
>> registers. Some of these errors are fixed up here.
>>
>> After this patch we use the correct base address register, enable bit
>> and region size and allow guests to map/unmap this region and
>> correctly reset all registers to default values on reset but we still
>> don't emulate any of the registers in this range.
>
> ^^ One change,
>
> vv Another change.

This again is just two hunks and a bit from this patch that is fairly 
trivial so I did not think that would need a separate patch but in this 
case maybe simplifies the main patch so you don't have to mentally ignore 
the pm_io_ops parts while reviewing it.

>> Previously just an empty RAM region was mapped on realize, now we add
>> an empty io range logging access instead. I think the pm timer should
>> be hooked up here but not sure guests need it. PMON on fuloong2e sets
>> a base address but does not seem to enable region; the pegasos2
>> firmware pokes some regs but continues anyway so don't know if
>> anything would make use of these facilities. Therefore this is just a
>> clean up of previous state for now and not intending to fully
>> implement missing functionality which could be done later if some
>> guests need it.
>
> I split your patch in 2.

Thanks again.

>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/isa/trace-events |  2 ++
>>  hw/isa/vt82c686.c   | 56 ++++++++++++++++++++++++++++++++-------------
>>  2 files changed, 42 insertions(+), 16 deletions(-)
>>
>> diff --git a/hw/isa/trace-events b/hw/isa/trace-events
>> index d267d3e652..641d69eedf 100644
>> --- a/hw/isa/trace-events
>> +++ b/hw/isa/trace-events
>> @@ -17,5 +17,7 @@ apm_io_write(uint8_t addr, uint8_t val) "write addr=0x%x val=0x%02x"
>>  # vt82c686.c
>>  via_isa_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
>>  via_pm_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
>> +via_pm_io_read(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
>> +via_pm_io_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
>>  via_superio_read(uint8_t addr, uint8_t val) "addr 0x%x val 0x%x"
>>  via_superio_write(uint8_t addr, uint32_t val) "addr 0x%x val 0x%x"
>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>> index 9c4d153022..fc2a1f4430 100644
>> --- a/hw/isa/vt82c686.c
>> +++ b/hw/isa/vt82c686.c
>> @@ -39,14 +39,11 @@ struct VT686PMState {
>>
>>  static void pm_io_space_update(VT686PMState *s)
>>  {
>> -    uint32_t pm_io_base;
>> -
>> -    pm_io_base = pci_get_long(s->dev.config + 0x40);
>> -    pm_io_base &= 0xffc0;
>> +    uint32_t pmbase = pci_get_long(s->dev.config + 0x48) & 0xff80UL;
>
> 0x48 is Power Management I/O Base,
> 0xff80UL is mask for Power Management I/O Register Base Address,
> OK.
>
>>      memory_region_transaction_begin();
>> -    memory_region_set_enabled(&s->io, s->dev.config[0x80] & 1);
>> -    memory_region_set_address(&s->io, pm_io_base);
>> +    memory_region_set_address(&s->io, pmbase);
>> +    memory_region_set_enabled(&s->io, s->dev.config[0x41] & BIT(7));
>
> 0x41 is General Configuration 1,
> bit 7 is I/O Enable for ACPI I/O Base,
> OK.
>
>>      memory_region_transaction_commit();
>>  }
>>
>> @@ -92,6 +89,13 @@ static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
>>
>>      trace_via_pm_write(addr, val, len);
>>      pci_default_write_config(d, addr, val, len);
>> +    if (ranges_overlap(addr, len, 0x48, 4)) {
>> +        uint32_t v = pci_get_long(s->dev.config + 0x48);
>> +        pci_set_long(s->dev.config + 0x48, (v & 0xff80UL) | 1);
>
> bit 0 is always set, OK.
>
>> +    }
>> +    if (range_covers_byte(addr, len, 0x41)) {
>
> Access to General Configuration. Why not use both registers?
>
>       if (ranges_overlap(addr, len, 0x40, 2)) {

Hmm, not sure, I've forgotten by now. I think we only have to do anything 
if the memory region is enabled or disabled which is the bit in 0x41 so if 
other parts of the reg are written we don't have to call 
pm_io_space_update(). We just store the value in the reg in that case but 
only need to update the region when the enable bit is changed.

>> +        pm_io_space_update(s);
>> +    }
>>      if (ranges_overlap(addr, len, 0x90, 4)) {
>>          uint32_t v = pci_get_long(s->dev.config + 0x90);
>>          pci_set_long(s->dev.config + 0x90, (v & 0xfff0UL) | 1);
>> @@ -102,6 +106,27 @@ static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
>>      }
>>  }
>>
>> +static void pm_io_write(void *op, hwaddr addr, uint64_t data, unsigned size)
>> +{
>> +    trace_via_pm_io_write(addr, data, size);
>> +}
>> +
>> +static uint64_t pm_io_read(void *op, hwaddr addr, unsigned size)
>> +{
>> +    trace_via_pm_io_read(addr, 0, size);
>> +    return 0;
>> +}
>> +
>> +static const MemoryRegionOps pm_io_ops = {
>> +    .read = pm_io_read,
>> +    .write = pm_io_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +    .impl = {
>> +        .min_access_size = 1,
>> +        .max_access_size = 1,
>> +    },
>> +};
>> +
>>  static void pm_update_sci(VT686PMState *s)
>>  {
>>      int sci_level, pmsts;
>> @@ -128,35 +153,34 @@ static void vt82c686b_pm_reset(DeviceState *d)
>>  {
>>      VT686PMState *s = VT82C686B_PM(d);
>>
>> +    memset(s->dev.config + PCI_CONFIG_HEADER_SIZE, 0,
>> +           PCI_CONFIG_SPACE_SIZE - PCI_CONFIG_HEADER_SIZE);
>> +    /* Power Management IO base */
>> +    pci_set_long(s->dev.config + 0x48, 1);
>
> bit 1 always set, OK.
>
>>      /* SMBus IO base */
>>      pci_set_long(s->dev.config + 0x90, 1);
>> -    s->dev.config[0xd2] = 0;
>>
>> +    pm_io_space_update(s);
>>      smb_io_space_update(s);
>>  }
>>
>>  static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
>>  {
>>      VT686PMState *s = VT82C686B_PM(dev);
>> -    uint8_t *pci_conf;
>>
>> -    pci_conf = s->dev.config;
>> -    pci_set_word(pci_conf + PCI_COMMAND, 0);
>> -    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_FAST_BACK |
>> +    pci_set_word(dev->config + PCI_STATUS, PCI_STATUS_FAST_BACK |
>>                   PCI_STATUS_DEVSEL_MEDIUM);
>>
>> -    /* 0x48-0x4B is Power Management I/O Base */
>> -    pci_set_long(pci_conf + 0x48, 0x00000001);
>> -
>>      pm_smbus_init(DEVICE(s), &s->smb, false);
>>      memory_region_add_subregion(pci_address_space_io(dev), 0, &s->smb.io);
>>      memory_region_set_enabled(&s->smb.io, false);
>>
>>      apm_init(dev, &s->apm, NULL, s);
>>
>> -    memory_region_init(&s->io, OBJECT(dev), "vt82c686-pm", 64);
>> +    memory_region_init_io(&s->io, OBJECT(dev), &pm_io_ops, s,
>> +                          "vt82c686-pm", 0x100);
>
> Section "Configuration Space Power Management Registers" describes:
>
>  4B-48: Power Mgmt I/O Base (256 Bytes)
>
> Section "Offset 4B-48 – Power Management I/O Base" describes:
>
>  Port Address for the base of the 128-byte Power
>  Management I/O Register block, corresponding to
>  AD[15:7].
>
> At least we are sure 64 bytes isn't enough indeed, but is it 128 or 256?

The regs in this range for 82c686b go up to 0x4C so it's definitely over 
64 but seems to be less than 128. The vt8231 docs also say 128 byte here 
so maybe this was a typo and 128 bytes length would be enough.

>> +    memory_region_add_subregion(pci_address_space_io(dev), 0, &s->io);
>>      memory_region_set_enabled(&s->io, false);
>> -    memory_region_add_subregion(get_system_io(), 0, &s->io);
>>
>>      acpi_pm_tmr_init(&s->ar, pm_tmr_timer, &s->io);
>>      acpi_pm1_evt_init(&s->ar, pm_tmr_timer, &s->io);
>
> TBH it took me almost 1h to review this single patch.

Yes, sorry but these kinds of patches need reading the chip docs which 
takes some time. It took me a few days to write this simgle patch though 
because I had to learn how the chip works and understand the code already 
there and testing with guests so reviewing it is still less than that. ;-)

Thanks for your efforts, I hope to get this series in so I can submit the 
remaining ones adding pegasos2 emulation so it can get in for the next 
release. Let me know if I can help your review by whatever changes you 
would need in other patches.

Regards,
BALATON Zoltan
--3866299591-740884809-1613860380=:95909--

