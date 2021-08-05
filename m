Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE383E1C39
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:13:08 +0200 (CEST)
Received: from localhost ([::1]:59472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBinj-000439-5X
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBikg-0002Vn-KX
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:10:03 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBikd-0001Cw-Jq
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:09:58 -0400
Received: by mail-pj1-x1036.google.com with SMTP id l19so11315108pjz.0
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 12:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HCrMpI2T3In3b/FzNBAI4OCu7zAIXYMW2VkiDuK6sHE=;
 b=wNPegbV0K9HqHWrpU/+sQc7RDbN4aS6R+GGZsC4SdL//kvAZva12A/Yw+TGgotA9b4
 rx7o0seKhKmNh3FBGJIJJrdeVyZvscLCum90L0/VnGYW4byzXSjA/bCZ5iWDWPtNJs1Z
 hhYVi6U3cBOGBoVahdx/+3N3gDLQGyg+ipZbIp1kzd6eZtxMd31SYJ3x9jAhRNiJhDUb
 saUy97kdhNMD6wUlPwPW76xSravpQLBuHn8K+w8UKHkQ8anjMQbNrISjGK1AH+qNPlNl
 fy+b90RDLQv5yia63wpRRaIOKZBzXDkSio0SzxHRM7X0ni8kxi3Uz6h8VJGA3aQzxdTZ
 1RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HCrMpI2T3In3b/FzNBAI4OCu7zAIXYMW2VkiDuK6sHE=;
 b=NAqIQ+4izHFISZHqLHcC2qIfzfrtd/CY4u9V22Qk1N+ljKPmLBcBSxDK7hDTpMpHv8
 gICoGBOoPQwVIJY+1R/Ie2DPs6OXGAXKXbBsxYkX19AzXQc/ptEHXY5TRxIpybUgtvpx
 zu5MpX0hY7ZbnlVaoij/rjRJUiUp7r26Njn6hOkGMOODpbygItRXqaHSdiOBHdbx3zMb
 2tEx4n0ljrGZlaCshUSnXVIE9xiGEj9flGHcsl4NStWXQ5UqkCUbjtmq5ZBCt4PNnJyL
 XDpZvHtn14wJ4PR5NWn7mkzn1gW3bOp/A2E0kDSYP0EVfyj1YfTZ9iOz469Xi6nCoQc+
 JCkQ==
X-Gm-Message-State: AOAM532lXfxB2jWcVGECT9gtPTXOGcDDa7Xmbt4wWk+UNWD7pRWiN64d
 tgGirijYkgZgDmbwpSrDWhjk7Q==
X-Google-Smtp-Source: ABdhPJwGunEW2i7T4E+JhAVMfHd5FGChTW7Di4BzSqRj0yKbLC9CUuN8foub/vNQgl2UXiidza8Bjg==
X-Received: by 2002:a63:e74c:: with SMTP id j12mr117265pgk.121.1628190593983; 
 Thu, 05 Aug 2021 12:09:53 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id b26sm7810332pfo.47.2021.08.05.12.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 12:09:53 -0700 (PDT)
Subject: Re: [RFC PATCH 04/13] target/riscv: Support UXL32 for slit/sltiu
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-5-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c33ecc6-3b61-2bb0-f331-548d5e58e129@linaro.org>
Date: Thu, 5 Aug 2021 09:09:50 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805025312.15720-5-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/21 4:53 PM, LIU Zhiwei wrote:
> +static bool gen_arith_simm_tl(DisasContext *ctx, arg_i *a,
> +                              void (*func)(TCGv, TCGv, TCGv))
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src_s(ctx, a->rs1);
> +    TCGv src2 = tcg_constant_tl(a->imm);
> +
> +    (*func)(dest, src1, src2);
> +    return true;
> +}
> +
> +static bool gen_arith_uimm_tl(DisasContext *ctx, arg_i *a,
> +                              void (*func)(TCGv, TCGv, TCGv))
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src_u(ctx, a->rs1);
> +    TCGv src2 = tcg_constant_tl(ctx->uxl32 ? a->imm & UINT32_MAX : a->imm);
> +
> +    (*func)(dest, src1, src2);
> +    return true;
> +}

Again, unsigned comparisions work fine with sign-extended inputs.


r~

