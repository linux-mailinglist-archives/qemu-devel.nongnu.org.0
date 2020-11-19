Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11962B9C8B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 22:11:11 +0100 (CET)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfrCw-0004qY-SP
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 16:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfr8w-0000eR-Az
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:07:07 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfr8t-0003XU-6c
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:07:02 -0500
Received: by mail-pf1-x42e.google.com with SMTP id w14so5685336pfd.7
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UDnKv70mEcOhhHuHyK23iNhbXNJ/iC7P3ksp9aZBr4E=;
 b=EL4o3pt3KA8zPq7yrifcJEDFu/q8+BzWENVzdFyXp0KEo3QEBij4UvDNk8iUj+ZeZ8
 125QHu6wU1MTF8Rul/Jp8Kifttg4vcr6388ece0gO1BrIM97wCSPqTFwYE56culFiZzn
 P3THIF2fEpYxVkwSXjFyUhUZ3AoMkHZRrEV1Asy8ae0pVBy1rvXshn9rzkFHXHyJggE5
 SXtF2fRHS4jmdp9MpAXxV4tR1W0ehGzOMaVk5wsSTMm9wtS5R0WhIhO8gchB8DXvx/VQ
 CF8wUseGQWHUmzMR5J21zmjaW2ziMVZkFQHYLRW8eqfCqxI3KYmNOw48TbeY3iZDvRTJ
 I50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UDnKv70mEcOhhHuHyK23iNhbXNJ/iC7P3ksp9aZBr4E=;
 b=CT2R11jChiPYGcsg/tH10jxM3n6K7zrc1J0A1wr49j8Z2miQW6TOEYUPyNFrVWLFFQ
 Y1C3uis3HVKUPoOuTvcioBTjWZTbkQZMUU9Fqc4zqQAAOI2xP+v7Ok2i+MDwN6w7kVq+
 1zSBWwCj5AkzpoSKOwSxwvImA+G+0JTgwKjumg0fmeaAzPKDVrfc9GXGQxXX7UyB5iDQ
 6R6a5OPSF+OKNBRZHMZgb8YFPDRtRWWewFqzlrfD93BZUbVjTDcqjk0/kmHfPDD7nCRS
 shczi0PdetyNwg5lM73ZgCv0QrNDrs1f7zsT8+oKG2/0AYmMeW42GUUFeP3qK84s+FEV
 V11Q==
X-Gm-Message-State: AOAM53073i2f7115M/XwovU+eJRO7E8f+VlnX1riDR9rEE9oBRMMFmEL
 S0z3t0vu1+kRMvLEdZ1IGpEVLw==
X-Google-Smtp-Source: ABdhPJzkWQGWKjZHRJ6PbI+RrI8x1irkzJRnrv6hAgg7+2+hKBnobzWru8fKHdzllPq+PfFTh3unJg==
X-Received: by 2002:a63:389:: with SMTP id 131mr14415892pgd.128.1605820017845; 
 Thu, 19 Nov 2020 13:06:57 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 23sm802330pfx.210.2020.11.19.13.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 13:06:57 -0800 (PST)
Subject: Re: [RFC 10/15] target/riscv: rvb: rotate (left/right)
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-11-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52287c37-f10c-a64e-1265-1abfcc39d77e@linaro.org>
Date: Thu, 19 Nov 2020 13:06:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-11-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +static bool trans_rori(DisasContext *ctx, arg_rori *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +
> +    if (a->shamt >= TARGET_LONG_BITS) {
> +        return false;
> +    }
> +
> +    return gen_arith_shamt_tl(ctx, a, &tcg_gen_rotr_tl);
> +}

We most definitely want to use tcg_gen_rotri_tl here, as we have special
expansions of constant shifts for hosts without rotate (e.g. riscv64g ;-).

Otherwise, this patch should be included in the shift cleanup discussed upthread.


r~

