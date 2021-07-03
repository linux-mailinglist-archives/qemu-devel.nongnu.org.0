Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D38E3BA90B
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 16:40:45 +0200 (CEST)
Received: from localhost ([::1]:57658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzgp2-0004pP-Bi
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 10:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzgnm-0004Aj-4z
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:39:26 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41000
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzgnk-0004LI-93
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:39:25 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzgnN-0007gY-8x; Sat, 03 Jul 2021 15:39:05 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210703141947.352295-1-f4bug@amsat.org>
 <20210703141947.352295-3-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <88ef2d9c-7dcb-2e2e-037c-6af306ad2a12@ilande.co.uk>
Date: Sat, 3 Jul 2021 15:39:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210703141947.352295-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/6] dp8393x: don't force 32-bit register access
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
Cc: Jason Wang <jasowang@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/07/2021 15:19, Philippe Mathieu-Daudé wrote:

> From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" assumed that all accesses
> to the registers were 32-bit but this is actually not the case. The access size is
> determined by the CPU instruction used and not the number of physical address lines.
> 
> The big_endian workaround applied to the register read/writes was actually caused
> by forcing the access size to 32-bit when the guest OS was using a 16-bit access.
> Since the registers are 16-bit then we can simply set .impl.min_access to 2 and
> then the memory API will automatically do the right thing for both 16-bit accesses
> used by Linux and 32-bit accesses used by the MacOS toolbox ROM.

The change should work, but the commit message above needs a slight tweak - maybe 
something like this?

Since the registers are 16-bit then we can simply set both .impl.min_access and 
.impl.max_access to 2 and then the memory API will automatically do the right thing 
for both 16-bit accesses used by Linux and 32-bit accesses used by the MacOS toolbox ROM.

> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: 3fe9a838ec ("dp8393x: Always use 32-bit accesses")
> Tested-by: Finn Thain <fthain@linux-m68k.org>
> Message-Id: <20210625065401.30170-9-mark.cave-ayland@ilande.co.uk>
> [PMD: dp8393x_ops.impl.max_access_size 4 -> 2]
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/net/dp8393x.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index 11810c9b600..d16ade2b198 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -602,15 +602,14 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
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
> @@ -694,8 +693,8 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
>   static const MemoryRegionOps dp8393x_ops = {
>       .read = dp8393x_read,
>       .write = dp8393x_write,
> -    .impl.min_access_size = 4,
> -    .impl.max_access_size = 4,
> +    .impl.min_access_size = 2,
> +    .impl.max_access_size = 2,
>       .endianness = DEVICE_NATIVE_ENDIAN,
>   };


ATB,

Mark.

