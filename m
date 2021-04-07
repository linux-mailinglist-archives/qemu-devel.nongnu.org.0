Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39464356170
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 04:38:25 +0200 (CEST)
Received: from localhost ([::1]:58082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTy5H-00082u-Sq
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 22:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTy4H-0007Zj-8Q
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 22:37:21 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTy4F-0004u8-Jq
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 22:37:20 -0400
Received: by mail-pf1-x435.google.com with SMTP id c204so8086474pfc.4
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 19:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3dIN6m9df5pZMa/+DOcrwQzhmeN6PMyAZ0wDFGU1v/4=;
 b=qI7nhi42ry2arYoQLD5dJ3HrRfqbNICP7z5uGgZqjB5fbt/iIAEYc+m+e4URhiGZka
 xFliqo9zUFpgU4dCWw5LEeEvI65VZnsZTlyGBHwfJf3somUnMEuDR6OTLMX5n7AN/v1i
 ENRlZfd2D3BazQpD+de6VwMdexgbQ4GplgjzK5j7D1gGOoK+xv9hWqGH2C/l2shj1nBN
 LNn7KIQOu03go20KL+GMJcTrCLc+jUUF4AoncWbCq7WMQUzDHg+sUjdPH3maSPsiessr
 KJ4kH8MW0Y2b0BtPas27dX86zXOSD88focx4PeUYyf+BzEIwCU/j0y50eC+/mfHQdQDQ
 6eOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3dIN6m9df5pZMa/+DOcrwQzhmeN6PMyAZ0wDFGU1v/4=;
 b=S37X7ePC+u/m1gOlDgyGYYFDs3f9tpYUunRE38Jn4TSTYuYhKBRSy6DfHH+nAO3kyO
 Fp9QtVpIthBZWaIIqBTtgfsup9XT0tXMzvcPxcotdq2trL/gU88NV5EEq00jQ08oEREu
 ZSDE3U28KjjlaGOoANJkawWFPHdr5dvfPl/QanW2phOJmKjJsMmrZWBkfPhXXhb6/2Or
 QTtidKNKwpo8ivB2z6mva9YQfcTp1IzxMGlnfDUmv6NBopjTGP+QkGCzfqjtpFddtkTx
 p++W8Lip55AoFWYFagB6W6igct8AV689vjn2A5p7MGTfKRLZVcqP4CZ2NFvwuX9XCVJf
 b06w==
X-Gm-Message-State: AOAM533bRJYsI8cK3lzR3Dqf4AkmW/hD0FWQ60SDoeFJTlNM6/DZU2Zj
 miAgd1KxFWdZWNVtMFjKVn7cVA==
X-Google-Smtp-Source: ABdhPJyp1dZeiIpJ9eP+KapY9xwCNllzsFcmWcf2ot9HNSsHr9g0v8tS+Hy9+KN6hlRCAmEEPqWJ+A==
X-Received: by 2002:aa7:818e:0:b029:215:2466:3994 with SMTP id
 g14-20020aa7818e0000b029021524663994mr972700pfi.48.1617763037869; 
 Tue, 06 Apr 2021 19:37:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m1sm3454222pjk.24.2021.04.06.19.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 19:37:17 -0700 (PDT)
Subject: Re: [PATCH 04/27] arc: TCG and decoder glue code and helpers
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-5-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2df509f0-6c53-24cb-92ac-096e5685a0b7@linaro.org>
Date: Tue, 6 Apr 2021 19:37:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-5-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> +static inline target_ulong
> +carry_add_flag(target_ulong dest, target_ulong b, target_ulong c, uint8_t size)
> +{
> +    target_ulong t1, t2, t3;
> +
> +    t1 = b & c;
> +    t2 = b & (~dest);
> +    t3 = c & (~dest);
> +    t1 = t1 | t2 | t3;
> +    return (t1 >> (size - 1)) & 1;
> +}
> +
> +target_ulong helper_carry_add_flag(target_ulong dest, target_ulong b,
> +                                   target_ulong c) {
> +    return carry_add_flag(dest, b, c, TARGET_LONG_BITS);
> +}
> +
> +static inline target_ulong
> +overflow_add_flag(target_ulong dest, target_ulong b, target_ulong c,
> +                  uint8_t size)
> +{
> +    dest >>= (size - 1);
> +    b >>= (size - 1);
> +    c >>= (size - 1);
> +    if ((dest == 0 && b == 1 && c == 1)
> +        || (dest == 1 && b == 0 && c == 0)) {
> +        return 1;
> +    } else {
> +        return 0;
> +    }
> +}
> +target_ulong helper_overflow_add_flag(target_ulong dest, target_ulong b,
> +                                      target_ulong c) {
> +    return overflow_add_flag(dest, b, c, TARGET_LONG_BITS);
> +}
> +
> +static inline target_ulong
> +overflow_sub_flag(target_ulong dest, target_ulong b, target_ulong c,
> +                  uint8_t size)
> +{
> +    dest >>= (size - 1);
> +    b >>= (size - 1);
> +    c >>= (size - 1);
> +    if ((dest == 1 && b == 0 && c == 1)
> +        || (dest == 0 && b == 1 && c == 0)) {
> +        return 1;
> +    } else {
> +        return 0;
> +    }
> +}
> +target_ulong helper_overflow_sub_flag(target_ulong dest, target_ulong b,
> +                                      target_ulong c) {
> +    return overflow_sub_flag(dest, b, c, TARGET_LONG_BITS);
> +}
> +
> +target_ulong helper_repl_mask(target_ulong dest, target_ulong src,
> +                              target_ulong mask)
> +{
> +    target_ulong ret = dest & (~mask);
> +    ret |= (src & mask);
> +
> +    return ret;
> +}
> +
> +target_ulong helper_mpymu(CPUARCState *env, target_ulong b, target_ulong c)
> +{
> +    uint64_t _b = (uint64_t) b;
> +    uint64_t _c = (uint64_t) c;
> +
> +    return (uint32_t) ((_b * _c) >> 32);
> +}
> +
> +target_ulong helper_mpym(CPUARCState *env, target_ulong b, target_ulong c)
> +{
> +    int64_t _b = (int64_t) ((int32_t) b);
> +    int64_t _c = (int64_t) ((int32_t) c);
> +
> +    /*
> +     * fprintf(stderr, "B = 0x%llx, C = 0x%llx, result = 0x%llx\n",
> +     *         _b, _c, _b * _c);
> +     */
> +    return (_b * _c) >> 32;
> +}

All completely trivial in tcg:

   tcg_gen_add2_tl,
   tcg_gen_mulu2_tl,
   tcg_gen_muls2_tl.

and simple arithmetic for overflow -- see gen_add_CC in arm/translate.c.


r~

