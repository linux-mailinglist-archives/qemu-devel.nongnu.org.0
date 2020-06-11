Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2F61F6C5B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 18:49:19 +0200 (CEST)
Received: from localhost ([::1]:59580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjQOE-0004aD-IA
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 12:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjQL8-0001Iy-I9
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 12:46:06 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:44055)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjQL6-0003PU-Jj
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 12:46:06 -0400
Received: by mail-pf1-x444.google.com with SMTP id 64so2900930pfv.11
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 09:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=YJqzyYWnUHVekweupt/NqEBdOYNCkIHVXtWmiR0uVIo=;
 b=vkkBPKidzdQ1pc3aTqSL7Yqo4rSeODaj1AswlMpYGxzLgjXVssD+fA6IryLuo66ocz
 DYfE+/eoch3bXWc/5m5n7oD8fSlihc/+HauMbNDYXJeORA0eAivnXvzSQccLHawCo+IT
 +YLmFLzlRcFDuivaYAHf1vj/KnhjvlTwLqR9BzObSnufhh7UBpTkT74ZB73c0Lqe8XC2
 3Wg6CpRf+Yr00y7jY7ARwx+1TkSczewyP8McaVkU/gK+3BghrUBc5rzenuQMFfJp72rJ
 gSiLVfpbQIWw2o0kzGK34P5qMqrSaKvnJZT3x3EnQPaJn/adgsgdfIff9cuEZy4ncahr
 O2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YJqzyYWnUHVekweupt/NqEBdOYNCkIHVXtWmiR0uVIo=;
 b=F9HTTgNKlcdzBNLsfzz26NgZ8ZWMOMrnYL5MxWwR7D4+/aNVEvw3dnuy4aGT1ny/eI
 UUM357+TxVm9k84+2/orG3vk9zoi/mFHWpE9jI/CRm7MFqol7LLYef98OwUI954qh2gS
 5tXnEbz+dW70/iu4AImy5wL/KNGjJj8aKrQAV5JS3ojSv4qZYKXh3L/iZ3fF6sjkayj4
 mdrPcwly7DFeAu3hlq/o4G00ow5gwmtmk4r4xjjrvyoiW8YL9QQCahxB8qAO34bkTbSP
 l9pI0wzYHRejVZiYp4B1lVrKGv+MGFyCcpQgYCZYkw2UypZKXP2FZASupKQILBrS5wcv
 ptPg==
X-Gm-Message-State: AOAM5332s6kHRxMq1prUBTOAMAmx1QDip4Jmx0Oe7VMP//fk/Q3tjJPT
 REaI03GTBoGaLpZZaBos0fhyJCQs3QM=
X-Google-Smtp-Source: ABdhPJwyYLurVWYvE7NlEazAk7eoYdh00exxfMnvGL4dHxBMth82iWn1Apjj9fcycTES9Y+65i1CRQ==
X-Received: by 2002:a63:b252:: with SMTP id t18mr7439760pgo.133.1591893953164; 
 Thu, 11 Jun 2020 09:45:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id v129sm3629236pfv.18.2020.06.11.09.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 09:45:52 -0700 (PDT)
Subject: Re: [PATCH 09/10] target/arm: Convert Neon VTBL, VTBX to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200611144529.8873-1-peter.maydell@linaro.org>
 <20200611144529.8873-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e7b0959-0f0f-d523-cd1d-87bcd50c9628@linaro.org>
Date: Thu, 11 Jun 2020 09:45:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611144529.8873-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

On 6/11/20 7:45 AM, Peter Maydell wrote:
> +static bool trans_VTBL(DisasContext *s, arg_VTBL *a)
> +{
> +    int n;
> +    TCGv_i32 tmp, tmp2, tmp3, tmp4;
> +    TCGv_ptr ptr1;
> +
> +    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
> +        return false;
> +    }
> +
> +    /* UNDEF accesses to D16-D31 if they don't exist. */
> +    if (!dc_isar_feature(aa32_simd_r32, s) &&
> +        ((a->vd | a->vn | a->vm) & 0x10)) {
> +        return false;
> +    }
> +
> +    if (!vfp_access_check(s)) {
> +        return true;
> +    }
> +
> +    n = a->len + 1;
> +    if ((a->vn + n) > 32) {
> +        /*
> +         * This is UNPREDICTABLE; we choose to UNDEF to avoid the
> +         * helper function running off the end of the register file.
> +         */
> +        return 1;
> +    }

Oops, meant to point out: return false.


r~

