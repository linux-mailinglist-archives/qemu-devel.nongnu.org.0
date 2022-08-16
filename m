Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2436459647A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 23:18:07 +0200 (CEST)
Received: from localhost ([::1]:59790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3wr-000711-Hd
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 17:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3N7-0007VV-Vv
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:41:12 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:37793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3N6-00060I-2b
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:41:09 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-10ec41637b3so12960187fac.4
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Y3dMJQsWCzoReIC5Pnpjsru/SDKUKCLm1SMo3ujwlcs=;
 b=zS+yVW1fNAHYXW4RMmqDtJ/lsB/zw0MUnggol52OXnGDwjL2TsqHUpG4hoiGLIJKDR
 JdlXfxA8jQqQ3WE1KsHJNnirJ/+yEyn2bh+f8rtfrdS4ehrzDLZK/Cg1b/+8HdQe0n2S
 HF608XpO4LoQLrLAb+BmvIZjx7l8I+pCboyizM6mW/qutnbiLJ2FrPRSAJ6Z7qgtJOCL
 YdYnq+d6Pc6QCcH2ibHrJ2hEPDfjLHLpIq2VrUIk8bqCLmMnIAubQf5p8noj+HpOnOMb
 4pt9Akd80zPh52OLlp/0ge7YhtqQeRHlxhHgNbUI32jsVwUzpxRfiHYHsxmUR9pObZKc
 gZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Y3dMJQsWCzoReIC5Pnpjsru/SDKUKCLm1SMo3ujwlcs=;
 b=sVXVL8rRTW+72da5B5wWa9757pJ1y5nKAW9N0SZuNVEasE9+zGLEurcdQkqAf7ud2+
 S69o42oxlLC0JMbKtrLRbVdSwiS52RG4Q9jrhsYF94fLK+ZGXbx7fm327ek3BQ9tX9PL
 6QfnF8R1sg41wSk0S89iwH0cIvbc8EsNgPO5BRu1K70MEyaGZpd+6h8e9Cos8b/y40ok
 rBJebAGcQqJ81aokdPBLuzIUjHxIHq1dVDpToZ53NIkGmkOqYex8Qd5utmWWTH7HBNbr
 7JE6fRjK0j0d88C75wRN+zSzSkoKI5PoMKpJAIFH1RHAKaJwBDvZjvzQ6srfSbkq1iMP
 +l2w==
X-Gm-Message-State: ACgBeo1NrBwjl9FA/idm6KlkmtNzmHcepCW2ZYEyX8/Vh0eqB+L2UmwB
 iT8/rABPN0wD77TaGciUct+dQl+C5ebi6A==
X-Google-Smtp-Source: AA6agR51HJNAZ5MFAGopMMAospDifG3aNepvximyfZUIHZxvH7Pl4w2v+CHDtyeyQcRDm6SRcxNWPQ==
X-Received: by 2002:a05:6870:56a8:b0:11c:3b32:e16a with SMTP id
 p40-20020a05687056a800b0011c3b32e16amr151644oao.117.1660682466969; 
 Tue, 16 Aug 2022 13:41:06 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80f6:61fa:9bc2:5095:d612:5e22?
 ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a05680808d800b0033a37114eb0sm2547633oij.19.2022.08.16.13.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 13:41:05 -0700 (PDT)
Message-ID: <417621e6-d20b-f3c5-bafa-c011e0426b35@linaro.org>
Date: Tue, 16 Aug 2022 15:41:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 33/33] target/arm: Enable TARGET_TB_PCREL
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, iii@linux.ibm.com
References: <20220816203400.161187-1-richard.henderson@linaro.org>
 <20220816203400.161187-34-richard.henderson@linaro.org>
In-Reply-To: <20220816203400.161187-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
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

On 8/16/22 15:34, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-param.h     |  2 ++
>   target/arm/translate.h     |  6 ++++
>   target/arm/cpu.c           | 23 +++++++-------
>   target/arm/translate-a64.c | 37 ++++++++++++++++++-----
>   target/arm/translate.c     | 62 ++++++++++++++++++++++++++++++--------
>   5 files changed, 100 insertions(+), 30 deletions(-)
> 
> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> index 68ffb12427..ef62371d8f 100644
> --- a/target/arm/cpu-param.h
> +++ b/target/arm/cpu-param.h
> @@ -34,4 +34,6 @@
>   
>   #define NB_MMU_MODES 15
>   
> +#define TARGET_TB_PCREL 1

Oh, this was meant to be system-mode only, as there is no virtual aliasing in user-only. 
But during development it was handy to test the feature in user-only.  And we might find 
that maintaining both mechanisms is more effort than not.


r~

