Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822923CBF14
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 00:12:57 +0200 (CEST)
Received: from localhost ([::1]:58258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4W4m-00075R-KL
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 18:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4W3v-0006Qk-Up
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 18:12:03 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:36611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4W3u-00036H-Fg
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 18:12:03 -0400
Received: by mail-pg1-x52b.google.com with SMTP id a6so4019069pgw.3
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 15:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=PD8IrFoZrZmvdewEGQ0F+Yxb3KALmLAdR1dQaVcJeY8=;
 b=J4j/1uKYGgTjwLAzTGrEFv2k9rpanFI29LfA+fOpa4SpTZS+80vhKMIgnCGs5CmBaK
 uQg8YOxNnKKo0VESKwOzDuNjHlhvjqrLYIOicBq33WmfnKm7/wSUH6z6xKAqt73IwVFc
 JAsPZn8nE6FFnjOx0WBipiWGAFcfYzBBMgXzahyCy2XQaGizgQrjmCMXfbsBjmoSp2yv
 mdCRL42Qdkdtyf05hSvdI94jbzGSpGx8S6RoYSrQzDA+JBuUTRvpnCCQRB8ds9koWpdv
 00uqpHDJOjhnHnRtpKWdDXlUrHBYNdnjO22nkZflQPWfm4/N5HX5e60WcTh1GCUoIQu8
 wsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PD8IrFoZrZmvdewEGQ0F+Yxb3KALmLAdR1dQaVcJeY8=;
 b=SwAUxuWnmEKgbL5Ki6kQKunn1n1WBUciiDym5IfbOuzIZPQXWQXPpQ0olZjl70fHrp
 U83n4g9h8o0LeP963RZ5h5PS/Re76aZZf2d4WEwECGhxigDiv9PNEM2hKI4zs+O7P+NG
 YX+Ga0x7eAoizbxXpLnslnrLg6Y4Lp2pXEdaWYeY6Hvc1Uxk6DAvKodUyB6Bc2UNqVIm
 6DaTrIFs8qpSkQut7gwoLamlZrj8QhAgSnQhvnTWbcPwLIjqCQPfGYWvQlD5gAQXLqFz
 E7A43Z4sOricTHoS3fjDucnGCQWKoPfS4qL/ArxcDpfecBdEcp+A06bkYn5x6vkc4LeP
 yaxg==
X-Gm-Message-State: AOAM533CA3y0TPOKNnTzSO1c53PxuHLMD6RRmehiSEfjcVRCwrPJwYlt
 Y56dSoqab0T/FWe6t21nz9VDV5lJZqWjHw==
X-Google-Smtp-Source: ABdhPJyriZ1TBOKxQyF14vbXPH94AIBeJs659UmaAz70zBMHNZgMzlJ6c+pIrDRNBHqitu5v07O75Q==
X-Received: by 2002:aa7:9ec3:0:b029:32b:4eb5:4bad with SMTP id
 r3-20020aa79ec30000b029032b4eb54badmr12434919pfq.6.1626473520920; 
 Fri, 16 Jul 2021 15:12:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id i25sm11168559pfo.20.2021.07.16.15.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 15:12:00 -0700 (PDT)
Subject: Re: [PATCH for-6.2 17/34] target/arm: Implement MVE VMLAS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e3f557f7-c65d-428e-a0b5-68d1ffc01df4@linaro.org>
Date: Fri, 16 Jul 2021 15:11:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 6:37 AM, Peter Maydell wrote:
> Implement the MVE VMLAS insn, which multiplies a vector by a vector
> and adds a scalar.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  8 ++++++++
>   target/arm/mve.decode      |  3 +++
>   target/arm/mve_helper.c    | 31 +++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 44 insertions(+)
...

> +/* Vector by vector plus scalar */
> +#define DO_VMLAS(D, N, M) ((N) * (D) + (M))
> +
> +DO_2OP_ACC_SCALAR_S(vmlass, DO_VMLAS)
> +DO_2OP_ACC_SCALAR_U(vmlasu, DO_VMLAS)

This is confusing.  The ARM says

# Operations that do not perform
# widening are always unsigned (encoded with U=1),

This instruction does not perform widening, but it then codes on to enumerate the 
signed/unsigned encodings.

I suppose you're matching what's written, so
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

