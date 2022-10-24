Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1183760B385
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 19:08:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omz23-0003sH-IE; Mon, 24 Oct 2022 11:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1omz1c-0003pu-Pc
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:06:02 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1omz1Z-0004pE-NG
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:06:00 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AD58B1FD8F;
 Mon, 24 Oct 2022 15:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666623954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qHmixmHnkZta/6y8LLc5y0H62gVo4AYGmVY0gwSVPdY=;
 b=2VkNMHckHFFSYhpX1eHdY23/UHkbQzjhxBgKXSt75w7k50Rb1yRfuZWSE/DjVzMZBZiktI
 lr0bTdAeXRQ9H5zlhZR4ICCYXkIb9ydcJCOIarIAksTrx7qFeco+yFiujG3WMQO9njb6US
 4m3BzohpUsAmsurClgc2XoNMzSYw6Ko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666623954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qHmixmHnkZta/6y8LLc5y0H62gVo4AYGmVY0gwSVPdY=;
 b=RI7VFS/vXNTOqacU+KUpbuSU12ZIJdw51VzTfi74moJT8SNhc7aRcTnci5p9TekPAQhNCJ
 /zyKOmwFQQUHFDCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8E82113A79;
 Mon, 24 Oct 2022 15:05:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SpzvINKpVmNeOAAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 24 Oct 2022 15:05:54 +0000
Message-ID: <e1eb87ed-c43c-6dae-4beb-9d0a9907bce9@suse.de>
Date: Mon, 24 Oct 2022 17:05:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 01/29] accel/tcg: Add restore_state_to_opc to TCGCPUOps
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-2-richard.henderson@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221024132459.3229709-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
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
> Add a tcg_ops hook to replace the restore_state_to_opc
> function call.  Because these generic hooks cannot depend
> on target-specific types, temporarily, copy the current
> target_ulong data[] into uint64_t d64[].
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h       |  2 +-
>  include/hw/core/tcg-cpu-ops.h | 11 +++++++++++
>  accel/tcg/translate-all.c     | 24 ++++++++++++++++++++++--
>  3 files changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index e5f8b224a5..a772e8cbdc 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -40,7 +40,7 @@ typedef ram_addr_t tb_page_addr_t;
>  #endif
>  
>  void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
> -                          target_ulong *data);
> +                          target_ulong *data) __attribute__((weak));

Hi Richard, doesn't matter much since this is removed later on, but I wonder why the need for attribute weak here?
I don't see you overloading this function in later patches..

Thanks,

Claudio
>  
>  /**
>   * cpu_restore_state:
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index 78c6c6635d..20e3c0ffbb 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -31,6 +31,17 @@ struct TCGCPUOps {
>       * function to restore all the state, and register it here.
>       */
>      void (*synchronize_from_tb)(CPUState *cpu, const TranslationBlock *tb);
> +    /**
> +     * @restore_state_to_opc: Synchronize state from INDEX_op_start_insn
> +     *
> +     * This is called when we unwind state in the middle of a TB,
> +     * usually before raising an exception.  Set all part of the CPU
> +     * state which are tracked insn-by-insn in the target-specific
> +     * arguments to start_insn, passed as @data.
> +     */
> +    void (*restore_state_to_opc)(CPUState *cpu, const TranslationBlock *tb,
> +                                 const uint64_t *data);
> +
>      /** @cpu_exec_enter: Callback for cpu_exec preparation */
>      void (*cpu_exec_enter)(CPUState *cpu);
>      /** @cpu_exec_exit: Callback for cpu_exec cleanup */
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 4ed75a13e1..19cd23e9a0 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -329,7 +329,6 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>  {
>      target_ulong data[TARGET_INSN_START_WORDS];
>      uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
> -    CPUArchState *env = cpu->env_ptr;
>      const uint8_t *p = tb->tc.ptr + tb->tc.size;
>      int i, j, num_insns = tb->icount;
>  #ifdef CONFIG_PROFILER
> @@ -368,7 +367,20 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>             and shift if to the number of actually executed instructions */
>          cpu_neg(cpu)->icount_decr.u16.low += num_insns - i;
>      }
> -    restore_state_to_opc(env, tb, data);
> +
> +    {
> +        const struct TCGCPUOps *ops = cpu->cc->tcg_ops;
> +        __typeof(ops->restore_state_to_opc) restore = ops->restore_state_to_opc;
> +        if (restore) {
> +            uint64_t d64[TARGET_INSN_START_WORDS];
> +            for (i = 0; i < TARGET_INSN_START_WORDS; ++i) {
> +                d64[i] = data[i];
> +            }
> +            restore(cpu, tb, d64);
> +        } else {
> +            restore_state_to_opc(cpu->env_ptr, tb, data);
> +        }
> +    }
>  
>  #ifdef CONFIG_PROFILER
>      qatomic_set(&prof->restore_time,
> @@ -380,6 +392,14 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>  
>  bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
>  {
> +    /*
> +     * The pc update associated with restore without exit will
> +     * break the relative pc adjustments performed by TARGET_TB_PCREL.
> +     */
> +    if (TARGET_TB_PCREL) {
> +        assert(will_exit);
> +    }
> +
>      /*
>       * The host_pc has to be in the rx region of the code buffer.
>       * If it is not we will not be able to resolve it here.


