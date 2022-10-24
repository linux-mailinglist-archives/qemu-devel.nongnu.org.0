Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F1B60B28B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:49:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyxM-0002T7-9H; Mon, 24 Oct 2022 11:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1omywZ-0002S1-Ho; Mon, 24 Oct 2022 11:00:47 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1omywX-0003xs-Re; Mon, 24 Oct 2022 11:00:47 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 24 Oct 2022 12:00:41 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 6EBD6800086;
 Mon, 24 Oct 2022 12:00:40 -0300 (-03)
Message-ID: <bc283711-d03d-4c43-d535-c2bbc777cbd4@eldorado.org.br>
Date: Mon, 24 Oct 2022 12:00:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/3] accel/tcg: Add a quicker check for breakpoints
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: pbonzini@redhat.com, clg@kaod.org, danielhb413@gmail.com,
 david@gibson.dropbear.id.au, groug@kaod.org
References: <20221021170112.151393-1-leandro.lupori@eldorado.org.br>
 <20221021170112.151393-2-leandro.lupori@eldorado.org.br>
 <10ca01b0-493f-d6f5-4d77-da1518011a76@linaro.org>
Content-Language: en-US
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <10ca01b0-493f-d6f5-4d77-da1518011a76@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Oct 2022 15:00:41.0056 (UTC)
 FILETIME=[623CFE00:01D8E7B9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/22/22 08:12, Richard Henderson wrote:
> On 10/22/22 03:01, Leandro Lupori wrote:
>> Profiling QEMU during Fedora 35 for PPC64 boot revealed that a
>> considerable amount of time was being spent in
>> check_for_breakpoints() (0.61% of total time on PPC64 and 2.19% on
>> amd64), even though it was just checking that its queue was empty
>> and returning, when no breakpoints were set. It turns out this
>> function is not inlined by the compiler and it's always called by
>> helper_lookup_tb_ptr(), one of the most called functions.
>>
>> By moving the check for empty queue to the have_breakpoints()
>> macro and calling check_for_breakpoints() only when it returns
>> true, it's possible to avoid the call overhead. An improvement of
>> about 3% in total time was measured on POWER9.
> 
> Wow, 3%?
> 
I've compared the averages of 3 runs. To get a more precise number it 
would probably be better to take the average or median of 10 runs with 
each version.

>>
>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>> ---
>>   accel/tcg/cpu-exec.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index f9e5cc9ba0..9eec01ad9a 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -304,16 +304,15 @@ static void log_cpu_exec(target_ulong pc, 
>> CPUState *cpu,
>>       }
>>   }
>>
>> +#define have_breakpoints(cpu)   
>> (likely(QTAILQ_EMPTY(&(cpu)->breakpoints)) ? \
>> +                                 false : true)
> 
> First, always avoid useless ?:.
> 
> Second, I think renaming the existing check_for_breakpoints to 
> check_for_breakpoints_slow
> and make this test be an inline function instead.  E.g.
> 
> static bool check_for_breakpoints(...)
> {
>      if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
>          return check_for_breakpoints_slow(...);
>      }
>      return false;
> }
> 
Ok. I had left the ?: to take advantage of likely() in the macro.

Thanks,
Leandro

> 
> r~


