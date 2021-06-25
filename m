Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03793B42B9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 13:53:13 +0200 (CEST)
Received: from localhost ([::1]:51698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwkOW-0000Jb-Dv
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 07:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwkNk-0007kA-5x
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:52:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59430
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwkNi-0004qd-JI
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:52:23 -0400
Received: from host109-153-84-9.range109-153.btcentralplus.com ([109.153.84.9]
 helo=[192.168.1.65]) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwkNJ-0008KZ-2C; Fri, 25 Jun 2021 12:52:01 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, hpoussin@reactos.org,
 fthain@telegraphics.com.au
References: <20210625073844.1229-1-mark.cave-ayland@ilande.co.uk>
 <20210625073844.1229-2-mark.cave-ayland@ilande.co.uk>
 <8a788aba-6914-163d-e98a-20dc088024e1@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <6e7db215-913e-c892-d817-c97358c18b33@ilande.co.uk>
Date: Fri, 25 Jun 2021 12:52:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8a788aba-6914-163d-e98a-20dc088024e1@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/2] g364fb: use RAM memory region for framebuffer
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/06/2021 09:37, Philippe Mathieu-Daudé wrote:

> On 6/25/21 9:38 AM, Mark Cave-Ayland wrote:
>> Since the migration stream is already broken, we can use this opportunity to
>> change the framebuffer so that it is migrated as a RAM memory region rather
>> than as an array of bytes.
>>
>> In particular this helps the output of the analyze-migration.py tool which
>> no longer contains a huge array representing the framebuffer contents.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/display/g364fb.c | 15 +++++++--------
>>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
>> @@ -454,7 +457,6 @@ static const VMStateDescription vmstate_g364fb = {
>>       .minimum_version_id = 1,
> 
> Even if broken, I'd increase to version as good practice.

Sure - I'll go ahead and do that for a v2. The reason I wasn't too worried was 
because since the wrong struct is used for saving data, the outgoing stream is 
corrupted so all bets are off on being able to reload it(!).

>>       .post_load = g364fb_post_load,
>>       .fields = (VMStateField[]) {
>> -        VMSTATE_VBUFFER_UINT32(vram, G364State, 1, NULL, vram_size),
>>           VMSTATE_BUFFER_UNSAFE(color_palette, G364State, 0, 256 * 3),
>>           VMSTATE_BUFFER_UNSAFE(cursor_palette, G364State, 0, 9),
>>           VMSTATE_UINT16_ARRAY(cursor, G364State, 512),
> 
> The vram pointer is now unused, we can remove it:

Indeed. I remember thinking I had to do this, but clearly forgot. Will fix.

> -- >8 --
> diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
> index 990ef3afdd8..11ad61fa73a 100644
> --- a/hw/display/g364fb.c
> +++ b/hw/display/g364fb.c
> @@ -34,7 +34,6 @@
> 
>   typedef struct G364State {
>       /* hardware */
> -    uint8_t *vram;
>       uint32_t vram_size;
>       qemu_irq irq;
>       MemoryRegion mem_vram;
> ---
> 
> Removing 'uint8_t *vram':
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


ATB,

Mark.

