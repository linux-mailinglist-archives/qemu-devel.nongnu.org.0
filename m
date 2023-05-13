Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807E7701664
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 13:27:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxnOA-0000WK-Ju; Sat, 13 May 2023 07:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnO6-0000Vr-9p
 for qemu-devel@nongnu.org; Sat, 13 May 2023 07:26:10 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnO4-0005Nm-Ok
 for qemu-devel@nongnu.org; Sat, 13 May 2023 07:26:10 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bc25f0c7dso19651605a12.3
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 04:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683977167; x=1686569167;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y8E8C+yE5MHCFBvwa5cWNm7L553/azPboyO3J+hpsDg=;
 b=iQHV0e2nIhR9+XpyWmhzWAPWkKwLluPb/tXEEmfsV0Va8F7ybqLeXRHfsSmlsAIwru
 V9ILt4Zt339H6T89mRJzn/Q3GRfoXYkFvjYDVphUuWh041y9wEM96WCKHlFlThnV+Qzq
 UQ6pkCmBEkgI3dktg29L0GZqO5+byPRqFnb30amxbCxBvSmEQq2eKZXP0Y1CrIj9o57/
 zZFXKHEhgxRbzPhTc9vSB9/2c8+/GVUJ5uZ2u4CORMc3aoMwJXv9/K/VNGCr9cYPPAkU
 ll/GEUYJUP62KQuWzK6l6Q1nyhFnYuU2HBUDrgx+0RWrYh5eC4asCFh21rZAm0ZfgR98
 o/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683977167; x=1686569167;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y8E8C+yE5MHCFBvwa5cWNm7L553/azPboyO3J+hpsDg=;
 b=O5ZucZrSTT/nR9a+AQHKkG8SlgifiXNavsLVUKfx8CJJe6yIWkv+fDFcEj1mlKLiIm
 0MnDOiHjqllxpPNoNM3T1jO9/F1gFlJ+nPrz51LK2hszAP4wKGmVeqFiKv0UdRF/89Mp
 3EmSGhDb15aFiPXtqB3xdGrQwmfG5Hm3713MOozaVV9hWX/LYipXXv5htVG3ttx8luV7
 OAkHTmwScCFexeEetOSliImMuZSeori5KkKQCYsaPgAwKKUX0qXMR8Ekk3G68EYWP93R
 ciQfLz30ME/k+30X4VTIWuZeRbqCse8V1e2bGtCCNJusBKogvDp7ABe+V4XCDI11FOCe
 mfKQ==
X-Gm-Message-State: AC+VfDzdH5RHQwSxm0aq42z/o0OQHuJ5pqNa2mo7IjZT82Nutqhp7BlG
 zFO3B52iZl8nM8urDOvSOPO1Yg==
X-Google-Smtp-Source: ACHHUZ5BRuWxzNiReB6oe8+T4UgVKLkpR8Djg4EFFKL40rhH3JcPH+IjfLFk1+bMdKmuyvnFfOfsdQ==
X-Received: by 2002:a05:6402:128c:b0:50b:c72a:2b1b with SMTP id
 w12-20020a056402128c00b0050bc72a2b1bmr21061153edv.19.1683977167054; 
 Sat, 13 May 2023 04:26:07 -0700 (PDT)
Received: from [192.168.190.227] ([109.144.17.21])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a50fb0e000000b0050bc6d0e880sm4694825edq.61.2023.05.13.04.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 04:26:06 -0700 (PDT)
Message-ID: <8d26d18a-139b-a32f-a9ce-12a14232de29@linaro.org>
Date: Sat, 13 May 2023 12:26:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 17/20] target/arm: Convert BR, BLR, RET to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.923,
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

On 5/12/23 15:41, Peter Maydell wrote:
> Convert the simple (non-pointer-auth) BR, BLR and RET insns
> to decodetree.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  5 ++++
>   target/arm/tcg/translate-a64.c | 55 ++++++++++++++++++++++++++++++----
>   2 files changed, 54 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

