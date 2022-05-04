Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3960B5197D7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 09:05:43 +0200 (CEST)
Received: from localhost ([::1]:47186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm94v-0000uD-WB
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 03:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nm8y0-0005Zk-Is
 for qemu-devel@nongnu.org; Wed, 04 May 2022 02:58:33 -0400
Received: from mail.ispras.ru ([83.149.199.84]:40940)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nm8xy-00014F-Sq
 for qemu-devel@nongnu.org; Wed, 04 May 2022 02:58:32 -0400
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 4886F40755D8;
 Wed,  4 May 2022 06:58:27 +0000 (UTC)
Message-ID: <cbb7dab9-64ac-3f14-3b81-8170bf82f6fc@ispras.ru>
Date: Wed, 4 May 2022 09:58:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/9] replay: rewrite async event handling
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <165062838915.526882.13230207960407998257.stgit@pasha-ThinkPad-X280>
 <165062840564.526882.15249141058569885051.stgit@pasha-ThinkPad-X280>
 <f5443f62-bdc7-dfd0-ea3a-e13cdcc3da52@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <f5443f62-bdc7-dfd0-ea3a-e13cdcc3da52@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.04.2022 21:54, Richard Henderson wrote:
> On 4/22/22 04:53, Pavel Dovgalyuk wrote:
>> This patch decouples checkpoints and async events.
>> It was a tricky part of replay implementation. Now it becomes
>> much simpler and easier to maintain.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> 
> Looks ok, as far as I can follow.  With a couple of nits,
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> --- a/replay/replay-snapshot.c
>> +++ b/replay/replay-snapshot.c
>> @@ -61,7 +61,6 @@ static const VMStateDescription vmstate_replay = {
>>           VMSTATE_UINT64(block_request_id, ReplayState),
>>           VMSTATE_INT32(read_event_kind, ReplayState),
>>           VMSTATE_UINT64(read_event_id, ReplayState),
>> -        VMSTATE_INT32(read_event_checkpoint, ReplayState),
>>           VMSTATE_END_OF_LIST()
>>       },
>>   };
> 
> Bump version_id and minimum_version_id.

I bumped replay log version. This vmstate is useless without replay log
and won't be loaded with the old logs.

> 
>> +void replay_async_events(void)
>> +{
>> +    static bool processing = false;
>> +    /* If we are already processing the events, recursion may occur
>> +        in case of incorrect implementation when HW event modifies 
>> timers.
>> +        Timer modification may invoke the icount warp, event processing,
>> +        and cause the recursion. */
> 
> Format multi-line comments per coding style:
> 
>    /*
>     * block
>     */
> 

Thanks.

