Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7972E40C3FF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 12:52:29 +0200 (CEST)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQSWi-0002qR-Gx
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 06:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mQSUb-00029n-Ei
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:50:17 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:43193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mQSUY-0001bt-2b
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:50:16 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 16F677495EA;
 Wed, 15 Sep 2021 12:50:09 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E99AE7495DD; Wed, 15 Sep 2021 12:50:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E7D1A746398;
 Wed, 15 Sep 2021 12:50:08 +0200 (CEST)
Date: Wed, 15 Sep 2021 12:50:08 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 20/20] q800: configure nubus available slots for Quadra
 800
In-Reply-To: <20210915101026.25174-21-mark.cave-ayland@ilande.co.uk>
Message-ID: <34dbcdd0-c328-b6e5-c6da-dcc22cdb58f0@eik.bme.hu>
References: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
 <20210915101026.25174-21-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Sep 2021, Mark Cave-Ayland wrote:
> Slot 0x9 is reserved for use by the in-built framebuffer whilst only slots
> 0xc, 0xd and 0xe physically exist on the Quadra 800.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
> hw/m68k/q800.c | 9 +++++++++
> 1 file changed, 9 insertions(+)
>
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index fbc45a301f..65c80421c6 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -78,6 +78,13 @@
>
> #define MAC_CLOCK  3686418
>
> +/*
> + * Slot 0x9 is reserved for use by the in-built framebuffer whilst only
> + * slots 0xc, 0xd and 0xe physically exist on the Quadra 800
> + */
> +#define Q800_NUBUS_SLOTS_AVAILABLE    ((1UL << 0x9) | (1UL << 0xc) | \
> +                                       (1UL << 0xd) | (1UL << 0xe))

There is a BIT(x) macro for these kind of constants that I find more 
readable as there would be less < signs and perenthesis but I don't insist 
on using it just note for consideration in case you need another respin for 
other reasons. (That macro could also be used to shorten the ~(1UL << nr_bits)
values in other patches.)

Regards.
BALATON Zoltan

> +
> /*
>  * The GLUE (General Logic Unit) is an Apple custom integrated circuit chip
>  * that performs a variety of functions (RAM management, clock generation, ...).
> @@ -392,6 +399,8 @@ static void q800_init(MachineState *machine)
>     /* NuBus */
>
>     dev = qdev_new(TYPE_MAC_NUBUS_BRIDGE);
> +    qdev_prop_set_uint32(dev, "slot-available-mask",
> +                         Q800_NUBUS_SLOTS_AVAILABLE);
>     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 9 * NUBUS_SUPER_SLOT_SIZE);
>     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
>

