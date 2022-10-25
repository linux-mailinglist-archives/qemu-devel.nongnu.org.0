Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7785560C7F4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:24:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onGAP-0000bE-7n; Tue, 25 Oct 2022 05:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1onGAD-0007lM-KC
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:24:02 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1onGAB-0005Sm-Cp
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:24:01 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 858942208B;
 Tue, 25 Oct 2022 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666689837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqjkBch1D0d5xr1g5AGvTIxqPF4SqdsZW/kJpSXE39k=;
 b=0ujo1I+MSQh/GMEG8+nR9FuJfCoYub9Djmy6oMvFMP3aU4dkC0JK6qbH1WPja2SXaub5nT
 VsyCOoC3mBnT4RWduF21tcN0HkT/bHyVUoi6mpU3dWq1KsfVcSWtnw/3FgtsUVXaL1ikjG
 uw3ze05WkIB+lMiIbDHsoB3TiNyznVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666689837;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqjkBch1D0d5xr1g5AGvTIxqPF4SqdsZW/kJpSXE39k=;
 b=vxodKSqyGbf5iJSCeR80Vs9inqL0fVotx9fo00B/uZ1aFKOdUD4uJNk6xhFZFWeFF39zld
 16HEUrInXz9l4aAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6A25F134CA;
 Tue, 25 Oct 2022 09:23:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P08eGC2rV2OaPgAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 25 Oct 2022 09:23:57 +0000
Message-ID: <b8e90076-2f42-0eb9-60df-4e9df4e9e5b5@suse.de>
Date: Tue, 25 Oct 2022 11:23:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 24/29] accel/tcg: Introduce cpu_unwind_state_data
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-26-richard.henderson@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221024132459.3229709-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 10/24/22 15:24, Richard Henderson wrote:
> Add a way to examine the unwind data without actually
> restoring the data back into env.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h   | 13 ++++++++
>  accel/tcg/translate-all.c | 68 ++++++++++++++++++++++++++-------------
>  2 files changed, 58 insertions(+), 23 deletions(-)
> 
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 300832bd0b..d49cf113dd 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -39,6 +39,19 @@ typedef ram_addr_t tb_page_addr_t;
>  #define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
>  #endif
>  
> +/**
> + * cpu_unwind_state_data:
> + * @cpu: the vCPU state is to be restore to
> + * @host_pc: the host PC the fault occurred at
> + * @data: output data
> + *
> + * Attempt to load the the unwind state for a host pc occurring in
> + * translated code.  If the searched_pc is not in translated code,
> + * the function returns false; otherwise @data is loaded.
> + * This is the same unwind info as given to restore_state_to_opc.
> + */
> +bool cpu_unwind_state_data(CPUState *cpu, uintptr_t host_pc, uint64_t *data);
> +
>  /**
>   * cpu_restore_state:
>   * @cpu: the vCPU state is to be restore to
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index e4386b3198..c772e3769c 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -320,29 +320,20 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
>      return p - block;
>  }
>  
> -/* The cpu state corresponding to 'searched_pc' is restored.
> - * When reset_icount is true, current TB will be interrupted and
> - * icount should be recalculated.
> - */
> -static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
> -                                     uintptr_t searched_pc, bool reset_icount)
> +static int cpu_unwind_data_from_tb(TranslationBlock *tb, uintptr_t host_pc,
> +                                   uint64_t *data)
>  {
> -    uint64_t data[TARGET_INSN_START_WORDS];
> -    uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
> +    uintptr_t iter_pc = (uintptr_t)tb->tc.ptr;
>      const uint8_t *p = tb->tc.ptr + tb->tc.size;
>      int i, j, num_insns = tb->icount;
> -#ifdef CONFIG_PROFILER
> -    TCGProfile *prof = &tcg_ctx->prof;
> -    int64_t ti = profile_getclock();
> -#endif
>  
> -    searched_pc -= GETPC_ADJ;
> +    host_pc -= GETPC_ADJ;
>  
> -    if (searched_pc < host_pc) {
> +    if (host_pc < iter_pc) {
>          return -1;
>      }
>  
> -    memset(data, 0, sizeof(data));
> +    memset(data, 0, sizeof(uint64_t) * TARGET_INSN_START_WORDS);
>      if (!TARGET_TB_PCREL) {
>          data[0] = tb_pc(tb);
>      }

It's not visible in this hunk, but what follows is:

    /* Reconstruct the stored insn data while looking for the point at                                                                      
       which the end of the insn exceeds the searched_pc.  */

Should this comment be adapted, minimally with s,searched_pc,host_pc, ?


> @@ -353,19 +344,40 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>          for (j = 0; j < TARGET_INSN_START_WORDS; ++j) {
>              data[j] += decode_sleb128(&p);
>          }
> -        host_pc += decode_sleb128(&p);
> -        if (host_pc > searched_pc) {
> -            goto found;
> +        iter_pc += decode_sleb128(&p);
> +        if (iter_pc > host_pc) {
> +            return num_insns - i;
>          }
>      }
>      return -1;
> +}
> +
> +/*
> + * The cpu state corresponding to 'host_pc' is restored.
> + * When reset_icount is true, current TB will be interrupted and
> + * icount should be recalculated.
> + */
> +static void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
> +                                      uintptr_t host_pc, bool reset_icount)
> +{
> +    uint64_t data[TARGET_INSN_START_WORDS];
> +#ifdef CONFIG_PROFILER
> +    TCGProfile *prof = &tcg_ctx->prof;
> +    int64_t ti = profile_getclock();
> +#endif
> +    int insns_left = cpu_unwind_data_from_tb(tb, host_pc, data);
> +
> +    if (insns_left < 0) {
> +        return;
> +    }

Is the -1 return value some error condition to do anything about, log, tcg assert, or ...,
under some DEBUG_* condition, or ignored as done here?

Thanks,

Claudio

>  
> - found:
>      if (reset_icount && (tb_cflags(tb) & CF_USE_ICOUNT)) {
>          assert(icount_enabled());
> -        /* Reset the cycle counter to the start of the block
> -           and shift if to the number of actually executed instructions */
> -        cpu_neg(cpu)->icount_decr.u16.low += num_insns - i;
> +        /*
> +         * Reset the cycle counter to the start of the block and
> +         * shift if to the number of actually executed instructions.
> +         */
> +        cpu_neg(cpu)->icount_decr.u16.low += insns_left;
>      }
>  
>      cpu->cc->tcg_ops->restore_state_to_opc(cpu, tb, data);
> @@ -375,7 +387,6 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>                  prof->restore_time + profile_getclock() - ti);
>      qatomic_set(&prof->restore_count, prof->restore_count + 1);
>  #endif
> -    return 0;
>  }
>  
>  bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
> @@ -408,6 +419,17 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
>      return false;
>  }
>  
> +bool cpu_unwind_state_data(CPUState *cpu, uintptr_t host_pc, uint64_t *data)
> +{
> +    if (in_code_gen_buffer((const void *)(host_pc - tcg_splitwx_diff))) {
> +        TranslationBlock *tb = tcg_tb_lookup(host_pc);
> +        if (tb) {
> +            return cpu_unwind_data_from_tb(tb, host_pc, data) >= 0;
> +        }
> +    }
> +    return false;
> +}
> +
>  void page_init(void)
>  {
>      page_size_init();


