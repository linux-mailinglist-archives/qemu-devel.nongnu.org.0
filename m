Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C807266187D
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 20:21:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEbD9-0001zg-Tq; Sun, 08 Jan 2023 14:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEbD5-0001yt-Ns
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 14:19:59 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEbD3-0002Vy-RQ
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 14:19:59 -0500
Received: by mail-pj1-x102c.google.com with SMTP id v23so6616233pju.3
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 11:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q0pNpl9+F7PJ3+AeyARJ2epfawFccenDDZZiv9avbmk=;
 b=yn0TI9TilbL/XkTPdhM5hr4W5ONkuTUSVfFP3JjwdOw3a9QWSjVagaP8WeqDTdOeCz
 zieA4H1F9cmrseQwsBiGnJ6Y6nCB4AZpQfneRlu5VMfe9nxeIH4mNxopeIhdUp4EvofB
 AWd9WAa/+miv0pN0EB/9CjjxKjbsNGfoq3av97Lp3gqr3fVr2KYE8dBx9CYB7X0EIxEg
 jxrjHKt4tYqWkEAnnALF7hlDP/H3yXe9mnrg8IRBSguf1mRBduxQ7SAxqRgviJKwaY52
 PgxpViINETSeBESHdUITcsnbG7uslQKNzpxP7SVBfTLELvmzwRgj++FZucFwhbTJ5mXb
 sMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q0pNpl9+F7PJ3+AeyARJ2epfawFccenDDZZiv9avbmk=;
 b=S6s5FNd7V6FaVyZJ4wiko8GS6VvG+4nLNVUgRT/rMqwo1xpE+T3sd1DpQ+28Om3YQi
 O+eyEp7WuNoA9DaIu8v04DtQ39XIqci6dbGR+PiLw9Xbw8pCLbedAN6Yh4bpkeZMReNt
 Bq4gSbEht8YY7pLKIAsEG4xtM4uNRWmouwqPZ7eGoXLEWvDddzi+C8K9s1DYZMWc9u1d
 d7q0a8F6sADIvJFDiMNR7g0vrRin9G3HB0z+J5fk8gpl6gcYZLshPp6oRFBVEXZubsim
 EZpQ12ONQavPK0RH425M6mm8zTZkpm5lpsBVPreKWddUdNm0Vc7q1hl7/+jJ7qY3p/tw
 Gdxg==
X-Gm-Message-State: AFqh2kqQem6Bg+Tab0wFgyrpQKmkNJQ+rOKA2GIJdE3yPbi/xM3+bF5R
 WEsPkFtiPCeWUxyfeUKfX0pikQ==
X-Google-Smtp-Source: AMrXdXueaUdcqT6TkoDzad54REmpRnPJFSPfpwa7p/fjnQz3EizTUkzyJAe+UALv2dTfvmxbButT+Q==
X-Received: by 2002:a17:90b:1bc7:b0:226:f951:1068 with SMTP id
 oa7-20020a17090b1bc700b00226f9511068mr4496988pjb.44.1673205596051; 
 Sun, 08 Jan 2023 11:19:56 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a17090a318e00b00226d0165d97sm5582224pjb.22.2023.01.08.11.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 11:19:55 -0800 (PST)
Message-ID: <676d74ed-cce8-8b0e-69c7-44ec25a68a4b@linaro.org>
Date: Sun, 8 Jan 2023 11:19:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] cpu: free cpu->tb_jmp_cache with RCU
To: Emilio Cota <cota@braap.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230108163905.59601-1-cota@braap.org>
 <20230108163905.59601-2-cota@braap.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230108163905.59601-2-cota@braap.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/8/23 08:39, Emilio Cota wrote:
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
> Signed-off-by: Emilio Cota <cota@braap.org>
> ---
>   accel/tcg/cpu-exec.c  | 1 -
>   cpu.c                 | 7 +++++++
>   include/hw/core/cpu.h | 3 +++
>   3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 356fe348de..ca95d21528 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -1070,7 +1070,6 @@ void tcg_exec_unrealizefn(CPUState *cpu)
>   #endif /* !CONFIG_USER_ONLY */
>   
>       tlb_destroy(cpu);
> -    g_free(cpu->tb_jmp_cache);

Can you simply use g_free_rcu here?

>   }
>   
>   #ifndef CONFIG_USER_ONLY
> diff --git a/cpu.c b/cpu.c
> index 4a7d865427..564200559f 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -164,6 +164,12 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>   #endif /* CONFIG_USER_ONLY */
>   }
>   
> +static void cpu_free_rcu(CPUState *cpu)
> +{
> +    /* .tb_jmp_cache is NULL except under TCG */
> +    g_free(cpu->tb_jmp_cache);
> +}
> +
>   void cpu_exec_unrealizefn(CPUState *cpu)
>   {
>   #ifndef CONFIG_USER_ONLY
> @@ -181,6 +187,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
>       }
>   
>       cpu_list_remove(cpu);
> +    call_rcu(cpu, cpu_free_rcu, rcu);

Certainly this seems wrong, exposing tb_jmp_cache beyond tcg.


r~

