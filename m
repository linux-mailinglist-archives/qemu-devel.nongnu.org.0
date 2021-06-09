Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3993A1ECD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 23:17:46 +0200 (CEST)
Received: from localhost ([::1]:44168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr5a5-0000m7-LQ
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 17:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr5ZH-0008WK-Tq
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 17:16:55 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr5ZG-0006f1-6e
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 17:16:55 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 d5-20020a17090ab305b02901675357c371so2425261pjr.1
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 14:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=wCopy6qcS1sllWPy+KRQdfSY+b2fOO5dY6RZ2zVsTMA=;
 b=lwc3YnHH/Sxfl6upnBsR8J0MOPV9AyPoN/bVLflEhD4Doj7EsJyxRJuDm5PqyR/7B8
 4QcjbfbhZAKbtUKCIJ5Q3oTQjrIiQKA4VpdTeALLtxqoO4vC/oRsXhMubSLQULRF9pui
 GcnY7SWLTtli2iSve/eBh8+sGvb5SVlv6NQsnrrpwKKLH+P/sM9H1K7+QD/3bYy4fAZR
 I2C5cJUT/X1cPYTbvvmzDN1ReG9pqTzYmNz6o96CFH0KVPCebmUKUcLpSyqL44BqayTN
 J39/nt1loMxtU8HxoAhW/nm3tdFjHSPGjPHpx5dREtiOxaYknno3eX2MTPKH93oxRU5O
 ozVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wCopy6qcS1sllWPy+KRQdfSY+b2fOO5dY6RZ2zVsTMA=;
 b=kk7Bktlcw/biN+avuz0CAhggwISD2zdzGag0YsMyCV3a2PdJs0kcjVtztENoRxtZZa
 au38llIGYNL6rrEenHdD3mbzOh0MSQ4GbswE9AlziSLGKOeveKUnlTUYkURd1WqMBKkh
 oMipN4pxkjrD9yrsEbfEAJRwCYcGDT+gZc/H+m3r5MGCOK71wZFxWZ/NH80XEQrKpRgN
 WSeAP72c/cXGGlANhN6Ivt8LLiAz5C5Me5+mhr7+/U18mWGd/1ECGKCjzLj1qc67AE0b
 pwAgyoN1EdJVM5j6zArGwP3FeDpFpof7ln6Wo3UENJ3w5oJRF567Mc1LVIfrQqIF6R+H
 Iddg==
X-Gm-Message-State: AOAM532rYyxFTNm1uQOPEFV9Ws2OA5H0EJDReBekogKnA2hWViU8/TsN
 u8x83XZRdMgJG6MIKHhQrjqD6PCwzDuP0g==
X-Google-Smtp-Source: ABdhPJwvAY/ZGMY9hfcftOP1k/oafIwWd58A6Yekt7H5f6RXi0yPlIAN4E53WdXqfXyAowFYZTduBA==
X-Received: by 2002:a17:902:d4d0:b029:113:fb3d:3644 with SMTP id
 o16-20020a170902d4d0b0290113fb3d3644mr1559395plg.58.1623273412215; 
 Wed, 09 Jun 2021 14:16:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 g63sm414129pfb.55.2021.06.09.14.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 14:16:51 -0700 (PDT)
Subject: Re: [PATCH 52/55] target/arm: Implement MVE VCADD
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-53-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <86d3ce3f-0bc7-4f71-c4a1-18f2ed3f15d5@linaro.org>
Date: Wed, 9 Jun 2021 14:16:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-53-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:58 AM, Peter Maydell wrote:
> +#define DO_VCADD(OP, ESIZE, TYPE, H, FN0, FN1)                          \
> +    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn, void *vm) \
> +    {                                                                   \
> +        TYPE *d = vd, *n = vn, *m = vm;                                 \
> +        uint16_t mask = mve_element_mask(env);                          \
> +        unsigned e;                                                     \
> +        TYPE r[16 / ESIZE];                                             \
> +        /* Calculate all results first to avoid overwriting inputs */   \
> +        for (e = 0; e < 16 / ESIZE; e++) {                              \
> +            if (!(e & 1)) {                                             \
> +                r[e] = FN0(n[H(e)], m[H(e + 1)]);                       \
> +            } else {                                                    \
> +                r[e] = FN1(n[H(e)], m[H(e - 1)]);                       \
> +            }                                                           \
> +        }                                                               \
> +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
> +            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
> +            d[H(e)] &= ~bytemask;                                       \
> +            d[H(e)] |= (r[e] & bytemask);                               \
> +        }                                                               \
> +        mve_advance_vpt(env);                                           \
> +    }

I guess this is ok. You could unroll the loop once, so that you compute only 
even+odd results before writeback.

> +/*
> + * VCADD Qd == Qm at size MO_32 is UNPREDICTABLE; we choose not to diagnose
> + * so we can reuse the DO_2OP macro. (Our implementation calculates the
> + * "expected" results in this case.)
> + */
You've done this elsewhere, though.

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

