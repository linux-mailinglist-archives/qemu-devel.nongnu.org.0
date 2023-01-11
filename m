Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B833F6667E6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:38:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlaB-0007Qz-C0; Wed, 11 Jan 2023 19:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFla9-0007Qc-Do
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:37 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFla6-0001eo-UO
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:37 -0500
Received: by mail-pj1-x1032.google.com with SMTP id dw9so16108865pjb.5
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TNQtHvMSsejDZaPUrngXx83katArGsfuLizvDXxXQT0=;
 b=pLccPlyByPy8H+VHSNaCM/sdWTL7d7p+m1RzVvarArE2O/zCrr7SxI/DfHtmIvwsES
 2su0yLyA9ec+dvFRLQje9DQi3yjnmsIVjufYqLUzjSmq9jryc2+j4P3hC8NgvZGlqbny
 SXu7FWx7GT5FeYT5SY0W414+0dsCPcdXC5bYKNeYAuxBffMWM9OjRviQlCSe+lfdKgbf
 cvv38BpnHLPRSTSztKZew6fC8XY5dvCVhTdZOQ8QqtnpQe0FRulcxZrpUNLU3JV5X0an
 w2leXMWB2tieZWQ97wHtwHeiQLphiexaFY3ytZktpJs0dQ1t0ccezP+DszAHqi7oujnM
 VZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TNQtHvMSsejDZaPUrngXx83katArGsfuLizvDXxXQT0=;
 b=FZl9l93HpoMYbZlDSY7WUWxMEax8DSDI7opCtnWGQnkJVf9v/dgevDjJZhF/yXsGBM
 vWlAvbBXVLq7XADz+48Hbju6llAFl4nLnedkN5fmcvIM3i4IHWMpYk2PV8lQJ8kb5tbG
 NEZtPUZzNnUiOIUjfT4RL7FcfxJ7/j/aTsXdN/EilkMvSkycpD9B53wUd6ZE2Z7zEMfZ
 cIUGuGY0s7N4z77186Qu9kUGrKIRlPhU2LdKZ4kZ/inxSlPJlWBS2rR7+Jc0oSLy2FJN
 zIMTUDoibsPq2emAue1plY3F7KoVdfxROgG8go12JoDmCCU0xkqljfQA1oM5GjChKjzJ
 W8UA==
X-Gm-Message-State: AFqh2ko9tGNPdMsMjtnABlTN9FwZ2IB9O1PgjR5ZGWkM3hEXGHTOXAvW
 2EX5CvYCr1mLzsOf6cvumXjICg==
X-Google-Smtp-Source: AMrXdXs+Q9vaemjfS8yx1Zuwsy3PORV8/muXAXEFiCnLdAy5CZRfWCBRJQyOfN4wS+Ul0vSL28hx3Q==
X-Received: by 2002:a17:90a:fb46:b0:228:f6cc:dc4f with SMTP id
 iq6-20020a17090afb4600b00228f6ccdc4fmr1455147pjb.10.1673483793392; 
 Wed, 11 Jan 2023 16:36:33 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 u3-20020a17090a890300b00218cd71781csm9529238pjn.51.2023.01.11.16.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:36:32 -0800 (PST)
Message-ID: <52ebe6d2-3c63-6cb4-5ae2-99168d6a922f@linaro.org>
Date: Wed, 11 Jan 2023 09:08:59 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 18/26] cpu: free cpu->tb_jmp_cache with RCU
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-19-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110173922.265055-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/10/23 09:39, Alex Bennée wrote:
> From: Emilio Cota<cota@braap.org>
> 
> Fixes the appended use-after-free. The root cause is that
> during tb invalidation we use CPU_FOREACH, and therefore
> to safely free a vCPU we must wait for an RCU grace period
> to elapse.
> 
> $ x86_64-linux-user/qemu-x86_64 tests/tcg/x86_64-linux-user/munmap-pthread
> =================================================================
> ==1800604==ERROR: AddressSanitizer: heap-use-after-free on address 0x62d0005f7418 at pc 0x5593da6704eb bp 0x7f4961a7ac70 sp 0x7f4961a7ac60
> READ of size 8 at 0x62d0005f7418 thread T2
>      #0 0x5593da6704ea in tb_jmp_cache_inval_tb ../accel/tcg/tb-maint.c:244
>      #1 0x5593da6704ea in do_tb_phys_invalidate ../accel/tcg/tb-maint.c:290
>      #2 0x5593da670631 in tb_phys_invalidate__locked ../accel/tcg/tb-maint.c:306
>      #3 0x5593da670631 in tb_invalidate_phys_page_range__locked ../accel/tcg/tb-maint.c:542
>      #4 0x5593da67106d in tb_invalidate_phys_range ../accel/tcg/tb-maint.c:614
>      #5 0x5593da6a64d4 in target_munmap ../linux-user/mmap.c:766
>      #6 0x5593da6dba05 in do_syscall1 ../linux-user/syscall.c:10105
>      #7 0x5593da6f564c in do_syscall ../linux-user/syscall.c:13329
>      #8 0x5593da49e80c in cpu_loop ../linux-user/x86_64/../i386/cpu_loop.c:233
>      #9 0x5593da6be28c in clone_func ../linux-user/syscall.c:6633
>      #10 0x7f496231cb42 in start_thread nptl/pthread_create.c:442
>      #11 0x7f49623ae9ff  (/lib/x86_64-linux-gnu/libc.so.6+0x1269ff)
> 
> 0x62d0005f7418 is located 28696 bytes inside of 32768-byte region [0x62d0005f0400,0x62d0005f8400)
> freed by thread T148 here:
>      #0 0x7f49627b6460 in __interceptor_free ../../../../src/libsanitizer/asan/asan_malloc_linux.cpp:52
>      #1 0x5593da5ac057 in cpu_exec_unrealizefn ../cpu.c:180
>      #2 0x5593da81f851  (/home/cota/src/qemu/build/qemu-x86_64+0x484851)
> 
> Signed-off-by: Emilio Cota<cota@braap.org>
> Message-Id:<20230109224954.161672-2-cota@braap.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   accel/tcg/tb-jmp-cache.h |  1 +
>   accel/tcg/cpu-exec.c     |  3 +--
>   cpu.c                    | 11 ++++++++++-
>   3 files changed, 12 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

