Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D878A6A17BE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:10:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVT9C-0008CX-8F; Fri, 24 Feb 2023 03:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVT8v-00086f-4T
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:09:25 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVT8s-00050q-Ty
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:09:24 -0500
Received: by mail-pf1-x42a.google.com with SMTP id a7so7583696pfx.10
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cmDvXOrVH6Soh/WgBp9eT1D+C92w7+ZalDrdbloEXwE=;
 b=eYHFjVD8omfvzzWstSJp/KtQNyfl47yWTpmvP+Gh2Nwsbd1y3+sbMRNCl7K8o0bY8s
 rEUwD3VW96D9Qp6P8YikA8GudT1DZwpatY/h47krr01/2rOX7MIC+vOLD+lR7wTIJ/1O
 v0J9J79HMmX8fFu66PQaUhQJPYUFLmFrmp4xgtZlEKyQkmZ4k8Oze26QBPvdD6bkrb+v
 PTNkXdUGfMAIiME2TO8RYkNYogpAY8boDsjx3dmFYxmhB1qNprJJFkLQnL8Ot8MPYjSR
 MvQCoTPlsrSfJ993rzeXNJMz/gOMSXJ49SROnM4ce98D8CBgG4mFIg2uE37XuNG06IVD
 /Jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cmDvXOrVH6Soh/WgBp9eT1D+C92w7+ZalDrdbloEXwE=;
 b=Um9zyVK47Drju9/oO5/ASiyuc8e70hMR/dTv39aJkTOGu+sPFRSzfu9uff9MjVKU2F
 wNQj4wHEnngkcvMtLH0qXqXj3AD6aYSraRsClKQ7QVtQ4hPE9i5JEtqM6r1r88x7KT2X
 vEcUss3d5KhHyB3vV6+vX87/z5tcbkAKkVM8jaARmBoakK/lPQc3xX//4+T5EzgeQ50L
 Jx4CxP2FYShC51WIcD6bqIK+sTVi6VcfMRZSjONLp4b4MMkCX9/Ss5jDFGhheOY7xK8a
 GRrAFFwYaRQGLOoOnvy4sBCvQU0s4rWXTqyGgJQGCd3brbRcPNM403PSn/Xndb/82W/+
 KoTg==
X-Gm-Message-State: AO0yUKU2CXV7nkt5KfhNiEkauIy2H4zmOkiAEHV50jVj1goYBrkCLymE
 ZWaEJwXY7wYHdfI98G9wjFo9hg==
X-Google-Smtp-Source: AK7set83LcTtSM9zSxLKNB53XSTwTvjKn6jM1rFimaoxF1cVyF6eWpvmTkQQfr2WIF6Z+5JW/IN2WQ==
X-Received: by 2002:a62:6456:0:b0:5a8:b2bf:26ac with SMTP id
 y83-20020a626456000000b005a8b2bf26acmr14716591pfb.20.1677226160749; 
 Fri, 24 Feb 2023 00:09:20 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 x47-20020a056a000bef00b005ae02dc6285sm8018178pfu.203.2023.02.24.00.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 00:09:20 -0800 (PST)
Message-ID: <fbc63971-34fd-633e-d9e0-0e906328f47e@linaro.org>
Date: Thu, 23 Feb 2023 22:09:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] accel/tcg: Add 'size' param to probe_access_full
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: dbarboza@ventanamicro.com
References: <20230224004558.1313614-1-richard.henderson@linaro.org>
 <6517a169-07b0-6ee2-1492-95d6d5c82ecc@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <6517a169-07b0-6ee2-1492-95d6d5c82ecc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/23/23 20:57, Philippe Mathieu-Daudé wrote:
> On 24/2/23 01:45, Richard Henderson wrote:
>> Change to match the recent change to probe_access_flags.
>> All existing callers updated to supply 0, so no change in behaviour.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/exec/exec-all.h              | 2 +-
>>   accel/tcg/cputlb.c                   | 4 ++--
>>   target/arm/mte_helper.c              | 4 ++--
>>   target/arm/ptw.c                     | 2 +-
>>   target/arm/sve_helper.c              | 2 +-
>>   target/arm/translate-a64.c           | 2 +-
>>   target/i386/tcg/sysemu/excp_helper.c | 4 ++--
>>   7 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> index 165b050872..b631832e17 100644
>> --- a/include/exec/exec-all.h
>> +++ b/include/exec/exec-all.h
>> @@ -475,7 +475,7 @@ int probe_access_flags(CPUArchState *env, target_ulong addr, int size,
>>    * and must be consumed or copied immediately, before any further
>>    * access or changes to TLB @mmu_idx.
>>    */
>> -int probe_access_full(CPUArchState *env, target_ulong addr,
>> +int probe_access_full(CPUArchState *env, target_ulong addr, int size,
>>                         MMUAccessType access_type, int mmu_idx,
>>                         bool nonfault, void **phost,
>>                         CPUTLBEntryFull **pfull, uintptr_t retaddr);
> 
> Why is 'size' signed? (similar in probe_access_flags).

Not sure.  But all of the other interfaces exposed are signed too.


r~


