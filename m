Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C629730D02C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 01:12:41 +0100 (CET)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l75mi-0004Ue-AU
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 19:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l75le-0003xn-6I
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 19:11:34 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:34455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l75lc-00038H-5q
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 19:11:33 -0500
Received: by mail-pg1-x531.google.com with SMTP id o7so16059237pgl.1
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 16:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WE/tlCHDAqlfUbqXWUVdDUsdWoaxK3zyMGRH8Du4vdc=;
 b=sYtNQP36YHH86OLqD8fwaFQsgq90zSnV1E+QAPsw08HQFPMF99MX7dXqZXxqfPecNN
 gBDOZ0vamaFScQTmZH8Z9UhwWhxdE9AaWjti54c57hq6HF6HhF9UfCqXk3dHys1suOLA
 bOtjVwSYwS+CutOJnVa8GkgoYOrxtJtXU55/9VHUkuoGgRe+GT35Z3+8TBb8416H8g+Q
 esEDEax0C7SHccp7LA4jVYJ5PpyLmKY6SzNlD8dMzKfE5s/KLsA6pa8ruX3Ao02ccYd6
 Szh8eY2oqQrUd5HdPWJYl/Kk9vIF7nn3cGKMwNspxeeopfeYjVQPnnQosnXszbQZvp+F
 HAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WE/tlCHDAqlfUbqXWUVdDUsdWoaxK3zyMGRH8Du4vdc=;
 b=Ee7225QYYWV/VhjkhlDKd+c6w+KwyXN0f01h1hI1DWtXZYtdWUf7nSG8opjHjMkUP7
 cblBYitZhl1bwcBJBdFkofjbSxX8PU78KgD5jW695XJMdU1BJphW6DMim7CZzLLaIvL2
 wrOwnwogiyxlkF3OXH17FpxRWpCoys+TUAV7V0YwZG5SpQMboqgzvUeF6jT8QFGco0ks
 vUoQ2DxssOBXz9/BDIjhNi5gnJRPj6fS+BW7JyZnt+XcAszUyYlThfnfUvKdO6ZGmKUJ
 CzU0a/8dgH5SxN6o01CetHl94eSxsFSfNQ8jDQ98n0QdHgoO1xTbN2+5ryattxUiESzh
 f7UQ==
X-Gm-Message-State: AOAM530v7pnyhe4G1EvOjTt1Z97PZCjZ4rlz6e2ofK7aSfNSibJjSQsi
 t3MUPFYA4MZtCayecDc7UIxOhA==
X-Google-Smtp-Source: ABdhPJxq+h5GgkPBJJB0YiMDOZHZDibGjeJ1pwsQNX0KkfDsSNEiOPZVok4vi8ktiXsUEFsw9foK7A==
X-Received: by 2002:a63:e30d:: with SMTP id f13mr636430pgh.39.1612311089854;
 Tue, 02 Feb 2021 16:11:29 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d76sm115709pfd.193.2021.02.02.16.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 16:11:29 -0800 (PST)
Subject: Re: [PATCH v3 2/4] target/arm: Add support for FEAT_DIT, Data
 Independent Timing
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20210128044529.1403-1-rebecca@nuviainc.com>
 <20210128044529.1403-3-rebecca@nuviainc.com>
 <5ac0bb98-107b-004c-4ef3-b4ee0e15530a@linaro.org>
 <621ad496-705e-3fc6-0ff9-f37e1836a267@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52b4fca4-e5af-1791-6d83-374430647130@linaro.org>
Date: Tue, 2 Feb 2021 14:11:26 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <621ad496-705e-3fc6-0ff9-f37e1836a267@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.155,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 12:21 PM, Rebecca Cran wrote:
> On 1/27/21 10:06 PM, Richard Henderson wrote:
>> In particular: CPSR.DIT (bit 21) -> SPSR_EL1.DIT (bit 24), and merging
>> PSTATE.SS into SPSR_EL1.SS (bit 21).
> 
> Thanks. I _think_ I'm understanding it better now. Would the following work? I
> don't see where I need to map PSTATE.SS into SPSR_EL1.SS though, because isn't
> that handled automatically since PSTATE maps onto SPSR?
> 
> 
> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
> index a6b162049806..c1ff24d42f32 100644
> --- a/target/arm/helper-a64.c
> +++ b/target/arm/helper-a64.c
> @@ -1003,6 +1003,11 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t
> new_pc)
>          if (!arm_singlestep_active(env)) {
>              env->pstate &= ~PSTATE_SS;
>          }
> +
> +        if (spsr & PSTATE_DIT) {
> +            env->uncached_cpsr |= CPSR_DIT;
> +        }

This is missing the restore of PSTATE_SS for when singlestep *is* active.

> @@ -9426,6 +9426,12 @@ static void take_aarch32_exception(CPUARMState *env, int
> new_mode,
>       */
>      env->pstate &= ~PSTATE_SS;
>      env->spsr = cpsr_read(env);
> +
> +    if (env->uncached_cpsr & CPSR_DIT) {
> +        env->spsr |= PSTATE_DIT;
> +        env->spsr &= ~PSTATE_SS;
> +    }

This one is incorrect because we're not storing to SPSR_ELx format, but SPSR
(the aa32 version), which has DIT at bit 21.

> @@ -9905,6 +9911,11 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>          old_mode = cpsr_read(env);
>          env->elr_el[new_el] = env->regs[15];
> 
> +        if (old_mode & CPSR_DIT) {
> +            old_mode |= PSTATE_DIT;
> +            old_mode &= ~PSTATE_SS;

This line would be clearer using CPSR_DIT.  I don't see PSTATE_SS being added
to old_mode.  Is that somewhere else, or simply missing context here?

I think it would be clearer to add some new helpers.  Naming is always
difficult, but how about:

static uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
{
    uint32_t ret = cpsr_read(env);

    /* Move DIT to the correct location for SPSR_ELx */
    if (ret & CPSR_DIT) {
        ret &= ~CPSR_DIT;
        ret |= PSTATE_DIT;
    }
    /* Merge PSTATE.SS into SPSR_ELx */
    ret |= env->pstate & PSTATE_SS;

    return ret;
}

static void cpsr_write_from_spsr_elx(CPUARMState *env,
                                     uint32_t val)
{
    uint32_t mask;

    /* Save SPSR_ELx.SS into PSTATE. */
    env->pstate = (env->pstate & ~PSTATE_SS) | (val & PSTATE_SS);
    val &= ~PSTATE_SS;

    /* Move DIT to the correct location for CPSR */
    if (val & PSTATE_DIT) {
        val &= ~PSTATE_DIT;
        val |= CPSR_DIT;
    }

    mask = aarch32_cpsr_valid_mask(env->features, \
        &env_archcpu(env)->isar);
    cpsr_write(env, val, mask, CPSRWriteRaw);
}


r~

