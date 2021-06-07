Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BDA39EA6D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 01:51:39 +0200 (CEST)
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqP1u-0004K6-EY
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 19:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqP0t-0002u6-Ti
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 19:50:35 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqP0r-0004p9-28
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 19:50:35 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso1106369pji.0
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 16:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=jdED51TAuB9TNMe+MlCQsJfh4AeOA+tfzS6KZ9hNIa8=;
 b=IscrLSQO33bKvMxlEFVIbKZeQjRj5zVN27AH7RdMTEOpMMtBGifCv7SVrQraxiI+S1
 GXTDinRpP+Ckhp/SFiDA56u4/UjfpRD/FXsQ21IBlcscX5T6CfzNm0owEz0KAkkWom/3
 rgfJMECf/fM+UAX09aUoOAbS4g+wmaI0CFI06c39HBnLv6sEXQLJhhzHzFKM+yD94TUj
 EchKPKZ2lzM3by6xfl7qNHof4UUft8jKtgtVFpD+r7Nl0LtD+NDPtdYppN6XWnvw5++/
 TCWyIBTnTEVVMieigXnaKq8C1anLvKUywKKxAJxKCb9WCx4wUWWqBbiSkcPHR8rqATvk
 jUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jdED51TAuB9TNMe+MlCQsJfh4AeOA+tfzS6KZ9hNIa8=;
 b=AfmB44xh3tGf36DZD8E9ldESpUFn9uTFBtREYhHZIK0/0kmNvvyapZ83Q/hESjs6Yj
 JFD9juwA93znsqfF7NRF3OFBu2gJj4mbhRa+QsityORZ1Di7/Sk2B45ZQa9AqgkO9NOA
 UNMvvrguWvnBwdM0g+EOfkLzy5wxoVInPHLhH+jpZVc/6Izdkh4I40q/8QTYadVtZEz4
 wdx1oSg/UUixi2bQ4APP7lo5m6p0Xchf663IlXZGu605ZpHbHV/eNn93I4BG1uAtEi/A
 tLSqI0GBVf3dv/rpg9dfz1wpUAy8Irjj0K4JsNyolQtqwhHmTEVY3rDxWiO3nvBMADAm
 kvRA==
X-Gm-Message-State: AOAM533caca3vb2JJ8lG7RG4Iduf2ESJIbFOdlsIlED/KYIUR+zINSdR
 uUkjZobdAT+dbf22BFz9spMJXPsUoReQCw==
X-Google-Smtp-Source: ABdhPJx9bwjCs1QYC8I6mHinp6ylJL6wxWnMZg1WEoEjE+cFD2YcnTPEoqXcejmporcvj47Uj/EvCg==
X-Received: by 2002:a17:902:9a42:b029:f5:1cf7:2e52 with SMTP id
 x2-20020a1709029a42b02900f51cf72e52mr20221053plv.25.1623109831019; 
 Mon, 07 Jun 2021 16:50:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 l128sm9921988pgl.18.2021.06.07.16.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 16:50:30 -0700 (PDT)
Subject: Re: [PATCH 05/55] target/arm: Let vfp_access_check() handle late NOCP
 checks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dc54c530-ae79-1006-b645-fe05cb821072@linaro.org>
Date: Mon, 7 Jun 2021 16:50:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/7/21 9:57 AM, Peter Maydell wrote:
> In commit a3494d4671797c we reworked the M-profile handling of its
> checks for when the NOCP exception should be raised because the FPU
> is disabled, so that (in line with the architecture) the NOCP check
> is done early over a large range of the encoding space, and takes
> precedence over UNDEF exceptions.  As part of this, we removed the
> code from full_vfp_access_check() which raised an exception there for
> M-profile with the FPU disabled, because it was no longer reachable.
> 
> For MVE, some instructions which are outside the "coprocessor space"
> region of the encoding space must nonetheless do "is the FPU enabled"
> checks and possibly raise a NOCP exception.  (In particular this
> covers the MVE-specific low-overhead branch insns LCTP, DLSTP and
> WLSTP.) To support these insns, reinstate the code in
> full_vfp_access_check(), so that their trans functions can call
> vfp_access_check() and get the correct behaviour.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-vfp.c | 20 +++++++++++++++-----
>   1 file changed, 15 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

