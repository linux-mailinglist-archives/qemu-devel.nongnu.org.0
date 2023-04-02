Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C292C6D3598
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 07:23:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piqB2-0001Se-Qk; Sun, 02 Apr 2023 01:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piqAx-0001SD-7l
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 01:22:48 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piqAv-0000tX-6d
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 01:22:46 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so27480694pjt.5
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 22:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680412963;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1sSiDyXoimocMbYxgorSuCG3917TufqXbYQbSjwQG0o=;
 b=IMGoz8ba2cn1euAfYDc4aAui5RNz0jhlsgSv6lt1Jhi0biUNmMvqx8paARfOmIbpwT
 KVSlSbdPKSQArZj0uUtN8nCGAjgPkRMySjBXa7sbYT//SN0sQXaBScwEawtzrrMht3+0
 R9x0t9RmCJqxj5BoikGEsK9t493mBKig3XKv169gy5u+HMsGaLJSSAyCVir0Eebr/+dy
 PqpvXJpklnAFbDWdhXV7aQRv7K5WO2Eza6aQKngXUNFIwx0gldmLE3SdqqliyrpZtoTw
 YPl99xFwsDMM93X5AjtQg5F3zkWPMZTrg2l9BAUqp3b81Ji7kFZx3wxTS/0EnMzFwg60
 SL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680412963;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1sSiDyXoimocMbYxgorSuCG3917TufqXbYQbSjwQG0o=;
 b=8RM11PokR9hNlUDH25tZL+ZqRrCvVilXvb88jBfFSfLMKF64cX2l4e9sgURMeTocIG
 O6LIj1OMtKNccQoPT5PNGDYZbbUHaFrY2DF1p47ExfpYt6ieqdOZeBeXg9v38cUQ9tm1
 1AWA/95P7FnpcCYKAkwFJVosiQFT+XpVUiXULiCDbE0sii8d1y/n1iVHTzpw4sq+LiNu
 tdlIjW8ZmBN/d1PZE+WcgP94b6HV3Tj30d9nRLeO45OdQZak+iYaxn4rOCh7fE2RS1bj
 xoNsaQnb8W9lwwF/uR23SRU5qqKuQx3okHgh96lrFRwGvpmIHrKXMvRs9ffaku3rcVJ4
 86lA==
X-Gm-Message-State: AAQBX9cAt6dCmQKZfplod7jC12ZmpqN0BkQX9noO1AY7yLTT5ie2Gdbx
 j+PYq8p6bWSGB4AOZCsKMT4fQg==
X-Google-Smtp-Source: AKy350aLPeovwL8+ZvOunipC4/fQyaDxcLcQJQb9ONY+1DIAAo5jxQs9pBmcDtZCKnqifgvlEu6IvQ==
X-Received: by 2002:a17:90b:33cc:b0:237:40a5:7cb9 with SMTP id
 lk12-20020a17090b33cc00b0023740a57cb9mr36390273pjb.5.1680412963696; 
 Sat, 01 Apr 2023 22:22:43 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:f30a:3ab0:889f:f03d?
 ([2602:ae:1541:f901:f30a:3ab0:889f:f03d])
 by smtp.gmail.com with ESMTPSA id
 i21-20020a17090adc1500b0023fcece8067sm3894987pjv.2.2023.04.01.22.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 22:22:43 -0700 (PDT)
Message-ID: <6fd79c60-550d-f33b-586a-b170eceb7abb@linaro.org>
Date: Sat, 1 Apr 2023 22:22:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 35/44] target/loongarch: Implement LSX fpu fcvt
 instructions
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-36-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-36-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/27/23 20:06, Song Gao wrote:
> This patch includes:
> - VFCVT{L/H}.{S.H/D.S};
> - VFCVT.{H.S/S.D};
> - VFRINT[{RNE/RZ/RP/RM}].{S/D};
> - VFTINT[{RNE/RZ/RP/RM}].{W.S/L.D};
> - VFTINT[RZ].{WU.S/LU.D};
> - VFTINT[{RNE/RZ/RP/RM}].W.D;
> - VFTINT[{RNE/RZ/RP/RM}]{L/H}.L.S;
> - VFFINT.{S.W/D.L}[U];
> - VFFINT.S.L, VFFINT{L/H}.D.W.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   fpu/softfloat.c                             |  55 +++
>   include/fpu/softfloat.h                     |  27 ++
>   target/loongarch/disas.c                    |  56 +++
>   target/loongarch/helper.h                   |  56 +++
>   target/loongarch/insn_trans/trans_lsx.c.inc |  56 +++
>   target/loongarch/insns.decode               |  56 +++
>   target/loongarch/lsx_helper.c               | 369 ++++++++++++++++++++
>   7 files changed, 675 insertions(+)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index c7454c3eb1..79975c6b01 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -2988,6 +2988,25 @@ float64 float64_round_to_int(float64 a, float_status *s)
>       return float64_round_pack_canonical(&p, s);
>   }
>   
> +#define FRINT_RM(rm, rmode, bits)                             \
> +float ## bits float ## bits ## _round_to_int_ ## rm(          \
> +                         float ## bits a, float_status *s)    \
> +{                                                             \
> +    FloatParts64 pa;   \
> +    float ## bits ## _unpack_canonical(&pa, a, s); \
> +    parts_round_to_int(&pa, rmode, 0, s, &float64_params);    \
> +    return float ## bits ## _round_pack_canonical(&pa, s);    \
> +}
> +FRINT_RM(rne, float_round_nearest_even, 32)
> +FRINT_RM(rm,  float_round_down,         32)
> +FRINT_RM(rp,  float_round_up,           32)
> +FRINT_RM(rz,  float_round_to_zero,      32)
> +FRINT_RM(rne, float_round_nearest_even, 64)
> +FRINT_RM(rm,  float_round_down,         64)
> +FRINT_RM(rp,  float_round_up,           64)
> +FRINT_RM(rz,  float_round_to_zero,      64)
> +#undef FRINT_RM


No, you should simply swap your float_status rounding mode around the operation.
See the arm/tcg gen_set_rmode function.


r~

