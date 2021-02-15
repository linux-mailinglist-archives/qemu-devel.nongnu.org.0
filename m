Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747F331BA78
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:40:06 +0100 (CET)
Received: from localhost ([::1]:44674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBe6f-0001pf-Eb
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:40:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lBe1e-00053Z-R1
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:34:54 -0500
Received: from mail.ispras.ru ([83.149.199.84]:54152)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lBe1c-0004Yc-P3
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:34:54 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 2692240D3BFF;
 Mon, 15 Feb 2021 13:34:48 +0000 (UTC)
Subject: Re: [PATCH] replay: notify CPU on event
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <161339392367.1222219.9529223857148298127.stgit@pasha-ThinkPad-X280>
 <07b76b51-c3d5-0a0e-6c48-536bccab3d90@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <628491d1-26b2-80f4-e0a0-5c488cf6f909@ispras.ru>
Date: Mon, 15 Feb 2021 16:34:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <07b76b51-c3d5-0a0e-6c48-536bccab3d90@redhat.com>
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.02.2021 16:29, Paolo Bonzini wrote:
> On 15/02/21 13:58, Pavel Dovgalyuk wrote:
>> This patch enables vCPU notification to wake it up
>> when new async event comes in replay mode.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> ---
>>   replay/replay-events.c |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/replay/replay-events.c b/replay/replay-events.c
>> index a1c6bb934e..92dc800219 100644
>> --- a/replay/replay-events.c
>> +++ b/replay/replay-events.c
>> @@ -126,6 +126,7 @@ void replay_add_event(ReplayAsyncEventKind 
>> event_kind,
>>       g_assert(replay_mutex_locked());
>>       QTAILQ_INSERT_TAIL(&events_list, event, events);
>> +    qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
>>   }
>>   void replay_bh_schedule_event(QEMUBH *bh)
>>
> 
> Do you really want to notify the vCPU, or rather the main loop (which 
> will run as a side effect of the lockstep behavior that RR puts in place)?
> 
> The reason I doubt you need to notify the vCPU, is that I'm not sure why 
> an incoming event would cause you to recalculate the QEMU_CLOCK_VIRTUAL 
> deadline.  Rather, perhaps the problem is that a bottom half cannot be 
> run right away?  And if so, probably the issue only happens for a 
> running vCPU (not a sleeping one) so you only need 
> qemu_cpu_kick(current_cpu)?

I've got the following issue:
vCPU thread is sleeping in rr_wait_io_event.
The next event is block async callback linked with 
CHECKPOINT_CLOCK_WARP_ACCOUNT.
Therefore this event should be processed by vCPU, which is sleeping.

> 
> Either way, your commit message does not explain why it is needed and 
> how event are missed or delayed without the patch.  This is especially 
> important for something like RR, which is pretty invasive and understood 
> only by very few people (I don't put myself in the group, in fact).

Ok, I'll update the comment.

Pavel Dovgalyuk

