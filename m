Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682012D852F
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 07:24:25 +0100 (CET)
Received: from localhost ([::1]:40762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knyKN-0003dN-4Z
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 01:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1knyJ2-0002td-V5
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 01:23:00 -0500
Received: from mail.ispras.ru ([83.149.199.84]:56292)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1knyJ0-0005dV-LH
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 01:23:00 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id A6B8640D403D;
 Sat, 12 Dec 2020 06:22:51 +0000 (UTC)
Subject: Re: [PATCH] icount: improve exec nocache usage
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <160741865825.348476.7169239332367828943.stgit@pasha-ThinkPad-X280>
 <bce56bb4-dd59-d408-ca17-1df944ef6259@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <766d28d8-9c54-9740-5f10-4c0852c5b8f6@ispras.ru>
Date: Sat, 12 Dec 2020 09:22:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bce56bb4-dd59-d408-ca17-1df944ef6259@linaro.org>
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.12.2020 00:41, Richard Henderson wrote:
> On 12/8/20 3:10 AM, Pavel Dovgalyuk wrote:
>> cpu-exec tries to execute TB without caching when current
>> icount budget is over. But sometimes refilled budget is big
>> enough to try executing cached blocks.
>> This patch checks that instruction budget is big enough
>> for next block execution instead of just running cpu_exec_nocache.
>> It halves the number of calls of cpu_exec_nocache function
>> during tested OS boot scenario.
>>
>> Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
>> ---
>>   accel/tcg/cpu-exec.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index 58aea605d8..251b340fb9 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -685,7 +685,7 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
>>       insns_left = MIN(0xffff, cpu->icount_budget);
>>       cpu_neg(cpu)->icount_decr.u16.low = insns_left;
>>       cpu->icount_extra = cpu->icount_budget - insns_left;
>> -    if (!cpu->icount_extra) {
>> +    if (!cpu->icount_extra && insns_left < tb->icount) {
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks.

> 
> I also wonder if we should really be not caching these.  Ever since MTTCG, we
> have not actually been reusing the memory.  We're simply removing the TB from
> the hash table.  I think we should be remembering these just in case we can in
> fact reuse them.

I'm still thinking about reusing these blocks. Sometimes there are 
loops, where blocks of small sizes like 1..3 are translated for many times.

However, we can't cache them directly, because hash table can include 
only one block with the specific pc.

Pavel Dovgalyuk

