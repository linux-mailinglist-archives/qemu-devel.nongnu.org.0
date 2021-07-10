Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046593C36E3
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 23:18:27 +0200 (CEST)
Received: from localhost ([::1]:42026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2KMk-0002JT-JC
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 17:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KKt-0001R4-Vm
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 17:16:32 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55962
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KKs-0006Tp-AX
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 17:16:31 -0400
Received: from host86-145-86-170.range86-145.btcentralplus.com
 ([86.145.86.170] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KKf-0003wa-DO; Sat, 10 Jul 2021 22:16:21 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210710174954.2577195-1-f4bug@amsat.org>
 <20210710174954.2577195-2-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <a8bd69ff-0651-c426-4d0d-704f1835991b@ilande.co.uk>
Date: Sat, 10 Jul 2021 22:16:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710174954.2577195-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.145.86.170
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 1/8] dp8393x: Replace address_space_rw(is_write=1) by
 address_space_write()
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

> Replace address_space_rw(is_write=1) by address_space_write()
> and remove pointless cast.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/net/dp8393x.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index 11810c9b600..9118364aa33 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -816,8 +816,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
>           size = sizeof(uint16_t) * width;
>           address = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
>           dp8393x_put(s, width, 0, 0);
> -        address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
> -                         (uint8_t *)s->data, size, 1);
> +        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
> +                            s->data, size);
>   
>           /* Move to next descriptor */
>           s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
> @@ -846,8 +846,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
>       /* Pad short packets to keep pointers aligned */
>       if (rx_len < padded_len) {
>           size = padded_len - rx_len;
> -        address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
> -            (uint8_t *)"\xFF\xFF\xFF", size, 1);
> +        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
> +                            "\xFF\xFF\xFF", size);
>           address += size;
>       }

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

