Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938F52D4651
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 17:06:45 +0100 (CET)
Received: from localhost ([::1]:38208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn1zI-0000aU-LS
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 11:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1w9-0007oq-3N
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:03:29 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1vz-0004fb-WD
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:03:28 -0500
Received: by mail-oi1-x243.google.com with SMTP id d27so2239812oic.0
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 08:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ksXWhXqzvtbdpTtthpbzLEMpoJieV1ecbw0pGzw54XQ=;
 b=SdsstZ3FWbioOMZKqw5nziqTk/1lvFUdhGKcWC+odwWPrSH5anfsG/XN2FQdIPZqnv
 tN84JWmvD/RENkc6vb1xGwDpn14RjhVC8YmO4GU0pFG9fNi4IFAeTDJ+oDaiJKLcO8KR
 56U+5TOYHze+bLWp7wtGwBimsPkTGyd3n4v5oXkHm2GahG2oyEZRNebrv/Lr4hCEp/8T
 5Hjt74/sMdFNlnX7iC7nNUF4yXE30bmnxbnMcabkjyq8SV19+L7AH35nQv3R7HEJzI32
 DSOA8YE8ZUfYE0jZQfxlI5zUDKlGrGSs3qQ1I+Ut8Q7teY9U+N1pF53pMt5bhoJ+4pU8
 OuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ksXWhXqzvtbdpTtthpbzLEMpoJieV1ecbw0pGzw54XQ=;
 b=bGVkd3eigxHqJ81asFGyZezS7TjUm8iokaT6yZfNYxzyQdZmJL+ruipCjcC/2G47FJ
 8Hl3HRNOJvMISGykqE1Y+X2ZjAm5T0s50dszJrd2wYDTZurzXoQKqiO3ag8j23VUEUeC
 jZpqRbsSZbsDSNsCEnO4yOBbhh2FVXGLadm82dZfPewBGe6vj4Jk/kckHvC9mQcIqdWk
 XNWGNH2X6HFTPXc9JwWeR85NL2Q/HvNyvXxxrRloHXiSDFE5Fmq5AodsCzzgdh74BbMh
 G9Rg3k4WTkMgbkmPkD5FywRJ8ycjC/gHKG7y0AMcoBhAj52PZJWhiXWU8/TWUif0CtpY
 7CcA==
X-Gm-Message-State: AOAM531Xa7PvW9dGjE/g5Wr4ufGytrglHLFReHYr10NU0VnfWK8JaYBZ
 3SUFFcdqAalMbeb01BalX9d4mw==
X-Google-Smtp-Source: ABdhPJwqEMxk05z6y7T/M2Tvb6PVvWm20YFGaMt4uaI+83a5U74fOgvwG5OLiLfb75xIIonDevk4Cg==
X-Received: by 2002:aca:4ec9:: with SMTP id c192mr2298340oib.115.1607529797264; 
 Wed, 09 Dec 2020 08:03:17 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id n13sm457083otk.58.2020.12.09.08.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 08:03:16 -0800 (PST)
Subject: Re: [PATCH v2 11/15] target/riscv: Specify the XLEN for CPUs
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1607467819.git.alistair.francis@wdc.com>
 <3f1ff73c70b003826bf436ae4c937b62cac79bdc.1607467819.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1de03a6f-47d9-6032-ec66-eddea15b1760@linaro.org>
Date: Wed, 9 Dec 2020 10:03:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3f1ff73c70b003826bf436ae4c937b62cac79bdc.1607467819.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 4:56 PM, Alistair Francis wrote:
> +#ifdef TARGET_RISCV64
> +static void rv64_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> -    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>  }
>  
> -static void rvxx_sifive_e_cpu_init(Object *obj)
> +static void rv64_sifive_e_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> -    set_misa(env, RVXLEN | RVI | RVM | RVA | RVC | RVU);
> +    set_misa(env, RV64 | RVI | RVM | RVA | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>  }
> +#else

I guess it isn't much duplication, but you could retain the rvxx functions and
pass in xlen as an argument.  Either way,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

