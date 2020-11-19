Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D68862B9B85
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 20:32:53 +0100 (CET)
Received: from localhost ([::1]:48984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfpfo-0004ZA-Tl
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 14:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpbu-0002tc-75
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 14:28:50 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:43205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpbq-0008Td-21
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 14:28:49 -0500
Received: by mail-pf1-x429.google.com with SMTP id v5so1398396pff.10
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 11:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kHq5qHsmT8tpn6Xj2b0XE3/yFjg30rkFDcIDF853XIQ=;
 b=KSptWN8Z0rBKZacyAERjlik97QjwNowSvGlMbH8I9IWvHgkXreEk0d0owUFIJujZtC
 iXCyRxmMPjqS0Ukar7GOzcP/+jQL7nJNIHLwwQl7q2NvB426VsDo7RR9v8XhII/DQWwo
 OfvUs7WltlKIKEWBFL+JoexOyLpLdtZpeTw7IMrXf5/zuuyXtzCIXqogfgNCu2xYzhPA
 qspfyOL/57PH/GgMxr5jFCa3Qzxz5o+795qb4H6wNrx4BDlLwQuWEIiH7XeRI90e/H6B
 TF16fMU8xVTJdABFjfZ1yH/48bHXMonHD1nQGGiRjmnjP75AyvJffOGjQIR1Si62tMDQ
 hunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kHq5qHsmT8tpn6Xj2b0XE3/yFjg30rkFDcIDF853XIQ=;
 b=EuW0ohBllRl/kV9k9MXWoKMR1LwCJosqNH8xhFIQJECWeK+2H9ifL8eXSs9MyW7AZI
 zHcKEHbWmHKnXkMxbrtK0M4TmPIoGHWJSnzp3h0Guw8V7iRF2CVnixqLNrtuQ7Rrc8mu
 ESYQpk1rtOllITwIWlgqJt0Izo2BVpi06jZuuA6hYiMN7dB8GnLF3Vo/adrc5GGOY/au
 xrFeHBOvzMKha+Qs7acjNKmB0Sv0P4cz4WXFSiMgc/wb07MkPblsDG6IDZPFQ3T3K9zW
 zEZAE5yhQCdzzZN7VoPqfGpeJgXg7sdnynu0iuJbH9mrcwqoa7za63QBvCG1ypfxQ4Tg
 V+/w==
X-Gm-Message-State: AOAM5317AQom78o/Q5H2vlh3G6vXuIrMPQi9XWis70IFhkqC9Z5AqoLb
 i3AIZukaVznojpP3/k53nD4JAg==
X-Google-Smtp-Source: ABdhPJwXv5ulA9THyieZrdFTLZuRKU8cNtf/cQESAvyXfCBHE1B0w20WEU2Wm/XhCtXv47hJ6w56cA==
X-Received: by 2002:aa7:84d0:0:b029:18b:fac7:29b with SMTP id
 x16-20020aa784d00000b029018bfac7029bmr10315413pfn.29.1605814124095; 
 Thu, 19 Nov 2020 11:28:44 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id ga18sm489619pjb.5.2020.11.19.11.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 11:28:43 -0800 (PST)
Subject: Re: [RFC 04/15] target/riscv: rvb: logic-with-negate
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-5-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <03a4ec9b-d609-65b7-ee69-a5cd63f3f6d1@linaro.org>
Date: Thu, 19 Nov 2020 11:28:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-5-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +static void gen_andn(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t;
> +    t = tcg_temp_new();
> +
> +    tcg_gen_not_tl(t, arg2);
> +    tcg_gen_and_tl(ret, arg1, t);
> +
> +    tcg_temp_free(t);
> +}

This is tcg_gen_andc_tl.

> +static void gen_orn(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t;
> +    t = tcg_temp_new();
> +
> +    tcg_gen_not_tl(t, arg2);
> +    tcg_gen_or_tl(ret, arg1, t);
> +
> +    tcg_temp_free(t);
> +}

This is tcg_gen_orc_tl.

> +static void gen_xnor(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t;
> +    t = tcg_temp_new();
> +
> +    tcg_gen_not_tl(t, arg2);
> +    tcg_gen_xor_tl(ret, arg1, t);
> +
> +    tcg_temp_free(t);
> +}

This is tcg_gen_eqv_tl.


r~

