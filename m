Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375A1332BC2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:20:37 +0100 (CET)
Received: from localhost ([::1]:53852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJf64-0005Hi-3H
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:20:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJefM-0004Ma-RY
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:00 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:28838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJefC-00013Y-7m
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:00 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 850A27456E3;
 Tue,  9 Mar 2021 16:52:43 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 617457456B7; Tue,  9 Mar 2021 16:52:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5F67F7456B4;
 Tue,  9 Mar 2021 16:52:43 +0100 (CET)
Date: Tue, 9 Mar 2021 16:52:43 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH RESEND 6/6] hw/mips/gt64xxx: Let the GT64120 manage the
 lower 512MiB hole
In-Reply-To: <20210309142630.728014-7-f4bug@amsat.org>
Message-ID: <b9ef5f78-157a-723d-b527-78f58719478a@eik.bme.hu>
References: <20210309142630.728014-1-f4bug@amsat.org>
 <20210309142630.728014-7-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1565047191-1615305163=:73634"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1565047191-1615305163=:73634
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 9 Mar 2021, Philippe Mathieu-Daudé wrote:
> Per the comment in the Malta board, the [0x0000.0000-0x2000.0000]
> range is decoded by the GT64120, so move the "empty_slot" there.

I don't know anything about it to be able to review but is this a feature 
of the GT64120 chip (in which case the change is correct) or the Malta 
board (in which case this might make the GT64120 model board specific that 
may not matter much as there's nothing else using it now).

Regards,
BALATON Zoltan

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/mips/gt64xxx_pci.c | 8 ++++++++
> hw/mips/malta.c       | 7 -------
> 2 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index 43349d6837d..a3926e5cb8a 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -29,6 +29,7 @@
> #include "hw/mips/mips.h"
> #include "hw/pci/pci.h"
> #include "hw/pci/pci_host.h"
> +#include "hw/misc/empty_slot.h"
> #include "hw/southbridge/piix.h"
> #include "migration/vmstate.h"
> #include "hw/intc/i8259.h"
> @@ -1206,6 +1207,13 @@ static void gt64120_realize(DeviceState *dev, Error **errp)
>
>     memory_region_init_io(&s->ISD_mem, OBJECT(dev), &isd_mem_ops, s,
>                           "gt64120-isd", 0x1000);
> +
> +    /*
> +     * The whole address space decoded by the GT-64120A doesn't generate
> +     * exception when accessing invalid memory. Create an empty slot to
> +     * emulate this feature.
> +     */
> +    empty_slot_init("GT64120", 0, 0x20000000);
> }
>
> PCIBus *gt64120_register(qemu_irq *pic)
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 9afc0b427bf..b2469f8ee78 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -56,7 +56,6 @@
> #include "sysemu/runstate.h"
> #include "qapi/error.h"
> #include "qemu/error-report.h"
> -#include "hw/misc/empty_slot.h"
> #include "sysemu/kvm.h"
> #include "hw/semihosting/semihost.h"
> #include "hw/mips/cps.h"
> @@ -1396,12 +1395,6 @@ void mips_malta_init(MachineState *machine)
>
>     /* Northbridge */
>     pci_bus = gt64120_register(s->i8259);
> -    /*
> -     * The whole address space decoded by the GT-64120A doesn't generate
> -     * exception when accessing invalid memory. Create an empty slot to
> -     * emulate this feature.
> -     */
> -    empty_slot_init("GT64120", 0, 0x20000000);
>
>     /* Southbridge */
>     dev = piix4_create(pci_bus, &isa_bus, &smbus);
>
--3866299591-1565047191-1615305163=:73634--

