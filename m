Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3782D3EF38E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 22:32:55 +0200 (CEST)
Received: from localhost ([::1]:51112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG5lW-0003Js-95
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 16:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG5kS-0002Gn-1H
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 16:31:51 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG5kP-0002EU-Pw
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 16:31:47 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so7256262pjn.4
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 13:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=W9wdJClR/7ZCULmGcfSTqMYVVSuIcOv66oLmSImGX94=;
 b=dvcF9ic1NEs2n1E0Djhk6VtDydBo30DdMkqoAxLTaogiqa4vxJrupeXBHkqI+YHTYP
 1hbyp/khAznNzXz0C1Y50m+FVWd6UJhdWAJ9VQGIlrprSXLPIUBLoJwnazrdBPWy4Grk
 cccJAmsFpCmxxWx6FUvRz9EkBGKoKkxHV1zRDlUwKmJUNgmwo1Xxg8xxutH5GBq84clg
 pTnotlRRtxMHOXG9yw0A0ASua5vQiXrBcOwJAw5Q5OL+r4kZHn+VCnGgoyeHpU5/WQ8o
 S5qCRdV1Vku0+O8xT1q75qXG0I6Es4miAQZu5vDaljNtXcMCGpy5ZXoUlLPPXa7WnpET
 msVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W9wdJClR/7ZCULmGcfSTqMYVVSuIcOv66oLmSImGX94=;
 b=r+zkdVsNWcSIHCjk7jGLkn2Zjjku4rQeBppWcCjOzvAtOnWaLQKIUr3yhNWP3ag+As
 jBK4VftsZKrXMGNsdkJU7DrBkuTa44stgQuAvMR4Lk2k1V4o3yAZyor8sQJ6Ow1+7pxj
 bIMdAJ6lfbUunJY7fAiHfJZuLHqlrK4Cojqn0qSUbRgkKLwCGnaxb9OD6fSpfhtEEX5w
 UgzbLvcHv10mQOuJvhDZTTIOp6bSTLuvq5XcKSPU1v8pfSuw34QmQhgUqZ+56lbs1LJP
 F7eyjP1az/VRT9LDifSark/FE1IX692bPz//ynQ2LdxqWkAgTzX5rlkyGXb9ugn4lgSh
 Yacw==
X-Gm-Message-State: AOAM531nkFLRjXgymSpWV8vOh3E90cWlyTc9yyC5RyCDIXu9ZdNrFV8p
 Tf4x51fIClxhD2HwAHen+QhXjfiqOBBaRA==
X-Google-Smtp-Source: ABdhPJzHuiWlc2uAcN90GYeMwtfVi6eOrN4ri0nr+Fi3hadxxUeIm7kY/agT/qdXsjpBKZeQOr+Elw==
X-Received: by 2002:a17:90a:c481:: with SMTP id
 j1mr647214pjt.164.1629232303999; 
 Tue, 17 Aug 2021 13:31:43 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id o14sm4073048pgl.85.2021.08.17.13.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 13:31:43 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Take an exception if PSTATE.IL is set
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210817162118.24319-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a59ce840-3694-0936-b67e-2187d367a90d@linaro.org>
Date: Tue, 17 Aug 2021 10:31:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817162118.24319-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 6:21 AM, Peter Maydell wrote:
> In v8A, the PSTATE.IL bit is set for various kinds of illegal
> exception return or mode-change attempts.  We already set PSTATE.IL
> (or its AArch32 equivalent CPSR.IL) in all those cases, but we
> weren't implementing the part of the behaviour where attempting to
> execute an instruction with PSTATE.IL takes an immediate exception
> with an appropriate syndrome value.
> 
> Add a new TB flags bit tracking PSTATE.IL/CPSR.IL, and generate code
> to take an exception instead of whatever the instruction would have
> been.
> 
> PSTATE.IL and CPSR.IL change only on exception entry, attempted
> exception exit, and various AArch32 mode changes via cpsr_write().
> These places generally already rebuild the hflags, so the only place
> we need an extra rebuild_hflags call is in the illegal-return
> codepath of the AArch64 exception_return helper.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Obviously correct guest code is never going to set PSTATE.IL, but
> it's pretty confusing to debug bugs in guest OSes if we just plough
> on executing code rather than taking the illegal-state exception.  We
> had a user point this bug out to us earlier this year I think
> (probably on IRC since I can't find anything about it in my email).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +    if (s->pstate_il) {
> +        /*
> +         * Illegal execution state. This has priority over BTI
> +         * exceptions, but comes after instruction abort exceptions.
> +         */
> +        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
> +                           syn_illegalstate(), default_exception_el(s));
> +    }

Missing return after exception.

> @@ -9045,6 +9045,15 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>           return;
>       }
>   
> +    if (s->pstate_il) {
> +        /*
> +         * Illegal execution state. This has priority over BTI
> +         * exceptions, but comes after instruction abort exceptions.
> +         */
> +        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
> +                           syn_illegalstate(), default_exception_el(s));
> +    }
...
> @@ -9576,6 +9586,15 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>       }
>       dc->insn = insn;
>   
> +    if (dc->pstate_il) {
> +        /*
> +         * Illegal execution state. This has priority over BTI
> +         * exceptions, but comes after instruction abort exceptions.
> +         */
> +        gen_exception_insn(dc, dc->pc_curr, EXCP_UDEF,
> +                           syn_illegalstate(), default_exception_el(dc));
> +    }

Likewise.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

