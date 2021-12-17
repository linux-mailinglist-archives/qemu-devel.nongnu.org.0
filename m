Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5794797AF
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 00:57:32 +0100 (CET)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myN6R-0007DR-VX
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 18:57:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1myN3h-0004wv-AK
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 18:54:41 -0500
Received: from [2001:41c9:1:41f::167] (port=48966
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1myN3f-0002B5-LL
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 18:54:41 -0500
Received: from [2a00:23c4:8b9f:c400:72e2:646b:9043:c91d]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1myN3E-00078k-KW; Fri, 17 Dec 2021 23:54:16 +0000
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
 <1638619645-11283-17-git-send-email-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <5ac28dd9-ce5a-e68e-fbf4-e3cdf44f4b35@ilande.co.uk>
Date: Fri, 17 Dec 2021 23:54:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1638619645-11283-17-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9f:c400:72e2:646b:9043:c91d
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v3 16/27] hw/loongarch: Add LoongArch cpu interrupt
 support(CPUINTC)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 i.qemu@xen0n.name, richard.henderson@linaro.org, laurent@vivier.eu,
 peterx@redhat.com, f4bug@amsat.org, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, chenhuacai@loongson.cn,
 alex.bennee@linaro.org, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/12/2021 12:07, Xiaojuan Yang wrote:

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
>   target/loongarch/cpu.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 62c2a4d813..afa550c950 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -504,11 +504,39 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
>       lacc->parent_realize(dev, errp);
>   }
>   
> +#ifndef CONFIG_USER_ONLY
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
> +#endif
> +
>   static void loongarch_cpu_initfn(Object *obj)
>   {
>       LoongArchCPU *cpu = LOONGARCH_CPU(obj);
>   
>       cpu_set_cpustate_pointers(cpu);
> +#ifndef CONFIG_USER_ONLY
> +    qdev_init_gpio_in(DEVICE(cpu), loongarch_cpu_set_irq, N_IRQS);
> +#endif
>   }
>   
>   static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)

Rather than use defines to split out user mode, I would suggest using a separate 
function in a similar way to sparc64_cpu_devinit() in hw/sparc64/sparc64.c to set up 
the parts of the CPU that are only required in system mode. This function can then be 
called as part of the board setup.


ATB,

Mark.

