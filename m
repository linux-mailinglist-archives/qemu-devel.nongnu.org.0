Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1313FCBF2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 18:58:41 +0200 (CEST)
Received: from localhost ([::1]:41396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL75t-0002ki-0r
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 12:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL746-0000Fc-EC
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 12:56:50 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL744-00024z-Se
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 12:56:50 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 j10-20020a17090a94ca00b00181f17b7ef7so2535964pjw.2
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bmDmUezKUmdPNliefbwTqL1cMamYNYt2leBAPAIwzQ4=;
 b=z8NqLKYgOMduOd7vyioQuvwAi9sjluJZGbhrEHKreNDW02ekMS7BzCa9Qp3XYrwni6
 8m2bRwcypoNWHAGNRjiGmexJcvGrVeKVHM5Ldc1urYsSdrux0ce6P5HZukI1sns7XLB8
 ul43EQ7e3HkEf+Kxrdy2vRslOS6txn7lYSd7/P/nxWl/cpr/4kwbMIP0QXZPvaxXQThP
 mR37Wti1twVhyJzjyRsUwWqLm3r41T52TQozUAw1RUSxJoJzk3VYTPKE45U3RoePFSR/
 Mn6tUk1W+bXye3nz5gof9Xfb62O+9wbmrQFvVnilwjFPwTITxBg3eQkCOEvYPaMwLYRc
 Xctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bmDmUezKUmdPNliefbwTqL1cMamYNYt2leBAPAIwzQ4=;
 b=BG5Yai0ovJOI/fc6kRcjpjsCPV9HU/mJyVa5i0y4vuMHnSqQz+7kGatbtHLZk4F5HP
 3eMjFjsKssBMKhhcGjOk1UJlUntbYaOIgCYvOuMZ93l8Dl0vFfjnHi64YDH9fS6rYZ34
 cNLZEyjq3arCaEjSD0Djv5N5xGpgNDJO6YCBWeLuLCwx/LY28JKHwyqIMXUkgPOE2tw1
 yxr/gFaKDRfehnTlswt8NCKVlZ6Fpa3K1DE3W3/Ae2K7NAp8hjLvHca/QHapPmXkYCAb
 uDUdRUDvcPO9DY3/IWe5ARRiZLEWIZCNeiMuM8/5NlIgkHF5IQvsUfy0RpHcDbANxmj1
 T0bg==
X-Gm-Message-State: AOAM530EVWgENm8jV8l4gQ3zdqIUqkthQMjff6UgD2755WkXrMSBjP8k
 CfoKenTQSdwvICCDKbtqGQ2XAMkct8eC+g==
X-Google-Smtp-Source: ABdhPJxD+pZ+uisH3GtVF7vLe4f4zrNm7SFXSjrxMvMZ/aDCdculz/6PMrl/r9rMNT9Qwie6w+fjSA==
X-Received: by 2002:a17:90a:c984:: with SMTP id
 w4mr6759467pjt.124.1630429007062; 
 Tue, 31 Aug 2021 09:56:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id x13sm3592595pjh.30.2021.08.31.09.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 09:56:46 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/intc/arm_gicv3: Replace mis-used MEMTX_* constants
 by booleans
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210826180704.2131949-1-philmd@redhat.com>
 <20210826180704.2131949-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e764f9f5-5f7e-5a70-e5c7-135e62784959@linaro.org>
Date: Tue, 31 Aug 2021 09:56:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826180704.2131949-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> Quoting Peter Maydell:
> 
>    These MEMTX_* aren't from the memory transaction API functions;
>    they're just being used by gicd_readl() and friends as a way to
>    indicate a success/failure so that the actual MemoryRegionOps
>    read/write fns like gicv3_dist_read() can log a guest error.
>    Arguably this is a bit of a misuse of the MEMTX_* constants and
>    perhaps we should have gicd_readl etc return a bool instead.
> 
> Follow his suggestion and replace the MEMTX_* constants by
> boolean values, simplifying a bit the gicv3_dist_read() /
> gicv3_dist_write() handlers.
> 
> Suggested-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   hw/intc/arm_gicv3_dist.c | 201 +++++++++++++++++++++------------------
>   1 file changed, 106 insertions(+), 95 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

