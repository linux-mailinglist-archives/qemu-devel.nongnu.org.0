Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BB444DB2E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 18:38:08 +0100 (CET)
Received: from localhost ([::1]:40542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlE1W-0002ng-IU
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 12:38:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlE0J-0001wz-2T
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:36:51 -0500
Received: from [2001:41c9:1:41f::167] (port=36482
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlE0H-0008Np-0m
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:36:50 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlE07-0004iA-Of; Thu, 11 Nov 2021 17:36:43 +0000
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211101203049.28925-1-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA9ApYeHVYN_MPU4VLLt3kYeg5mQbPJMCH1Hq=3tcO9Gfw@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <6782a57d-c435-a563-23dd-7fc53b65fb82@ilande.co.uk>
Date: Thu, 11 Nov 2021 17:36:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9ApYeHVYN_MPU4VLLt3kYeg5mQbPJMCH1Hq=3tcO9Gfw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] escc: update transmit status bits when switching to async
 mode
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.999,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/11/2021 14:46, Peter Maydell wrote:

> On Mon, 1 Nov 2021 at 20:31, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> The recent ESCC reset changes cause a regression when attemping to use a real
>> SS-5 Sun PROM instead of OpenBIOS. The Sun PROM doesn't send an explicit reset
>> command to the ESCC but gets stuck in a loop probing the keyboard waiting for
>> STATUS_TXEMPTY to be set in R_STATUS followed by SPEC_ALLSENT in R_SPEC.
>>
>> Reading through the ESCC datasheet again indicates that SPEC_ALLSENT is updated
>> when a write to W_TXCTRL1 selects async mode, or remains high if sync mode is
>> selected. Whilst there is no explicit mention of STATUS_TXEMPTY, the ESCC device
>> emulation always updates these two register bits together when transmitting data.
> 
> My reading of the spec is that this isn't the right behaviour. I think
> what we ought to have is:
>   * in both async and sync mode, TXEMPTY tracks the tx fifo status
>     (which I think means "set if there is any space in it", contrary to
>     what the name of the bit implies)

The wording is certainly confusing but the description on p.177 does state "This bit 
is set to 1 when the transmit buffer is empty". My impression from reading the 
initial paragraph is that the bit is reset to 0 whenever a character is added into 
the TX FIFO suggesting that if this bit is set to 1 then the TX FIFO is empty.

>   * in sync mode, ALLSENT is always high

Yes, agreed.

>   * in async mode, ALLSENT reads the same as TXEMPTY (for us, since we have
>     no extra delay between "data left the FIFO" and "data actually on the wire")

When I wrote the patch I was assuming that this might not be the case for escc_kbd 
and escc_mouse but I think you could be right here.

>   * in sync mode TXEMPTY is apparently also set "when the last bit of the CRC
>     has cleared the transmit shift register". I don't think I really understand
>     what sync mode TXEMPTY does overall, but clearly it is not "always 0".

Again the wording isn't particularly helpful here but I think what it is trying to 
say is that TXEMPTY remains reset to 0, even when the TX FIFO is empty, until after 
the hardware-generated CRC has been shifted out onto the wire.

>> Add extra logic to update both transmit status bits accordingly when writing to
>> W_TXCTRL1 which enables the Sun PROM to initialise and boot again under QEMU.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/char/escc.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/hw/char/escc.c b/hw/char/escc.c
>> index 0fce4f6324..b33cdc229f 100644
>> --- a/hw/char/escc.c
>> +++ b/hw/char/escc.c
>> @@ -575,6 +575,18 @@ static void escc_mem_write(void *opaque, hwaddr addr,
>>               s->wregs[s->reg] = val;
>>               break;
>>           case W_TXCTRL1:
>> +            s->wregs[s->reg] = val;
>> +            if (val & TXCTRL1_STPMSK) {
>> +                ESCCSERIOQueue *q = &s->queue;
>> +                if (s->type == escc_serial || q->count == 0) {
>> +                    s->rregs[R_STATUS] |= STATUS_TXEMPTY;
>> +                    s->rregs[R_SPEC] |= SPEC_ALLSENT;
>> +                }
> 
> ...should there be an 'else' clause here which clears these
> bits if we are now in async mode and the tx queue is not empty ?
> 
>> +            } else {
>> +                s->rregs[R_STATUS] &= ~STATUS_TXEMPTY;
>> +                s->rregs[R_SPEC] |= SPEC_ALLSENT;
>> +            }
> 
> Something is a bit odd with how we currently handle both these bits
> For SPEC_ALLSENT:
>   * it is zero on power-on
>   * soft-reset leaves it unchanged
>   * we set it on a write to SERIAL_DATA
>   * this new code adds two places where we set it
>   * but there is nowhere where we clear it
> 
> For STATUS_TXEMPTY:
>   * it is set on power-on and soft-reset
>   * it is set on write to SERIAL_DATA
>   * it is never cleared
> 
> Shouldn't we be clearing these bits somewhere ?
> 
>> +            /* fallthrough */
>>           case W_TXCTRL2:
>>               s->wregs[s->reg] = val;
>>               escc_update_parameters(s);
> 
> At this point all the "fallthrough" is doing is (1) repeat the
> setting of s->wregs[s->reg] and (2) call escc_update_parameters().
> So I think it would be clearer to instead make the two cases
> completely separate, and have
>     escc_update_parameters(s);
>     break;
> 
> instead of the /* fallthrough */.

I'm starting to wonder if asserting the reset signal does do the same as setting the 
hardware reset bit, since this would then enable the Sun PROM to pass the 
STATUS_TXEMPTY check. This would just leave the SPEC_ALLSENT bit which would be 
updated on a write to W_TXCTRL1 to pass the second check.

Assuming that QEMU will always accept the data then I think it would be a case of 
setting SPEC_ALLSENT regardless, since if there is no delay in transmitting the data 
then a transition of SPEC_ALLSENT will never be visible to the guest.

Certainly we need a solution for 6.2 since the majority of qemu-system-sparc users 
who boot Solaris use the real Sun PROM (many of the online tutorials were written 
when Artyom first merged his changes which was before OpenBIOS could boot Solaris).


ATB,

Mark.

