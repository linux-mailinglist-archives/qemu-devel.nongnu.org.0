Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC817702C39
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:04:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyWvF-0004rt-7M; Mon, 15 May 2023 08:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyWvC-0004qg-7W; Mon, 15 May 2023 08:03:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyWv8-0003xu-RG; Mon, 15 May 2023 08:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nkzi/vOkO3wF0WtbgwwUuWyfwNrTeVYYpQ++aLSZaWM=; b=y4RXmUCwn6MCJQFkVaohWl+jg8
 holHJEePBQSqGTRSZX2ebcPwEIHOQhEaBa5GPzN3CGmRPO1ASwqrl3st3gHp6zvKyOus1hX8ufnyg
 YxkP4aWhMZMFUSrZoi1QBa4R14udrqYnYiFkJ8EoRQqoBa5Izn4exadHmI/4LjSFkfyreLVGwSeRb
 vrg0BbydQtWDkAPMKgSskvA/NSZ5ZK70KmB5lPtFbLQkPK0rzrJ4eEmHB+9V3w2/TFv83KPF5m73r
 67GK30COozRXs8X4U6wh0mBcPYFyxJaMj60jicDzVYmNB2kFJFD/bplvmqOWC7soDRpgi4PBB7sXr
 sXyBJCLcwansse3MNtRmQf5W0y6LTf8jFKy69kuH7YSh42N9A04lKyEub7Pt9QfFBlFdsd+zcXMuq
 /6bWPpQTre6rlIlCKnOQa6/CI30Uw7j9pXWnRpeoUAX6E616kWVu1yQIxHyEWmZtoqh4TeY7DBWwi
 d3NAICWYx2j6i7HshZy6uCdHSCKxGHp4ELdYce6e9wnaYHQDR1sD75ci/JVgzsrYNI72FKQmUf4+r
 qdaQqPvcRYIRprNvZfbMuxc3R3UlvHp9+fA1NrGKhkncG29ZDol9Cho80l96Jy6s4VAQECqbo2cD8
 TXo+DE49ThCnI+UnHhSNeqNphtNOEvjT7VeTdPHYs=;
Received: from host86-130-37-216.range86-130.btcentralplus.com
 ([86.130.37.216] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyWu4-000CGT-9y; Mon, 15 May 2023 13:02:16 +0100
Message-ID: <4cefbbd6-6ab2-cd55-4468-4066b464c99c@ilande.co.uk>
Date: Mon, 15 May 2023 13:03:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20230515092655.171206-1-npiggin@gmail.com>
 <20230515092655.171206-2-npiggin@gmail.com>
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230515092655.171206-2-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.130.37.216
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 1/9] target/ppc: Fix width of some 32-bit SPRs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.811,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 15/05/2023 10:26, Nicholas Piggin wrote:

> Some 32-bit SPRs are incorrectly implemented as 64-bits on 64-bit
> targets.
> 
> This changes VRSAVE, DSISR, HDSISR, DAWRX0, PIDR, LPIDR, DEXCR,
> HDEXCR, CTRL, TSCR, MMCRH, and PMC[1-6] from to be 32-bit registers.
> 
> This only goes by the 32/64 classification in the architecture, it
> does not try to implement finer details of SPR implementation (e.g.,
> not all bits implemented as simple read/write storage).
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Since v2: no change.
> 
>   target/ppc/cpu_init.c    | 18 +++++++++---------
>   target/ppc/helper_regs.c |  2 +-
>   target/ppc/misc_helper.c |  4 ++--
>   target/ppc/power8-pmu.c  |  2 +-
>   target/ppc/translate.c   |  2 +-
>   5 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 0ce2e3c91d..5aa0b3f0f1 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -5085,8 +5085,8 @@ static void register_book3s_altivec_sprs(CPUPPCState *env)
>       }
>   
>       spr_register_kvm(env, SPR_VRSAVE, "VRSAVE",
> -                     &spr_read_generic, &spr_write_generic,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_generic, &spr_write_generic32,
> +                     &spr_read_generic, &spr_write_generic32,
>                        KVM_REG_PPC_VRSAVE, 0x00000000);
>   
>   }
> @@ -5120,7 +5120,7 @@ static void register_book3s_207_dbg_sprs(CPUPPCState *env)
>       spr_register_kvm_hv(env, SPR_DAWRX0, "DAWRX0",
>                           SPR_NOACCESS, SPR_NOACCESS,
>                           SPR_NOACCESS, SPR_NOACCESS,
> -                        &spr_read_generic, &spr_write_generic,
> +                        &spr_read_generic, &spr_write_generic32,
>                           KVM_REG_PPC_DAWRX, 0x00000000);
>       spr_register_kvm_hv(env, SPR_CIABR, "CIABR",
>                           SPR_NOACCESS, SPR_NOACCESS,
> @@ -5376,7 +5376,7 @@ static void register_book3s_ids_sprs(CPUPPCState *env)
>       spr_register_hv(env, SPR_TSCR, "TSCR",
>                    SPR_NOACCESS, SPR_NOACCESS,
>                    SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> +                 &spr_read_generic, &spr_write_generic32,
>                    0x00000000);
>       spr_register_hv(env, SPR_HMER, "HMER",
>                    SPR_NOACCESS, SPR_NOACCESS,
> @@ -5406,7 +5406,7 @@ static void register_book3s_ids_sprs(CPUPPCState *env)
>       spr_register_hv(env, SPR_MMCRC, "MMCRC",
>                    SPR_NOACCESS, SPR_NOACCESS,
>                    SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> +                 &spr_read_generic, &spr_write_generic32,
>                    0x00000000);
>       spr_register_hv(env, SPR_MMCRH, "MMCRH",
>                    SPR_NOACCESS, SPR_NOACCESS,
> @@ -5441,7 +5441,7 @@ static void register_book3s_ids_sprs(CPUPPCState *env)
>       spr_register_hv(env, SPR_HDSISR, "HDSISR",
>                    SPR_NOACCESS, SPR_NOACCESS,
>                    SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> +                 &spr_read_generic, &spr_write_generic32,
>                    0x00000000);
>       spr_register_hv(env, SPR_HRMOR, "HRMOR",
>                    SPR_NOACCESS, SPR_NOACCESS,
> @@ -5665,7 +5665,7 @@ static void register_power7_book4_sprs(CPUPPCState *env)
>                        KVM_REG_PPC_ACOP, 0);
>       spr_register_kvm(env, SPR_BOOKS_PID, "PID",
>                        SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_generic, &spr_write_generic32,
>                        KVM_REG_PPC_PID, 0);
>   #endif
>   }
> @@ -5730,7 +5730,7 @@ static void register_power10_dexcr_sprs(CPUPPCState *env)
>   {
>       spr_register(env, SPR_DEXCR, "DEXCR",
>               SPR_NOACCESS, SPR_NOACCESS,
> -            &spr_read_generic, &spr_write_generic,
> +            &spr_read_generic, &spr_write_generic32,
>               0);
>   
>       spr_register(env, SPR_UDEXCR, "DEXCR",
> @@ -5741,7 +5741,7 @@ static void register_power10_dexcr_sprs(CPUPPCState *env)
>       spr_register_hv(env, SPR_HDEXCR, "HDEXCR",
>               SPR_NOACCESS, SPR_NOACCESS,
>               SPR_NOACCESS, SPR_NOACCESS,
> -            &spr_read_generic, &spr_write_generic,
> +            &spr_read_generic, &spr_write_generic32,
>               0);
>   
>       spr_register(env, SPR_UHDEXCR, "HDEXCR",
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 779e7db513..fb351c303f 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -448,7 +448,7 @@ void register_non_embedded_sprs(CPUPPCState *env)
>       /* Exception processing */
>       spr_register_kvm(env, SPR_DSISR, "DSISR",
>                        SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_generic, &spr_write_generic32,
>                        KVM_REG_PPC_DSISR, 0x00000000);
>       spr_register_kvm(env, SPR_DAR, "DAR",
>                        SPR_NOACCESS, SPR_NOACCESS,
> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> index a9bc1522e2..40ddc5c08c 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -190,13 +190,13 @@ void helper_store_dpdes(CPUPPCState *env, target_ulong val)
>   
>   void helper_store_pidr(CPUPPCState *env, target_ulong val)
>   {
> -    env->spr[SPR_BOOKS_PID] = val;
> +    env->spr[SPR_BOOKS_PID] = (uint32_t)val;
>       tlb_flush(env_cpu(env));
>   }
>   
>   void helper_store_lpidr(CPUPPCState *env, target_ulong val)
>   {
> -    env->spr[SPR_LPIDR] = val;
> +    env->spr[SPR_LPIDR] = (uint32_t)val;
>   
>       /*
>        * We need to flush the TLB on LPID changes as we only tag HV vs
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index 1381072b9e..64a64865d7 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -272,7 +272,7 @@ void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
>   {
>       pmu_update_cycles(env);
>   
> -    env->spr[sprn] = value;
> +    env->spr[sprn] = (uint32_t)value;
>   
>       pmc_update_overflow_timer(env, sprn);
>   }
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index f603f1a939..c03a6bdc9a 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -413,7 +413,7 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
>   
>   void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn)
>   {
> -    spr_write_generic(ctx, sprn, gprn);
> +    spr_write_generic32(ctx, sprn, gprn);
>   
>       /*
>        * SPR_CTRL writes must force a new translation block,

Just out of curiosity, is this the same as the problem described at [1] for DECAR?


ATB,

Mark.

[1] https://lists.nongnu.org/archive/html/qemu-ppc/2023-03/msg00451.html


