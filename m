Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD76B533B8B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 13:16:56 +0200 (CEST)
Received: from localhost ([::1]:34206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntp0Z-0006ym-O8
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 07:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ntoyH-00066K-EX
 for qemu-devel@nongnu.org; Wed, 25 May 2022 07:14:33 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ntoyE-00008F-5x
 for qemu-devel@nongnu.org; Wed, 25 May 2022 07:14:33 -0400
Received: from fraeml715-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4L7Sz1359jz681D8;
 Wed, 25 May 2022 19:10:21 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml715-chm.china.huawei.com (10.206.15.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 25 May 2022 13:14:26 +0200
Received: from localhost (10.202.226.42) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 25 May
 2022 12:14:25 +0100
Date: Wed, 25 May 2022 12:14:22 +0100
To: Corey Minyard <minyard@acm.org>
CC: Ben Widawsky <bwidawsk@kernel.org>, <qemu-devel@nongnu.org>, Klaus Jensen
 <its@irrelevant.dk>, <linux-cxl@vger.kernel.org>, Damien Hedde
 <damien.hedde@greensocs.com>, Peter Delevoryas <pdel@fb.com>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Alex =?ISO-8859-1?Q?B?=
 =?ISO-8859-1?Q?enn=E9e?= <alex.bennee@linaro.org>, <linuxarm@huawei.com>
Subject: Re: [RFC PATCH 2/2] arm/virt: Add aspeed-i2c controller and MCTP EP
 to enable MCTP testing
Message-ID: <20220525121422.00003a84@Huawei.com>
In-Reply-To: <20220524181310.GI3767252@minyard.net>
References: <20220520170128.4436-1-Jonathan.Cameron@huawei.com>
 <20220520170128.4436-3-Jonathan.Cameron@huawei.com>
 <20220524163633.gycxq6v5i5ucz4ja@bwidawsk-mobl5>
 <20220524175043.00002ae8@Huawei.com>
 <20220524181310.GI3767252@minyard.net>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhreml726-chm.china.huawei.com (10.201.108.77) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Tue, 24 May 2022 13:13:10 -0500
Corey Minyard <minyard@acm.org> wrote:

> On Tue, May 24, 2022 at 05:50:43PM +0100, Jonathan Cameron wrote:
> > On Tue, 24 May 2022 09:36:44 -0700
> > Ben Widawsky <bwidawsk@kernel.org> wrote:
> >   
> > > On 22-05-20 18:01:28, Jonathan Cameron wrote:  
> > > > As the only I2C emulation in QEMU that supports being both
> > > > a master and a slave, suitable for MCTP over i2c is aspeed-i2c
> > > > add this controller to the arm virt model and hook up our new
> > > > i2c_mctp_cxl_fmapi device.
> > > > 
> > > > The current Linux driver for aspeed-i2c has a hard requirement on
> > > > a reset controller.  Throw down the simplest reset controller
> > > > I could find so as to avoid need to make any chance to the kernel
> > > > code.    
> > > 
> > > s/chance/change  
> > oops :)  
> > >   
> > > > 
> > > > Patch also builds appropriate device tree.  Unfortunately for CXL
> > > > we need to use ACPI (no DT bindings yet defined). Enabling this will
> > > > either require appropriate support for MCTP on an i2c master that
> > > > has ACPI bindings, or modifications of the kernel driver to support
> > > > ACPI with aspeed-i2c (which might be a little controversial ;)    
> > > 
> > > I'm naive to what DT defines, but I assume what's there already is insufficient
> > > to make the bindings for CXL. I say this because I believe it wouldn't be too
> > > bad at all to make a cxl_dt.ko, and it's certainly less artificial than
> > > providing ACPI support for things which don't naturally have ACPI support.  
> > 
> > It wouldn't be that hard to work out a CXL dt binding, but it's not
> > of sufficient interest to me that I'd want to do it (I'll review if someone
> > else sends patches). Platforms I'm interested in CXL with are all strictly
> > ACPI only.
> > 
> > The trick here I think, is going to be adding ACPI support for a suitable I2C controller
> > which supports the requirement for supporting master and and I2C EP needed
> > for MCTP. Either I find one that already has ACPI bindings and add enough
> > emulation for this functionality, or work around the lack of ACPI bindings for the
> > aspeed-i2c controller.
> > 
> > Based on a really quick check of I2C masters for which I have docs and that
> > definitely have ACPI bindings, it's not a particularly common feature set.  
> 
> Ben already got my comments.
> 
> It's not common, but it's something you are using, so it obviously
> exists.  What hardware do you have?  The most natural thing might be to
> add your controller.
> 

Right now, no hardware. My interest here isn't really in the i2c mctp thing as
opposed to running other stuff over MCTP - it's just a convenient path
to emulating what a Fabric Manager (probably a BMC) would be doing
in a CXL system. I'm just making us of the existing infrastructure
rather than rolling a different interface (I could do MCTP over PCI VDM
for example and may well do that in future).

Actual system might look something like:
- note that I don't need to model this to be able to
  exercise the OS support etc... (see later)
USP - normal upstream port
DSP - normal downstream port
vPPB -  is sort of like a virtual downstream port. These
    are dynamically bound to either a single logical devices (SLD)
    which has a whole physical CXL DSP to itself, or to one logical
    device in an Multilogical device (MLD)

What a host sees is either vPPB that has link down (nothing there)
or a vPPB that has a device below it which it can discover
via normal enumeration.

Example here has

Host 0 with two root ports
Each RP is connected to an upstream port on the switch
with a small virtual hierarchy (VH0 and VH1) of two vPPB each
As currently configured (and note it dynamically configuring this
which is of interest) VH0 has one vPPB bound to a 

 _________________    ________________
|  Host 0         |  |   Host 1       |    ---------
|                 |  |                |   | Fabric  |
| CXLRP0  CXLRP1  |  | CXLRP0  CXLRP1 |   | Manager |
|_________________|  |________________|   |_________|
    |        |            |      |              |
    | CXL    | CXL        |CXL   |CXL           | I2C 
 ___|________|____________|______|______________|______
|                                                      | 
|  USP      USP          USP     USP            FM-API |
|   |        |            |       |                    |
|   | VH0    |VH1         |VH2    |VH3                 |
|  / \      / \          / \     / \                   |
| /   \        \        /   \       \                  |
|/     \        \      /     \       \                 |
|vPPB  vPPB    vPPB  vPPB    vPPB    vPPB              |
| |    Unbound   |   Unbound   |      |                |
| bound           \            LD1   LD2               |
| |                \Bound LD0  |     /                 | 
| |                 \          |    /                  |
| DSP                ----DSP-MLD ---                   |
|______________________________________________________|
   |                           |
  SLD Type 3                   MLD memory device
  memory device

However, to be able to poke all the OS interfaces and
the fabric manager interfaces I just need the ability to
model something more like.
 _______________________________________________________
|  Host 0                                               |
|                                           FM Software |
| CXLRP0  CXLRP1                            Manager     |
|_______________________________________________________|
    |        |                                  |
    | CXL    | CXL        Not connected         | I2C 
 ___|________|__________________________________|______
|                                                      | 
|  USP      USP          USP     USP            FM-API |
|   |        |            |       |                    |
|   | VH0    |VH1         |VH2    |VH3                 |
|  / \      / \          / \     / \                   |
| /   \        \        /   \       \                  |
|/     \        \      /     \       \                 |
|vPPB  vPPB    vPPB  vPPB    vPPB    vPPB              |
| |    Unbound   |   Unbound   |      |                |
| bound           \            LD1   LD2               |
| |                \Bound LD0  |     /                 | 
| |                 \          |    /                  |
| DSP               -----DSP-MLD ---                   |
|______________________________________________________|
   |                           |
  SLD Type 3                   MLD memory device
  memory device

The reason for jumping through the hoops of mctp over i2c
is that the software support is there and standard today
+ this lets me use the existing DMTF MCTP bindings for CXL
FM-API rather than wrapping them up in something custom.
It's also nice and lightweight from the emulation point of view.

Clearly lots to do here yet though including...
1. Hooking the FM-API agent up to the parts of the switch
   (probably adding links to the USPs is sufficient)
2. Adding infrastructure for vPPBs.
3. Wire up everything to be able to trigger appropriate
  hotplug events to the host for CXL devices being bound
  to the vPPBs.

I'm not that bothered by the lack of suitable i2c master
with ACPI bindings in the short term, it just makes
testing a bit fiddlier as kernel will need patching.
It'll be a trivial patch, particularly if I can get moving
most of the aspeed-i2c kernel firmware handling over to the
generic property.h infrastructure (and then use the wonder
that is PRP0001, plus bodge the clk and reset). 

Longer term I might just switch to the PCI VDM route but
that's a bigger job in both the kernel and QEMU.

Right now I'm loving the short cut other people's work gave me ;)

Thanks,

Jonathan
 

> -corey
> 
> > 
> > Jonathan
> > 
> > 
> >   
> > >   
> > > > 
> > > > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > > ---
> > > >  hw/arm/Kconfig        |  1 +
> > > >  hw/arm/virt.c         | 77 +++++++++++++++++++++++++++++++++++++++++++
> > > >  include/hw/arm/virt.h |  2 ++
> > > >  3 files changed, 80 insertions(+)
> > > > 
> > > > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > > > index 219262a8da..4a733298cd 100644
> > > > --- a/hw/arm/Kconfig
> > > > +++ b/hw/arm/Kconfig
> > > > @@ -30,6 +30,7 @@ config ARM_VIRT
> > > >      select ACPI_VIOT
> > > >      select VIRTIO_MEM_SUPPORTED
> > > >      select ACPI_CXL
> > > > +    select I2C_MCTP_CXL_FMAPI
> > > >  
> > > >  config CHEETAH
> > > >      bool
> > > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > > index d818131b57..ea04279515 100644
> > > > --- a/hw/arm/virt.c
> > > > +++ b/hw/arm/virt.c
> > > > @@ -80,6 +80,9 @@
> > > >  #include "hw/char/pl011.h"
> > > >  #include "hw/cxl/cxl.h"
> > > >  #include "qemu/guest-random.h"
> > > > +#include "hw/i2c/i2c.h"
> > > > +#include "hw/i2c/aspeed_i2c.h"
> > > > +#include "hw/misc/i2c_mctp_cxl_fmapi.h"
> > > >  
> > > >  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
> > > >      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> > > > @@ -156,6 +159,8 @@ static const MemMapEntry base_memmap[] = {
> > > >      [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
> > > >      [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
> > > >      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
> > > > +    [VIRT_I2C] =                { 0x0b000000, 0x00004000 },
> > > > +    [VIRT_RESET_FAKE] =         { 0x0b004000, 0x00000010 },
> > > >      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
> > > >      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> > > >      [VIRT_SECURE_MEM] =         { 0x0e000000, 0x01000000 },
> > > > @@ -192,6 +197,7 @@ static const int a15irqmap[] = {
> > > >      [VIRT_GPIO] = 7,
> > > >      [VIRT_SECURE_UART] = 8,
> > > >      [VIRT_ACPI_GED] = 9,
> > > > +    [VIRT_I2C] = 10,
> > > >      [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
> > > >      [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
> > > >      [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
> > > > @@ -1996,6 +2002,75 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
> > > >      }
> > > >  }
> > > >  
> > > > +static void create_mctp_test(MachineState *ms)
> > > > +{
> > > > +    VirtMachineState *vms = VIRT_MACHINE(ms);
> > > > +    MemoryRegion *sysmem = get_system_memory();
> > > > +    AspeedI2CState *aspeedi2c;
> > > > +    struct DeviceState  *dev;
> > > > +    char *nodename_i2c_master;
> > > > +    char *nodename_i2c_sub;
> > > > +    char *nodename_reset;
> > > > +    uint32_t clk_phandle, reset_phandle;
> > > > +    MemoryRegion *sysmem2;
> > > > +   
> > > > +    dev = qdev_new("aspeed.i2c-ast2600");
> > > > +    aspeedi2c = ASPEED_I2C(dev);
> > > > +    object_property_set_link(OBJECT(dev), "dram", OBJECT(ms->ram), &error_fatal);
> > > > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > > > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_I2C].base);
> > > > +    sysbus_connect_irq(SYS_BUS_DEVICE(&aspeedi2c->busses[0]), 0, qdev_get_gpio_in(vms->gic, vms->irqmap[VIRT_I2C]));
> > > > +
> > > > +    /* I2C bus DT */
> > > > +    reset_phandle = qemu_fdt_alloc_phandle(ms->fdt);
> > > > +    nodename_reset = g_strdup_printf("/reset@%" PRIx64, vms->memmap[VIRT_RESET_FAKE].base);
> > > > +    qemu_fdt_add_subnode(ms->fdt, nodename_reset);
> > > > +    qemu_fdt_setprop_string(ms->fdt, nodename_reset, "compatible", "snps,dw-low-reset");
> > > > +    qemu_fdt_setprop_sized_cells(ms->fdt, nodename_reset, "reg",
> > > > +                                 2, vms->memmap[VIRT_RESET_FAKE].base,
> > > > +                                 2, vms->memmap[VIRT_RESET_FAKE].size);
> > > > +    qemu_fdt_setprop_cell(ms->fdt, nodename_reset, "#reset-cells", 0x1);
> > > > +    qemu_fdt_setprop_cell(ms->fdt, nodename_reset, "phandle", reset_phandle);
> > > > +    sysmem2 =  g_new(MemoryRegion, 1);
> > > > +    memory_region_init_ram(sysmem2, NULL, "reset", vms->memmap[VIRT_RESET_FAKE].size, NULL);
> > > > +    memory_region_add_subregion(sysmem, vms->memmap[VIRT_RESET_FAKE].base, sysmem2);
> > > > +    
> > > > +    clk_phandle = qemu_fdt_alloc_phandle(ms->fdt);
> > > > +    
> > > > +    qemu_fdt_add_subnode(ms->fdt, "/mclk");
> > > > +    qemu_fdt_setprop_string(ms->fdt, "/mclk", "compatible", "fixed-clock");
> > > > +    qemu_fdt_setprop_cell(ms->fdt, "/mclk", "#clock-cells", 0x0);
> > > > +    qemu_fdt_setprop_cell(ms->fdt, "/mclk", "clock-frequency", 24000);
> > > > +    qemu_fdt_setprop_string(ms->fdt, "/mclk", "clock-output-names", "bobsclk");
> > > > +    qemu_fdt_setprop_cell(ms->fdt, "/mclk", "phandle", clk_phandle);
> > > > +
> > > > +    nodename_i2c_master = g_strdup_printf("/i2c@%" PRIx64, vms->memmap[VIRT_I2C].base);
> > > > +    qemu_fdt_add_subnode(ms->fdt, nodename_i2c_master);
> > > > +    qemu_fdt_setprop_string(ms->fdt, nodename_i2c_master, "compatible",  "aspeed,ast2600-i2c-bus");
> > > > +    qemu_fdt_setprop_cells(ms->fdt, nodename_i2c_master, "multi-master");
> > > > +    qemu_fdt_setprop_cell(ms->fdt, nodename_i2c_master, "#size-cells", 0);
> > > > +    qemu_fdt_setprop_cell(ms->fdt, nodename_i2c_master, "#address-cells", 1);
> > > > +    qemu_fdt_setprop_cell(ms->fdt, nodename_i2c_master, "clocks", clk_phandle);
> > > > +    qemu_fdt_setprop_string(ms->fdt, nodename_i2c_master, "clock-names", "bobsclk");
> > > > +    qemu_fdt_setprop(ms->fdt, nodename_i2c_master, "mctp-controller", NULL, 0);
> > > > +    qemu_fdt_setprop_cells(ms->fdt, nodename_i2c_master, "interrupts", GIC_FDT_IRQ_TYPE_SPI,
> > > > +                           vms->irqmap[VIRT_I2C], GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> > > > +    /* Offset to the first bus is 0x80, next one at 0x100 etc */
> > > > +    qemu_fdt_setprop_sized_cells(ms->fdt, nodename_i2c_master, "reg",
> > > > +                                 2, vms->memmap[VIRT_I2C].base + 0x80,
> > > > +                                 2, 0x80);
> > > > +    qemu_fdt_setprop_cells(ms->fdt, nodename_i2c_master, "resets", reset_phandle,  0);
> > > > +
> > > > +    nodename_i2c_sub = g_strdup_printf("/i2c@%" PRIx64 "/mctp@%" PRIx64, vms->memmap[VIRT_I2C].base, 0x50l);
> > > > +    qemu_fdt_add_subnode(ms->fdt, nodename_i2c_sub);
> > > > +    qemu_fdt_setprop_string(ms->fdt, nodename_i2c_sub, "compatible",  "mctp-i2c-controller");
> > > > +    qemu_fdt_setprop_sized_cells(ms->fdt, nodename_i2c_sub, "reg", 1, 0x50 | 0x40000000);
> > > > +
> > > > +        
> > > > +    /* Slave device - linux doesn't use the presence of dt node for this so don't create one*/
> > > > +    i2c_slave_create_simple(aspeed_i2c_get_bus(aspeedi2c, 0), "i2c_mctp_cxl_switch", 0x4d);
> > > > +}
> > > > +
> > > >  static void machvirt_init(MachineState *machine)
> > > >  {
> > > >      VirtMachineState *vms = VIRT_MACHINE(machine);
> > > > @@ -2289,6 +2364,8 @@ static void machvirt_init(MachineState *machine)
> > > >          create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
> > > >      }
> > > >  
> > > > +    create_mctp_test(machine);
> > > > +
> > > >       /* connect powerdown request */
> > > >       vms->powerdown_notifier.notify = virt_powerdown_req;
> > > >       qemu_register_powerdown_notifier(&vms->powerdown_notifier);
> > > > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > > > index 67c08a62af..abbfac7c48 100644
> > > > --- a/include/hw/arm/virt.h
> > > > +++ b/include/hw/arm/virt.h
> > > > @@ -71,6 +71,8 @@ enum {
> > > >      VIRT_SMMU,
> > > >      VIRT_UART,
> > > >      VIRT_MMIO,
> > > > +    VIRT_I2C,
> > > > +    VIRT_RESET_FAKE,
> > > >      VIRT_RTC,
> > > >      VIRT_FW_CFG,
> > > >      VIRT_PCIE,
> > > > -- 
> > > > 2.32.0
> > > >     
> >   


