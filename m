Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46459610CE1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:17:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooLU9-00024U-Pg; Fri, 28 Oct 2022 05:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ooLU7-00022j-Be
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:17:03 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ooLU5-0006rl-OT
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:17:03 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D1531219CB;
 Fri, 28 Oct 2022 09:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666948619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJYS5qm2xqFuDr753S7Rb6dZQ5ml8ZoKUA5qyGnEOYk=;
 b=cjCULPtHig3460qJqIqyfZtsRk/z5XNEB4OWCnz5+n5LPY1bgLzKbpPuQqfSVYD34hmUsm
 G1teyCxPc9EAkEjKOSHARf3mBpWHQi+SORxsv4qQCR6rOfe6tny+6IOWzNzZb81sDIzCH2
 2lnMU8QkbQZb008ywnMQsI6HlaiXRLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666948619;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJYS5qm2xqFuDr753S7Rb6dZQ5ml8ZoKUA5qyGnEOYk=;
 b=nokaCsd+GJcc5f3geqfhY2RMBfX9CbYFqlpxQRepU/YJ+ktp0VZbvSlahF+QJ0IRIW8Gnh
 PczQZ0dGM5V1E6Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AED241377D;
 Fri, 28 Oct 2022 09:16:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rbnxKAueW2NzFQAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 28 Oct 2022 09:16:59 +0000
Message-ID: <3e38900a-cdfe-c52c-85ce-5a7b1a0586f8@suse.de>
Date: Fri, 28 Oct 2022 11:16:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/6] target/openrisc: Use cpu_unwind_state_data for
 mfspr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20221027100254.215253-1-richard.henderson@linaro.org>
 <20221027100254.215253-5-richard.henderson@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Cc: qemu-devel <qemu-devel@nongnu.org>
In-Reply-To: <20221027100254.215253-5-richard.henderson@linaro.org>
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
> Since we do not plan to exit, use cpu_unwind_state_data
> and extract exactly the data requested.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/openrisc/sys_helper.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
> index a3508e421d..dde2fa1623 100644
> --- a/target/openrisc/sys_helper.c
> +++ b/target/openrisc/sys_helper.c
> @@ -199,6 +199,7 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
>                             target_ulong spr)
>  {
>  #ifndef CONFIG_USER_ONLY
> +    uint64_t data[TARGET_INSN_START_WORDS];
>      MachineState *ms = MACHINE(qdev_get_machine());
>      OpenRISCCPU *cpu = env_archcpu(env);
>      CPUState *cs = env_cpu(env);
> @@ -232,14 +233,20 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
>          return env->evbar;
>  
>      case TO_SPR(0, 16): /* NPC (equals PC) */
> -        cpu_restore_state(cs, GETPC(), false);
> +        if (cpu_unwind_state_data(cs, GETPC(), data)) {
> +            return data[0];
> +        }
>          return env->pc;
>  
>      case TO_SPR(0, 17): /* SR */
>          return cpu_get_sr(env);
>  
>      case TO_SPR(0, 18): /* PPC */
> -        cpu_restore_state(cs, GETPC(), false);
> +        if (cpu_unwind_state_data(cs, GETPC(), data)) {
> +            if (data[1] & 2) {
> +                return data[0] - 4;
> +            }
> +        }
>          return env->ppc;
>  
>      case TO_SPR(0, 32): /* EPCR */

I am struggling to understand if the fact that we are not setting cpu->env.dflag anymore in the mfspr helper is fine;

here I am unfamiliar with the arch, also Ccing Philippe in case he wants to step in to review this bit.

Thanks,

CLaudio

