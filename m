Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E035A35266F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 07:33:16 +0200 (CEST)
Received: from localhost ([::1]:40862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSCQm-0003LG-11
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 01:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSCPa-0002s5-71
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 01:32:02 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:38418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSCPY-00019a-HQ
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 01:32:01 -0400
Received: by mail-pf1-x435.google.com with SMTP id v10so2958472pfn.5
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 22:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YMc+eiZcUmWhvolDQF1owslkvvJZy+8Ia8Txn8NoVmQ=;
 b=YcOh8Q98G7F2B+vj5EW6v5g0b0BI5agQj5qSsFFoaNJn1Uo22XUH52ddLYHRH2FJbE
 VN6HRI6d2Efmed58DeiaZoDb2YvMwHAYu2/iRcm13cukCdnyiq9xsAH6dA8OEnjZzxeG
 pkwFnchABwrUnOtUoJzZxni+AVgfTDjNFNKTqi3UAbL6uzHibIGQiY3ZaPl5vSZXJEW6
 ZVpa9KZso3rZIU2G/L68TgtundXZpjeZvpVxkyxQjT18eolF4OUbV0kdJKeuBJlc1uY9
 SzfmZsIeDgp7W2r7X/V2rNjoRz3rJvRZive2pYUKKd173okWe40rUHNymK6nU0TtgLcc
 WEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YMc+eiZcUmWhvolDQF1owslkvvJZy+8Ia8Txn8NoVmQ=;
 b=G3DGUm8gZ7TYuchP/v2+MkaGVbt670J68Q1Wi6cAZWPTrGzPuMib6v2lyi4V170l3V
 prjiYlY8Zp+2hqbw2Oj5x8C1l8PFE9kYkAAp8JzzAUHnOyf4EK1UNT3YTVKLY5MONGrz
 b3djt+lsDMrVrCyt+lfWa9cSLBKynmrKsBygDKK4E45XW8wykAMi7sm1X/C6be6jSn/C
 OBG3ubLgtvnwsSpoUz2vrQbc/mr7TkeV/BgADSSmq0rQ7vktxB0KG6680b7m/9ApMY62
 TuHtc9YmfRhCfVjNtZkQasD1tbKMOsOYnS4i/ZDMMbvGK2p7KExU9Qwrn4Fr2zJxvKsU
 f3aA==
X-Gm-Message-State: AOAM530yNnWFHs+STNZKe9erZq2yxST6Y2iBsGEljwqQYhCPqrG+oLys
 fJ7z1lURaMNXs2pv801dL9JPnw==
X-Google-Smtp-Source: ABdhPJwiB2HznDIhSsT6B31/gjbjJM/mDTM8VVz8CSyN7Bu17JBxmm1Slv2P+VtQttH0ideRVBQFow==
X-Received: by 2002:a62:2a8b:0:b029:21c:3016:3a9f with SMTP id
 q133-20020a622a8b0000b029021c30163a9fmr10799005pfq.38.1617341518890; 
 Thu, 01 Apr 2021 22:31:58 -0700 (PDT)
Received: from [192.168.81.184]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id 186sm7326353pfb.143.2021.04.01.22.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 22:31:58 -0700 (PDT)
Subject: Re: [1/1] tcg/mips: Fix SoftTLB comparison on mips backend
To: Kele Huang <kele.hwang@gmail.com>, qemu-devel@nongnu.org
References: <20210401100457.191458-1-kele.hwang@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b0f83f9-2db9-48e0-eada-56ce1883927c@linaro.org>
Date: Thu, 1 Apr 2021 22:31:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210401100457.191458-1-kele.hwang@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, alistair.francis@wdc.com, j@getutm.app,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 3:04 AM, Kele Huang wrote:
> The addrl used to compare with SoftTLB entry should be sign-extended
> in common case, and it will cause constant failing in SoftTLB
> comparisons for the addrl whose address is over 0x80000000 on the
> emulation of 32-bit guest on 64-bit host.
> 
> This is an important performance bug fix. Spec2000 gzip rate increase
> from ~45 to ~140 on Loongson 3A4000 (MIPS compatible platform).
> 
> Signed-off-by: Kele Huang<kele.hwang@gmail.com>
> ---
>   tcg/mips/tcg-target.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Queued, thanks.


r~

