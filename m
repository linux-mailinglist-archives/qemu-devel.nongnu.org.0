Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC69E674579
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 23:03:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIczk-00024n-Ld; Thu, 19 Jan 2023 17:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pIczW-000212-Jo; Thu, 19 Jan 2023 17:02:38 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pIczS-0006b3-Em; Thu, 19 Jan 2023 17:02:36 -0500
Received: from [192.168.0.20] (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 29C8620E09FD;
 Thu, 19 Jan 2023 14:02:31 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 29C8620E09FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674165752;
 bh=bjL/baM7wjIGagE14YBNqI9Zd7koJOwlvL477ydbRAQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jiLb9vHxs5PzNc4rRvvSVrvSzRr2qme+/sp+NiwxpVZBu5UcRPFOo1MxHaWHNC00B
 c7Q+uxqd306g2AlpjYc79PglLVJMle+DOJs7s+SDfugxW6X+Ofcpbi4V730nVXKmd4
 8s6dX9mVdZQPGkCxcGrdAP0QCs8KUzeAEFi8wYTs=
Message-ID: <b1228a0e-8677-eaec-9040-e90a821d25a9@linux.microsoft.com>
Date: Thu, 19 Jan 2023 23:02:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/4] hw/char/pl011: refactor FIFO depth handling code
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
 <20230117220523.20911-2-eiakovlev@linux.microsoft.com>
 <CAFEAcA9EndzEQA7CPszBCFJyzSgD7=FqeFFK-LHxucTA=CSimA@mail.gmail.com>
Content-Language: en-US
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
In-Reply-To: <CAFEAcA9EndzEQA7CPszBCFJyzSgD7=FqeFFK-LHxucTA=CSimA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -198
X-Spam_score: -19.9
X-Spam_bar: -------------------
X-Spam_report: (-19.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 1/19/2023 14:45, Peter Maydell wrote:
> On Tue, 17 Jan 2023 at 22:05, Evgeny Iakovlev
> <eiakovlev@linux.microsoft.com> wrote:
>> PL011 can be in either of 2 modes depending guest config: FIFO and
>> single register. The last mode could be viewed as a 1-element-deep FIFO.
>>
>> Current code open-codes a bunch of depth-dependent logic. Refactor FIFO
>> depth handling code to isolate calculating current FIFO depth.
>>
>> One functional (albeit guest-invisible) side-effect of this change is
>> that previously we would always increment s->read_pos in UARTDR read
>> handler even if FIFO was disabled, now we are limiting read_pos to not
>> exceed FIFO depth (read_pos itself is reset to 0 if user disables FIFO).
>>
>> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
>> ---
>>   hw/char/pl011.c         | 25 +++++++++++++------------
>>   include/hw/char/pl011.h |  5 ++++-
>>   2 files changed, 17 insertions(+), 13 deletions(-)
> Looking at this again, I realised that there's a subtle point
> here about migration compatibility. If we do a VM migration
> from an older version of QEMU without this change to a newer
> version that does have this change, the incoming migration state
> might indicate that we have FIFOs disabled, and there's a character
> in read_fifo[] that isn't in array element 0 (because the old
> code doesn't put it there). I think this works out OK because
> the codepath in the UARTDR read-from-FIFO will first read the
> character from read_fifo[read_pos], which will be the non-zero
> read_pos as set by the old QEMU, before constraining it to be
> 0 when it does the advance of read_pos; and the pl011_put_fifo
> code doesn't care about the actual value of read_pos.
>
> But this is kind of tricky to reason about, and fragile to
> future changes in the code, so I feel like it would be better
> to have a migration post_load function that sanitizes the
> incoming state to enforce the invariant assumed by the new code, i.e.
>
>    if (pl011_fifo_depth(s) == 1 && s->read_count > 0 && s->read_pos > 0) {
>        /*
>         * Older versions of QEMU didn't ensure that the single
>         * character in the FIFO in FIFO-disabled mode is in
>         * element 0 of the array; convert to follow the current
>         * code's assumptions.
>         */
>        s->read_fifo[0] = s->read_fifo[s->read_pos];
>        s->read_pos = 0;
>    }
>
> If we're putting in a post-load function we can also sanitize
> the incoming migration stream to fail the migration on bogus
> (possibly malicious) data like read_pos > ARRAY_SIZE(read_fifo)
> or read_count > fifo depth.


Yeah, i also saw this issue with migration and how it was not really a 
problem. I do agree with your point about making it more obviously fixed 
though.


>
>> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
>> index c076813423..329cc6926d 100644
>> --- a/hw/char/pl011.c
>> +++ b/hw/char/pl011.c
>> @@ -81,6 +81,12 @@ static void pl011_update(PL011State *s)
>>       }
>>   }
>>
>> +static inline unsigned pl011_get_fifo_depth(PL011State *s)
>> +{
>> +    /* Note: FIFO depth is expected to be power-of-2 */
>> +    return s->lcr & 0x10 ? PL011_FIFO_DEPTH : 1;
>> +}
>> +
>>   static uint64_t pl011_read(void *opaque, hwaddr offset,
>>                              unsigned size)
>>   {
>> @@ -94,8 +100,7 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
>>           c = s->read_fifo[s->read_pos];
>>           if (s->read_count > 0) {
>>               s->read_count--;
>> -            if (++s->read_pos == 16)
>> -                s->read_pos = 0;
>> +            s->read_pos = (s->read_pos + 1) & (pl011_get_fifo_depth(s) - 1);
>>           }
>>           if (s->read_count == 0) {
>>               s->flags |= PL011_FLAG_RXFE;
>> @@ -273,11 +278,7 @@ static int pl011_can_receive(void *opaque)
>>       PL011State *s = (PL011State *)opaque;
>>       int r;
>>
>> -    if (s->lcr & 0x10) {
>> -        r = s->read_count < 16;
>> -    } else {
>> -        r = s->read_count < 1;
>> -    }
>> +    r = s->read_count < pl011_get_fifo_depth(s);
>>       trace_pl011_can_receive(s->lcr, s->read_count, r);
>>       return r;
>>   }
>> @@ -286,15 +287,15 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
>>   {
>>       PL011State *s = (PL011State *)opaque;
>>       int slot;
>> +    unsigned pipe_depth;
>>
>> -    slot = s->read_pos + s->read_count;
>> -    if (slot >= 16)
>> -        slot -= 16;
>> +    pipe_depth = pl011_get_fifo_depth(s);
>> +    slot = (s->read_pos + s->read_count) & (pipe_depth - 1);
>>       s->read_fifo[slot] = value;
>>       s->read_count++;
>>       s->flags &= ~PL011_FLAG_RXFE;
>>       trace_pl011_put_fifo(value, s->read_count);
>> -    if (!(s->lcr & 0x10) || s->read_count == 16) {
>> +    if (s->read_count == pipe_depth) {
>>           trace_pl011_put_fifo_full();
>>           s->flags |= PL011_FLAG_RXFF;
>>       }
> thanks
> -- PMM

