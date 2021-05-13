Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950D037FC16
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:06:21 +0200 (CEST)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEmx-0004Gj-0B
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEPV-0005mh-UL
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:42:07 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEPR-0002SN-Pi
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:42:05 -0400
Received: by mail-ed1-x536.google.com with SMTP id df21so4458842edb.3
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+0ip4hCwHk+wqiNGaP/iHcy1Z6Dw3ILa93c15dQlqtU=;
 b=pgy03LE2K3oPT8oedBcDF/Y75GMm1DAiowl7nfoAW14piWN9yYFSJ08s2+Xx7pT/9T
 LSYFgbJGwxP0FgVeFuESrCArl2ebzxMcLMpaaUo+H9ult5fLA9cckP7edJXrX2ap1HGJ
 HEL4JwK8OyMKT65HZbIVtfwUKarHynjNXjL1cC1+61K9c/Lo9Clts+658+Ox/KGHU2mi
 5PiJbUh/22VpiwrLcsKhUlmnGraOk+tpltyo2T/1dS/RAgjuABHuBI8Inp5VTLbRluKE
 Kh2bMC6z8nduzJIAdYhGZQYLg+pe8hqmT9b8gi/yrUyFXzwknBD1kntRSuKlD8JnaVt/
 QkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+0ip4hCwHk+wqiNGaP/iHcy1Z6Dw3ILa93c15dQlqtU=;
 b=XqpBy9kXNhYXBdMicpogNoXMA6BfhJNkP3Q0vk7bmFssF/x0ML4eN/KqDUZFm+m+G7
 RXErkJfhm6JRwWGXxLz3hI1g2m7wFQiQhwDQIkHBEZMYm3Fii3QLYeXXbDa22ziUi3YI
 0FJ/RbZvyRdLqYT0oBYAkO1yIlsbfC9BO468+mMkmvj1dCEBzbh0NAyanZ+NsjxA9F2H
 QuRtnN4cdx9itU66xCZuK56NiUfRLH+89ec422Da5jLgaBsK0N3td5+mOMp+lRMlE6Gt
 Cw/ZnRbmgwjr6z0aE2nDDB75qbb59czd6nl4KDDC1tKGz43Xzy2CISsZ9NoNX1471EFR
 vQIA==
X-Gm-Message-State: AOAM533UXp3cFXB5vJbNmHqMEWkyC2B8D7xlZwBTvFHafRP8sA8pCkmG
 06mk1Rj12mXavs7qi9lsqQLLzJHFXHyCseXdlZz8sg==
X-Google-Smtp-Source: ABdhPJwuSWJjTdw4pVoIJFAg0xGJV5qkEZ+xJ/+x/bXl5yZ/m8zVIaP2Cm4gbSKwk1m5JRB9fBpo2km+UIOpnTMJbQE=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr50725414edd.251.1620924119295; 
 Thu, 13 May 2021 09:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-71-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-71-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 17:41:47 +0100
Message-ID: <CAFEAcA8sf3M_2pVZPn2AwLO0vdc8PoOwWTtxeYYHTxpUphhkuA@mail.gmail.com>
Subject: Re: [PATCH v6 70/82] target/arm: Implement SVE2 LD1RO
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      |  4 ++
>  target/arm/translate-sve.c | 97 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 101 insertions(+)
>
> diff --git a/target/arm/sve.decode b/target/arm/sve.decode
> index 17adb393ff..df870ce23b 100644
> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -1077,11 +1077,15 @@ LD_zpri         1010010 .. nreg:2 0.... 111 ... ..... .....     @rpri_load_msz
>  # SVE load and broadcast quadword (scalar plus scalar)
>  LD1RQ_zprr      1010010 .. 00 ..... 000 ... ..... ..... \
>                  @rprr_load_msz nreg=0
> +LD1RO_zprr      1010010 .. 01 ..... 000 ... ..... ..... \
> +                @rprr_load_msz nreg=0
>
>  # SVE load and broadcast quadword (scalar plus immediate)
>  # LD1RQB, LD1RQH, LD1RQS, LD1RQD
>  LD1RQ_zpri      1010010 .. 00 0.... 001 ... ..... ..... \
>                  @rpri_load_msz nreg=0
> +LD1RO_zpri      1010010 .. 01 0.... 001 ... ..... ..... \
> +                @rpri_load_msz nreg=0
>
>  # SVE 32-bit gather prefetch (scalar plus 32-bit scaled offsets)
>  PRF             1000010 00 -1 ----- 0-- --- ----- 0 ----
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index ca393164bc..8a4eb8542f 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -5586,6 +5586,103 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
>      return true;
>  }
>
> +static void do_ldro(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
> +{
> +    unsigned vsz = vec_full_reg_size(s);
> +    unsigned vsz_r32;
> +    TCGv_ptr t_pg;
> +    TCGv_i32 t_desc;
> +    int desc, poff, doff;
> +
> +    if (vsz < 32) {
> +        /*
> +         * Note that this UNDEFINED check comes after CheckSVEEnabled()
> +         * in the ARM pseudocode, which is the sve_access_check() done
> +         * in our caller.  We should not now return false from the caller.
> +         */
> +        unallocated_encoding(s);
> +        return;
> +    }
> +
> +    /* Load the first octaword using the normal predicated load helpers.  */
> +
> +    poff = pred_full_reg_offset(s, pg);
> +    if (vsz > 32) {
> +        /*
> +         * Zero-extend the first 32 bits of the predicate into a temporary.
> +         * This avoids triggering an assert making sure we don't have bits
> +         * set within a predicate beyond VQ, but we have lowered VQ to 2
> +         * for this load operation.
> +         */
> +        TCGv_i64 tmp = tcg_temp_new_i64();
> +#ifdef HOST_WORDS_BIGENDIAN
> +        poff += 4;
> +#endif
> +        tcg_gen_ld32u_i64(tmp, cpu_env, poff);
> +
> +        poff = offsetof(CPUARMState, vfp.preg_tmp);
> +        tcg_gen_st_i64(tmp, cpu_env, poff);
> +        tcg_temp_free_i64(tmp);
> +    }
> +
> +    t_pg = tcg_temp_new_ptr();
> +    tcg_gen_addi_ptr(t_pg, cpu_env, poff);
> +
> +    desc = simd_desc(32, 32, zt);
> +    t_desc = tcg_const_i32(desc);

Why put these two lines down here? In do_ldrq() they are higher up...
Unless there's a reason for the two functions to be different we
should keep them the same, I think.

> +
> +    gen_helper_gvec_mem *fn
> +        = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
> +    fn(cpu_env, t_pg, addr, t_desc);
> +
> +    tcg_temp_free_ptr(t_pg);
> +    tcg_temp_free_i32(t_desc);
> +
> +    /*
> +     * Replicate that first octaword.
> +     * The replication happens in units of 32; if the full vector size
> +     * is not a multiple of 32, the final bits are zeroed.
> +     */
> +    doff = vec_full_reg_offset(s, zt);

Similarly in do_ldrq() this variable is named "dofs".

> +    vsz_r32 = QEMU_ALIGN_DOWN(vsz, 32);
> +    if (vsz >= 64) {
> +        tcg_gen_gvec_dup_mem(5, doff + 32, doff, vsz_r32 - 32, vsz - 32);
> +    } else if (vsz > vsz_r32) {
> +        /* Nop move, with side effect of clearing the tail. */
> +        tcg_gen_gvec_mov(MO_64, doff, doff, vsz_r32, vsz);
> +    }
> +}
> +

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

