Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CB42B9B9F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 20:45:10 +0100 (CET)
Received: from localhost ([::1]:34290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfprh-00038O-EB
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 14:45:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpqY-0002MV-Rb
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 14:43:58 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpqW-0006CQ-BP
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 14:43:58 -0500
Received: by mail-pf1-x434.google.com with SMTP id g7so5494604pfc.2
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 11:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o9oZd6H2VNr1fXKrUvYaKzXLZenPKvktbYQVP3aAYlU=;
 b=UWvimZ1FOZmBbcPzk/ex/J7/ckMj5nQxNp+YGp2pYFyFOxkp/8PTU8gMATqcgkis4z
 0X4li5+R5Ad0lSGez6HgR2lrDUvso/s2WBrJfAHQ6Jbzcl2juiad4rW0umXHcSg8prVk
 8o2ZQzS0BcKXL8sjoI1l0r7xjpa/SYaH1OGHm2TzPAYEIk8SbYGssLf+q59EEy+awjVg
 Eul0HS0l5ATRpdq8ZcfbsYkPz4mshZk2kKGs4bM2meed0H6ayZjeiJXGYwcB1qO6p+mJ
 nmtHPrlur40BEHmFIkDQ/Pm70iWf+6k9ermyphH7xoP9l3BWzpjkKvzAIQ1F/DaR/2ha
 0ggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o9oZd6H2VNr1fXKrUvYaKzXLZenPKvktbYQVP3aAYlU=;
 b=R3RUwuqxLI0mQ3HYqkQTrXKtV3NvjKVskXDs5LVtzUGeUMikzixxqeehf+ZFLuNhFY
 g346iL81W/4/JdiFTxt1n3fCxDmJtD3nBLhScGH4OqJzNXNwydkb7dyv0m0J6WZMIUy+
 6X7Ep2wvTKgKxwn9U1NvQBXpouhHPJUjdNVhljPvjsbnM04qpulQmPEnG6gsI+Anyvo8
 Ba29HS2vWBHMBkyEnj2UHl0nq/KVJPRrBY/LyRScECuApLQXr68qMvdczh6jo+HyI9Z4
 rZi77bbgrw8CPV5mF6+K2IQaDBCHptyqUxZTXHUGgrD/rFRldkP0zFg5A3xot69/kTRw
 RxbQ==
X-Gm-Message-State: AOAM5331DMc6daYCoa7RCxeqZAB4JzZeQpjlLq2jyhvqeT1Qaqv8F1ed
 gmA/E7fk7+oKXuJQYWUnCVKbfg==
X-Google-Smtp-Source: ABdhPJy8+N8E4jAx8ColvjCwR1gXWXezn/1uI2b33+h5wBdjbAJgZORS3DnH3jesoX5ZVgMWEzWFeQ==
X-Received: by 2002:aa7:9694:0:b029:18b:5846:4532 with SMTP id
 f20-20020aa796940000b029018b58464532mr10718998pfk.41.1605815035036; 
 Thu, 19 Nov 2020 11:43:55 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a24sm627260pfl.174.2020.11.19.11.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 11:43:54 -0800 (PST)
Subject: Re: [RFC 05/15] target/riscv: rvb: pack two words into one register
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-6-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <59f30d7e-dcdd-6a7b-1de9-ec07f621c9fa@linaro.org>
Date: Thu, 19 Nov 2020 11:43:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-6-frank.chang@sifive.com>
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

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv lower, higher;
> +    lower = tcg_temp_new();
> +    higher = tcg_temp_new();
> +
> +#ifdef TARGET_RISCV64
> +    tcg_gen_ext32u_tl(lower, arg1);
> +    tcg_gen_shli_tl(higher, arg2, 32);
> +#else
> +    tcg_gen_ext16u_tl(lower, arg1);
> +    tcg_gen_shli_tl(higher, arg2, 16);
> +#endif
> +

tcg_gen_deposit(ret, arg1, arg2,
                TARGET_LONG_BITS / 2,
                TARGET_LONG_BITS / 2);

> +static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv lower, higher;
> +    lower = tcg_temp_new();
> +    higher = tcg_temp_new();
> +
> +#ifdef TARGET_RISCV64
> +    tcg_gen_shri_tl(lower, arg1, 32);
> +    tcg_gen_shri_tl(higher, arg2, 32);
> +    tcg_gen_shli_tl(higher, higher, 32);
> +#else
> +    tcg_gen_shri_tl(lower, arg1, 16);
> +    tcg_gen_shri_tl(higher, arg2, 16);
> +    tcg_gen_shli_tl(higher, higher, 16);
> +#endif
> +
> +    tcg_gen_or_tl(ret, higher, lower);

tcg_gen_shri_tl(t, arg1, TARGET_LONG_BITS / 2);
tcg_gen_deposit_tl(ret, arg2, t, 0, TARGET_LONG_BITS / 2);

> +static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv lower, higher;
> +    lower = tcg_temp_new();
> +    higher = tcg_temp_new();
> +
> +    tcg_gen_ext8u_tl(lower, arg1);
> +    tcg_gen_ext8u_tl(higher, arg2);
> +    tcg_gen_shli_tl(higher, higher, 8);
> +
> +    tcg_gen_or_tl(ret, higher, lower);

tcg_gen_ext8u_tl(t, arg2);
tcg_gen_deposit_tl(ret, arg1, t, 8, TARGET_LONG_BITS - 8);

> +static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv lower, higher;
> +    lower = tcg_temp_new();
> +    higher = tcg_temp_new();
> +
> +    tcg_gen_ext16u_tl(lower, arg1);
> +    tcg_gen_shli_tl(higher, arg2, 16);
> +    tcg_gen_or_tl(ret, higher, lower);
> +
> +    tcg_gen_ext32s_tl(ret, ret);
> +
> +    tcg_temp_free(lower);
> +    tcg_temp_free(higher);
> +}

tcg_gen_ext16s_i64(t, arg2);
tcg_gen_deposit_i64(ret, arg1, t, 16, 48);

> +static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv lower, higher;
> +    lower = tcg_temp_new();
> +    higher = tcg_temp_new();
> +
> +    tcg_gen_shri_tl(lower, arg1, 16);
> +    tcg_gen_shri_tl(higher, arg2, 16);
> +    tcg_gen_shli_tl(higher, higher, 16);
> +    tcg_gen_or_tl(ret, higher, lower);
> +
> +    tcg_gen_ext32s_tl(ret, ret);

tcg_gen_shri_i64(t, arg1, 16);
tcg_gen_deposit_i64(ret, arg2, t, 0, 16);
tcg_gen_ext32s_i64(ret, ret);


r~

