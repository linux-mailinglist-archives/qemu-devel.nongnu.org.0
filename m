Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F048B2CA4F1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 15:07:19 +0100 (CET)
Received: from localhost ([::1]:34364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk6JK-00020M-If
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 09:07:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6I2-0001Om-Ag
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:05:58 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6I0-0002Qo-QB
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:05:58 -0500
Received: by mail-oi1-x241.google.com with SMTP id o25so1838079oie.5
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 06:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JQn/dAu8lZ4g3nTDjQOn179Q1SFqKKVs2U8mDJ9dsoE=;
 b=Bqtwbyu0elaRSM9c5DaIBGutrTunj0r1IzZEuxqqouRxxmFYJlMw4uckduvIo2S9Ue
 7xWP6CwYNy6zrajBohGhbt4yeWzaHB4fZ0BEGRRpfdIXjzBwKTro8e8GKpZ1oBxXfRbL
 TxlUWsbX7FNK14Q1Dto7fD+TadJJHJ5pgURxtaHuoCEmSHZaXyonuFM4s7H2q6cQxtqR
 WVtSwKgHxQX6C8pRYlD8IvEUC/FZ8qhlK2ZmeyMNdGesSGuCcbm/jJGB1Luhh9s9w3H6
 t7KeEpRBK/EelWnmt1hd5/6QewtjhnrpY9TdVELnW+sv1PPKmSbqQOHTgM4s0aiQWz87
 MDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JQn/dAu8lZ4g3nTDjQOn179Q1SFqKKVs2U8mDJ9dsoE=;
 b=HtK6HTENeaN627Fc9eF7bUm41GyDEQ9DxgDwDvZlo7+u0ZTTRKSgA7Jtox8rUeNswB
 fkP4gC8mXba9YK6DDcePfOaknNN+SNawyIpClyqCrABhxXR0p0P3gcCSXLaQesJhPAfp
 6az+dF/+nLnM/8smguKXgImu+aR5jOsaSNuQQdWacbtIhoktwQjuxX2OOITNQNbZoNVj
 On72mi9VLpbajVE8mCJyAAq3rt2wk1faE+Idez47NvROPztDO+hGLRsljNdSVqpmODgp
 WKTyILnKqrgFI1pvvmvaKhRZW6N+fJ76fapp5q3qnxfJgUfVTl3vezQiwiwxKE9TxCPK
 J7OA==
X-Gm-Message-State: AOAM531duWIIklXorePNZbD/lCE7/R7fWwd4toRZeAhhrBAerVKSPSTe
 2CADvm+2+rPnpVniYKsDkGjQvkS94XFXcg==
X-Google-Smtp-Source: ABdhPJw2/wo62YbfzRkFTA55C51glqg9O3SeQDA3pFNAUTQieoUZlJIlxKUbQ3zurhFLJj+yFb0U4w==
X-Received: by 2002:aca:a9c8:: with SMTP id s191mr1733488oie.11.1606831550075; 
 Tue, 01 Dec 2020 06:05:50 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id h3sm384103otq.33.2020.12.01.06.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 06:05:49 -0800 (PST)
Subject: Re: [PATCH v2 14/28] target/arm: Implement FPCXT_NS fp system register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c730f827-7f31-1ac7-ec7d-6ce0c65f8145@linaro.org>
Date: Tue, 1 Dec 2020 08:05:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 3:56 PM, Peter Maydell wrote:
> Implement the v8.1M FPCXT_NS floating-point system register.  This is
> a little more complicated than FPCXT_S, because it has specific
> handling for "current FP state is inactive", and it only wants to do
> PreserveFPState(), not the full set of actions done by
> ExecuteFPCheck() which vfp_access_check() implements.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.c.inc | 110 ++++++++++++++++++++++++++++++---
>  1 file changed, 103 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
> index ebc59daf613..1c2d31f6f30 100644
> --- a/target/arm/translate-vfp.c.inc
> +++ b/target/arm/translate-vfp.c.inc
> @@ -647,8 +647,20 @@ typedef enum fp_sysreg_check_result {
>      fp_sysreg_check_continue, /* caller should continue generating code */
>  } fp_sysreg_check_result;
>  
> -static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno)
> +/*
> + * Emit code to check common UNDEF cases and handle lazy state preservation
> + * including the special casing for FPCXT_NS. For reads of sysregs, caller
> + * should provide storefn and opaque; for writes to sysregs these can be NULL.
> + * On return, if *insn_end_label is not NULL the caller needs to gen_set_label()
> + * it at the end of the other code generated for the insn.
> + */
> +static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno,
> +                                               fp_sysreg_storefn *storefn,
> +                                               void *opaque,
> +                                               TCGLabel **insn_end_label)

I think it is really ugly to bury the fpAccess check in here.

> -    if (!vfp_access_check(s)) {
> -        return fp_sysreg_check_done;

I think it would be better to do

  if (regno != ARM_VFP_FPCXT_NS && !vfp_access_check(s))

and split out

> +        /* fpInactive = FPCCR_NS.ASPEN == 1 && CONTROL.FPCA == 0 */
> +        TCGLabel *fp_active_label = gen_new_label();
> +        TCGv_i32 aspen, fpca;
> +        aspen = load_cpu_field(v7m.fpccr[M_REG_NS]);
> +        fpca = load_cpu_field(v7m.control[M_REG_S]);
> +        tcg_gen_andi_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
> +        tcg_gen_xori_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
> +        tcg_gen_andi_i32(fpca, fpca, R_V7M_CONTROL_FPCA_MASK);
> +        tcg_gen_or_i32(fpca, fpca, aspen);
> +        tcg_gen_brcondi_i32(TCG_COND_NE, fpca, 0, fp_active_label);
> +        tcg_temp_free_i32(aspen);
> +        tcg_temp_free_i32(fpca);
> +
> +        /* fpInactive case: FPCXT_NS reads as FPDSCR_NS, write is NOP */
> +        if (storefn) {
> +            TCGv_i32 tmp = load_cpu_field(v7m.fpdscr[M_REG_NS]);
> +            storefn(s, opaque, tmp);
> +        }
> +        /* jump to end of insn */
> +        *insn_end_label = gen_new_label();
> +        tcg_gen_br(*insn_end_label);
> +
> +        gen_set_label(fp_active_label);
> +        /* !fpInactive: PreserveFPState() and handle register as normal */
> +        gen_preserve_fp_state(s);

... all of this to a separate function.

Then VLDR becomes

   case ARM_VFP_FPCXT_NS:
        lab_inactive = gen_new_label();
        gen_branch_fpInactive(s, TCG_COND_NE, lab_inactive);
        ...
        gen_set_label(lab_inactive);
        gen_lookup_tb();
        break;

and VSTR becomes

   case ARM_VFP_FPCXT_NS:
       lab_end = gen_new_label();
       lab_active = gen_new_label();
       gen_branch_fpInactive(s, TCG_COND_EQ, lab_active);
       ...
       tcg_gen_br(lab_end);
       gen_set_label(lab_active);
       /* fall through */
   case ARM_VFP_FPCXT_S:
       ...
   }
   if (lab_end) {
       gen_set_label(lab_end);
   }


r~

