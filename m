Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CC76EBE2F
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 11:11:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqVj4-00033W-Kv; Sun, 23 Apr 2023 05:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqViz-00033I-Fr
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:09:40 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqViw-0000Wu-D6
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:09:36 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2f8405b3dc1so1930733f8f.3
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 02:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682240972; x=1684832972;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZNM5HhuagTqwqxrT3lh4WVUrClyIRcoHbdLTPrVgEck=;
 b=jAu7FN/XEjsDDNfVxwHS3xcaNPspOTH7jvuRej+en/sLCcdIadeEXtdvC6eM35+UqA
 AIF6hREq/2IacVw7SyoO/fLJ8e0C1OmkYnN9qIz40vNI8LjA9ftepTi1YH/DFR0n57pt
 gPwNlS/FGHnd/f5DSBJUwXwnI+IEAGgQAenFiA/mintwfz6SKNIYR5WBU14LZSj4slvl
 Eceqr192iyKFZFQ4goh0RRS5IfpBpU5QFM2fOHuaY67m9822mrEoCJ6BnRPFRUaQ86rm
 FBvu3nMPvYxMStm+bKt1ansHqJcT1hjCdt0QU4NrmBt2ZIOURH/xQaGEZfmReykaK6WL
 o2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682240972; x=1684832972;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZNM5HhuagTqwqxrT3lh4WVUrClyIRcoHbdLTPrVgEck=;
 b=YI6FqMAcrLLmydU0fjOP/4oPBW1JC55CaSRK0DEtvH2VjJ58grJX0u9mTZAM57EXVt
 cS/uI1ksnUsbmwy5J4Em0KwJvI9IUYwklV4Gvkfc7W3DAQ51F8Tq1CoSrPxp0OemEjKe
 fzTMcQfCeaT9RlbDFF8EACcRE/TJCDAIjBKV5PsmMtD71UTgBuc/mjl9vsx/PdJ+woxa
 RBLeNBcL48e54S1ndnSbme2s1/IKpv0qxoid2YWo6hQi4huTbATrSs8LpOl3X1i9DmA6
 Mx3GLEU3A01NbdJOUAi83h5D04SKO3kIGXZvP2QE9Bz1z6tfFNOWYWKOPVu7x+2h045c
 kKeg==
X-Gm-Message-State: AAQBX9eYXoS7pKEf4RvhofDw6YlqUvB45MhievMcQ79dnO86zifwrSJk
 F1+eJDMJp8TDJbYLoWyeV62t0w==
X-Google-Smtp-Source: AKy350YTUkidt+gZ5ZIBMCMNfGnbjOcnpes0VFENxxu94MNAVOeEPTe4/qMIPjwL366fjY/gh1NxLA==
X-Received: by 2002:adf:e944:0:b0:2f7:c224:cd32 with SMTP id
 m4-20020adfe944000000b002f7c224cd32mr8650216wrn.10.1682240972266; 
 Sun, 23 Apr 2023 02:09:32 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 s13-20020adfeb0d000000b002fb6a79dea0sm8348606wrn.7.2023.04.23.02.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 02:09:31 -0700 (PDT)
Message-ID: <b8dd9e8a-c9c8-12a1-fcc8-026437a07fb4@linaro.org>
Date: Sun, 23 Apr 2023 10:09:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/8] accel: Replace `target_ulong` with `vaddr` in TB/TLB
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-2-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420212850.20400-2-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.047,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/20/23 22:28, Anton Johansson wrote:
> Changes pc and cs_base in TranslationBlock from target_ulong to vaddr.
> Auxilliary structs and tb_*()/tlb_*() functions that depend on this
> change are also updated to take a vaddr for guest virtual addresses.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   accel/stubs/tcg-stub.c       |   2 +-
>   accel/tcg/cpu-exec.c         |  49 +++++-----
>   accel/tcg/cputlb.c           | 179 +++++++++++++++++------------------
>   accel/tcg/internal.h         |   6 +-
>   accel/tcg/tb-hash.h          |  12 +--
>   accel/tcg/tb-jmp-cache.h     |   2 +-
>   accel/tcg/tb-maint.c         |   2 +-
>   accel/tcg/translate-all.c    |  15 +--
>   include/exec/cpu-defs.h      |   4 +-
>   include/exec/cpu_ldst.h      |   6 +-
>   include/exec/exec-all.h      |  82 ++++++++--------
>   include/qemu/plugin-memory.h |   2 +-
>   12 files changed, 181 insertions(+), 180 deletions(-)

This is too large and must be split.  In addition, there are places where you must take 
more care with the replacement.

> @@ -412,10 +412,11 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
>   {
>       CPUState *cpu = env_cpu(env);
>       TranslationBlock *tb;
> -    target_ulong cs_base, pc;
> +    vaddr cs_base = 0, pc = 0;
>       uint32_t flags, cflags;
>   
> -    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
> +    cpu_get_tb_cpu_state(env, (target_ulong *) &pc,
> +                         (target_ulong *) &cs_base, &flags);

This simply will not work on big-endian hosts.

> @@ -543,7 +544,8 @@ void cpu_exec_step_atomic(CPUState *cpu)
>           g_assert(!cpu->running);
>           cpu->running = true;
>   
> -        cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
> +        cpu_get_tb_cpu_state(env, (target_ulong *) &pc,
> +                             (target_ulong *) &cs_base, &flags);

Likewise.

> @@ -946,10 +948,11 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
>   
>           while (!cpu_handle_interrupt(cpu, &last_tb)) {
>               TranslationBlock *tb;
> -            target_ulong cs_base, pc;
> +            vaddr cs_base = 0, pc = 0;
>               uint32_t flags, cflags;
>   
> -            cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base, &flags);
> +            cpu_get_tb_cpu_state(cpu->env_ptr, (target_ulong *) &pc,
> +                                 (target_ulong *) &cs_base, &flags);

Likewise.  And one more in translate-all.c.

> @@ -560,15 +557,15 @@ static void tlb_flush_page_by_mmuidx_async_0(CPUState *cpu,
>   static void tlb_flush_page_by_mmuidx_async_1(CPUState *cpu,
>                                                run_on_cpu_data data)
>   {
> -    target_ulong addr_and_idxmap = (target_ulong) data.target_ptr;
> -    target_ulong addr = addr_and_idxmap & TARGET_PAGE_MASK;
> +    vaddr addr_and_idxmap = (vaddr) data.target_ptr;

run_on_cpu_data.target_ptr is already vaddr, no need for cast.


r~

