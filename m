Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B649F5A70FA
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 00:43:49 +0200 (CEST)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT9xT-0000bb-Sd
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 18:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oT9vJ-0007FV-Ug; Tue, 30 Aug 2022 18:41:33 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:37752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oT9vI-0001a6-8f; Tue, 30 Aug 2022 18:41:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B516D74637E;
 Wed, 31 Aug 2022 00:41:28 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 80B747461AE; Wed, 31 Aug 2022 00:41:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7EE1F745702;
 Wed, 31 Aug 2022 00:41:28 +0200 (CEST)
Date: Wed, 31 Aug 2022 00:41:28 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 03/10] hw/isa/vt82c686: Prefer pci_address_space()
 over get_system_memory()
In-Reply-To: <20220830190048.67448-4-shentey@gmail.com>
Message-ID: <ab6151af-2f21-534d-815-ccb73269b43@eik.bme.hu>
References: <20220830190048.67448-1-shentey@gmail.com>
 <20220830190048.67448-4-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Aug 2022, Bernhard Beschow wrote:
> Unlike get_system_memory(), pci_address_space() respects the memory tree
> available to the parent device.

I don't know if this is correct but likely nothing will use it so probably 
does not break anything.

Regards,
BALATON Zoltan

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> hw/isa/vt82c686.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 9d12e1cae4..5582c0b179 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -589,7 +589,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>
>     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
>     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
> -    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
> +    isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
>                           &error_fatal);
>     s->isa_irqs = i8259_init(isa_bus, *isa_irq);
>     isa_bus_irqs(isa_bus, s->isa_irqs);
>

