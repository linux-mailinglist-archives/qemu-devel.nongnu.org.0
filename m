Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394B334CED9
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 13:26:31 +0200 (CEST)
Received: from localhost ([::1]:46332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQq2Q-0002V1-4M
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 07:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lQpzv-0001eI-9G
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:23:55 -0400
Received: from mail.ispras.ru ([83.149.199.84]:34656)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lQpzs-0008St-Oa
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:23:55 -0400
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 30CFC4076258;
 Mon, 29 Mar 2021 11:23:48 +0000 (UTC)
Subject: Re: [PATCH v2] replay: notify CPU on event
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <161700382734.1136014.13372992399972618499.stgit@pasha-ThinkPad-X280>
 <0fa410cd-32e8-5349-dbde-0c61fdc29e80@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <4be6bee2-fa58-09ec-439f-8ccd99a965e8@ispras.ru>
Date: Mon, 29 Mar 2021 14:23:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <0fa410cd-32e8-5349-dbde-0c61fdc29e80@redhat.com>
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

On 29.03.2021 13:29, Paolo Bonzini wrote:
> On 29/03/21 09:43, Pavel Dovgalyuk wrote:
>> This patch enables vCPU notification to wake it up
>> when new async event comes in replay mode.
>>
>> The motivation of this patch is the following.
>> Consider recorded block async event. It is saved into the log
>> with one of the checkpoints. This checkpoint may be passed in
>> vCPU loop. In replay mode when this async event is read from
>> the log, and block thread task is not finished yet, vCPU thread
>> goes to sleep. That is why this patch adds waking up the vCPU
>> to process this finished event.
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
> 
> I still do not understand why the qemu_clock_notify function is used to 
> notify the CPU.  It would be nice to have a description of the call 
> chain in a comment or to have a more appropriate API.  I can queue the 
> patch since it's deep in replay-events.c and not in common code, but if 
> you post a short description here I'll integrate it.

Maybe I missed something.
This call is needed for the case when vCPU is waiting in rr_wait_io_event.
You mean that we can use qemu_cpu_kick instead?

Pavel Dovgalyuk

