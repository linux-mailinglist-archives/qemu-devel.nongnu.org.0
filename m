Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7679968DAB6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:27:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOvz-0001Cx-Ca; Tue, 07 Feb 2023 09:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPOvu-0000yK-Py
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:26:54 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPOvs-0006TZ-V8
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:26:54 -0500
Received: by mail-pf1-x431.google.com with SMTP id t19so3439368pfe.2
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Fxv71ohYTRmu/fBnYyOPmbcm4hm27+TzCHKQssLCMK0=;
 b=HsshjF56g0SC3T/y3pdixulN2tMaSavwKLtGp2GsTDaSwX/+9V0VRx4tbnLd8GDegr
 E/43wOYYVmGJYQc16z1NVebPIw5AOlby31xPrYbdvFy0USOImlnJ9dUfysyZLBlgV6wx
 rZl4oI4JEN9pht6FRFAVVdKh2raPO7PYYwLZXZeQ8vB30G1zc+NTSE+k0r5Kt7CWEeFB
 IyKzVR75jer+qcudDD4/d6MGGYxiAbSPSnJwUaxP9KcX0YUzWq2JYD7mSgGWHfvi2sri
 aqmHJvnJswrbd3nxfkOxFA9XYkzO5gD2MSo/uYIFmUMGk1c9lxR2s+NGByzF3tgcqY/q
 bs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fxv71ohYTRmu/fBnYyOPmbcm4hm27+TzCHKQssLCMK0=;
 b=kpX6nB8xxbzlDMFICszKE1WdarE+kxoaDjbUZSWtjzQEEhqa8586pcRZoCHqFbbWGc
 FtoyS0zlAoLZbNjiug2qwBHEk4A8OVKvbg0BDVX+3R/fqP3Sf137M4ZTeX842O6EQIwe
 P7cMV0BfTxI0Qbb16G5tnZlE05fYtu791q4B8W70RkmktyqSbCREZcdpjXCWzWvCwQfb
 +FFALNpy5fMv2YJNiH3Ogmv/FObZIfkruAVC7UcMfWdN/wmTtAJbL1SmAbopthUlo7Da
 jpAD7eWV2c29UUdfh+zH59mY3ti1t55QDFM2qoFw2LKMe80JCsRjq27Til8f400dGdke
 F8xA==
X-Gm-Message-State: AO0yUKXFAVZmhpJGzXVWiGR4+HnFyCiw/xddQM1RoXfWRHfgQx1zbKYs
 ET0xjPBVuqiBSWUfC8tSLExPjDPtkVK7jgxnz5xkXw==
X-Google-Smtp-Source: AK7set+/RlNxwzyHp+vYIQ+7RXJfo6XyeS/Z7knjh4wOuay7L3GTn6saynRBoOppU2oJLhXQ2DHN9QiUoZDfH6sQTsI=
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr814453pfb.48.1675780010143; Tue, 07
 Feb 2023 06:26:50 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-2-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 14:26:38 +0000
Message-ID: <CAFEAcA_-XkpZDGWXFnKny5A19-KUnZPaoPwi-N9EeyPjaDxJBg@mail.gmail.com>
Subject: Re: [PATCH 01/22] target/arm: Fix pmsav8 stage2 secure parameter
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have computed the security state for the stage2 lookup
> into s2walk_secure -- use it.

We've computed *something* into s2walk_secure, but it
doesn't make much sense for PMSAv8 because the VSTCR_EL2
and VTCR_EL2 registers don't exist there. s2walk_secure
also doesn't sound like something we should be using,
because in PMSAv8 there is no "stage 2 walk" being done (there
are no page tables to walk) -- we just use the information in
the EL2 MPU registers.

I think what we want to be passing to get_phys_addr_pmsav8()
is ipa_secure. It's a bit moot, of course, since PMSAv8 doesn't
have TrustZone and for PMSAv8-32 the security state is always
NonSecure. (For PMSAv8-64 it is always Secure, though...)
This means that ipa == address and ipa_secure == is_secure,
since the stage 1 MPU can't change either the address or the
security state. Passing both ipa and ipa_secure to the stage2
call means we're being consistent, I guess.

> Fixes: fca45e3467f ("target/arm: Add PMSAv8r functionality")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 57f3615a66..b0f8c59767 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2727,7 +2727,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
>
>      if (arm_feature(env, ARM_FEATURE_PMSA)) {
>          ret = get_phys_addr_pmsav8(env, ipa, access_type,
> -                                   ptw->in_mmu_idx, is_secure, result, fi);
> +                                   ptw->in_mmu_idx, s2walk_secure, result, fi);
>      } else {
>          ret = get_phys_addr_lpae(env, ptw, ipa, access_type,
>                                   is_el0, result, fi);
> --
> 2.34.1

thanks
-- PMM

