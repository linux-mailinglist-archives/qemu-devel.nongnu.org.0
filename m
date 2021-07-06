Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C043BDE0B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 21:28:16 +0200 (CEST)
Received: from localhost ([::1]:35438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0qjv-0001b0-BL
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 15:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0qj2-0000jv-8D
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 15:27:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49850
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0qj0-0004yf-BN
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 15:27:20 -0400
Received: from host86-145-86-170.range86-145.btcentralplus.com
 ([86.145.86.170] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0qis-0005i6-5n; Tue, 06 Jul 2021 20:27:14 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210703141947.352295-1-f4bug@amsat.org>
 <20210703141947.352295-5-f4bug@amsat.org>
 <8d330b3b-cdae-1325-2bf0-b370705949e8@ilande.co.uk>
 <203e8c6c-94ac-e93b-8fa3-1ea64e9195e5@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <f3f0d3e2-88ea-467d-caa4-aa1ac91c6545@ilande.co.uk>
Date: Tue, 6 Jul 2021 20:27:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <203e8c6c-94ac-e93b-8fa3-1ea64e9195e5@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.145.86.170
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 4/6] dp8393x: Store CAM registers as 16-bit
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

On 06/07/2021 18:29, Philippe Mathieu-Daudé wrote:

> On 7/4/21 4:48 PM, Mark Cave-Ayland wrote:
>> On 03/07/2021 15:19, Philippe Mathieu-Daudé wrote:
>>
>>> Per the DP83932C datasheet from July 1995:
>>>
>>>     4.0 SONIC Registers
>>>     4.1 THE CAM UNIT
>>>
>>>       The Content Addressable Memory (CAM) consists of sixteen
>>>       48-bit entries for complete address filtering of network
>>>       packets. Each entry corresponds to a 48-bit destination
>>>       address that is user programmable and can contain any
>>>       combination of Multicast or Physical addresses. Each entry
>>>       is partitioned into three 16-bit CAM cells accessible
>>>       through CAM Address Ports (CAP 2, CAP 1 and CAP 0) with
>>>       CAP0 corresponding to the least significant 16 bits of
>>>       the Destination Address and CAP2 corresponding to the
>>>       most significant bits.
>>>
>>> Store the CAM registers as 16-bit as it simplifies the code.
>>> There is no change in the migration stream.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>    hw/net/dp8393x.c | 23 ++++++++++-------------
>>>    1 file changed, 10 insertions(+), 13 deletions(-)
> 
>>> @@ -987,7 +984,7 @@ static const VMStateDescription vmstate_dp8393x = {
>>>        .version_id = 0,
>>>        .minimum_version_id = 0,
>>>        .fields = (VMStateField []) {
>>> -        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 6),
>>> +        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 3 * 2),
>>>            VMSTATE_UINT16_ARRAY(regs, dp8393xState, 0x40),
>>>            VMSTATE_END_OF_LIST()
>>>        }
>>
>> I'd still be inclined to change VMSTATE_BUFFER_UNSAFE for
>> VMSTATE_UINT16_ARRAY whilst you can do it without having to worry about
>> the migration stream being already broken, but anyhow:
>>
>> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Do you want me to squash:
> 
> -- >8 --
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index 1d1837dbd38..4c2fa0aabbd 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -951,10 +951,10 @@ static void dp8393x_realize(DeviceState *dev,
> Error **errp)
> 
>   static const VMStateDescription vmstate_dp8393x = {
>       .name = "dp8393x",
> -    .version_id = 0,
> -    .minimum_version_id = 0,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
>       .fields = (VMStateField []) {
> -        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 3 * 2),
> +        VMSTATE_UINT16_ARRAY(cam, dp8393xState, 0, 16 * 3),
>           VMSTATE_UINT16_ARRAY(regs, dp8393xState, 0x40),
>           VMSTATE_END_OF_LIST()
>       }
> ---
> 
> Or send it as a new patch?

I don't mind either way. I think VMSTATE_UINT16_ARRAY is nicer, and it's very rare 
that you get the freedom to make a migration change like this without having to worry 
about compatibility. It's also really quick and easy to test.

If it passes your local tests and you would prefer to squash rather than re-post then 
you can also add a:

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

to the patchset. I included the list of guests I tested in the cover note, but forgot 
to explicitly add the T-b tag.


ATB,

Mark.

