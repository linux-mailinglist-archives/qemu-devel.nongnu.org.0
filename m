Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F6E433E4D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 20:18:57 +0200 (CEST)
Received: from localhost ([::1]:59418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcthQ-0000lZ-DT
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 14:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcte2-0007u6-Jd
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 14:15:26 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcte0-0007QV-OZ
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 14:15:26 -0400
Received: by mail-pl1-x629.google.com with SMTP id g5so14276193plg.1
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 11:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tKtw1luCR8dSI1/pd7ZoPa/fHQaXWEMaBGh/9sEqzZg=;
 b=VB9q/b6LO8w6YrW9CGCMY0wc3U0HHmA00b5K+z1ees7LLQzUcrGsndZC1SbloxjS6q
 0k+8cGRRWa4fNnF9S5TPsvIbpEU8RNNRjW/zYowWedKISMC6V0FPF3YJ13R8fvITM1BU
 4hxhz4dwWWSYs9xKn6PGTjDo5tKxFICOVryAKe0KZfNunSrg7l7APxpDgcJH6e9WfWM1
 jk5IDubxkjXzD/JOj8yDu2V35Vn9dMX8pveFABYO0qw7Lrh+YAskESQbbnrzu3U7BqmB
 oRTHoLPmdtHBN/p9H4P0dhRkM57BwesheFBJ3dJmCXi9263VLCk+ODislXE3yjnoUTAt
 7xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tKtw1luCR8dSI1/pd7ZoPa/fHQaXWEMaBGh/9sEqzZg=;
 b=bQ5i6qx482m3AfUe+x5Bc3iQjfOzTrSgFp35FwJZCK2FhjgwkVa9e73ukit6a6DByZ
 3+WJZ3jOUvjDrr05xNWu5j1GAWi6wEFbJljahTtTM7wKNKF1ZUnSXOcF2K9gmFQsJmqj
 g4mH9CJnaHc1k08sCxH3kMR+BbyLrvXiLFkVMiF3+5PukWhhz8DURKG3irLleVBQ7LDU
 b1ADZfazKsXLQFxDruSVVCiN0Kzjco8wSPJBU30mNl74p8r13B+J5uaiTSVJqXdi5EKn
 u3Gf5zZSbTup8Pa+lWk8bTL0T8Wa1uGYrZeJAfXNrnraFi1ltGfyEPK5vYZNznj8CXjd
 bL1g==
X-Gm-Message-State: AOAM532mryhkZ3O9Y4pQfYZG6PPQyyOJO6RN/w8dEZuyHhXbtBzmwhmS
 3qyHOWk7mgfRHyAz/7qfCDOkQQ==
X-Google-Smtp-Source: ABdhPJwTPq4RGfzg6U/f5C4xyR3EU1ryOwYQQ78OtowOyqKK8kFu1eF4WNgolpwwPmM3g7LLMlqWGg==
X-Received: by 2002:a17:903:32cf:b0:13f:d59:7a4c with SMTP id
 i15-20020a17090332cf00b0013f0d597a4cmr34885202plr.78.1634667322333; 
 Tue, 19 Oct 2021 11:15:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id f15sm16881675pfq.193.2021.10.19.11.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 11:15:21 -0700 (PDT)
Subject: Re: [PATCH v3 03/21] Int128.h: addition of a few 128-bit operations
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-4-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3f382c4-5799-4dad-43d9-d07b5a46efcc@linaro.org>
Date: Tue, 19 Oct 2021 11:15:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-4-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 2:47 AM, Frédéric Pétrot wrote:
> +static inline void divrem128(uint64_t ul, uint64_t uh,
> +                             uint64_t vl, uint64_t vh,
> +                             uint64_t *ql, uint64_t *qh,
> +                             uint64_t *rl, uint64_t *rh)

I think we should move all of the division implementation out of the header; this is 
really much too large to inline.

I think util/int128.c would be a reasonable place.

That said, why are you splitting the Int128 apart to pass as pieces here?  Seems like 
passing the Int128 and doing the split inside would make more sense.

> +        /* never happens, but makes gcc shy */
> +        n = 0;

Then g_assert_not_reached(), or change the previous if to an assert.

Hmm, it's not "never happens" so much as "divide by zero".
Please update the comment accordingly.

> +        if (r != NULL) {
> +            r[0] = k;
> +        }

r is a local array; useless check for null.

> +        s = clz32(v[n - 1]); /* 0 <= s <= 32 */
> +        if (s != 0) {
> +            for (i = n - 1; i > 0; i--) {
> +                vn[i] = ((v[i] << s) | (v[i - 1] >> (32 - s)));
> +            }
> +            vn[0] = v[0] << s;
> +
> +            un[m] = u[m - 1] >> (32 - s);
> +            for (i = m - 1; i > 0; i--) {
> +                un[i] = (u[i] << s) | (u[i - 1] >> (32 - s));
> +            }
> +            un[0] = u[0] << s;

Why are you shifting the 128-bit value in 4 parts, rather than letting int128_lshift do 
the job?


r~

