Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83F74405ED
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:54:48 +0200 (CEST)
Received: from localhost ([::1]:57640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbhv-0007TC-TK
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgbY5-0003f5-Ar
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:44:37 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:49877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgbY3-0005Pv-Ey
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:44:37 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D1B2F7475FA;
 Sat, 30 Oct 2021 01:44:33 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 914DD746333; Sat, 30 Oct 2021 01:44:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8FD1A7462D3;
 Sat, 30 Oct 2021 01:44:33 +0200 (CEST)
Date: Sat, 30 Oct 2021 01:44:33 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 13/30] hw/char/sh_serial: QOM-ify
In-Reply-To: <ffe5a75a-5f65-473f-9e0d-43d238819d6a@amsat.org>
Message-ID: <5264acf5-866c-f6e3-3447-f63969cbf2f@eik.bme.hu>
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <92902ba34fdf2c8c62232365fbb6531b1036d557.1635541329.git.balaton@eik.bme.hu>
 <ffe5a75a-5f65-473f-9e0d-43d238819d6a@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1337596300-1635551073=:5796"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1337596300-1635551073=:5796
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 30 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/29/21 23:02, BALATON Zoltan wrote:
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/char/sh_serial.c | 98 +++++++++++++++++++++++++++------------------
>>  hw/sh4/sh7750.c     | 56 +++++++++++++++++++-------
>>  include/hw/sh4/sh.h |  9 +----
>>  3 files changed, 101 insertions(+), 62 deletions(-)
>
>> -void sh_serial_init(MemoryRegion *sysmem,
>> -                    hwaddr base, int feat,
>> -                    uint32_t freq, Chardev *chr,
>> -                    qemu_irq eri_source,
>> -                    qemu_irq rxi_source,
>> -                    qemu_irq txi_source,
>> -                    qemu_irq tei_source,
>> -                    qemu_irq bri_source)
>> +static void sh_serial_realize(DeviceState *d, Error **errp)
>>  {
>> -    SHSerialState *s = g_malloc0(sizeof(*s));
>> -
>> -    s->feat = feat;
>> -    sh_serial_reset(s);
>> -
>> -    memory_region_init_io(&s->iomem, NULL, &sh_serial_ops, s,
>> -                          "serial", 0x100000000ULL);
>> -
>> -    memory_region_init_alias(&s->iomem_p4, NULL, "serial-p4", &s->iomem,
>> -                             0, 0x28);
>> -    memory_region_add_subregion(sysmem, P4ADDR(base), &s->iomem_p4);
>> -
>> -    memory_region_init_alias(&s->iomem_a7, NULL, "serial-a7", &s->iomem,
>> -                             0, 0x28);
>> -    memory_region_add_subregion(sysmem, A7ADDR(base), &s->iomem_a7);
>> -
>> -    if (chr) {
>> -        qemu_chr_fe_init(&s->chr, chr, &error_abort);
>> +    SHSerialState *s = SH_SERIAL(d);
>> +    MemoryRegion *iomem = g_malloc(sizeof(*iomem));
>> +
>> +    assert(d->id);
>
> DeviceRealize() takes a Error* parameter... But well since this is
> not user_creatable I suppose it is understandable enough.

Yes, my view is that assert is to note programmer error and error is to 
report user error and since this is an internal object of the SH model 
which is not user creatable that's why I put assert here.

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
>> @@ -435,9 +432,32 @@ void sh_serial_init(MemoryRegion *sysmem,
>>      timer_init_ns(&s->fifo_timeout_timer, QEMU_CLOCK_VIRTUAL,
>>                    sh_serial_timeout_int, s);
>>      s->etu = NANOSECONDS_PER_SECOND / 9600;
>> -    s->eri = eri_source;
>> -    s->rxi = rxi_source;
>> -    s->txi = txi_source;
>> -    s->tei = tei_source;
>> -    s->bri = bri_source;
>> +}
>> +
>> +static void sh_serial_finalize(Object *obj)
>> +{
>> +    SHSerialState *s = SH_SERIAL(obj);
>> +
>> +    timer_del(&s->fifo_timeout_timer);
>> +}
>> +
>> +static void sh_serial_init(Object *obj)
>> +{
>> +}
>> +
>> +static Property sh_serial_properties[] = {
>> +    DEFINE_PROP_CHR("chardev", SHSerialState, chr),
>> +    DEFINE_PROP_UINT8("features", SHSerialState, feat, 0),
>> +    DEFINE_PROP_END_OF_LIST()
>> +};
>> +
>> +static void sh_serial_class_init(ObjectClass *oc, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>> +
>> +    device_class_set_props(dc, sh_serial_properties);
>> +    dc->realize = sh_serial_realize;
>> +    dc->reset = sh_serial_reset;
>> +    /* Reason: part of SuperH CPU/SoC, needs to be wired up */
>> +    dc->user_creatable = false;
>>  }
>> diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
>> index 6c702d627c..7b21f1ce44 100644
>> --- a/hw/sh4/sh7750.c
>> +++ b/hw/sh4/sh7750.c
>> @@ -24,9 +24,13 @@
>>   */
>>
>>  #include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "hw/sysbus.h"
>>  #include "hw/irq.h"
>>  #include "hw/sh4/sh.h"
>>  #include "sysemu/sysemu.h"
>> +#include "hw/qdev-properties.h"
>> +#include "hw/qdev-properties-system.h"
>>  #include "sh7750_regs.h"
>>  #include "sh7750_regnames.h"
>>  #include "hw/sh4/sh_intc.h"
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
>> @@ -807,21 +814,40 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
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
>
> No, this is g_strdup() (freed in device_finalize()).
>
>> +    qdev_prop_set_chr(dev, "chardev", serial_hd(0));
>> +    sb = SYS_BUS_DEVICE(dev);
>> +    sysbus_realize_and_unref(sb, &error_fatal);
>> +    sysbus_mmio_map(sb, 0, 0xffe00000);
>> +    alias = g_malloc(sizeof(*alias));
>> +    mr = sysbus_mmio_get_region(sb, 0);
>> +    memory_region_init_alias(alias, OBJECT(dev), "sci-a7", mr,
>> +                             0, memory_region_size(mr));
>> +    memory_region_add_subregion(sysmem, A7ADDR(0xffe00000), alias);
>> +    qdev_connect_gpio_out_named(dev, "eri", 0, s->intc.irqs[SCI1_ERI]);
>> +    qdev_connect_gpio_out_named(dev, "rxi", 0, s->intc.irqs[SCI1_RXI]);
>> +    qdev_connect_gpio_out_named(dev, "txi", 0, s->intc.irqs[SCI1_TXI]);
>> +    qdev_connect_gpio_out_named(dev, "tei", 0, s->intc.irqs[SCI1_TEI]);
>> +
>> +    /* SCIF */
>> +    dev = qdev_new(TYPE_SH_SERIAL);
>> +    dev->id =  (char *)"scif";
>
> g_strdup()
>
> If you agree I can fix when applying.

Indeed you're right, please fix this up.

Regards,
BALATON Zoltan
--3866299591-1337596300-1635551073=:5796--

