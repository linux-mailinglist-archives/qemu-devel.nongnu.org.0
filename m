Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13847400EC5
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 11:11:17 +0200 (CEST)
Received: from localhost ([::1]:43256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMoBI-000596-5K
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 05:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMo8w-0004DV-Fx
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:08:50 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMo8u-0008OY-ES
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:08:49 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so2701136wmi.0
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 02:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P2xXebk1rvT5PvgkHLdFyCDDBDeinfR/I+NwA9R5o6Q=;
 b=i4hHu2wmvgGtuqRVoMV9bUsFDVnp/FhMdGSdWQ+MF0/8ejOXjlMhgyMBvdR5TPhD1q
 BuI0z0njA8y8sxvH+2w6NTJjWf4vnOSvkTQYaDT/+JxxKZr/Y7BbQlwdKAa2H2Tpy+63
 55M2kEtj8ckcrJwLxEcl2VgC2VO2q+tQgoehKpj5sWyosAmjj6QcSnFWCvLbbRcdrg+O
 l3pcSqvuG4PTJdJA+Z+ybTGDWsJV/yvb/BxVP+6AogqkvJc0c1I/Ld8dZ6TiI4kF0J9l
 Obpz+Ns7VTZWx83Z0+bnRSyyTYtxXC+kOgLxYcwr7rIKWb5uyqT1v7p8SZ+jJ/U+dHqM
 3bEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P2xXebk1rvT5PvgkHLdFyCDDBDeinfR/I+NwA9R5o6Q=;
 b=cRgJzVQDT96a3/+p+qbgXt4f3mC9RlqDmsIsPxHQZ1PO20LwHMKsMdaropkxcpldJF
 /wgTW5KVQCM+rRuESEsQTQRF8eMhMGuJ8LkRDwZS0Pw1G8BREnAd5OxdP2YQZfRa6wnD
 Hv9fPzxHuuJhNWSDntHvzJQUrecYFxCwdt0A4fk627UQWjg/19rxZRAFxjcJZsL1FhfY
 zlDvd86RCSGtSQAJXeKPq582DhopZM5u+tU1D1e61eHRePBtDL0IwuHugkV4YNTA5RTT
 GU0WN7oSXJuoRhpUrMW8v8eRKBZLunn1JfJbYbGsrBr6V0gLGxDUqbVchIO7ZieR4PG0
 3cgw==
X-Gm-Message-State: AOAM531eP5SwYImwoyrLSRFys+lGyS2Hj9hZvfpwY1En6Ponf/XTSaR/
 GYtTYhehBpRAcLFjz3kdugY1NA==
X-Google-Smtp-Source: ABdhPJwI7EqKRCX46AQST6WdHuwMpuxvW9rotzxR5Ct1zRdj4G6UZKtYvwjySZ/5OjsPrYwhHHT2Tg==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr6296868wmg.36.1630832926730; 
 Sun, 05 Sep 2021 02:08:46 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id r25sm3248010wrc.26.2021.09.05.02.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 02:08:46 -0700 (PDT)
Subject: Re: [PATCH v4 10/21] target/loongarch: Add floating point arithmetic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-11-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <028a67e7-4efc-47e4-986e-6f3d1563f6c7@linaro.org>
Date: Sun, 5 Sep 2021 11:08:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-11-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:40 PM, Song Gao wrote:
> +const FloatRoundMode ieee_rm[4] = {

Make static.

> +int ieee_ex_to_loongarch(int xcpt)

This function is only used in this file.  Better to make it static and remove the 
declaration from translate.h, which allows you to remove that include.

> +static inline void update_fcsr0(CPULoongArchState *env, uintptr_t pc)

Remove inline.

> +{
> +    int flags = ieee_ex_to_loongarch(get_float_exception_flags(
> +                                  &env->fp_status));
> +
> +    SET_FP_CAUSE(env->fcsr0, flags);
> +    if (flags) {

Hmm.  Between the two functions you're testing for zero twice.  Perhaps better to rearrange as

{
     int flags = get_float_exception_flags(&env->fp_status);

     if (!flags) {
         SET_FP_CAUSE(env->fcsr0, 0);
         return;
     }

     set_float_exception_flags(0, &env->fp_status);
     flags = ieee_ex_to_loongarch(flags);
     SET_FP_CAUSE(env->fcsr0, flags);

     if (GET_FP_ENABLE(env->fcsr0) & flags) {
         do_raise_exception(env, EXCP_FPE, pc);
     }
     UPDATE_FP_FLAGS(env->fcsr0, flags);
}

and remove the explicit zero test in ieee_ex_to_loongarch.

> +uint64_t helper_flogb_s(CPULoongArchState *env, uint64_t fj)
> +{
> +    uint64_t fd;
> +    uint32_t fp;
> +    float_status *status = &env->fp_status;
> +    FloatRoundMode old_mode = get_float_rounding_mode(status);
> +
> +    set_float_exception_flags(0, status);

Unnecessary, since the steady-state is already zero.

> +    set_float_exception_flags(get_float_exception_flags(status) &
> +                              (~float_flag_inexact), status);
> +    update_fcsr0(env, GETPC());

Hmm.  Worth adding a parameter to update_fcsr0, a mask to suppress?  Or a common 
subroutine like

     update_fcsr0_mask(env, GETPC(), float_flag_inexact);

static void update_fcsr0(env, ra)
{
     update_fcsr0_mask(env, ra, 0);
}

> +static bool trans_fcopysign_s(DisasContext *ctx, arg_fmt_fdfjfk *a)
> +{
> +    tcg_gen_deposit_i64(cpu_fpr[a->fd], cpu_fpr[a->fk], cpu_fpr[a->fj], 0, 31);
> +    return true;
> +}
> +
> +static bool trans_fcopysign_d(DisasContext *ctx, arg_fmt_fdfjfk *a)
> +{
> +    tcg_gen_deposit_i64(cpu_fpr[a->fd], cpu_fpr[a->fk], cpu_fpr[a->fj], 0, 63);
> +    return true;
> +}

For what it's worth, you could treat the abs and neg instructions similarly, inline.


r~

