Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3D3457C3F
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 08:44:43 +0100 (CET)
Received: from localhost ([::1]:39160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moL3B-0001qW-SF
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 02:44:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moL1R-0000QY-Ix
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 02:42:53 -0500
Received: from [2a00:1450:4864:20::334] (port=54229
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moL1P-0005VD-Oo
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 02:42:53 -0500
Received: by mail-wm1-x334.google.com with SMTP id y196so10463957wmc.3
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 23:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WJuGnGTFyaPbWt1CZmUvQu7gq+dB1zfvIreuz+kWeG8=;
 b=Vzs4MKAZ+1Ll+hLTGi2eSszdzkohHa6q6IROMQiBBAf2tOEsK5aJqKCm3LYFb9Hi98
 X30xIKzT9JsgT+EM8tobkCXB+70f3swX3aTbF/aKvX1f1TlFZRdzk4vEvFFztOZO+doT
 c45ABslnytlG8cGm/eJ41J9/jhu9UD+35/HDXFYWeiB65Z59vQtJGEF1V3ytBcAvHQdw
 xnUkCVkNYRch98LASyLg9JswQrSjPJyefGopL1th0+Vk/dxGQYn4CC2FYiWRQooO7hVK
 9iD4gOtBeBynLNkwFj6jEwfCABrABqxYUzoXcNmf8xudfggmDtO1b75ro54h978hwYPn
 4iRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WJuGnGTFyaPbWt1CZmUvQu7gq+dB1zfvIreuz+kWeG8=;
 b=TeRcU06/XfAp4yzieFNkJ2azv3rlLQ8165lSTd+wAriBdAjdGTCECVsuRVmsJxedkr
 gPuc/0kHwCiRdsi0G6mAegTCcqkqWQr8NfKkSa64MLqe3YgO+mjaLZMJTnGiIsgZNx6v
 wISdsXhGiyCWYnwcfU0WEYvrtAaZ0NJvm6+dZjJwOEoTMPehsaV3Srht3UhqrFvj/0jj
 6e33LMTp76IZfalbQ1oAAxY9dbP/7OnAlN6ki5bDUhXxr2UooRBs+Y91sr8354C49dOk
 /nv9PLWXXFec18JsYzjogdtJyJrA1epCSus2tw2ibV9NcYSEQ7U8qMqO6hLkiDfxkhRr
 Vgow==
X-Gm-Message-State: AOAM532ZWNqeAow+VsuPLAKVW7SaTB3zfHOPd4uvImUJK6KamM2tHtqd
 I9xxvaWBLDNS0dyRvM0gj55oFg==
X-Google-Smtp-Source: ABdhPJzUnRX5snmsIkFDmxKQWMK8tukJYFXDW/Hvdefp883V7cIpiTeqdv2IlzFc+9/kgDpAYW7xKA==
X-Received: by 2002:a7b:cc11:: with SMTP id f17mr7819500wmh.122.1637394169699; 
 Fri, 19 Nov 2021 23:42:49 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id 138sm9602929wma.17.2021.11.19.23.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 23:42:49 -0800 (PST)
Subject: Re: [PATCH v11 05/26] target/loongarch: Add fixed point shift
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-6-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3ccf869-fe7c-96d5-6390-4bb9b4bba02f@linaro.org>
Date: Sat, 20 Nov 2021 08:42:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-6-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 7:13 AM, Song Gao wrote:
> +static bool gen_shift(DisasContext *ctx, arg_rr_i *a,
> +                      void(*func)(TCGv, TCGv, TCGv))
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_SIGN);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_ZERO);
> +    TCGv src2 = tcg_constant_tl(a->imm);
> +
> +    func(dest, src1, src2);
> +    gen_set_gpr(a->rd, dest, EXT_SIGN);
> +
> +    return true;
> +}

This is no longer generic; it's specific to word operations.  But there's nothing in here 
that can't be done with gen_rr_i, so I think you should remove it.

> +
> +static bool gen_shift_i(DisasContext *ctx, arg_rr_i *a,
> +                        void(*func)(TCGv, TCGv, target_long))
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +
> +    func(dest, src1, a->imm);
> +
> +    return true;
> +}

This one has dropped gen_set_gpr.

I think that your current gen_rr_i should be named gen_rri_v (variable) and this one 
should regain the DisasExtend and be named gen_rri_c (constant).

Then, in the previous,

TRANS(addi_w, gen_rri_c, EXT_NONE, EXT_SIGN, tcg_gen_addi_tl)
TRANS(addi_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_addi_tl)
TRANS(andi, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_andi_tl)
TRANS(ori, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_ori_tl)
TRANS(xori, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_xori_tl)

There are a few identity tests within these tcg_gen_opi_tl functions which would be nice 
to apply.  Particularly because the canonical "nop" instruction for loongarch is "andi 
r0,r0,0".

> +TRANS(slli_w, gen_shift, tcg_gen_shl_tl)
> +TRANS(slli_d, gen_shift_i, tcg_gen_shli_tl)
> +TRANS(srli_w, gen_shift, tcg_gen_shr_tl)
> +TRANS(srli_d, gen_shift_i, tcg_gen_shri_tl)
> +TRANS(srai_d, gen_shift_i, tcg_gen_sari_tl)
> +TRANS(rotri_w, gen_shift, gen_rotr_w)
> +TRANS(rotri_d, gen_shift_i, tcg_gen_rotri_tl)

Then these become

TRANS(slli_w, gen_rri_c, EXT_NONE, EXT_SIGN, tcg_gen_shli_tl)
TRANS(slli_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_shli_tl)
TRANS(srli_w, gen_rri_c, EXT_SIGN, EXT_SIGN, tcg_gen_shri_tl)
TRANS(srli_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_shri_tl)
TRANS(srai_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_sari_tl)
TRANS(rotri_w, gen_rri_v, EXT_NONE, EXT_NONE, gen_rotr_w)
TRANS(rotri_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_rotri_tl)


r~

