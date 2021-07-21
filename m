Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BAA3D198C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 00:05:09 +0200 (CEST)
Received: from localhost ([::1]:54878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6KKy-0006f6-11
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 18:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KHi-0004GD-9D
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:01:46 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KHd-00054q-Sz
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:01:45 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 a17-20020a17090abe11b0290173ce472b8aso1337898pjs.2
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 15:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=O/IHiYSl6Na004nA6vNtdTWdPT4lsK3wuN4E7ZtM0jc=;
 b=HhGAVv3NKTt01oYOjB1Sxhe8csm770dgobP/mlgrxmoRFYIM00a/mM9Yx6KKFt0Fss
 SRsLzixCC+i425XASKAe4KaB97/xyhaku6lokPcrpVl99IZpqbjBsmzEFMC2G35E2XCt
 EKtEFelh2JlL7qrD6zGSa9vax20M9WnXdBSXUgjRkK7ev4noEcqiPxmOquvfYfjG3CN6
 7KFFGlcCdHv5WM4T6dAODwoBPwLVXhEpwCR3/Hhy7RF86NKLB98EoUQClNTivsWFjGgB
 Y/eSN17XPbZJ/TRvNZbGZv6fuEMGKy0LqgTQ9qwP6T3t2uR7ogK69ez5qSt/51U9aqXo
 uGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O/IHiYSl6Na004nA6vNtdTWdPT4lsK3wuN4E7ZtM0jc=;
 b=H17uWROHDrkIGm8GUq2xzTW1LhBDZttVVhWC66LX4eIjfXWrClfqEz5SqCOWznkU6l
 4HLot0/zuKGbBJF/AULy2aguDVG7rpMlxTwBP6/WD48rl8vg6VdbuXF5PuguZl4ww+QA
 K7wfM7fno6lXVQP0Eq7zoVQsZFK5zovd1XSiYtpydqejytN2517Lv/uKIBxU2ti4djxr
 OAbfbZb41VCBWL9HEq1m+kRDPL/m8oUdd8ruGrDloez2PvABICvhAUbrElhEKIyehNRR
 cX5NK46m4mXrM/XVFkzf3juCrw1DWB4fBLauh6CUyEP9PfS7wY+mMTTzBtiR0R5Ztz6q
 LLFw==
X-Gm-Message-State: AOAM533Zu+LcEjmpFoFdxPWTTTtAVeHy9hpZw8/QTb1EW62f7Q/lFHJq
 /yGAt2mwZcco4i2rGiapIlcD3oUIoXG5LQ==
X-Google-Smtp-Source: ABdhPJxUVSaz7uqv0gHDujliaB6oA4HlTc/2DQsVBHxXfAJDxirZ8vGBn8F9W59oV8G1YdIo19xBcA==
X-Received: by 2002:a17:90a:6a04:: with SMTP id
 t4mr37047866pjj.55.1626904900062; 
 Wed, 21 Jul 2021 15:01:40 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id i8sm832283pjh.36.2021.07.21.15.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:01:39 -0700 (PDT)
Subject: Re: [PATCH for-6.2 24/34] target/arm: Implement MVE VMLADAV and
 VMLSLDAV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <584d6771-b6ea-ea4a-977b-60fb2a6e511e@linaro.org>
Date: Wed, 21 Jul 2021 12:01:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
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

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE VMLADAV and VMLSLDAV insns.  Like the VMLALDAV and
> VMLSLDAV insns already implemented, these accumulate multiplied
> vector elements; but they accumulate a 32-bit result rather than a
> 64-bit one.
> 
> Note that these encodings overlap with what would be RdaHi=0b111 for
> VMLALDAV, VMLSLDAV, VRMLALDAVH and VRMLSLDAVH.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 17 ++++++++++
>   target/arm/mve.decode      | 33 +++++++++++++++++---
>   target/arm/mve_helper.c    | 41 ++++++++++++++++++++++++
>   target/arm/translate-mve.c | 64 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 150 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

