Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA3F36472E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:30:20 +0200 (CEST)
Received: from localhost ([::1]:38034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVqt-0004ch-RK
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYVpR-0003Uf-EI
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:28:49 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:37789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYVpO-0007L1-PF
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:28:49 -0400
Received: by mail-qk1-x72f.google.com with SMTP id t17so7680194qkg.4
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 08:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9RA/PxSDKRZwBlahVGkHg7Xpt+ai4Ssg30ZSr70gUVk=;
 b=ASTMT+Ja515VmeBu20rLplxR4RV2pnjkQ3Ri5LfhEeTPWzM0xeh49zfbJOwB7/93xV
 PKBqcElN+swak+FaTtdS/IxDIQ0XXlm5yiv4jbZpMHvwkm0aR0+1TGVUWwUdYxXBKCYB
 sS5s+B14nR/VI8no7zH83f0yqu8spgMVRjuQL8+bOIaMsChXGngPbfyZcWf3iHIegtuK
 7HkKfZjLBt2Bx8LtfkXNYxWxneeNFsGtqLsZfJaAmqhUkPvJ6GOQZw6URxCBItoVSEjK
 cjosB7oB+47GIOmifAqoGMPPmtstzph0VSwm61w28q6xU+OBlrfk8OM9ZvCbx0acdLxs
 o8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9RA/PxSDKRZwBlahVGkHg7Xpt+ai4Ssg30ZSr70gUVk=;
 b=s7BLfw0/F2qkaJz++9OY+nn2jVPRfVpZDrHtyYZuMr/WIYn6HC1hR8wikk57pk0wou
 NhXV13R5C+oW2ahk8K154D718m6Ubrsg2Argp45HvXJJlKk5ZlSjQUkOFnG83wnzJJA2
 yCiW8KQd1ccAzhphnoEQzZZ1e4VaKgUW4Uaw/mQn2JAGsWuWjbqhW2Gp2/+i+xJnjmIm
 yyd9mhuxIbYSiTa8fJ2cheFwxTyU/XzRQtozyrQd8QLuER1Zl24WJTxRDAQUAgYTszPE
 iAJA0RPPLZAcXOXK8rrrSQvjkAm8cJyoIQmhbunYbUgIvQI2c0rFUNJ+StYbqd8WI812
 rbYw==
X-Gm-Message-State: AOAM533erNtENhyajMxx5GMamFyYPpwbNjZVXbJ10tIqec/kxOGHUgkf
 8rLoXf9NRCRPSPxmeFzrZWi3Vw==
X-Google-Smtp-Source: ABdhPJxD1tGaCiqeHpMeA1uFMhw2EQr0YiGl0mGQH8GRsbT6ILSMAT+W2w5ZOrLwubfqJTg5tV6byg==
X-Received: by 2002:a37:9d92:: with SMTP id
 g140mr12486488qke.110.1618846125602; 
 Mon, 19 Apr 2021 08:28:45 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80ca:1129:3594:91a:8889:c77a?
 ([2607:fb90:80ca:1129:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id b15sm9929836qtg.82.2021.04.19.08.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 08:28:45 -0700 (PDT)
Subject: Re: [PATCH] fpu/softfloat: set invalid excp flag for RISC-V muladd
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210419055614.28361-1-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <448d86ca-28b0-6523-d84b-4f9e867cf01b@linaro.org>
Date: Mon, 19 Apr 2021 08:28:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419055614.28361-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 10:56 PM, frank.chang@sifive.com wrote:
> +#elif defined(TARGET_RISCV)
> +    /*
> +     * For RISC-V, InvalidOp is set when multiplicands are Inf and zero
> +     * and returns default NaN.
> +     */
> +    if (infzero) {
> +        float_raise(float_flag_invalid, status);
> +        return 3;
> +    }
> +
> +    if (is_nan(a_cls)) {
> +        return 0;
> +    } else if (is_nan(b_cls)) {
> +        return 1;
> +    } else {
> +        return 2;
> +    }

This second half of the function made me go look into the spec to make sure you 
had got that selection right.  But RISCV is always in default_nan mode, so all 
this is unused (and overridden in pick_nan_muladd).

I think for avoidance of confusion, you should use

     if (infzero) {
         float_raise(float_flag_invalid, status);
     }
     return 3; /* default nan */


r~

