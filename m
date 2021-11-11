Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D12F44D872
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:39:11 +0100 (CET)
Received: from localhost ([::1]:46938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBEM-0000Wl-KA
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:39:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlAyR-0005Wr-QF
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:22:43 -0500
Received: from [2001:41c9:1:41f::167] (port=36120
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlAyP-0007Zt-Rb
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:22:43 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlAyF-0003sW-RQ; Thu, 11 Nov 2021 14:22:35 +0000
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-18-git-send-email-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <566f43a3-290d-dd16-9c74-2e8a474b443b@ilande.co.uk>
Date: Thu, 11 Nov 2021 14:22:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1636594528-8175-18-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v2 17/30] hw/loongarch: Add LoongArch cpu interrupt
 support(CPUINTC)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.999,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/2021 01:35, Xiaojuan Yang wrote:

> Loongson-3A5000 support 14 interrupts from 64 - 77(Timer->75 IPI->76)
> Loongson-3A5000 and ls7a form a legacy model and extended model irq
> hierarchy.Tcg mode emulate a simplified extended model which
> has no Legacy I/O Interrupt Controller(LIOINTC) and LPC.
> e.g:
> 
>   |    +-----+    +---------+     +-------+             |
>   |    | IPI |--> | CPUINTC | <-- | Timer |             |
>   |    +-----+    +---------+     +-------+             |
>   |                    ^                                |
>   |                    |                                |
>   |               +---------+
>   |               | EIOINTC |
>   |               +---------+
>   |                ^       ^                            |
>   |                |       |                            |
>   |         +---------+ +---------+                     |
>   |         | PCH-PIC | | PCH-MSI |                     |
>   |         +---------+ +---------+                     |
>   |           ^     ^           ^                       |
>   |           |     |           |                       |
>   |   +---------+ +---------+ +---------+               |
>   |   | UARTs | | Devices | | Devices |                 |
>   |   +---------+ +---------+ +---------+               |
>   |        ^                                            |
> 
> The following series patch will realize the interrupt
> controller in this model.
> 
> More detailed info can be found at the kernel doc or manual
> 1.https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/
> linux-loongson.git/tree/Documentation/loongarch?h=loongarch-next
> 2.https://github.com/loongson/LoongArch-Documentation
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/loongarch/loongarch_int.c     | 59 ++++++++++++++++++++++++++++++++
>   hw/loongarch/ls3a5000_virt.c     |  2 ++
>   hw/loongarch/meson.build         |  1 +
>   include/hw/loongarch/loongarch.h |  2 ++
>   4 files changed, 64 insertions(+)
>   create mode 100644 hw/loongarch/loongarch_int.c
> 
> diff --git a/hw/loongarch/loongarch_int.c b/hw/loongarch/loongarch_int.c
> new file mode 100644
> index 0000000000..2502d056ac
> --- /dev/null
> +++ b/hw/loongarch/loongarch_int.c
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU LOONGARCH interrupt support
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +#include "hw/irq.h"
> +#include "hw/loongarch/loongarch.h"
> +#include "cpu.h"
> +
> +static void cpu_loongarch_irq_request(void *opaque, int irq, int level)
> +{
> +    LoongArchCPU *cpu = opaque;
> +    CPULoongArchState *env = &cpu->env;
> +    CPUState *cs = CPU(cpu);
> +    bool locked = false;
> +
> +    if (irq < 0 || irq > N_IRQS) {
> +        return;
> +    }
> +
> +    /* Make sure locking works even if BQL is already held by the caller */
> +    if (!qemu_mutex_iothread_locked()) {
> +        locked = true;
> +        qemu_mutex_lock_iothread();
> +    }
> +
> +    if (level) {
> +        env->CSR_ESTAT |= 1 << irq;
> +    } else {
> +        env->CSR_ESTAT &= ~(1 << irq);
> +    }
> +
> +    if (FIELD_EX64(env->CSR_ESTAT, CSR_ESTAT, IS)) {
> +        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> +    } else {
> +        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> +    }
> +
> +    if (locked) {
> +        qemu_mutex_unlock_iothread();
> +    }
> +}
> +
> +void cpu_loongarch_init_irq(LoongArchCPU *cpu)
> +{
> +    CPULoongArchState *env = &cpu->env;
> +    qemu_irq *qi;
> +    int i;
> +
> +    qi = qemu_allocate_irqs(cpu_loongarch_irq_request, cpu, N_IRQS);
> +    for (i = 0; i < N_IRQS; i++) {
> +        env->irq[i] = qi[i];
> +    }
> +    g_free(qi);
> +}

TYPE_CPU is a child of TYPE_DEVICE so rather than use qemu_allocate_irqs() here you 
should declare these as qdev gpios in the LoongArchCPU device and wire them up using 
qdev_connect_gpio_out(). I suspect once you've done this then 
cpu_loongarch_init_irq() will no longer be required.

> diff --git a/hw/loongarch/ls3a5000_virt.c b/hw/loongarch/ls3a5000_virt.c
> index 7c88d64795..37d6b1ec88 100644
> --- a/hw/loongarch/ls3a5000_virt.c
> +++ b/hw/loongarch/ls3a5000_virt.c
> @@ -150,6 +150,8 @@ static void ls3a5000_virt_init(MachineState *machine)
>           env = &cpu->env;
>           cpu_states[i] = env;
>   
> +        /* Init CPU internal devices */
> +        cpu_loongarch_init_irq(cpu);
>           cpu_loongarch_clock_init(cpu);
>           qemu_register_reset(main_cpu_reset, cpu);
>       }
> diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
> index 1e743cadb8..a972210680 100644
> --- a/hw/loongarch/meson.build
> +++ b/hw/loongarch/meson.build
> @@ -1,4 +1,5 @@
>   loongarch_ss = ss.source_set()
> +loongarch_ss.add(files('loongarch_int.c'))
>   loongarch_ss.add(when: 'CONFIG_LOONGSON_3A5000', if_true: files('ls3a5000_virt.c'))
>   
>   hw_arch += {'loongarch': loongarch_ss}
> diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
> index edab069f76..8538697e5f 100644
> --- a/include/hw/loongarch/loongarch.h
> +++ b/include/hw/loongarch/loongarch.h
> @@ -43,4 +43,6 @@ typedef struct LoongArchMachineState {
>   #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("loongson7a")
>   DECLARE_INSTANCE_CHECKER(LoongArchMachineState, LOONGARCH_MACHINE,
>                            TYPE_LOONGARCH_MACHINE)
> +
> +void cpu_loongarch_init_irq(LoongArchCPU *cpu);
>   #endif


ATB,

Mark.

