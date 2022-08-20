Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7BF59AB79
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 07:24:48 +0200 (CEST)
Received: from localhost ([::1]:33114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPGyV-0001PD-Cr
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 01:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPGve-0005pj-LD
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 01:21:50 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPGvc-0004Nx-Uz
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 01:21:50 -0400
Received: by mail-pl1-x634.google.com with SMTP id p18so5680455plr.8
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 22:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=NDk5uDzmyZQmpEDy6CAJhPQ/D2di48CWnqJg/6Y0lW4=;
 b=wQaB7Epaf39bre54T1G9PhMLdoq7y9c7YW+VzH90VeGtmKQAVN+lqIx5tROqaBc2nm
 etQfvXHsJJHo6o5SpYu8fnDcBMF+TnVsMM9tpFtcdINaPDCduCLLDNX9yV9rZnjE4JEh
 URReZ19skj0ut5urxyCWMUOOYtDIJnbH8gzI+8X+CDJ8dH38irZq3VvBDqIhc+rTsfNS
 zBzk3M5ZLfWQAEoi8BwnGKTZmCxBXSRqBv1NuPjJvALRad5ysUmvTXxg9+AWrDWLPadQ
 IxtYCIQDhJVifHQYvavxBm8NMnjUNHi/xEAP/JbPHg8Lhrngf31MJ1mXdL3DvqSiqeOc
 tuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=NDk5uDzmyZQmpEDy6CAJhPQ/D2di48CWnqJg/6Y0lW4=;
 b=PMzyCxh/+/Tu7hk6Pjdu/m50NXPtYyg355iPmbtVPUTuqcVhVsHUeGyvXT1Q9LMxnx
 MJJYDgRedsFGh8PtVUUM8hGQ+3oV5HEq97CDJ2PXUWv1s5yfNy4a6MDWTBpX0ITI+64L
 1nsMgnGyHbGNjvf3YkR+MTyVMwMTnu0NSDAZkJf6zUzixR7XHjfZX+EBQOcF46DdHiZU
 xlb2LCMSU+N8Rx6EW6qU2PFqOxojjxDT+6rcpwlx635evzR4byRXvx0BQbAaly6QpSe4
 J+1zN31vPTzr5YbvWTIlsoAFbmKXd5OhesqhTgi+8h1apaA8CLeDYqXUh2FhiLZ8aBIX
 uMgA==
X-Gm-Message-State: ACgBeo3SrLA2KmMjz8xZrYVjkgD90TWUft1nkOKU4mkruWLndNu1/3YL
 mxSIju0iJtXThfu5giLI3HohmdQMN/C6iQ==
X-Google-Smtp-Source: AA6agR4celuYhTuK0X5huGekzvuB0DLWB4D8kDC9nv55z+ZcWdElF6i/9BSSp0NF/KVsaloNYkJIvA==
X-Received: by 2002:a17:903:1c7:b0:171:3ba4:9bb8 with SMTP id
 e7-20020a17090301c700b001713ba49bb8mr10503961plh.105.1660972907308; 
 Fri, 19 Aug 2022 22:21:47 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:b651:a70f:2852:70f5?
 ([2602:47:d49d:ec01:b651:a70f:2852:70f5])
 by smtp.gmail.com with ESMTPSA id
 b191-20020a621bc8000000b0052d2b55be32sm4425693pfb.171.2022.08.19.22.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 22:21:46 -0700 (PDT)
Message-ID: <5b2694b7-a1bf-504a-5af6-8ac95d34d5ee@linaro.org>
Date: Fri, 19 Aug 2022 22:21:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/6] target/arm: Advertise FEAT_ETS for '-cpu max'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
 <20220819110052.2942289-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819110052.2942289-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/19/22 04:00, Peter Maydell wrote:
> The architectural feature FEAT_ETS (Enhanced Translation
> Synchronization) is a set of tightened guarantees about memory
> ordering involving translation table walks:
> 
>   * if memory access RW1 is ordered-before memory access RW2 then it
>     is also ordered-before any translation table walk generated by RW2
>     that generates a translation fault, address size fault or access
>     fault
> 
>   * TLB maintenance on non-exec-permission translations is guaranteed
>     complete after a DSB (ie it does not need the context
>     synchronization event that you have to have if you don’t have
>     FEAT_ETS)
> 
> For QEMU’s implementation we don’t reorder translation table walk
> accesses, and we guarantee to finish the TLB maintenance as soon as
> the TLB op is done (the tlb_flush functions will complete at the end
> of the TLB, and TLB ops always end the TB because they’re sysreg

First TLB on this line should be TB.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

