Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D623BA912
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 16:59:05 +0200 (CEST)
Received: from localhost ([::1]:41318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzh6m-0005IU-5L
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 10:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzh5a-0003ZX-M5
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:57:50 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41048
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzh5Z-0007zJ-1v
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:57:50 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzh5D-0007p1-2t; Sat, 03 Jul 2021 15:57:31 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210703141947.352295-1-f4bug@amsat.org>
 <20210703141947.352295-6-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <b0c412f7-af6c-2283-dfb4-6ac38e32f7d3@ilande.co.uk>
Date: Sat, 3 Jul 2021 15:57:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210703141947.352295-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 5/6] dp8393x: Replace address_space_rw(is_write=1) by
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
Cc: Jason Wang <jasowang@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/07/2021 15:19, Philippe Mathieu-Daudé wrote:

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/net/dp8393x.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index e0055b178b1..bbe241ef9db 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -814,8 +814,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
>           size = sizeof(uint16_t) * width;
>           address = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
>           dp8393x_put(s, width, 0, 0);
> -        address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
> -                         (uint8_t *)s->data, size, 1);
> +        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
> +                            (uint8_t *)s->data, size);
>   
>           /* Move to next descriptor */
>           s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
> @@ -844,8 +844,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
>       /* Pad short packets to keep pointers aligned */
>       if (rx_len < padded_len) {
>           size = padded_len - rx_len;
> -        address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
> -            (uint8_t *)"\xFF\xFF\xFF", size, 1);
> +        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
> +                            (uint8_t *)"\xFF\xFF\xFF", size);
>           address += size;
>       }

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

