Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D68DC441A46
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:54:45 +0100 (CET)
Received: from localhost ([::1]:51320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUxg-0005aQ-WC
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUwE-0004kb-7P
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:53:14 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:45721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUwC-0006yC-KK
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:53:13 -0400
Received: by mail-qt1-x831.google.com with SMTP id r2so14092544qtw.12
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 03:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rXvxx5QqIsO5g6wQYkPmDEnA7Kg3/aj5PNhv2LTthu8=;
 b=cX1dkjSzaBgmFZtg6vvsT+PRUHdr63swtZzMLLZm1jeONOZxqHkspLRdsMlWCQFvKN
 T+G3oTyHvYtHSB1vnpS231JAkxxqRZDLM8XsQTigYeQvSLBsDGRuEqc85Y7sq/z3qFTK
 vEA9dwRor6lQJ+sNovxvritJ8bSeiug+gv1m0mqF4UqzBDoT63kmT1w/8ttyD82UlFsV
 x8bgtCdf2VxdacTLGjTKor77Z4V34/vkoX0Z1gQnyI3nqa5t81ptbxSeHXLCTjcFXwBl
 1y+A/3jqxkSdDZheYFlASIOajgqYxZwJDYVzh+0coNgWFpyeZDfSunnaLoTob4Liu8a/
 OOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rXvxx5QqIsO5g6wQYkPmDEnA7Kg3/aj5PNhv2LTthu8=;
 b=m6MmhgvP4IC0yXNOyTnm2MjXjWYFTIANuqWR16Dxrr65wOdkkDjbnbi71iE0j7ykgW
 InI8J/5eQm7ubMfS41KJtp5IwV2xiKdCt4tCQx8JxBMGRKr2bO09L2UIAt77EU7cy1UK
 DAA151MS83v7+QsPrWBR4nRJMApqWwwwKRhEFE7sfcLAoEhdN7xmXwJcdbnDD8TlMTuF
 Md5/b40p6d74+gLbYFCEezes4xLv0T6og7+5SR/e1rT3mBrHuCwuUejSv0kCnmd5A+Be
 zCW/z+/mzfaehGUkSZAHr7y1x2Jw2rbJ5Qwjs+uy5I5/+gRiRFWSbApjpzngzx0dXnZy
 bSlA==
X-Gm-Message-State: AOAM5320+4g5O1pCgxHWRTLXuzqVvjI/CabOoFkv4OfMhi3eYBhivc1b
 oHqMNsFQT/uCOQqSCsZO8cAxxSUBIFbdcg==
X-Google-Smtp-Source: ABdhPJwHMLfB9Zj2BCpU1ubJl/Wz2TVC2Y+m8nQ3BXn7dc7X3E0gowxNXE23VMlHz3fGexJvMC4Zvw==
X-Received: by 2002:a05:622a:290:: with SMTP id
 z16mr28980898qtw.358.1635763991345; 
 Mon, 01 Nov 2021 03:53:11 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id r5sm1964380qkp.131.2021.11.01.03.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 03:53:11 -0700 (PDT)
Subject: Re: [PATCH 06/13] target/riscv: Adjust vsetvl according to ol
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-7-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <28818784-9f70-20d4-5670-ed5677deef76@linaro.org>
Date: Mon, 1 Nov 2021 06:53:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-7-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.592,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -37,7 +37,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
>       } else {
>           s1 = get_gpr(ctx, a->rs1, EXT_ZERO);
>       }
> -    gen_helper_vsetvl(dst, cpu_env, s1, s2);
> +    gen_helper_vsetvl(dst, cpu_env, s1, s2, tcg_constant_tl(get_olen(ctx)));

XLEN not OLEN.

> +        if (olen < TARGET_LONG_BITS) {
> +            env->vtype = FIELD_DP64(0, VTYPE, VILL_OLEN32, 1);
> +        } else {
> +            env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
> +        }

This looks like an excellent reason to split VILL out of VTYPE and create a separate 
env->vill field.  Re-assemble it when reading the CSR, much like we do for misa.mxl.  That 
would want to be a separate patch, of course.


r~

