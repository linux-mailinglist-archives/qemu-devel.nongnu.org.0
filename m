Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9D36D55A7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 02:49:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjUqd-000388-3c; Mon, 03 Apr 2023 20:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjUqY-00036O-3E
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 20:48:27 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjUq3-0000ej-0P
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 20:48:25 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ml21so6958372pjb.4
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 17:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680569273;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RDqXbtWUx6DUKQdRj4sITob2V/VEoH41+mMTM8PMSM8=;
 b=bm6FA6icUeoId8qgueKQLq+r03gaiu13Si4LSm8WixsyrxxaZ+jOrfddEraaZUOIVT
 IeQou8f/bzAowjdr6WqXGjMDq1LO11Qfkik6zEZTuc2E+baixcNfES6A6HKiDXDhgjxB
 u+W4qAonzC57AT3gjiwf6yZAx5867YnYZsPRDDx85ME9+ZnyYRwfSmrlm0FGsj+7u4iZ
 8o7zppDgB1YuUaKlAUWRGssaTmpos1PABKsm4gLv1iDbBcChTLY8F5yZUJKuxXv3EL/2
 xZWep4hJIMzhdEWL+hEKm3XfXStaRvrZzGjAs9rgWKNIc528Av4HF+LsLlRI1ishQJXr
 6TzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680569273;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RDqXbtWUx6DUKQdRj4sITob2V/VEoH41+mMTM8PMSM8=;
 b=7G1JwQP1GaQtVkfZNo6lIhLTyUM6EHxIxKl7JBF+l/AeupGhJE1vIWWU4xbg2wZleY
 HYV+ZXusidUlZIR6bc4vmHlibLfVmxo70VTAFmXStJnLATHYqt0kDQ42katLzkZVBpk1
 tb2qvi9OXano+FFMwPWTnyAE7bXDH6juDC23DxNr1xM+SfKIynF1fQOmDe7hCFbZJMH0
 RUYKVR1w1TBAmg2dWJvD5F0B+7XpcETePgMmLn9w/zgSo7SX1sWZdxtSKoJ0b3SM/ltN
 N6+/TpLZyJZjaczoaoeFPCba2wDI1xdXW/XSVcnZIzfBGqPPMmi+4KXvv9qKSt55vK85
 Auzg==
X-Gm-Message-State: AAQBX9dKcptSYWvJ/58QBz8SyLyjTPlEVUVOHZ1WoEFTvzy3WCBjG3y5
 LxW9Lin4hvZhk/S4sXPkwllHnA==
X-Google-Smtp-Source: AKy350btGF3SJKoQJd6JL8kurN/cYeKUxoHv86bVkDu/KTyXtkYWvWA3upE77bsRp5i4byVuHjympw==
X-Received: by 2002:a17:902:c406:b0:1a2:6f9f:de16 with SMTP id
 k6-20020a170902c40600b001a26f9fde16mr958427plk.11.1680569273004; 
 Mon, 03 Apr 2023 17:47:53 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a170902b21400b0019e88453492sm7261049plr.4.2023.04.03.17.47.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 17:47:52 -0700 (PDT)
Message-ID: <747fd4cf-93c2-db25-2963-f79335034817@linaro.org>
Date: Mon, 3 Apr 2023 17:47:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 37/44] target/loongarch: Implement vfcmp
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-38-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-38-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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
> +static uint64_t vfcmp_common(CPULoongArchState *env,
> +                             FloatRelation cmp, uint32_t flags)
> +{
> +    bool ret;
> +
> +    switch (cmp) {
> +    case float_relation_less:
> +        ret = (flags & FCMP_LT);
> +        break;
> +    case float_relation_equal:
> +        ret = (flags & FCMP_EQ);
> +        break;
> +    case float_relation_greater:
> +        ret = (flags & FCMP_GT);
> +        break;
> +    case float_relation_unordered:
> +        ret = (flags & FCMP_UN);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    return ret;
> +}

Either change the return type to bool, or return {0, -1} here...

> +
> +#define VFCMP(NAME, BIT, T, E, FN)                                       \
> +void HELPER(NAME)(CPULoongArchState *env,                                \
> +                  uint32_t vd, uint32_t vj, uint32_t vk, uint32_t flags) \
> +{                                                                        \
> +    int i;                                                               \
> +    VReg t;                                                              \
> +    VReg *Vd = &(env->fpr[vd].vreg);                                     \
> +    VReg *Vj = &(env->fpr[vj].vreg);                                     \
> +    VReg *Vk = &(env->fpr[vk].vreg);                                     \
> +                                                                         \
> +    vec_clear_cause(env);                                                \
> +    for (i = 0; i < LSX_LEN/BIT ; i++) {                                 \
> +        FloatRelation cmp;                                               \
> +        cmp = FN(Vj->E(i), Vk->E(i), &env->fp_status);                   \
> +        t.E(i) = (vfcmp_common(env, cmp, flags)) ? -1 : 0;               \

... and avoid the extra conditional here.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

