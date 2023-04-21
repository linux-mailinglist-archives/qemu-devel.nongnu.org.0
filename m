Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A916EB3EA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 23:51:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppyel-0004pj-D0; Fri, 21 Apr 2023 17:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyej-0004oz-1D
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 17:51:01 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyeh-0005a2-Fk
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 17:51:00 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f1763ee8f8so15855265e9.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 14:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682113856; x=1684705856;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ExG9km92T53LchPRBqkF84qokCaalE5AvlkSZgbrmW8=;
 b=YOoWdDLqxxcD14i9LYCPVffbOMWb8ylPsZjnSGcFf9M/Vj8+u7ak937jq/+oj3dHM0
 3YrsaNE4qDQ81klzGLeT+ZK/mYnskTAtmAEd012OtQA6XXy8goshEY0mG/lJIZLdu9JL
 875cn2fgxyJnMwI5Kfo9MK3tBFcMXzNoqMTDGCnFbxSU9Lpq3fngEZYMDJQDJ471CiHo
 uEb99Qldns+fezzIXBjknHcw05kDEPPKwi93Gj+fOMQA4RrvWWXLGLBfL1whZCIz2fl3
 WSdgtoiVilJnvMTDmE4RlZwRcUO5oAjcASwhejCbb/bNEFEU5X3p8B76flOv3vWr2bHL
 ojJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682113856; x=1684705856;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ExG9km92T53LchPRBqkF84qokCaalE5AvlkSZgbrmW8=;
 b=PmNIJRLnGWc/VPIwOblamQF0rHQClhU6DWxYMXB7sY2nPjnqpPLvgqmvsplvpSrWkG
 UgJd5vYW20nhq7pZSpNBRjpHnLOysbjwu1r1NXTfOGtMpa7h/gOCUtz6WvfRmcy7bF6Y
 tf3oLn6krUdsv1KobJJ2OmgR476gUKJULplKt0eAXZspxGu8okyL0ON2f8cfXt2OPxG5
 caSy0TdA+f/yVHTQCtBacTbjdzDfZ8mfVNXJ2Va2ndJS5VgkXwHFOmmlQAiSe6bmNloi
 EXVqVhWruI2b/RAuAJjiUvrwsLgHsq76Ifb8HWK0BHlXTNm5j+qBXTPA5BQ7s6uT2aL6
 tKbQ==
X-Gm-Message-State: AAQBX9c/O3QPIbHLU997rF8ZoWey17PdS7ZBREpodITult1+lfVSy5WY
 p1Wzn792wpeueiCXWy4r4yvlKw==
X-Google-Smtp-Source: AKy350bc3kjZiCYC+P4jtXwgYvm9nsaS1zL0BFyP3ceZpAJyZ3XSxs9x/F5KTLI1qluVd49xKlDHLQ==
X-Received: by 2002:adf:f544:0:b0:2ef:b080:829a with SMTP id
 j4-20020adff544000000b002efb080829amr4328709wrp.11.1682113856143; 
 Fri, 21 Apr 2023 14:50:56 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b003ed2c0a0f37sm5826520wmj.35.2023.04.21.14.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 14:50:55 -0700 (PDT)
Message-ID: <f90583d1-6033-845e-4da9-20cb2b8bd79d@linaro.org>
Date: Fri, 21 Apr 2023 23:50:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 04/42] tcg: Split out tcg_out_ext8u
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/4/23 04:42, Richard Henderson wrote:
> We will need a backend interface for performing 8-bit zero-extend.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  5 +++++
>   tcg/aarch64/tcg-target.c.inc     | 11 +++++++----
>   tcg/arm/tcg-target.c.inc         | 12 +++++++++---
>   tcg/i386/tcg-target.c.inc        |  7 +++----
>   tcg/loongarch64/tcg-target.c.inc |  7 ++-----
>   tcg/mips/tcg-target.c.inc        |  9 ++++++++-
>   tcg/ppc/tcg-target.c.inc         |  7 +++++++
>   tcg/riscv/tcg-target.c.inc       |  7 ++-----
>   tcg/s390x/tcg-target.c.inc       | 14 +++++---------
>   tcg/sparc64/tcg-target.c.inc     |  9 ++++++++-
>   tcg/tci/tcg-target.c.inc         | 14 +++++++++++++-
>   11 files changed, 69 insertions(+), 33 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


