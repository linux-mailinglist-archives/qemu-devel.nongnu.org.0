Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11382EBD13
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 12:22:29 +0100 (CET)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx6tY-0008M9-B5
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 06:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kx6sR-0007wA-Kd
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 06:21:20 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57756
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kx6sO-0006Gm-Lk
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 06:21:19 -0500
Received: from host109-146-177-189.range109-146.btcentralplus.com
 ([109.146.177.189] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kx6sM-000692-O8; Wed, 06 Jan 2021 11:21:19 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, atar4qemu@gmail.com, f4bug@amsat.org
References: <20201219111934.5540-1-mark.cave-ayland@ilande.co.uk>
Message-ID: <7d9450ae-ba24-fe5d-a581-a29c850a76b7@ilande.co.uk>
Date: Wed, 6 Jan 2021 11:21:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201219111934.5540-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 109.146.177.189
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] sun4m: don't connect two qemu_irqs directly to the same
 input
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/12/2020 11:19, Mark Cave-Ayland wrote:

> The sun4m board code connects both of the IRQ outputs of each ESCC to the
> same slavio input qemu_irq. Connecting two qemu_irqs outputs directly to the
> same input is not valid as it produces subtly wrong behaviour (for instance
> if both the IRQ lines are high, and then one goes low, the PIC input will see
> this as a high-to-low transition even though the second IRQ line should still
> be holding it high).
> 
> This kind of wiring needs an explicitly created OR gate; add one.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/sparc/Kconfig |  1 +
>   hw/sparc/sun4m.c | 23 ++++++++++++++++++-----
>   2 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/sparc/Kconfig b/hw/sparc/Kconfig
> index 91805afab6..8dcb10086f 100644
> --- a/hw/sparc/Kconfig
> +++ b/hw/sparc/Kconfig
> @@ -14,6 +14,7 @@ config SUN4M
>       select M48T59
>       select STP2000
>       select CHRP_NVRAM
> +    select OR_IRQ
>   
>   config LEON3
>       bool
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 8686371318..c06c43be18 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -50,6 +50,7 @@
>   #include "hw/misc/empty_slot.h"
>   #include "hw/misc/unimp.h"
>   #include "hw/irq.h"
> +#include "hw/or-irq.h"
>   #include "hw/loader.h"
>   #include "elf.h"
>   #include "trace.h"
> @@ -848,7 +849,7 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
>       uint32_t initrd_size;
>       DriveInfo *fd[MAX_FD];
>       FWCfgState *fw_cfg;
> -    DeviceState *dev;
> +    DeviceState *dev, *ms_kb_orgate, *serial_orgate;
>       SysBusDevice *s;
>       unsigned int smp_cpus = machine->smp.cpus;
>       unsigned int max_cpus = machine->smp.max_cpus;
> @@ -994,10 +995,16 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
>       qdev_prop_set_uint32(dev, "chnAtype", escc_kbd);
>       s = SYS_BUS_DEVICE(dev);
>       sysbus_realize_and_unref(s, &error_fatal);
> -    sysbus_connect_irq(s, 0, slavio_irq[14]);
> -    sysbus_connect_irq(s, 1, slavio_irq[14]);
>       sysbus_mmio_map(s, 0, hwdef->ms_kb_base);
>   
> +    /* Logically OR both its IRQs together */
> +    ms_kb_orgate = DEVICE(object_new(TYPE_OR_IRQ));
> +    object_property_set_int(OBJECT(ms_kb_orgate), "num-lines", 2, &error_fatal);
> +    qdev_realize_and_unref(ms_kb_orgate, NULL, &error_fatal);
> +    sysbus_connect_irq(s, 0, qdev_get_gpio_in(ms_kb_orgate, 0));
> +    sysbus_connect_irq(s, 1, qdev_get_gpio_in(ms_kb_orgate, 1));
> +    qdev_connect_gpio_out(DEVICE(ms_kb_orgate), 0, slavio_irq[14]);
> +
>       dev = qdev_new(TYPE_ESCC);
>       qdev_prop_set_uint32(dev, "disabled", 0);
>       qdev_prop_set_uint32(dev, "frequency", ESCC_CLOCK);
> @@ -1009,10 +1016,16 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
>   
>       s = SYS_BUS_DEVICE(dev);
>       sysbus_realize_and_unref(s, &error_fatal);
> -    sysbus_connect_irq(s, 0, slavio_irq[15]);
> -    sysbus_connect_irq(s, 1,  slavio_irq[15]);
>       sysbus_mmio_map(s, 0, hwdef->serial_base);
>   
> +    /* Logically OR both its IRQs together */
> +    serial_orgate = DEVICE(object_new(TYPE_OR_IRQ));
> +    object_property_set_int(OBJECT(serial_orgate), "num-lines", 2, &error_fatal);
> +    qdev_realize_and_unref(serial_orgate, NULL, &error_fatal);
> +    sysbus_connect_irq(s, 0, qdev_get_gpio_in(serial_orgate, 0));
> +    sysbus_connect_irq(s, 1, qdev_get_gpio_in(serial_orgate, 1));
> +    qdev_connect_gpio_out(DEVICE(serial_orgate), 0, slavio_irq[15]);
> +
>       if (hwdef->apc_base) {
>           apc_init(hwdef->apc_base, qemu_allocate_irq(cpu_halt_signal, NULL, 0));
>       }

I've applied this to my qemu-sparc branch, with a slight tweak to the second 
object_property_set_int() line as it was giving a warning on checkpatch.pl for being 
just over 80 characters in length.


ATB,

Mark.

