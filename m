Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 102C66C82BE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 18:01:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfkmn-0000X1-2K; Fri, 24 Mar 2023 13:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfkml-0000Wt-Oa
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:01:03 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfkmj-0007de-Is
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:01:02 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 lr16-20020a17090b4b9000b0023f187954acso2213146pjb.2
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 10:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679677259;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3BrjrwwT88FeHEx8xF+ALqxpNCbBHkDcivNW4pyG/SA=;
 b=DQLmkUKovXDQPn/fHskaRUy6wY6LzUafA0FJdfvzhc8Z6NOvcf7hNK50nPz6tr3i0f
 zPpxFlfdqWpOx2oTZmTStlBzGGJIkiYqu2HU6WtJJ+Z3bjwziHkUhFDK2bRhEu2rECW6
 tAOMXgqgIgEBouPWEQLj3Rr48QuovvZWY7lOLRT8iAEiHqMjS/C9zCJGJHTWg1JeC3tJ
 916gRsrXRvFwq5dLx1Qu4EqawrmJ6JD6jgLb+y5l8vtkkcJYL2aX5tFr9dxzAkhSb2sk
 Om93WwT/Tl0ZLp+SwIBEMdixBhDbgGJ9W1NZSp/fLLpOESbPqJaO8dh0aHWs6yrOdqqU
 Hhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679677259;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3BrjrwwT88FeHEx8xF+ALqxpNCbBHkDcivNW4pyG/SA=;
 b=npYYzHlcsb0U+8rTVcuI7pqpZVgepje/cEjkt3qHl8+eHOSgZyqxYJQm5iIiBCGEqd
 +wq76qHjP+npDN+XLvgBdaw5gdY6P7WGg3I/DHmSaPh7UBrB+h+hPtQYxUB0vkWxxHHv
 97+euzUbsDsWA0bfo7KCzkhrZXP+EgTk7fPjVV8Plb9Gr8ssXWYB7OBrq93WogA/9JBJ
 kZFJiIB72dnO7Yg5hjQeRbhUoHaWNrUNuxLm9K7zOEZfaFBn9yTTe1h2Mz26XeqZeBLg
 UP9mraTba5PToUZq4X8Del4N5mZl//m3MhtqbkPgVa8y7QQipV3gPtjoFGnWC8C4AEJL
 PQUQ==
X-Gm-Message-State: AAQBX9cD4HfB6GXmIOTKWyqVxEkRKTkyGwLHQVJ+MHsHsGbGyDjLJ+IG
 twXY1iTNuv94Wi1wmPeUKvSndQ==
X-Google-Smtp-Source: AKy350a3U0GJznJBAytP96SMDDv2AQngaC+txaXhLjBAVdilpRoMaZq8+Nity5cxFc6Pxt7MXQIZ8Q==
X-Received: by 2002:a17:90a:d583:b0:237:3f83:61f3 with SMTP id
 v3-20020a17090ad58300b002373f8361f3mr3653293pju.16.1679677259375; 
 Fri, 24 Mar 2023 10:00:59 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 ix18-20020a170902f81200b0019f1027f88bsm14454942plb.307.2023.03.24.10.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 10:00:58 -0700 (PDT)
Message-ID: <84fac4a7-84f0-e89c-83b1-0a169372201a@linaro.org>
Date: Fri, 24 Mar 2023 10:00:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] target/riscv: Extract virt enabled state from tb flags
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
References: <20230324055954.908-1-zhiwei_liu@linux.alibaba.com>
 <20230324055954.908-2-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324055954.908-2-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 3/23/23 22:59, LIU Zhiwei wrote:
> Virt enabled state is not a constant. So we should put it into tb flags.
> Thus we can use it like a constant condition at translation phase.
> 
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/cpu.h        |  2 ++
>   target/riscv/cpu_helper.c |  2 ++
>   target/riscv/translate.c  | 10 +---------
>   3 files changed, 5 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

