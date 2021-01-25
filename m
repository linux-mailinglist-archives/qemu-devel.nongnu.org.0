Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7863021E5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 06:40:41 +0100 (CET)
Received: from localhost ([::1]:49722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3ucC-0000wV-Ol
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 00:40:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l3uZy-0000Ud-KU
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 00:38:24 -0500
Received: from mail.ispras.ru ([83.149.199.84]:59460)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l3uZw-0001ks-7a
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 00:38:22 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id AAE494076248;
 Mon, 25 Jan 2021 05:38:07 +0000 (UTC)
Subject: Re: [PATCH] replay: fix replay of the interrupts
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <161105999349.694343.16096128094758045254.stgit@pasha-ThinkPad-X280>
 <288b2af5-94d5-36c8-9eb2-de31ff1de066@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <d9f8e9d4-8aef-29b6-765d-014c782e4764@ispras.ru>
Date: Mon, 25 Jan 2021 08:38:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <288b2af5-94d5-36c8-9eb2-de31ff1de066@redhat.com>
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.01.2021 21:15, Paolo Bonzini wrote:
> On 19/01/21 13:39, Pavel Dovgalyuk wrote:
>> Sometimes interrupt event comes at the same time with
>> the virtual timers. In this case replay tries to proceed
>> the timers, because deadline for them is zero.
>> This patch allows processing interrupts and exceptions
>> by entering the vCPU execution loop, when deadline is zero,
>> but checkpoint associated with virtual timers is not ready
>> to be replayed.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> ---
>>   accel/tcg/tcg-cpus-icount.c |    8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-cpus-icount.c
>> index 9f45432275..a6d2bb8a88 100644
>> --- a/accel/tcg/tcg-cpus-icount.c
>> +++ b/accel/tcg/tcg-cpus-icount.c
>> @@ -81,7 +81,13 @@ void icount_handle_deadline(void)
>>       int64_t deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
>>                                                     QEMU_TIMER_ATTR_ALL);
>> -    if (deadline == 0) {
>> +    /*
>> +     * Instructions, interrupts, and exceptions are processed in 
>> cpu-exec.
>> +     * Don't interrupt cpu thread, when these events are waiting
>> +     * (i.e., there is no checkpoint)
>> +     */
>> +    if (deadline == 0
>> +        && (replay_mode == REPLAY_MODE_RECORD || 
>> replay_has_checkpoint())) {
> 
> Should this be replay_mode != REPLAY_MODE_PLAY || replay_has_checkpoint()?

It was the first idea, but I thought, that == is more straightforward
to understand than !=.

Pavel Dovgalyuk

