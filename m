Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128113A0615
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 23:34:15 +0200 (CEST)
Received: from localhost ([::1]:44672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqjMT-0004GV-5j
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 17:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjLY-0003Pe-Or
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 17:33:16 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:33421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjLV-0000SM-Nv
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 17:33:16 -0400
Received: by mail-pg1-x52e.google.com with SMTP id e20so5683762pgg.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 14:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2Xe1Z8SuFDERsT04b3rhXb5qnWkWynznPba8HgCcZ/o=;
 b=ARcBJoVDwhW4l4BwKtMvucPM6Zk8O/szRD2doMYPlxuTqpE8qlS4Z32cgB174K4/+w
 nzL4qWPOa2BLkBIQu2QdO3E6plVY/GfSdbM0XaG2PGKwJFPUKrXmdbg9LmQQicMmMpqr
 CwSHtJdDhVyLsHhefD02rQf9jDxo8C6bnECktiBLjHQX7C17ZAcKu/JH+XL5EqtrMnmI
 Ur4u0gt+Nl+5fQZpTHMDT1lWCZB815aD4w3QUC2Op2r5GKH5F12clK5DRKddOClCgePl
 fDFsKt/tWDnVxsKM75T+aPSVm6yoH5ojx+m9sMoPXA01RjiZrgALUA0g8fKaVTDe1jcm
 sBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2Xe1Z8SuFDERsT04b3rhXb5qnWkWynznPba8HgCcZ/o=;
 b=gPAYv9Dk0g5zDoaAAREED+EqyRgYxtOgoZf4q9TLi71Ya/9D+MZnXGPvwwPBKJkVou
 20IBHAxG0loT9alscByg1UpUpNDRkCgGGRZT2fVBEgCnLLvWHG4gn/uiXxGvXdaZtXmB
 buA3f3v8CoPPX8hZ+dNW5D1cwwUYVofKMgz38KwOcYR6peWTpJdE+p5xQy4Ntm/dQO3h
 uCnNZfDv7qrkf1skueF98xj3TM+n/vInsAGLjRuhxqUe1URHGDNh6SXrB8dRLdn1h0Wu
 lQQYxcIttcIqzcSNPpsSTjG8TBFMlGA1s6+r48RbXI6DgFv7yxbJqntU47tf40m3UXgd
 uZUA==
X-Gm-Message-State: AOAM530jAijam6XGMbEgGRiBUQa3IipwG/R9g0eq8tnDUCnN5hHUtgsl
 +FqJMpXrDqJ8Pyc3Gl8473Mz0rWMlVkMzA==
X-Google-Smtp-Source: ABdhPJz6E0sSUyh8ui8PpXipT2IR1d0VXVmzm7VkSRRJh7pVNUMxRRKiRjYLHX8atWWaYBKLEfjepA==
X-Received: by 2002:a63:6284:: with SMTP id w126mr262777pgb.284.1623187991178; 
 Tue, 08 Jun 2021 14:33:11 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 t1sm12559141pgl.40.2021.06.08.14.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 14:33:10 -0700 (PDT)
Subject: Re: [PATCH 11/55] target/arm: Implement MVE VLDR/VSTR (non-widening
 forms)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fef05b3a-eb23-fea7-0230-a69207b48e11@linaro.org>
Date: Tue, 8 Jun 2021 14:33:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +static uint16_t mve_element_mask(CPUARMState *env)
> +{
> +    /*
> +     * Return the mask of which elements in the MVE vector should be
> +     * updated. This is a combination of multiple things:
> +     *  (1) by default, we update every lane in the vector
> +     *  (2) VPT predication stores its state in the VPR register;
> +     *  (3) low-overhead-branch tail predication will mask out part
> +     *      the vector on the final iteration of the loop
> +     *  (4) if EPSR.ECI is set then we must execute only some beats
> +     *      of the insn
> +     * We combine all these into a 16-bit result with the same semantics
> +     * as VPR.P0: 0 to mask the lane, 1 if it is active.
> +     * 8-bit vector ops will look at all bits of the result;
> +     * 16-bit ops will look at bits 0, 2, 4, ...;
> +     * 32-bit ops will look at bits 0, 4, 8 and 12.
> +     * Compare pseudocode GetCurInstrBeat(), though that only returns
> +     * the 4-bit slice of the mask corresponding to a single beat.
> +     */
> +    uint16_t mask = extract32(env->v7m.vpr, R_V7M_VPR_P0_SHIFT,
> +                              R_V7M_VPR_P0_LENGTH);

Any reason you're not using FIELD_EX32 and and FIELD_DP32 so far in this file?

> +#define DO_VLDR(OP, ESIZE, LDTYPE, TYPE, H)                             \
> +    void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t addr)    \
> +    {                                                                   \
> +        TYPE *d = vd;                                                   \
> +        uint16_t mask = mve_element_mask(env);                          \
> +        unsigned b, e;                                                  \

esize is redundant with sizeof(type); perhaps just make it a local variable?

> diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
> index c54d5cb7305..e8bb2372ad9 100644
> --- a/target/arm/translate-mve.c
> +++ b/target/arm/translate-mve.c
> @@ -1,6 +1,6 @@
>   /*
>    *  ARM translation: M-profile MVE instructions
> -
> + *
>    *  Copyright (c) 2021 Linaro, Ltd.

Is this just diff silliness?  I see that it has decided that helper-mve.h is a 
rename from translate-mve.c...

> +static bool do_ldst(DisasContext *s, arg_VLDR_VSTR *a, MVEGenLdStFn *fn)
> +{
> +    TCGv_i32 addr;
> +    uint32_t offset;
> +    TCGv_ptr qreg;
> +
> +    if (!dc_isar_feature(aa32_mve, s)) {
> +        return false;
> +    }
> +
> +    if (a->qd > 7 || !fn) {
> +        return false;
> +    }

It's a funny old decode,

   if D then UNDEFINED.
   d = D:Qd,

Is the spec forward looking to more than 7 Q registers?
It's tempting to just drop the D:Qd from the decode...

> +static bool trans_VLDR_VSTR(DisasContext *s, arg_VLDR_VSTR *a)
> +{
> +    MVEGenLdStFn *ldfns[] = {

static MVEGenLdStFn * const ldfns

> +    MVEGenLdStFn *stfns[] = {

Likewise, though...

> +    return do_ldst(s, a, a->l ? ldfns[a->size] : stfns[a->size]);

... just put em together into a two-dimensional array, with a->l as the second 
index?


r~

