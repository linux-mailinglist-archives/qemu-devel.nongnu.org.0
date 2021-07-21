Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFD43D19A6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 00:26:14 +0200 (CEST)
Received: from localhost ([::1]:46238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6KfN-0004Iy-UB
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 18:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6Ke2-0003Lz-Hj
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:24:50 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:45605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6Ke1-0003YO-3k
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:24:50 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 h6-20020a17090a6486b029017613554465so2727936pjj.4
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 15:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=I3uypPBUs/K+OQ1oU8Jaf0GwcXteSNP/AhJhrlwFnzE=;
 b=CLZUVyFlXUbjqzkVJI5+3jke4kAxs4hZqSwMYyNoPsBKGbETC5ViHruqxGIHGMIH4v
 N18HLlEQDdWxMlWnYM3A+HsV/pQP7rksmBB8oOdFJsxy4dYlZsUHYzxJNvLE4hNC/8JJ
 2ygsowP5HcriMXkBIEFxxTKr4VfwkmhTwnwgeyxnjDRTNVpXtpwfa8re5KxaBsGXSBqq
 ljDB8IWz9TQNVzzviYLN8k7/0F1iXuqN/6vCOgII3DPtKPs6w8QBUHpSeNpV1Dyqda42
 ZLKgUgiv41YKcUHwnDUcsD1JKwYrRn1GpjhLS3ttVOxYjOfmM1ciaPb9iE26iNsgSzsm
 5M4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I3uypPBUs/K+OQ1oU8Jaf0GwcXteSNP/AhJhrlwFnzE=;
 b=A8T4YXGJBm/dSyN/XAYhfOjjmDOK2tredDMpjd3gAp9/4ktBTcMqgETP4Xl5nyagHM
 D8DenC/PpnD9C3KmlPQK06aCQPuRYUKPWJsS/oeGnHb7fE1U24SIPUWhv4ET8UABkPm/
 BelntttPFBooCX+u6EfMO+Ud1R4PYH3rSOar/k8qaDZ/O1oTqbfJpgCbhxilOmldSiZP
 uFiRAZJYJBrUs9S26oR2cckd4KtTK4rRGTpF8aF6TDoEB/U3m+d78y4qU9OUGoO4KLvV
 ZmCMSwHJEMzroeoKauVlxzSoE3g4DLASBwNKNV3uyaeOdHtd+BuMWm1nxliThkpyyEPz
 UA3Q==
X-Gm-Message-State: AOAM532/MC0LQQJ0rk7ftB+ZmOmd4muN1W+5cvp4g4/jOMDa64GrK9I7
 fvgVrxhK74FFleOueSkNimNxlq2Rhvc4YQ==
X-Google-Smtp-Source: ABdhPJxHKOIK7XXNPVBWUVx21IchaM8hdUfVwbuofBWFD1qO1Ft6YUlueHFZoupa0Znh+0x4ZJXt3w==
X-Received: by 2002:a17:90a:7484:: with SMTP id
 p4mr36244957pjk.40.1626906287415; 
 Wed, 21 Jul 2021 15:24:47 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id 78sm19702710pfw.189.2021.07.21.15.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:24:47 -0700 (PDT)
Subject: Re: [PATCH for-6.2 30/34] target/arm: Implement MVE VPNOT
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-31-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <26e71538-8f8e-401c-c0f0-f8164275b227@linaro.org>
Date: Wed, 21 Jul 2021 12:24:44 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-31-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
> Implement the MVE VPNOT insn, which inverts the bits in VPR.P0
> (subject to both predication and to beatwise execution).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  1 +
>   target/arm/mve.decode      |  1 +
>   target/arm/mve_helper.c    | 17 +++++++++++++++++
>   target/arm/translate-mve.c | 19 +++++++++++++++++++
>   4 files changed, 38 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

