Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CAB340D58
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:42:27 +0100 (CET)
Received: from localhost ([::1]:38774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxb3-0008Gc-Te
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxYM-0007nK-Mj
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:39:26 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:35691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxYK-0003V3-EB
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:39:26 -0400
Received: by mail-oi1-x231.google.com with SMTP id x2so1992935oiv.2
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 11:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F1WDfIDma0jeWzIshUiyFpi2DGMudlQkfjbSdRHuLK0=;
 b=R07knyLKlIFZAAou0nzoOunFzd9N9Rq3iAzm85s1KPdcLR7kfhByf/SueDawM2bofn
 B8iMdrn6Vme/oiwV/eP8tSOD4qDIgDIrhrCZUJiiRW8mY+eDWIJ3nw94DaWRrx8UpHNR
 +3w3EtE+w5HbKoJYhLV9A26R+0dapPgrtYrPq1Gi+ihZXutipYwrW8dy3/3aryredFkJ
 PjThbD+qAS3y85Ktd2j3ZubLz0P6GD9I/lyzGYdpKeyBxQRKw5UOetz6XbjieLqjeb0V
 pQvp1eqwG616ifJv9GA9x0DoNEWNy9d60QRPGIc27lZM9GkV3QFFnunvYmy7b6twf2pR
 f1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F1WDfIDma0jeWzIshUiyFpi2DGMudlQkfjbSdRHuLK0=;
 b=CGzUFPklf003lKIMiv2PSmoU/K6AQjI9R3/0zklLAMIbybxoQ+jl71Hx7yUsPDywpZ
 0D+O+dW6bCBTsBLkQjeQAZeQD6f/ExZExxfUyXi8IZyFq+TRQ5E0RLiq8iSCQLEyVHei
 8r8foXR6vE/ZfctJuS8R14pX9iGFWvfHgyOsK4Zgx3kzO3g7DvSeMLslJsmFM7pJeNoI
 6B0lTuQQDN7kqW0X2gRggUPyYrgl2hwJiJ5UoWWwtDk5U2vUaI3mqo913sseS9ydtK66
 aV0d0EkK89s+5kbRVnPJfgd2uoZYXhKOlpaThZdv6PGnwmEhAfIi9kDfNtEC7BxBj9eM
 yBCg==
X-Gm-Message-State: AOAM532toLYxGCCJxxd+gSKL2dFWOAXXczZKfEsDKp1H3cQ7qZkqWNeY
 WckPWpuzDxvyFouUo3kK3XiB/A==
X-Google-Smtp-Source: ABdhPJzgpWEeVhRnaMcRhOS3tDgVMBOmBARxBxa03QFBpGDvtiZIJvOwYRKTiD6fOOGCNlj9OHcR/w==
X-Received: by 2002:aca:f50f:: with SMTP id t15mr4060254oih.53.1616092759971; 
 Thu, 18 Mar 2021 11:39:19 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o9sm635647otl.39.2021.03.18.11.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 11:39:19 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 1/5] memory: Make flatview_cb return bool, not
 int
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e14edb13-4fc1-3dba-21d4-a7a19e821873@linaro.org>
Date: Thu, 18 Mar 2021 12:39:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318174823.18066-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 11:48 AM, Peter Maydell wrote:
> The return value of the flatview_cb callback passed to the
> flatview_for_each_range() function is zero if the iteration through
> the ranges should continue, or non-zero to break out of it.  Use a
> bool for this rather than int.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/exec/memory.h           | 6 +++---
>   tests/qtest/fuzz/generic_fuzz.c | 8 ++++----
>   2 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

