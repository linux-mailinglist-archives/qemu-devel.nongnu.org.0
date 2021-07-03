Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0CE3BA90E
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 16:53:48 +0200 (CEST)
Received: from localhost ([::1]:35174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzh1f-0000yX-8N
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 10:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzh0t-0008Pe-PL
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:52:59 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41018
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzh0r-0004kn-VW
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:52:59 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzh0V-0007mI-QH; Sat, 03 Jul 2021 15:52:39 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210703141947.352295-1-f4bug@amsat.org>
 <20210703141947.352295-4-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <6bbd0c5b-bbc5-7d2f-75e6-d2538631def3@ilande.co.uk>
Date: Sat, 3 Jul 2021 15:52:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210703141947.352295-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 3/6] dp8393x: Restrict bus access to 16/32-bit
 operations
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

> Per the DP83932C datasheet from July 1995:
> 
>    1. Functional Description
>    1.3 DATA WIDTH AND BYTE ORDERING
> 
>      The SONIC can be programmed to operate with
>      either 32-bit or 16-bit wide memory.
> 
> Restrict the memory bus to reject 8/64-bit accesses.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/net/dp8393x.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index d16ade2b198..c9b478c127c 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -695,6 +695,8 @@ static const MemoryRegionOps dp8393x_ops = {
>       .write = dp8393x_write,
>       .impl.min_access_size = 2,
>       .impl.max_access_size = 2,
> +    .valid.min_access_size = 2,
> +    .valid.max_access_size = 4,
>       .endianness = DEVICE_NATIVE_ENDIAN,
>   };

The changes to .valid are correct, but I don't think the above reference to the 
datasheet is. My reading of the sentence in section 1.3 "The SONIC can be programmed 
to operate with either 32-bit or 16-bit wide memory" (along with subsequent 
references to the DW bit in the DCR) is that this section is describing bus master 
transfers as per figure 1-5 instead of register accesses which is what this patch 
changes.

I think you could simply squash this patch into the previous one since there will 
already be a behaviour change there.


ATB,

Mark.

