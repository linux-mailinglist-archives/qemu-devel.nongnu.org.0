Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D36F37F6F0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:42:21 +0200 (CEST)
Received: from localhost ([::1]:51152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh9jQ-0003Is-IN
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lh9dm-0007nf-7h
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:36:30 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:38910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lh9di-0000Fb-UC
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:36:29 -0400
Received: by mail-qv1-xf29.google.com with SMTP id jm10so13583591qvb.5
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 04:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+A4c4MZEj8biS8tdAPHObU+bZYqyD8SwTFjsIW7tMjA=;
 b=Wj2cLyWp1SuPDfMHRPIiksrS6oR/T1nPnGi7GKhv+g8NRRroPt6rZFzpMEzsnAwXyk
 a2lHYxGBskIcyudWzpE+bJwU1rIAu3UEaDwqBlBVjR4o1Xz1pukguFMuRw6kfK1JamV2
 +Uh+1ZYQqMvBl+B7Gx8+g8Qh4Ne6KOORazPhJTxjgQa8yHUolf57uGavwNoAAeN+jr4K
 ghPFHhSw63EUMI2EKRn6uXapJxlbGPexOqK5133gKNw1Bm/svnR1OlL7LPbUvdLbAncF
 26nzuI9cC1wJ1F13HYqntCwWWslX9CyvB4MhjGmuH3bWK/pM3WI7Ixz+5OHqeUPN1iG7
 Pf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+A4c4MZEj8biS8tdAPHObU+bZYqyD8SwTFjsIW7tMjA=;
 b=OmahQOhXpkIyxk4gRw/WJh9dYyEIYDTSsLzBChHOeh5TK4MirNvruLHEL4adeYX3lL
 2klNq9xTLhiDbsgNiRtRhbptXGPx/VeBvU6zGBn4zo1Dnrq2UoO/pp1bX0HVijk+ajYe
 KzATRqTTTEm6HwaykXcwH57Bla/3/gdIrL0PNXqi+FdQHvHj/KExWCkEQSLs1aCqexuz
 76Zk2lbWax2Cb4X7tWF10SdjBKiZbf3huCPdldKcAwq/RP7sqrtbGUj0qTiNiDXSdkha
 KiDDDbuuTFMedVFbvwJMd7BUBz+MH4Mj9VCZ88nV74obhMCVt0EbyXzRne+jaY24F1B+
 wLnQ==
X-Gm-Message-State: AOAM5324ZuAgpxRGKClUwVNCljVn/00GyxTllRJGo33nSI9WvsKOrvCc
 Sn6zao3eCgZohtpfw8P/UdQE3FEjgYuPzXRonlE=
X-Google-Smtp-Source: ABdhPJw51FZJNH3RmQjXX5QhqymPREP4caM4I+dl8jlT/+NDOM44NXi3Z67hQQRriVg4Efn2oLr0VQ==
X-Received: by 2002:a0c:d786:: with SMTP id z6mr40014573qvi.18.1620905785542; 
 Thu, 13 May 2021 04:36:25 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id 189sm2248194qkh.99.2021.05.13.04.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 04:36:25 -0700 (PDT)
Subject: Re: [PATCH v4 30/31] target/ppc: Implement vcfuged instruction
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-31-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <89dbecb1-085a-4d94-9d6d-6e193fde9fd7@linaro.org>
Date: Thu, 13 May 2021 06:36:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512185441.3619828-31-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 luis.pires@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 1:54 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode               |  7 ++++
>   target/ppc/translate.c                 |  1 +
>   target/ppc/translate/vector-impl.c.inc | 50 ++++++++++++++++++++++++++
>   3 files changed, 58 insertions(+)
>   create mode 100644 target/ppc/translate/vector-impl.c.inc
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 64788e2a4b..73b5ea0422 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -23,6 +23,9 @@
>   %ds_si          2:s14  !function=times_4
>   @DS             ...... rt:5 ra:5 .............. ..      &D si=%ds_si
>   
> +&VX             vrt vra vrb
> +@VX             ...... vrt:5 vra:5 vrb:5 .......... .   &VX
> +
>   &X              rt ra rb
>   @X              ...... rt:5 ra:5 rb:5 .......... .      &X
>   
> @@ -97,3 +100,7 @@ SETBC           011111 ..... ..... ----- 0110000000 -   @X_bi
>   SETBCR          011111 ..... ..... ----- 0110100000 -   @X_bi
>   SETNBC          011111 ..... ..... ----- 0111000000 -   @X_bi
>   SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
> +
> +## Vector Bit Manipulation Instruction
> +
> +VCFUGED         000100 ..... ..... ..... 10101001101    @VX
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 477e3deede..847de8e012 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7627,6 +7627,7 @@ static int times_4(DisasContext *ctx, int x)
>   #include "translate/vmx-impl.c.inc"
>   
>   #include "translate/vsx-impl.c.inc"
> +#include "translate/vector-impl.c.inc"
>   
>   #include "translate/dfp-impl.c.inc"
>   
> diff --git a/target/ppc/translate/vector-impl.c.inc b/target/ppc/translate/vector-impl.c.inc
> new file mode 100644
> index 0000000000..4e07de5671
> --- /dev/null
> +++ b/target/ppc/translate/vector-impl.c.inc
> @@ -0,0 +1,50 @@
> +/*
> + * Power ISA decode for Vector Facility instructions
> + *
> + * Copyright (c) 2021 Matheus Ferst <matheus.ferst@eldorado.org.br>
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +static bool trans_VCFUGED(DisasContext *ctx, arg_VX *a)
> +{
> +    TCGv_i64 tgt, src, mask;
> +
> +    if (unlikely(!ctx->altivec_enabled)) {
> +        gen_exception(ctx, POWERPC_EXCP_VPU);
> +        return true;
> +    }

You have to REQUIRE_INSN_FLAGS(something) before checking for altivec_enabled.

You're going to want to create some boilerplate for this, because it's going to 
get repeated a *lot*.

> +    // centrifuge lower double word
> +    get_cpu_vsrl(src, a->vra+32);
> +    get_cpu_vsrl(mask, a->vrb+32);
> +    gen_helper_cfuged(tgt, src, mask);
> +    set_cpu_vsrl(a->vrt+32, tgt);
> +
> +    // centrifuge higher double word
> +    get_cpu_vsrh(src, a->vra+32);
> +    get_cpu_vsrh(mask, a->vrb+32);
> +    gen_helper_cfuged(tgt, src, mask);
> +    set_cpu_vsrh(a->vrt+32, tgt);

This has multiple checkpatch errors.


r~

