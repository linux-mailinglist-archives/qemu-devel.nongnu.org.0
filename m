Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E906960F737
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 14:27:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo1uv-0003AA-Lj; Thu, 27 Oct 2022 08:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oo1uA-0000Pk-8o
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:22:39 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oo1u8-0004Dq-Dc
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:22:38 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A7C1821AE9;
 Thu, 27 Oct 2022 12:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666873354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lecz/t+BKWHBo4XtmI3OTePTd/GXcarV/NMekuvz+sQ=;
 b=Y4Aks8EUxDetYTrdu6OPWdih5sJ1JtsLiojifop7XY8oa1aU4vyAbdWsGZGk/khl5l5dqH
 0MimifsfkfZpec10fxIsfFW67gAXTm3kRJ/CP8TiLlKxbEgUQbDhEoHe5/iKB+ZrQ/AOpO
 q0RTQGvBmM9cEoEAUMo3Efw8uI9Bdlc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666873354;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lecz/t+BKWHBo4XtmI3OTePTd/GXcarV/NMekuvz+sQ=;
 b=vProAya9zNcKJa4ttm0cuCW87vlXRKtjKUpgu+MBDOaMbEk1KugcazPwMAES+lHBo4eRP1
 gnrCZMoOZ3z1EHBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C47313357;
 Thu, 27 Oct 2022 12:22:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LBm1IAp4WmOFRAAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 27 Oct 2022 12:22:34 +0000
Message-ID: <9705b542-d81b-5299-9aba-098dc335d5ef@suse.de>
Date: Thu, 27 Oct 2022 14:22:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/6] target/i386: Use cpu_unwind_state_data for tpr
 access
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221027100254.215253-1-richard.henderson@linaro.org>
 <20221027100254.215253-3-richard.henderson@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221027100254.215253-3-richard.henderson@linaro.org>
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

On 10/27/22 12:02, Richard Henderson wrote:
> Avoid cpu_restore_state, and modifying env->eip out from
> underneath the translator with TARGET_TB_PCREL.  There is
> some slight duplication from x86_restore_state_to_opc,
> but it's just a few lines.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1269
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/helper.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/helper.c b/target/i386/helper.c
> index b62a1e48e2..2cd1756f1a 100644
> --- a/target/i386/helper.c
> +++ b/target/i386/helper.c
> @@ -509,6 +509,23 @@ void cpu_x86_inject_mce(Monitor *mon, X86CPU *cpu, int bank,
>      }
>  }
>  
> +static target_ulong get_memio_eip(CPUX86State *env)
> +{
> +    uint64_t data[TARGET_INSN_START_WORDS];
> +    CPUState *cs = env_cpu(env);
> +
> +    if (!cpu_unwind_state_data(cs, cs->mem_io_pc, data)) {
> +        return env->eip;
> +    }
> +
> +    /* Per x86_restore_state_to_opc. */
> +    if (TARGET_TB_PCREL) {
> +        return (env->eip & TARGET_PAGE_MASK) | data[0];
> +    } else {
> +        return data[0] - env->segs[R_CS].base;

here we switch from taking cs_base from the TranslationBlock to taking it from env-> .

I traced the tb->cs_base use back to

cpu_exec() and cpu_exec_step_atomic()

and from there it seems ok, as the sequence is

cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base, &flags), which gets it from env,

followed by

tb_gen_code(...cs_base) which sets the TranslationBlock cs_base, and tb->cs_base does not seem to change again.

I mention this in the case there can be some weird situation in which env and tb can end up not being consistent,
does a TranslationBlock that is initialized with a certain cs_base from the env that contains user code to load / change the CS segment base potentially constitute a problem?

Ciao,

Claudio



> +    }
> +}
> +
>  void cpu_report_tpr_access(CPUX86State *env, TPRAccess access)
>  {
>      X86CPU *cpu = env_archcpu(env);
> @@ -519,9 +536,9 @@ void cpu_report_tpr_access(CPUX86State *env, TPRAccess access)
>  
>          cpu_interrupt(cs, CPU_INTERRUPT_TPR);
>      } else if (tcg_enabled()) {
> -        cpu_restore_state(cs, cs->mem_io_pc, false);
> +        target_ulong eip = get_memio_eip(env);
>  
> -        apic_handle_tpr_access_report(cpu->apic_state, env->eip, access);
> +        apic_handle_tpr_access_report(cpu->apic_state, eip, access);
>      }
>  }
>  #endif /* !CONFIG_USER_ONLY */


