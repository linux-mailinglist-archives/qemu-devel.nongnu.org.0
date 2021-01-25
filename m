Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33052302541
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 14:03:41 +0100 (CET)
Received: from localhost ([::1]:52560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l41Wt-0005p4-Vw
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 08:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l41Uk-0004tJ-40
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:01:26 -0500
Received: from mx2.suse.de ([195.135.220.15]:54898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l41Uf-0007T1-DK
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:01:25 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E708CACF5;
 Mon, 25 Jan 2021 13:01:18 +0000 (UTC)
Subject: Re: [PATCH] replay: fix replay of the interrupts
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <161105999349.694343.16096128094758045254.stgit@pasha-ThinkPad-X280>
 <288b2af5-94d5-36c8-9eb2-de31ff1de066@redhat.com>
 <d9f8e9d4-8aef-29b6-765d-014c782e4764@ispras.ru>
 <CABgObfaFnKztrjc7mpgTxEi9R7jXD-Qed5vVcPBSGcE_nexONg@mail.gmail.com>
 <87sg6pmcsz.fsf@linaro.org> <c2799acd-a3f0-daaf-f7e0-b9a3c398f1eb@suse.de>
Message-ID: <ef64105c-7ae3-9495-45ed-8a9e31fc0d10@suse.de>
Date: Mon, 25 Jan 2021 14:01:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c2799acd-a3f0-daaf-f7e0-b9a3c398f1eb@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/21 1:43 PM, Claudio Fontana wrote:
> On 1/25/21 1:12 PM, Alex Bennée wrote:
>>
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>
>>> In general I agree, but != means that rr disabled returns true. In general
>>> it seems to me that rr disabled should work more or less the same as record
>>> mode, because there is no replay log to provide the checkpoints.
>>
>> Is this not an argument to combine the mode and check into replay.h
>> inline helpers with some clear semantic documentation and the call sites
>> become self documenting?
>>
>> if (deadline == 0 && replay_recording_or_checkpoint())
>>
>> which also makes things easier to compile away if replay isn't there?
> 
> 
> Seems that the TCG build faces a similar issue to the issue I was facing with the non-TCG build,
> before the non-TCG build got functional again (for x86).
> 
> We solved the non-TCG build problem, by not compiling replay at all for non-TCG, plus closing our nose and stubbing away what couldn't be completely removed (yet).
> 
> But the CONFIG_TCG build has the same legitimate requirement towards a non-CONFIG_REPLAY build.
> 
> ie, like we have tcg_enabled(), should we have replay_enabled()? Maybe it could be reworked starting from replay_events_enabled()?
> 
> And then when things are refactored properly for replay_enabled(), a non-REPLAY TCG build can basically ignore all the inner workings of replay.
> 

I guess to summarize the above, should there be a CONFIG_REPLAY, dependent on CONFIG_TCG, by default on,
but which could be disabled with

--disable-replay

?

Thanks,

Claudio

> 
>>
>>>
>>> Paolo
>>>
>>> Il lun 25 gen 2021, 06:38 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> ha
>>> scritto:
>>>
>>>> On 23.01.2021 21:15, Paolo Bonzini wrote:
>>>>> On 19/01/21 13:39, Pavel Dovgalyuk wrote:
>>>>>> Sometimes interrupt event comes at the same time with
>>>>>> the virtual timers. In this case replay tries to proceed
>>>>>> the timers, because deadline for them is zero.
>>>>>> This patch allows processing interrupts and exceptions
>>>>>> by entering the vCPU execution loop, when deadline is zero,
>>>>>> but checkpoint associated with virtual timers is not ready
>>>>>> to be replayed.
>>>>>>
>>>>>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>>>>>> ---
>>>>>>   accel/tcg/tcg-cpus-icount.c |    8 +++++++-
>>>>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-cpus-icount.c
>>>>>> index 9f45432275..a6d2bb8a88 100644
>>>>>> --- a/accel/tcg/tcg-cpus-icount.c
>>>>>> +++ b/accel/tcg/tcg-cpus-icount.c
>>>>>> @@ -81,7 +81,13 @@ void icount_handle_deadline(void)
>>>>>>       int64_t deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
>>>>>>
>>>> QEMU_TIMER_ATTR_ALL);
>>>>>> -    if (deadline == 0) {
>>>>>> +    /*
>>>>>> +     * Instructions, interrupts, and exceptions are processed in
>>>>>> cpu-exec.
>>>>>> +     * Don't interrupt cpu thread, when these events are waiting
>>>>>> +     * (i.e., there is no checkpoint)
>>>>>> +     */
>>>>>> +    if (deadline == 0
>>>>>> +        && (replay_mode == REPLAY_MODE_RECORD ||
>>>>>> replay_has_checkpoint())) {
>>>>>
>>>>> Should this be replay_mode != REPLAY_MODE_PLAY ||
>>>> replay_has_checkpoint()?
>>>>
>>>> It was the first idea, but I thought, that == is more straightforward
>>>> to understand than !=.
>>>>
>>>> Pavel Dovgalyuk
>>>>
>>>>
>>
>>
> 


