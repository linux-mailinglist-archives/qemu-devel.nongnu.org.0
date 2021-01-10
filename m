Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3732F0482
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 01:22:36 +0100 (CET)
Received: from localhost ([::1]:45088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyOV9-0004Wo-Oa
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 19:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyOU1-00046Y-Ht
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 19:21:25 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyOTz-0002zd-TQ
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 19:21:25 -0500
Received: by mail-wr1-x429.google.com with SMTP id 91so12574689wrj.7
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 16:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QkZFdnRrN33KUXGV6NgCvE2JsfF5imlfuwUH83WbLQ0=;
 b=sZ5q29eMoM75CjFt2sRmoTatXO7zA2ozs1Bt3esZac2Wd1BKQ7HW5fmPb7tqAqNZq1
 8r8Q8bcz9mXpOPpxV2lG2n1P0Ek6MnBe9Scmnds3dkE9Dj9bErhW97F+xxQ8TgHhggVc
 RZ47gX9l/U6OepF7GWYcWVFYzgMDdvx0UNgBtj6d/YFcengHqw5vsl4QBBvQnJiHkNLS
 GcKo5z7l7A597OjvXZ/y++Ik7spau6A4YUj4EAsml1cHaYt/4Yp0/pqGs6/MCo1Hpg+3
 Z4XpVWBIWwhB5iHS+HTHx7JuHU/Xyodotr9qFFLQHbm/joW1LxMwXqJ728vKiPekUUsw
 osKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QkZFdnRrN33KUXGV6NgCvE2JsfF5imlfuwUH83WbLQ0=;
 b=CkILuFXNoMB6hAMgObXIrraK6CsbaIVwGIHYW36LQO8s7+7PNckyUaIrjOaZymZU3v
 7g/KyyzOt9+G/08BGS1p2u/Oq73OJy+k5f8RcikNc7ePFmSBxSakw9/AxFUGXYg9EieS
 ID8SFHuoF1bs1ZmqURItkjaY2yrWd7RcxwNBTw2PhNDcwHNlRbCxObnXPReGISJ/HDBa
 mNfyXpSkkhfJntkbOIbIv0T7vAjO8BlSVEqgWchAUXszabUaypKCtIGYcJrnWpUBzLEj
 vM76sls1k6fx9Y+VfLL8K1r/ouvAidw8JuyyZekfgGKEdZPDAEtGSk+FrqsOxLrQ5VnY
 O3gw==
X-Gm-Message-State: AOAM530dsnxOqHWcp8fDuG7eLqbB8udtg7dtghur0Q21G8x7G24yL8cT
 XMYovlUK6a0hOyK+/EcXSHU=
X-Google-Smtp-Source: ABdhPJwuJc/E45HgclHrqOufZNnAxx0H35gpbR2aCh3tFTUGckqc4uvbbXeOG0V9qwiS6EpYu8dtxw==
X-Received: by 2002:a5d:6502:: with SMTP id x2mr10137882wru.254.1610238082341; 
 Sat, 09 Jan 2021 16:21:22 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id g5sm19218001wro.60.2021.01.09.16.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Jan 2021 16:21:21 -0800 (PST)
Subject: Re: [PATCH v2 08/13] vt82c686: Move creation of ISA devices to the
 ISA bridge
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <bf9400cc8e4ddd3129aa5678de4d3cf38384805f.1610223397.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f77d6471-d19d-a1c2-e447-18181d55ba86@amsat.org>
Date: Sun, 10 Jan 2021 01:21:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <bf9400cc8e4ddd3129aa5678de4d3cf38384805f.1610223397.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.255,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zoltan,

On 1/9/21 9:16 PM, BALATON Zoltan wrote:
> Currently the ISA devices that are part of the VIA south bridge,
> superio chip are wired up by board code. Move creation of these ISA
> devices to the VIA ISA bridge model so that board code does not need
> to access ISA bus. This also allows vt82c686b-superio to be made
> internal to vt82c686 which allows implementing its configuration via
> registers in subseqent commits.

Is this patch dependent of the VT82C686B_PM changes
or can it be applied before them?

> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c   | 20 ++++++++++++++++++++
>  hw/mips/fuloong2e.c | 29 +++++------------------------
>  2 files changed, 25 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 58c0bba1d0..5df9be8ff4 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -16,6 +16,11 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/isa/isa.h"
>  #include "hw/isa/superio.h"
> +#include "hw/intc/i8259.h"
> +#include "hw/irq.h"
> +#include "hw/dma/i8257.h"
> +#include "hw/timer/i8254.h"
> +#include "hw/rtc/mc146818rtc.h"
>  #include "migration/vmstate.h"
>  #include "hw/isa/apm.h"
>  #include "hw/acpi/acpi.h"
> @@ -307,9 +312,16 @@ OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
>  
>  struct VT82C686BISAState {
>      PCIDevice dev;
> +    qemu_irq cpu_intr;
>      SuperIOConfig superio_cfg;
>  };
>  
> +static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
> +{
> +    VT82C686BISAState *s = opaque;
> +    qemu_set_irq(s->cpu_intr, level);
> +}
> +
>  static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
>                                     uint32_t val, int len)
>  {
> @@ -365,10 +377,18 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
>      VT82C686BISAState *s = VT82C686B_ISA(d);
>      DeviceState *dev = DEVICE(d);
>      ISABus *isa_bus;
> +    qemu_irq *isa_irq;
>      int i;
>  
> +    qdev_init_gpio_out(dev, &s->cpu_intr, 1);

Why not use the SysBus API?

> +    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
>      isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
>                            &error_fatal);

Isn't it get_system_memory() -> pci_address_space(d)?

> +    isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
> +    i8254_pit_init(isa_bus, 0x40, 0, NULL);
> +    i8257_dma_init(isa_bus, 0);
> +    isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
> +    mc146818_rtc_init(isa_bus, 2000, NULL);
>  
>      for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
>          if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index fbdd6122b3..0fc3288556 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -25,9 +25,6 @@
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "hw/clock.h"
> -#include "hw/intc/i8259.h"
> -#include "hw/dma/i8257.h"
> -#include "hw/isa/superio.h"
>  #include "net/net.h"
>  #include "hw/boards.h"
>  #include "hw/i2c/smbus_eeprom.h"
> @@ -38,13 +35,13 @@
>  #include "qemu/log.h"
>  #include "hw/loader.h"
>  #include "hw/ide/pci.h"
> +#include "hw/qdev-properties.h"
>  #include "elf.h"
>  #include "hw/isa/vt82c686.h"
> -#include "hw/rtc/mc146818rtc.h"
> -#include "hw/timer/i8254.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/reset.h"
> +#include "sysemu/sysemu.h"
>  #include "qemu/error-report.h"
>  
>  #define ENVP_PADDR              0x2000
> @@ -224,26 +221,13 @@ static void main_cpu_reset(void *opaque)
>  }
>  
>  static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
> -                                       I2CBus **i2c_bus, ISABus **p_isa_bus)
> +                                       I2CBus **i2c_bus)
>  {
> -    qemu_irq *i8259;
> -    ISABus *isa_bus;
>      PCIDevice *dev;
>  
>      dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
>                                            TYPE_VT82C686B_ISA);
> -    isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(dev), "isa.0"));
> -    assert(isa_bus);
> -    *p_isa_bus = isa_bus;
> -    /* Interrupt controller */
> -    /* The 8259 -> IP5  */
> -    i8259 = i8259_init(isa_bus, intc);
> -    isa_bus_irqs(isa_bus, i8259);
> -    /* init other devices */
> -    i8254_pit_init(isa_bus, 0x40, 0, NULL);
> -    i8257_dma_init(isa_bus, 0);
> -    /* Super I/O */
> -    isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
> +    qdev_connect_gpio_out(DEVICE(dev), 0, intc);
>  
>      dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
>      pci_ide_create_devs(dev);
> @@ -290,7 +274,6 @@ static void mips_fuloong2e_init(MachineState *machine)
>      uint64_t kernel_entry;
>      PCIDevice *pci_dev;
>      PCIBus *pci_bus;
> -    ISABus *isa_bus;
>      I2CBus *smbus;
>      Clock *cpuclk;
>      MIPSCPU *cpu;
> @@ -357,7 +340,7 @@ static void mips_fuloong2e_init(MachineState *machine)
>  
>      /* South bridge -> IP5 */
>      vt82c686b_southbridge_init(pci_bus, FULOONG2E_VIA_SLOT, env->irq[5],
> -                               &smbus, &isa_bus);
> +                               &smbus);
>  
>      /* GPU */
>      if (vga_interface_type != VGA_NONE) {
> @@ -372,8 +355,6 @@ static void mips_fuloong2e_init(MachineState *machine)
>      spd_data = spd_data_generate(DDR, machine->ram_size);
>      smbus_eeprom_init_one(smbus, 0x50, spd_data);
>  
> -    mc146818_rtc_init(isa_bus, 2000, NULL);
> -
>      /* Network card: RTL8139D */
>      network_init(pci_bus);
>  }
> 

