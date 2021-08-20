Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97D73F2A7A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 13:03:13 +0200 (CEST)
Received: from localhost ([::1]:47092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH2Iq-0007G5-T3
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 07:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH2GE-0006FN-5n
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 07:00:30 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH2GB-0006MP-U8
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 07:00:29 -0400
Received: by mail-ed1-x531.google.com with SMTP id v2so13388624edq.10
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 04:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xtPlEuaJzhXA/NggMc7H8/kqSg1c9rENL1ofC3QEKb4=;
 b=aXwjRAscvOTayMqUFEYnZe3mgLkliLSEdLy1tqLFrU8z0A8mc7/1jgkmuC+/NdSXLF
 sRHpqUAR8UYBYL5iQcJ7jnNNnyQWaXQSY5YThSosYlpWClmSTKpBCgsGAXZIe+/FkNdU
 LpcdXHC6QY1ItWbSKsyvKucscwqdXIhKKAzKOJTCbIzZpk1PsfejMVyjYlN9jVdDagmb
 Q24zkC6Ra/cmnFGn9bW7c0YCdXziAlGzMQYnk2jcMb9aZdfsi1G+P8OpLIP+w1GBX0hM
 d5oFUKD/N3XWZyaTY7ftPEISWR9XB13xbb6sJSnxqedO5Do4sSqXrL6OmI6Atfe19QU1
 tg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xtPlEuaJzhXA/NggMc7H8/kqSg1c9rENL1ofC3QEKb4=;
 b=mPaaV9qJrt4HFFqsdNQ0FIcx8qJx3EzAUz4GTHX1TR9uC4XI0LkugsrFnFG6dJVe2R
 rOslayL2+58FVF2LMq5uMk9oY52obarCURjU7pq/lX1b8VWOSEvIRyvwxJQ6M85BNawI
 4bI3igE9T8eD4QKqzpAwkvtnWmlHv/X4H5YxrDkPCPdib1Yrs4FW3zZFQqaHiiYq5X0x
 TiAaZZU0Ll9UlMWFhmWIh8UY4XAhgan3Bc3B/Zfr6FTUtX06wyZkjx9+Z/rcIj683zXb
 xFzqLkgGOq85PgYTucHjgE2OZjNXfWll+7xBxLZgGItA40hb9YCVf001/1lzaKzN1NYW
 cRTg==
X-Gm-Message-State: AOAM531/EOIwNbQMe5mmV1MXcBpMER8/PkPoWp9HiOM/MR+snGTGMnfN
 BodZaKvUbOrBGlJnUuXAeeyTwpWvl3tY7ZeE+1Ck8g==
X-Google-Smtp-Source: ABdhPJzMzqYdtDVR9PKyelEIccaeiaeuZoxAteQt1lDxDpMymEi8v4Gv3k1lk4dgp8m/p6lnX/tjJS0CWkgKcj64UbE=
X-Received: by 2002:a05:6402:3099:: with SMTP id
 de25mr21498286edb.36.1629457225679; 
 Fri, 20 Aug 2021 04:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-4-richard.henderson@linaro.org>
In-Reply-To: <20210818212912.396794-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 11:59:39 +0100
Message-ID: <CAFEAcA8HZ-vQjT7pHJSaZRMdrui_5T41=xYTqdftMUVMt_46-w@mail.gmail.com>
Subject: Re: [PATCH v3 03/14] tcg/arm: Simplify use_armvt5_instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 22:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> According to the Arm ARM DDI 0406C, section A1.3, the valid variants
> are ARMv5T, ARMv5TE, ARMv5TEJ -- there is no ARMv5 without Thumb.
> Therefore simplify the test from preprocessor ifdefs to base
> architecture revision.  Retain the "t" in the name to minimize churn.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.h | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
> index 18bb16c784..f41b809554 100644
> --- a/tcg/arm/tcg-target.h
> +++ b/tcg/arm/tcg-target.h
> @@ -28,13 +28,7 @@
>
>  extern int arm_arch;
>
> -#if defined(__ARM_ARCH_5T__) \
> -    || defined(__ARM_ARCH_5TE__) || defined(__ARM_ARCH_5TEJ__)
> -# define use_armv5t_instructions 1
> -#else
> -# define use_armv5t_instructions use_armv6_instructions
> -#endif
> -
> +#define use_armv5t_instructions (__ARM_ARCH >= 5 || arm_arch >= 5)
>  #define use_armv6_instructions  (__ARM_ARCH >= 6 || arm_arch >= 6)
>  #define use_armv7_instructions  (__ARM_ARCH >= 7 || arm_arch >= 7)

Typo in subject: should be "armv5t". Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

