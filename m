Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412036F2403
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 11:49:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pshBV-00047x-Og; Sat, 29 Apr 2023 05:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pshBT-00047g-Tr
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 05:48:03 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pshBS-0007ZU-Aa
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 05:48:03 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f19ab994ccso5772455e9.2
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 02:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682761676; x=1685353676;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0aHkVA+fGQFKU2NnUOJA5cKLsWNNv0uUUsMBeLctyXM=;
 b=rkxvwAihZ3VrmIH61BAss3kxWfuK3fJ5ecVF0HuPGVuS2U36yDSm9nVjab9grKu9sN
 807k71S7Tc4pYNZ7AmiwqKtLzlPc9ZO0S4JZ7sF2uoayo6o9LQLvD8xpw8ctcRNEKGS5
 OqOHRsjwkkyqBS84kWycbFnbm8Bn3lof4VRAVSfmbR1i8MRtBTKFE2ajM9Kx4b6dLDjw
 uUry3X5Om6h1liJFIVbUQ1lpJOivdhbrqQfGRxkI77f2ok7SdnyvMQ+VqQZZr3UhNp59
 +XD+P+RrqTZojMoMz3PuiB+/GhpKAveCuWvKAlMedEJ363hHqD06B6RGZ0nyNhfYK9Yi
 ndUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682761676; x=1685353676;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0aHkVA+fGQFKU2NnUOJA5cKLsWNNv0uUUsMBeLctyXM=;
 b=A8FjXup2OWv3XzYEVLBSpq76gQWSe0o/tlmrvEeYkHtkGBPbQXND6e2KalItyPhpnv
 PSU/0GL0+rIsxVbWFQzUTtHVN1J4CE5ztr8FxTkQHCqQ9ijv0Ll5vNYZZhfBRHEztbGy
 Xy9AQKUSlQAVrhUra9ls9FRdYUsTy8vBcqWXXnyyyKupeHWGylIyIxeQF+0wq3tZtD/+
 eg9J2MQXDCrqQkZjWiw82TZi7fzvsh/YNGE1fl4pfu/tMYFNC/oMtNknms7D3XbVCqyU
 lpGpu2XeXtVPGipsU5fnzrymKq6R65/EffYDueS6WsMc5PCkTLb8JDoSiwdBd89YAsuE
 hb+g==
X-Gm-Message-State: AC+VfDyGW1fsXGoWKoNfqBHoP6n3np8XyGUNy/W/JTubf37YIoUFTO4N
 C6oSlRiW/i5mhkdMX2k7Yiv7TA==
X-Google-Smtp-Source: ACHHUZ4BL9I8Hbq7iRkpo90mZBmV9OlpLM1xQTMNT++7ILqTTmPwMJRpYNoJF6r0s/Eahtu3nf8TOQ==
X-Received: by 2002:a1c:7317:0:b0:3f1:82a1:122 with SMTP id
 d23-20020a1c7317000000b003f182a10122mr5837348wmb.21.1682761676422; 
 Sat, 29 Apr 2023 02:47:56 -0700 (PDT)
Received: from [192.168.1.17] (78-141-23-110.xdsl.murphx.net. [78.141.23.110])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a7bcb03000000b003f16f3cc9fcsm26792943wmj.9.2023.04.29.02.47.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 02:47:56 -0700 (PDT)
Message-ID: <74e1b3e2-ecba-046e-535f-dc483c38bf2e@linaro.org>
Date: Sat, 29 Apr 2023 10:47:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] rcu: remove qatomic_mb_set, expand comments
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230428105035.134089-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230428105035.134089-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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

On 4/28/23 11:50, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   include/qemu/rcu.h |  5 ++++-
>   util/rcu.c         | 24 +++++++++++-------------
>   2 files changed, 15 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

