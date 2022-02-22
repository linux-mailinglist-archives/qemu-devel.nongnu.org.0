Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1764C0136
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 19:25:48 +0100 (CET)
Received: from localhost ([::1]:44580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZr9-0000HN-Rn
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 13:25:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMZoe-0006rc-QC
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 13:23:15 -0500
Received: from [2607:f8b0:4864:20::535] (port=46935
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMZoc-0003zh-Kr
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 13:23:12 -0500
Received: by mail-pg1-x535.google.com with SMTP id o23so1288208pgk.13
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 10:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FO2eRqXSsCDSQnAUuidajw4Re4wwVOPsYnn1O92CBLo=;
 b=Oge7ZaX5Zmgwlr29yLI6ra5SdClE30C9aYdZMOsHRElkIOW7XV0YZQu+JlkV4xrKOm
 h01CCVuBxrDQ/Z3ElCDZVuS9ifEmtKFz3+Je6PGJ+Qt8ba/pybjj3FoTM+f4BC2g2fj/
 Sf725O4thVPAQbU4eXqfdapB42fFOdX9Pa9f0oSpH5RCZL2nDkIcwDrNq8BE1DW5xyku
 Lep4VlgRlr0ndzCDx2+uqvi9Zjx6ZTQUwKcVh7whTQjl9sTtj5R0Kb4E0n/ilgxWlRKd
 ttDUUjbRKUGCDxJsZJSq6fjiFLyLeVxu5Ld7naheozNx+nF4sb/QkkAHhn5Z/QIS8Pr+
 as5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FO2eRqXSsCDSQnAUuidajw4Re4wwVOPsYnn1O92CBLo=;
 b=W0UEYz7QDV12qOvvg7dBfU3xIeV1ca3ByagyTXQ6RMsw2pI6f0PO98sRz1MCtpMMpj
 ac5WTYaO6cxx3DGYGZvDMrEi/3bPCOjAV/sM4nUoB4LbpGuFK6Uqq5hYaAHwhEiW6D0b
 /40HTbVMpKEnSp0qg+vQxuxWSeyf6qZhqQxX83iqwc3L7FuCo38VtN1O+sInF9tBVYQ7
 2GwBPu/I/7UTQX03aPIzfqRdaRgzuxFQ3vc+PdCO6P+F6O+bQc1FiIuKup9qFkDOr0Ji
 IK8Fa6aF2INgM50hTT7/bTZiAO/qGxDRT/iAoyYFNhXkrwUp5vPcXPROOvMjdCH4EPdU
 jHOA==
X-Gm-Message-State: AOAM53334xSfw+bXD/ly6sccEceq/2JHX+AIJxVwfcVgWUUi5AralzNQ
 wrPJz7bMdfUlxEgx3iRvyAIc8A==
X-Google-Smtp-Source: ABdhPJyicdZ8UmdNzMB73IxTLwKI0YfkISwFSfRmpHCbKSjogSb3IRGMxhNeNt9W42tM7LwQiYv6Ew==
X-Received: by 2002:a05:6a00:1692:b0:4df:c6b0:2f02 with SMTP id
 k18-20020a056a00169200b004dfc6b02f02mr26024923pfc.50.1645554188932; 
 Tue, 22 Feb 2022 10:23:08 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm188633pjp.39.2022.02.22.10.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 10:23:08 -0800 (PST)
Message-ID: <32c3bf6c-081c-18aa-7aee-e03251801abb@linaro.org>
Date: Tue, 22 Feb 2022 08:23:04 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 04/47] target/ppc: vmulh* instructions without helpers
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-5-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-5-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 danielhb413@gmail.com, groug@kaod.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>
> 
> Changed vmulhuw, vmulhud, vmulhsw, vmulhsd to not
> use helpers.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> Changes in v4:
> Changed from gvec to i64, this resulted in a better performance on
> a Power host for all 4 instructions and a better performance for
> vmulhsw and vmulhuw in x86, but a worse performance for vmulhsd and
> vmulhud in a x86 host.

Unsurprising.

> +static void do_vx_vmulhd_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, bool sign)
> +{
> +    TCGv_i64 a1, b1, mask, w, k;
> +    void (*tcg_gen_shift_imm)(TCGv_i64, TCGv_i64, int64_t);
> +
> +    a1 = tcg_temp_new_i64();
> +    b1 = tcg_temp_new_i64();
> +    w  = tcg_temp_new_i64();
> +    k  = tcg_temp_new_i64();
> +    mask = tcg_temp_new_i64();
> +    if (sign) {
> +        tcg_gen_shift_imm = tcg_gen_sari_i64;
> +    } else {
> +        tcg_gen_shift_imm = tcg_gen_shri_i64;
> +    }
> +
> +    tcg_gen_movi_i64(mask, 0xFFFFFFFF);
> +    tcg_gen_and_i64(a1, a, mask);
> +    tcg_gen_and_i64(b1, b, mask);
> +    tcg_gen_mul_i64(t, a1, b1);
> +    tcg_gen_shri_i64(k, t, 32);
> +
> +    tcg_gen_shift_imm(a1, a, 32);
> +    tcg_gen_mul_i64(t, a1, b1);
> +    tcg_gen_add_i64(t, t, k);
> +    tcg_gen_and_i64(k, t, mask);
> +    tcg_gen_shift_imm(w, t, 32);
> +
> +    tcg_gen_and_i64(a1, a, mask);
> +    tcg_gen_shift_imm(b1, b, 32);
> +    tcg_gen_mul_i64(t, a1, b1);
> +    tcg_gen_add_i64(t, t, k);
> +    tcg_gen_shift_imm(k, t, 32);
> +
> +    tcg_gen_shift_imm(a1, a, 32);
> +    tcg_gen_mul_i64(t, a1, b1);
> +    tcg_gen_add_i64(t, t, w);
> +    tcg_gen_add_i64(t, t, k);

You should be using tcg_gen_mul{s,u}2_i64 instead of open-coding the high-part multiplication.

r~

