Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCF53381F5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:56:14 +0100 (CET)
Received: from localhost ([::1]:44618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKVA5-0000Qh-Dc
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKV4h-0001mz-RA; Thu, 11 Mar 2021 18:50:41 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKV4f-0005tm-Ne; Thu, 11 Mar 2021 18:50:39 -0500
Received: by mail-wr1-x42a.google.com with SMTP id v4so765880wrp.13;
 Thu, 11 Mar 2021 15:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ULK0Bm14kfoBdw6RHp3ya6ueUaQoCOudhXQ5vLfnqWc=;
 b=fGj317hMdNYim3EfySOEpyYfozvHk/z9xOeLSDzbKrWHMei8eNsZ5wgOYlYbL2Ho3W
 Y2S6PNnmdTq/C3HvlwHHKEOgYzYvUGF8qxHa/4rl7ciMcuG+dCTItLWIvaE5mgOZGSg3
 xxJLHNEX2byB7/dZzOs5YqYbD/XAOkDNPnWRmrmLy3n20HBfRPBbGaR8uQvBveChWdWy
 dKbi1wlhre3ey4wDEI31ULVv5D5jJzB1H2eYu3/EffERm/Ev09n0cWa8hfoFel0w2kNN
 8fZQ7PFJmqZk7O0qJ+NKbzTXAlEBpzs74kiMPKoaIoEnrIqSYNnKpxTd7LBGUh4C9qY6
 ud6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ULK0Bm14kfoBdw6RHp3ya6ueUaQoCOudhXQ5vLfnqWc=;
 b=dMGBRbiiyBs2jE7ynn75VzGfCjl62MK6fTzFJaF9LVUZXnmsHi91EBs/6/8GH7LvnK
 aCU28eMTdjlcwhub/LQT/Oc99YNyvNa6c+KFasVdy9dRk3CMuNZ8bDOaFZ6fm1VkS2jg
 b6kEf6Ne0vBIPQHlb2T1PNP2hnYRwDau3wcURoOZ4usAP/YXRq3oNG8bUoxKcqbK3ZE4
 xTmgRWXNyIfxfUBCyxv/+oja4Tu2qgaEvSRdgZ5QYyzW3lQhVVy0FNBJHnyx3V8u1OdA
 IlMgC5zAWCLcJe3qq1z/EGlT3x7swTyZrFJDqxKw7jsZQk05tK3gipNgoZlwL2N8eYUt
 z97A==
X-Gm-Message-State: AOAM533D7tNU9xRWaEHzuq6ikhuLBNkY1ri1TiLqwJHsKb9IOj3WtYWL
 0/7WFK1YIb/c1mPNKAwLqrs=
X-Google-Smtp-Source: ABdhPJzalCNAWIIfHTLLX6mPZdFJfT+96ypB151e0jwCU8eMM0KRb2Hk8tR4sktnjO7jG0nBDNDa/Q==
X-Received: by 2002:a05:6000:181b:: with SMTP id
 m27mr11370722wrh.363.1615506635623; 
 Thu, 11 Mar 2021 15:50:35 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z13sm5732100wrh.65.2021.03.11.15.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 15:50:35 -0800 (PST)
Subject: Re: [PATCH v7 2/8] vt82c686: QOM-ify superio related functionality
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1615345138.git.balaton@eik.bme.hu>
 <f8e8d80ee6f5ff7cfe6522c9ef6ddcc16db35a92.1615345138.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5f591429-69df-fd29-6ed8-83d1dbe38afc@amsat.org>
Date: Fri, 12 Mar 2021 00:50:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f8e8d80ee6f5ff7cfe6522c9ef6ddcc16db35a92.1615345138.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 3:58 AM, BALATON Zoltan wrote:
> Collect superio functionality and its controlling config registers
> handling in an abstract VIA_SUPERIO class that is a subclass of
> ISA_SUPERIO and put vt82c686b specific parts in a subclass of this
> abstract class.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c         | 242 ++++++++++++++++++++++++--------------
>  include/hw/isa/vt82c686.h |   1 -
>  2 files changed, 152 insertions(+), 91 deletions(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index a3353ec5db..e89dbf43da 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -249,12 +249,21 @@ static const TypeInfo vt8231_pm_info = {
>  };
>  
>  
> -typedef struct SuperIOConfig {
> +#define TYPE_VIA_SUPERIO "via-superio"
> +OBJECT_DECLARE_SIMPLE_TYPE(ViaSuperIOState, VIA_SUPERIO)
> +
> +struct ViaSuperIOState {
> +    ISASuperIODevice superio;
>      uint8_t regs[0x100];
> +    const MemoryRegionOps *io_ops;
>      MemoryRegion io;
> -    ISASuperIODevice *superio;
>      MemoryRegion *serial_io[SUPERIO_MAX_SERIAL_PORTS];
> -} SuperIOConfig;
> +};
> +
> +static inline void via_superio_io_enable(ViaSuperIOState *s, bool enable)
> +{
> +    memory_region_set_enabled(&s->io, enable);
> +}
>  
>  static MemoryRegion *find_subregion(ISADevice *d, MemoryRegion *parent,
>                                      int offs)
> @@ -270,10 +279,78 @@ static MemoryRegion *find_subregion(ISADevice *d, MemoryRegion *parent,
>      return mr;
>  }
>  
> -static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
> -                              unsigned size)
> +static void via_superio_realize(DeviceState *d, Error **errp)
> +{
> +    ViaSuperIOState *s = VIA_SUPERIO(d);
> +    ISASuperIOClass *ic = ISA_SUPERIO_GET_CLASS(s);
> +    Error *local_err = NULL;
> +    int i;
> +
> +    assert(s->io_ops);
> +    ic->parent_realize(d, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +    /* Grab io regions of serial devices so we can control them */
> +    for (i = 0; i < ic->serial.count; i++) {
> +        ISADevice *sd = s->superio.serial[i];
> +        MemoryRegion *io = isa_address_space_io(sd);
> +        MemoryRegion *mr = find_subregion(sd, io, sd->ioport_id);
> +        if (!mr) {
> +            error_setg(errp, "Could not get io region for serial %d", i);
> +            return;
> +        }
> +        s->serial_io[i] = mr;

Don't we need to memory_region_ref(mr) here?

> +    }
> +
> +    memory_region_init_io(&s->io, OBJECT(d), s->io_ops, s, "via-superio", 2);
> +    memory_region_set_enabled(&s->io, false);
> +    /* The floppy also uses 0x3f0 and 0x3f1 but this seems to work anyway */
> +    memory_region_add_subregion(isa_address_space_io(ISA_DEVICE(s)), 0x3f0,
> +                                &s->io);
> +}
> +
> +static uint64_t via_superio_cfg_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    ViaSuperIOState *sc = opaque;
> +    uint8_t idx = sc->regs[0];
> +    uint8_t val = sc->regs[idx];
> +
> +    if (addr == 0) {
> +        return idx;
> +    }
> +    if (addr == 1 && idx == 0) {
> +        val = 0; /* reading reg 0 where we store index value */
> +    }
> +    trace_via_superio_read(idx, val);
> +    return val;
> +}
> +
> +static void via_superio_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
> +
> +    sc->parent_realize = dc->realize;
> +    dc->realize = via_superio_realize;
> +}
> +
> +static const TypeInfo via_superio_info = {
> +    .name          = TYPE_VIA_SUPERIO,
> +    .parent        = TYPE_ISA_SUPERIO,
> +    .instance_size = sizeof(ViaSuperIOState),
> +    .class_size    = sizeof(ISASuperIOClass),
> +    .class_init    = via_superio_class_init,
> +    .abstract      = true,
> +};
> +
> +#define TYPE_VT82C686B_SUPERIO "vt82c686b-superio"
> +
> +static void vt82c686b_superio_cfg_write(void *opaque, hwaddr addr,
> +                                        uint64_t data, unsigned size)
>  {
> -    SuperIOConfig *sc = opaque;
> +    ViaSuperIOState *sc = opaque;
>      uint8_t idx = sc->regs[0];
>  
>      if (addr == 0) { /* config index register */
> @@ -295,29 +372,29 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
>      case 0xfd ... 0xff:
>          /* ignore write to read only registers */
>          return;
> -    case 0xe2:
> +    case 0xe2: /* Function select */
>      {
>          data &= 0x1f;
>          if (data & BIT(2)) { /* Serial port 1 enable */
> -            ISADevice *dev = sc->superio->serial[0];
> +            ISADevice *dev = sc->superio.serial[0];
>              if (!memory_region_is_mapped(sc->serial_io[0])) {
>                  memory_region_add_subregion(isa_address_space_io(dev),
>                                              dev->ioport_id, sc->serial_io[0]);
>              }
>          } else {
> -            MemoryRegion *io = isa_address_space_io(sc->superio->serial[0]);
> +            MemoryRegion *io = isa_address_space_io(sc->superio.serial[0]);
>              if (memory_region_is_mapped(sc->serial_io[0])) {
>                  memory_region_del_subregion(io, sc->serial_io[0]);
>              }
>          }
>          if (data & BIT(3)) { /* Serial port 2 enable */
> -            ISADevice *dev = sc->superio->serial[1];
> +            ISADevice *dev = sc->superio.serial[1];
>              if (!memory_region_is_mapped(sc->serial_io[1])) {
>                  memory_region_add_subregion(isa_address_space_io(dev),
>                                              dev->ioport_id, sc->serial_io[1]);
>              }
>          } else {
> -            MemoryRegion *io = isa_address_space_io(sc->superio->serial[1]);
> +            MemoryRegion *io = isa_address_space_io(sc->superio.serial[1]);
>              if (memory_region_is_mapped(sc->serial_io[1])) {
>                  memory_region_del_subregion(io, sc->serial_io[1]);
>              }
> @@ -327,7 +404,7 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
>      case 0xe7: /* Serial port 1 io base address */
>      {
>          data &= 0xfe;
> -        sc->superio->serial[0]->ioport_id = data << 2;
> +        sc->superio.serial[0]->ioport_id = data << 2;
>          if (memory_region_is_mapped(sc->serial_io[0])) {
>              memory_region_set_address(sc->serial_io[0], data << 2);
>          }
> @@ -336,7 +413,7 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
>      case 0xe8: /* Serial port 2 io base address */
>      {
>          data &= 0xfe;
> -        sc->superio->serial[1]->ioport_id = data << 2;
> +        sc->superio.serial[1]->ioport_id = data << 2;
>          if (memory_region_is_mapped(sc->serial_io[1])) {
>              memory_region_set_address(sc->serial_io[1], data << 2);
>          }
> @@ -350,25 +427,9 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
>      sc->regs[idx] = data;
>  }
>  
> -static uint64_t superio_cfg_read(void *opaque, hwaddr addr, unsigned size)
> -{
> -    SuperIOConfig *sc = opaque;
> -    uint8_t idx = sc->regs[0];
> -    uint8_t val = sc->regs[idx];
> -
> -    if (addr == 0) {
> -        return idx;
> -    }
> -    if (addr == 1 && idx == 0) {
> -        val = 0; /* reading reg 0 where we store index value */
> -    }
> -    trace_via_superio_read(idx, val);
> -    return val;
> -}
> -
> -static const MemoryRegionOps superio_cfg_ops = {
> -    .read = superio_cfg_read,
> -    .write = superio_cfg_write,
> +static const MemoryRegionOps vt82c686b_superio_cfg_ops = {
> +    .read = via_superio_cfg_read,
> +    .write = vt82c686b_superio_cfg_write,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>      .impl = {
>          .min_access_size = 1,
> @@ -376,13 +437,66 @@ static const MemoryRegionOps superio_cfg_ops = {
>      },
>  };
>  
> +static void vt82c686b_superio_reset(DeviceState *dev)
> +{
> +    ViaSuperIOState *s = VIA_SUPERIO(dev);
> +
> +    memset(s->regs, 0, sizeof(s->regs));
> +    /* Device ID */
> +    vt82c686b_superio_cfg_write(s, 0, 0xe0, 1);
> +    vt82c686b_superio_cfg_write(s, 1, 0x3c, 1);
> +    /* Function select - all disabled */
> +    vt82c686b_superio_cfg_write(s, 0, 0xe2, 1);
> +    vt82c686b_superio_cfg_write(s, 1, 0x03, 1);
> +    /* Floppy ctrl base addr */
> +    vt82c686b_superio_cfg_write(s, 0, 0xe3, 1);
> +    vt82c686b_superio_cfg_write(s, 1, 0xfc, 1);
> +    /* Parallel port base addr */
> +    vt82c686b_superio_cfg_write(s, 0, 0xe6, 1);
> +    vt82c686b_superio_cfg_write(s, 1, 0xde, 1);
> +    /* Serial port 1 base addr */
> +    vt82c686b_superio_cfg_write(s, 0, 0xe7, 1);
> +    vt82c686b_superio_cfg_write(s, 1, 0xfe, 1);
> +    /* Serial port 2 base addr */
> +    vt82c686b_superio_cfg_write(s, 0, 0xe8, 1);
> +    vt82c686b_superio_cfg_write(s, 1, 0xbe, 1);
> +
> +    vt82c686b_superio_cfg_write(s, 0, 0, 1);
> +}
> +
> +static void vt82c686b_superio_init(Object *obj)
> +{
> +    VIA_SUPERIO(obj)->io_ops = &vt82c686b_superio_cfg_ops;
> +}
> +
> +static void vt82c686b_superio_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
> +
> +    dc->reset = vt82c686b_superio_reset;
> +    sc->serial.count = 2;
> +    sc->parallel.count = 1;
> +    sc->ide.count = 0; /* emulated by via-ide */
> +    sc->floppy.count = 1;
> +}
> +
> +static const TypeInfo vt82c686b_superio_info = {
> +    .name          = TYPE_VT82C686B_SUPERIO,
> +    .parent        = TYPE_VIA_SUPERIO,
> +    .instance_size = sizeof(ViaSuperIOState),
> +    .instance_init = vt82c686b_superio_init,
> +    .class_size    = sizeof(ISASuperIOClass),
> +    .class_init    = vt82c686b_superio_class_init,
> +};
> +
>  
>  OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
>  
>  struct VT82C686BISAState {
>      PCIDevice dev;
>      qemu_irq cpu_intr;
> -    SuperIOConfig superio_cfg;
> +    ViaSuperIOState *via_sio;
>  };
>  
>  static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
> @@ -400,7 +514,7 @@ static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
>      pci_default_write_config(d, addr, val, len);
>      if (addr == 0x85) {
>          /* BIT(1): enable or disable superio config io ports */
> -        memory_region_set_enabled(&s->superio_cfg.io, val & BIT(1));
> +        via_superio_io_enable(s->via_sio, val & BIT(1));
>      }
>  }
>  
> @@ -432,13 +546,6 @@ static void vt82c686b_isa_reset(DeviceState *dev)
>      pci_conf[0x5a] = 0x04; /* KBC/RTC Control*/
>      pci_conf[0x5f] = 0x04;
>      pci_conf[0x77] = 0x10; /* GPIO Control 1/2/3/4 */
> -
> -    s->superio_cfg.regs[0xe0] = 0x3c; /* Device ID */
> -    s->superio_cfg.regs[0xe2] = 0x03; /* Function select */
> -    s->superio_cfg.regs[0xe3] = 0xfc; /* Floppy ctrl base addr */
> -    s->superio_cfg.regs[0xe6] = 0xde; /* Parallel port base addr */
> -    s->superio_cfg.regs[0xe7] = 0xfe; /* Serial port 1 base addr */
> -    s->superio_cfg.regs[0xe8] = 0xbe; /* Serial port 2 base addr */
>  }
>  
>  static void vt82c686b_realize(PCIDevice *d, Error **errp)
> @@ -447,7 +554,6 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
>      DeviceState *dev = DEVICE(d);
>      ISABus *isa_bus;
>      qemu_irq *isa_irq;
> -    ISASuperIOClass *ic;
>      int i;
>  
>      qdev_init_gpio_out(dev, &s->cpu_intr, 1);
> @@ -457,9 +563,8 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
>      isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
>      i8254_pit_init(isa_bus, 0x40, 0, NULL);
>      i8257_dma_init(isa_bus, 0);
> -    s->superio_cfg.superio = ISA_SUPERIO(isa_create_simple(isa_bus,
> -                                                      TYPE_VT82C686B_SUPERIO));
> -    ic = ISA_SUPERIO_GET_CLASS(s->superio_cfg.superio);
> +    s->via_sio = VIA_SUPERIO(isa_create_simple(isa_bus,
> +                                               TYPE_VT82C686B_SUPERIO));
>      mc146818_rtc_init(isa_bus, 2000, NULL);
>  
>      for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
> @@ -467,31 +572,6 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
>              d->wmask[i] = 0;
>          }
>      }
> -
> -    memory_region_init_io(&s->superio_cfg.io, OBJECT(d), &superio_cfg_ops,
> -                          &s->superio_cfg, "superio_cfg", 2);
> -    memory_region_set_enabled(&s->superio_cfg.io, false);
> -    /*
> -     * The floppy also uses 0x3f0 and 0x3f1.
> -     * But we do not emulate a floppy, so just set it here.
> -     */
> -    memory_region_add_subregion(isa_bus->address_space_io, 0x3f0,
> -                                &s->superio_cfg.io);
> -
> -    /* Grab io regions of serial devices so we can control them */
> -    for (i = 0; i < ic->serial.count; i++) {
> -        ISADevice *sd = s->superio_cfg.superio->serial[i];
> -        MemoryRegion *io = isa_address_space_io(sd);
> -        MemoryRegion *mr = find_subregion(sd, io, sd->ioport_id);
> -        if (!mr) {
> -            error_setg(errp, "Could not get io region for serial %d", i);
> -            return;
> -        }
> -        s->superio_cfg.serial_io[i] = mr;
> -        if (memory_region_is_mapped(mr)) {
> -            memory_region_del_subregion(io, mr);
> -        }
> -    }
>  }
>  
>  static void via_class_init(ObjectClass *klass, void *data)
> @@ -527,32 +607,14 @@ static const TypeInfo via_info = {
>  };
>  
>  
> -static void vt82c686b_superio_class_init(ObjectClass *klass, void *data)
> -{
> -    ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
> -
> -    sc->serial.count = 2;
> -    sc->parallel.count = 1;
> -    sc->ide.count = 0;
> -    sc->floppy.count = 1;
> -}
> -
> -static const TypeInfo via_superio_info = {
> -    .name          = TYPE_VT82C686B_SUPERIO,
> -    .parent        = TYPE_ISA_SUPERIO,
> -    .instance_size = sizeof(ISASuperIODevice),
> -    .class_size    = sizeof(ISASuperIOClass),
> -    .class_init    = vt82c686b_superio_class_init,
> -};
> -
> -
>  static void vt82c686b_register_types(void)
>  {
>      type_register_static(&via_pm_info);
>      type_register_static(&vt82c686b_pm_info);
>      type_register_static(&vt8231_pm_info);
> -    type_register_static(&via_info);
>      type_register_static(&via_superio_info);
> +    type_register_static(&vt82c686b_superio_info);
> +    type_register_static(&via_info);
>  }
>  
>  type_init(vt82c686b_register_types)
> diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
> index 9b6d610e83..0692b9a527 100644
> --- a/include/hw/isa/vt82c686.h
> +++ b/include/hw/isa/vt82c686.h
> @@ -2,7 +2,6 @@
>  #define HW_VT82C686_H
>  
>  #define TYPE_VT82C686B_ISA "vt82c686b-isa"
> -#define TYPE_VT82C686B_SUPERIO "vt82c686b-superio"
>  #define TYPE_VT82C686B_PM "vt82c686b-pm"
>  #define TYPE_VT8231_PM "vt8231-pm"
>  #define TYPE_VIA_AC97 "via-ac97"
> 

