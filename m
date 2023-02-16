Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58A4698D65
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 07:52:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSY7Y-00056P-6F; Thu, 16 Feb 2023 01:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSY7V-00055m-Ay
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:51:54 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSY7T-0008Em-Ej
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:51:53 -0500
Received: by mail-pj1-x1044.google.com with SMTP id bx22so966926pjb.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 22:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ab2ZjYYQZ2420ZQV7z46wJkPNvgiMOwzc8R/WH7A29Q=;
 b=kUZpULT4bHKy0GHC9EFgrQp1ALJtiWQ5fOWXyX5K73pFWdN3pZFcqYzU+WX6m7Z4FV
 CX3fFIvJVArU5zuXPHlv8jRpXuvbR0AHFhE6zRyMDds9FcF8x76DzDW6X2Z1jWI8MCH9
 6AALqQKxqycRmVzZmm2nbn2kGrYNPynmqGto4NkDfRig/Il6zaykGEqv3P3IcnoXI4BC
 ra20au1/Jj+LJ95HVhXc7WyT44LIzYDi0GX65yhRlDQKSa4z+U5mktfMAz+CehfDxjyK
 FjkrjyRkDjH6/r9m7A7f8vB6M1DwS8JBzblLiFT13EQvyaRvnK5x9tEIQpKAEQsgfJGJ
 egow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ab2ZjYYQZ2420ZQV7z46wJkPNvgiMOwzc8R/WH7A29Q=;
 b=ODQi/v6uB7Ub+ropvsEOiFaTk97WrXjQbYSKouM98sGlsNXYuXwYAwS7zYv2w+4MST
 MvF8Hbtf8XWEa/SHx8PtMRDkiG2zE1vkpFk2Ael0VySyr5ZiOkF/sPnRagi5FFyefCLa
 eGD0fQDBoqAQuI/DOlnHtcg3e8LoPiA0RGB9YekLFBP2gxlm40itrSa87y9YXm5IncA3
 p3aJXFz73NWg8OJ6+jL4Iy5FRVL44KcnI2AlXLoI8fQNUia5jlMNskyrxQfjbXZP/zrV
 xcIjhIEKTRiEA0/EqlpFvxVqATTxRkd6+IeTfVspPcos1iLPoK//h3/UPlfif7MjHbKK
 BnHw==
X-Gm-Message-State: AO0yUKVItVTwCnYT3l4R9Klh/K1kJhfYgb1ahKB7q6npCqy9e0CI629j
 EjCeTG1Z/iWk5eU2yrwEEe4GZGlRg3PLvfcF43mSKA==
X-Google-Smtp-Source: AK7set8gd28nQ4LrzdonL4XcHTQVxQQPJaIQhwygIZnX8aWbvmZJZtRsLXdFdyeyzJ6EEtW2mgoW1w==
X-Received: by 2002:a17:902:d490:b0:19a:b427:230a with SMTP id
 c16-20020a170902d49000b0019ab427230amr5771340plg.63.1676530309956; 
 Wed, 15 Feb 2023 22:51:49 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 y21-20020a634b15000000b004eca54eab50sm477217pga.28.2023.02.15.22.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 22:51:49 -0800 (PST)
Message-ID: <bd6288c7-6478-7c09-d13f-2a9a47cecf71@linaro.org>
Date: Wed, 15 Feb 2023 20:51:44 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] target/i386: Fix 32-bit AD[CO]X insns in 64-bit mode
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20230115012103.3131796-1-richard.henderson@linaro.org>
In-Reply-To: <20230115012103.3131796-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ping.

Paolo, I see you've queued a fix for a different ADCOX bug in your latest pull.  You could 
probably adjust your new test for this case, but this problem is exclusively x86_64.

r~


On 1/14/23 15:21, Richard Henderson wrote:
> Failure to truncate the inputs results in garbage for the carry-out.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1373
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/x86_64/adox.c          | 69 ++++++++++++++++++++++++++++++++
>   target/i386/tcg/emit.c.inc       |  2 +
>   tests/tcg/x86_64/Makefile.target |  3 ++
>   3 files changed, 74 insertions(+)
>   create mode 100644 tests/tcg/x86_64/adox.c
> 
> diff --git a/tests/tcg/x86_64/adox.c b/tests/tcg/x86_64/adox.c
> new file mode 100644
> index 0000000000..36be644c8b
> --- /dev/null
> +++ b/tests/tcg/x86_64/adox.c
> @@ -0,0 +1,69 @@
> +/* See if ADOX give expected results */
> +
> +#include <assert.h>
> +#include <stdint.h>
> +#include <stdbool.h>
> +
> +static uint64_t adoxq(bool *c_out, uint64_t a, uint64_t b, bool c)
> +{
> +    asm ("addl $0x7fffffff, %k1\n\t"
> +         "adoxq %2, %0\n\t"
> +         "seto %b1"
> +         : "+r"(a), "=&r"(c) : "r"(b), "1"((int)c));
> +    *c_out = c;
> +    return a;
> +}
> +
> +static uint64_t adoxl(bool *c_out, uint64_t a, uint64_t b, bool c)
> +{
> +    asm ("addl $0x7fffffff, %k1\n\t"
> +         "adoxl %k2, %k0\n\t"
> +         "seto %b1"
> +         : "+r"(a), "=&r"(c) : "r"(b), "1"((int)c));
> +    *c_out = c;
> +    return a;
> +}
> +
> +int main()
> +{
> +    uint64_t r;
> +    bool c;
> +
> +    r = adoxq(&c, 0, 0, 0);
> +    assert(r == 0);
> +    assert(c == 0);
> +
> +    r = adoxl(&c, 0, 0, 0);
> +    assert(r == 0);
> +    assert(c == 0);
> +
> +    r = adoxl(&c, 0x100000000, 0, 0);
> +    assert(r == 0);
> +    assert(c == 0);
> +
> +    r = adoxq(&c, 0, 0, 1);
> +    assert(r == 1);
> +    assert(c == 0);
> +
> +    r = adoxl(&c, 0, 0, 1);
> +    assert(r == 1);
> +    assert(c == 0);
> +
> +    r = adoxq(&c, -1, -1, 0);
> +    assert(r == -2);
> +    assert(c == 1);
> +
> +    r = adoxl(&c, -1, -1, 0);
> +    assert(r == 0xfffffffe);
> +    assert(c == 1);
> +
> +    r = adoxq(&c, -1, -1, 1);
> +    assert(r == -1);
> +    assert(c == 1);
> +
> +    r = adoxl(&c, -1, -1, 1);
> +    assert(r == 0xffffffff);
> +    assert(c == 1);
> +
> +    return 0;
> +}
> diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
> index 1eace1231a..d44c51209d 100644
> --- a/target/i386/tcg/emit.c.inc
> +++ b/target/i386/tcg/emit.c.inc
> @@ -1042,6 +1042,8 @@ static void gen_ADCOX(DisasContext *s, CPUX86State *env, MemOp ot, int cc_op)
>   #ifdef TARGET_X86_64
>       case MO_32:
>           /* If TL is 64-bit just do everything in 64-bit arithmetic.  */
> +        tcg_gen_ext32u_tl(s->T0, s->T0);
> +        tcg_gen_ext32u_tl(s->T1, s->T1);
>           tcg_gen_add_i64(s->T0, s->T0, s->T1);
>           tcg_gen_add_i64(s->T0, s->T0, carry_in);
>           tcg_gen_shri_i64(carry_out, s->T0, 32);
> diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
> index 4eac78293f..e64aab1b81 100644
> --- a/tests/tcg/x86_64/Makefile.target
> +++ b/tests/tcg/x86_64/Makefile.target
> @@ -12,11 +12,14 @@ ifeq ($(filter %-linux-user, $(TARGET)),$(TARGET))
>   X86_64_TESTS += vsyscall
>   X86_64_TESTS += noexec
>   X86_64_TESTS += cmpxchg
> +X86_64_TESTS += adox
>   TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
>   else
>   TESTS=$(MULTIARCH_TESTS)
>   endif
>   
> +adox: CFLAGS=-O2
> +
>   run-test-i386-ssse3: QEMU_OPTS += -cpu max
>   run-plugin-test-i386-ssse3-%: QEMU_OPTS += -cpu max
>   


