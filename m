Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE0C45C7DA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:43:56 +0100 (CET)
Received: from localhost ([::1]:46866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mptV4-0004F2-TH
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:43:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mptTh-0003Fv-TF
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:42:29 -0500
Received: from [2a00:1450:4864:20::429] (port=37443
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mptTf-0000Te-Et
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:42:29 -0500
Received: by mail-wr1-x429.google.com with SMTP id b12so4653760wrh.4
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 06:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wKm/iMfEWZbaJo1mhhwKk6ehOzJoJYMSsRo48IjVVOE=;
 b=jfTTsv2pbiEYaQK0vf7qeuPkX5aETpI5PMLB8RqbW79zikrPVFsigbEJIBkOLG1+dz
 ubANVs1j3ecy5Uu7hR7UbJPto0ls+4X8jNMGsVIi+lmKhSqvu2ATUWzxnwFDg27pSQQI
 gYCFSn+fzoAEM0LHmQA+tcKmtUaMNHQhftMGo+0WF3zw/eh6eKUz+X7RKcmeDokWdtm6
 6X1VCMiHsmqP7wwiyrcMYaD9ng3LD8z5I8nKbmq+0Z6kL0DOlmobIlHQg41fQCalpkjg
 j3/FkXWI2cB1/HyRCTVGml7ZQAJ8N0p2FIFn7jLSrAsEMSf70hKYjmVec9f6YRlU0Eje
 rs7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wKm/iMfEWZbaJo1mhhwKk6ehOzJoJYMSsRo48IjVVOE=;
 b=TEP75NR0eTfbUWsdo7dh9EVt32aWpnnZHxbeDsN3+/dpDfTp6cVpJOU3k5LH632Z0l
 5uuiBCuOIzUKx/Pb5RxVXr0XuW7+QBB0ZhGWZJ5zEKHJBa9oY+dS+UE2KVDJzpL3yMGU
 9O8/K4bO2fWMkKqpz0p5Vx9FLqt43fp1k71wRQRqAAgjZ7kBlUqzdHPGevkBcwfVeuR+
 NqIbfk6Z6UKwsBPrpMtqOQCTr1GT9MNLAqc7s872dANRIRr9AB3A8TqR4IwH6zHW+miD
 nNIxmSv929HzCXdW0hrFSKmsNsy/dM5xQjgl9uqt/dAtABPtLFXe2JAR3uqs1Ef584Ju
 FiMg==
X-Gm-Message-State: AOAM532OIjp+6QNBBPuzYrD8fxDUStV/hPopiUh0t2IIGxM9HKqinBr6
 3pvlj500qTMuWveQz9MJEuEUAw==
X-Google-Smtp-Source: ABdhPJwPLxDPJ1H6RGlHi9gT2NzRIhjfS3X1ph3EFns8jtpOvTLu/GNmf628he52NobY6/LzjWpMdw==
X-Received: by 2002:a5d:5007:: with SMTP id e7mr15597557wrt.320.1637764945429; 
 Wed, 24 Nov 2021 06:42:25 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id n4sm27350wri.41.2021.11.24.06.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 06:42:24 -0800 (PST)
Subject: Re: [PATCH v1 2/7] accel/tcg: suppress IRQ check for special TBs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211123205729.2205806-1-alex.bennee@linaro.org>
 <20211123205729.2205806-3-alex.bennee@linaro.org>
 <69ae3ca0-a485-d5ff-2508-5fcd13869498@linaro.org> <8735nliy2n.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d48bf77-e8c0-d9ba-4b28-6b13e870f95a@linaro.org>
Date: Wed, 24 Nov 2021 15:42:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8735nliy2n.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 11:24 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 11/23/21 9:57 PM, Alex Bennée wrote:
>>> Generally when we set cpu->cflags_next_tb it is because we want to
>>> carefully control the execution of the next TB. Currently there is a
>>> race that causes cflags_next_tb to get ignored if an IRQ is processed
>>> before we execute any actual instructions.
>>> To avoid this we introduce a new compiler flag: CF_NOIRQ to suppress
>>> this check in the generated code so we know we will definitely execute
>>> the next block.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
>>> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/245
>>> ---
>>>    include/exec/exec-all.h   |  1 +
>>>    include/exec/gen-icount.h | 21 +++++++++++++++++----
>>>    accel/tcg/cpu-exec.c      | 14 ++++++++++++++
>>>    3 files changed, 32 insertions(+), 4 deletions(-)
>>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>>> index 6bb2a0f7ec..35d8e93976 100644
>>> --- a/include/exec/exec-all.h
>>> +++ b/include/exec/exec-all.h
>>> @@ -503,6 +503,7 @@ struct TranslationBlock {
>>>    #define CF_USE_ICOUNT    0x00020000
>>>    #define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock held */
>>>    #define CF_PARALLEL      0x00080000 /* Generate code for a parallel context */
>>> +#define CF_NOIRQ         0x00100000 /* Generate an uninterruptible TB */
>>>    #define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
>>>    #define CF_CLUSTER_SHIFT 24
>>>    diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
>>> index 610cba58fe..c57204ddad 100644
>>> --- a/include/exec/gen-icount.h
>>> +++ b/include/exec/gen-icount.h
>>> @@ -21,7 +21,6 @@ static inline void gen_tb_start(const TranslationBlock *tb)
>>>    {
>>>        TCGv_i32 count;
>>>    -    tcg_ctx->exitreq_label = gen_new_label();
>>>        if (tb_cflags(tb) & CF_USE_ICOUNT) {
>>>            count = tcg_temp_local_new_i32();
>>>        } else {
>>> @@ -42,7 +41,19 @@ static inline void gen_tb_start(const TranslationBlock *tb)
>>>            icount_start_insn = tcg_last_op();
>>>        }
>>>    -    tcg_gen_brcondi_i32(TCG_COND_LT, count, 0,
>>> tcg_ctx->exitreq_label);
>>> +    /*
>>> +     * Emit the check against icount_decr.u32 to see if we should exit
>>> +     * unless we suppress the check with CF_NOIRQ. If we are using
>>> +     * icount and have suppressed interruption the higher level code
>>> +     * should have ensured we don't run more instructions than the
>>> +     * budget.
>>> +     */
>>> +    if (tb_cflags(tb) & CF_NOIRQ) {
>>> +        tcg_ctx->exitreq_label = NULL;
>>> +    } else {
>>> +        tcg_ctx->exitreq_label = gen_new_label();
>>> +        tcg_gen_brcondi_i32(TCG_COND_LT, count, 0, tcg_ctx->exitreq_label);
>>> +    }
>>>          if (tb_cflags(tb) & CF_USE_ICOUNT) {
>>>            tcg_gen_st16_i32(count, cpu_env,
>>> @@ -74,8 +85,10 @@ static inline void gen_tb_end(const TranslationBlock *tb, int num_insns)
>>>                               tcgv_i32_arg(tcg_constant_i32(num_insns)));
>>>        }
>>>    -    gen_set_label(tcg_ctx->exitreq_label);
>>> -    tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
>>> +    if (tcg_ctx->exitreq_label) {
>>> +        gen_set_label(tcg_ctx->exitreq_label);
>>> +        tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
>>> +    }
>>>    }
>>>      #endif
>>
>> Split patch here, I think.
> 
> Not including the header to cpu_handle_interrupt?

Correct.  Introduce CF_NOIRQ without using it yet.

>> With icount, in cpu_loop_exec_tb, we have no idea what's coming; we
>> only know that we want no more than N insns to execute.
> 
> I think technically we do because all asynchronous interrupt are tied to
> the icount (which is part of the budget calculation - icount_get_limit).

Are you sure that's plain icount and not replay?
In icount_get_limit we talk about timers, not any other asynchronous interrupt, like a 
keyboard press.

> In theory we could drop the interrupt check altogether in icount mode
> because we should always end and exit to the outer loop when a timer is
> going to expire.

But we know nothing about synchronous exceptions or anything else.

> I wonder what would happen if we checked u16.high in icount mode? No
> timer should ever set it - although I guess it could get set during an
> IO operation.

Uh, we do, via u32?  I'm not sure what you're saying here.

> Perhaps really all icount exit checks should be done at the end of
> blocks? I suspect that breaks too many assumptions in the rest of the
> code.

There are multiple exits at the end of the block, which is why we do the check at the 
beginning of the next block.  Besides, we have to check that the block we're about to 
execute is within budget.

> Are there cases of setting cpu->cflags_next_tb which we are happy to get
> preempted by asynchronous events?

Well, icount.

> I guess in the SMC case it wouldn't
> matter because when we get back from the IRQ things get reset?

SMC probably would work with an interrupt, but we'd wind up having to repeat the process 
of flushing all TBs on the page, so we might as well perform the one store and get it over 
with.


r~

