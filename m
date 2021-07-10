Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60113C36F2
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 23:31:29 +0200 (CEST)
Received: from localhost ([::1]:53096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2KZM-0002JU-OV
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 17:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KX6-0001Y4-Cd
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 17:29:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56046
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KX3-0006c9-L8
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 17:29:08 -0400
Received: from host86-145-86-170.range86-145.btcentralplus.com
 ([86.145.86.170] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KWv-00042R-0u; Sat, 10 Jul 2021 22:29:01 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210710174954.2577195-1-f4bug@amsat.org>
 <20210710174954.2577195-7-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <36de5aff-cbf5-6398-774c-db482e1f1d35@ilande.co.uk>
Date: Sat, 10 Jul 2021 22:28:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710174954.2577195-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.145.86.170
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 6/8] dp8393x: Store CRC using device configured
 endianess
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

> Little-Endian CRC is dubious. The datasheet does not
> specify it being little-endian. Use big-endian access
> when the device is configured in such endianess.
> (This is a theoretical bug fix.)
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/net/dp8393x.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index 68516241a1f..ac93412f70b 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -827,7 +827,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
>       s->regs[SONIC_TRBA0] = s->regs[SONIC_CRBA0];
>   
>       /* Calculate the ethernet checksum */
> -    checksum = cpu_to_le32(crc32(0, buf, pkt_size));
> +    checksum = crc32(0, buf, pkt_size);
>   
>       /* Put packet into RBA */
>       trace_dp8393x_receive_packet(dp8393x_crba(s));
> @@ -837,8 +837,13 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
>       address += pkt_size;
>   
>       /* Put frame checksum into RBA */
> -    address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
> -                        &checksum, sizeof(checksum));
> +    if (s->big_endian) {
> +        address_space_stl_be(&s->as, address, checksum,
> +                             MEMTXATTRS_UNSPECIFIED, NULL);
> +    } else {
> +        address_space_stl_le(&s->as, address, checksum,
> +                             MEMTXATTRS_UNSPECIFIED, NULL);
> +    }
>       address += sizeof(checksum);
>   
>       /* Pad short packets to keep pointers aligned */

This is obviously new to the series: I can test this on big endian m68k but are you 
sure that this won't break big endian MIPS? Or do we not care for now since we don't 
have a working test image?


ATB,

Mark.

