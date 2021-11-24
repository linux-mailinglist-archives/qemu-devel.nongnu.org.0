Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1481145B762
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:24:39 +0100 (CET)
Received: from localhost ([::1]:38926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpoW6-0001n9-6X
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:24:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpoUr-0000m3-FL
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:23:21 -0500
Received: from [2a00:1450:4864:20::432] (port=44010
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpoUe-0004fI-TE
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:23:21 -0500
Received: by mail-wr1-x432.google.com with SMTP id v11so2933156wrw.10
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7P2JlHYFpbqBGEPPo5Q7twJDv/NvVXAMRRd/nJoNFp4=;
 b=Ty3oVQX5lPCrSshn3f9oFKk3xOl+SkXkigri4pvXyAI41iIsZTNTviF6tV3uWNtAlv
 X63MOz6DvzKfegMtrZDeMKYr8dTRGFEkawCR7VszizGHjC/ID+94Y+FEaXJYQlfUMl3u
 ETO/XL20evauQnOBw4VHtO41+eHKevkXaY5cteZ+++D0tohgvvDfo6pVNNgYTBx4wLHZ
 TxFG26Y1zzQNCyFAsmeEGmf0tgG3KWa/7EOdXKTbXjnUljn/djNuttNX0+KczVrcdKft
 1cSF19Tuqto6M+7X8LRNLjtqDCc1V4Xvc4SHz2t3SIo/0z9Q/QbD1IJjmjMgbLT7SL74
 1pNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7P2JlHYFpbqBGEPPo5Q7twJDv/NvVXAMRRd/nJoNFp4=;
 b=qd4CIndEgoz20OLLeUHR8byQhcyT7UcpnHtp2sjOL1FQzkcNA0hMNvE2dsvhbLufNu
 AEekLyLWlCOkUALuLn8hi2envPk41nirpkLhkWw+qxVUCNl0IZ4rMDFpG1ky8BitNYqk
 q/pq1fTrS45r7mfi6kXBiyPs2xcC+PdUbssG0cTyqhjqQ+AnvUlbHreZkkA4bMDNZ0si
 cVPo2RMM3R/7letII5T+cbarf4DM962DysDISMdRdeluOxbinpjjtHBWZrdWX19Zy9FB
 lh+1tuaVWnlTqVeYoXZ0Mdrf1o3IysCXHlGiLvckCSvXzHZSZxas0qKZ7+VfN3Y6VeZ2
 1U5Q==
X-Gm-Message-State: AOAM530yB8LPPj9PDo6K9HcSrh4FDZmobndlOmJk7nIXllkqHJFOgH0s
 wO/94vXeZf95oQVJsgdRz24MZQ==
X-Google-Smtp-Source: ABdhPJzRelz464D8fHLQwLDbxBzMtSQ4Z++3LeWYUurvHQFd/lUp/1AUwdTaj8FvHJFNjq54o4QXpg==
X-Received: by 2002:a5d:51cb:: with SMTP id n11mr16461249wrv.278.1637745786418; 
 Wed, 24 Nov 2021 01:23:06 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id h3sm13312806wrv.69.2021.11.24.01.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 01:23:05 -0800 (PST)
Subject: Re: [PATCH v1 2/7] accel/tcg: suppress IRQ check for special TBs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211123205729.2205806-1-alex.bennee@linaro.org>
 <20211123205729.2205806-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <69ae3ca0-a485-d5ff-2508-5fcd13869498@linaro.org>
Date: Wed, 24 Nov 2021 10:23:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211123205729.2205806-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 9:57 PM, Alex Bennée wrote:
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
> ---
>   include/exec/exec-all.h   |  1 +
>   include/exec/gen-icount.h | 21 +++++++++++++++++----
>   accel/tcg/cpu-exec.c      | 14 ++++++++++++++
>   3 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 6bb2a0f7ec..35d8e93976 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -503,6 +503,7 @@ struct TranslationBlock {
>   #define CF_USE_ICOUNT    0x00020000
>   #define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock held */
>   #define CF_PARALLEL      0x00080000 /* Generate code for a parallel context */
> +#define CF_NOIRQ         0x00100000 /* Generate an uninterruptible TB */
>   #define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
>   #define CF_CLUSTER_SHIFT 24
>   
> diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
> index 610cba58fe..c57204ddad 100644
> --- a/include/exec/gen-icount.h
> +++ b/include/exec/gen-icount.h
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
> @@ -74,8 +85,10 @@ static inline void gen_tb_end(const TranslationBlock *tb, int num_insns)
>                              tcgv_i32_arg(tcg_constant_i32(num_insns)));
>       }
>   
> -    gen_set_label(tcg_ctx->exitreq_label);
> -    tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
> +    if (tcg_ctx->exitreq_label) {
> +        gen_set_label(tcg_ctx->exitreq_label);
> +        tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
> +    }
>   }
>   
>   #endif

Split patch here, I think.


> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 9cb892e326..9e3ed42ceb 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -721,6 +721,15 @@ static inline bool need_replay_interrupt(int interrupt_request)
>   static inline bool cpu_handle_interrupt(CPUState *cpu,
>                                           TranslationBlock **last_tb)
>   {
> +    /*
> +     * If we have special cflags lets not get distracted with IRQs. We
> +     * shall exit the loop as soon as the next TB completes what it
> +     * needs to do.
> +     */

We will *probably* exit the loop, I think.

With watchpoints, we expect to perform the same memory operation, which is expected to hit 
the watchpoint_hit check in cpu_check_watchpoint, which will raise CPU_INTERRUPT_DEBUG.

With SMC, we flush all TBs from the current page, re-execute one insn, and then (probably) 
have to exit to generate the next tb.

With icount, in cpu_loop_exec_tb, we have no idea what's coming; we only know that we want 
no more than N insns to execute.

None of which directly exit the loop -- we need the IRQ check at the beginning of the 
*next* TB to exit the loop.

If we want to force an exit from the loop, we need CF_NO_GOTO_TB | CF_NO_GOTO_PTR.  Which 
is probably a good idea, at least for watchpoints; exit_tb is the fastest way out of the 
TB to recognize the debug interrupt.

The icount usage I find a bit odd.  I don't think that we should suppress an IRQ in that 
case -- we can have up to 510 insns outstanding on icount_budget, which is clearly far too 
many to have IRQs disabled.  I think we should not use cflags_next_tb for this at all, but 
should apply the icount limit later somehow, because an IRQ *could* be recognized 
immediately, with the first TB of the interrupt handler running with limited budget, and 
the icount tick being recognized at that point.

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

Is it clearer to add NOIRQ here, or back where we set cflags_next_tb in the first place?


r~

