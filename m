Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D5362D794
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 10:57:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovbdM-0006Kz-EF; Thu, 17 Nov 2022 04:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovbdC-0006FP-Os
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 04:56:27 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovbdA-0003wa-BM
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 04:56:25 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 d13-20020a17090a3b0d00b00213519dfe4aso1472086pjc.2
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 01:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GzTnhzIhJS+/PB69gfYozqf/3ToKRi62K1AS1wbFMPo=;
 b=cu+56jv6EXCjd0qk3K4k77Y09/Tdh+n9VKPv1MFhLceHYj+cJAyl6+RQcdAv9SODL7
 nIn5ETB47violTPviARPTe+X/kiRDkHblhhleIBvJV9QcbrD5b9E0NRmcERnbGEEYjz6
 BQ83ck5v9xYIGTmFlQtOCfU/mjnww2tYN1LyiCu/X6eLu4XymxT5r5/IixopoNDuFFQj
 qqy6ZwKVbvS6HRTW3zY+Y8wih5a5jkbKQvu9UydMdut1MrVOIM1bEkEfgPGsMXLpUqpC
 M3Q8Z2a62rlEPcHrEmtsiU4LsBn0t8RKBRO4+VO8n5ypw7NPR/XoKgCnpKyaVGoFluER
 OCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GzTnhzIhJS+/PB69gfYozqf/3ToKRi62K1AS1wbFMPo=;
 b=0w22BvKrbxlfyQLQCfKhN3jOGH5nlLf1LDBG7hRVs1u4gdlTzYzFBmsAKy90SuSwWt
 KefPHccphks14N1uY5zUKnr+mhUL/BBXdsDHPTZOg+/EP7SK1o4GemHjrIevNtH1ev3k
 Ix4CLN5V6HUo3JLQSPwBJiUlUbG7UVhAc56OKIzay5mMbqslXkn2FxvH3ZqoyJsWSO6p
 shKcjy5ZEpqLmVisEkPQ9mSSko3Mc2irD6LZ3nTjTPiOdPXKvI4OG2N0bVpLo1dhH8KK
 MhhcTyZgfDVh6xN6zdG9XL3vGMVPN0eVQey1EbJDXnQauz89rQISCi0CEc1NciCTsBIB
 LJyA==
X-Gm-Message-State: ANoB5pl5hze6AD/oO0BzRDeYrmB731RDK1qXFaWZ4TZdhPYPXQAfE+Uj
 Cb/qAtYold5Mkvw7FbAEgJOebw==
X-Google-Smtp-Source: AA0mqf7s8N+jVqkmm0VNi7pCsal0soGsdfbT9sLbyI988tuQ8Ip7aeQ6Qdk0Zi1tQJu6/bMuK7tqKA==
X-Received: by 2002:a17:90b:a15:b0:212:8f7:acf with SMTP id
 gg21-20020a17090b0a1500b0021208f70acfmr2029043pjb.13.1668678982786; 
 Thu, 17 Nov 2022 01:56:22 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:b354:386:82db:58e7?
 ([2602:47:d48a:1201:b354:386:82db:58e7])
 by smtp.gmail.com with ESMTPSA id
 84-20020a621957000000b0056c5aee2d6esm636260pfz.213.2022.11.17.01.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 01:56:22 -0800 (PST)
Message-ID: <da87af96-b8e0-d6d1-02d3-a4d3afe8edf0@linaro.org>
Date: Thu, 17 Nov 2022 01:56:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 7/9] target/riscv: add support for Zcmt extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
 <20221117070316.58447-8-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221117070316.58447-8-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/16/22 23:03, Weiwei Li wrote:
> +target_ulong HELPER(cm_jalt)(CPURISCVState *env, target_ulong index,
> +                             target_ulong next_pc)
> +{
> +    target_ulong target = next_pc;
> +    target_ulong val = 0;
> +    int xlen = riscv_cpu_xlen(env);
> +
> +    val = env->jvt;
> +
> +    uint8_t mode = get_field(val, JVT_MODE);
> +    target_ulong base = get_field(val, JVT_BASE);
> +
> +    target_ulong t0;
> +
> +    if (mode != 0) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +    }
> +
> +    if (xlen == 32) {
> +        t0 = base + (index << 2);
> +        target = cpu_ldl_code(env, t0);
> +    } else {
> +        t0 = base + (index << 3);
> +        target = cpu_ldq_code(env, t0);
> +    }
> +
> +    /* index >= 32 for cm.jalt, otherwise for cm.jt */
> +    if (index >= 32) {
> +        env->gpr[1] = next_pc;
> +    }
> +
> +    return target & ~0x1;
> +}

Missing a smstateen_check.  Not mentioned in the instruction description itself, but it is 
within the State Enable section of JVT.


r~

