Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 393576A28D7
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 11:14:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVrYo-0003oF-9i; Sat, 25 Feb 2023 05:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrYm-0003no-Lm
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 05:13:44 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrYl-0003gR-4N
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 05:13:44 -0500
Received: by mail-wr1-x432.google.com with SMTP id t15so1591782wrz.7
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 02:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W7KRw6PMlBZzNstxpv1u7AClycWc9GpPdytB5zsafC0=;
 b=OLD7DOkUm55SpQrgQj4pW9G/jo1qQdqVxp3taj1bURuRu2ypQzF3FfBfTE3o4lay3W
 /nHn9WCRj2CyQA8Va9SvDeIeUO24qNkLyMeBwVWTbIhwBHI60HskGyf+6bsP1WW/fjOT
 JQnUK0NkQg3JUGkTyGOOBgu5oOHPdm9vNip1S3PbbAHz2E0swU9CPf0PR17vbcqisG7q
 fa/AW7bkgkRbunUvr2WpvqlTO+Ak5sVG8OAZDsfsQFMXTgNkn9SNVARiApqzGcWG+icZ
 kgT/fwx/r3yzwdpYzj6qI3nRKUc401hzwIVJ6mhR6vtZHLT2tw1lnBYP0LK1+opd6aXn
 1zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W7KRw6PMlBZzNstxpv1u7AClycWc9GpPdytB5zsafC0=;
 b=dxuWkqvHYJIyyPoqhBQWvuZs/aH4E9Gpwz9ubPRJqZMe1Flq+l/+PZT4JkOdruA2IL
 G9B9Vghboq5eXCTYp+Q4/eoX6okw03EHDW23/yrGbgF7LUSxsZKhagZ22hD5yVpxPLyq
 HKh+y8Ei7e+ObdNs55EfKkSmYLoMflI8cKPtEa2GQXd4/XF6huAX/QK68zNExt2yLspM
 Rps/nF+1P73/PWMdYJN6iZYGJNztas0F3imofYfDvjEsV8J2ENaFwshIgGJx2dzOYgWI
 fl85syx8rt9sH3rSdvykiYX4bTh8Pu5o6gdwjALRwRTeUCQE3hR+nWTnwS1cVt5H1obC
 +DgA==
X-Gm-Message-State: AO0yUKUDAAYgx/KR+AiJCxdF2uXnDKRvJIX7Gz+hlDXSM3GxrS2yaQ/y
 S76bFSvpU06DIZLOSBhmyogLz3iBOidGrs6T
X-Google-Smtp-Source: AK7set9TO3jGBa4xdmrAwsvMazK6SlrIFNc5AuK9j83jyfQbXOWoF2oAhRRNe2vdl2iEjU3TmZxuVw==
X-Received: by 2002:adf:f390:0:b0:2c5:8353:e0ec with SMTP id
 m16-20020adff390000000b002c58353e0ecmr15818378wro.10.1677320021641; 
 Sat, 25 Feb 2023 02:13:41 -0800 (PST)
Received: from [192.168.136.175] (120.red-95-127-35.staticip.rima-tde.net.
 [95.127.35.120]) by smtp.gmail.com with ESMTPSA id
 k10-20020adfd84a000000b002c55551e6e9sm1329092wrl.108.2023.02.25.02.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:13:41 -0800 (PST)
Message-ID: <9119a309-5dd7-f1c5-43e3-b9f61ca67ab4@linaro.org>
Date: Sat, 25 Feb 2023 11:13:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 20/30] target/arm: Don't use tcg_temp_local_new_*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
 <20230225085945.1798188-21-richard.henderson@linaro.org>
 <93fb111c-818e-d644-d132-41b6d0cd0fb9@linaro.org>
 <fd2c7018-ab20-efa6-fe46-23e857c46843@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <fd2c7018-ab20-efa6-fe46-23e857c46843@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 25/2/23 11:09, Richard Henderson wrote:
> On 2/25/23 00:05, Philippe Mathieu-Daudé wrote:
>> On 25/2/23 09:59, Richard Henderson wrote:
>>> Since tcg_temp_new_* is now identical, use those.
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   target/arm/translate-sve.c | 6 +++---
>>>   target/arm/translate.c     | 6 +++---
>>>   2 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
>>> index 02150d93e8..718a5bce1b 100644
>>> --- a/target/arm/translate-sve.c
>>> +++ b/target/arm/translate-sve.c
>>
>>
>>> @@ -4342,7 +4342,7 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr 
>>> base, int vofs,
>>>           tcg_temp_free_i64(t0);
>>>       } else {
>>>           TCGLabel *loop = gen_new_label();
>>> -        TCGv_ptr tp, i = tcg_const_local_ptr(0);
>>> +        TCGv_ptr tp, i = tcg_const_ptr(0);
>>
>> Can we directly switch to tcg_constant_ptr(NULL)?
> 
> No, i is written.  This ought to get changed to tcg_temp_new + 
> tcg_gen_movi, but that'll wait for a different patch set.

Indeed. Sure :)


