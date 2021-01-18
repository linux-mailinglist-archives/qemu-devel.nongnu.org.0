Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310012F97AF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 03:13:04 +0100 (CET)
Received: from localhost ([::1]:58748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1K2Q-0005AU-Sh
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 21:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1l1K0x-0004kk-QO
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:11:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:46314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1l1K0v-0000RZ-Oh
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:11:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA00522510
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 02:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610935886;
 bh=aiYIxtPOVjKG0SURRP8xkdA+L1fGxRjGLCsf6+KGsSA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P/qFLz9aV8bpect4W84Sq8l7sad86vkEuSHFGxL1xgHkaccA0pfUMPHeyJEA79tiz
 FNFZNDr+CbaHHV+2VXHhyEN3ioKzJvG2m3bbkOL0P9K0FHHn75GmUB1f+u17pwAWoy
 xu2ebrRpD3nXWuEK92YRC/zAaZFfUlJQHnYxyMVSDWrDddXWkShX2FodIUOGfe2iAI
 rJeDed814sB+0WAyZuExUfEU5VLjkdGfjVf7bZ6SD3eqcrkTZpO7a3h3op3QPllNyo
 qoZ42BiaQI9mmhVKiuwmzT54tHaTzHogTDGnZGaND7gSBvu0Hyh2/OX87JPj5aJ4dt
 T1gxD8mhjNsqA==
Received: by mail-io1-f44.google.com with SMTP id u17so30042513iow.1
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 18:11:26 -0800 (PST)
X-Gm-Message-State: AOAM533I2GjGr9YpnSh4VIOPyAfckva8qSBtUGPn8jxOrb33Cxqhx1f7
 JBP2qNcoVOfljGBciSDL65xHcal4od8lGw7LbrE=
X-Google-Smtp-Source: ABdhPJwM2xtcGglr4qYu+l9oPFgQvQ/8DbVm+iAGntFx5x4PW0K5b0N7jBmiNHMXNK56Xqeu1E9+YdSrg6XJP6M1Z98=
X-Received: by 2002:a02:95e3:: with SMTP id b90mr13350983jai.32.1610935886313; 
 Sun, 17 Jan 2021 18:11:26 -0800 (PST)
MIME-Version: 1.0
References: <20210118011706.22639-1-jiaxun.yang@flygoat.com>
 <20210118011706.22639-3-jiaxun.yang@flygoat.com>
In-Reply-To: <20210118011706.22639-3-jiaxun.yang@flygoat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 18 Jan 2021 10:11:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Au2RW=vhUDmh6=ZMqYX6JOJy+4y+SViE+YtQUg9uc8Q@mail.gmail.com>
Message-ID: <CAAhV-H4Au2RW=vhUDmh6=ZMqYX6JOJy+4y+SViE+YtQUg9uc8Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hw/mips/loongson3_virt: Add TCG SMP support
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Jiaxun,

On Mon, Jan 18, 2021 at 9:17 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> loongson3_virt has KVM SMP support in kenrel.
s/kenrel/kernel/g

Huacai
> This patch adds TCG SMP support by enable IPI controller
> for machine.
>
> Also add definition about IRQs to enhance readability.
>
> Note that TCG SMP can only support up to 4 CPUs as we
> didn't implement multi-node support.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/loongson3_bootp.h |  1 +
>  hw/mips/loongson3_virt.c  | 41 ++++++++++++++++++++++++++++++++-------
>  hw/mips/Kconfig           |  1 +
>  3 files changed, 36 insertions(+), 7 deletions(-)
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
> index d4a82fa536..0765addb7f 100644
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
> @@ -59,7 +60,11 @@
>
>  #define PM_CNTL_MODE          0x10
>
> -#define LOONGSON_MAX_VCPUS      16
> +#define VCPU_PER_NODE         4
> +#define TCG_MAX_NODES         1
> +#define KVM_MAX_NODES         4
> +#define TCG_MAX_VCPUS         (TCG_MAX_NODES  * VCPU_PER_NODE)
> +#define KVM_MAX_VCPUS         (KVM_MAX_NODES  * VCPU_PER_NODE)
>
>  /*
>   * Loongson-3's virtual machine BIOS can be obtained here:
> @@ -68,9 +73,16 @@
>   */
>  #define LOONGSON3_BIOSNAME "bios_loongson3.bin"
>
> +/* IRQ allocation of CPU IP */
> +#define LIOINTC_IP_START    2
> +#define LIOINTC_IP_END      5
> +#define IPI_IP              6
> +
> +/* IRQ allcation of LIOINTC */
>  #define UART_IRQ            0
>  #define RTC_IRQ             1
>  #define PCIE_IRQ_BASE       2
> +#define IPI_REG_SPACE       0x100
>
>  const struct MemmapEntry virt_memmap[] = {
>      [VIRT_LOWMEM] =      { 0x00000000,    0x10000000 },
> @@ -81,6 +93,7 @@ const struct MemmapEntry virt_memmap[] = {
>      [VIRT_PCIE_ECAM] =   { 0x1a000000,     0x2000000 },
>      [VIRT_BIOS_ROM] =    { 0x1fc00000,      0x200000 },
>      [VIRT_UART] =        { 0x1fe001e0,           0x8 },
> +    [VIRT_IPIS] =        { 0x3ff01000,         0x400 },
>      [VIRT_LIOINTC] =     { 0x3ff01400,          0x64 },
>      [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
>      [VIRT_HIGHMEM] =     { 0x80000000,           0x0 }, /* Variable */
> @@ -495,6 +508,10 @@ static void mips_loongson3_virt_init(MachineState *machine)
>              error_report("Loongson-3/TCG needs cpu type Loongson-3A1000");
>              exit(1);
>          }
> +        if (machine->smp.cpus > TCG_MAX_VCPUS) {
> +            error_report("Loongson-3/TCG supports up to %d CPUs", TCG_MAX_VCPUS);
> +            exit(1);
> +        }
>      } else {
>          if (!machine->cpu_type) {
>              machine->cpu_type = MIPS_CPU_TYPE_NAME("Loongson-3A4000");
> @@ -544,14 +561,24 @@ static void mips_loongson3_virt_init(MachineState *machine)
>          cpu_mips_clock_init(cpu);
>          qemu_register_reset(main_cpu_reset, cpu);
>
> -        if (i >= 4) {
> -            continue; /* Only node-0 can be connected to LIOINTC */
> +        if (i >= VCPU_PER_NODE) {
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
> +            sysbus_connect_irq(SYS_BUS_DEVICE(ipi), 0, cpu->env.irq[IPI_IP]);
>          }
>
> -        for (ip = 0; ip < 4 ; ip++) {
> -            int pin = i * 4 + ip;
> +        for (ip = LIOINTC_IP_START; ip <= LIOINTC_IP_END ; ip++) {
> +            int pin = i * 4 + (ip - LIOINTC_IP_START);
>              sysbus_connect_irq(SYS_BUS_DEVICE(liointc),
> -                               pin, cpu->env.irq[ip + 2]);
> +                               pin, cpu->env.irq[ip]);
>          }
>      }
>      env = &MIPS_CPU(first_cpu)->env;
> @@ -619,7 +646,7 @@ static void loongson3v_machine_class_init(ObjectClass *oc, void *data)
>      mc->desc = "Loongson-3 Virtualization Platform";
>      mc->init = mips_loongson3_virt_init;
>      mc->block_default_type = IF_IDE;
> -    mc->max_cpus = LOONGSON_MAX_VCPUS;
> +    mc->max_cpus = KVM_MAX_VCPUS;
>      mc->default_ram_id = "loongson3.highram";
>      mc->default_ram_size = 1600 * MiB;
>      mc->kvm_type = mips_kvm_type;
> diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
> index aadd436bf4..4fb0cc49e8 100644
> --- a/hw/mips/Kconfig
> +++ b/hw/mips/Kconfig
> @@ -39,6 +39,7 @@ config LOONGSON3V
>      select SERIAL
>      select GOLDFISH_RTC
>      select LOONGSON_LIOINTC
> +    select LOONGSON_IPI if TCG
>      select PCI_DEVICES
>      select PCI_EXPRESS_GENERIC_BRIDGE
>      select MSI_NONBROKEN
> --
> 2.30.0
>

