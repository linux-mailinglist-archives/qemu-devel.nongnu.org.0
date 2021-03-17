Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9996D33E5FE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 02:28:11 +0100 (CET)
Received: from localhost ([::1]:60364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMKyo-00082x-Hu
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 21:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1lMKww-0007Yb-OK
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 21:26:14 -0400
Received: from jedlik.phy.bme.hu ([152.66.102.83]:43436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1lMKwt-00088v-6X
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 21:26:14 -0400
Received: by jedlik.phy.bme.hu (Postfix, from userid 1000)
 id D5B75A0120; Wed, 17 Mar 2021 02:18:16 +0100 (CET)
Date: Wed, 17 Mar 2021 02:18:16 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v9 6/7] hw/pci-host: Add emulation of Marvell MV64361
 PPC system controller
In-Reply-To: <ae1821e4-efae-d97a-ca55-079bb0399fe8@amsat.org>
Message-ID: <alpine.LMD.2.03.2103170202420.5187@eik.bme.hu>
References: <cover.1615932192.git.balaton@eik.bme.hu>
 <e3bd27f053de5335713835013a7119409c8dc104.1615932192.git.balaton@eik.bme.hu>
 <ae1821e4-efae-d97a-ca55-079bb0399fe8@amsat.org>
User-Agent: Alpine 2.03 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
 BOUNDARY="1117279078-1310801992-1615943896=:5187"
Received-SPF: none client-ip=152.66.102.83;
 envelope-from=balaton@jedlik.phy.bme.hu; helo=jedlik.phy.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1117279078-1310801992-1615943896=:5187
Content-Type: TEXT/PLAIN; charset=utf-8; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 17 Mar 2021, Philippe Mathieu-Daud=C3=A9 wrote:
> On 3/16/21 11:03 PM, BALATON Zoltan wrote:
>> The Marvell Discovery II aka. MV64361 is a PowerPC system controller
>> chip that is used on the pegasos2 PPC board. This adds emulation of it
>> that models the device enough to boot guests on this board. The
>> mv643xx.h header with register definitions is taken from Linux 4.15.10
>> only fixing white space errors, removing not needed parts and changing
>> formatting for QEMU coding style.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/pci-host/Kconfig           |   4 +
>>  hw/pci-host/meson.build       |   2 +
>>  hw/pci-host/mv64361.c         | 966 ++++++++++++++++++++++++++++++++++
>>  hw/pci-host/mv643xx.h         | 918 ++++++++++++++++++++++++++++++++
>>  hw/pci-host/trace-events      |   6 +
>>  include/hw/pci-host/mv64361.h |   8 +
>>  include/hw/pci/pci_ids.h      |   1 +
>>  7 files changed, 1905 insertions(+)
>>  create mode 100644 hw/pci-host/mv64361.c
>>  create mode 100644 hw/pci-host/mv643xx.h
>>  create mode 100644 include/hw/pci-host/mv64361.h
>
>> +static void unmap_region(MemoryRegion *mr)
>> +{
>> +    if (memory_region_is_mapped(mr)) {
>> +        memory_region_del_subregion(get_system_memory(), mr);
>> +        object_unparent(OBJECT(mr));
>> +    }
>> +}
>> +
>> +static void map_pci_region(MemoryRegion *mr, MemoryRegion *parent,
>> +                           struct Object *owner, const char *name,
>> +                           hwaddr poffs, uint64_t size, hwaddr moffs)
>> +{
>> +    memory_region_init_alias(mr, owner, name, parent, poffs, size);
>> +    memory_region_add_subregion(get_system_memory(), moffs, mr);
>> +    trace_mv64361_region_map(name, poffs, size, moffs);
>> +}
>> +
>> +static void setup_mem_windows(MV64361State *s, uint32_t val)
>> +{
>> +    MV64361PCIState *p;
>> +    MemoryRegion *mr;
>> +    uint32_t mask;
>> +    int i;
>> +
>> +    val &=3D 0x1fffff;
>
> magic value for PCI_WINDOW_SIZE_MASK?

That constant does not exist. I could define it but don't see how is it=20
better then literal value if it's only needed once.

>> +    for (mask =3D 1, i =3D 0; i < 21; i++, mask <<=3D 1) {
>
> magic 21.

Same here, 21 is number of memory windows as is clear from the below=20
comments and this is only used here so hiding it behind a constant that=20
you'd have to scroll up to figure out the value of would not make it=20
clearer in my opinion.

>> +        if ((val & mask) !=3D (s->base_addr_enable & mask)) {
>> +            trace_mv64361_region_enable(!(val & mask) ? "enable" : "dis=
able", i);
>> +            switch (i) {
>> +            /*
>> +             * 0-3 are SDRAM chip selects but we map all RAM directly
>> +             * 4-7 are device chip selects (not sure what those are)
>> +             * 8 is Boot device (ROM) chip select but we map that direc=
tly too
>> +             */
>> +            case 9:
>> +                p =3D &s->pci[0];
>> +                mr =3D &s->cpu_win[i];
>> +                unmap_region(mr);
>> +                if (!(val & mask)) {
>> +                    map_pci_region(mr, &p->io, OBJECT(s), "pci0-io-win"=
,
>> +                                   p->remap[4], (p->io_size + 1) << 16,
>> +                                   (p->io_base & 0xfffff) << 16);
>> +                }
>> +                break;
>> +            case 10:
>> +                p =3D &s->pci[0];
>> +                mr =3D &s->cpu_win[i];
>> +                unmap_region(mr);
>> +                if (!(val & mask)) {
>> +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci0-mem0-w=
in",
>> +                                   p->remap[0], (p->mem_size[0] + 1) <<=
 16,
>> +                                   (p->mem_base[0] & 0xfffff) << 16);
>> +                }
>> +                break;
>> +            case 11:
>> +                p =3D &s->pci[0];
>> +                mr =3D &s->cpu_win[i];
>> +                unmap_region(mr);
>> +                if (!(val & mask)) {
>> +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci0-mem1-w=
in",
>> +                                   p->remap[1], (p->mem_size[1] + 1) <<=
 16,
>> +                                   (p->mem_base[1] & 0xfffff) << 16);
>> +                }
>> +                break;
>> +            case 12:
>> +                p =3D &s->pci[0];
>> +                mr =3D &s->cpu_win[i];
>> +                unmap_region(mr);
>> +                if (!(val & mask)) {
>> +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci0-mem2-w=
in",
>> +                                   p->remap[2], (p->mem_size[2] + 1) <<=
 16,
>> +                                   (p->mem_base[2] & 0xfffff) << 16);
>> +                }
>> +                break;
>> +            case 13:
>> +                p =3D &s->pci[0];
>> +                mr =3D &s->cpu_win[i];
>> +                unmap_region(mr);
>> +                if (!(val & mask)) {
>> +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci0-mem3-w=
in",
>> +                                   p->remap[3], (p->mem_size[3] + 1) <<=
 16,
>> +                                   (p->mem_base[3] & 0xfffff) << 16);
>> +                }
>> +                break;
>> +            case 14:
>> +                p =3D &s->pci[1];
>> +                mr =3D &s->cpu_win[i];
>> +                unmap_region(mr);
>> +                if (!(val & mask)) {
>> +                    map_pci_region(mr, &p->io, OBJECT(s), "pci1-io-win"=
,
>> +                                   p->remap[4], (p->io_size + 1) << 16,
>> +                                   (p->io_base & 0xfffff) << 16);
>> +                }
>> +                break;
>> +            case 15:
>> +                p =3D &s->pci[1];
>> +                mr =3D &s->cpu_win[i];
>> +                unmap_region(mr);
>> +                if (!(val & mask)) {
>> +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci1-mem0-w=
in",
>> +                                   p->remap[0], (p->mem_size[0] + 1) <<=
 16,
>> +                                   (p->mem_base[0] & 0xfffff) << 16);
>> +                }
>> +                break;
>> +            case 16:
>> +                p =3D &s->pci[1];
>> +                mr =3D &s->cpu_win[i];
>> +                unmap_region(mr);
>> +                if (!(val & mask)) {
>> +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci1-mem1-w=
in",
>> +                                   p->remap[1], (p->mem_size[1] + 1) <<=
 16,
>> +                                   (p->mem_base[1] & 0xfffff) << 16);
>> +                }
>> +                break;
>> +            case 17:
>> +                p =3D &s->pci[1];
>> +                mr =3D &s->cpu_win[i];
>> +                unmap_region(mr);
>> +                if (!(val & mask)) {
>> +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci1-mem2-w=
in",
>> +                                   p->remap[2], (p->mem_size[2] + 1) <<=
 16,
>> +                                   (p->mem_base[2] & 0xfffff) << 16);
>> +                }
>> +                break;
>> +            case 18:
>> +                p =3D &s->pci[1];
>> +                mr =3D &s->cpu_win[i];
>> +                unmap_region(mr);
>> +                if (!(val & mask)) {
>> +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci1-mem3-w=
in",
>> +                                   p->remap[3], (p->mem_size[3] + 1) <<=
 16,
>> +                                   (p->mem_base[3] & 0xfffff) << 16);
>> +                }
>> +                break;
>> +            /* 19 is integrated SRAM */
>> +            case 20:
>> +                mr =3D &s->regs;
>> +                unmap_region(mr);
>> +                if (!(val & mask)) {
>> +                    memory_region_add_subregion(get_system_memory(),
>> +                        (s->regs_base & 0xfffff) << 16, mr);
>> +                }
>> +                break;
>> +            }
>> +        }
>> +    }
>> +}
>> +
>> +static void mv64361_update_irq(void *opaque, int n, int level)
>> +{
>> +    MV64361State *s =3D opaque;
>> +    uint64_t val =3D s->main_int_cr;
>> +
>> +    if (level) {
>> +        val |=3D BIT_ULL(n);
>> +    } else {
>> +        val &=3D ~BIT_ULL(n);
>> +    }
>> +    if ((s->main_int_cr & s->cpu0_int_mask) !=3D (val & s->cpu0_int_mas=
k)) {
>> +        qemu_set_irq(s->cpu_irq, level);
>> +    }
>> +    s->main_int_cr =3D val;
>> +}
>> +
>> +static uint64_t mv64361_read(void *opaque, hwaddr addr, unsigned int si=
ze)
>> +{
>> +    MV64361State *s =3D MV64361(opaque);
>> +    uint32_t ret =3D 0;
>> +
>> +    switch (addr) {
>> +    case MV64340_CPU_CONFIG:
>> +        ret =3D s->cpu_conf;
>> +        break;
>> +    case MV64340_PCI_0_IO_BASE_ADDR:
>> +        ret =3D s->pci[0].io_base;
>> +        break;
>> +    case MV64340_PCI_0_IO_SIZE:
>> +        ret =3D s->pci[0].io_size;
>> +        break;
>> +    case MV64340_PCI_0_IO_ADDR_REMAP:
>> +        ret =3D s->pci[0].remap[4] >> 16;
>> +        break;
>> +    case MV64340_PCI_0_MEMORY0_BASE_ADDR:
>> +        ret =3D s->pci[0].mem_base[0];
>> +        break;
>> +    case MV64340_PCI_0_MEMORY0_SIZE:
>> +        ret =3D s->pci[0].mem_size[0];
>> +        break;
>> +    case MV64340_PCI_0_MEMORY0_LOW_ADDR_REMAP:
>> +        ret =3D (s->pci[0].remap[0] & 0xffff0000) >> 16;
>
> extract32()

I don't like that because it has an unneded assert for every invocation so=
=20
I usually avoid it unless it would make code clearer. This is pretty clear=
=20
already this way, in fact I think clrearer than having to check what the=20
params of extract32 are. I might consider extract* if it was a macro=20
without additional unnecessary checks.

>> +        break;
>> +    case MV64340_PCI_0_MEMORY0_HIGH_ADDR_REMAP:
>> +        ret =3D s->pci[0].remap[0] >> 32;
>> +        break;
>> +    case MV64340_PCI_0_MEMORY1_BASE_ADDR:
>> +        ret =3D s->pci[0].mem_base[1];
>> +        break;
>> +    case MV64340_PCI_0_MEMORY1_SIZE:
>> +        ret =3D s->pci[0].mem_size[1];
>> +        break;
>> +    case MV64340_PCI_0_MEMORY1_LOW_ADDR_REMAP:
>> +        ret =3D (s->pci[0].remap[1] & 0xffff0000) >> 16;
>> +        break;
>> +    case MV64340_PCI_0_MEMORY1_HIGH_ADDR_REMAP:
>> +        ret =3D s->pci[0].remap[1] >> 32;
>> +        break;
>> +    case MV64340_PCI_0_MEMORY2_BASE_ADDR:
>> +        ret =3D s->pci[0].mem_base[2];
>> +        break;
>> +    case MV64340_PCI_0_MEMORY2_SIZE:
>> +        ret =3D s->pci[0].mem_size[2];
>> +        break;
>> +    case MV64340_PCI_0_MEMORY2_LOW_ADDR_REMAP:
>> +        ret =3D (s->pci[0].remap[2] & 0xffff0000) >> 16;
>> +        break;
>> +    case MV64340_PCI_0_MEMORY2_HIGH_ADDR_REMAP:
>> +        ret =3D s->pci[0].remap[2] >> 32;
>> +        break;
>> +    case MV64340_PCI_0_MEMORY3_BASE_ADDR:
>> +        ret =3D s->pci[0].mem_base[3];
>> +        break;
>> +    case MV64340_PCI_0_MEMORY3_SIZE:
>> +        ret =3D s->pci[0].mem_size[3];
>> +        break;
>> +    case MV64340_PCI_0_MEMORY3_LOW_ADDR_REMAP:
>> +        ret =3D (s->pci[0].remap[3] & 0xffff0000) >> 16;
>> +        break;
>> +    case MV64340_PCI_0_MEMORY3_HIGH_ADDR_REMAP:
>> +        ret =3D s->pci[0].remap[3] >> 32;
>> +        break;
>> +    case MV64340_PCI_1_IO_BASE_ADDR:
>> +        ret =3D s->pci[1].io_base;
>> +        break;
>> +    case MV64340_PCI_1_IO_SIZE:
>> +        ret =3D s->pci[1].io_size;
>> +        break;
>> +    case MV64340_PCI_1_IO_ADDR_REMAP:
>> +        ret =3D s->pci[1].remap[4] >> 16;
>> +        break;
>> +    case MV64340_PCI_1_MEMORY0_BASE_ADDR:
>> +        ret =3D s->pci[1].mem_base[0];
>> +        break;
>> +    case MV64340_PCI_1_MEMORY0_SIZE:
>> +        ret =3D s->pci[1].mem_size[0];
>> +        break;
>> +    case MV64340_PCI_1_MEMORY0_LOW_ADDR_REMAP:
>> +        ret =3D (s->pci[1].remap[0] & 0xffff0000) >> 16;
>> +        break;
>> +    case MV64340_PCI_1_MEMORY0_HIGH_ADDR_REMAP:
>> +        ret =3D s->pci[1].remap[0] >> 32;
>> +        break;
>> +    case MV64340_PCI_1_MEMORY1_BASE_ADDR:
>> +        ret =3D s->pci[1].mem_base[1];
>> +        break;
>> +    case MV64340_PCI_1_MEMORY1_SIZE:
>> +        ret =3D s->pci[1].mem_size[1];
>> +        break;
>> +    case MV64340_PCI_1_MEMORY1_LOW_ADDR_REMAP:
>> +        ret =3D (s->pci[1].remap[1] & 0xffff0000) >> 16;
>> +        break;
>> +    case MV64340_PCI_1_MEMORY1_HIGH_ADDR_REMAP:
>> +        ret =3D s->pci[1].remap[1] >> 32;
>> +        break;
>> +    case MV64340_PCI_1_MEMORY2_BASE_ADDR:
>> +        ret =3D s->pci[1].mem_base[2];
>> +        break;
>> +    case MV64340_PCI_1_MEMORY2_SIZE:
>> +        ret =3D s->pci[1].mem_size[2];
>> +        break;
>> +    case MV64340_PCI_1_MEMORY2_LOW_ADDR_REMAP:
>> +        ret =3D (s->pci[1].remap[2] & 0xffff0000) >> 16;
>> +        break;
>> +    case MV64340_PCI_1_MEMORY2_HIGH_ADDR_REMAP:
>> +        ret =3D s->pci[1].remap[2] >> 32;
>> +        break;
>> +    case MV64340_PCI_1_MEMORY3_BASE_ADDR:
>> +        ret =3D s->pci[1].mem_base[3];
>> +        break;
>> +    case MV64340_PCI_1_MEMORY3_SIZE:
>> +        ret =3D s->pci[1].mem_size[3];
>> +        break;
>> +    case MV64340_PCI_1_MEMORY3_LOW_ADDR_REMAP:
>> +        ret =3D (s->pci[1].remap[3] & 0xffff0000) >> 16;
>> +        break;
>> +    case MV64340_PCI_1_MEMORY3_HIGH_ADDR_REMAP:
>> +        ret =3D s->pci[1].remap[3] >> 32;
>> +        break;
>> +    case MV64340_INTERNAL_SPACE_BASE_ADDR:
>> +        ret =3D s->regs_base;
>> +        break;
>> +    case MV64340_BASE_ADDR_ENABLE:
>> +        ret =3D s->base_addr_enable;
>> +        break;
>> +    case MV64340_PCI_0_CONFIG_ADDR:
>> +        ret =3D pci_host_conf_le_ops.read(PCI_HOST_BRIDGE(&s->pci[0]), =
0, size);
>> +        break;
>> +    case MV64340_PCI_0_CONFIG_DATA_VIRTUAL_REG ...
>> +         MV64340_PCI_0_CONFIG_DATA_VIRTUAL_REG + 3:
>> +        ret =3D pci_host_data_le_ops.read(PCI_HOST_BRIDGE(&s->pci[0]),
>> +                  addr - MV64340_PCI_0_CONFIG_DATA_VIRTUAL_REG, size);
>
> Code smell... You probably want memory_region_dispatch_read().

Never heard of that, no idea how to use that and how would that would help=
=20
here. Any examples? But at this point I really don't want to change any of=
=20
this as that could break it while this was tested to work.

>> +        break;
>> +    case MV64340_PCI_1_CONFIG_ADDR:
>> +        ret =3D pci_host_conf_le_ops.read(PCI_HOST_BRIDGE(&s->pci[1]), =
0, size);
>> +        break;
>> +    case MV64340_PCI_1_CONFIG_DATA_VIRTUAL_REG ...
>> +         MV64340_PCI_1_CONFIG_DATA_VIRTUAL_REG + 3:
>> +        ret =3D pci_host_data_le_ops.read(PCI_HOST_BRIDGE(&s->pci[1]),
>> +                  addr - MV64340_PCI_1_CONFIG_DATA_VIRTUAL_REG, size);
>> +        break;
>> +    case MV64340_PCI_1_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG:
>> +        /* FIXME: Should this be sent via the PCI bus somehow? */
>> +        if (s->gpp_int_level && (s->gpp_value & BIT(31))) {
>> +            ret =3D pic_read_irq(isa_pic);
>> +        }
>> +        break;
>> +    case MV64340_MAIN_INTERRUPT_CAUSE_LOW:
>> +        ret =3D s->main_int_cr;
>> +        break;
>> +    case MV64340_MAIN_INTERRUPT_CAUSE_HIGH:
>> +        ret =3D s->main_int_cr >> 32;
>> +        break;
>> +    case MV64340_CPU_INTERRUPT0_MASK_LOW:
>> +        ret =3D s->cpu0_int_mask;
>> +        break;
>> +    case MV64340_CPU_INTERRUPT0_MASK_HIGH:
>> +        ret =3D s->cpu0_int_mask >> 32;
>> +        break;
>> +    case MV64340_CPU_INTERRUPT0_SELECT_CAUSE:
>> +        ret =3D s->main_int_cr;
>> +        if (s->main_int_cr & s->cpu0_int_mask) {
>> +            if (!(s->main_int_cr & s->cpu0_int_mask & 0xffffffff)) {
>> +                ret =3D s->main_int_cr >> 32 | BIT(30);
>> +            } else if ((s->main_int_cr & s->cpu0_int_mask) >> 32) {
>> +                ret |=3D BIT(31);
>> +            }
>> +        }
>> +        break;
>> +    case MV64340_CUNIT_ARBITER_CONTROL_REG:
>> +        ret =3D 0x11ff0000 | (s->gpp_int_level << 10);
>> +        break;
>> +    case MV64340_GPP_IO_CONTROL:
>> +        ret =3D s->gpp_io;
>> +        break;
>> +    case MV64340_GPP_LEVEL_CONTROL:
>> +        ret =3D s->gpp_level;
>> +        break;
>> +    case MV64340_GPP_VALUE:
>> +        ret =3D s->gpp_value;
>> +        break;
>> +    case MV64340_GPP_VALUE_SET:
>> +    case MV64340_GPP_VALUE_CLEAR:
>> +        ret =3D 0;
>> +        break;
>> +    case MV64340_GPP_INTERRUPT_CAUSE:
>> +        ret =3D s->gpp_int_cr;
>> +        break;
>> +    case MV64340_GPP_INTERRUPT_MASK0:
>> +    case MV64340_GPP_INTERRUPT_MASK1:
>> +        ret =3D s->gpp_int_mask;
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_UNIMP, "%s: Unimplemented register read 0x%"
>> +                      HWADDR_PRIx "\n", __func__, addr);
>> +        break;
>> +    }
>> +    if (addr !=3D MV64340_PCI_1_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG) {
>> +        trace_mv64361_reg_read(addr, ret);
>> +    }
>> +    return ret;
>> +}
>> +
>> +static void warn_swap_bit(uint64_t val)
>> +{
>> +    if ((val & 0x3000000ULL) >> 24 !=3D 1) {
>
> Code smell. Shouldn't this be a MemoryRegion?

Why is this a code smell? It is a memory region but can you flip its=20
endianness during runtime or only when declaring it? Anyway, fortunately=20
nothing seems to need this, I've only put the warning here to see if it=20
would be needed but never have seen it firing. (The chip has an endianness=
=20
bit that can enable swapping of memory region accesses but we don't=20
emulate that. This function checks that guest does not try to enable it.)

Regards,
BALATON Zoltan

>> +        qemu_log_mask(LOG_UNIMP, "%s: Data swap not implemented", __fun=
c__);
>> +    }
>> +}
>> +
>> +static void mv64361_set_pci_mem_remap(MV64361State *s, int bus, int idx=
,
>> +                                      uint64_t val, bool high)
>> +{
>> +    if (high) {
>> +        s->pci[bus].remap[idx] =3D val;
>> +    } else {
>> +        s->pci[bus].remap[idx] &=3D 0xffffffff00000000ULL;
>> +        s->pci[bus].remap[idx] |=3D (val & 0xffffULL) << 16;
>> +    }
>> +}
>
>
--1117279078-1310801992-1615943896=:5187--

