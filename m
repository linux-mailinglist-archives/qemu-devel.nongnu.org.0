Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204A03DBF53
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:01:07 +0200 (CEST)
Received: from localhost ([::1]:40966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Ygs-00036l-50
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Yes-0001fk-L7
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:59:02 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:54065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Yer-00040Y-6l
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:59:02 -0400
Received: by mail-pj1-x102d.google.com with SMTP id j1so16777076pjv.3
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 12:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=gW3esaDocztJGrj/5IssPeCWTzmXdb7RABQk29oxf+w=;
 b=ZVIun8xiyHOUbEpzQEfYL7cvU+MCMXWvYV2xUJhA5sFP1DMZBnc4FTU+FY/JgdyJpF
 f2/jZ8eDrklaK5Fu7H4SESmJCBDkopC6sS9k0FtQ2dD57Hcpi3wUP5S5f7VT0i8Ud8aC
 rEF3vSbfVfUS32FghdZQ31AvohdLhQxqx51Gu34LsEkI37Tukpjqza+z2IPCarBWmnd1
 O0OPokXw4+V86ipWJhTgR90I6nBkrTjopOML5ahvP6ndsu5prKiprY5wy2XQZ3SlE+4r
 u/2galPEIQVVVbIYPAEh2FCtgBjYTNvhOvGof1sotRkf5P8ndETGSVKZKqjhF7mVDTyl
 WzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gW3esaDocztJGrj/5IssPeCWTzmXdb7RABQk29oxf+w=;
 b=J6yPcZMpwuBIGQQtGNTYNfg4bEdbnXHLeu0eULcb2fvkRvT12WK5m824a019jOWPg1
 73DdXzkJgCTE4ryG25QZp6PUE1dWGuQk7J8yH4+1+0m2+ZCIyaRRXBZi6kISCErwAiQV
 mFPuUWZ3/1mzh7BB3TKqqO+S3CeCZ6lPXeaPltxuO5IkpIvumwDaNQt6L60hFFMQ8aU1
 zBkTMamkpomWuf40P8iVAjGebthJ4GkIVCeHR1EiJrEAISkz2W5ToDUvuvkqNfucmMfX
 P7tyN5aOjkVhK3hIaPeTbbwF3N01f1MpQh3yuxiKys51RYZX7ATzWARSWJppm51o4BhF
 cWTA==
X-Gm-Message-State: AOAM531I7kE8IzwNpdZsu0fHaG7YRUpXGsxPn5D1eq+qGQUAaorzKdBD
 3BvErO11DHe3REHc5tcOH7pAnshxAKfJaQ==
X-Google-Smtp-Source: ABdhPJxl+/nU6aXhG9zWXRioHB6/LNsAHy/xm9HXQqDmnawFqhL8TDh8oRMO+cFpg0mqXNvgVh5qiQ==
X-Received: by 2002:a05:6a00:a8a:b029:30c:a10b:3e3f with SMTP id
 b10-20020a056a000a8ab029030ca10b3e3fmr4471558pfl.40.1627675138820; 
 Fri, 30 Jul 2021 12:58:58 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id 26sm3986686pgx.72.2021.07.30.12.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:58:58 -0700 (PDT)
Subject: Re: [PATCH for-6.2 43/53] target/arm: Implement MVE fp-with-scalar
 VFMA, VFMAS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-44-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8a09073-0076-8f8d-20b5-a01f8b6c210f@linaro.org>
Date: Fri, 30 Jul 2021 09:58:55 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-44-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE fp-with-scalar VFMA and VFMAS insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  6 ++++++
>   target/arm/mve.decode      | 14 +++++++++++---
>   target/arm/mve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 56 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

