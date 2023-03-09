Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933DD6B20A2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 10:50:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paCtT-0005FE-G2; Thu, 09 Mar 2023 04:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paCtM-0005Ef-76
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:48:56 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paCtK-000284-Ia
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:48:55 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso3134536wmq.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 01:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678355331;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xqlcXvsUw9cDNEOkwiK92qm/KTc7ON8TU8lXpZr/Y+0=;
 b=wRwRyU3Reuy52GtTL1auCh5MpbVPVvzet0Pe5lFGjaL21F4sI7IsUSgXuqIE7RwPpX
 CfBAadBU8FPSEC/85aggbnxJnB6GEFVk/TspEfFE/D8YUHZH4xfn6ed2t6abPWHSrhb6
 R+3sJ3y3p5ILxRt1+jRleog+vfyep4IJVnUHa+zrumpEtGdTQSNFtTk0bCZsJWCBKkd3
 o6TG9WHYW4HvqmvZgPuo7qP3PXwwQvoAHZlMuzoyGovvVtCXUhapzpTu3kD1RIOGhicp
 Yp+0+Bxr/XGXOCnFE50/WCzg99rG3spKy0nD9lEyX5rm7sgGhWb5ONPaIOTkSz6tpJ8k
 rARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678355331;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xqlcXvsUw9cDNEOkwiK92qm/KTc7ON8TU8lXpZr/Y+0=;
 b=SnRHmzYexobWfksGHiqtnIrP8P1z8FZCvUlbgIYzTaeteHqqKUh7kl7b/l8AfV/zOT
 7GF5ss0RvxHdFQF/N1MxtpjoPUFNAmYoF8WJYmxgJkoOSn2MVz3xfqRMs/pR4yaoQGS0
 QaYjXY8wDCbqRgtljQnqGnyHEDhnP/3U5Y9WI/Dqmui7lPK4ixAYjdc3M4lENZ70cN15
 tZvgSjb59+hhTmOolIE4byI74ake2BkHiFjuZpR8IazXkB1QYO++vPUEwsFYyfl0/FUU
 +kAvKxAnSjwEWS/WaepSBnTsgLt0O6zjA3au0xhAMPqelxUG6EXfPWXu7FcKaNOVmvO8
 5jWg==
X-Gm-Message-State: AO0yUKVOThro6rQfN0QLwKlCLO9i7XkvMKi7/OfuU59w7ublONJff56z
 CsYmIUQncuYg2Cm1vOnkrQHPtg==
X-Google-Smtp-Source: AK7set+A6/iaHIgSDt3Au4C9z3PqPwuG6ZlmJ3/ef6VXnyEK/7TNaYRwmkkbyo1mSRwcdccS36T1zA==
X-Received: by 2002:a05:600c:1c96:b0:3ea:f6c4:5f3d with SMTP id
 k22-20020a05600c1c9600b003eaf6c45f3dmr18406980wms.2.1678355331091; 
 Thu, 09 Mar 2023 01:48:51 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c310a00b003eb369abd92sm2294280wmo.2.2023.03.09.01.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 01:48:50 -0800 (PST)
Message-ID: <d3e78433-e7b8-2557-041e-6916c91ca459@linaro.org>
Date: Thu, 9 Mar 2023 10:48:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 05/25] target/arm: Create gen_set_rmode,
 gen_restore_rmode
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307183503.2512684-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 7/3/23 19:34, Richard Henderson wrote:
> Split out common subroutines for handing rounding mode
> changes during translation.  Use tcg_constant_i32 and
> tcg_temp_new_i32 instead of tcg_const_i32.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-arm@nongnu.org
> ---
>   target/arm/tcg/translate.h     | 17 ++++++++++++
>   target/arm/tcg/translate-a64.c | 47 ++++++++++++++--------------------
>   target/arm/tcg/translate-sve.c |  6 ++---
>   target/arm/tcg/translate-vfp.c | 26 ++++++++-----------
>   4 files changed, 48 insertions(+), 48 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


