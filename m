Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E992DC516
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:12:05 +0100 (CET)
Received: from localhost ([::1]:33250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaLM-0002z3-Jm
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:12:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpa2d-00058U-9i
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:52:43 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpa2Y-0002vF-Af
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:52:43 -0500
Received: by mail-pj1-x1032.google.com with SMTP id m5so1951371pjv.5
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O96YMA9+rIQFixqhIxkmC15YbXNyWcSLrfZtwsY9UDg=;
 b=DlxFfv4rMP+xU8GD6k5li/c+STw20lWXcXAJgTpUOKE1p5xJ/F0xgRjw4sVToXlexI
 4koIzrozL6xdIXID78UwWAIiomVfZXSuACHFXuS5chA8qmdggL2MbBYlhPoQOtbfdUXL
 oi0923X6g2kwYo/DEoi4IJiq3nsnI4CK8uC1xo8hlG84F6mD4K2BDfRKznhBhKRP15rM
 NMeKqREsdhUKPxmh0iXzWDv4AyYma3XeTTKhG1C1Cyi43IBEBjgJCRe1fdgle72gqPiK
 wYXkpKQsLNRHO00p0BZ0qJtAkuhlz+wzvIRhshwCcOeK3x0G6cxbljXC3ZQBbXMRVjpj
 iGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O96YMA9+rIQFixqhIxkmC15YbXNyWcSLrfZtwsY9UDg=;
 b=sTDZPmY2+NMSD+ezvwOsDBZ1Y3c9PDK5uIUPryp0sKIncPxgGU/AQrV3N5QK6pRVXW
 eCiTXRLr5AZAKjTwkJrSPjrZ3Y26PQ7g0iIdQkufnzrblIvKp46iyjHcB8fEX9QE0Sk2
 nJNYmU3rk6NF8+aNws8VXHfrQ0hosXej/QGoawWFlclzNYZcd8wKjQFZx4sjwm3aXaWA
 iGpKFZBLRDkfuhDporjLsVpDeKT3632hfVOOrRCRhKIaIot++IR7vC14sw640blzimj3
 i9IQXiRg4A9eZwn+/CT1Xtsl8EokAPW0rwMm2JYG4xsrMgxINnYUogKo3UkY0G/NJ9rR
 nzlg==
X-Gm-Message-State: AOAM5327oDFABg+r+sz4Wm1TBtQP/rwbMQvPg++9AxyWgNS8MsJAHcMJ
 AK1lhFJtwGqxgJEnbYh4KailyA==
X-Google-Smtp-Source: ABdhPJwDVxsyN4C/uvzFcyZ4vCHbif7IQst2zPOko6RdumJrYWOqCr2XA9utCc9Ze92iPPGUfhFoxQ==
X-Received: by 2002:a17:902:7205:b029:db:d2d5:fe79 with SMTP id
 ba5-20020a1709027205b02900dbd2d5fe79mr2741287plb.30.1608137556699; 
 Wed, 16 Dec 2020 08:52:36 -0800 (PST)
Received: from [192.168.71.34] ([172.58.27.195])
 by smtp.gmail.com with ESMTPSA id j17sm2887398pfh.183.2020.12.16.08.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 08:52:36 -0800 (PST)
Subject: Re: [RFC v2 11/15] target/riscv: rvb: generalized reverse
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-12-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <678c7e2d-45b8-9363-664f-7f7e9164bfdf@linaro.org>
Date: Wed, 16 Dec 2020 10:52:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-12-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> +target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
> +{
> +    return do_grev(rs1, rs2, 32);
> +}
> +
> +#endif
> +
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h

Stray whitespace at the end of the file.
checkpatch or git should have complained about this.

> +static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
> +{
> +    TCGv source1 = tcg_temp_new();
> +    TCGv source2;
> +
> +    gen_get_gpr(source1, a->rs1);
> +
> +    if (a->shamt == (TARGET_LONG_BITS - 8)) {
> +        /* rev8, byte swaps */
> +#ifdef TARGET_RISCV32
> +        tcg_gen_bswap32_tl(source1, source1);
> +#else
> +        tcg_gen_bswap64_tl(source1, source1);
> +#endif

I should add a tcg_gen_bswap_tl define so that this ifdef is not necessary.
For the to-do list...

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

