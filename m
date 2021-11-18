Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256C04559BE
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 12:11:51 +0100 (CET)
Received: from localhost ([::1]:46696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnfKY-0001qI-6p
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 06:11:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mnfF7-0004CI-Ga
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:06:13 -0500
Received: from mail.ispras.ru ([83.149.199.84]:40282)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mnfF2-0001aX-HF
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:06:13 -0500
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 99CE840D4004;
 Thu, 18 Nov 2021 11:05:59 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] icount: preserve cflags when custom tb is about to
 execute
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <163662450348.125458.5494710452733592356.stgit@pasha-ThinkPad-X280>
 <163662450891.125458.6706022775465303586.stgit@pasha-ThinkPad-X280>
 <87h7cbw1tx.fsf@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <f1149f61-b753-52b5-c95c-a6ded11c5ede@ispras.ru>
Date: Thu, 18 Nov 2021 14:05:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87h7cbw1tx.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.084,
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

On 17.11.2021 12:47, Alex Bennée wrote:
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
> 
> How about this alternative?

I checked all cflags_next_tb assignments.
Looks that this variant should work.

> 
> --8<---------------cut here---------------start------------->8---
> accel/tcg: suppress IRQ check for special TBs
> 
> Generally when we set cpu->cflags_next_tb it is because we want to
> carefully control the execution of the next TB. Currently there is a
> race that causes cflags_next_tb to get ignored if an IRQ is processed
> before we execute any actual instructions.
> 
> To avoid this we introduce a new compiler flag: CF_NOIRQ to suppress
> this check in the generated code so we know we will definitely execute
> the next block.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/245
> 
> 3 files changed, 22 insertions(+), 3 deletions(-)
> include/exec/exec-all.h   |  1 +
> include/exec/gen-icount.h | 19 ++++++++++++++++---
> accel/tcg/cpu-exec.c      |  5 +++++
> 
> modified   include/exec/exec-all.h
> @@ -503,6 +503,7 @@ struct TranslationBlock {
>   #define CF_USE_ICOUNT    0x00020000
>   #define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock held */
>   #define CF_PARALLEL      0x00080000 /* Generate code for a parallel context */
> +#define CF_NOIRQ         0x00100000 /* Generate an uninterruptible TB */
>   #define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
>   #define CF_CLUSTER_SHIFT 24
>   
> modified   include/exec/gen-icount.h
> @@ -21,7 +21,6 @@ static inline void gen_tb_start(const TranslationBlock *tb)
>   {
>       TCGv_i32 count;
>   
> -    tcg_ctx->exitreq_label = gen_new_label();
>       if (tb_cflags(tb) & CF_USE_ICOUNT) {
>           count = tcg_temp_local_new_i32();
>       } else {
> @@ -42,7 +41,19 @@ static inline void gen_tb_start(const TranslationBlock *tb)
>           icount_start_insn = tcg_last_op();
>       }
>   
> -    tcg_gen_brcondi_i32(TCG_COND_LT, count, 0, tcg_ctx->exitreq_label);
> +    /*
> +     * Emit the check against icount_decr.u32 to see if we should exit
> +     * unless we suppress the check with CF_NOIRQ. If we are using
> +     * icount and have suppressed interruption the higher level code
> +     * should have ensured we don't run more instructions than the
> +     * budget.
> +     */
> +    if (tb_cflags(tb) & CF_NOIRQ) {
> +        tcg_ctx->exitreq_label = NULL;
> +    } else {
> +        tcg_ctx->exitreq_label = gen_new_label();
> +        tcg_gen_brcondi_i32(TCG_COND_LT, count, 0, tcg_ctx->exitreq_label);
> +    }
>   
>       if (tb_cflags(tb) & CF_USE_ICOUNT) {
>           tcg_gen_st16_i32(count, cpu_env,
> @@ -74,7 +85,9 @@ static inline void gen_tb_end(const TranslationBlock *tb, int num_insns)
>                              tcgv_i32_arg(tcg_constant_i32(num_insns)));
>       }
>   
> -    gen_set_label(tcg_ctx->exitreq_label);
> +    if (tcg_ctx->exitreq_label) {
> +        gen_set_label(tcg_ctx->exitreq_label);
> +    }
>       tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
>   }
>   
> modified   accel/tcg/cpu-exec.c
> @@ -954,11 +954,16 @@ int cpu_exec(CPUState *cpu)
>                * after-access watchpoints.  Since this request should never
>                * have CF_INVALID set, -1 is a convenient invalid value that
>                * does not require tcg headers for cpu_common_reset.
> +             *
> +             * As we don't want this special TB being interrupted by
> +             * some sort of asynchronous event we apply CF_NOIRQ to
> +             * disable the usual event checking.
>                */
>               cflags = cpu->cflags_next_tb;
>               if (cflags == -1) {
>                   cflags = curr_cflags(cpu);
>               } else {
> +                cflags |= CF_NOIRQ;
>                   cpu->cflags_next_tb = -1;
>               }
>   
> --8<---------------cut here---------------end--------------->8---
> 
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
>> +                || cpu_neg(cpu)->icount_decr.u16.low >= tb->icount)) {
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


