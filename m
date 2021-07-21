Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414833D199E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 00:21:30 +0200 (CEST)
Received: from localhost ([::1]:42992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Kam-0001jD-T4
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 18:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KZl-0000lx-Mx
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:20:25 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:41571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KZk-0000df-8q
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:20:25 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 jx7-20020a17090b46c7b02901757deaf2c8so2739390pjb.0
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 15:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sdgnkbdrgLyKqQwpzZHL2a5iqy8kYlHXjPMY38mu2p0=;
 b=HxBXbjI8o9VA/MQ9QU6oBwu17N6m4ttU/mMgJDPgCXBn8xspL4w962++YM3MvWZrc0
 4ppf6PFG1YSdKzi9rTiuCTcUheTWSkq8Gf/nrNDZwnQX8Mra1FPiZoNXQnHLbjvv42lR
 hTkk7WoG4btg7vOpLri7M9/QyoDKt89hyr6eJq+NNt3TcZAsl2aOZCtq8ySe01iKU/vQ
 nmrcHp+ZB+eyCW4tSkK47/p3OGsBREaDhZBSh7/LQLhIZMKh+BREooedbNVvM3C1pjdY
 1zJNtTrXvc/WI2WAHWOiBql0rROWMgnGR/FuS7KKhJkO71/KZmGqBQJJzVza87qWVxcm
 z5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sdgnkbdrgLyKqQwpzZHL2a5iqy8kYlHXjPMY38mu2p0=;
 b=pzpxGKzk2+1pXXQ1RxetFpqgFHd+M09B//adh/lGhoC1CkIeq9ITBLCqbAiRMNC0KH
 6WeuDoeRKvqVfSFWQIrQFQ9XgoNKeQlh8v5qhBfgbg0vxLEu8rZhMO1zGzJ5aYznJIeT
 7kvPlbwLY02SxAILXSg6xHmjbDwYnck/fcoSVDxBQ5TA23UzB19eeHHeEVjNp0Kg22ct
 3deSrSZ7gg+MR2w6q0AHwX4Y+3T5+L1dUurFU9GtmwKTQMp77ITlfWpcHkTwwEm50c50
 NFpYvCEBLEWtgpTgFUJPgsigUgzDRaSuxOVgdt+xJm4d+HPm6BwCwPBEKJkS8qKUXvDn
 BSzA==
X-Gm-Message-State: AOAM531UQw3HyAAQ7dukAn84WKfBgTuIkWpFPV6+zf2wkbYzA4DcR+DD
 WS7zF3/yR1R8vKG3aNCtQj4IC2amFUkjUg==
X-Google-Smtp-Source: ABdhPJwn8O33UJSkxvHRQYK80e8l3mQcpi0JjKiAKuM9dtKKnXmNKHhu16V5bJZLjd//q2/vbc7ACg==
X-Received: by 2002:a63:170a:: with SMTP id x10mr37252487pgl.305.1626906022161; 
 Wed, 21 Jul 2021 15:20:22 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id y35sm19954810pfa.34.2021.07.21.15.20.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:20:21 -0700 (PDT)
Subject: Re: [PATCH for-6.2 29/34] target/arm: Implement MVE VMOV to/from 2
 general-purpose registers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-30-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <14627b3f-eb25-eca8-00ac-cef31b53c279@linaro.org>
Date: Wed, 21 Jul 2021 12:20:18 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-30-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE VMOV forms that move data between 2 general-purpose
> registers and 2 32-bit lanes in a vector register.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h |  1 +
>   target/arm/mve.decode      |  4 ++
>   target/arm/translate-mve.c | 85 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-vfp.c |  2 +-
>   4 files changed, 91 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

