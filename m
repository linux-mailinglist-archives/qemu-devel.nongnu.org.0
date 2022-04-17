Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83105049E0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 00:58:01 +0200 (CEST)
Received: from localhost ([::1]:39960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngDqC-0008Pz-7M
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 18:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngDoJ-0007gZ-0i
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 18:56:03 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:43938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngDoG-0006yg-Nt
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 18:56:02 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso12582480pjj.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 15:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=e3HCwFV7y4yg+iFwyWrAh8ze7VjValpJtAi85VB2vLw=;
 b=hE4VV10fatpwyIJP9HXbTeWGWPNicEMsGeEDmQOrlhfF/4rUOgOJGxG6JbnZvWuDi1
 +Okuxa+PcyYbC3rPuIj8irQVSWkHK0l7JFnVWtNpCPJklxoG73O+VO1cdIn93JIcTrMt
 srxEOAkikmqwp5Czr7uW8upDQL26CvYlUAea1fPirvHvVHTNkrVYuiqaWNTrF4PAPQrw
 XaxHaXNNH1a0bAi6v0LXSOb9xn9/8QAa1GNI6uo8/DWGpYs4UfVueHLj/bbQR+b2bzEz
 AsJfL++J/B+gh/iQUvul1GAl1UdtR769SAJNj6O1nblEL1m5conXkki6WBe94n0jiTo6
 e2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e3HCwFV7y4yg+iFwyWrAh8ze7VjValpJtAi85VB2vLw=;
 b=UrdauKDgqoh2HWpsNlBaLz7/+vxFMIGWQG3GTjgz1tKBdHWoeauRp8iJXl4Ns1hPa6
 vvXktE6SS2XjovWBlt1/5wf8zJ5sBP7QzItMwO79QN/Uq6pN0pwLnhSaDTKueh74iPiK
 IbGeYxatqhofEthKLDwysRtaI8uPLQPdPknuM+tPY9pmP7CEYsegU7Y35/ra3cpEp1oB
 EXNpAbdrkTb/w03+pwAhhTiEXkjMRCZo8vyMmcMYwCIIk+nktTOcoYQEXRQ60mdgkA8o
 fl6inYpV5YE2Q2L+xO0Qjw50GkiYXWV6VEkjXXPlFTn3m+NxJOFRXhPQM6f7lgN6W19F
 Z/dw==
X-Gm-Message-State: AOAM533sfs36Zxhm/yAnjaRyl9V/KD5G007H2pLaRGVrX30RaTLB61qo
 aASQFHrMyHSf48bnUuAK3gthdw==
X-Google-Smtp-Source: ABdhPJz0HrZUpxevHJ1BlxK/P5MZRA1IlFk8mAPxneiYArw8gtdrN+jkFua5lonJrmrOeB3mf2gCrg==
X-Received: by 2002:a17:90b:3a90:b0:1d2:80bf:d968 with SMTP id
 om16-20020a17090b3a9000b001d280bfd968mr5278020pjb.16.1650236157194; 
 Sun, 17 Apr 2022 15:55:57 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a17090a3e0300b001cb68d28544sm14905836pjc.37.2022.04.17.15.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 15:55:56 -0700 (PDT)
Message-ID: <12ceda96-43ff-6108-3dbf-9149e7cdc4e3@linaro.org>
Date: Sun, 17 Apr 2022 15:55:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 31/43] hw/loongarch: Add support loongson3 virt machine
 type.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-32-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-32-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> +++ b/include/hw/loongarch/loongarch.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Definitions for loongarch board emulation.
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef HW_LOONGARCH_H
> +#define HW_LOONGARCH_H
> +
> +#include "target/loongarch/cpu.h"
> +#include "qemu-common.h"
> +#include "hw/boards.h"
> +#include "qemu/queue.h"
> +
> +#define LOONGARCH_MAX_VCPUS     4
> +
> +#define FEATURE_REG             0x8
> +#define IOCSRF_TEMP             0
> +#define IOCSRF_NODECNT          1
> +#define IOCSRF_MSI              2
> +#define IOCSRF_EXTIOI           3
> +#define IOCSRF_CSRIPI           4
> +#define IOCSRF_FREQCSR          5
> +#define IOCSRF_FREQSCALE        6
> +#define IOCSRF_DVFSV1           7
> +#define IOCSRF_GMOD             9
> +#define IOCSRF_VM               11
> +
> +#define IOCSR_MEM_SIZE          0x428
> +
> +#define VENDOR_REG              0x10
> +#define CPUNAME_REG             0x20
> +#define MISC_FUNC_REG           0x420
> +#define IOCSRM_EXTIOI_EN        48
> +
> +#define LOONGARCH_ISA_IO_BASE   0x18000000UL
> +#define LOONGARCH_ISA_IO_SIZE   0x0004000
> +
> +struct LoongArchMachineState {
> +    /*< private >*/
> +    MachineState parent_obj;
> +
> +    MemoryRegion lowmem;
> +    MemoryRegion highmem;
> +    MemoryRegion isa_io;
> +};
> +
> +#define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
> +OBJECT_DECLARE_SIMPLE_TYPE(LoongArchMachineState, LOONGARCH_MACHINE)
> +#endif

Should this file instead be named "hw/loongarch/virt.h", since it contains definitions for 
the virt machine type?  Presumably at some point you'll be defining a machine board based 
on real hardware, at which point this will seem mis-named.


> +++ b/target/loongarch/cpu.c
> @@ -17,6 +17,8 @@
>  #include "internals.h"
>  #include "fpu/softfloat-helpers.h"
>  #include "cpu-csr.h"
> +#include "sysemu/reset.h"
> +#include "hw/loader.h"
>  
>  const char * const regnames[32] = {
>      "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
> @@ -80,6 +82,8 @@ static void loongarch_cpu_set_pc(CPUState *cs, vaddr value)
>      env->pc = value;
>  }
>  
> +#include "hw/loongarch/loongarch.h"
> +
>  void loongarch_cpu_set_irq(void *opaque, int irq, int level)
>  {
>      LoongArchCPU *cpu = opaque;
> @@ -103,6 +107,48 @@ void loongarch_cpu_set_irq(void *opaque, int irq, int level)
>      }
>  }
>  
> +static void loongarch_qemu_write(void *opaque, hwaddr addr,
> +                                 uint64_t val, unsigned size)
> +{
> +}
> +
> +static uint64_t loongarch_qemu_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    switch (addr) {
> +    case FEATURE_REG:
> +        return 1UL << IOCSRF_MSI | 1UL << IOCSRF_EXTIOI |
> +               1UL << IOCSRF_CSRIPI;
> +    case VENDOR_REG:
> +        return 0x6e6f73676e6f6f4c; /* "Loongson" */
> +    case CPUNAME_REG:
> +        return 0x303030354133;     /* "3A5000" */
> +    case MISC_FUNC_REG:
> +        return 1UL << IOCSRM_EXTIOI_EN;
> +    }
> +    return 0;
> +}
> +
> +static const MemoryRegionOps loongarch_qemu_ops = {
> +    .read = loongarch_qemu_read,
> +    .write = loongarch_qemu_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
> +    },
> +    .impl = {
> +        .min_access_size = 8,
> +        .max_access_size = 8,
> +    },
> +};
> +
> +static void reset_cb(void *opaque)
> +{
> +    LoongArchCPU *cpu = opaque;
> +
> +    cpu_reset(CPU(cpu));
> +}
> +
>  static inline bool cpu_loongarch_hw_interrupts_enabled(CPULoongArchState *env)
>  {
>      bool ret = 0;
> @@ -518,11 +564,19 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
>  static void loongarch_cpu_init(Object *obj)
>  {
>      LoongArchCPU *cpu = LOONGARCH_CPU(obj);
> +    CPULoongArchState *env = &cpu->env;
>  
>      cpu_set_cpustate_pointers(cpu);
>      qdev_init_gpio_in(DEVICE(cpu), loongarch_cpu_set_irq, N_IRQS);
>      timer_init_ns(&cpu->timer, QEMU_CLOCK_VIRTUAL,
>                    &loongarch_constant_timer_cb, cpu);
> +    memory_region_init_io(&env->system_iocsr, OBJECT(cpu), NULL,
> +                      env, "iocsr", UINT64_MAX);
> +    address_space_init(&env->address_space_iocsr, &env->system_iocsr, "IOCSR");
> +    qemu_register_reset(reset_cb, cpu);
> +    memory_region_init_io(&env->iocsr_mem, OBJECT(cpu), &loongarch_qemu_ops,
> +                          NULL, "iocsr_misc", IOCSR_MEM_SIZE);
> +    memory_region_add_subregion(&env->system_iocsr, 0, &env->iocsr_mem);
>  }
>  
>  static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)

These changes belong elsewhere, not while defining -M virt.
Some of it earlier, where you defined the iocsr address space.

Do not use qemu_register_reset, use device_class_set_parent_reset.


r~

