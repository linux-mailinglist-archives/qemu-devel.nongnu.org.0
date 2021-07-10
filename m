Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A23C36E6
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 23:24:57 +0200 (CEST)
Received: from localhost ([::1]:46608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2KT2-0006BZ-Lv
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 17:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KRb-0005NX-4X
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 17:23:27 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55992
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KRZ-0002k7-Ip
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 17:23:26 -0400
Received: from host86-145-86-170.range86-145.btcentralplus.com
 ([86.145.86.170] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KRQ-0003zm-3A; Sat, 10 Jul 2021 22:23:20 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210710174954.2577195-1-f4bug@amsat.org>
 <20210710174954.2577195-4-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <8fe8f237-bbb9-78cc-4cf0-8b4932077566@ilande.co.uk>
Date: Sat, 10 Jul 2021 22:23:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710174954.2577195-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.145.86.170
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 3/8] dp8393x: Only shift the device registers mapping
 by 1 bit
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/07/2021 18:49, Philippe Mathieu-Daudé wrote:

> The SONIC device only allows 16/32-bit accesses. From the machine
> view (from the bus), it is only shifted by 1 bit. Another bit is
> shifted, but it is an implementation detail of the QEMU model.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/m68k/q800.c   | 2 +-
>   hw/mips/jazz.c   | 2 +-
>   hw/net/dp8393x.c | 2 ++
>   3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index 6817c8b5d1a..d78edfe40e8 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -316,7 +316,7 @@ static void q800_init(MachineState *machine)
>   
>       dev = qdev_new("dp8393x");
>       qdev_set_nic_properties(dev, &nd_table[0]);
> -    qdev_prop_set_uint8(dev, "it_shift", 2);
> +    qdev_prop_set_uint8(dev, "it_shift", 1);
>       qdev_prop_set_bit(dev, "big_endian", true);
>       object_property_set_link(OBJECT(dev), "dma_mr",
>                                OBJECT(get_system_memory()), &error_abort);
> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
> index d6183e18821..7f8680a189d 100644
> --- a/hw/mips/jazz.c
> +++ b/hw/mips/jazz.c
> @@ -295,7 +295,7 @@ static void mips_jazz_init(MachineState *machine,
>   
>               dev = qdev_new("dp8393x");
>               qdev_set_nic_properties(dev, nd);
> -            qdev_prop_set_uint8(dev, "it_shift", 2);
> +            qdev_prop_set_uint8(dev, "it_shift", 1);
>               qdev_prop_set_bit(dev, "big_endian", big_endian > 0);
>               object_property_set_link(OBJECT(dev), "dma_mr",
>                                        OBJECT(rc4030_dma_mr), &error_abort);
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index d1e147a82a6..64f3b0fc3ea 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -971,6 +971,8 @@ static void dp8393x_realize(DeviceState *dev, Error **errp)
>   {
>       dp8393xState *s = DP8393X(dev);
>   
> +    s->it_shift += 1; /* Registers are 16-bit wide */
> +
>       address_space_init(&s->as, s->dma_mr, "dp8393x");
>       memory_region_init_io(&s->mmio, OBJECT(dev), &dp8393x_ops, s,
>                             "dp8393x-regs", SONIC_REG_COUNT << s->it_shift);

This patch looks wrong to me: by convention it_shift is used to implement the 
register stride, so by reducing this from 2 to 1 you've immediately broken the POLA 
regarding the it_shift property. There could be an argument that there is an 
intermediate bus that could be modelled for 16-bit accesses here, but this is worked 
around (and clearly commented) in patch 8.


ATB,

Mark.

