Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE91683027
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:00:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMs4f-0003rG-0P; Tue, 31 Jan 2023 09:57:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMs4V-0003X2-8R
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:57:20 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMs4T-0008Vm-3K
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:57:19 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4C51C7462DB;
 Tue, 31 Jan 2023 15:54:48 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D84E7745720; Tue, 31 Jan 2023 15:54:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D6033745706;
 Tue, 31 Jan 2023 15:54:47 +0100 (CET)
Date: Tue, 31 Jan 2023 15:54:47 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH 2/3] hw/isa/vt82c686: Allow PM controller to switch to
 ACPI mode
In-Reply-To: <20230129213418.87978-3-shentey@gmail.com>
Message-ID: <9611ad50-1c60-de0a-e8e0-85b487950888@eik.bme.hu>
References: <20230129213418.87978-1-shentey@gmail.com>
 <20230129213418.87978-3-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, 29 Jan 2023, Bernhard Beschow wrote:
> Adds missing functionality the real hardware supports.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> hw/isa/vt82c686.c | 18 +++++++++++++++++-
> 1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 2189be6f20..b0765d4ed8 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -37,6 +37,9 @@
> #include "qemu/timer.h"
> #include "trace.h"
>
> +#define ACPI_ENABLE 0xf1
> +#define ACPI_DISABLE 0xf0

Are these some standard in which case they should be in a shared acpi 
header or chip specific, then we could just put it in a comment, see 
below.

> +
> #define TYPE_VIA_PM "via-pm"
> OBJECT_DECLARE_SIMPLE_TYPE(ViaPMState, VIA_PM)
>
> @@ -50,6 +53,19 @@ struct ViaPMState {
>     qemu_irq irq;
> };
>
> +static void via_pm_apm_ctrl_changed(uint32_t val, void *arg)
> +{
> +    ViaPMState *s = arg;
> +
> +    /* ACPI specs 3.0, 4.7.2.5 */
> +    acpi_pm1_cnt_update(&s->ar, val == ACPI_ENABLE, val == ACPI_DISABLE);
> +    if (val == ACPI_ENABLE || val == ACPI_DISABLE) {
> +        return;
> +    }
> +
> +    qemu_log_mask(LOG_UNIMP, "%s: unimplemented value 0x%x", __func__, val);

Maybe a switch is more readable here:

switch(val) {
case 0xf1: /* Enable */
case 0xf0: /* Disable */
     acpi_pm1_cnt_update(&s->ar, val & 1, val & 1);
     break;
default:
     qemu_log_mask(LOG_UNIMP, "%s: unimplemented value 0x%x", __func__, val);
}

Or maybe not, it can be personal preference. (Why does 
acpi_pm1_cnt_update() take two arguments for a bool value? Can these be 
both true or false at the same time?)

Regards,
BALATON Zoltan

> +}
> +
> static void pm_io_space_update(ViaPMState *s)
> {
>     uint32_t pmbase = pci_get_long(s->dev.config + 0x48) & 0xff80UL;
> @@ -193,7 +209,7 @@ static void via_pm_realize(PCIDevice *dev, Error **errp)
>     memory_region_add_subregion(pci_address_space_io(dev), 0, &s->smb.io);
>     memory_region_set_enabled(&s->smb.io, false);
>
> -    apm_init(dev, &s->apm, NULL, s);
> +    apm_init(dev, &s->apm, via_pm_apm_ctrl_changed, s);
>
>     memory_region_init_io(&s->io, OBJECT(dev), &pm_io_ops, s, "via-pm", 128);
>     memory_region_add_subregion(pci_address_space_io(dev), 0, &s->io);
>

