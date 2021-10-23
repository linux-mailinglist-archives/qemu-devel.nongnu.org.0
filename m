Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032B143855D
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 22:47:45 +0200 (CEST)
Received: from localhost ([::1]:37028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meNvb-0000Z2-R6
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 16:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meNuJ-0007qi-LU
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:46:23 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meNuD-0008GF-UF
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:46:22 -0400
Received: by mail-pl1-x631.google.com with SMTP id n11so5173396plf.4
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 13:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2x+Tmtupj7nasUNjJ1jCBE9XoVc7gx7DwS+7CTQLyx0=;
 b=N9eiMdONluCGHzUYOdmFjgDSJOrpHwdRWVSr8SGqZSNM80ibXRI8LgtmKWc+R4jBIo
 WTJ78wvA3zubjtnGEnH7cY2N6LvEPo6Zm5q33M5LYpbGyCXRvz+1C6IqC9hTCXUQFY3v
 y1g72UBuzC6QXske3SDwXfeuCZk8KsP4/apdTleairpkdGzCJ6YkGsawugRu43MHWP3M
 8kAR4BfNBIbQzMRLpnlpSAaUhd/zv9mEzMPfLtFFxFEJAve0UMH+TTD9RMSUzKe2xCmV
 rfqlq4qGRfR1PugP0RbwdzM03McUN489vM4R0X3PsH/slzjNljCHJhvUT/5Tp5fAtANt
 H1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2x+Tmtupj7nasUNjJ1jCBE9XoVc7gx7DwS+7CTQLyx0=;
 b=nCPNIlDdeQfr9EMsaPJVpwv9KGR3S3HS3BCoECTfR2kSKsDhbrtjw3pCSDZcHYuCxR
 eprd8hUpi7i1vG93MdUYMSfqzQEcFyB8TFJofdi10Fj20rlFL+3nmKKy420QwJgxNH+z
 bKog6UvT/L/AjQu1cd7OUeu4BUwlDUMNLIVRmU+04IR/FFqjCpN8F6wSaRtCSJu9cRs1
 78ega1R+gET7DIh82k4IEcCaHecy/mmPYy4+Xe/6nDCyGcqHdMx1el8ZORh2STX32LK+
 3XQfE2CDbXc71+HsE24EYUakTEheVhFYrHW0ZlvpPu/dSbKt5ilPcXpIN/0x1yvN6BhI
 VhGg==
X-Gm-Message-State: AOAM530H+baflF6LFn/C3bfTwCKf3g8oePwZkWnPJ/o2wNDbSDklFDj2
 Tc8dOIexMCPgG7RccBb0vEhjKQ==
X-Google-Smtp-Source: ABdhPJzvhKWOoYBXXxoFEQqzy4v/wZMC33kBfhnM+YxRAYzTKM/vjPNKT5+E0KfB2lRv3iT1y2VyCg==
X-Received: by 2002:a17:902:b102:b0:134:a329:c2f8 with SMTP id
 q2-20020a170902b10200b00134a329c2f8mr7496027plr.71.1635021976276; 
 Sat, 23 Oct 2021 13:46:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s17sm11846938pge.50.2021.10.23.13.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 13:46:15 -0700 (PDT)
Subject: Re: [PATCH 21/33] target/ppc: moved stxv and lxv from legacy to
 decodtree
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-22-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c1896076-a366-d2d2-7115-bd0b1690236c@linaro.org>
Date: Sat, 23 Oct 2021 13:46:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-22-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> +    if (ctx->le_mode) {
> +        gen_addr_add(ctx, ea, ea, 8);
> +        offset = -8;
> +    } else {
> +        offset = 8;
> +    }
> +
> +    if (store) {
> +        get_cpu_vsrh(xt, rt);
> +        tcg_gen_qemu_st_i64(xt, ea, ctx->mem_idx, mop);
> +        gen_addr_add(ctx, ea, ea, offset);
> +        get_cpu_vsrl(xt, rt);
> +        tcg_gen_qemu_st_i64(xt, ea, ctx->mem_idx, mop);
> +    } else {
> +        tcg_gen_qemu_ld_i64(xt, ea, ctx->mem_idx, mop);
> +        set_cpu_vsrh(rt, xt);
> +        gen_addr_add(ctx, ea, ea, offset);
> +        tcg_gen_qemu_ld_i64(xt, ea, ctx->mem_idx, mop);
> +        set_cpu_vsrl(rt, xt);
> +    }

Actually, I'm going to reverse myself again.

This has a behaviour change: for LE, the first access is to EA+8 instead of EA.  Thus the 
SIGSEGV for a load from NULL will report address 8 not 0, which is probably not the 
correct result.


r~

