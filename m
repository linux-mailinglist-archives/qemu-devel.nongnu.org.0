Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D9E514615
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 11:56:09 +0200 (CEST)
Received: from localhost ([::1]:40834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkNM8-0001Qa-9r
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 05:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nkNIJ-0000Sd-3W; Fri, 29 Apr 2022 05:52:11 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:56334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nkNIH-0000WY-0N; Fri, 29 Apr 2022 05:52:10 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 03AB521A89;
 Fri, 29 Apr 2022 09:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1651225922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1aFNMNvzd69es2m+276N42P595gmK4KSGnSBkfPdWA=;
 b=FRAXG83aoHHKV+FyLjTvqdSoMhgYO4F+RWAT+Ee58uDmGqFbMfuuiutUZbe5CCKlphyhZe
 rjL6DZFOP6ZIdDhjSzabYbblTyZdHt0pOCfmoyJnKf09XHFc8YLVuRuc4/VAYB7VACv+r9
 PftPng2Lq00jSzzYO7/K6pMr3e1Djm8=
Message-ID: <9c515174-a203-ecbd-1fd3-c8aa1913be4c@greensocs.com>
Date: Fri, 29 Apr 2022 11:52:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 56/60] target/arm: Enable FEAT_CSV2_2 for -cpu max
Content-Language: en-US-large
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-57-richard.henderson@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220417174426.711829-57-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/17/22 19:44, Richard Henderson wrote:
> There is no branch prediction in TCG, therefore there is no
> need to actually include the context number into the predictor.
> Therefore all we need to do is add the state for SCXTNUM_ELx. >
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Update emulation.rst; clear CSV2_FRAC; use decimal; tidy access_scxtnum.
> v3: Rely on EL3-no-EL2 squashing during registration.
> ---
>   docs/system/arm/emulation.rst |  3 ++
>   target/arm/cpu.h              | 16 +++++++++
>   target/arm/cpu64.c            |  3 +-
>   target/arm/helper.c           | 66 ++++++++++++++++++++++++++++++++++-
>   4 files changed, 86 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> @@ -7233,7 +7243,57 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
>       },
>   };

Hi Richard,

I tried to compare with the pseudocode from arm doc and I've a few 
interrogations. It seems to me there are missing cases in the access 
checks, but I lack the background to know if these are not checked 
somewhere else or guaranteed to never happen.

>   
> -#endif > +static CPAccessResult access_scxtnum(CPUARMState *env, const 
ARMCPRegInfo *ri,
> +                                     bool isread)
> +{
The following checks are missing:
    + for HFG[W/R]TR_EL2.SCXTNUM_EL0/1
    + HCR_EL2.<NV2,NV1,NV> when accessing SCXTNUM_EL1, but maybe these 
are always guaranteed to fail because we don't support the features ?
    + HCR_EL2.NV when accessing SCXTNUM_EL2
> +    int el = arm_current_el(env);
> +
> +    if (el == 0) {
> +        uint64_t hcr = arm_hcr_el2_eff(env);
> +        if ((hcr & (HCR_TGE | HCR_E2H)) != (HCR_TGE | HCR_E2H)) {
> +            if (env->cp15.sctlr_el[1] & SCTLR_TSCXT) {
> +                if (hcr & HCR_TGE) {
> +                    return CP_ACCESS_TRAP_EL2;
> +                }
> +                return CP_ACCESS_TRAP;
> +            }
> +            if (arm_is_el2_enabled(env) && !(hcr & HCR_ENSCXT)) {
This case is also present when accessing SCXTNUM_EL0 from el1 (but 
without "(hcr & (HCR_TGE | HCR_E2H)) != (HCR_TGE | HCR_E2H)" precondition)
> +                return CP_ACCESS_TRAP_EL2;
> +            }
> +            goto no_sctlr_el2;
> +        }
> +    }
> +    if (el < 2 && (env->cp15.sctlr_el[2] & SCTLR_TSCXT)) {
> +        return CP_ACCESS_TRAP_EL2;
> +    }
> + no_sctlr_el2:
> +    if (el < 3
> +        && arm_feature(env, ARM_FEATURE_EL3)
> +        && !(env->cp15.scr_el3 & SCR_ENSCXT)) {
> +        return CP_ACCESS_TRAP_EL3;
> +    }
> +    return CP_ACCESS_OK;
> +}

Regards,
--
Damien

