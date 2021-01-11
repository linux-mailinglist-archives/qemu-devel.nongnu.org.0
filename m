Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6C02F1FBB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:48:04 +0100 (CET)
Received: from localhost ([::1]:33484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz3AZ-0006WP-SP
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1kz2ix-0004WZ-0r; Mon, 11 Jan 2021 14:19:31 -0500
Received: from jedlik.phy.bme.hu ([152.66.102.83]:59582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1kz2iu-0000TB-TK; Mon, 11 Jan 2021 14:19:30 -0500
Received: by jedlik.phy.bme.hu (Postfix, from userid 1000)
 id CB2E8A00F9; Mon, 11 Jan 2021 20:19:25 +0100 (CET)
Date: Mon, 11 Jan 2021 20:19:25 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/ppc/ppc400_bamboo: Set dcr-base correctly when creating
 UIC
In-Reply-To: <20210111171623.18871-1-peter.maydell@linaro.org>
Message-ID: <alpine.LMD.2.03.2101112015580.7627@eik.bme.hu>
References: <20210111171623.18871-1-peter.maydell@linaro.org>
User-Agent: Alpine 2.03 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Received-SPF: none client-ip=152.66.102.83;
 envelope-from=balaton@jedlik.phy.bme.hu; helo=jedlik.phy.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jan 2021, Peter Maydell wrote:
> In commit 0270d74ef8862350 we switched from ppcuic_init() to directly
> creating the UIC device, but I missed that the Bamboo's UIC has a
> non-standard DCR base register value (0xc0 rather than the default
> of 0x30). This made Linux panic early in the boot process.
>
> Specify the correct dcr-base property value when creating the UIC.
>
> Fixes: 0270d74ef8862350
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reported-by?

> ---
> With this fix Nathan's test case goes on to eventually hit
> a QEMU assert:
> qemu-system-ppc: ../../hw/pci/pci.c:255: pci_bus_change_irq_level: Assertion `irq_num >= 0' failed.
> but it was doing that on 5.2 as well.
> ---
> hw/ppc/ppc440_bamboo.c | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index b156bcb9990..2c7a578ba73 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -198,6 +198,7 @@ static void bamboo_init(MachineState *machine)
>     uicdev = qdev_new(TYPE_PPC_UIC);
>     uicsbd = SYS_BUS_DEVICE(uicdev);
>
> +    qdev_prop_set_uint32(uicdev, "dcr-base", 0xc0);

This fixes Bamboo but not virtex and 405 which seem to have same problem 
as I've just shown in replies to those patches. So maybe this is better 
fixed by changing default value in ppc-uic.c to 0xc0 then. You say in 
commit message that 0xc0 is non-standard but most boards seem to use that 
than the default you have now. I don't know if there's a standard by the 
way or every CPU implementation just puts DCRs where they want.

Regards,
BALATON Zoltan

>     object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
>                              &error_fatal);
>     sysbus_realize_and_unref(uicsbd, &error_fatal);
> -- 
> 2.20.1
>
>
>

