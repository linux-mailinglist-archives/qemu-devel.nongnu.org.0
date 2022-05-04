Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9F1519833
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 09:30:10 +0200 (CEST)
Received: from localhost ([::1]:44524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm9Sa-00031N-Rf
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 03:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nm9H1-0002IF-Oy
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:18:11 -0400
Received: from mail.ispras.ru ([83.149.199.84]:43404)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nm9Gy-0002sx-UP
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:18:11 -0400
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 72DCA40755D8;
 Wed,  4 May 2022 07:10:10 +0000 (UTC)
Message-ID: <92515086-accb-a4a9-a1fd-968dcefc691a@ispras.ru>
Date: Wed, 4 May 2022 10:10:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/9] replay: simplify async event processing
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: philmd@redhat.com, wrampazz@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
References: <165062838915.526882.13230207960407998257.stgit@pasha-ThinkPad-X280>
 <165062841103.526882.9023955155829649867.stgit@pasha-ThinkPad-X280>
 <fbf89dbd-17d5-cd93-4fba-3852f4cc4caa@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <fbf89dbd-17d5-cd93-4fba-3852f4cc4caa@linaro.org>
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

On 26.04.2022 23:26, Richard Henderson wrote:
> On 4/22/22 04:53, Pavel Dovgalyuk wrote:
>>   static Event *replay_read_event(void)
>>   {
>>       Event *event;
>> +    int event_kind = replay_state.data_kind - EVENT_ASYNC;
> 
> Use the enum type.

Ok.

>> +/* Asynchronous events IDs */
>> +
>> +enum ReplayAsyncEventKind {
>> +    REPLAY_ASYNC_EVENT_BH,
>> +    REPLAY_ASYNC_EVENT_BH_ONESHOT,
>> +    REPLAY_ASYNC_EVENT_INPUT,
>> +    REPLAY_ASYNC_EVENT_INPUT_SYNC,
>> +    REPLAY_ASYNC_EVENT_CHAR_READ,
>> +    REPLAY_ASYNC_EVENT_BLOCK,
>> +    REPLAY_ASYNC_EVENT_NET,
>> +    REPLAY_ASYNC_COUNT
>> +};
> ...
>> -enum ReplayAsyncEventKind {
>> -    REPLAY_ASYNC_EVENT_BH,
>> -    REPLAY_ASYNC_EVENT_BH_ONESHOT,
>> -    REPLAY_ASYNC_EVENT_INPUT,
>> -    REPLAY_ASYNC_EVENT_INPUT_SYNC,
>> -    REPLAY_ASYNC_EVENT_CHAR_READ,
>> -    REPLAY_ASYNC_EVENT_BLOCK,
>> -    REPLAY_ASYNC_EVENT_NET,
>> -    REPLAY_ASYNC_COUNT
>> -};
>> -
>>   typedef enum ReplayAsyncEventKind ReplayAsyncEventKind;
> 
> Merge or move the typedef with the enum definition, to keep them together.

Ok.

>> @@ -59,7 +59,6 @@ static const VMStateDescription vmstate_replay = {
>>           VMSTATE_UINT32(has_unread_data, ReplayState),
>>           VMSTATE_UINT64(file_offset, ReplayState),
>>           VMSTATE_UINT64(block_request_id, ReplayState),
>> -        VMSTATE_INT32(read_event_kind, ReplayState),
>>           VMSTATE_UINT64(read_event_id, ReplayState),
>>           VMSTATE_END_OF_LIST()
>>       },
> 
> Second change here, are you bumping version at the end and I haven't 
> seen it yet?

I'm bumping only REPLAY_VERSION which will prevent usage of the wrong 
vmstate.

