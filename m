Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0AF3F1D7C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:08:51 +0200 (CEST)
Received: from localhost ([::1]:44046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGkb4-0006iX-HQ
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkZp-0005zd-9g
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:07:33 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkZn-0004C1-Sm
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:07:33 -0400
Received: by mail-ed1-x52d.google.com with SMTP id bo19so9589530edb.9
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 09:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YQd6Th7QL/orpb6uwYI/OkWcUXltL/16l+rXkyej9Yo=;
 b=LJe1ZAncB782w6DiOpCvfir5GZHn1P+RKEQGlkszVbhhgNWSVi6UUIzgk/CodL5U3w
 YzkDy4FZaeGbnfWT5VEVokhEPi0vjQNGwfkMfmdOaWOKWc1PnS3958J6rONy/gVNhTYZ
 VpRgHvVHppSMTsQKAVKXCsKgurVMjbRlHbsw3tdA1IKI4GK705dF61sY5pLaDufaPyb3
 uf4gymuidZI+UHDVzbT02ELTLlJhakgTTyVsU7/hamWaqYDHvsi4gYFpyPRgl5uVOOcE
 cAmbw7Hdbkv4vV43/diaU8lElMA7VC3UX1zMTkXXek3Rc4H1CQdMyhttPT/zBPwFBYyq
 48ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YQd6Th7QL/orpb6uwYI/OkWcUXltL/16l+rXkyej9Yo=;
 b=Z0Vk3Yz8RLnovt8eAXaJnRY+7TvnCssKjxj+Z780yCEv8y1NFiNUYKiJsunNhKg+2X
 MXnlwWFlPnRW7TST80W8QMArjBTsCuf7lT1zwPBzOUBCkmQiMJE12vCqVH7sdUmw2E7u
 HqMItNCssiN11wYeFunR3Kr3Npa08vyq9Ee0sqNVRUGERrPt3F4+bvPM8TSyLDtZO0lN
 TMzT4CmVSpX5q+Ih7zCUvtD0ALbdiAtGxoi8H/+6mKHfaz8j/qCRWFeMKY5XyVE+Iwrq
 axY6eojQeqG+9l+QIw7knW+/CykTWn4CRd6eZ6H3ZY0dHEnCJHyy6BUdLWhmTA+sEZVL
 wv1A==
X-Gm-Message-State: AOAM533DM47lhPVnlYaYpUIU6u8DkEyiWLrb6baMGFiJ7RQCr90YuqrT
 /U5X+YFssHSZXQeD+RvqLGnWlFStfNO9CtkdxYLRAstrqgw=
X-Google-Smtp-Source: ABdhPJx9l5GHX1nV49XEP8AMl0VdkPPVwbg+7LzUhuW/D126hsvSq5r04Wbo4ZKVH6k0ZKEbqlzPd1blutioitMn6Os=
X-Received: by 2002:aa7:c0c6:: with SMTP id j6mr5898732edp.146.1629389250379; 
 Thu, 19 Aug 2021 09:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-47-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-47-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 17:06:44 +0100
Message-ID: <CAFEAcA-FxaRGCzjDTJG7rUX1-LHs6_BB0DkDtqfo0cn6X3JXnw@mail.gmail.com>
Subject: Re: [PATCH v3 46/66] linux-user: Split out do_prctl and subroutines
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Wed, 18 Aug 2021 at 20:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since the prctl constants are supposed to be generic, supply
> any that are not provided by the host.
>
> Split out subroutines for PR_GET_FP_MODE, PR_SET_FP_MODE,
> PR_GET_VL, PR_SET_VL, PR_RESET_KEYS, PR_SET_TAGGED_ADDR_CTRL,
> PR_GET_TAGGED_ADDR_CTRL.  Return EINVAL for guests that do
> not support these options rather than pass them on to the host.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_syscall.h |  23 -
>  linux-user/mips/target_syscall.h    |   6 -
>  linux-user/mips64/target_syscall.h  |   6 -
>  linux-user/syscall.c                | 644 ++++++++++++++++------------

> +static abi_long do_prctl_get_fp_mode(CPUArchState *env)
> +{
> +#ifdef TARGET_MIPS
> +    abi_long ret = 0;
> +
> +    if (env->CP0_Status & (1 << CP0St_FR)) {
> +        ret |= PR_FP_MODE_FR;
> +    }
> +    if (env->CP0_Config5 & (1 << CP0C5_FRE)) {
> +        ret |= PR_FP_MODE_FRE;
> +    }
> +    return ret;
> +#else
> +    return -TARGET_EINVAL;
> +#endif
> +}

If we're going to refactor the prctl code, I think it would be
better to have architecture-specific prctl handling in
linux-user/$ARCH/prctl.c files rather than lots of target ifdefs
in syscall.c...

thanks
-- PMM

