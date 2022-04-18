Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08372504D99
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 10:16:16 +0200 (CEST)
Received: from localhost ([::1]:55236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngMYQ-0003zD-BH
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 04:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ngMV9-00039F-2H; Mon, 18 Apr 2022 04:12:51 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ngMV6-0003Tt-MD; Mon, 18 Apr 2022 04:12:50 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ngMUA-0009qh-CT; Mon, 18 Apr 2022 09:11:54 +0100
Message-ID: <fc307865-bf41-3ba7-8852-d100c3c6944b@ilande.co.uk>
Date: Mon, 18 Apr 2022 09:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220412164921.1685453-1-peter.maydell@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220412164921.1685453-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-7.1] hw/block/fdc-sysbus: Always mark sysbus floppy
 controllers as not having DMA
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: John Snow <jsnow@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/04/2022 17:49, Peter Maydell wrote:

> The sysbus floppy controllers (devices sysbus-fdc and sun-fdtwo)
> don't support DMA.  The core floppy controller code expects this to
> be indicated by setting FDCtrl::dma_chann to -1.  This used to be
> done in the device instance_init functions sysbus_fdc_initfn() and
> sun4m_fdc_initfn(), but in commit 1430759ec3e we refactored this code
> and accidentally lost the setting of dma_chann.
> 
> For sysbus-fdc this has no ill effects because we were redundantly
> also setting dma_chann in fdctrl_init_sysbus(), but for sun-fdtwo
> this means that guests which try to enable DMA on the floppy
> controller will cause QEMU to crash because FDCtrl::dma is NULL.
> 
> Set dma_chann to -1 in the common instance init, and remove the
> redundant code in fdctrl_init_sysbus() that is also setting it.
> 
> There is a six-year-old FIXME comment in the jazz board code to the
> effect that in theory it should support doing DMA via a custom DMA
> controller.  If anybody ever chooses to fix that they can do it by
> adding support for setting both FDCtrl::dma_chann and FDCtrl::dma.
> (A QOM link property 'dma-controller' on the sysbus device which can
> be set to an instance of IsaDmaClass is probably the way to go.)
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/958
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/block/fdc.h |  3 +--
>   hw/block/fdc-sysbus.c  | 14 +++++++++++---
>   hw/mips/jazz.c         |  2 +-
>   3 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/block/fdc.h b/include/hw/block/fdc.h
> index 1ecca7cac7f..35248c08379 100644
> --- a/include/hw/block/fdc.h
> +++ b/include/hw/block/fdc.h
> @@ -10,8 +10,7 @@
>   #define TYPE_ISA_FDC "isa-fdc"
>   
>   void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds);
> -void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
> -                        hwaddr mmio_base, DriveInfo **fds);
> +void fdctrl_init_sysbus(qemu_irq irq, hwaddr mmio_base, DriveInfo **fds);
>   void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
>                          DriveInfo **fds, qemu_irq *fdc_tc);
>   
> diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
> index 57fc8773f12..6c22c3510da 100644
> --- a/hw/block/fdc-sysbus.c
> +++ b/hw/block/fdc-sysbus.c
> @@ -94,8 +94,7 @@ static void fdctrl_handle_tc(void *opaque, int irq, int level)
>       trace_fdctrl_tc_pulse(level);
>   }
>   
> -void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
> -                        hwaddr mmio_base, DriveInfo **fds)
> +void fdctrl_init_sysbus(qemu_irq irq, hwaddr mmio_base, DriveInfo **fds)
>   {
>       FDCtrl *fdctrl;
>       DeviceState *dev;
> @@ -105,7 +104,6 @@ void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
>       dev = qdev_new("sysbus-fdc");
>       sys = SYSBUS_FDC(dev);
>       fdctrl = &sys->state;
> -    fdctrl->dma_chann = dma_chann; /* FIXME */
>       sbd = SYS_BUS_DEVICE(dev);
>       sysbus_realize_and_unref(sbd, &error_fatal);
>       sysbus_connect_irq(sbd, 0, irq);
> @@ -138,6 +136,16 @@ static void sysbus_fdc_common_instance_init(Object *obj)
>       FDCtrlSysBus *sys = SYSBUS_FDC(obj);
>       FDCtrl *fdctrl = &sys->state;
>   
> +    /*
> +     * DMA is not currently supported for sysbus floppy controllers.
> +     * If we wanted to add support then probably the best approach is
> +     * to have a QOM link property 'dma-controller' which the board
> +     * code can set to an instance of IsaDmaClass, and an integer
> +     * property 'dma-channel', so that we can set fdctrl->dma and
> +     * fdctrl->dma_chann accordingly.
> +     */
> +    fdctrl->dma_chann = -1;
> +
>       qdev_set_legacy_instance_id(dev, 0 /* io */, 2); /* FIXME */
>   
>       memory_region_init_io(&fdctrl->iomem, obj,
> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
> index 44f0d48bfd7..14eaa517435 100644
> --- a/hw/mips/jazz.c
> +++ b/hw/mips/jazz.c
> @@ -354,7 +354,7 @@ static void mips_jazz_init(MachineState *machine,
>           fds[n] = drive_get(IF_FLOPPY, 0, n);
>       }
>       /* FIXME: we should enable DMA with a custom IsaDma device */
> -    fdctrl_init_sysbus(qdev_get_gpio_in(rc4030, 1), -1, 0x80003000, fds);
> +    fdctrl_init_sysbus(qdev_get_gpio_in(rc4030, 1), 0x80003000, fds);
>   
>       /* Real time clock */
>       mc146818_rtc_init(isa_bus, 1980, NULL);

Looks good to me so:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

