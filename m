Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCA26E4260
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 10:18:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poK2Q-0004lJ-7E; Mon, 17 Apr 2023 04:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1poK2J-0004l2-Qx
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 04:16:32 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1poK2H-00089k-SP
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 04:16:31 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2f62b1385e3so756899f8f.2
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 01:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681719386; x=1684311386;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ToZCG4TNNrZUJ6c9MT/jIJm2rWpywDIrnmINcq+yCvo=;
 b=HsVx0Q3fG9bJE0/sTlFALIhuPaxp72zvGzrKNy9HN5D3EuNZHYS0nHrDzAVdBo4mP9
 XvPKIXL8Y3+rkq3OdNzDpdMa0XNXBBTsdxXWw/Zx7rK/PYS61ei7LbLmWx252jSDrZw5
 2ywMy2i3TeuMp4YEyu3fwB8Rh6rH4QItHsvL1o0OnIl4BFg/Akfhx2w0cT/W5DCZ6rDA
 efrwApsBWWP03I0p619nHthLJLQjbW9hETlpJb2VD6yHVvrXQujoBd6oQqUo5+D8tDpA
 tw/S4zElzzQtW6Xxubk6eDUDmEES2l0kPgQ1NgWX4Drs99XEWUG6ywrQQ6sXscw/lsnP
 H9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681719386; x=1684311386;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ToZCG4TNNrZUJ6c9MT/jIJm2rWpywDIrnmINcq+yCvo=;
 b=jr26S1diCM8tfJ1EuY7XcCuQ4PdMTfo5HjKvx94PaRsg+c2v5np4jbgQ4+BP9HsYH0
 +PEvg6sS0NOHTQ/8FLD8XJ63npVmXVGNNK6nn6YADGk8LnFcMpEapKQAs4epnrcG52a0
 VTFZ5Mdcp532zcaJ9UkUrLTvF6Fv9d2evFHr6vCLBMZsgJt7uXODatIPh+PUJttFVhUP
 vQIj0xOT3r9zyyYD0PqTtJBw01a61kUNDMIMe4lwaSCKs6vt2s36H/PCe5bAnKUzVpBT
 iGIp6AmFYoD1uO1wZ87aIoJnHTLaadB6+nnAqtKvGhg7PSX9B7FMz31n7dPBL6DKTfRG
 EcwA==
X-Gm-Message-State: AAQBX9c4+CKkj16A34cNXvskvs45wlQ7etZdUik+f0+JxfeVU2sb33Kb
 uhMS/R5w0qniEWlvw2g5Mkbn0Q==
X-Google-Smtp-Source: AKy350Z6spo/vTHkzrMF2KJql87K6JP4Dgs3mpM7+FtBmEc9DDxyGN3uDHIc3Pyr+5CcEbRP/2fEEw==
X-Received: by 2002:a5d:65c7:0:b0:2f4:e0e5:aaf8 with SMTP id
 e7-20020a5d65c7000000b002f4e0e5aaf8mr4636732wrw.68.1681719386348; 
 Mon, 17 Apr 2023 01:16:26 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s15-20020adfeb0f000000b002c55306f6edsm9910249wrn.54.2023.04.17.01.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 01:16:25 -0700 (PDT)
Message-ID: <dd8160f5-5802-8503-2162-69dfe718b7b7@linaro.org>
Date: Mon, 17 Apr 2023 10:16:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] accel/tcg/tcg-accel-ops-rr: ensure fairness with icount
Content-Language: en-US
To: Jamie Iles <quic_jiles@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230414105111.30708-1-quic_jiles@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230414105111.30708-1-quic_jiles@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.976,
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

Hi Jamie,

On 14/4/23 12:51, Jamie Iles wrote:
> The round-robin scheduler will iterate over the CPU list with an
> assigned budget until the next timer expiry and may exit early because
> of a TB exit.  This is fine under normal operation but with icount
> enabled and SMP it is possible for a CPU to be starved of run time and
> the system live-locks.
> 
> For example, booting a riscv64 platform with '-icount
> shift=0,align=off,sleep=on -smp 2' we observe a livelock once the kernel
> has timers enabled and starts performing TLB shootdowns.  In this case
> we have CPU 0 in M-mode with interrupts disabled sending an IPI to CPU
> 1.  As we enter the TCG loop, we assign the icount budget to next timer
> interrupt to CPU 0 and begin executing where the guest is sat in a busy
> loop exhausting all of the budget before we try to execute CPU 1 which
> is the target of the IPI but CPU 1 is left with no budget with which to
> execute and the process repeats.
> 
> We try here to add some fairness by splitting the budget across all of
> the CPUs on the thread fairly before entering each one.  The CPU count
> is cached on CPU list generation ID to avoid iterating the list on each
> loop iteration.  With this change it is possible to boot an SMP rv64
> guest with icount enabled and no hangs.
> 
> Signed-off-by: Jamie Iles <quic_jiles@quicinc.com>
> ---
>   accel/tcg/tcg-accel-ops-icount.c | 16 ++++++++++++++--
>   accel/tcg/tcg-accel-ops-icount.h |  3 ++-
>   accel/tcg/tcg-accel-ops-rr.c     | 26 +++++++++++++++++++++++++-
>   3 files changed, 41 insertions(+), 4 deletions(-)
> 
> diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
> index 84cc7421be88..a7ffc8a68bad 100644
> --- a/accel/tcg/tcg-accel-ops-icount.c
> +++ b/accel/tcg/tcg-accel-ops-icount.c
> @@ -89,7 +89,19 @@ void icount_handle_deadline(void)
>       }
>   }
>   
> -void icount_prepare_for_run(CPUState *cpu)

    /* Return icount budget shared fairly across all CPUs */

Or rename to something more explicit such
icount_fair_shared_budget_per_cpu()?

> +int64_t icount_cpu_timeslice(int cpu_count)
> +{
> +    int64_t limit = icount_get_limit();
> +    int64_t timeslice = limit / cpu_count;
> +
> +    if (timeslice == 0) {
> +        timeslice = limit;
> +    }
> +
> +    return timeslice;
> +}
> +
> +void icount_prepare_for_run(CPUState *cpu, int64_t timeslice)

Maybe s/timeslice/per_cpu_icount_budget_max/, max_icount_budget_per_cpu
or a more descriptive variable name? Otherwise OK.

>   {
>       int insns_left;
>   
> @@ -101,7 +113,7 @@ void icount_prepare_for_run(CPUState *cpu)
>       g_assert(cpu_neg(cpu)->icount_decr.u16.low == 0);
>       g_assert(cpu->icount_extra == 0);
>   
> -    cpu->icount_budget = icount_get_limit();
> +    cpu->icount_budget = MIN(icount_get_limit(), timeslice);

Alternatively we could pass timeslice as argument to icount_get_limit().

>       insns_left = MIN(0xffff, cpu->icount_budget);
>       cpu_neg(cpu)->icount_decr.u16.low = insns_left;
>       cpu->icount_extra = cpu->icount_budget - insns_left;
> diff --git a/accel/tcg/tcg-accel-ops-icount.h b/accel/tcg/tcg-accel-ops-icount.h
> index 1b6fd9c60751..e8785a0e196d 100644
> --- a/accel/tcg/tcg-accel-ops-icount.h
> +++ b/accel/tcg/tcg-accel-ops-icount.h
> @@ -11,7 +11,8 @@
>   #define TCG_ACCEL_OPS_ICOUNT_H
>   
>   void icount_handle_deadline(void);
> -void icount_prepare_for_run(CPUState *cpu);
> +void icount_prepare_for_run(CPUState *cpu, int64_t timeslice);
> +int64_t icount_cpu_timeslice(int cpu_count);
>   void icount_process_data(CPUState *cpu);
>   
>   void icount_handle_interrupt(CPUState *cpu, int mask);
> diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
> index 290833a37fb2..bccb3670a656 100644
> --- a/accel/tcg/tcg-accel-ops-rr.c
> +++ b/accel/tcg/tcg-accel-ops-rr.c
> @@ -139,6 +139,25 @@ static void rr_force_rcu(Notifier *notify, void *data)
>       rr_kick_next_cpu();
>   }
>   

Maybe worth adding a comment to remember "The CPU count is cached on CPU
list generation ID to avoid iterating the list on each loop iteration."

> +static int rr_cpu_count(void)
> +{
> +    static unsigned int last_gen_id = ~0;
> +    static int cpu_count;
> +    CPUState *cpu;
> +
> +    cpu_list_lock();
> +    if (cpu_list_generation_id_get() != last_gen_id) {
> +        cpu_count = 0;
> +        CPU_FOREACH(cpu) {
> +            ++cpu_count;
> +        }
> +        last_gen_id = cpu_list_generation_id_get();
> +    }
> +    cpu_list_unlock();
> +
> +    return cpu_count;
> +}
> +
>   /*
>    * In the single-threaded case each vCPU is simulated in turn. If
>    * there is more than a single vCPU we create a simple timer to kick
> @@ -185,6 +204,9 @@ static void *rr_cpu_thread_fn(void *arg)
>       cpu->exit_request = 1;
>   
>       while (1) {
> +        int cpu_count = rr_cpu_count();
> +        int64_t icount_timeslice = INT64_MAX;

s/icount_timeslice/icount_budget/?


Modulo the nitpicking comments on "timeslice" naming which I'm not
familiar with, and documenting a bit the code, LGTM.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


