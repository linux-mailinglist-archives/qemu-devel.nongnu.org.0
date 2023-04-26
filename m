Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AEB6EEBF8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 03:39:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prU6p-0007lQ-Lb; Tue, 25 Apr 2023 21:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1prU6n-0007l5-9s
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 21:38:13 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1prU6l-0001Mw-8A
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 21:38:13 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8Bx6emAgEhkLc8AAA--.1491S3;
 Wed, 26 Apr 2023 09:38:08 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxjb5_gEhk5d47AA--.15602S3; 
 Wed, 26 Apr 2023 09:38:07 +0800 (CST)
Subject: Re: [PATCH 1/3] hw/loongarch/virt: Modify ipi as percpu device
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, maobibo@loongson.cn,
 yangxiaojuan@loongson.cn
References: <20230406100052.3355632-1-gaosong@loongson.cn>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <651b388a-b641-d1db-d658-603a95433eb7@loongson.cn>
Date: Wed, 26 Apr 2023 09:38:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20230406100052.3355632-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Dxjb5_gEhk5d47AA--.15602S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKF47CF1kuF4UuFWDWrW5GFg_yoW7Kw4Dpr
 y7uF93WrW8WFn7Xwn7GasxWr1DG3WxCF129a1akryIkF42gryjvr1Iyr1qqa4UA34kJr1Y
 vry8uFy2q3WDZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j1q2_UUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-1.422, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ping ~

ÔÚ 2023/4/6 ÏÂÎç6:00, Song Gao Ð´µÀ:
> ipi is used to communicate between cpus, this patch modified
> loongarch ipi device as percpu deivce, so that there are
> 2 MemoryRegions with ipi device, rather than 2*cpus
> MemoryRegions, which may be large than QDEV_MAX_MMIO if
> more cpus are added on loongarch virt machine.
>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/loongarch_ipi.c         | 32 ++++++++++----------------------
>   hw/loongarch/virt.c             | 12 ++++++------
>   include/hw/intc/loongarch_ipi.h | 10 ++++------
>   include/hw/loongarch/virt.h     |  1 -
>   4 files changed, 20 insertions(+), 35 deletions(-)
>
> diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
> index aa4bf9eb74..0563d83a35 100644
> --- a/hw/intc/loongarch_ipi.c
> +++ b/hw/intc/loongarch_ipi.c
> @@ -201,27 +201,17 @@ static const MemoryRegionOps loongarch_ipi64_ops = {
>   
>   static void loongarch_ipi_init(Object *obj)
>   {
> -    int cpu;
> -    LoongArchMachineState *lams;
>       LoongArchIPI *s = LOONGARCH_IPI(obj);
>       SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> -    Object *machine = qdev_get_machine();
> -    ObjectClass *mc = object_get_class(machine);
> -    /* 'lams' should be initialized */
> -    if (!strcmp(MACHINE_CLASS(mc)->name, "none")) {
> -        return;
> -    }
> -    lams = LOONGARCH_MACHINE(machine);
> -    for (cpu = 0; cpu < MAX_IPI_CORE_NUM; cpu++) {
> -        memory_region_init_io(&s->ipi_iocsr_mem[cpu], obj, &loongarch_ipi_ops,
> -                            &lams->ipi_core[cpu], "loongarch_ipi_iocsr", 0x48);
> -        sysbus_init_mmio(sbd, &s->ipi_iocsr_mem[cpu]);
>   
> -        memory_region_init_io(&s->ipi64_iocsr_mem[cpu], obj, &loongarch_ipi64_ops,
> -                              &lams->ipi_core[cpu], "loongarch_ipi64_iocsr", 0x118);
> -        sysbus_init_mmio(sbd, &s->ipi64_iocsr_mem[cpu]);
> -        qdev_init_gpio_out(DEVICE(obj), &lams->ipi_core[cpu].irq, 1);
> -    }
> +    memory_region_init_io(&s->ipi_iocsr_mem, obj, &loongarch_ipi_ops,
> +                          &s->ipi_core, "loongarch_ipi_iocsr", 0x48);
> +    sysbus_init_mmio(sbd, &s->ipi_iocsr_mem);
> +
> +    memory_region_init_io(&s->ipi64_iocsr_mem, obj, &loongarch_ipi64_ops,
> +                          &s->ipi_core, "loongarch_ipi64_iocsr", 0x118);
> +    sysbus_init_mmio(sbd, &s->ipi64_iocsr_mem);
> +    qdev_init_gpio_out(DEVICE(obj), &s->ipi_core.irq, 1);
>   }
>   
>   static const VMStateDescription vmstate_ipi_core = {
> @@ -233,7 +223,7 @@ static const VMStateDescription vmstate_ipi_core = {
>           VMSTATE_UINT32(en, IPICore),
>           VMSTATE_UINT32(set, IPICore),
>           VMSTATE_UINT32(clear, IPICore),
> -        VMSTATE_UINT32_ARRAY(buf, IPICore, MAX_IPI_MBX_NUM * 2),
> +        VMSTATE_UINT32_ARRAY(buf, IPICore, 2),
>           VMSTATE_END_OF_LIST()
>       }
>   };
> @@ -243,9 +233,7 @@ static const VMStateDescription vmstate_loongarch_ipi = {
>       .version_id = 0,
>       .minimum_version_id = 0,
>       .fields = (VMStateField[]) {
> -        VMSTATE_STRUCT_ARRAY(ipi_core, LoongArchMachineState,
> -                             MAX_IPI_CORE_NUM, 0,
> -                             vmstate_ipi_core, IPICore),
> +        VMSTATE_STRUCT(ipi_core, LoongArchIPI, 0, vmstate_ipi_core, IPICore),
>           VMSTATE_END_OF_LIST()
>       }
>   };
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index f4bf14c1c8..c8a01b1fb6 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -565,9 +565,6 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
>       CPUState *cpu_state;
>       int cpu, pin, i, start, num;
>   
> -    ipi = qdev_new(TYPE_LOONGARCH_IPI);
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(ipi), &error_fatal);
> -
>       extioi = qdev_new(TYPE_LOONGARCH_EXTIOI);
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(extioi), &error_fatal);
>   
> @@ -598,15 +595,18 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
>           lacpu = LOONGARCH_CPU(cpu_state);
>           env = &(lacpu->env);
>   
> +        ipi = qdev_new(TYPE_LOONGARCH_IPI);
> +        sysbus_realize_and_unref(SYS_BUS_DEVICE(ipi), &error_fatal);
> +
>           /* connect ipi irq to cpu irq */
> -        qdev_connect_gpio_out(ipi, cpu, qdev_get_gpio_in(cpudev, IRQ_IPI));
> +        qdev_connect_gpio_out(ipi, 0, qdev_get_gpio_in(cpudev, IRQ_IPI));
>           /* IPI iocsr memory region */
>           memory_region_add_subregion(&env->system_iocsr, SMP_IPI_MAILBOX,
>                                       sysbus_mmio_get_region(SYS_BUS_DEVICE(ipi),
> -                                    cpu * 2));
> +                                    0));
>           memory_region_add_subregion(&env->system_iocsr, MAIL_SEND_ADDR,
>                                       sysbus_mmio_get_region(SYS_BUS_DEVICE(ipi),
> -                                    cpu * 2 + 1));
> +                                    1));
>           /* extioi iocsr memory region */
>           memory_region_add_subregion(&env->system_iocsr, APIC_BASE,
>                                   sysbus_mmio_get_region(SYS_BUS_DEVICE(extioi),
> diff --git a/include/hw/intc/loongarch_ipi.h b/include/hw/intc/loongarch_ipi.h
> index 0ee48fca55..664e050b92 100644
> --- a/include/hw/intc/loongarch_ipi.h
> +++ b/include/hw/intc/loongarch_ipi.h
> @@ -28,9 +28,6 @@
>   #define MAIL_SEND_OFFSET      0
>   #define ANY_SEND_OFFSET       (IOCSR_ANY_SEND - IOCSR_MAIL_SEND)
>   
> -#define MAX_IPI_CORE_NUM      4
> -#define MAX_IPI_MBX_NUM       4
> -
>   #define TYPE_LOONGARCH_IPI "loongarch_ipi"
>   OBJECT_DECLARE_SIMPLE_TYPE(LoongArchIPI, LOONGARCH_IPI)
>   
> @@ -40,14 +37,15 @@ typedef struct IPICore {
>       uint32_t set;
>       uint32_t clear;
>       /* 64bit buf divide into 2 32bit buf */
> -    uint32_t buf[MAX_IPI_MBX_NUM * 2];
> +    uint32_t buf[2];
>       qemu_irq irq;
>   } IPICore;
>   
>   struct LoongArchIPI {
>       SysBusDevice parent_obj;
> -    MemoryRegion ipi_iocsr_mem[MAX_IPI_CORE_NUM];
> -    MemoryRegion ipi64_iocsr_mem[MAX_IPI_CORE_NUM];
> +    MemoryRegion ipi_iocsr_mem;
> +    MemoryRegion ipi64_iocsr_mem;
> +    IPICore ipi_core;
>   };
>   
>   #endif
> diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
> index 7ae8a91229..54a9f595bb 100644
> --- a/include/hw/loongarch/virt.h
> +++ b/include/hw/loongarch/virt.h
> @@ -36,7 +36,6 @@ struct LoongArchMachineState {
>       /*< private >*/
>       MachineState parent_obj;
>   
> -    IPICore ipi_core[MAX_IPI_CORE_NUM];
>       MemoryRegion lowmem;
>       MemoryRegion highmem;
>       MemoryRegion isa_io;


