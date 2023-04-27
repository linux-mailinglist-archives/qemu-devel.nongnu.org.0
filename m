Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D156F044D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 12:40:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prz2z-0000pk-2G; Thu, 27 Apr 2023 06:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prz2x-0000pM-7R
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:40:19 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prz2v-0001Nz-LJ
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:40:18 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-95678d891d6so1517547566b.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 03:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682592016; x=1685184016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jvH+AIdB/Cebfa4k7Am06/O0bgSyKhIQfcg8Vm7Xb3M=;
 b=rJPZLYND2DGyD8FFjD0ylQzRow4aZrM5Roe6Ig7qkOgbVrG78xrWD1Gp+uZCXAczxN
 +Cyr/367zVxwwAVKZsmL6692bn9Htsau4Igv5CcPfsRjIGH1v2e8qFuYDBFQoxmEBUSD
 ta+pX/HQK8TVr3OINZt2rDygmXE42B6FZEO4gxsJSBkavsV6J/25NCJCtzILexBsF+QZ
 S9BAZgsFKQNHM337ROxHUjK1grYINXA1iAg4Yy6gYzu3+ATeaSX8u3LPb7gq3Lx5eU3s
 vrZ5CvrqgljTd7hqYW4CqkLyHJbA5+nZR+938Tq0p2CL1MbGPPRyVPmu7qLIOwedOFMR
 lUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682592016; x=1685184016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jvH+AIdB/Cebfa4k7Am06/O0bgSyKhIQfcg8Vm7Xb3M=;
 b=Hq/GVnVtW61i3cReM4NJMu3WDM+a5vjMM/SOySqvdg6qdrMUedGXEbXhdM4ESb4zKv
 7i6pT145+mFiqlnWIMaJmJDeY7Ytl0R7mUfDuF/FGSzBr0/woyVW+1Rpg3lHE76HeIwm
 b70llwkVwer7jvLeDx+mXeLuQpdJwKZGkWsu+bOlf/nAVuHUKh9oJbHq7fOoSNi9ijuF
 QV0SPt0D6Xpp0QvKp5VieK1ufxOlNdhGdkIZmR9jVul2JLb16xtbcfWmGdKgjpxVD7IH
 Jgx5jRPrliI2ABKc/pGMEdCJePbhBACYBwX0Hi7dzd4Ke1tKErOLZoQ2gDFH4eaUktWz
 k7UQ==
X-Gm-Message-State: AC+VfDxVcZbTiYEHivAXznudKdFHrpjCWMOdULB5WAj8DkjCdGtukUUL
 daDX1buAJ0Rg6vyyg4SWE7vWBA==
X-Google-Smtp-Source: ACHHUZ4+EtF8tJDPchHq2ANwAUramwRPI2iMSCaIlcapQ6720xiFf8lbYhR/3dg89o+WWSGwuSywWQ==
X-Received: by 2002:a17:907:1ca8:b0:94a:9f9a:b3c4 with SMTP id
 nb40-20020a1709071ca800b0094a9f9ab3c4mr1094038ejc.49.1682592016008; 
 Thu, 27 Apr 2023 03:40:16 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 qp24-20020a170907207800b00882f9130eafsm9396259ejb.26.2023.04.27.03.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 03:40:15 -0700 (PDT)
Message-ID: <5ca8d1de-319c-4a2e-51ec-c9dd0a1f9727@linaro.org>
Date: Thu, 27 Apr 2023 11:40:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 11/21] Hexagon (target/hexagon) Short-circuit packet
 register writes
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004234.1319401-1-tsimpson@quicinc.com>
 <20230426004234.1319401-2-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004234.1319401-2-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/26/23 01:42, Taylor Simpson wrote:
> In certain cases, we can avoid the overhead of writing to hex_new_value
> and write directly to hex_gpr.  We add need_commit field to DisasContext
> indicating if the end-of-packet commit is needed.  If it is not needed,
> get_result_gpr() and get_result_gpr_pair() can return hex_gpr.
> 
> We pass the ctx->need_commit to helpers when needed.
> 
> Finally, we can early-exit from gen_reg_writes during packet commit.
> 
> There are a few instructions whose semantics write to the result before
> reading all the inputs.  Therefore, the idef-parser generated code is
> incompatible with short-circuit.  We tell idef-parser to skip them.
> 
> For debugging purposes, we add a cpu property to turn off short-circuit.
> When the short-circuit property is false, we skip the analysis and force
> the end-of-packet commit.
> 
> Here's a simple example of the TCG generated for
> 0x004000b4:  0x7800c020 {       R0 = #0x1 }
> 
> BEFORE:
>   ---- 004000b4
>   movi_i32 new_r0,$0x1
>   mov_i32 r0,new_r0
> 
> AFTER:
>   ---- 004000b4
>   movi_i32 r0,$0x1
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

