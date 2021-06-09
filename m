Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EB43A1E8F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 23:08:07 +0200 (CEST)
Received: from localhost ([::1]:41588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr5Qk-00073J-9v
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 17:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr5Pf-0006C5-7Z
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 17:06:59 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:47053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr5Pa-0000K0-D3
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 17:06:56 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso2423483pjb.5
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 14:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/v3p0iFo/toP4/bZ8Mq7dQnEpnbjBATLAwUViilE90Q=;
 b=aI8U/v5h21O/URWMyRugSKVGXxFUZfTLPzrXwbRXBdjcBfEsIuhfl6tZljBHj80xWp
 aJ1ClqnxBvIA+V0bY1652tqx/jk/KP6++CfW/mSn747CinMT8AbU55w0gAU9ZOkPMtn7
 gNvDm5v5983VXoi7wcYIxDdab0InHbgb0DLEmw0FyLY6AaR9n00V58xZ4zPnNA3EvzFC
 Wsh3MvoN0438ZDH0e2ZIK433GhA1q/f+QQG4XDimXQN5xRG6La0oOJ1lwyZj2ga1aDlp
 0hbgbcZ+MMW9mshwANbtI0VdVJygOK1dViSKEJT9GLRWyPZwPNbe0/vT+HMEplPmVdVq
 Pisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/v3p0iFo/toP4/bZ8Mq7dQnEpnbjBATLAwUViilE90Q=;
 b=H6yhia/l2g3a/RIFg3UWl8KsiNDjxLZtg+OeDTdsXGit2n6V55PRkvp5OkgSEubHg0
 fRqOk9RBha4NjcbaBIPSX8lmuH35zADw4yM3JYPfWFJkk9gmSfoPLLpVZJJcISvjD2Vd
 xqqvFufjJ4UDjnLTm+oJjJWn+xTu2nH0JZN9BXiEwaKbAdnNYimQy0ajwtSUJehPmSes
 La3srFOKVpayyGZ6vZTmAdS/5bsZliTn8Q5Ov6UacsDK9i4JzoAiJWBEVBQQwx2S3D7x
 Ozj2URYPDc4dh2zqUWg4jYY2ZxEpyPxB3DPWPnJy7h/UtwAoOnkzW4RrPRCobcML9ckZ
 fduQ==
X-Gm-Message-State: AOAM531g6hrDACyZjy8Ysr9d4M3IvyBVQiWBC3QSowOLba0VJNF34IwO
 HQX427GwLliAzDunxWR3YbNLFzE519vNCA==
X-Google-Smtp-Source: ABdhPJzojiYT2p9FIhboRKgLdIIOyTFZEr0mOkcqBZZXv61cwUi/MAm8tBE/6RlhtjDIpYFrV1NQNw==
X-Received: by 2002:a17:90a:ff12:: with SMTP id
 ce18mr1490061pjb.215.1623272812584; 
 Wed, 09 Jun 2021 14:06:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m5sm564143pgl.75.2021.06.09.14.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 14:06:52 -0700 (PDT)
Subject: Re: [PATCH 51/55] target/arm: Implement MVE VADC, VSBC
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-52-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81de6b94-0b9a-4173-4307-253a6b46a286@linaro.org>
Date: Wed, 9 Jun 2021 14:06:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-52-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

On 6/7/21 9:58 AM, Peter Maydell wrote:
> +#define DO_VADC(OP, INV)                                                \
> +    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vd,         \
> +                                    void *vn, void *vm, uint32_t nzcv)  \
> +    {                                                                   \
> +        uint32_t *d = vd, *n = vn, *m = vm;                             \
> +        uint16_t mask = mve_element_mask(env);                          \
> +        unsigned e;                                                     \
> +        int carry = (nzcv & FPCR_C) ? 1 : 0;                            \
> +        /* If we do no additions at all the flags are preserved */      \
> +        bool updates_flags = (mask & 0x1111) != 0;                      \
> +        for (e = 0; e < 16 / 4; e++, mask >>= 4) {                      \
> +            uint64_t r = (uint64_t)n[H4(e)] + INV(m[H4(e)]) + carry;    \
> +            if (mask & 1) {                                             \
> +                carry = r >> 32;                                        \
> +            }                                                           \
> +            uint64_t bytemask = mask_to_bytemask4(mask);                \
> +            d[H4(e)] &= ~bytemask;                                      \
> +            d[H4(e)] |= (r & bytemask);                                 \
> +        }                                                               \
> +        mve_advance_vpt(env);                                           \
> +        if (updates_flags) {                                            \
> +            nzcv = carry ? FPCR_C : 0;                                  \
> +        }                                                               \
> +        return nzcv;                                                    \
> +    }
...
> +    /*
> +     * This insn is subject to beat-wise execution.  Partial execution
> +     * of an I=1 (initial carry input fixed) insn which does not
> +     * execute the first beat must start with the current FPSCR.NZCV
> +     * value, not the fixed constant input.
> +     */
> +    if (a->i && !mve_skip_first_beat(s)) {
> +        /* Carry input is 0 (VADCI) or 1 (VSBCI), NZV zeroed */
> +        nzcv = tcg_const_i32(fixed_carry);
> +    } else {
> +        /* Carry input from existing NZCV flag values */
> +        nzcv = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
> +        tcg_gen_andi_i32(nzcv, nzcv, FPCR_NZCV_MASK);
> +    }
> +    qd = mve_qreg_ptr(a->qd);
> +    qn = mve_qreg_ptr(a->qn);
> +    qm = mve_qreg_ptr(a->qm);
> +    fn(nzcv, cpu_env, qd, qn, qm, nzcv);
> +    fpscr = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
> +    tcg_gen_andi_i32(fpscr, fpscr, ~FPCR_NZCV_MASK);
> +    tcg_gen_or_i32(fpscr, fpscr, nzcv);
> +    store_cpu_field(fpscr, vfp.xregs[ARM_VFP_FPSCR]);

Hmm.  It seems like you're having to work extra hard in tcg to extract and 
store nzcv.

How about four helper functions instead of 2.  E.g.

static void do_vadc(CPUARMState *env, uint32_t *d,
                     uint32_t *n, uint32_t *m,
                     uint32_t inv, uint32_t carry_in,
                     bool update_flags)
{
     uint16_t mask = mve_element_mask(env);
     unsigned e;

     /* If any additions trigger, we will update flags. */
     if (mask & 0x1111) {
         update_flags = true;
     }

     for (e = 0; e < 16 / 4; e++, mask >>= 4) {
         uint32_t bmask = mask_to_bytemask4(mask);
         uint64_t r = carry_in;
         r += n[H4(e)];
         r += m[H4(e)] ^ inv;
         if (mask & 1) {
             carry_in = r >> 32;
         }
         d[H4(e)] = (d[H4(e)] & ~bmask) | ((uint32_t)r & bmask);
     }

     if (update_flags) {
         /* Store C, clear NZV. */
         env->vfp.xregs[ARM_VFP_FPSCR] &= ~FPCR_NZCV_MASK;
         env->vfp.xregs[ARM_VFP_FPSCR] |= carry_in * FPCR_C;
     }
     mve_advance_vpt(env);                                           }

void HELPER(mve_vadc)(CPUARMState *env, void *vd,
                       void *vn, void *vm)
{
     bool carry_in = env->vfp.xregs[ARM_VFP_FPSCR] & FPCR_C;
     do_vadc(env, vd, vn, vm, 0, carry_in, false);
}

void HELPER(mve_vsbc)(CPUARMState *env, void *vd,
                       void *vn, void *vm)
{
     bool carry_in = env->vfp.xregs[ARM_VFP_FPSCR] & FPCR_C;
     do_vadc(env, vd, vn, vm, -1, carry_in, false);
}

void HELPER(mve_vadci)(CPUARMState *env, void *vd,
                        void *vn, void *vm)
{
     do_vadc(env, vd, vn, vm, 0, 0, true);
}

void HELPER(mve_vsbci)(CPUARMState *env, void *vd,
                       void *vn, void *vm)
{
     do_vadc(env, vd, vn, vm, -1, 1, true);
}


r~

