Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674FF36CA09
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:06:17 +0200 (CEST)
Received: from localhost ([::1]:40812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRA7-0007oN-Uj
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbR7r-0007GY-P4
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:03:55 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbR7n-0003hh-2O
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:03:55 -0400
Received: by mail-pf1-x42c.google.com with SMTP id d124so41778277pfa.13
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 10:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9xvfK/EfOMBgZyRLhIRA54nxYE0bmG2l8H5KcMCGR+4=;
 b=JEIbbzPUZ/sbIBTYgq2sHsNBpJakyz4K/QBmZlSGYeLwqrM+3aX+yeTUyDyMsT0JIq
 Biio1sVU9Nk0qreDATt+VbT1u6F6QR/4iwwmM03YGGNk2Y0aBuOtNBn0iogKp4rVeCjZ
 5T/uhVJjTv9KZKOYvmFqqFJJtFyO0pYuRzIQs7ZrA0d7LneMFOcTkeic0fVX6Z2fDCRN
 Dk2tgX/shE4j1GFMSIcSJZX0zQRVlFuv+DdZeRkXjFwLafBNsZqiMj0GFbOkws9p/NIN
 eT4supGTFCYTKL/lG8miWQGhHDXRPWXthv9sA5h25mOwbh3/dY3uZ+VxdDFBJx+6C8xA
 FK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9xvfK/EfOMBgZyRLhIRA54nxYE0bmG2l8H5KcMCGR+4=;
 b=sfTJCgN4aSEMD39xjEAlRvQVlddOfHUvDZVXHbA0+dsqh7m04GrtbvzCRdzGDXuBXk
 zkJUD9NrvuVTL7bCIYYEYgfFBf55EuwWmr6459ueRoXCX4gyIrysZ+NKGA8OX56G3PrY
 l/6VJhiIlH4nk8qbHp54FlUyFYMdGFhSX3MJXjgxkBBwkWLhaoWt8HCT2oMU1Ax2wET0
 W4e/qiHA3cLhDHsC4VBi8g+UuyXKN/Wt/8pmgFuwNvW7mQhCqX5AUBF1tklHlnzjpe/a
 /sR+s2Z69ChUYIdDzRbiDNXupvbKuedXpDoYB8zrD5uXa58kpHMR0mRIt6LX+BjPkxun
 NqHg==
X-Gm-Message-State: AOAM531Sr/FqO7ZYz0/kv/f3NcELlO0TaCAb/pogujWHYe+gexus+yug
 K3qMnlvSW2SzCi/T5F5t9ZUgPdHGrCXc8g==
X-Google-Smtp-Source: ABdhPJx64Aj1bKfkRa8DNlbSiCO0jpGv0EY5omDm+5c5uOpiTDRhddxzuAuX5/3rHeE3Hh/5oNTNtw==
X-Received: by 2002:a62:1c0f:0:b029:25f:ba3c:9cc0 with SMTP id
 c15-20020a621c0f0000b029025fba3c9cc0mr23353458pfc.56.1619543029219; 
 Tue, 27 Apr 2021 10:03:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm3090598pfa.108.2021.04.27.10.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 10:03:48 -0700 (PDT)
Subject: Re: [PATCH 07/13] target/arm: Make functions used by translate-vfp
 global
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3d25f34-7258-e821-4265-5844d74abfe6@linaro.org>
Date: Tue, 27 Apr 2021 10:03:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

On 4/13/21 9:07 AM, Peter Maydell wrote:
> +static inline void gen_set_condexec(DisasContext *s)
> +{
> +    if (s->condexec_mask) {
> +        uint32_t val = (s->condexec_cond << 4) | (s->condexec_mask >> 1);
> +        TCGv_i32 tmp = tcg_temp_new_i32();
> +        tcg_gen_movi_i32(tmp, val);
> +        store_cpu_field(tmp, condexec_bits);
> +    }
> +}
> +
> +static inline void gen_set_cpsr(TCGv_i32 var, uint32_t mask)
> +{
> +    TCGv_i32 tmp_mask = tcg_const_i32(mask);
> +    gen_helper_cpsr_write(cpu_env, var, tmp_mask);
> +    tcg_temp_free_i32(tmp_mask);
> +}

So.. these were marked inline originally, but I don't see why they should be. 
I think you should put declarations here.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

