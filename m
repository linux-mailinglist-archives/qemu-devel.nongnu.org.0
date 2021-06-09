Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2640B3A1D09
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 20:47:23 +0200 (CEST)
Received: from localhost ([::1]:35604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr3EX-0005Ib-NP
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 14:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3Dl-0004Qb-Tx
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:46:34 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:50727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3Dk-0001wB-7K
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:46:33 -0400
Received: by mail-pj1-x1032.google.com with SMTP id g4so1993135pjk.0
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 11:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/Uin4XqPrAz2/vNBHfGwPiaqhkIxO96IYuRI8mGtWpk=;
 b=aFNsQAuwEFATaKo/VXuzkt5Hh/xB/VN2PvT8+ov1M/tMdg7QKsGhaRBZNLilnCbust
 AIkHmV8tZvRJuBbfRvzp39emgepR31JymMMAa1Vcz9pQww+s6gCHRdZYFtLTMLDf/cKQ
 3qIMGcKyyLuYAZKKgAbh7hyZm8YRxJQo/ktd7J48ZwiQi9ApbME2GHejXMiTcz1XECum
 E3ay96OLP6xtwwcC/1ywPSGPlvavpw2LQKYdgfEhtULJMJuydvnwD34DJRffCU0EryDn
 H0MjHQsItPSxgbFTwrBZM8BJwGDP5DKvrRIjI/EoPxJKtlgGJdVW9zGjPERjKPj9siE+
 zbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Uin4XqPrAz2/vNBHfGwPiaqhkIxO96IYuRI8mGtWpk=;
 b=giEpoYRgbiNcpG4zOLiLt15I+ve5THzdV56qZJ4Lmx7IRINpfgS+yRikAy9Ul0JTOK
 tTT7BMI5FdDlWFkhDd5IkQZxawNIuNF2yySp5vOSVV+G2vS/oGH34F8sXaaiVboeFG9y
 KjWzpQrfJ7+HWiBqF6tq/NoZ5PtM+cExLS7RCpHWISNCzzs7/oMZD5OZC08/5o0aUE6s
 FXe2ggi/npq47yxYHnmld5I0LfxKyJ9CHFdWh4rf1XrTcJARizjhTYEtKL9Edl5Uuzz6
 Fu9knQK5IfNsIP+PSrWxyoJZzJibx84ZBpU9NXrbmQrzbJUntFY8DPKesK8NtL+uWR6o
 a9IQ==
X-Gm-Message-State: AOAM531ovDq048zn3Otbx6AckcE4A4F3j6HkSj1f/Xyd1xVq0eR2Th9O
 +1qyssgyofrSqMB2iZHbbg1ErH9DT9PEew==
X-Google-Smtp-Source: ABdhPJxi56YmmpJMRBPqusZbBLAAcmDjYBnDRxaC+MF98izNpTU4Nfcej50LQ4+3cYzNtsIz3DWU0Q==
X-Received: by 2002:a17:90a:f193:: with SMTP id
 bv19mr12262310pjb.86.1623264390683; 
 Wed, 09 Jun 2021 11:46:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id e2sm463954pgh.5.2021.06.09.11.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 11:46:30 -0700 (PDT)
Subject: Re: [PATCH 38/55] target/arm: Implement MVE VQADD and VQSUB
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-39-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <78b08f04-6d1c-4cd8-df76-436b9a2380d8@linaro.org>
Date: Wed, 9 Jun 2021 11:46:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-39-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
> +#define DO_2OP_SAT_SCALAR(OP, ESIZE, TYPE, H, FN)                       \
> +    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
> +                                uint32_t rm)                            \
> +    {                                                                   \
> +        TYPE *d = vd, *n = vn;                                          \
> +        TYPE m = rm;                                                    \
> +        uint16_t mask = mve_element_mask(env);                          \
> +        unsigned e;                                                     \
> +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
> +            bool sat = false;                                           \
> +            TYPE r = FN(n[H(e)], m, &sat);                              \
> +            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
> +            d[H(e)] &= ~bytemask;                                       \
> +            d[H(e)] |= (r & bytemask);                                  \
> +            if (sat && (mask & 1)) {                                    \
> +                env->vfp.qc[0] = 1;                                     \
> +            }                                                           \
> +        }                                                               \
> +        mve_advance_vpt(env);                                           \
> +    }

Perhaps slightly better as

   bool qc = false;

     qc |= sat & mask & 1;

   if (qc) {
     env->vfp.qc[0] = qc;
   }

Maybe reverse the store into &sat (set false if no saturation), and init as

     bool sat = mask & 1;

Though if you choose not to exploit this kind of conditional store, perhaps it 
would be better to fully set *s within do_sat_bhw.  That is, do not rely on 
initialization to false outside the subroutine.

Which you choose,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

