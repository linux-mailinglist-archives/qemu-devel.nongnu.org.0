Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD6752ABCE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 21:19:42 +0200 (CEST)
Received: from localhost ([::1]:54462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr2jH-0001h9-M6
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 15:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr2hn-00087b-HL
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:18:03 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr2hl-0004An-Hb
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:18:02 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 z7-20020a17090abd8700b001df78c7c209so3437968pjr.1
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zhbmOtRVSFJtYVsAEzOiTEH5L6rjR9goUZ690MzUpHU=;
 b=bI2Rvk8U78/dQkiyKqJAG7qF9Ttf94F4bKJhGZRUnYkIsjGmg+o7ubOcYnMsGF1L9A
 2z1Rf0VEZMPwpHNgbP7yVgopjJgAh2AIK7CFcBmJ+yGfHWfT8sSszhOAe+vIpl++GJer
 pr1BAhQlrbj/ftwD3PXocpxc8jABlHWNeYUzP9fF2OgqEwwCkt63a/0SyeaZNJHNzSrC
 huECqglULobCr5kl02QunKFYRg1O4uax6i70ePh800TGXuFf7A9EkuaTAxNBaR3Kxjhb
 bRMSaBnkXcBlzO9EpEBHySfz7oasu00My3lJG/+G7c3cqPWqAXCNugwh36Gq0YbTZj84
 FQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zhbmOtRVSFJtYVsAEzOiTEH5L6rjR9goUZ690MzUpHU=;
 b=rpE1Ts6NtOAuF4T8GXhhgRnNDBcpUVTfY8Fo18aNRi7NCcH5rjn35u+C2Rn7Ta9+u2
 1QkormQFu/t5iRWqxFviCznvuqVihZ12LGI+QQuP5mEDfI1rHf4MKIDFcUQjwab16k8e
 TH0Aq78Kltf1oXB8ojS6+idVUZRrzkQUWnRPxh7ASQSKC97N+poVV1l0tJlwJ8tbTHeb
 gZrEi0IIb8YGQzCydi5d3xiDWi19d39zxRdV5VQ9fmsxEJsRp6OkS90eAlcSWpECj8oE
 go85UltNf8tIJtAJU6Bc0g6kI84UebvE9beHIe6Ca3CIARjXXJT6bV3M9ks0z3eS01ve
 9sYw==
X-Gm-Message-State: AOAM533F4TRHcW0ZSe3ncjF4OorEdyxv6rSKTv0oBhAYyyo6lSHGeKDh
 M0kVlcqqYjGXPlN3F3xU8WVF4w==
X-Google-Smtp-Source: ABdhPJyTZvR9EBwNWQ6X3f2vel/AcQ/IWXMKv5sz/vs3RkHjPBtnppVeXo2ZoZZcx9n3vp7BVSuzHQ==
X-Received: by 2002:a17:90b:1808:b0:1dc:8904:76a1 with SMTP id
 lw8-20020a17090b180800b001dc890476a1mr26388452pjb.202.1652815080094; 
 Tue, 17 May 2022 12:18:00 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a17090332c700b0015e8d4eb27esm9490876plr.200.2022.05.17.12.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 12:17:59 -0700 (PDT)
Message-ID: <a56fd076-f838-3e1b-cc3e-efb90c76d9fc@linaro.org>
Date: Tue, 17 May 2022 12:17:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 3/8] target/ppc: Implemented pmxvi*ger* instructions
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220517183735.110342-1-lucas.araujo@eldorado.org.br>
 <20220517183735.110342-4-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517183735.110342-4-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 5/17/22 11:37, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> pmxvi4ger8:     Prefixed Masked VSX Vector 8-bit Signed/Unsigned Integer
> GER (rank-4 update)
> pmxvi4ger8pp:   Prefixed Masked VSX Vector 8-bit Signed/Unsigned Integer
> GER (rank-4 update) Positive multiply, Positive accumulate
> pmxvi8ger4:     Prefixed Masked VSX Vector 4-bit Signed Integer GER
> (rank-8 update)
> pmxvi8ger4pp:   Prefixed Masked VSX Vector 4-bit Signed Integer GER
> (rank-8 update) Positive multiply, Positive accumulate
> pmxvi8ger4spp:  Prefixed Masked VSX Vector 8-bit Signed/Unsigned Integer
> GER (rank-4 update) with Saturate Positive multiply, Positive accumulate
> pmxvi16ger2:    Prefixed Masked VSX Vector 16-bit Signed Integer GER
> (rank-2 update)
> pmxvi16ger2pp:  Prefixed Masked VSX Vector 16-bit Signed Integer GER
> (rank-2 update) Positive multiply, Positive accumulate
> pmxvi16ger2s:   Prefixed Masked VSX Vector 16-bit Signed Integer GER
> (rank-2 update) with Saturation
> pmxvi16ger2spp: Prefixed Masked VSX Vector 16-bit Signed Integer GER
> (rank-2 update) with Saturation Positive multiply, Positive accumulate
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/insn64.decode            | 30 +++++++++++++++++++++++++++++
>   target/ppc/translate/vsx-impl.c.inc | 10 ++++++++++
>   2 files changed, 40 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

