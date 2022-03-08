Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0A84D124E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 09:33:42 +0100 (CET)
Received: from localhost ([::1]:36822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRVHp-0006r1-II
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 03:33:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRVGW-0006Aa-6t
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:32:20 -0500
Received: from [2001:41c9:1:41f::167] (port=34184
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRVGT-0000ct-N1
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:32:19 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRVFl-0004QK-Mj; Tue, 08 Mar 2022 08:31:37 +0000
Message-ID: <e8648e1d-d1dd-cde5-b8af-214a346e24a7@ilande.co.uk>
Date: Tue, 8 Mar 2022 08:32:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-31-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220308072005.307955-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 30/33] hw/intc: Vectored Interrupt Controller (VIC)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/2022 07:20, Richard Henderson wrote:

> From: Amir Gonnen <amir.gonnen@neuroblade.ai>
> 
> Implement nios2 Vectored Interrupt Controller (VIC).
> VIC is connected to EIC. It needs to update rha, ril, rrs and rnmi
> fields on Nios2CPU before raising an IRQ.
> For that purpose, VIC has a "cpu" property which should refer to the
> nios2 cpu and set by the board that connects VIC.
> 
> Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
> Message-Id: <20220303153906.2024748-5-amir.gonnen@neuroblade.ai>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/intc/nios2_vic.c | 341 ++++++++++++++++++++++++++++++++++++++++++++
>   hw/intc/Kconfig     |   3 +
>   hw/intc/meson.build |   1 +
>   3 files changed, 345 insertions(+)
>   create mode 100644 hw/intc/nios2_vic.c
> 
> diff --git a/hw/intc/nios2_vic.c b/hw/intc/nios2_vic.c
> new file mode 100644
> index 0000000000..b59d3f6f4c
> --- /dev/null
> +++ b/hw/intc/nios2_vic.c
> @@ -0,0 +1,341 @@
> +/*
> + * Vectored Interrupt Controller for nios2 processor
> + *
> + * Copyright (c) 2022 Neuroblade
> + *
> + * Interface:
> + * QOM property "cpu": link to the Nios2 CPU (must be set)
> + * Unnamed GPIO inputs 0..NIOS2_VIC_MAX_IRQ-1: input IRQ lines
> + * IRQ should be connected to nios2 IRQ0.
> + *
> + * Reference: "Embedded Peripherals IP User Guide
> + *             for Intel® Quartus® Prime Design Suite: 21.4"
> + * Chapter 38 "Vectored Interrupt Controller Core"
> + * See: https://www.intel.com/content/www/us/en/docs/programmable/683130/21-4/vectored-interrupt-controller-core.html
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/sysbus.h"
> +#include "migration/vmstate.h"
> +#include "qapi/error.h"
> +#include "qemu/bitops.h"
> +#include "qemu/log.h"
> +#include "qom/object.h"
> +#include "cpu.h"
> +
> +#define TYPE_NIOS2_VIC "nios2-vic"
> +
> +OBJECT_DECLARE_SIMPLE_TYPE(Nios2Vic, NIOS2_VIC)
> +
> +#define NIOS2_VIC_MAX_IRQ 32
> +
> +enum {
> +    INT_CONFIG0 = 0,
> +    INT_CONFIG31 = 31,
> +    INT_ENABLE = 32,
> +    INT_ENABLE_SET = 33,
> +    INT_ENABLE_CLR = 34,
> +    INT_PENDING = 35,
> +    INT_RAW_STATUS = 36,
> +    SW_INTERRUPT = 37,
> +    SW_INTERRUPT_SET = 38,
> +    SW_INTERRUPT_CLR = 39,
> +    VIC_CONFIG = 40,
> +    VIC_STATUS = 41,
> +    VEC_TBL_BASE = 42,
> +    VEC_TBL_ADDR = 43,
> +    CSR_COUNT /* Last! */
> +};
> +
> +struct Nios2Vic {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    qemu_irq output_int;
> +
> +    /* properties */
> +    CPUState *cpu;
> +    MemoryRegion csr;
> +
> +    uint32_t int_config[32];

Is this NIOS2_VIC_MAX_IRQ?

> +    uint32_t vic_config;
> +    uint32_t int_raw_status;
> +    uint32_t int_enable;
> +    uint32_t sw_int;
> +    uint32_t vic_status;
> +    uint32_t vec_tbl_base;
> +    uint32_t vec_tbl_addr;
> +};

I think it's worth splitting the type section above into a separate 
include/hw/intc/nios2_vic.h header for completeness, plus it will allow you to use 
TYPE_NIOS2_VIC later in patch 33.

> +/* Requested interrupt level (INT_CONFIG[0:5]) */
> +static inline uint32_t vic_int_config_ril(const Nios2Vic *vic, int irq_num)
> +{
> +    return extract32(vic->int_config[irq_num], 0, 6);
> +}
> +
> +/* Requested NMI (INT_CONFIG[6]) */
> +static inline uint32_t vic_int_config_rnmi(const Nios2Vic *vic, int irq_num)
> +{
> +    return extract32(vic->int_config[irq_num], 6, 1);
> +}
> +
> +/* Requested register set (INT_CONFIG[7:12]) */
> +static inline uint32_t vic_int_config_rrs(const Nios2Vic *vic, int irq_num)
> +{
> +    return extract32(vic->int_config[irq_num], 7, 6);
> +}
> +
> +static inline uint32_t vic_config_vec_size(const Nios2Vic *vic)
> +{
> +    return 1 << (2 + extract32(vic->vic_config, 0, 3));
> +}
> +
> +static inline uint32_t vic_int_pending(const Nios2Vic *vic)
> +{
> +    return (vic->int_raw_status | vic->sw_int) & vic->int_enable;
> +}
> +
> +static void vic_update_irq(Nios2Vic *vic)
> +{
> +    Nios2CPU *cpu = NIOS2_CPU(vic->cpu);
> +    uint32_t pending = vic_int_pending(vic);
> +    int irq = -1;
> +    int max_ril = 0;
> +    /* Note that if RIL is 0 for an interrupt it is effectively disabled */
> +
> +    vic->vec_tbl_addr = 0;
> +    vic->vic_status = 0;
> +
> +    if (pending == 0) {
> +        qemu_irq_lower(vic->output_int);
> +        return;
> +    }
> +
> +    for (int i = 0; i < NIOS2_VIC_MAX_IRQ; i++) {
> +        if (pending & BIT(i)) {
> +            int ril = vic_int_config_ril(vic, i);
> +            if (ril > max_ril) {
> +                irq = i;
> +                max_ril = ril;
> +            }
> +        }
> +    }
> +
> +    if (irq < 0) {
> +        qemu_irq_lower(vic->output_int);
> +        return;
> +    }
> +
> +    vic->vec_tbl_addr = irq * vic_config_vec_size(vic) + vic->vec_tbl_base;
> +    vic->vic_status = irq | BIT(31);
> +
> +    /*
> +     * In hardware, the interface between the VIC and the CPU is via the
> +     * External Interrupt Controller interface, where the interrupt controller
> +     * presents the CPU with a packet of data containing:
> +     *  - Requested Handler Address (RHA): 32 bits
> +     *  - Requested Register Set (RRS) : 6 bits
> +     *  - Requested Interrupt Level (RIL) : 6 bits
> +     *  - Requested NMI flag (RNMI) : 1 bit
> +     * In our emulation, we implement this by writing the data directly to
> +     * fields in the CPU object and then raising the IRQ line to tell
> +     * the CPU that we've done so.
> +     */
> +
> +    cpu->rha = vic->vec_tbl_addr;
> +    cpu->ril = max_ril;
> +    cpu->rrs = vic_int_config_rrs(vic, irq);
> +    cpu->rnmi = vic_int_config_rnmi(vic, irq);
> +
> +    qemu_irq_raise(vic->output_int);
> +}
> +
> +static void vic_set_irq(void *opaque, int irq_num, int level)
> +{
> +    Nios2Vic *vic = opaque;
> +
> +    if (level) {
> +        vic->int_raw_status |= BIT(irq_num);
> +    } else {
> +        vic->int_raw_status &= ~BIT(irq_num);
> +    }
> +
> +    vic_update_irq(vic);
> +}
> +
> +static void nios2_vic_reset(DeviceState *dev)
> +{
> +    Nios2Vic *vic = NIOS2_VIC(dev);
> +    memset(&vic->int_config, 0, sizeof(vic->int_config));
> +    vic->vic_config = 0;
> +    vic->int_raw_status = 0;
> +    vic->int_enable = 0;
> +    vic->sw_int = 0;
> +    vic->vic_status = 0;
> +    vic->vec_tbl_base = 0;
> +    vic->vec_tbl_addr = 0;
> +}
> +
> +static uint64_t nios2_vic_csr_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    Nios2Vic *vic = opaque;
> +    int index = offset / 4;
> +
> +    switch (index) {
> +    case INT_CONFIG0 ... INT_CONFIG31:
> +        return vic->int_config[index - INT_CONFIG0];
> +    case INT_ENABLE:
> +        return vic->int_enable;
> +    case INT_PENDING:
> +        return vic_int_pending(vic);
> +    case INT_RAW_STATUS:
> +        return vic->int_raw_status;
> +    case SW_INTERRUPT:
> +        return vic->sw_int;
> +    case VIC_CONFIG:
> +        return vic->vic_config;
> +    case VIC_STATUS:
> +        return vic->vic_status;
> +    case VEC_TBL_BASE:
> +        return vic->vec_tbl_base;
> +    case VEC_TBL_ADDR:
> +        return vic->vec_tbl_addr;
> +    default:
> +        return 0;
> +    }
> +}
> +
> +static void nios2_vic_csr_write(void *opaque, hwaddr offset, uint64_t value,
> +                                unsigned size)
> +{
> +    Nios2Vic *vic = opaque;
> +    int index = offset / 4;
> +
> +    switch (index) {
> +    case INT_CONFIG0 ... INT_CONFIG31:
> +        vic->int_config[index - INT_CONFIG0] = value;
> +        break;
> +    case INT_ENABLE:
> +        vic->int_enable = value;
> +        break;
> +    case INT_ENABLE_SET:
> +        vic->int_enable |= value;
> +        break;
> +    case INT_ENABLE_CLR:
> +        vic->int_enable &= ~value;
> +        break;
> +    case SW_INTERRUPT:
> +        vic->sw_int = value;
> +        break;
> +    case SW_INTERRUPT_SET:
> +        vic->sw_int |= value;
> +        break;
> +    case SW_INTERRUPT_CLR:
> +        vic->sw_int &= ~value;
> +        break;
> +    case VIC_CONFIG:
> +        vic->vic_config = value;
> +        break;
> +    case VEC_TBL_BASE:
> +        vic->vec_tbl_base = value;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "nios2-vic: write to invalid CSR address 0x%x\n", (int)offset);
> +    }
> +
> +    vic_update_irq(vic);
> +}
> +
> +static const MemoryRegionOps nios2_vic_csr_ops = {
> +    .read = nios2_vic_csr_read,
> +    .write = nios2_vic_csr_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = { .min_access_size = 4, .max_access_size = 4 }
> +};
> +
> +static void nios2_vic_realize(DeviceState *dev, Error **errp)
> +{
> +    Nios2Vic *vic = NIOS2_VIC(dev);
> +
> +    if (!vic->cpu) {
> +        /* This is a programming error in the code using this device */
> +        error_setg(errp, "nios2-vic 'cpu' link property was not set");
> +        return;
> +    }
> +
> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &vic->output_int);
> +    qdev_init_gpio_in(dev, vic_set_irq, NIOS2_VIC_MAX_IRQ);
> +
> +    memory_region_init_io(&vic->csr, OBJECT(dev), &nios2_vic_csr_ops, vic,
> +                          "nios2.vic.csr", CSR_COUNT * sizeof(uint32_t));
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &vic->csr);
> +}
> +
> +static Property nios2_vic_properties[] = {
> +    DEFINE_PROP_LINK("cpu", Nios2Vic, cpu, TYPE_CPU, CPUState *),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
> +static const VMStateDescription nios2_vic_vmstate = {
> +    .name = "nios2-vic",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]){
> +        VMSTATE_UINT32_ARRAY(int_config, Nios2Vic, 32),

And also NIOS2_VIC_MAX_IRQ here?

> +        VMSTATE_UINT32(vic_config, Nios2Vic),
> +        VMSTATE_UINT32(int_raw_status, Nios2Vic),
> +        VMSTATE_UINT32(int_enable, Nios2Vic),
> +        VMSTATE_UINT32(sw_int, Nios2Vic),
> +        VMSTATE_UINT32(vic_status, Nios2Vic),
> +        VMSTATE_UINT32(vec_tbl_base, Nios2Vic),
> +        VMSTATE_UINT32(vec_tbl_addr, Nios2Vic),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +static void nios2_vic_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->reset = nios2_vic_reset;
> +    dc->realize = nios2_vic_realize;
> +    dc->vmsd = &nios2_vic_vmstate;
> +    device_class_set_props(dc, nios2_vic_properties);
> +}
> +
> +static const TypeInfo nios2_vic_info = {
> +    .name = TYPE_NIOS2_VIC,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(Nios2Vic),
> +    .class_init = nios2_vic_class_init,
> +};
> +
> +static void nios2_vic_register_types(void)
> +{
> +    type_register_static(&nios2_vic_info);
> +}
> +
> +type_init(nios2_vic_register_types);
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index ec8d4cec29..eeb2d6f428 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -84,3 +84,6 @@ config GOLDFISH_PIC
>   
>   config M68K_IRQC
>       bool
> +
> +config NIOS2_VIC
> +    bool
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 81ccdb0d78..167755ac64 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -62,3 +62,4 @@ specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
>   		if_true: files('spapr_xive_kvm.c'))
>   specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
>   specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
> +specific_ss.add(when: 'CONFIG_NIOS2_VIC', if_true: files('nios2_vic.c'))

Otherwise seems okay to me.


ATB,

Mark.

