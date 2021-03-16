Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9667633CC75
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 05:16:36 +0100 (CET)
Received: from localhost ([::1]:49666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM18E-00015d-Rg
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 00:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lM171-0000ZG-Vt
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 00:15:19 -0400
Received: from mail.ispras.ru ([83.149.199.84]:37780)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lM16x-0003JV-21
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 00:15:19 -0400
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 5DD5E40755EB;
 Tue, 16 Mar 2021 04:15:07 +0000 (UTC)
Subject: Re: [PATCH] hw/i8254: fix vmstate load
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <161537170060.6654.9430112746749476215.stgit@pasha-ThinkPad-X280>
 <YE+//ZRlFBwNjb0b@work-vm>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <ecfc942c-09c5-37b8-56f5-b38069b96664@ispras.ru>
Date: Tue, 16 Mar 2021 07:15:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YE+//ZRlFBwNjb0b@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.03.2021 23:13, Dr. David Alan Gilbert wrote:
> * Pavel Dovgalyuk (pavel.dovgalyuk@ispras.ru) wrote:
>> QEMU timer of channel 0 in i8254 is used to raise irq
>> at the specified moment of time. This irq can be disabled
>> with irq_disabled flag. But when vmstate of the pit is
>> loaded, timer may be rearmed despite the disabled interrupts.
>> This patch adds irq_disabled flag check to fix that.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> 
> Hi Pavel,
>    I'm curious, did you see this cause a problem on a particular guest
> OS?

That was Windows 7 on i386.
I found this when tested reverse debugging.

> 
> Dave
> 
>> ---
>>   hw/timer/i8254.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
>> index c01ee2c72a..c8388ea432 100644
>> --- a/hw/timer/i8254.c
>> +++ b/hw/timer/i8254.c
>> @@ -324,7 +324,7 @@ static void pit_post_load(PITCommonState *s)
>>   {
>>       PITChannelState *sc = &s->channels[0];
>>   
>> -    if (sc->next_transition_time != -1) {
>> +    if (sc->next_transition_time != -1 && !sc->irq_disabled) {
>>           timer_mod(sc->irq_timer, sc->next_transition_time);
>>       } else {
>>           timer_del(sc->irq_timer);
>>
>>


