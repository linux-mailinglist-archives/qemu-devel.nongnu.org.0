Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6B96D666E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:58:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pji6X-0002Ja-7A; Tue, 04 Apr 2023 10:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pji6U-0002JH-Hk
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:57:46 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pji6S-0004Pf-Oq
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:57:46 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso1133731wmq.2
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680620262;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0YBLK65VEMYSJ65zBUbq3JEBAHbzOYPLJJxdIT8wRn8=;
 b=cLT3nA0n+lsIm/O3ni/X8FikJ20PZtot6dUITGKFLChyqRFb59giztGOZUnpZeNwJo
 9KS3PAkvEHNC73tyNbDmMo7AKefAOC6XkwW1SoZy2LDXrawS/I4uIxUy0ePLp70GbG+q
 /B8o9/4xdkATurMN1TSGwsLnMN9OxN9+lqSpl6Qc/oDT5ahkZS3ys7/AL1VF9vOOQxkd
 p3hoKcNVY3QUnXQL0AwJ5ChnnBPyYFAqHgpFYz6srQ2EXN1YX9JAAtfGdJsZg+dgx83v
 ZD03RsXOflAvMjXezcPdw3sR9F0lsf2qzYqFnJlzDwuEZuvcaK0gDjqbM55cV9LvhjQU
 ibBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620262;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0YBLK65VEMYSJ65zBUbq3JEBAHbzOYPLJJxdIT8wRn8=;
 b=nD+aJbkkmS3EjpkApqV2e42V5vbg+/zE9g70uEU9XAnzwxiBFV3JxF+0/iE/A2DKWh
 LeZzwysDx79SoabHsJhkIQDd6cYvqFyt2eWT7JUXPgCUUtY51sD9Ge4WTYtND7bcCqOy
 NPI4vXYhSnEQwKmhoynjMMMVI9HNsJfNi5KqRjdNrDpzRGn3qEeSYgRNC4GpEyavkfYE
 5z6Yxt8iizDjG8kLo5U37gzLTJohoTIjDVvU5/1w8W5Y+fItVpPR1bkYLodReMu5TA/+
 cvvAQNzf4puYenh3xb9yDDfgbXMVKa+r41df5IzqJI7x5p1mf60bVsc4i2MedfCCnBhH
 r83A==
X-Gm-Message-State: AAQBX9cvsASCMDer7FSPQMH8bU0EucEULQJ5v6Pa6MPCiCPMMdW6I1FK
 psc+PbX7g111RgekBemlAh6r4Q==
X-Google-Smtp-Source: AKy350buNDQ8Rbhd1q+hKGwYOWloXvdio7b3idzVRBIX3xtef1pKaMxGKdPf0ywgvBUD20UISjbyQQ==
X-Received: by 2002:a05:600c:25a:b0:3ed:237f:3da with SMTP id
 26-20020a05600c025a00b003ed237f03damr2575721wmj.22.1680620262525; 
 Tue, 04 Apr 2023 07:57:42 -0700 (PDT)
Received: from [192.168.69.115] (gra94-h02-176-184-53-13.dsl.sta.abo.bbox.fr.
 [176.184.53.13]) by smtp.gmail.com with ESMTPSA id
 v13-20020a05600c444d00b003ee8ab8d6cfsm22971558wmn.21.2023.04.04.07.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 07:57:42 -0700 (PDT)
Message-ID: <b1594026-6e0e-d55e-9f2b-323ae80eb843@linaro.org>
Date: Tue, 4 Apr 2023 16:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 2/3] accel/tcg: Fix overwrite problems of tcg_cflags
Content-Language: en-US
To: anjo@rev.ng, liweiwei <liweiwei@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Junqiang Wang <wangjunqiang@iscas.ac.cn>
References: <20230401045106.3885562-1-richard.henderson@linaro.org>
 <20230401045106.3885562-3-richard.henderson@linaro.org>
 <c91e5f52-32db-c381-3286-1d22e15a2141@linaro.org>
 <3212ace5-a35d-ac74-c786-29c3e124065e@iscas.ac.cn>
 <648ee10f-727d-63a5-f6de-8bca3de236fe@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <648ee10f-727d-63a5-f6de-8bca3de236fe@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
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

On 3/4/23 12:44, Anton Johansson wrote:
> 
> On 4/3/23 11:09, liweiwei wrote:
>>
>> On 2023/4/3 16:09, Philippe Mathieu-Daudé wrote:
>>>      cflags |= parallel ? CF_PARALLEL : 0;
>>>      cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
>>> +    tcg_debug_assert(!cpu->tcg_cflags);
>>>      cpu->tcg_cflags = cflags;
>>>  }
>>> ---
>>>
>>> Li and Junqiang, what is your use case?
>>
>> Only few CPUs support CF_PCREL currently. I found this problem when I 
>> tried to introduce PC-relative translation into RISC-V.
>>
>> Maybe It also can be reproduced in system mode for ARM and X86.
> 
> Yes, this can be reproduced on arm-softmmu with --enable-debug-tcg and 
> the above assertion.

Ah OK. Then...

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

