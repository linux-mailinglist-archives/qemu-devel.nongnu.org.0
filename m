Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7553B37A3C3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:35:05 +0200 (CEST)
Received: from localhost ([::1]:55100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOnA-0006Bt-In
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgO2v-0000CK-LM
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:47:17 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgO2k-0002UO-Tz
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:47:17 -0400
Received: by mail-ed1-x530.google.com with SMTP id b17so21934592ede.0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 01:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a0rqwZsKyKmhnSGByBNpbnjzv6aWnLd5QLbNeWC83uU=;
 b=pT0VzgqMgWpa8zaKD3p9R9GCgt2blxEIFOZlwayjGXeDqnUfUUNx3lcSACXXkVAMNY
 4LQBPfphC4xxJl+vcSL66eJ24TN4XkYucdk50mqjRONnkpJjDl2tOXCk/GtI2WcwtIFL
 uH0bis/f1+dV8sJaLTzeVqaPNh/Gl43lSPzV0YsO6xaDiyXAYze2objwlxfqB2/s8Rll
 ObhwjULQtgreOwtKKZmU4lZwedgBOu+RokEX2kihW1ODSaxWxacrnjIIUxDHiTN1PXIp
 bH9B7fcC6vSmScCh7sojEXbXiCqazja6WsM+S71hqlGE6zhi3QukYoBZrvWuYFOXJ2pR
 Kijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a0rqwZsKyKmhnSGByBNpbnjzv6aWnLd5QLbNeWC83uU=;
 b=l64gnXJNsoL46ZrK0Ov/+3FoaHyGlEdvGexSIvaPn4JVY/S5FSodlkf20qZ672zdXg
 4nh1tzOC22sZOvIFJWm7HjtJPM4WJcwDy+ZZqjMAuqNhglb3JgIwnERIIjZK1dflu/hn
 EFLcpmKt8pvw/fGK/ZEAjeAivohbOlHspjQatP9W33+n1HSQ5+X4nng3SfiYC93qe9UM
 ANTd68vrOi9wAgQ8ZlUf9QqCzkFDHBHuaHuvMeTmFkNbcN1d1UdAsLt/KWOL1qoLwWDT
 2CPSsuIgUIl40zEN1ydZclcpsgJBV46lXTKZtQ+O/YFkYcXe4r5E95J5hcmxuDsC4r6e
 GQgg==
X-Gm-Message-State: AOAM532Mk3ievw+hj6irSSFFLMcc2Xs19ZCsrV+LoAQq+cTOXmy3mSj4
 QkYLpMs7dnRjft2Z1mFDDg7beHIHTtaXa/REmlcAWQ==
X-Google-Smtp-Source: ABdhPJzfCfi0kuWXu/tbK+VDH2EagTe8HBUeWAVxcCNtfzsoBkM2P51/8SAAdWgPh8YL/MwEmNzFgewZr+9cIr+WVuU=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr34323343edv.44.1620722823814; 
 Tue, 11 May 2021 01:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-8-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 09:45:51 +0100
Message-ID: <CAFEAcA_JYbFAouoYK+7_udot+NZSNQUkQvGZOEwGZrQzeR2QyQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/82] target/arm: Implement SVE2 integer halving
 add/subtract (predicated)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 54 ++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 11 ++++++++
>  target/arm/sve_helper.c    | 39 +++++++++++++++++++++++++++
>  target/arm/translate-sve.c |  8 ++++++
>  4 files changed, 112 insertions(+)
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 7eff204c3b..3703b96eb4 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -639,6 +639,45 @@ DO_ZPZZ(sve2_uqrshl_zpzz_h, uint16_t, H1_2, do_uqrshl_h)
>  DO_ZPZZ(sve2_uqrshl_zpzz_s, uint32_t, H1_4, do_uqrshl_s)
>  DO_ZPZZ_D(sve2_uqrshl_zpzz_d, uint64_t, do_uqrshl_d)
>
> +#define DO_HADD_BHS(n, m)  (((int64_t)n + m) >> 1)
> +#define DO_HADD_D(n, m)    ((n >> 1) + (m >> 1) + (n & m & 1))
> +
> +DO_ZPZZ(sve2_shadd_zpzz_b, int8_t, H1_2, DO_HADD_BHS)
> +DO_ZPZZ(sve2_shadd_zpzz_h, int16_t, H1_2, DO_HADD_BHS)
> +DO_ZPZZ(sve2_shadd_zpzz_s, int32_t, H1_4, DO_HADD_BHS)
> +DO_ZPZZ_D(sve2_shadd_zpzz_d, int64_t, DO_HADD_D)

More dubious use of H1_2 in the _b forms.
otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

