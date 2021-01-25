Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9413026C9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 16:19:35 +0100 (CET)
Received: from localhost ([::1]:35096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l43eP-0006pz-VM
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 10:19:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l43ce-0005ve-Cu
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:17:44 -0500
Received: from mx2.suse.de ([195.135.220.15]:57344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l43cY-00015N-No
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:17:44 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2BC5CAC97;
 Mon, 25 Jan 2021 15:17:37 +0000 (UTC)
Subject: Re: [PATCH] replay: fix replay of the interrupts
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <161105999349.694343.16096128094758045254.stgit@pasha-ThinkPad-X280>
 <288b2af5-94d5-36c8-9eb2-de31ff1de066@redhat.com>
 <d9f8e9d4-8aef-29b6-765d-014c782e4764@ispras.ru>
 <CABgObfaFnKztrjc7mpgTxEi9R7jXD-Qed5vVcPBSGcE_nexONg@mail.gmail.com>
 <87sg6pmcsz.fsf@linaro.org> <c2799acd-a3f0-daaf-f7e0-b9a3c398f1eb@suse.de>
 <ef64105c-7ae3-9495-45ed-8a9e31fc0d10@suse.de> <87im7lkruo.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <6b9b7a08-ae70-3fe7-65c7-6c3c4a17da83@suse.de>
Date: Mon, 25 Jan 2021 16:17:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87im7lkruo.fsf@linaro.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/21 3:26 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> On 1/25/21 1:43 PM, Claudio Fontana wrote:
>>> On 1/25/21 1:12 PM, Alex Bennée wrote:
>>>>
>>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>>
>>>>> In general I agree, but != means that rr disabled returns true. In general
>>>>> it seems to me that rr disabled should work more or less the same as record
>>>>> mode, because there is no replay log to provide the checkpoints.
>>>>
>>>> Is this not an argument to combine the mode and check into replay.h
>>>> inline helpers with some clear semantic documentation and the call sites
>>>> become self documenting?
>>>>
>>>> if (deadline == 0 && replay_recording_or_checkpoint())
>>>>
>>>> which also makes things easier to compile away if replay isn't there?
>>>
>>>
>>> Seems that the TCG build faces a similar issue to the issue I was facing with the non-TCG build,
>>> before the non-TCG build got functional again (for x86).
>>>
>>> We solved the non-TCG build problem, by not compiling replay at all for non-TCG, plus closing our nose and stubbing away what couldn't be completely removed (yet).
>>>
>>> But the CONFIG_TCG build has the same legitimate requirement towards a non-CONFIG_REPLAY build.
>>>
>>> ie, like we have tcg_enabled(), should we have replay_enabled()? Maybe it could be reworked starting from replay_events_enabled()?
>>>
>>> And then when things are refactored properly for replay_enabled(), a non-REPLAY TCG build can basically ignore all the inner workings of replay.
>>>
>>
>> I guess to summarize the above, should there be a CONFIG_REPLAY, dependent on CONFIG_TCG, by default on,
>> but which could be disabled with
>>
>> --disable-replay
>>
>> ?
> 
> I'm not sure - fundamentally having replay is one of those cool things
> you can do when you have TCG and I suspect there is less pressure to
> have a finely tuned TCG enabled build compared to our HW accelerated
> brethren using hypervisors. TCG plugins are a configure option purely
> because there is a small but non-marginal cost in having it enabled. I
> doubt replay figures that much if you are not using it.
> 
> That said if it makes it easier to make sure our abstractions are clean
> and the layering is good then maybe it is worth having a build that

I think that cleaning up these aspects would be beneficial in replay itself,
but maybe this could be done without forcing the --disable-replay option.

> allows us to check that. But if it's going to be super fiddly and
> involve large amounts of code motion I doubt the "win" is big enough for
> the effort.
> 
> Also I suspect the config option would be CONFIG_ICOUNT because replay
> is just one of the features on the spectrum of:
> 
>  deterministic icount -> record/replay -> reverse debugging
> 
> which all require the base support for icount.
> 

Right, icount_enabled() is already fundamentally able to check whether replay functionality is available or not.
Probably there is already some cleanup possible by applying this consistently.

Other clean up opportunities I see are in making consistent checks for whether the functionality is active, and consolidate all the spread state,
including (but not limited to):

replay_mode, events_enabled, replay_is_debugging, in_checkpoint, ... (into a single struct replay ?)

..and then I guess clean up the namespace from all the replay_ functions for which we need a gazillion stubs for non-TCG code..


Ciao,

Claudio






