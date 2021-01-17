Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98372F95FF
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 23:48:08 +0100 (CET)
Received: from localhost ([::1]:56166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Gq6-00024k-UV
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 17:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Gp4-0001eR-O7
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 17:47:02 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Gp3-00076O-9u
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 17:47:02 -0500
Received: by mail-wr1-x42a.google.com with SMTP id l12so9504518wry.2
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 14:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QKUzuz/ZdYlsh2LHU/K0tjAUgPXooK8Lp4Le/yBjKhA=;
 b=O6XrKBLpKX7+9JTeNRGMmoAHwi30rNCszNzh37Rc8il0ogSfZw3TXxvjj6YrVxq4Nx
 dghOU2AAuMfNFxGnLpqPV3o2YXANdM9vhwb9rddSnmK8uY21M4rVKniyW8pkvZhclifC
 RVs9D4NUpdJ6jhhNlIjFE9d1LzkfgNe805r6vs5+UbhxChYIEq5VBPZ9yzq+c3qPAEoN
 lVSfUYs5+heOISanErMHXCFL/afB/FAWYdokw/IYOycboxQjyK3CR2wZzPRyD+TgH2Mk
 bzNXJfRA53Big8oHzr63d52BZSzHlHEfww6dNph7cMhB0ODG9SPPYbUp5kiUUQAz0Hez
 s4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QKUzuz/ZdYlsh2LHU/K0tjAUgPXooK8Lp4Le/yBjKhA=;
 b=UvRH77b1s7XbEvxEgh+dNr578s6q4g3EuPNDZmj1Vwe/fovakGIX4AlrJea2jP6Gt1
 AwdlqTSL3IhurOzw0WKWNprir9Bv1cDlpQuo/bcWTFI7GXVtQvUfg+WRJtoFfJxx/5eS
 ITCFdp0Cz+My6rcwgWf+8ga7gpnUyKsOjU532EgF8P+ygeQu+r3qJRcgAuA45Z1cgaWr
 cQ2ta2rUm6JM1JZR1HD2QpCyyNPog2cupU+Tc92m3yvipQVnswwIjtZiUlycBRE3NdTb
 Z6CYziSoQCZ81j0xcC0HpRKKg0X8XM2TFYrFB1KjfKgzupqLUEUPO/QN7n8Ew7xRavwd
 XAzA==
X-Gm-Message-State: AOAM530ckCkllBtcDo0QAXub9dpkmx9+jey1Myqc5UjXRLg+n5bL2jPO
 Wmji2o/FuTRgYyFN7huKYJI=
X-Google-Smtp-Source: ABdhPJz069B2BxGcxkWRUCuAD4iZHaZ+Ra7wWWkCzJNK2aurbpUMPseg1ViCO2f8waJgQ519zRNTJA==
X-Received: by 2002:adf:94e1:: with SMTP id 88mr22996032wrr.341.1610923619929; 
 Sun, 17 Jan 2021 14:46:59 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g184sm22765104wma.16.2021.01.17.14.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 14:46:58 -0800 (PST)
Subject: Re: [PATCH v2 2/2] hw/mips/loongson3_virt: Add TCG SMP support
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210114013147.92962-1-jiaxun.yang@flygoat.com>
 <20210114013147.92962-3-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8f1d33ac-159f-f4af-47b9-6563a3809c91@amsat.org>
Date: Sun, 17 Jan 2021 23:46:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114013147.92962-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.252,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jiaxun,

On 1/14/21 2:31 AM, Jiaxun Yang wrote:
> loongson3_virt has KVM SMP support in kenrel.
> This patch adds TCG SMP support by enable IPI controller
> for machine.
> 
> Note that TCG SMP can only support up to 4 CPUs as we
> didn't implement multi-node support.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/loongson3_bootp.h |  1 +
>  hw/mips/loongson3_virt.c  | 20 +++++++++++++++++++-
>  hw/mips/Kconfig           |  1 +
>  3 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/mips/loongson3_bootp.h b/hw/mips/loongson3_bootp.h
> index 09f8480abf..4756aa44f6 100644
> --- a/hw/mips/loongson3_bootp.h
> +++ b/hw/mips/loongson3_bootp.h
> @@ -210,6 +210,7 @@ enum {
>      VIRT_PCIE_ECAM,
>      VIRT_BIOS_ROM,
>      VIRT_UART,
> +    VIRT_IPIS,
>      VIRT_LIOINTC,
>      VIRT_PCIE_MMIO,
>      VIRT_HIGHMEM
> diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
> index d4a82fa536..0684a035b0 100644
> --- a/hw/mips/loongson3_virt.c
> +++ b/hw/mips/loongson3_virt.c
> @@ -35,6 +35,7 @@
>  #include "hw/boards.h"
>  #include "hw/char/serial.h"
>  #include "hw/intc/loongson_liointc.h"
> +#include "hw/intc/loongson_ipi.h"
>  #include "hw/mips/mips.h"
>  #include "hw/mips/cpudevs.h"
>  #include "hw/mips/fw_cfg.h"
> @@ -59,6 +60,7 @@
>  
>  #define PM_CNTL_MODE          0x10
>  
> +#define LOONGSON_TCG_MAX_VCPUS  4
>  #define LOONGSON_MAX_VCPUS      16

A GS464V node has 4 cores, right? What about:

#define LOONGSON_VCPUS_PER_NODE 4

#define LOONGSON_NODES_MAX_TCG  1
#define LOONGSON_NODES_MAX_KVM  4

>  
>  /*
> @@ -71,6 +73,7 @@
>  #define UART_IRQ            0
>  #define RTC_IRQ             1
>  #define PCIE_IRQ_BASE       2

Can you add a definition for the number 6? Maybe:

   #define IPI_IRQ             6

> +#define IPI_REG_SPACE       0x100
>  
>  const struct MemmapEntry virt_memmap[] = {
>      [VIRT_LOWMEM] =      { 0x00000000,    0x10000000 },
> @@ -81,6 +84,7 @@ const struct MemmapEntry virt_memmap[] = {
>      [VIRT_PCIE_ECAM] =   { 0x1a000000,     0x2000000 },
>      [VIRT_BIOS_ROM] =    { 0x1fc00000,      0x200000 },
>      [VIRT_UART] =        { 0x1fe001e0,           0x8 },
> +    [VIRT_IPIS] =        { 0x3ff01000,         0x400 },
>      [VIRT_LIOINTC] =     { 0x3ff01400,          0x64 },
>      [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
>      [VIRT_HIGHMEM] =     { 0x80000000,           0x0 }, /* Variable */
> @@ -495,6 +499,10 @@ static void mips_loongson3_virt_init(MachineState *machine)
>              error_report("Loongson-3/TCG needs cpu type Loongson-3A1000");
>              exit(1);
>          }
> +        if (machine->smp.cpus > LOONGSON_TCG_MAX_VCPUS) {
> +            error_report("Loongson-3/TCG supports up to 4 CPUs");
> +            exit(1);
> +        }
>      } else {
>          if (!machine->cpu_type) {
>              machine->cpu_type = MIPS_CPU_TYPE_NAME("Loongson-3A4000");
> @@ -545,7 +553,17 @@ static void mips_loongson3_virt_init(MachineState *machine)
>          qemu_register_reset(main_cpu_reset, cpu);
>  
>          if (i >= 4) {
> -            continue; /* Only node-0 can be connected to LIOINTC */
> +            continue; /* Only node-0 can be connected to LIOINTC and IPI */
> +        }
> +
> +        if (!kvm_enabled()) {
> +            /* IPI is handled by kernel for KVM */
> +            DeviceState *ipi;
> +            ipi = qdev_new(TYPE_LOONGSON_IPI);
> +            sysbus_realize_and_unref(SYS_BUS_DEVICE(ipi), &error_fatal);
> +            sysbus_mmio_map(SYS_BUS_DEVICE(ipi), 0,
> +                            virt_memmap[VIRT_IPIS].base + IPI_REG_SPACE * i);
> +            sysbus_connect_irq(SYS_BUS_DEVICE(ipi), 0, cpu->env.irq[6]);

While this works, it is very fragile. If multiple IRQs share the same
CPU pin, the better way is to use an OR gate (modeled as TYPE_OR_IRQ
device).

>          }
>  
>          for (ip = 0; ip < 4 ; ip++) {
>              int pin = i * 4 + ip;
>              sysbus_connect_irq(SYS_BUS_DEVICE(liointc),
>                                 pin, cpu->env.irq[ip + 2]);

Oops, we already use it without OR gate :/

Regards,

Phil.

