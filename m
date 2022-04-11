Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA524FC215
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 18:19:51 +0200 (CEST)
Received: from localhost ([::1]:52946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndwlZ-00054i-Nx
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 12:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwkf-00049f-7P
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:18:53 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:43666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwkd-0006Rt-6q
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:18:52 -0400
Received: by mail-yb1-xb30.google.com with SMTP id t12so7887109ybt.10
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 09:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nODrkBw822ChcumjNDkmAc9d27c5qDQev/d72qtbzD0=;
 b=VvPS19gyKDUsCzrKwH9MCzAIR59/7tRGwu/K5Ilf2UWhOAjkff2RP1WXl9sVS2nTA0
 U5UUtO2FaqvJ0xDOvL5wIDtPwWm8sDDW4R0aALSLmTm2cR/Sb1qHvstHPslK5fHGIcxg
 jab/G6EkBHlcxHH3PUKpe9ZlYor9p6z6fCuxdXoL702iH1+zUoRuXDvvcd1ZFTpoqcEI
 vrPSM4abB2tG9HaNxRfUgq0lcAZbIxKAE7efNKxYhvqEkwqkYwJBQQaa8hbxSNJ96Hke
 CKCjgMeRlGUu+y3IoB3Tb7vfe66l8Rfzr9hsReO8Kucd00ZSpMsNLRSGh54uOK5IYG54
 uljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nODrkBw822ChcumjNDkmAc9d27c5qDQev/d72qtbzD0=;
 b=2SvtnUc0Qjv7Vi2UUw8tmD4jUavrBRlHsxMvxDoGCCYNUdSeE6BieLwzFvD08J+CPE
 oUnmhDQktrS2EEwY4N3Nx8GU7WqJO43nD9miKxevTlVnAFfk/vs0VVDOydDSUX9Z3yI+
 Np2Bkh8MI0EtbH8XSGfyniqqxzKIdvsREQxEhG4ry19wdcsRtMmnbuy7N74748dxkm/g
 j4AAxHZNXC+r/ZAf3+xiMIjDNrpDXhqjKt6tPCtt0R0fImNTOBdOTWaycwUTb5p6Bz5f
 MX7exzXNnrHDaRPAdtl33V436G4xaYhNI163BMx0CyclL1Hz/+xzWqjaRv15GX24cOOL
 OgHw==
X-Gm-Message-State: AOAM533jQcWnQlz4eEMpwbokWkPDBpF43LKfyiesnU6BIulUx0dtxhNG
 faoxphyIK9Bnf2N1OZoWGBp0ajXNkJ8374fmWK5nww==
X-Google-Smtp-Source: ABdhPJyPBY1HNt6faw4STPV/awP9JUVCpwgXVL/3FRjGiyIdH1CTKuuMoBTSvHTeuk3EjXZx3n/wYpWy5ZO0n8SNuQ0=
X-Received: by 2002:a25:ae54:0:b0:641:1aaf:c89 with SMTP id
 g20-20020a25ae54000000b006411aaf0c89mr8867905ybe.479.1649693930019; Mon, 11
 Apr 2022 09:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-15-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 17:18:39 +0100
Message-ID: <CAFEAcA_9Eu-WZn_yMhjj23GRkz14huEVSb8xckvRyygDngwXEQ@mail.gmail.com>
Subject: Re: [PATCH 14/16] target/arm: Implement ESB instruction
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 9 Apr 2022 at 01:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Check for and defer any pending virtual SError.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        |  1 +
>  target/arm/a32.decode      | 16 +++++++++-----
>  target/arm/t32.decode      | 18 +++++++--------
>  target/arm/op_helper.c     | 45 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-a64.c |  7 ++++++
>  target/arm/translate.c     | 10 +++++++++
>  6 files changed, 82 insertions(+), 15 deletions(-)
>
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index b463d9343b..bb7f901668 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -54,6 +54,7 @@ DEF_HELPER_1(wfe, void, env)
>  DEF_HELPER_1(yield, void, env)
>  DEF_HELPER_1(pre_hvc, void, env)
>  DEF_HELPER_2(pre_smc, void, env, i32)
> +DEF_HELPER_1(esb, void, env)
>
>  DEF_HELPER_3(cpsr_write, void, env, i32, i32)
>  DEF_HELPER_2(cpsr_write_eret, void, env, i32)
> diff --git a/target/arm/a32.decode b/target/arm/a32.decode
> index fcd8cd4f7d..f2ca480949 100644
> --- a/target/arm/a32.decode
> +++ b/target/arm/a32.decode
> @@ -187,13 +187,17 @@ SMULTT           .... 0001 0110 .... 0000 .... 1110 ....      @rd0mn
>
>  {
>    {
> -    YIELD        ---- 0011 0010 0000 1111 ---- 0000 0001
> -    WFE          ---- 0011 0010 0000 1111 ---- 0000 0010
> -    WFI          ---- 0011 0010 0000 1111 ---- 0000 0011
> +    [
> +      YIELD      ---- 0011 0010 0000 1111 ---- 0000 0001
> +      WFE        ---- 0011 0010 0000 1111 ---- 0000 0010
> +      WFI        ---- 0011 0010 0000 1111 ---- 0000 0011
>
> -    # TODO: Implement SEV, SEVL; may help SMP performance.
> -    # SEV        ---- 0011 0010 0000 1111 ---- 0000 0100
> -    # SEVL       ---- 0011 0010 0000 1111 ---- 0000 0101
> +      # TODO: Implement SEV, SEVL; may help SMP performance.
> +      # SEV      ---- 0011 0010 0000 1111 ---- 0000 0100
> +      # SEVL     ---- 0011 0010 0000 1111 ---- 0000 0101
> +
> +      ESB        ---- 0011 0010 0000 1111 ---- 0001 0000
> +    ]

Why don't we decode bits [11:8] here? I see it's the same
as YIELD/WFE/WFI, but I'm not sure why we're not decoding
those bits in those insns either...

>
>      # The canonical nop ends in 00000000, but the whole of the
>      # rest of the space executes as nop if otherwise unsupported.
> diff --git a/target/arm/t32.decode b/target/arm/t32.decode
> index 78fadef9d6..f21ad0167a 100644
> --- a/target/arm/t32.decode
> +++ b/target/arm/t32.decode
> @@ -364,17 +364,17 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
>    [
>      # Hints, and CPS
>      {
> -      YIELD      1111 0011 1010 1111 1000 0000 0000 0001
> -      WFE        1111 0011 1010 1111 1000 0000 0000 0010
> -      WFI        1111 0011 1010 1111 1000 0000 0000 0011
> +      [
> +        YIELD    1111 0011 1010 1111 1000 0000 0000 0001
> +        WFE      1111 0011 1010 1111 1000 0000 0000 0010
> +        WFI      1111 0011 1010 1111 1000 0000 0000 0011
>
> -      # TODO: Implement SEV, SEVL; may help SMP performance.
> -      # SEV      1111 0011 1010 1111 1000 0000 0000 0100
> -      # SEVL     1111 0011 1010 1111 1000 0000 0000 0101
> +        # TODO: Implement SEV, SEVL; may help SMP performance.
> +        # SEV    1111 0011 1010 1111 1000 0000 0000 0100
> +        # SEVL   1111 0011 1010 1111 1000 0000 0000 0101
>
> -      # For M-profile minimal-RAS ESB can be a NOP, which is the
> -      # default behaviour since it is in the hint space.
> -      # ESB      1111 0011 1010 1111 1000 0000 0001 0000
> +        ESB      1111 0011 1010 1111 1000 0000 0001 0000
> +      ]
>
>        # The canonical nop ends in 0000 0000, but the whole rest
>        # of the space is "reserved hint, behaves as nop".
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 70b42b55fd..f50424b301 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -972,3 +972,48 @@ void HELPER(probe_access)(CPUARMState *env, target_ulong ptr,
>                       access_type, mmu_idx, ra);
>      }
>  }
> +
> +void HELPER(esb)(CPUARMState *env)
> +{
> +    /*
> +     * QEMU does not have a source of physical SErrors, so we are
> +     * only concerned with virtual SErrors.
> +     *
> +     * During translation, we have already checked: RAS enabled,
> +     * EL2 present (enabled check done in arm_hcr_el2_eff), and
> +     * PSTATE.EL in {EL0, EL1}.  This function corresponds to
> +     * AArch64.vESBOperation(), noting that the AArch32 version
> +     * is not functionally different.
> +     */
> +    uint64_t hcr = arm_hcr_el2_eff(env);
> +    bool enabled = !(hcr & HCR_TGE) && (hcr & HCR_AMO);
> +    bool pending = enabled && (hcr & HCR_VSE);
> +    bool masked  = (env->daif & PSTATE_A);
> +
> +    /* If VSE pending and masked, defer the exception.  */
> +    if (pending && masked) {
> +        uint32_t syndrome;
> +
> +        if (arm_el_is_aa64(env, 1)) {
> +            /* Copy across IDS and ISS from VSESR. */
> +            syndrome = env->cp15.vsesr_el2 & 0x1ffffff;
> +        } else {
> +            ARMMMUFaultInfo fi = { .type = ARMFault_AsyncExternal };
> +
> +            if (extended_addresses_enabled(env)) {
> +                syndrome = arm_fi_to_lfsc(&fi);
> +            } else {
> +                syndrome = arm_fi_to_sfsc(&fi);
> +            }
> +            /* Copy across AET and ExT from VSESR. */
> +            syndrome |= env->cp15.vsesr_el2 & 0xd000;
> +        }
> +
> +        /* Set VDISR_EL2.A along with the syndrome. */
> +        env->cp15.vdisr_el2 = syndrome | (1u << 31);
> +
> +        /* Clear pending virtual SError */
> +        env->cp15.hcr_el2 &= ~HCR_VSE;
> +        cpu_reset_interrupt(env_cpu(env), CPU_INTERRUPT_VSERR);
> +    }
> +}
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 9333d7be41..cc54dff83c 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1469,6 +1469,13 @@ static void handle_hint(DisasContext *s, uint32_t insn,
>              gen_helper_autib(cpu_X[17], cpu_env, cpu_X[17], cpu_X[16]);
>          }
>          break;
> +    case 0b10000: /* ESB */
> +        if (dc_isar_feature(aa64_ras, s) &&
> +            arm_dc_feature(s, ARM_FEATURE_EL2) &&
> +            s->current_el <= 1) {
> +            gen_helper_esb(cpu_env);
> +        }
> +        break;
>      case 0b11000: /* PACIAZ */
>          if (s->pauth_active) {
>              gen_helper_pacia(cpu_X[30], cpu_env, cpu_X[30],
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index bf2196b9e2..b42ca53d99 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -6275,6 +6275,16 @@ static bool trans_WFI(DisasContext *s, arg_WFI *a)
>      return true;
>  }
>
> +static bool trans_ESB(DisasContext *s, arg_ESB *a)
> +{
> +    if (dc_isar_feature(aa32_ras, s) &&
> +        arm_dc_feature(s, ARM_FEATURE_EL2) &&
> +        s->current_el <= 1) {

This is doing the right thing for M-profile but only rather
indirectly because it happens to get caught by the FEATURE_EL2
check. I think it would be safer to explicitly check for
not-M-profile (which then gives you a place to put the
"For M-profile minimal-RAS ESB can be a NOP" comment that got
removed above).

> +        gen_helper_esb(cpu_env);
> +    }
> +    return true;

I think a comment noting that without RAS we must NOP would
be useful here.

> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

