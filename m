Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB8E68307A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:02:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMs8B-0005R5-V8; Tue, 31 Jan 2023 10:01:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMs7c-0005Ee-Uk
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:00:32 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMs7a-0000lc-9O
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:00:32 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 73E2974634B;
 Tue, 31 Jan 2023 15:58:01 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0F0A374632B; Tue, 31 Jan 2023 15:58:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0E1FE746324;
 Tue, 31 Jan 2023 15:58:01 +0100 (CET)
Date: Tue, 31 Jan 2023 15:58:01 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH 3/3] hw/isa/vt82c686: Implement ACPI powerdown
In-Reply-To: <20230129213418.87978-4-shentey@gmail.com>
Message-ID: <c598204b-4ca8-e054-30f1-b02e47b11f56@eik.bme.hu>
References: <20230129213418.87978-1-shentey@gmail.com>
 <20230129213418.87978-4-shentey@gmail.com>
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
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> hw/isa/vt82c686.c | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index b0765d4ed8..2db54d1649 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -33,8 +33,10 @@
> #include "qapi/error.h"
> #include "qemu/log.h"
> #include "qemu/module.h"
> +#include "qemu/notify.h"
> #include "qemu/range.h"
> #include "qemu/timer.h"
> +#include "sysemu/runstate.h"
> #include "trace.h"
>
> #define ACPI_ENABLE 0xf1
> @@ -50,6 +52,8 @@ struct ViaPMState {
>     APMState apm;
>     PMSMBus smb;
>
> +    Notifier powerdown_notifier;
> +
>     qemu_irq irq;

Is there a reason to leave blank lines here? Do they separate any logical 
blocks? If not please just drop them to allow mire lines to fit in one 
screen.

> };
>
> @@ -198,6 +202,14 @@ static void via_pm_reset(DeviceState *d)
>     smb_io_space_update(s);
> }
>
> +static void via_pm_powerdown_req(Notifier *n, void *opaque)
> +{
> +    ViaPMState *s = container_of(n, ViaPMState, powerdown_notifier);
> +
> +    assert(s != NULL);

Only piix4 seems to assert in this callback, all others assume this will 
work and indeed you register it from the realize method of the same object 
with its already type checked state struct so this should not need to 
check again so I think asserting here is overcautiousness.

As said in the cover all these are just small things I came across, sorry 
I can't give a better review of this.

Regards,
BALATON Zoltan

> +    acpi_pm1_evt_power_down(&s->ar);
> +}
> +
> static void via_pm_realize(PCIDevice *dev, Error **errp)
> {
>     ViaPMState *s = VIA_PM(dev);
> @@ -218,6 +230,9 @@ static void via_pm_realize(PCIDevice *dev, Error **errp)
>     acpi_pm_tmr_init(&s->ar, pm_tmr_timer, &s->io);
>     acpi_pm1_evt_init(&s->ar, pm_tmr_timer, &s->io);
>     acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2, false);
> +
> +    s->powerdown_notifier.notify = via_pm_powerdown_req;
> +    qemu_register_powerdown_notifier(&s->powerdown_notifier);
> }
>
> static void via_pm_init(Object *obj)
>

