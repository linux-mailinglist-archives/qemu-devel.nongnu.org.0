Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E10C42031C
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 19:33:05 +0200 (CEST)
Received: from localhost ([::1]:40832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX5ME-0000aW-CN
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 13:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX5Jk-0007YQ-SN
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:30:28 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:36497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX5Jh-0002oj-AU
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:30:28 -0400
Received: by mail-qt1-x82e.google.com with SMTP id l13so13944821qtv.3
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 10:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nF7OOm/jBXyBsv2okG+ignUndLYyFtDfaQN7p7diNc4=;
 b=Yu/ii3spKXc07WsmLMBQ5qH6wERoWX+R8DJtlGQoWUkwrq+RMc3pkRfENPkVo6z9vW
 e+y+fC+R7DlcxeIxpHyPoVrVYImSkcRxH42wTAKIGjuzVE7yguMuvCszlFjo3ecWSYCF
 B91IhAFcx8ZcWwX0uNdClzoRBRlVilgDhhvzSavkMIJdWkYQ5CsJCbftoUoVL6ur/AFU
 CzkIoK92urNrsiORlkGI9CwMBVihqUsyw8Hb3PbszsEvTnbF19GVQ+eDesE/8y2sYBhG
 dn2Fo7twSi3lmD5rNXi+tmBP1fQfjiKoFawTx+/pehXAB9rKXGXlC+eyog0rhBV1O9Mx
 aBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nF7OOm/jBXyBsv2okG+ignUndLYyFtDfaQN7p7diNc4=;
 b=0NkeRcYc5hsd3Ppnn20WIUyuN+7D5ndIoovc/g5u+e0NLf3n326F04ZMBY7gKfCq5A
 7kvYtZsNtXvPh+HOntZO2uE4Ye9H5tw6F6zgEylI6pOTXjgw2rAp2Aqtky79idrYAIKI
 cJPU3xekLwjK9deP9t1E00E2ni30cJtRltMKOHmRVdKu6GYcKM/XSOd3bjt6zY3SQKOk
 I2JTitPpZDxfNtqEPShbx6F7dkDcVwIe1mvO5e8rO1EGfeSiDvTdRLZk7X5SqfIuZ8lC
 5+zdwhef6VcBwKGPGTjGMbQC2Tds5SbdNm1Mecx0FmJWZuasNfUlstau2UJ+ABDhDC0m
 IW2w==
X-Gm-Message-State: AOAM533+mOVWzM762Mo9qvp8ZOYF0d3dj+Grkm8FJFtfbM/jaBY/7nX8
 SHzTewsUB96j9Zb67kcWZW1efHVolBzW+g==
X-Google-Smtp-Source: ABdhPJwy8xk0Y79kCoBLjm+oSrCXTtsAhj5c7c+may+LfsvEzdrRzaht9dOtumyOhiEcQQTjfqQWXA==
X-Received: by 2002:ac8:5905:: with SMTP id 5mr9275829qty.391.1633282222171;
 Sun, 03 Oct 2021 10:30:22 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id az12sm6577802qkb.110.2021.10.03.10.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 10:30:21 -0700 (PDT)
Subject: Re: [PATCH 1/2] tcg: add dup_const_tl wrapper
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210928205450.4121269-1-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <284955c1-be12-c969-59d3-3068a2643a0b@linaro.org>
Date: Sun, 3 Oct 2021 13:30:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928205450.4121269-1-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 4:54 PM, Philipp Tomsich wrote:
> dup_const always generates a uint64_t, which may exceed the size of a
> target_long (generating warnings with recent-enough compilers).
> 
> To ensure that we can use dup_const both for 64bit and 32bit targets,
> this adds dup_const_tl, which wraps dup_const and legalises the
> truncation to target_long by casting it to target_long.
> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> 
> ---
> 
>   include/tcg/tcg.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index 44ccd86f3e..8f8a209600 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -1272,6 +1272,11 @@ uint64_t dup_const(unsigned vece, uint64_t c);
>           : (qemu_build_not_reached_always(), 0))                    \
>        : dup_const(VECE, C))
>   
> +static inline target_long dup_const_tl(unsigned vece, uint64_t c)
> +{
> +    return (target_long)dup_const(vece, c);
> +}

While this works, it avoids the qemu_build_not_reached() sanity check within dup_const.  I 
think perhaps this should be like

#if TARGET_LONG_BITS == 64
# define dup_const_tl  dup_const
#else
# define dup_const_tl(VECE, C) \
    ... stuff, excluding the MO_64 case
    ... using 32-bit multiplier constants
    ... using (uint32_t)(dup_const)(VECE, C) at the end
#endif


r~

