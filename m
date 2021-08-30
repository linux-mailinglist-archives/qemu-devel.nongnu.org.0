Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EB33FB1C6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:17:57 +0200 (CEST)
Received: from localhost ([::1]:51598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbYF-0003FI-3f
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKbWX-0000Jp-Ep
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 03:16:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53062
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKbWU-0006bP-Fu
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 03:16:05 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKbW2-0001wN-9y; Mon, 30 Aug 2021 08:15:39 +0100
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210829100103.1950-1-mark.cave-ayland@ilande.co.uk>
 <20210829100103.1950-3-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA9WwdDfTAZDzseT4ox8z-BdEcdmFQ6Vn3JOoeF9Vu+6LQ@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <333a1ed4-0e04-214d-0766-3a45627e2620@ilande.co.uk>
Date: Mon, 30 Aug 2021 08:15:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9WwdDfTAZDzseT4ox8z-BdEcdmFQ6Vn3JOoeF9Vu+6LQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/3] escc: fix R_STATUS channel reset value
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.58,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/08/2021 14:17, Peter Maydell wrote:

> On Sun, 29 Aug 2021 at 11:07, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> According to the "Z80X30 Register Reset Values" table in the ESCC datasheet
>> bits 2 and 6 are set whilst bits 0 and 1 are cleared during channel reset.
>> All other bits should be left unaltered.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/char/escc.c | 9 ++++-----
>>   1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/char/escc.c b/hw/char/escc.c
>> index 63e0f15dfa..0f6957ba8b 100644
>> --- a/hw/char/escc.c
>> +++ b/hw/char/escc.c
>> @@ -281,12 +281,11 @@ static void escc_reset_chn(ESCCChannelState *s)
>>       s->wregs[W_MISC2] = MISC2_PLLDIS;
>>       /* Enable most interrupts */
>>       s->wregs[W_EXTINT] = EXTINT_DCD | EXTINT_SYNCINT | EXTINT_CTSINT |
>> -        EXTINT_TXUNDRN | EXTINT_BRKINT;
>> +                         EXTINT_TXUNDRN | EXTINT_BRKINT;
> 
> This indentation fix should probably have been in the
> coding-style-fixes patch.

Okay I can do that.

>> +    s->rregs[R_STATUS] &= ~(STATUS_RXAV | STATUS_ZERO);
>> +    s->rregs[R_STATUS] |= STATUS_TXEMPTY | STATUS_TXUNDRN;
>>       if (s->disabled) {
>> -        s->rregs[R_STATUS] = STATUS_TXEMPTY | STATUS_DCD | STATUS_SYNC |
>> -            STATUS_CTS | STATUS_TXUNDRN;
>> -    } else {
>> -        s->rregs[R_STATUS] = STATUS_TXEMPTY | STATUS_TXUNDRN;
>> +        s->rregs[R_STATUS] |= STATUS_DCD | STATUS_CTS;
>>       }
>>       s->rregs[R_SPEC] = SPEC_BITS8 | SPEC_ALLSENT;
> 
> We seem to use this function for both 'channel reset' and
> 'hardware reset' -- escc_reset just calls escc_reset_chn for
> each channel, and is used as the DeviceState::reset as well
> as for the 'hardware reset' you get by writing to WR9 with
> both D6 and D7 set to 1.
> 
> Because we want this software-triggered 'hardware reset' to not
> reset all registers to fixed values, I think we need to disentangle
> the power-on reset DeviceState::reset so that power-on reset always
> brings the device back to exactly the state that it has when QEMU
> first starts.

I'm currently struggling to understand what the initial power-on values are for the 
ESCC registers. According to the reset table both 'hardware reset' and 'software 
reset' don't change the values of all bits which implies the power-on state is 
different, but I can't seem to find a description of it anywhere? Could we assume 
that all ESCC registers are initialised to zero, and the guest will perform a 
suitable reset during driver initialisation?


ATB,

Mark.

