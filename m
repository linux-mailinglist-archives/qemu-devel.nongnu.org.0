Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750746A4F86
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:08:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmbU-0004fz-Kt; Mon, 27 Feb 2023 18:08:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmbS-0004W1-KF
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:08:18 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmbQ-0002Qp-OB
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:08:18 -0500
Received: by mail-pl1-x633.google.com with SMTP id bh1so8486548plb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rs8ZI0em86jFj0aRHzp+gr3nbM9LpvUCL8tL69gPM5o=;
 b=XYqAIicEtiVcXrr3FC+uZdAWItOhlaDcNJ2lCyvdyeX1PRtNSd3/cPsqH/AVaqWAto
 YPF61tQjBzdiNf5qg6pdaYhTnAqF9y7Jp7KDax9sG+iDoyJrYIMakteuQ9XhQ+ATq9af
 TTmj+OU0hmws+o8dqKN8YWjwXbYfjnKvRL7JuEsD896U7BSY4pQBrhKg2vM8jcwHHrY+
 0hIjm8IqaU7+g546Bc4iYGk9x318O1sIjGA8jeq6lE4jR/0mB3VKkXeqpZQWM/vaJ2Ri
 JpWqlYozrBUyqLgcXFnGdCjkd85/Gy0L2Kbh9VMTA9MdKGd5rdjzjNEH4Ccx0lVQ/muv
 8BNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rs8ZI0em86jFj0aRHzp+gr3nbM9LpvUCL8tL69gPM5o=;
 b=3EihYExvYWyLprBDZLoy7Z4XPMyQyJfSbA7Tf1QMUO25I9BuBzALz1W0lKnBFmAhHD
 Tp5wxo8DMXTmpePqRNdXZEIMGYixtJ0ITkuC5wR+izDaKNPNiuTCPIFELl+lOgec+vV4
 PTC5EEo9/bmwTZVq5mq9Xcoxtr+tR0YMGjHUY/vRUYkhvQZNVBbxkHM6J2TSnFf6r7LX
 8MHwc1lDNe0R+PoluTTkATX+w6hX6HnKY2sUPWnxDLPPNqGFSneGNtrw4ilRwe/0hggS
 6bdnxasWJ8JtK827+Q2IkDCwJ0HSmNY4iE9KRXIvn6OjN20ulZtjX1yIkxVA3a1eTYHC
 EQ3g==
X-Gm-Message-State: AO0yUKULylMFPqt7zJ24KMFzphZ7vMlzODlkJaUIHvqW7gOud0QnM/Mo
 fI3QRdZajNcM+hwvjPoad140rw==
X-Google-Smtp-Source: AK7set/Vj8eWygsvnU7RiYwgsiHV88Q6yTZZ8F2Uha2wf0gNlgovgnjWwPNbA2Mc/uMO9JqPFnUuPQ==
X-Received: by 2002:a17:902:d504:b0:19c:e842:a9e0 with SMTP id
 b4-20020a170902d50400b0019ce842a9e0mr623389plg.16.1677539295375; 
 Mon, 27 Feb 2023 15:08:15 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 jj13-20020a170903048d00b001967692d6f5sm5078973plb.227.2023.02.27.15.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 15:08:14 -0800 (PST)
Message-ID: <9e05f3ff-07f1-50f4-3069-0161a5c54404@linaro.org>
Date: Mon, 27 Feb 2023 13:08:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 17/27] target/riscv: Replace `tb_pc()` with `tb->pc`
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, anjo@rev.ng
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <mhng-4cd6d6c3-ac6c-40e7-ba7d-fe4b9761a395@palmer-ri-x1c9a>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <mhng-4cd6d6c3-ac6c-40e7-ba7d-fe4b9761a395@palmer-ri-x1c9a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 2/27/23 13:05, Palmer Dabbelt wrote:
> On Mon, 27 Feb 2023 05:51:52 PST (-0800), anjo@rev.ng wrote:
>> Signed-off-by: Anton Johansson <anjo@rev.ng>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>  target/riscv/cpu.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 93b52b826c..9eb748a283 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -34,6 +34,7 @@
>>  #include "fpu/softfloat-helpers.h"
>>  #include "sysemu/kvm.h"
>>  #include "kvm_riscv.h"
>> +#include "tcg/tcg.h"
>>
>>  /* RISC-V CPU definitions */
>>
>> @@ -533,10 +534,12 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>>      CPURISCVState *env = &cpu->env;
>>      RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
>>
>> +    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
>> +
>>      if (xl == MXL_RV32) {
>> -        env->pc = (int32_t)tb_pc(tb);
>> +        env->pc = (int32_t) tb->pc;
>>      } else {
>> -        env->pc = tb_pc(tb);
>> +        env->pc = tb->pc;
>>      }
>>  }
> 
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Thanks!  I'm going to assume you want these to stay together, but LMK if you were looking 
> to aim this at the RISC-V tree.

I've queued to tcg-next, so they'll stay together.
I've now added your r-b.


r~


