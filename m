Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D01D58543B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 19:12:17 +0200 (CEST)
Received: from localhost ([::1]:52232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHTX5-00076a-Ij
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 13:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHTTC-0003O1-C6
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:08:14 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:45817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHTTA-0000P5-Mv
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:08:13 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o14-20020a17090a4b4e00b001f2f2b61be5so5816114pjl.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 10:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=y9PjfbTlQ6NBzW51KYV7ZglMn5XEqg483PQc7Zd7TJ8=;
 b=yAoieEpwBNiI+l/euHnpcSt1GInIALegXPPNOxq9Oj+UZ8ZPiUAuLWmP054VxagOcl
 iTDebqkuGo1N17igU5/MEURAcBoHC+/DNV9N/vlCRQEdpX5iEiQe80dzz4ksf0RBgMEc
 hSyhDjHZ8SNMvHQmGCK7vh0Hw59y6F7TUu2Q/qLOmfthGzTQtcPnHeoh9El2RzMmtrKy
 SoHop70Xpfz4MlZPvklQ9OM++eOAWTmYGQFlMJP7OOI7h1pb8tctrEbuGuqfG8mI/WD2
 9RGLlq80nnC1VFBvIPc9EYI73vXCObT8zkdkeQ9X0T/IohB78R1h8jlqZnuYh36LVcx9
 d/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y9PjfbTlQ6NBzW51KYV7ZglMn5XEqg483PQc7Zd7TJ8=;
 b=8K+Z92lWN6reoOF7B7t2dZgaJmvwzEPYjLBs+IAjhEu3Nr8whJ+e5tx4sC6+FAWrZD
 x3lN7NYMGsyp9a1Dhpa02JfIToe/HlSoy1xDBNxI4BXFFGXqcdNMXZg2czfpqIc04WxQ
 xJhPgPosRCwtaxn6PVsRHDvohGAu/syLOO63P3PfgMYysftHoyhPLNNUDPBGDRoA2Urn
 kcsWp5RdOOPTp6KPv2m+LpV2QAFFpTuOTIzUjNkmZz6SZjOK4/NIQ0idwTWSqdUheIlB
 A448dbJTJ9kx3/m5DpOQtx0EflUld+mNJwLynkXgEz9u4Rz7lNNPMZNNO2lLqflBinsw
 m5hQ==
X-Gm-Message-State: ACgBeo0BIzBAYW6x+mHaroZwcrtkro28mVXdpLricwFT5Vrtk7/hAkHG
 rEDVBzfMDgk7ec0ITkbC380afA==
X-Google-Smtp-Source: AA6agR6JkQ4JcAF/fc6+0dZYUQLPdo/24xaYtf0GmCBLRKx+nrX/h+Nf6WjF6gcjFlpaavdpi2mMPw==
X-Received: by 2002:a17:902:d2d1:b0:16d:37b3:f8b3 with SMTP id
 n17-20020a170902d2d100b0016d37b3f8b3mr4828673plc.98.1659114491213; 
 Fri, 29 Jul 2022 10:08:11 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:51c4:5cf0:5954:aeb6?
 ([2602:ae:1549:801:51c4:5cf0:5954:aeb6])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a1709026b4c00b0016d773aae60sm3876947plt.19.2022.07.29.10.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 10:08:10 -0700 (PDT)
Message-ID: <ff4525a2-f115-27d5-9615-e7a78bd9d346@linaro.org>
Date: Fri, 29 Jul 2022 10:08:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] Hexagon (tests/tcg/hexagon) Fix alignment in
 load_unpack.c
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 mlambert@quicinc.com
References: <20220718230320.24444-1-tsimpson@quicinc.com>
 <20220718230320.24444-3-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220718230320.24444-3-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/22 16:03, Taylor Simpson wrote:
> The increment used in :brev tests was causing unaligned addresses
> Change the increment and the relevant expected values
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   tests/tcg/hexagon/load_unpack.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/tests/tcg/hexagon/load_unpack.c b/tests/tcg/hexagon/load_unpack.c
> index 3575a37a28..4aa26fc388 100644
> --- a/tests/tcg/hexagon/load_unpack.c
> +++ b/tests/tcg/hexagon/load_unpack.c
> @@ -245,7 +245,7 @@ TEST_pr(loadbsw4_pr, long long, S, 4, 0x0000ff000000ff00LL,
>    */
>   #define BxW_LOAD_pbr(SZ, RES, PTR) \
>       __asm__( \
> -        "r4 = #(1 << (16 - 3))\n\t" \
> +        "r4 = #(1 << (16 - 4))\n\t" \
>           "m0 = r4\n\t" \
>           "%0 = mem" #SZ "(%1++m0:brev)\n\t" \
>           : "=r"(RES), "+r"(PTR) \
> @@ -273,15 +273,15 @@ void test_##NAME(void) \
>   }
>   
>   TEST_pbr(loadbzw2_pbr, int, Z, 0x00000000,
> -    0x00020081, 0x00060085, 0x00040083, 0x00080087)
> +    0x00020081, 0x000a0089, 0x00060085, 0x000e008d)
>   TEST_pbr(loadbsw2_pbr, int, S, 0x0000ff00,
> -    0x00020081, 0x00060085, 0x00040083, 0x00080087)
> +    0x00020081, 0x000aff89, 0x0006ff85, 0x000eff8d)
>   TEST_pbr(loadbzw4_pbr, long long, Z, 0x0000000000000000LL,
> -    0x0004008300020081LL, 0x0008008700060085LL,
> -    0x0006008500040083LL, 0x000a008900080087LL)
> +    0x0004008300020081LL, 0x000c008b000a0089LL,
> +    0x0008008700060085LL, 0x0010008f000e008dLL)
>   TEST_pbr(loadbsw4_pbr, long long, S, 0x0000ff000000ff00LL,
> -    0x0004008300020081LL, 0x0008008700060085LL,
> -    0x0006008500040083LL, 0x000a008900080087LL)
> +    0x0004008300020081LL, 0x000cff8b000aff89LL,
> +    0x0008ff870006ff85LL, 0x0010ff8f000eff8dLL)
>   
>   /*
>    ****************************************************************************


