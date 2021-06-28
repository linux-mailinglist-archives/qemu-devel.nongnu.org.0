Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D7B3B6508
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:18:35 +0200 (CEST)
Received: from localhost ([::1]:47740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxt1u-0006Fa-HL
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxt0a-0003uJ-C0
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:17:12 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:46933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxt0Y-0001rX-42
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:17:12 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso223435pjp.5
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=QddxBhcxCu2fGsmIplJsAblDEANjvYaDuKQ/yNUueDg=;
 b=aV+nyMrOgW0/1brpYuizzIBpbjYfg2c/VY0nMZM8qFAQkjNQfrj83nl3iczAnxhiJs
 VU0G9EdKRvm7Uf41viHAN51fB8mKBW08d4uXH78v/PxDX6RMeRIm569PYKHVFgtHreMr
 u9U+PxClkUcaVCh/vBfOpoWhusyNnk8mijqm9qXJUrBoqnu+nAw7Oo+rCGZLMSKUCmN6
 zy8+jdKL2z5Up01UR+8X0a2akzvdL1vCHRsu3MylqS92ZDzsDKg5zUpGiCuxZ31r2+ud
 UpmNWQX7Na/2Fn6wNk70sHnVHfRwmjcEMc3sqL12VkxzXUGOPD5Z3PCF64G+2CwqH2Lw
 PKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QddxBhcxCu2fGsmIplJsAblDEANjvYaDuKQ/yNUueDg=;
 b=Xq5qn4GV7d0AkAUgOJw7WXMZirlx3YPW2ECGMKTfnpOZIBWFz4M/0zbs2eoeHZeuEj
 a5eTT1n5RPMSSopAuf8jgdpPYOgFLJHI82e1S4pFSIy9xABlSMJJ9CEfvpOjKXH9H7Mp
 7RGu9tBav2PvEzgSrQBBWiIMpd24zKJYsBTEQp+7FfeMLXBWY0xnyULtqN/dA7z3ab5I
 q32fLuT0+1nX3sSdRr5bK23ZK3QarBHxvx4xMox3ynlMd27wa5459XBW7Wjh00JvWpG0
 UVg1/z7vMMBAFHXh1TCE2wxt6HD4rblY4Bn98plXiFF1K/uO/gEzhkpGdxGgJbsL3st5
 EOXw==
X-Gm-Message-State: AOAM531DBioFKBiJ/1YfNeVcJIpIEsuf144ljKHF4q9TS5dBW6dSboqK
 dBPxlLTM8UceWLgL9Lry2iCzNutqdwG1bg==
X-Google-Smtp-Source: ABdhPJz0gqmL82PNiJ9XNSOEqPIxsu9Bt2TQKLt7FzMOrnbwGesFvO0PtNK64S8sY3zFxnDkPNSJqw==
X-Received: by 2002:a17:90a:a107:: with SMTP id
 s7mr37879477pjp.1.1624893428591; 
 Mon, 28 Jun 2021 08:17:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm20349164pjb.37.2021.06.28.08.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:17:08 -0700 (PDT)
Subject: Re: [PATCH 02/18] target/arm: Fix bugs in MVE VRMLALDAVH, VRMLSLDAVH
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2a6d7c6b-784c-49e2-a390-538c0dcd0514@linaro.org>
Date: Mon, 28 Jun 2021 08:17:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-3-peter.maydell@linaro.org>
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

On 6/28/21 6:58 AM, Peter Maydell wrote:
> The initial implementation of the MVE VRMLALDAVH and VRMLSLDAVH
> insns had some bugs:
>   * the 32x32 multiply of elements was being done as 32x32->32,
>     not 32x32->64
>   * we were incorrectly maintaining the accumulator in its full
>     72-bit form across all 4 beats of the insn; in the pseudocode
>     it is squashed back into the 64 bits of the RdaHi:RdaLo
>     registers after each beat
> 
> In particular, fixing the second of these allows us to recast
> the implementation to avoid 128-bit arithmetic entirely.
> 
> Since the element size here is always 4, we can also drop the
> parameterization of ESIZE to make the code a little more readable.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Richard suggested this change in review of v1 of the original
> MVE-slice-1 series, but at that time I was incorrectly reading the
> pseudocode as requiring the 72-bit accumulation over all four beats.
> Testing with a wider range of inputs showed I was wrong...
> ---
>   target/arm/mve_helper.c | 38 +++++++++++++++++++++-----------------
>   1 file changed, 21 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

