Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FFF4DA4BE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 22:44:13 +0100 (CET)
Received: from localhost ([::1]:34792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUExg-0000Iv-H0
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 17:44:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUEvA-0006BQ-GC
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 17:41:36 -0400
Received: from [2607:f8b0:4864:20::1032] (port=42849
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUEv8-0000s3-U5
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 17:41:36 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 rm8-20020a17090b3ec800b001c55791fdb1so674455pjb.1
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 14:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=z03UJPXkvE/wwwDvg5oZwAdXNipbiYnMQgrMp/6flQQ=;
 b=OVYkDSCJx/7F6cA1QrRYdvO+ldI4gLxCiEKJMSQdJ8tqgXRHd7a007MWhmJCvWJwPm
 +WKbgYZjWrcCrMawISHWTlWWdNpPimiTMVQIMfM7no82ovYIfyIYUwLC63Yf+5vE1+/F
 w1e5wvFBnRrx6h0/93UgEXoyNsASctpfk3zhzIAWgwJJ/biVoDorpoeXlaWuxjschD7U
 biGr+G131mGux1KInPQbtJlN5A++CqSXIvp0qJjP0qBweCAaM81wzkwNpdZfl3+zW9kw
 edKKn3O9T1pLO4WB95DcLkGybACZtfDmx/RFTb+LZL/vaqRWq6Y0WMLBSXb9Avc+e/6p
 IQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z03UJPXkvE/wwwDvg5oZwAdXNipbiYnMQgrMp/6flQQ=;
 b=iix5Hne/KuPgnuLdzheokVgWHv+SkRWosMqw6CJ7u5cI/YN6XPuV86nYTcXhkXDAhp
 CTDbe2VJxMqeaGk5/SXHbtX8bI8gCss8vF2xyyEKeJ8Qv4sGk6onhge81q/k/WrdA9FU
 6Kmhvrcw4fJouzWwIXJmlK8kLSAfGv9Y2OK1q2/Y5IrMLLJOen8WVuwA+vakHN4gzzRL
 C1d9hjxD+FRtRlouPrSyYhuTeho73V6kJJpdty3hRW9LJT6XNgoKF+1Dt7BMXY3E4T5a
 qMo1XJd+cVXpfbXB1jDx93TlvLwPwR3xOtQKXTYPqtJ79JhfHmc8Vxh8B2jUBT03TdCB
 C6+A==
X-Gm-Message-State: AOAM530vJyVDLt3qeA38KzL2Ngo1kLYeqCZpDK8VlVxUw0z3j8D+khZs
 i6AEBz629jwFJEeJAacGzKFS1Q==
X-Google-Smtp-Source: ABdhPJzT0/nhZgQ/3VepHdTX0dacawZktjLrQuuwOkts5hbSkvzMZ8plSq2H4faOlNGJfv5N63xYIg==
X-Received: by 2002:a17:90b:2246:b0:1c6:5781:7193 with SMTP id
 hk6-20020a17090b224600b001c657817193mr1311779pjb.48.1647380493463; 
 Tue, 15 Mar 2022 14:41:33 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 q17-20020aa79831000000b004f769d0c323sm57051pfl.100.2022.03.15.14.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:41:32 -0700 (PDT)
Message-ID: <eb4fee59-8710-fc4f-f5f7-bfcf1131b9fd@linaro.org>
Date: Tue, 15 Mar 2022 14:41:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] target/arm: Log fault address for M-profile faults
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220315204306.2797684-1-peter.maydell@linaro.org>
 <20220315204306.2797684-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220315204306.2797684-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/15/22 13:43, Peter Maydell wrote:
> For M-profile, the fault address is not always exposed to the guest
> in a fault register (for instance the BFAR bus fault address register
> is only updated for bus faults on data accesses, not instruction
> accesses).  Currently we log the address only if we're putting it
> into a particular guest-visible register.  Since we always have it,
> log it generically, to make logs of i-side faults a bit clearer.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/m_helper.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

