Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A703E1C24
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:07:35 +0200 (CEST)
Received: from localhost ([::1]:49398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBiiM-0005kO-OK
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBihE-0004wA-4q
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:06:24 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBihB-0007BQ-Mp
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:06:23 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so17192652pjb.3
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 12:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4gvLYCXxB4MyLjLcp/e6UucQLw2KGFMLI/GrPHsJvWQ=;
 b=mTAhkEWnPvKypWL8TbtmxuXQLVnJXZ0Z7tP/fRx6i1aTyAjz3kQ+hTQ5JjkqMBR882
 v7diwYDRhlh35A6clDDR/LMr5Jj25a8DmrGZU++gk4fGX7oc4WK/gUPw1V4SzIeEdDOZ
 BWNEX55834SArtx9pexJ5I7rI+mygETxrYDvwaalvauoPOsAsiWvlfpczcY4vxnfEajW
 gVhlu2y9i1KqQ3IIq66QA7XXvp0Vuxv4f/x9oZAQO0CTnt5OvxzwnbopccrmKaj0P3bo
 iqTdesYNLS3fo7CqJyq+MSkkckAB2Mjy2ppCLJEpo8JGv2UXZ+43axtu9TMqNSvruu8t
 i6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4gvLYCXxB4MyLjLcp/e6UucQLw2KGFMLI/GrPHsJvWQ=;
 b=uPC0s93P74FzHbFBjowys+1uUBtPcLXJoSfbgf+6Sp1VPbPQ2Fqt4oiehzOD3hg9dr
 Ak6f1gilkSZ1iA9vueAxrTTCNeg/+SSy9VKEWh7HueGgZzbxL7UWL0BiAzDeMfuJQPtQ
 R9vK0XTmxA4dU5vogPRtbU0lxdyeYQFr9HtMQtZ3FBbxMTDY2aVDlvjNkg9bgm0TaHk0
 jM2Ek9WxE8TMYU1b+oq0nKQs3VNL3YG4Dxd4+gnwKkSSSPHE6mKCPwcZbPac6cwx90VB
 YR72N0oj9OwbPVYJ8AhwiZCoUcg52J0U/tDdupxUnyaq18Fi4r1j+sak1u7aAL3LOPO5
 KYzw==
X-Gm-Message-State: AOAM533tcmlcpoEItJR/xZS2G4uqxvAUxmDsKuMGq5VBRza/ggpuiaky
 0hU3nRqlQH+r8JKtwJBA06Nm4Q==
X-Google-Smtp-Source: ABdhPJxr9qOrPeDga7FWXHaJAcCoGDMC1NIE4/gNEZ6mGLxuwczdiK+g0kJk/culDhtb9IU5k6kVCw==
X-Received: by 2002:a17:90a:c706:: with SMTP id
 o6mr16250866pjt.113.1628190380266; 
 Thu, 05 Aug 2021 12:06:20 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c3sm6591754pjs.35.2021.08.05.12.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 12:06:19 -0700 (PDT)
Subject: Re: [RFC PATCH 02/13] target/riscv: Support UXL32 for branch
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-3-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <840d76cc-fd1c-6324-19cc-a6ec0075d032@linaro.org>
Date: Thu, 5 Aug 2021 09:06:16 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805025312.15720-3-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/21 4:53 PM, LIU Zhiwei wrote:
> +static TCGv gpr_src_u(DisasContext *ctx, int reg_num)
> +{
> +    if (reg_num == 0) {
> +        return ctx->zero;
> +    }
> +    if (ctx->uxl32) {
> +        tcg_gen_ext32u_tl(cpu_gpr[reg_num], cpu_gpr[reg_num]);
> +    }
> +    return cpu_gpr[reg_num];
> +}
> +
> +static TCGv gpr_src_s(DisasContext *ctx, int reg_num)
> +{
> +    if (reg_num == 0) {
> +        return ctx->zero;
> +    }
> +    if (ctx->uxl32) {
> +        tcg_gen_ext32s_tl(cpu_gpr[reg_num], cpu_gpr[reg_num]);
> +    }
> +    return cpu_gpr[reg_num];
> +}

This is bad: you cannot modify the source registers like this.

These incorrect modifications will be visible to the kernel on transition back to S-mode.

> 
> +static bool gen_branch_u(DisasContext *ctx, arg_b *a, TCGCond cond)
> +{
> +    TCGv src1 = gpr_src_u(ctx, a->rs1);
> +    TCGv src2 = gpr_src_u(ctx, a->rs2);
> +
> +    return gen_branch_internal(ctx, a, cond, src1, src2);
> +}

This is unnecessary.  Unsigned comparisons work just fine with sign-extended values.  It 
will be simpler to keep all values sign-extended.


r~

