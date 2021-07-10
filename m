Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70913C36FB
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 23:50:16 +0200 (CEST)
Received: from localhost ([::1]:57742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2KrX-0008IO-Rl
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 17:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KqB-0007Z3-Hr
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 17:48:51 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56090
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2Kq9-0002d4-6Z
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 17:48:51 -0400
Received: from host86-145-86-170.range86-145.btcentralplus.com
 ([86.145.86.170] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2Kq0-0004DA-9s; Sat, 10 Jul 2021 22:48:44 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210710174954.2577195-1-f4bug@amsat.org>
 <20210710174954.2577195-9-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <b2eec40c-7109-a963-e274-b5e19702ad5d@ilande.co.uk>
Date: Sat, 10 Jul 2021 22:48:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710174954.2577195-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.145.86.170
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [NOTFORMERGE PATCH v3 8/8] dp8393x: don't force 32-bit register
 access
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

> From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" set .impl.min_access_size
> and .impl.max_access_size to 4 to try and fix the Linux jazzsonic driver which uses
> 32-bit accesses.
> 
> The problem with forcing the register access to 32-bit in this way is that since the
> dp8393x uses 16-bit registers, a manual endian swap is required for devices on big
> endian machines with 32-bit accesses.
> 
> For both access sizes and machine endians the QEMU memory API can do the right thing
> automatically: all that is needed is to set .impl.min_access_size to 2 to declare that
> the dp8393x implements 16-bit registers.
> 
> Normally .impl.max_access_size should also be set to 2, however that doesn't quite
> work in this case since the register stride is specified using a (dynamic) it_shift
> property which is applied during the MMIO access itself. The effect of this is that
> for a 32-bit access the memory API performs 2 x 16-bit accesses, but the use of
> it_shift within the MMIO access itself causes the register value to be repeated in both
> the top 16-bits and bottom 16-bits. The Linux jazzsonic driver expects the stride to be
> zero-extended up to access size and therefore fails to correctly detect the dp8393x
> device due to the extra data in the top 16-bits.
> 
> The solution here is to remove .impl.max_access_size so that the memory API will
> correctly zero-extend the 16-bit registers to the access size up to and including
> it_shift. Since it_shift is never greater than 2 than this will always do the right
> thing for both 16-bit and 32-bit accesses regardless of the machine endian, allowing
> the manual endian swap code to be removed.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: 3fe9a838ec ("dp8393x: Always use 32-bit accesses")
> Message-Id: <20210705214929.17222-2-mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/net/dp8393x.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index a9224a5bc88..71c82a07c23 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -588,15 +588,14 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
>   
>       trace_dp8393x_read(reg, reg_names[reg], val, size);
>   
> -    return s->big_endian ? val << 16 : val;
> +    return val;
>   }
>   
> -static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
> +static void dp8393x_write(void *opaque, hwaddr addr, uint64_t val,
>                             unsigned int size)
>   {
>       dp8393xState *s = opaque;
>       int reg = addr >> s->it_shift;
> -    uint32_t val = s->big_endian ? data >> 16 : data;
>   
>       trace_dp8393x_write(reg, reg_names[reg], val, size);
>   
> @@ -677,11 +676,16 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
>       }
>   }
>   
> +/*
> + * Since .impl.max_access_size is effectively controlled by the it_shift
> + * property, leave it unspecified for now to allow the memory API to
> + * correctly zero extend the 16-bit register values to the access size up to and
> + * including it_shift.
> + */
>   static const MemoryRegionOps dp8393x_ops = {
>       .read = dp8393x_read,
>       .write = dp8393x_write,
> -    .impl.min_access_size = 4,
> -    .impl.max_access_size = 4,
> +    .impl.min_access_size = 2,
>       .endianness = DEVICE_NATIVE_ENDIAN,
>   };

Why has this been demoted to NOTFORMERGE? Removing the explicit .impl.max_access_size 
= 4 means that we fall back to the default .impl.max_access_size = 4 which already 
has a T-b tag from Finn for the series at 
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg07167.html which includes 
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg06814.html.

This patch with the explicit .impl.max_access_size = 4 was the primary motivation for 
posting the original series nearly a month ago: see the original version at 
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg03199.html.


ATB,

Mark.

