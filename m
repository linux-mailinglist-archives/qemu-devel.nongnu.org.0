Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054CE2B9CB6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 22:11:54 +0100 (CET)
Received: from localhost ([::1]:50580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfrDd-0006Q4-3N
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 16:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfr6W-00076g-Ad
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:04:32 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:44158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfr6P-0002RN-6l
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:04:32 -0500
Received: by mail-pf1-x434.google.com with SMTP id y7so5659520pfq.11
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BmOR9YJnGmLqOYKphHeQjePxwlSG50eELAbZRz5jfOQ=;
 b=Vc6/ESACnXeUYepmE7lFR4YF15K/cT7AE5pq7rtllgP1q1f/+0covg5Pq1nWOcK9Ab
 uVZIk0By/x8BZYwPuo+RDPgzisziwgkCtG9KmxiUFgRlAOJJWt3P+3NgDwJnhUGwaF73
 VMb51FlhGz5rUvoK7URXlJs+BtcNP9QUx5c30TfFpGknQKuj/H4Kj8d+FuII6CKR3Lq9
 34vnRtbHQjTptCJYzFtBwoXKb9Jr8eOSFbbtwu1qgzqlWbRn3wBylc2BGOpoSzumhCc5
 lqTDQmM27RK9d04Wq06NLs6X2eQ8Vt9z5qvwUARvq80mUmLbSueJqHLjo8yVwhnVTA8j
 yVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BmOR9YJnGmLqOYKphHeQjePxwlSG50eELAbZRz5jfOQ=;
 b=BWLtOWqE5Wq8H2dJoLHw188sSqTbmV6JRpl1PeHvRr+/uM7nOCZ5PtYmrq8azon55a
 L7eqCK9psYThHCQEWM2YSdXmNuunNlMIb+Lnh1oI2lvSksYh/HNG+HHar5zC+OcDkUt8
 S+p7t0qxCaRA/vZVBxW50LPEXytwjrp2vedHfGPAGD+SsVuljVta1Ul7u1nrU8lLErU4
 SZ157OiOXAEclCqS7I0S0KDUeB9RfkiReKpZlrr9JmiwptzpCAk4Om2xrmqfFqs9Hujo
 SgCHTC7+Rd5GUVyG9u+ljaAUAPg16bizd9WTgc+mks09P3CM3pG+IfktpXkRpu1LFWtO
 za7g==
X-Gm-Message-State: AOAM533/m+MKrKLHVVSAaahL15x1wj8RachLRiXh9M0kIxzitQVfEXsZ
 8ElEZ9kPnAaprLbSkCG7UsrhAw==
X-Google-Smtp-Source: ABdhPJwXQzy3xUeRVpKw7rIKp/Ddw02ORjaoSBXTW0tiCRx2qgrHhc8njOhRtzFHZAwUVxwEFUgFKA==
X-Received: by 2002:a65:5cc6:: with SMTP id b6mr14335468pgt.417.1605819859757; 
 Thu, 19 Nov 2020 13:04:19 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e14sm582151pga.61.2020.11.19.13.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 13:04:19 -0800 (PST)
Subject: Re: [RFC 08/15] target/riscv: rvb: single-bit instructions
From: Richard Henderson <richard.henderson@linaro.org>
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-9-frank.chang@sifive.com>
 <299ed3c1-fcb1-aa34-a595-5f86b8466d18@linaro.org>
Message-ID: <bbcbfa1c-b34d-147e-a100-cbc998512fe3@linaro.org>
Date: Thu, 19 Nov 2020 13:04:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <299ed3c1-fcb1-aa34-a595-5f86b8466d18@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

On 11/19/20 12:35 PM, Richard Henderson wrote:
> On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
>> +static bool trans_sbset(DisasContext *ctx, arg_sbset *a)
>> +{
>> +    REQUIRE_EXT(ctx, RVB);
>> +    return gen_arith(ctx, a, &gen_sbset);
>> +}
>> +
>> +static bool trans_sbseti(DisasContext *ctx, arg_sbseti *a)
>> +{
>> +    REQUIRE_EXT(ctx, RVB);
>> +    return gen_arith_shamt_tl(ctx, a, &gen_sbset);
>> +}
>> +
>> +static bool trans_sbclr(DisasContext *ctx, arg_sbclr *a)
>> +{
>> +    REQUIRE_EXT(ctx, RVB);
>> +    return gen_arith(ctx, a, &gen_sbclr);
>> +}
> 
> Coming back to my re-use of code thing, these should use gen_shift.  That
> handles the truncate of source2 to the shift amount.
> 
>> +static bool trans_sbclri(DisasContext *ctx, arg_sbclri *a)
>> +{
>> +    REQUIRE_EXT(ctx, RVB);
>> +    return gen_arith_shamt_tl(ctx, a, &gen_sbclr);
>> +}
>> +
>> +static bool trans_sbinv(DisasContext *ctx, arg_sbinv *a)
>> +{
>> +    REQUIRE_EXT(ctx, RVB);
>> +    return gen_arith(ctx, a, &gen_sbinv);
>> +}
>> +
>> +static bool trans_sbinvi(DisasContext *ctx, arg_sbinvi *a)
>> +{
>> +    REQUIRE_EXT(ctx, RVB);
>> +    return gen_arith_shamt_tl(ctx, a, &gen_sbinv);
>> +}
> 
> I think there ought to be a gen_shifti for these.

Hmm.  I just realized that gen_shifti would have a generator callback with a
constant argument, a-la tcg_gen_shli_tl.

I don't know if it's worth duplicating gen_sbclr et al for a constant argument.
 And the sloi/sroi insns besides.  Perhaps a gen_shifti_var helper instead?

Let me know what you think, but at the moment we're left with an incoherent set
of helpers that seem split along lines that are less than ideal.


r~

