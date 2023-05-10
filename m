Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B946FDB5F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 12:12:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgo0-0004w4-Mk; Wed, 10 May 2023 06:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgny-0004vv-DF
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:12:18 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgnw-0004Zl-IW
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:12:18 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9c9so30193295e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683713535; x=1686305535;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q4wvAPwYgD5Fa1Qs/qwXAAgDudya6Z0cLsc/DJXwNt8=;
 b=FApnGHQcz0rR1aD2k4XGsoGZAWvIJEEvH02EYvfNkNgm1r05KyW5iw83Kl/nrDR6RZ
 QUJAAfMzr50+vVMeepqcWCUgIHvLGqDQCjj/8rXHLOQEDFZxPimMacswtPptJ/zFx6hf
 F62ZeS8LeEuXDLRXJzdw3Bbi3iMKAjmq/H4o42MZLxjfol2kE3Xm1iBOoG0wEqFcBAyJ
 2+6a3s0/u1Dkg7I9Xc7KtFeskRmr7qMUr+R0VVB+BLqF7/ov3SNQfw/1UrwJTFLBivfG
 Intw+y5uyAthEt1KKi3TJG0Cyqkm2QtDq1zV8v9SbTvh6bYs4ew2APezo5RwgZOCWfTa
 0P+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683713535; x=1686305535;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4wvAPwYgD5Fa1Qs/qwXAAgDudya6Z0cLsc/DJXwNt8=;
 b=e7/rcfPYv2I8Zo4BtN7bAZXeGNEZpBt2/IwCUIuMGVX68wxlgZgn0UVAQoQLKr8ELx
 cPRaE7ikSZdpCxEzw4vAu9zZMf9Tp8saEwFsws+U9aN8OTQrJeB2GXsWiR0DDp7SVsgS
 pClY2IAjZAx03nZ43QyLP49Xk4QjiXGbN/Akkwwsfefg/j9BEVgOOffv8hGKSoORxgdT
 uFdHo8pbTL8UK0qeQGCG1b6NCL2MRoFfyZRIs02+0BM8REmHK+xUTQloHapji71TU4u/
 h2tUJuhH4eq30o2dVPMRviRuXcfXYq/yYyUB3GGtnAJrL1d1AacD4o9P0q/f7oQ6PoWs
 rNrg==
X-Gm-Message-State: AC+VfDxtZRPv3slWiTb06Dc8tsZcZ6RT8VrDnrhgJcpszx+GKTyQNeUF
 R8A1EVX25zNjpd+TaOCaVjPIfSq/EKX0oaDPQsqmBQ==
X-Google-Smtp-Source: ACHHUZ4mhXVJk52Cu7r3pIPQ0utErIn3ULBWPjpR+xuCTW10lYXYTmvnOEXTdGByxHbhLneR0izUbQ==
X-Received: by 2002:a5d:42c7:0:b0:306:2b1a:101d with SMTP id
 t7-20020a5d42c7000000b003062b1a101dmr10973373wrr.12.1683713534825; 
 Wed, 10 May 2023 03:12:14 -0700 (PDT)
Received: from [192.168.10.24] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a5d4211000000b002f9e04459desm16914674wrq.109.2023.05.10.03.12.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 03:12:14 -0700 (PDT)
Message-ID: <b9152ff5-b17f-11b0-6aa0-e7a002885ccf@linaro.org>
Date: Wed, 10 May 2023 11:12:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] hw/loongarch/virt: Set max 256 cpus support on
 loongarch virt machine
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, maobibo@loongson.cn, yangxiaojuan@loongson.cn
References: <20230406100052.3355632-1-gaosong@loongson.cn>
 <20230406100052.3355632-3-gaosong@loongson.cn>
 <0d391c88-6749-b1c3-466b-e90d91ada360@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <0d391c88-6749-b1c3-466b-e90d91ada360@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 4/26/23 02:37, Song Gao wrote:
> ping~
> 
> 在 2023/4/6 下午6:00, Song Gao 写道:
>> Add separate macro EXTIOI_CPUS for extioi interrupt controller, extioi
>> only supports 4 cpu. And set macro LOONGARCH_MAX_CPUS as 256 so that
>> loongarch virt machine supports more cpus.
>>
>> Interrupts from external devices can only be routed cpu 0-3 because
>> of extioi limits, cpu internal interrupt such as timer/ipi can be
>> triggered on all cpus.
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   hw/intc/loongarch_extioi.c         |  4 ++--
>>   hw/loongarch/virt.c                | 21 ++++++++++++++-------
>>   include/hw/intc/loongarch_extioi.h | 10 ++++++----
>>   include/hw/loongarch/virt.h        |  2 +-
>>   4 files changed, 23 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

>>
>> diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
>> index 4b8ec3f28a..0e7a3e32f3 100644
>> --- a/hw/intc/loongarch_extioi.c
>> +++ b/hw/intc/loongarch_extioi.c
>> @@ -254,7 +254,7 @@ static const VMStateDescription vmstate_loongarch_extioi = {
>>       .minimum_version_id = 1,
>>       .fields = (VMStateField[]) {
>>           VMSTATE_UINT32_ARRAY(bounce, LoongArchExtIOI, EXTIOI_IRQS_GROUP_COUNT),
>> -        VMSTATE_UINT32_2DARRAY(coreisr, LoongArchExtIOI, LOONGARCH_MAX_VCPUS,
>> +        VMSTATE_UINT32_2DARRAY(coreisr, LoongArchExtIOI, EXTIOI_CPUS,
>>                                  EXTIOI_IRQS_GROUP_COUNT),
>>           VMSTATE_UINT32_ARRAY(nodetype, LoongArchExtIOI,
>>                                EXTIOI_IRQS_NODETYPE_COUNT / 2),
>> @@ -281,7 +281,7 @@ static void loongarch_extioi_instance_init(Object *obj)
>>       qdev_init_gpio_in(DEVICE(obj), extioi_setirq, EXTIOI_IRQS);
>> -    for (cpu = 0; cpu < LOONGARCH_MAX_VCPUS; cpu++) {
>> +    for (cpu = 0; cpu < EXTIOI_CPUS; cpu++) {
>>           memory_region_init_io(&s->extioi_iocsr_mem[cpu], OBJECT(s), &extioi_ops,
>>                                 s, "extioi_iocsr", 0x900);
>>           sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->extioi_iocsr_mem[cpu]);
>> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
>> index c8a01b1fb6..28bb35d614 100644
>> --- a/hw/loongarch/virt.c
>> +++ b/hw/loongarch/virt.c
>> @@ -607,8 +607,13 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
>>           memory_region_add_subregion(&env->system_iocsr, MAIL_SEND_ADDR,
>>                                       sysbus_mmio_get_region(SYS_BUS_DEVICE(ipi),
>>                                       1));
>> -        /* extioi iocsr memory region */
>> -        memory_region_add_subregion(&env->system_iocsr, APIC_BASE,
>> +        /*
>> +     * extioi iocsr memory region
>> +     * only one extioi is added on loongarch virt machine
>> +     * external device interrupt can only be routed to cpu 0-3
>> +     */
>> +    if (cpu < EXTIOI_CPUS)
>> +            memory_region_add_subregion(&env->system_iocsr, APIC_BASE,
>>                                   sysbus_mmio_get_region(SYS_BUS_DEVICE(extioi),
>>                                   cpu));
>>       }
>> @@ -618,10 +623,12 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
>>        * cpu_pin[9:2] <= intc_pin[7:0]
>>        */
>>       for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
>> -        cpudev = DEVICE(qemu_get_cpu(cpu));
>> -        for (pin = 0; pin < LS3A_INTC_IP; pin++) {
>> -            qdev_connect_gpio_out(extioi, (cpu * 8 + pin),
>> -                                  qdev_get_gpio_in(cpudev, pin + 2));
>> +        if (cpu < EXTIOI_CPUS) {
>> +            cpudev = DEVICE(qemu_get_cpu(cpu));
>> +            for (pin = 0; pin < LS3A_INTC_IP; pin++) {
>> +                qdev_connect_gpio_out(extioi, (cpu * 8 + pin),
>> +                                      qdev_get_gpio_in(cpudev, pin + 2));
>> +        }
>>           }
>>       }
>> @@ -1026,7 +1033,7 @@ static void loongarch_class_init(ObjectClass *oc, void *data)
>>       mc->default_ram_size = 1 * GiB;
>>       mc->default_cpu_type = LOONGARCH_CPU_TYPE_NAME("la464");
>>       mc->default_ram_id = "loongarch.ram";
>> -    mc->max_cpus = LOONGARCH_MAX_VCPUS;
>> +    mc->max_cpus = LOONGARCH_MAX_CPUS;
>>       mc->is_default = 1;
>>       mc->default_kernel_irqchip_split = false;
>>       mc->block_default_type = IF_VIRTIO;
>> diff --git a/include/hw/intc/loongarch_extioi.h b/include/hw/intc/loongarch_extioi.h
>> index 15b8c999f6..fbdef9a7b3 100644
>> --- a/include/hw/intc/loongarch_extioi.h
>> +++ b/include/hw/intc/loongarch_extioi.h
>> @@ -14,6 +14,8 @@
>>   #define LS3A_INTC_IP               8
>>   #define EXTIOI_IRQS                (256)
>>   #define EXTIOI_IRQS_BITMAP_SIZE    (256 / 8)
>> +/* irq from EXTIOI is routed to no more than 4 cpus */
>> +#define EXTIOI_CPUS                (4)
>>   /* map to ipnum per 32 irqs */
>>   #define EXTIOI_IRQS_IPMAP_SIZE     (256 / 32)
>>   #define EXTIOI_IRQS_COREMAP_SIZE   256
>> @@ -46,17 +48,17 @@ struct LoongArchExtIOI {
>>       uint32_t nodetype[EXTIOI_IRQS_NODETYPE_COUNT / 2];
>>       uint32_t bounce[EXTIOI_IRQS_GROUP_COUNT];
>>       uint32_t isr[EXTIOI_IRQS / 32];
>> -    uint32_t coreisr[LOONGARCH_MAX_VCPUS][EXTIOI_IRQS_GROUP_COUNT];
>> +    uint32_t coreisr[EXTIOI_CPUS][EXTIOI_IRQS_GROUP_COUNT];
>>       uint32_t enable[EXTIOI_IRQS / 32];
>>       uint32_t ipmap[EXTIOI_IRQS_IPMAP_SIZE / 4];
>>       uint32_t coremap[EXTIOI_IRQS / 4];
>>       uint32_t sw_pending[EXTIOI_IRQS / 32];
>> -    DECLARE_BITMAP(sw_isr[LOONGARCH_MAX_VCPUS][LS3A_INTC_IP], EXTIOI_IRQS);
>> +    DECLARE_BITMAP(sw_isr[EXTIOI_CPUS][LS3A_INTC_IP], EXTIOI_IRQS);
>>       uint8_t  sw_ipmap[EXTIOI_IRQS_IPMAP_SIZE];
>>       uint8_t  sw_coremap[EXTIOI_IRQS];
>> -    qemu_irq parent_irq[LOONGARCH_MAX_VCPUS][LS3A_INTC_IP];
>> +    qemu_irq parent_irq[EXTIOI_CPUS][LS3A_INTC_IP];
>>       qemu_irq irq[EXTIOI_IRQS];
>> -    MemoryRegion extioi_iocsr_mem[LOONGARCH_MAX_VCPUS];
>> +    MemoryRegion extioi_iocsr_mem[EXTIOI_CPUS];
>>       MemoryRegion extioi_system_mem;
>>   };
>>   #endif /* LOONGARCH_EXTIOI_H */
>> diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
>> index 54a9f595bb..f1659655c6 100644
>> --- a/include/hw/loongarch/virt.h
>> +++ b/include/hw/loongarch/virt.h
>> @@ -14,7 +14,7 @@
>>   #include "hw/intc/loongarch_ipi.h"
>>   #include "hw/block/flash.h"
>> -#define LOONGARCH_MAX_VCPUS     4
>> +#define LOONGARCH_MAX_CPUS      256
>>   #define VIRT_ISA_IO_BASE        0x18000000UL
>>   #define VIRT_ISA_IO_SIZE        0x0004000
> 


