Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDE25A1616
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 17:48:21 +0200 (CEST)
Received: from localhost ([::1]:49136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRF5f-0006TM-MW
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 11:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRF2D-00040V-NZ
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:44:45 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRF2C-00004w-4f
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:44:45 -0400
Received: by mail-pl1-x631.google.com with SMTP id m2so18880209pls.4
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 08:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=nG7NK2ZdctyfoXzg4tEzE8ZfepaDcAjNEY4Rglp6DLY=;
 b=nEnEWHqQuSXrZjJtW1Rj0FdEsdsJaTY036TLEcAK7KgYkKN+wcNDW/WBcZ1X1U/9Fj
 v0xWbZLRAGY9uVkYmq8fNu6OU0REmPY68QcCNvb9p0AbZn6ljlD/coOxqYeCFMFR18zg
 Xlr4BGDW6+sZhQrZXik0fC+UKH/6CwXQDkURil1kKNZUbZkmUy/6XX13yWYVWZGjv/0o
 nuIesEMtPot8HFILxuvFQzFrWxhtav37mGGNew/R9vG4KqJmBReyD7UMfq0ABvTrBxpI
 7BbrOrnqQv3FlOinK4aXVAbSMh3tBEtELFl6/r9BXfXta6QHEXV2oTFw7+4xCbeFwWgt
 zb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=nG7NK2ZdctyfoXzg4tEzE8ZfepaDcAjNEY4Rglp6DLY=;
 b=fdR/BrLQEF9W/U/VcD0vvVTibT5GZzjc9gamcRLkWCAsIs1MFBF4/NpYn/pLP08Rq0
 Kn4m4eRDvE941uX8BrgmjOawArk0e2cq+YW161Ecl32KdeuwelHtxg5ZhF7j+wP5rDvt
 3WmVtl1xqOXp5awY1ZEQ3F51wrjvC75aQ7HPvdNPKOvWTlSKc+cUGc2Fguq8sRLri3o+
 0Jm1q7iFwBc6xJItciW/0JFle1PtA8KmTbAn9CTSbAvkoKoYgyU3Tbso89sUc5/tccAa
 MRY5e4gDi1au2HeYxDw0vQWv2m9VHcORha54Lqntjb5Q504qE4qtof8Oqpi7woImymxb
 gPzw==
X-Gm-Message-State: ACgBeo3LFiMxywYLcv72vTNN1Yj7WMfEQx117pdv2tAGCxGwqB8I/O2I
 SRBL2t65FKNX56aD1b5kcTkjYg==
X-Google-Smtp-Source: AA6agR4Jqz4IDD9WaSHKk4tJLU/5OrkhDtUH5x0o80d7+qILaQ00gCtV89Dpu94cnRR6OAVbqhDskQ==
X-Received: by 2002:a17:903:41d1:b0:172:ee09:e89e with SMTP id
 u17-20020a17090341d100b00172ee09e89emr4227406ple.61.1661442282618; 
 Thu, 25 Aug 2022 08:44:42 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:64be:e7c:2851:ce4b?
 ([2602:47:d49d:ec01:64be:e7c:2851:ce4b])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a170902d19500b0016d1bee1519sm14600246plb.102.2022.08.25.08.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 08:44:42 -0700 (PDT)
Message-ID: <7fbe31d7-515d-d9c0-ec20-9c5124821144@linaro.org>
Date: Thu, 25 Aug 2022 08:44:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] tests/tcg: i386: extend BMI test
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220825123418.319668-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825123418.319668-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

On 8/25/22 05:34, Paolo Bonzini wrote:
> Cover all BMI1 and BMI2 instructions, both 32- and 64-bit.
> 
> Due to the use of inlines, the test now has to be compiled with -O2.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/tcg/i386/Makefile.target  |   1 +
>   tests/tcg/i386/test-i386-bmi2.c | 169 ++++++++++++++++++++++++++++++--
>   2 files changed, 162 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

