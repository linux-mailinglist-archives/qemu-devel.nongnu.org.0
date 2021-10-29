Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EACD43FC28
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 14:19:33 +0200 (CEST)
Received: from localhost ([::1]:47826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgQr5-0006il-Qu
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 08:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgQmw-0005no-V4
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 08:15:14 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:43038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgQmn-000728-LD
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 08:15:14 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 91FDA755FE6;
 Fri, 29 Oct 2021 14:15:00 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 55409746333; Fri, 29 Oct 2021 14:15:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 53DE27462D3;
 Fri, 29 Oct 2021 14:15:00 +0200 (CEST)
Date: Fri, 29 Oct 2021 14:15:00 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 06/23] hw/char/sh_serial: QOM-ify
In-Reply-To: <3a630845-7f67-7b45-db14-c72dc67c5b26@amsat.org>
Message-ID: <4198235-e93d-ddde-fb63-edfe9bd422f4@eik.bme.hu>
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <3208b60a33e3452b832089aecd5c1aed800eb6bc.1635449225.git.balaton@eik.bme.hu>
 <3a630845-7f67-7b45-db14-c72dc67c5b26@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-135064130-1635509700=:48739"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-135064130-1635509700=:48739
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 29 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/28/21 21:27, BALATON Zoltan wrote:
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/char/sh_serial.c | 107 +++++++++++++++++++++++++++-----------------
>>  hw/sh4/sh7750.c     |  62 ++++++++++++++++++-------
>>  include/hw/sh4/sh.h |   9 +---
>>  3 files changed, 114 insertions(+), 64 deletions(-)
>
>> +OBJECT_DECLARE_SIMPLE_TYPE(SHSerialState, SH_SERIAL)
>> +
>> +struct SHSerialState {
>> +    SysBusDevice parent;
> [...]
>> -} SHSerialState;
>> +};
>> +
>> +typedef struct {} SHSerialStateClass;
>
> OBJECT_DECLARE_TYPE()?

From include/qom/object.h:
  * OBJECT_DECLARE_SIMPLE_TYPE:
[...]
  * This does the same as OBJECT_DECLARE_TYPE(), but with no class struct
  * declared.
  *
  * This macro should be used unless the class struct needs to have
  * virtual methods declared.

I think we're rather missing OBJECT_DEFINE_SIMPLE_TYPE. A lot of current 
object definitions are open coded because of that and could be replaced if 
we had that simple variant but we don't, so this is the shortest way for 
now.

>> -void sh_serial_init(MemoryRegion *sysmem,
>> -                    hwaddr base, int feat,
>> -                    uint32_t freq, Chardev *chr,
>> -                    qemu_irq eri_source,
>> -                    qemu_irq rxi_source,
>> -                    qemu_irq txi_source,
>> -                    qemu_irq tei_source,
>> -                    qemu_irq bri_source)
>> +static void sh_serial_reset(DeviceState *dev)
>
> Can you extract sh_serial_reset() in a previous patch?

I could.

>>  {
>> -    SHSerialState *s = g_malloc0(sizeof(*s));
>> +    SHSerialState *s = SH_SERIAL(dev);
>>
>> -    s->feat = feat;
>>      s->flags = SH_SERIAL_FLAG_TEND | SH_SERIAL_FLAG_TDE;
>>      s->rtrg = 1;
>>
>> @@ -397,38 +396,64 @@ void sh_serial_init(MemoryRegion *sysmem,
>>      s->scr = 1 << 5; /* pretend that TX is enabled so early printk works */
>>      s->sptr = 0;
>>
>> -    if (feat & SH_SERIAL_FEAT_SCIF) {
>> +    if (s->feat & SH_SERIAL_FEAT_SCIF) {
>>          s->fcr = 0;
>>      } else {
>>          s->dr = 0xff;
>>      }
>>
>>      sh_serial_clear_fifo(s);
>> +}
>>
>> -    memory_region_init_io(&s->iomem, NULL, &sh_serial_ops, s,
>> -                          "serial", 0x100000000ULL);
>
> Keep that, ...
>
>> -    memory_region_init_alias(&s->iomem_p4, NULL, "serial-p4", &s->iomem,
>> -                             0, 0x28);
>> -    memory_region_add_subregion(sysmem, P4ADDR(base), &s->iomem_p4);
>> -
>> -    memory_region_init_alias(&s->iomem_a7, NULL, "serial-a7", &s->iomem,
>> -                             0, 0x28);
>> -    memory_region_add_subregion(sysmem, A7ADDR(base), &s->iomem_a7);
>
> ... and these lines become one single sysbus_init_mmio() ...

Not sure about that. The device doesn't really have two io regions, they 
just appear twice due to how the CPU maps them. So I'd keep a single MMIO 
region here but could map one directly and use only one alias for the 
other instead. (That would get rid of either serial-a7 or serial-p4 with 
the other just called serial or actually sci/scif after this series).

Regards,
BALATON Zoltan

>> -
>> -    if (chr) {
>> -        qemu_chr_fe_init(&s->chr, chr, &error_abort);
>> +static void sh_serial_realize(DeviceState *d, Error **errp)
>> +{
>> +    SHSerialState *s = SH_SERIAL(d);
>> +    MemoryRegion *iomem = g_malloc(sizeof(*iomem));
>> +
>> +    assert(d->id);
>> +    memory_region_init_io(iomem, OBJECT(d), &sh_serial_ops, s, d->id, 0x28);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(d), iomem);
>> +    qdev_init_gpio_out_named(d, &s->eri, "eri", 1);
>> +    qdev_init_gpio_out_named(d, &s->rxi, "rxi", 1);
>> +    qdev_init_gpio_out_named(d, &s->txi, "txi", 1);
>> +    qdev_init_gpio_out_named(d, &s->tei, "tei", 1);
>> +    qdev_init_gpio_out_named(d, &s->bri, "bri", 1);
>> +
>> +    if (qemu_chr_fe_backend_connected(&s->chr)) {
>>          qemu_chr_fe_set_handlers(&s->chr, sh_serial_can_receive1,
>>                                   sh_serial_receive1,
>>                                   sh_serial_event, NULL, s, NULL, true);
>>      }
>>
>> -    s->fifo_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>> -                                         sh_serial_timeout_int, s);
>> +    timer_init_ns(&s->fifo_timeout_timer, QEMU_CLOCK_VIRTUAL,
>> +                  sh_serial_timeout_int, s);
>>      s->etu = NANOSECONDS_PER_SECOND / 9600;
>> -    s->eri = eri_source;
>> -    s->rxi = rxi_source;
>> -    s->txi = txi_source;
>> -    s->tei = tei_source;
>> -    s->bri = bri_source;
>> +}
>
>> @@ -762,6 +766,9 @@ static const MemoryRegionOps sh7750_mmct_ops = {
>>  SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
>>  {
>>      SH7750State *s;
>> +    DeviceState *dev;
>> +    SysBusDevice *sb;
>> +    MemoryRegion *mr, *alias;
>>
>>      s = g_malloc0(sizeof(SH7750State));
>>      s->cpu = cpu;
>> @@ -807,21 +814,46 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
>>
>>      cpu->env.intc_handle = &s->intc;
>>
>> -    sh_serial_init(sysmem, 0x1fe00000,
>> -                   0, s->periph_freq, serial_hd(0),
>> -                   s->intc.irqs[SCI1_ERI],
>> -                   s->intc.irqs[SCI1_RXI],
>> -                   s->intc.irqs[SCI1_TXI],
>> -                   s->intc.irqs[SCI1_TEI],
>> -                   NULL);
>> -    sh_serial_init(sysmem, 0x1fe80000,
>> -                   SH_SERIAL_FEAT_SCIF,
>> -                   s->periph_freq, serial_hd(1),
>> -                   s->intc.irqs[SCIF_ERI],
>> -                   s->intc.irqs[SCIF_RXI],
>> -                   s->intc.irqs[SCIF_TXI],
>> -                   NULL,
>> -                   s->intc.irqs[SCIF_BRI]);
>> +    /* SCI */
>> +    dev = qdev_new(TYPE_SH_SERIAL);
>> +    dev->id = (char *)"sci";
>> +    qdev_prop_set_chr(dev, "chardev", serial_hd(0));
>> +    sb = SYS_BUS_DEVICE(dev);
>> +    sysbus_realize_and_unref(sb, &error_fatal);
>> +    mr = sysbus_mmio_get_region(sb, 0);
>> +    alias = g_malloc(sizeof(*alias));
>> +    memory_region_init_alias(alias, OBJECT(dev), "sci-p4", mr,
>> +                             0, memory_region_size(mr));
>> +    memory_region_add_subregion(sysmem, P4ADDR(0x1fe00000), alias);
>> +    alias = g_malloc(sizeof(*alias));
>> +    memory_region_init_alias(alias, OBJECT(dev), "sci-a7", mr,
>> +                             0, memory_region_size(mr));
>> +    memory_region_add_subregion(sysmem, A7ADDR(0x1fe00000), alias);
>
> ... then you can replace the aliases by 2 sysbus_mmio_map() calls.
>
>> +    qdev_connect_gpio_out_named(dev, "eri", 0, s->intc.irqs[SCI1_ERI]);
>> +    qdev_connect_gpio_out_named(dev, "rxi", 0, s->intc.irqs[SCI1_RXI]);
>> +    qdev_connect_gpio_out_named(dev, "txi", 0, s->intc.irqs[SCI1_TXI]);
>> +    qdev_connect_gpio_out_named(dev, "tei", 0, s->intc.irqs[SCI1_TEI]);
>> +
>> +    /* SCIF */
>> +    dev = qdev_new(TYPE_SH_SERIAL);
>> +    dev->id =  (char *)"scif";
>> +    qdev_prop_set_chr(dev, "chardev", serial_hd(1));
>> +    qdev_prop_set_uint8(dev, "features", SH_SERIAL_FEAT_SCIF);
>> +    sb = SYS_BUS_DEVICE(dev);
>> +    sysbus_realize_and_unref(sb, &error_fatal);
>> +    mr = sysbus_mmio_get_region(sb, 0);
>> +    alias = g_malloc(sizeof(*alias));
>> +    memory_region_init_alias(alias, OBJECT(dev), "scif-p4", mr,
>> +                             0, memory_region_size(mr));
>> +    memory_region_add_subregion(sysmem, P4ADDR(0x1fe80000), alias);
>> +    alias = g_malloc(sizeof(*alias));
>> +    memory_region_init_alias(alias, OBJECT(dev), "scif-a7", mr,
>> +                             0, memory_region_size(mr));
>> +    memory_region_add_subregion(sysmem, A7ADDR(0x1fe80000), alias);
>> +    qdev_connect_gpio_out_named(dev, "eri", 0, s->intc.irqs[SCIF_ERI]);
>> +    qdev_connect_gpio_out_named(dev, "rxi", 0, s->intc.irqs[SCIF_RXI]);
>> +    qdev_connect_gpio_out_named(dev, "txi", 0, s->intc.irqs[SCIF_TXI]);
>> +    qdev_connect_gpio_out_named(dev, "bri", 0, s->intc.irqs[SCIF_BRI]);
>>
>
>
--3866299591-135064130-1635509700=:48739--

