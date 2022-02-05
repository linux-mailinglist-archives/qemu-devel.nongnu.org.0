Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5644AA8A9
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 13:17:05 +0100 (CET)
Received: from localhost ([::1]:34272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGK00-0000dK-Az
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 07:17:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGJxB-0008IJ-H7
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:14:09 -0500
Received: from [2001:41c9:1:41f::167] (port=48690
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGJxA-0001bo-1A
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:14:09 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGJwb-0009NP-Be; Sat, 05 Feb 2022 12:13:37 +0000
Message-ID: <8dc59b55-2988-e5aa-e1c8-fe589c88a714@ilande.co.uk>
Date: Sat, 5 Feb 2022 12:13:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
 <20220128034412.1262452-17-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220128034412.1262452-17-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v5 16/30] hw/loongarch: Add LoongArch cpu interrupt
 support(CPUINTC)
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
Cc: richard.henderson@linaro.org, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/01/2022 03:43, Xiaojuan Yang wrote:

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
>   hw/loongarch/loongson3.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
> index 83c464899b..e79d86928d 100644
> --- a/hw/loongarch/loongson3.c
> +++ b/hw/loongarch/loongson3.c
> @@ -64,6 +64,29 @@ static const MemoryRegionOps loongarch_qemu_ops = {
>       },
>   };
>   
> +static void loongarch_cpu_set_irq(void *opaque, int irq, int level)
> +{
> +    LoongArchCPU *cpu = opaque;
> +    CPULoongArchState *env = &cpu->env;
> +    CPUState *cs = CPU(cpu);
> +
> +    if (irq < 0 || irq > N_IRQS) {
> +        return;
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
> +}
> +
>   static void loongarch_init(MachineState *machine)
>   {
>       const char *cpu_model = machine->cpu_type;
> @@ -88,6 +111,9 @@ static void loongarch_init(MachineState *machine)
>       /* Init CPUs */
>       for (i = 0; i < machine->smp.cpus; i++) {
>           la_cpu = LOONGARCH_CPU(cpu_create(machine->cpu_type));
> +        timer_init_ns(&la_cpu->timer, QEMU_CLOCK_VIRTUAL,
> +                      &loongarch_constant_timer_cb, la_cpu);
> +        qdev_init_gpio_in(DEVICE(la_cpu), loongarch_cpu_set_irq, N_IRQS);
>   
>           timer_init_ns(&la_cpu->timer, QEMU_CLOCK_VIRTUAL,
>                         &loongarch_constant_timer_cb, la_cpu);

This should also get moved into the new loongarch_cpu_init() function previously 
discussed.


ATB,

Mark.

