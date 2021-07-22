Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3B83D1AE3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 02:51:39 +0200 (CEST)
Received: from localhost ([::1]:52166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Mw6-00039J-6v
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 20:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6Muc-0002Bn-Ph
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 20:50:06 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:45948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6Mua-00089H-CK
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 20:50:06 -0400
Received: by mail-pl1-x62e.google.com with SMTP id p17so2561176plf.12
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 17:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=CiBs9ErOQVTYs2CjuygeJw6/bsE5JEbE2kWIVK2dJJs=;
 b=Mj30NXN5JoRRkJSVAttTcs4CLbG04ApmGv1dQL75q7zLJRaW6YZUDm42trvV75mg97
 RljNZex1pdiPjD4E7yzT1WtSUUUImjyXtUUmWcWH4FYNMV3LM+P6IET5u8OChiwXL6eb
 UKzbKmeQJIbDsrb8vHmHzCqgnGv8XZXYT8HPisk8IpipKSoPUNZjMwUhghYsfOW9qBV8
 l17RFnIeOX7GLoPFoXA8c2YZUmYdQ3hBX7CxS48jisMYB46HIUEWiQPbM3lysyrypPoP
 rXs5vIVmZycY6G0agDvYIlouZOLZzjbS1hBTcn3iXQw9lg7mIfg5YSAn+nLYDPFZPLX5
 9/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CiBs9ErOQVTYs2CjuygeJw6/bsE5JEbE2kWIVK2dJJs=;
 b=nrAOAqSixOhiKgncXw1bduWFIEu4gvwDvoZvVNHdodo9amlkvzkmxnV5s1wt7tnVOV
 Ph/lLQsfGPcLBWSf4a1NWHAVlDDXNfXiklfbMH9d35/F+ztAApGKEqIEwKEwqpZy1M0Z
 DwiZ4eeG7KdPREoBM5/6COXSPlM7MjiCp3+uk4VsnzLqjBQsjzoQEfIC/kXMG+qtK7fe
 wDYNFPOjGPOySy6OjM44ZFCLUroczFn9POI3LhsHO7SUX2AIG0Dhpjs/pC7M9BnyT3YD
 Cs8oFivyyX4Lomh29c3DQOsCcY7uMulWpqVXbu1uf6wNYwAJKV1CIkUXHdn939AnFpMy
 4gvQ==
X-Gm-Message-State: AOAM531KOof8Z22FeV1bgexdOtJ247ytHPtmgX+KFMHG8qQWLfGbplCX
 cSttN97hThXGX+ayzlIQVxAV92bBQc62/Q==
X-Google-Smtp-Source: ABdhPJwFiDT4G+k2l73qOfP+Sz36kjTSPkOTepPW8ugf3swTXjD1sHqESrALXhQ2hmsjp8Cduu1BSg==
X-Received: by 2002:a17:90a:3f87:: with SMTP id
 m7mr6436139pjc.128.1626915002590; 
 Wed, 21 Jul 2021 17:50:02 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id y187sm27716791pfb.185.2021.07.21.17.50.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 17:50:02 -0700 (PDT)
Subject: Re: [PATCH for-6.2 33/34] target/arm: Implement MVE scatter-gather
 immediate forms
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-34-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17a1f037-3033-dc83-e970-bb16dffcdeef@linaro.org>
Date: Wed, 21 Jul 2021 14:49:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-34-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
> Implement the MVE VLDR/VSTR insns which do scatter-gather using base
> addresses from Qm plus or minus an immediate offset (possibly with
> writeback). Note that writeback is not predicated but it does have
> to honour ECI state, so we have to add an eci_mask check to the
> VSTR_SG macros (the VLDR_SG macros already needed this to be able
> to distinguish "skip beat" from "set predicated element to 0").
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  5 +++
>   target/arm/mve.decode      | 10 +++++
>   target/arm/mve_helper.c    | 91 ++++++++++++++++++++++++--------------
>   target/arm/translate-mve.c | 66 +++++++++++++++++++++++++++
>   4 files changed, 140 insertions(+), 32 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

