Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FFC3C36EB
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 23:26:49 +0200 (CEST)
Received: from localhost ([::1]:48768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2KUq-0007jQ-7A
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 17:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KSf-0006Om-KJ
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 17:24:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56004
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KSb-0003Nf-3V
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 17:24:33 -0400
Received: from host86-145-86-170.range86-145.btcentralplus.com
 ([86.145.86.170] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KSS-00040E-Nj; Sat, 10 Jul 2021 22:24:24 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210710174954.2577195-1-f4bug@amsat.org>
 <20210710174954.2577195-5-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <c729e8a4-33d6-89d5-cb16-27f20b12ff6e@ilande.co.uk>
Date: Sat, 10 Jul 2021 22:24:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710174954.2577195-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.145.86.170
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 4/8] dp8393x: Store CAM registers as 16-bit
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

> Per the DP83932C datasheet from July 1995:
> 
>    4.0 SONIC Registers
>    4.1 THE CAM UNIT
> 
>      The Content Addressable Memory (CAM) consists of sixteen
>      48-bit entries for complete address filtering of network
>      packets. Each entry corresponds to a 48-bit destination
>      address that is user programmable and can contain any
>      combination of Multicast or Physical addresses. Each entry
>      is partitioned into three 16-bit CAM cells accessible
>      through CAM Address Ports (CAP 2, CAP 1 and CAP 0) with
>      CAP0 corresponding to the least significant 16 bits of
>      the Destination Address and CAP2 corresponding to the
>      most significant bits.
> 
> Store the CAM registers as 16-bit as it simplifies the code.
> There is no change in the migration stream.
> 
> Co-developed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Co-developed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Missing:
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/net/dp8393x.c | 23 ++++++++++-------------
>   1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index 64f3b0fc3ea..2c3047c8688 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -158,7 +158,7 @@ struct dp8393xState {
>       MemoryRegion mmio;
>   
>       /* Registers */
> -    uint8_t cam[16][6];
> +    uint16_t cam[16][3];
>       uint16_t regs[SONIC_REG_COUNT];
>   
>       /* Temporaries */
> @@ -281,15 +281,13 @@ static void dp8393x_do_load_cam(dp8393xState *s)
>           address_space_read(&s->as, dp8393x_cdp(s),
>                              MEMTXATTRS_UNSPECIFIED, s->data, size);
>           index = dp8393x_get(s, width, 0) & 0xf;
> -        s->cam[index][0] = dp8393x_get(s, width, 1) & 0xff;
> -        s->cam[index][1] = dp8393x_get(s, width, 1) >> 8;
> -        s->cam[index][2] = dp8393x_get(s, width, 2) & 0xff;
> -        s->cam[index][3] = dp8393x_get(s, width, 2) >> 8;
> -        s->cam[index][4] = dp8393x_get(s, width, 3) & 0xff;
> -        s->cam[index][5] = dp8393x_get(s, width, 3) >> 8;
> -        trace_dp8393x_load_cam(index, s->cam[index][0], s->cam[index][1],
> -                               s->cam[index][2], s->cam[index][3],
> -                               s->cam[index][4], s->cam[index][5]);
> +        s->cam[index][0] = dp8393x_get(s, width, 1);
> +        s->cam[index][1] = dp8393x_get(s, width, 2);
> +        s->cam[index][2] = dp8393x_get(s, width, 3);
> +        trace_dp8393x_load_cam(index,
> +                               s->cam[index][0] >> 8, s->cam[index][0] & 0xff,
> +                               s->cam[index][1] >> 8, s->cam[index][1] & 0xff,
> +                               s->cam[index][2] >> 8, s->cam[index][2] & 0xff);
>           /* Move to next entry */
>           s->regs[SONIC_CDC]--;
>           s->regs[SONIC_CDP] += size;
> @@ -592,8 +590,7 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
>       case SONIC_CAP1:
>       case SONIC_CAP0:
>           if (s->regs[SONIC_CR] & SONIC_CR_RST) {
> -            val = s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - reg) + 1] << 8;
> -            val |= s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - reg)];
> +            val = s->cam[s->regs[SONIC_CEP] & 0xf][SONIC_CAP0 - reg];
>           }
>           break;
>       /* All other registers have no special contraints */
> @@ -989,7 +986,7 @@ static const VMStateDescription vmstate_dp8393x = {
>       .version_id = 0,
>       .minimum_version_id = 0,
>       .fields = (VMStateField []) {
> -        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 6),
> +        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 3 * 2),
>           VMSTATE_UINT16_ARRAY(regs, dp8393xState, SONIC_REG_COUNT),
>           VMSTATE_END_OF_LIST()
>       }

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

