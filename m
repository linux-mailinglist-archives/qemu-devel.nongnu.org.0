Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED80A34E317
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 10:25:02 +0200 (CEST)
Received: from localhost ([::1]:39156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR9gL-0006Bn-Qa
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 04:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lR9fc-0005bC-2A
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 04:24:16 -0400
Received: from mail.ispras.ru ([83.149.199.84]:51098)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lR9fW-0004Ok-RN
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 04:24:14 -0400
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id B273E40755E4;
 Tue, 30 Mar 2021 08:24:01 +0000 (UTC)
Subject: Re: [PATCH] replay: fix recursive checkpoints
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <161700476500.1140362.10108444973730452257.stgit@pasha-ThinkPad-X280>
 <87o8f2xk04.fsf@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <ff556599-6412-94bd-88f7-6b3c8aa6af49@ispras.ru>
Date: Tue, 30 Mar 2021 11:24:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87o8f2xk04.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.03.2021 14:25, Alex Bennée wrote:
> 
> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:
> 
>> Record/replay uses checkpoints to synchronize the execution
>> of the threads and timers. Hardware events such as BH are
>> processed at the checkpoints too.
>> Event processing can cause refreshing the virtual timers
>> and calling the icount-related functions, that also use checkpoints.
>> This patch prevents recursive processing of such checkpoints,
>> because they have their own records in the log and should be
>> processed later.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> ---
>>   replay/replay.c |   11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/replay/replay.c b/replay/replay.c
>> index c806fec69a..6df2abc18c 100644
>> --- a/replay/replay.c
>> +++ b/replay/replay.c
>> @@ -180,12 +180,13 @@ bool replay_checkpoint(ReplayCheckpoint checkpoint)
>>       }
>>   
>>       if (in_checkpoint) {
>> -        /* If we are already in checkpoint, then there is no need
>> -           for additional synchronization.
>> +        /*
>>              Recursion occurs when HW event modifies timers.
>> -           Timer modification may invoke the checkpoint and
>> -           proceed to recursion. */
>> -        return true;
>> +           Prevent performing icount warp in this case and
>> +           wait for another invocation of the checkpoint.
>> +        */
> 
> nit: as you are updating the comment you might as well fix the style. It
> would probably help with the diff as well.
> 
>> +        g_assert(replay_mode == REPLAY_MODE_PLAY);
>> +        return false;
>>       }
>>       in_checkpoint = true;
> 
> The accompanying comments in replay.h are also confusing
> 
>      Returns 0 in PLAY mode if checkpoint was not found.
>      Returns 1 in all other cases.
> 
> Which translated to actual bool results:
> 
>      Returns false in PLAY mode if checkpoint was not found
>      Returns true in all other cases
> 
> Which implies the checkpoint is always found (or created?) which I'm not
> even sure of while following the rest of the replay_checkpoint code
> which has exit cases of:
> 
>      bool res = false; (default)
>      replay_state.data_kind != EVENT_ASYNC;
>      res = true; (when recording)
> 
> So is the following more correct?
> 
> /**
>   * replay_checkpoint(checkpoint): save (in RECORD) or consume (in PLAY) checkpoint
>   * @checkpoint: the checkpoint event
>   *
>   * In SAVE mode stores the checkpoint in the record and potentially
>   * saves a number of events.
>   *
>   * In PLAY mode consumes checkpoint and any following EVENT_ASYNC events.
>   *
>   * Results: in SAVE mode always True
>   *          in PLAY mode True unless checkpoint not found or recursively called.
>   */
> 

Almost true.
In PLAY returns True only if the checkpoint was found and all following 
async events matched and processed.
Otherwise returns false and non-processed events are postponed to be 
consumed later.

Pavel Dovgalyuk

