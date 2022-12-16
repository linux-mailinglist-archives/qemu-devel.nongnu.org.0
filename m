Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890E164ED91
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:09:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6CJx-0006mZ-K0; Fri, 16 Dec 2022 10:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1p6CJt-0006lu-1k; Fri, 16 Dec 2022 10:08:19 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1p6CJo-0004c8-Uo; Fri, 16 Dec 2022 10:08:15 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C46E074812D;
 Fri, 16 Dec 2022 16:06:26 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8EB3A747FAB; Fri, 16 Dec 2022 16:06:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8D1BE746307;
 Fri, 16 Dec 2022 16:06:26 +0100 (CET)
Date: Fri, 16 Dec 2022 16:06:26 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Laurent Vivier <laurent@vivier.eu>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Greg Kurz <groug@kaod.org>, 
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 4/6] hw/ppc/e500: Prefer local variable over
 qdev_get_machine()
In-Reply-To: <20221216145709.271940-5-shentey@gmail.com>
Message-ID: <d46a0ac5-0dcf-a827-0522-bf511931becf@eik.bme.hu>
References: <20221216145709.271940-1-shentey@gmail.com>
 <20221216145709.271940-5-shentey@gmail.com>
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

On Fri, 16 Dec 2022, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> hw/ppc/e500.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 2fe496677c..ad83924004 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -959,7 +959,7 @@ void ppce500_init(MachineState *machine)
>     memory_region_add_subregion(address_space_mem, 0, machine->ram);
>
>     dev = qdev_new("e500-ccsr");
> -    object_property_add_child(qdev_get_machine(), "e500-ccsr",
> +    object_property_add_child(OBJECT(machine), "e500-ccsr",
>                               OBJECT(dev));

Cen the line break removed too? Looks like it fit in one line even before 
this change so not sure why was written in two lines. Maybe had some 
longer stuff there before qdev_get_machine().

Regards,
BALATON Zoltan

>     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>     ccsr = CCSR(dev);
> @@ -1002,7 +1002,7 @@ void ppce500_init(MachineState *machine)
>
>     /* PCI */
>     dev = qdev_new("e500-pcihost");
> -    object_property_add_child(qdev_get_machine(), "pci-host", OBJECT(dev));
> +    object_property_add_child(OBJECT(machine), "pci-host", OBJECT(dev));
>     qdev_prop_set_uint32(dev, "first_slot", pmc->pci_first_slot);
>     qdev_prop_set_uint32(dev, "first_pin_irq", pci_irq_nrs[0]);
>     s = SYS_BUS_DEVICE(dev);
>

