Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1F53C2749
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:06:01 +0200 (CEST)
Received: from localhost ([::1]:36694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1t0q-00075u-EY
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1svd-0007JY-NQ
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:00:42 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sva-00056W-Ar
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:00:37 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 p14-20020a17090ad30eb02901731c776526so6178112pju.4
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B+NcA0+bHCMXXHJ6PZKfjBTuUxOEq1FnYZTs7IzUoIY=;
 b=qt/GkPc8jIVHxFENn1dDX7Qn3Tlx/fgRXf6aR+oX9/lmgU+Wfm/rt6W6M+74PySD4u
 LG/KhXh6YY8yYl1p6EyrCtcsGU1HaVUGzGDmSSYMbHtJEYqzBMKH/Kk7iLvfjIRyIe1w
 Ia8Sght9ABhn0lYJrCl+t2eIrPNfnZ0azpF202nGtUFiUlzB1zjlcvDnb8RwOPw9fn4M
 tVzvOB2XIKBz22sRu6wYzjdKnwqxcl9nmEV65dKmkRJXLJGp6zoVWlyKe9Zud4AezWhM
 rRETt8UFvZBwBD0Gita5O0XaPKKfp9EbOIvElEyFTDy5UJYnF4hXzggrnbJ64aYCiBA7
 5x3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B+NcA0+bHCMXXHJ6PZKfjBTuUxOEq1FnYZTs7IzUoIY=;
 b=TD8Eu8Dke0LDlzUAXpNIYBl62y3wVLsAz1stKEasVl5iBdnttcEp6TyDOYM1/s+l2D
 ApHjOm7gW4y+TUcpqAr4dMM/qbB3aisO5SGMYHlZ/x4UcezzC+SkKPqD5AJBIv13itEd
 QwEC8FSM4YRgJjKYMNONSyBaLHIvQUXI0EJ4BUaKVj30yLJSaU2bsLTACLt0XjZM5VDW
 Drg+fhCh+gP0kMGu0x78iXWlsIapUaPmEEZONEWekmqQNto7PX+I/xEWaKdFg3DCdol9
 hwBOHeA/naY9MIxChTb3GKJZSRVvRCzKNHKEnuOQWTXU7CKQXoHyuFJI/nUc8UO+2WOI
 bV9A==
X-Gm-Message-State: AOAM532gYvDmOA+aFkYFJM+fa14oa4cLveP7qOsW2rxVWnkgYVWidA5Z
 fVSZ4ObTxJDciE7TYQSvnujzOQ==
X-Google-Smtp-Source: ABdhPJw021s7yiR8aQFvqdVVfxWwE8neBt4vBorplFuVMnWAKg9Lt3nXNM1NFGbjdPvBn6T+Osq3DQ==
X-Received: by 2002:a17:90a:4a8f:: with SMTP id
 f15mr11686061pjh.76.1625846432783; 
 Fri, 09 Jul 2021 09:00:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y7sm6445859pfi.204.2021.07.09.09.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 09:00:32 -0700 (PDT)
Subject: Re: [PATCH] target/i386: Use cpu_breakpoint_test in breakpoint_handler
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210620062317.1399034-1-richard.henderson@linaro.org>
Message-ID: <c0e97e2b-44e0-b1dc-e629-cbb6bb319502@linaro.org>
Date: Fri, 9 Jul 2021 09:00:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210620062317.1399034-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.

On 6/19/21 11:23 PM, Richard Henderson wrote:
> The loop is performing a simple boolean test for the existence
> of a BP_CPU breakpoint at EIP.  Plus it gets the iteration wrong,
> if we happen to have a BP_GDB breakpoint at the same address.
> 
> We have a function for this: cpu_breakpoint_test.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/sysemu/bpt_helper.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/target/i386/tcg/sysemu/bpt_helper.c b/target/i386/tcg/sysemu/bpt_helper.c
> index 9bdf7e170b..f1fb479ad9 100644
> --- a/target/i386/tcg/sysemu/bpt_helper.c
> +++ b/target/i386/tcg/sysemu/bpt_helper.c
> @@ -210,7 +210,6 @@ void breakpoint_handler(CPUState *cs)
>   {
>       X86CPU *cpu = X86_CPU(cs);
>       CPUX86State *env = &cpu->env;
> -    CPUBreakpoint *bp;
>   
>       if (cs->watchpoint_hit) {
>           if (cs->watchpoint_hit->flags & BP_CPU) {
> @@ -222,14 +221,9 @@ void breakpoint_handler(CPUState *cs)
>               }
>           }
>       } else {
> -        QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
> -            if (bp->pc == env->eip) {
> -                if (bp->flags & BP_CPU) {
> -                    check_hw_breakpoints(env, true);
> -                    raise_exception(env, EXCP01_DB);
> -                }
> -                break;
> -            }
> +        if (cpu_breakpoint_test(cs, env->eip, BP_CPU)) {
> +            check_hw_breakpoints(env, true);
> +            raise_exception(env, EXCP01_DB);
>           }
>       }
>   }
> 


