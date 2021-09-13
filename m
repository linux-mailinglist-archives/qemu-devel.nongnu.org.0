Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ED0409036
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:51:19 +0200 (CEST)
Received: from localhost ([::1]:34448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmMg-0006Uo-F7
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmGH-0006Rb-F0
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:44:41 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:35497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmGF-0005YT-Ls
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:44:41 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 f3-20020a17090a638300b00199097ddf1aso6621240pjj.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sECki1mK5KcjvuM4w28nfED3WkStKJ9mnYzHHMB4vXE=;
 b=ySmvycN9Ypm6oNVG22wzKLLZVCKDz1cZDPgDHng2P4e7mduyMkUMEJ2/arJ2xJQKnV
 l/NIfPg2chwXlgw3IfuFhtY1vMX4qDzhIQMogY49znakKYXR+VKbc8kW8GjXVsZBZG8c
 dbYe9fCm/Ru6HGPRk+AvVkG5nzgZ8jJv1T6oDFffiQyogqoFnRZvtHnl/yWLs7pef/rF
 w0x9cUmijzqiavNwUkRHtlFZnwukX7flVELIo74biG4/otZKewL8qE/CSG7305MI6tVF
 ZEH4ymWinF1amd6r97GGo68PmuAspNGSzaBgMVZu7tNC/gMrvnFZqxkE5ZTUZAynlEIO
 h39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sECki1mK5KcjvuM4w28nfED3WkStKJ9mnYzHHMB4vXE=;
 b=ocNNTfrjKNQelgZd4Z2cOvTSPSrQYO8G8wJv++axCXrZ7ogToeYL03jfsV3Ua/8hCl
 5E8YL1kjyHW/ZRR8rUAqCmN4HheofEBgeMDXvDOSvIf5R0fKW0UrCkisgZ6gtK00iMKT
 Kcs8d13OIqlgpAV4fBB8BNjhoVHg2FQcnkh/E41Y2aJErsofPjRjhYR/+6UhSitLXhVS
 PgALLdxOojkuR0m6vRn7skUvZl4Dg/XTrd8lNTI98hLbIPfMH0smzwVeU5QOhtRmejY8
 ed/x9DOKaZGRIYGos3bIMdu35Gm1mWZ4JdgrPKygCw+vdbg6d08NpbMNFlsdxMR5H2to
 Au2A==
X-Gm-Message-State: AOAM531ynPf50MALuTKOHjPo+vwN6zxCCeK0CvvX3f+yaJ8qHr9SLldp
 mA+BaOZED7cwm3qTcXUvRc2b1g==
X-Google-Smtp-Source: ABdhPJwxNLVwkO5rqY61jzNDUqDRyQmLMVGODhrqoR1+TPoy9rHLnVx0XbL6a/Zhj7Y0M5++JYn7rw==
X-Received: by 2002:a17:90a:5b0d:: with SMTP id
 o13mr13140928pji.117.1631540677361; 
 Mon, 13 Sep 2021 06:44:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m18sm7102809pjq.32.2021.09.13.06.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 06:44:37 -0700 (PDT)
Subject: Re: [PATCH v2 03/12] target/arm: Add TB flag for "MVE insns not
 predicated"
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4943a18-288d-33cc-5f36-1229de73189a@linaro.org>
Date: Mon, 13 Sep 2021 06:44:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913095440.13462-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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

On 9/13/21 2:54 AM, Peter Maydell wrote:
> Our current codegen for MVE always calls out to helper functions,
> because some byte lanes might be predicated.  The common case is that
> in fact there is no predication active and all lanes should be
> updated together, so we can produce better code by detecting that and
> using the TCG generic vector infrastructure.
> 
> Add a TB flag that is set when we can guarantee that there is no
> active MVE predication, and a bool in the DisasContext.  Subsequent
> patches will use this flag to generate improved code for some
> instructions.
> 
> In most cases when the predication state changes we simply end the TB
> after that instruction.  For the code called from vfp_access_check()
> that handles lazy state preservation and creating a new FP context,
> we can usually avoid having to try to end the TB because luckily the
> new value of the flag following the register changes in those
> sequences doesn't depend on any runtime decisions.  We do have to end
> the TB if the guest has enabled lazy FP state preservation but not
> automatic state preservation, but this is an odd corner case that is
> not going to be common in real-world code.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I renamed the mve_no_predication() function to mve_no_pred() because
> I want to use the former name in patch 2 for the translate-time "no
> predication of any kind including ECI", and wanted to distinguish it
> from this function that is just determining the value of the TB flag
> bit.  Better naming suggestions welcome.
> ---
>   target/arm/cpu.h              |  4 +++-
>   target/arm/translate.h        |  2 ++
>   target/arm/helper.c           | 33 +++++++++++++++++++++++++++++++++
>   target/arm/translate-m-nocp.c |  8 +++++++-
>   target/arm/translate-mve.c    | 13 ++++++++++++-
>   target/arm/translate-vfp.c    | 33 +++++++++++++++++++++++++++------
>   target/arm/translate.c        |  8 ++++++++
>   7 files changed, 92 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

