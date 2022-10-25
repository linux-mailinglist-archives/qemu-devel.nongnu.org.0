Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351B860CD28
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:14:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJgS-0007uj-Tp; Tue, 25 Oct 2022 09:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1onJgC-000717-Hh
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:09:21 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1onJg7-00078r-UV
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:09:14 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 64DDA1F8F2;
 Tue, 25 Oct 2022 13:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666703349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dmz/P6wTy4nhJESrJcnefP9bcdk7GkDbEO/8tQzF2Zk=;
 b=u+NDBFzGlqL3NyFJI054nl0FgWPrIzEoJHcYu9cgSqyO/Rs8WU+VQMSyekdCCJNiuHuYVD
 EFyF7RypbiDOKE7iFgyJSFgEftA8rRg8/5hBRv6DEgYNVmtRHO8lOy949X/LqFm1K1nR4q
 09Yql46vK1EFrAnj0g9GVGgaYSTXSCw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666703349;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dmz/P6wTy4nhJESrJcnefP9bcdk7GkDbEO/8tQzF2Zk=;
 b=acAjeiO2WLtHQNNrM4X1U9x4LpGGXXj7LF/Y3o0BnCWSRQrwYBOaXYM8Qr2SJWk6vjZLtw
 e9NpKB1w+WD+/oAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4EC7713A64;
 Tue, 25 Oct 2022 13:09:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NhPbEfXfV2NDMgAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 25 Oct 2022 13:09:09 +0000
Message-ID: <9f2d0b91-b704-420e-15a5-da43a19df931@suse.de>
Date: Tue, 25 Oct 2022 15:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 29/29] accel/tcg: Remove reset_icount argument from
 cpu_restore_state_from_tb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-31-richard.henderson@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221024132459.3229709-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
> The value passed is always true.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Claudio Fontana <cfontana@suse.de>

> ---
>  accel/tcg/translate-all.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index dd439b5e3c..9e7dd41795 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -353,12 +353,11 @@ static int cpu_unwind_data_from_tb(TranslationBlock *tb, uintptr_t host_pc,
>  }
>  
>  /*
> - * The cpu state corresponding to 'host_pc' is restored.
> - * When reset_icount is true, current TB will be interrupted and
> - * icount should be recalculated.
> + * The cpu state corresponding to 'host_pc' is restored in
> + * preparation for exiting the TB.
>   */
>  static void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
> -                                      uintptr_t host_pc, bool reset_icount)
> +                                      uintptr_t host_pc)
>  {
>      uint64_t data[TARGET_INSN_START_WORDS];
>  #ifdef CONFIG_PROFILER
> @@ -371,7 +370,7 @@ static void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>          return;
>      }
>  
> -    if (reset_icount && (tb_cflags(tb) & CF_USE_ICOUNT)) {
> +    if (tb_cflags(tb) & CF_USE_ICOUNT) {
>          assert(icount_enabled());
>          /*
>           * Reset the cycle counter to the start of the block and
> @@ -404,7 +403,7 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc)
>      if (in_code_gen_buffer((const void *)(host_pc - tcg_splitwx_diff))) {
>          TranslationBlock *tb = tcg_tb_lookup(host_pc);
>          if (tb) {
> -            cpu_restore_state_from_tb(cpu, tb, host_pc, true);
> +            cpu_restore_state_from_tb(cpu, tb, host_pc);
>              return true;
>          }
>      }
> @@ -1715,7 +1714,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
>                   * restore the CPU state.
>                   */
>                  current_tb_modified = true;
> -                cpu_restore_state_from_tb(cpu, current_tb, retaddr, true);
> +                cpu_restore_state_from_tb(cpu, current_tb, retaddr);
>                  cpu_get_tb_cpu_state(env, &current_pc, &current_cs_base,
>                                       &current_flags);
>              }
> @@ -1874,7 +1873,7 @@ static bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
>                     restore the CPU state */
>  
>              current_tb_modified = 1;
> -            cpu_restore_state_from_tb(cpu, current_tb, pc, true);
> +            cpu_restore_state_from_tb(cpu, current_tb, pc);
>              cpu_get_tb_cpu_state(env, &current_pc, &current_cs_base,
>                                   &current_flags);
>          }
> @@ -1904,7 +1903,7 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
>      tb = tcg_tb_lookup(retaddr);
>      if (tb) {
>          /* We can use retranslation to find the PC.  */
> -        cpu_restore_state_from_tb(cpu, tb, retaddr, true);
> +        cpu_restore_state_from_tb(cpu, tb, retaddr);
>          tb_phys_invalidate(tb, -1);
>      } else {
>          /* The exception probably happened in a helper.  The CPU state should
> @@ -1940,7 +1939,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
>          cpu_abort(cpu, "cpu_io_recompile: could not find TB for pc=%p",
>                    (void *)retaddr);
>      }
> -    cpu_restore_state_from_tb(cpu, tb, retaddr, true);
> +    cpu_restore_state_from_tb(cpu, tb, retaddr);
>  
>      /*
>       * Some guests must re-execute the branch when re-executing a delay


