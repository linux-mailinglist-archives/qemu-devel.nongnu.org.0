Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120C56103FE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 23:06:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooA30-00065o-NY; Thu, 27 Oct 2022 17:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooA1j-0005vs-Ii
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:03:10 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooA1h-0001FH-O1
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:02:59 -0400
Received: by mail-pl1-x62a.google.com with SMTP id c24so2888515pls.9
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 14:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DB7DAhj/1F9bqs3vodMstHLtW+8Unr375uEqjiDmZgo=;
 b=gDbDKxbMMsuPXC4GRf+mlS1w4vLzkHT71Zr+QkXHx2tMjU/lv+XJXvhjAznT8vPum+
 FkLdZUUR83mzBcqMXHX+MCmAgtoOBdzUXajcwBW7VgW9ezrLKZD1yoRw4Jb8qfxx4jr1
 ycM278Vai1VADTHILM6dDzX4jAYoKnR4JDU+6Rs7gVeATMbT9Zd7n6tuzBzf+4LTRY2w
 DCQ4QPwuDJrD70VN5yUQNzFrf5rtWcb3eZ5v2npzA8RcecRazPm8AmKSCyU9DO5Yp/Cs
 3JTNwWprC5jaqe4shCiVFIDIQr9wUHbmMxoIeWp9XBgPijt8e8p21G9o4mCFJ8qCJyDj
 rGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DB7DAhj/1F9bqs3vodMstHLtW+8Unr375uEqjiDmZgo=;
 b=xBnw6Nu2xgdf3ivy7bkliHwJanGWv9xUslA8QhTWskzDiyno/ndZEdMCZIXPlH43ke
 WFJWBDextP4NZLsC+5DYX47pM9ABxR07lUho/Egu3hLr+51++2WoYEFRbItG2S8FAx0a
 M/2tXY/xEWfFBo+1+HQCHnsYWo0mAMWb4r1kZDX6GZZlQIV4Cbf+UxzxdnVwmzur7AKc
 22VCIvqUs3lxsY5X0btYN4MfT+uHnrTnweDm6mUl7+A1bLYVfzyni3JLc0dUvMwtvLs/
 oFuoB7ZUxdOSszjUMCBLBNpxENeC18YUvZGpzYYg96sIfitDfTKNaELPruPTNEAIKC28
 erww==
X-Gm-Message-State: ACrzQf2WRzDN5xUoYE+XyJI+UNrUmbCBFaBLOzgApU7up4gVGNVKIxBf
 k8EadL69r+U8PatHWXO5YJloyw==
X-Google-Smtp-Source: AMsMyM67a6E3a4wKSNDKhTuh+0GdD9KBUVFmMYeqvGD9FfpJksClvRn1haCu/sRpuR7xdasvemz4mQ==
X-Received: by 2002:a17:902:edcd:b0:17a:6fa:228d with SMTP id
 q13-20020a170902edcd00b0017a06fa228dmr51193253plk.29.1666904576167; 
 Thu, 27 Oct 2022 14:02:56 -0700 (PDT)
Received: from ?IPV6:2001:8003:501a:d301:93c4:c1c9:4368:47fa?
 ([2001:8003:501a:d301:93c4:c1c9:4368:47fa])
 by smtp.gmail.com with ESMTPSA id
 j185-20020a62c5c2000000b0055f209690c0sm1599510pfg.50.2022.10.27.14.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 14:02:55 -0700 (PDT)
Message-ID: <59b2016d-949c-13aa-30df-050fc720bdae@linaro.org>
Date: Fri, 28 Oct 2022 07:02:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PULL 15/20] include/hw/core: Create struct CPUJumpCache
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
 <20221004195241.46491-16-richard.henderson@linaro.org>
 <20221027141856.w5umjgklawgu7pqv@heavy>
 <20221027144414.bwc5lklt7dx2wc3j@heavy>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221027144414.bwc5lklt7dx2wc3j@heavy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/28/22 00:44, Ilya Leoshkevich wrote:
> Putting CPUJumpCache inside CPUState made problem go away:
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 18ca701b443..3ea528566c3 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -32,6 +32,7 @@
>   #include "qemu/thread.h"
>   #include "qemu/plugin.h"
>   #include "qom/object.h"
> +#include "accel/tcg/tb-jmp-cache.h"
>   
>   typedef int (*WriteCoreDumpFunction)(const void *buf, size_t size,
>                                        void *opaque);
> @@ -366,7 +367,7 @@ struct CPUState {
>       CPUArchState *env_ptr;
>       IcountDecr *icount_decr_ptr;
>   
> -    CPUJumpCache *tb_jmp_cache;
> +    CPUJumpCache tb_jmp_cache;

Yes, well.  That structure is quite large (128kB?) and I had been hoping to (1) save that 
extra memory for e.g. KVM and (2) hide the tcg-specific stuff from core.

But clearly something went wrong during some threadedness with your test case.


>   void tcg_flush_jmp_cache(CPUState *cpu)
>   {
> -    CPUJumpCache *jc = cpu->tb_jmp_cache;
>   
> -    if (likely(jc)) {
> -        for (int i = 0; i < TB_JMP_CACHE_SIZE; i++) {
> -            qatomic_set(&jc->array[i].tb, NULL);
> -        }
> -    } else {
> -        /* This should happen once during realize, and thus never race. */
> -        jc = g_new0(CPUJumpCache, 1);
> -        jc = qatomic_xchg(&cpu->tb_jmp_cache, jc);
> -        assert(jc == NULL);
>       }
>   }
>   
> So there must be a race in tcg_flush_jmp_cache() after all?

If there had been a race here, we would abort with the assert.
It must be something else...


r~


