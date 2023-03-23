Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6636D6C6FB5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 18:52:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfP60-0005hG-Rf; Thu, 23 Mar 2023 13:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfP5y-0005fP-9m
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 13:51:26 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfP5w-00026W-Kn
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 13:51:25 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso2702988pjb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 10:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679593883;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=36EgZl4Z+OkPA4/GC7SYMcBbd0ZjnFa3XKbyWtTgFao=;
 b=W1+UsVoe5cPUxnJ8wPqDP1J17iO1hIhBCDodo0ZH7LlzM3bOkl7nMj6PQgP3yYPg83
 qwIuO0+/k+OJym15ggl1v5VVsDkycejt9h51c/PakhbWtv4oJYT23eTLlyQtocAXv8f8
 OW2FujYpTaaNoPWMEpM2Ea4ia9Ki7ygdq1xU9NIQU2Tkmrb5mgSSPA+7ftenvWKnanaz
 3Gib4mF7q0c2btHSIAmLgcIWWl+97fxd6ZDUzRHwt4A5YXaDYZ8G6L+BRMVvEOWysO62
 Pdk5e8PTshCTQCYwJOFFdUDXBX8OjLmFn3qMkcvBd5NqE2Z8uJdCfGcW0xeKd7EGvHAG
 o2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679593883;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=36EgZl4Z+OkPA4/GC7SYMcBbd0ZjnFa3XKbyWtTgFao=;
 b=RcdF/IZSpDtvv2kYmbeIV9pCRI5hWcGevIxEA8ktRLCNBPXS0gZcz86GtADO6riLQr
 njnjUWfT2bpertNoBiICfPh7vKg68i8476Su1Gb1MJuRGifkm82kHy5igM+/wv0VArKp
 to/jn2v+A0PVOtC+YRrghT0eGOXDa53WlRtUz31eQBTNAOL93UjNoYY8VpQO17VhfT2D
 GgpB6ohTE1KkdO0s+U/YM/mFeXUcn82UAE0EkpFRfr9s6Kz06oWKZ/d3gY10hdzBUdcL
 hu3ZaNgD3QyoxbOPRKoOSQ8KrPh6FOwXngklgpLBhIi2+kkJbcMufWMF82IcNvFLd96i
 BnEA==
X-Gm-Message-State: AO0yUKVd/AKRegmYdjROFkCKYpYhU7RqP4Od9VNz6L3iUomHtQvjxgxJ
 3gtlE/tL9spZ0iJcSRSYX74wJg==
X-Google-Smtp-Source: AK7set/4+ykcL2kdHEQedRXhY3AArhXHeQ/Z4D7nS89dy9DEZ7vePRr3Fixv7mmSfaAdMDXhWvUbkw==
X-Received: by 2002:a05:6a20:4d83:b0:d9:8b07:eb08 with SMTP id
 gj3-20020a056a204d8300b000d98b07eb08mr349048pzb.21.1679593883203; 
 Thu, 23 Mar 2023 10:51:23 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:226e:47e1:b8cd:a957?
 ([2602:ae:1544:6601:226e:47e1:b8cd:a957])
 by smtp.gmail.com with ESMTPSA id
 w129-20020a636287000000b00476d1385265sm11959743pgb.25.2023.03.23.10.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 10:51:22 -0700 (PDT)
Message-ID: <0608d81e-4ac4-b090-b267-3bd0d058b898@linaro.org>
Date: Thu, 23 Mar 2023 10:51:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 8/8] target/arm: Add CPU property for QARMA3, enable
 FPACCombined by default
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
 <20230322202541.1404058-9-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230322202541.1404058-9-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 3/22/23 13:25, Aaron Lindsay wrote:
> Signed-off-by: Aaron Lindsay<aaron@os.amperecomputing.com>
> ---
>   target/arm/cpu.h   |  1 +
>   target/arm/cpu64.c | 48 +++++++++++++++++++++++++++++++---------------
>   2 files changed, 34 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

