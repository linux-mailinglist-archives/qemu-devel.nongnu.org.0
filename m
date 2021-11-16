Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89B9452BDC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 08:43:22 +0100 (CET)
Received: from localhost ([::1]:60566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmt7h-0008Qs-HK
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 02:43:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mmt5P-0007LK-N1
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 02:40:59 -0500
Received: from mail.ispras.ru ([83.149.199.84]:34272)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mmt5N-000853-Hw
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 02:40:59 -0500
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 53E2F40A2BC7;
 Tue, 16 Nov 2021 07:40:50 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] icount: preserve cflags when custom tb is about to
 execute
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <163662450348.125458.5494710452733592356.stgit@pasha-ThinkPad-X280>
 <163662450891.125458.6706022775465303586.stgit@pasha-ThinkPad-X280>
 <87pmr6j0w6.fsf@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <b7bcea58-0f1f-d641-06ae-72d47e8f2318@ispras.ru>
Date: Tue, 16 Nov 2021 10:40:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87pmr6j0w6.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.446,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.11.2021 15:20, Alex Bennée wrote:
> 
> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:
> 
>> When debugging with the watchpoints, qemu may need to create
>> TB with single instruction. This is achieved by setting cpu->cflags_next_tb.
>> But when this block is about to execute, it may be interrupted by another
>> thread. In this case cflags will be lost and next executed TB will not
>> be the special one.
>> This patch checks TB exit reason and restores cflags_next_tb to allow
>> finding the interrupted block.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> ---
>>   accel/tcg/cpu-exec.c |   10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index 2d14d02f6c..df12452b8f 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -846,6 +846,16 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
>>            * cpu_handle_interrupt.  cpu_handle_interrupt will also
>>            * clear cpu->icount_decr.u16.high.
>>            */
>> +        if (cpu->cflags_next_tb == -1
>> +            && (!use_icount || !(tb->cflags & CF_USE_ICOUNT)
> 
> Why check use_icount here? The cflags should always have CF_USE_ICOUNT
> set when icount is enabled. Lets not over complicate the inverted ||
> tests we have here.

Not really. Sometimes we use non-icount blocks in icount mode.
But AFAIR they are used only for triggering the exeptions, but not for 
real execution.

> 
>> +                || cpu_neg(cpu)->icount_decr.u16.low >= tb->icount))
>> {
> 
> Is u16.low ever set when icount isn't enabled?

This condition is checked for icount mode only.
u16.low is not used without icount.

> 
>> +            /*
>> +             * icount is disabled or there are enough instructions
>> +             * in the budget, do not retranslate this block with
>> +             * different parameters.
>> +             */
>> +            cpu->cflags_next_tb = tb->cflags;
>> +        }
>>           return;
>>       }
>>   
> 
> 


