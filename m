Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06E85A32B5
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:38:50 +0200 (CEST)
Received: from localhost ([::1]:55302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRiuW-0002yv-TV
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRioV-000439-Vx
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:32:50 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:38569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRioD-0001xn-7X
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:32:19 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y127so2926533pfy.5
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=8tEO3frkmcqPRkO9l3haL/uGBNlPwJg6ioFF6pyHa0Y=;
 b=bAKlwaKI9iq112Y+supl2L2qzuWb/okdE2zVUIFYGR87AWcwxD7e3imNcmFmJESkCe
 qOcNcZjfzFkqBjnI1JTWeLM2/v35lXEkUazYPRUtvfzfNoxDnFai0pphAyq197GoWgvQ
 Z+rehvjMkIJ2lWmpQkwF7nM/Yog5r+jMO2iMBV7p3412LpWD3q/T4dFS9ejWCj6f3N+M
 H7ITw5Kj35zDcf5jH+nrsKVYSGfK83mdFM8tZkUaCIKuVXzI/UMey/rfUOduzxPxmTtj
 27GFmm3gkSYMB56jkG1ijHiH8+3blL+tNbQNLxOnqIK02ml2L6j++cR8ltwfnqsREuLA
 J18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=8tEO3frkmcqPRkO9l3haL/uGBNlPwJg6ioFF6pyHa0Y=;
 b=rLc1Yr05Ugk8sXUiPgexHRIf8Nh5jOhFN/PK1PbJv6VVYlcu4iAsyasViZM9LZ64pe
 CSapnnnqPkyIDzXD2dLappPQIN1A76x9uSwJfCWW056l5EddCA+RkTWfpwjk2rbJ9EvS
 nM3Ui/XYdzQEXRZEUe5gK2Toe3HNtOvy6OLTSGwewyT4usPaF3B7H9FxN6nbyxF/Ls5N
 t4Zl+9Fn+fbKzN/YLYJdDZC40/MLasDIMqkZAnyfRBrhdoEAs5zqD6BEcgPPQLT0qkZj
 jRf0qSoZRAELoQ/nVdRHltm7L/QuzLtmqOwUGX5iglYGStmdVUSWuoqU1NGx9u4OsVUU
 V2Vg==
X-Gm-Message-State: ACgBeo32FVVTh7CwX7wLjoXHPyoIMyeXcGM5g11TMXK8IX0prFKvS2vl
 BZTzYvLEYHPH4Jwko0/HvFvjnQ==
X-Google-Smtp-Source: AA6agR6JAGKR886+0U9WGhpu000/ZU8iCIKcn4mKX7vWRVp/PwbNBRhepCBJV73ZoqcVlsht9EFmIw==
X-Received: by 2002:a65:498b:0:b0:412:8e4:2842 with SMTP id
 r11-20020a65498b000000b0041208e42842mr5028905pgs.71.1661556735514; 
 Fri, 26 Aug 2022 16:32:15 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f?
 ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a17090a4c8300b001ef81574355sm85724pjh.12.2022.08.26.16.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 16:32:14 -0700 (PDT)
Message-ID: <bc2ce8ba-8617-6b99-53dc-2b96189ae349@linaro.org>
Date: Fri, 26 Aug 2022 16:32:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 10/23] i386: do not cast gen_helper_* function pointers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220826231204.201395-1-pbonzini@redhat.com>
 <20220826231204.201395-11-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220826231204.201395-11-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 8/26/22 16:11, Paolo Bonzini wrote:
> Use a union to store the various possible kinds of function pointers, and
> access the correct one based on the flags.
> 
> SSEOpHelper_table6 and SSEOpHelper_table7 right now only have one case,
> but this would change with AVX's 3- and 4-argument operations.  Use
> unions there too, to keep the code more similar for the three tables.
> 
> Extracted from a patch by Paul Brook<paul@nowt.org>.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/translate.c | 75 ++++++++++++++++++-------------------
>   1 file changed, 37 insertions(+), 38 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

