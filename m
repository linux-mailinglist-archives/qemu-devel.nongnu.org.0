Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447533001EF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:50:34 +0100 (CET)
Received: from localhost ([::1]:53428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2uxV-0006Zc-8E
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2uw2-0005Va-8W
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:49:02 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2uvy-0001eZ-28
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:49:01 -0500
Received: by mail-ej1-x636.google.com with SMTP id g12so7245247ejf.8
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 03:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=da1D08BSFwrFl+/DOs3EwV7BlyBgYJnhBZVQpyydfnM=;
 b=NzayhP2Eg4UbcmFqdM0X91zrHWKluhHq60VOZZ9SGFal3BvpQfOQl0Z2K14J0J18mb
 IbL7mXnAKz1VNaKcyAeeX59fJEK/fVxYEAr7hYL2nw774LK3IBpy3AzAtTDVisZMTpC4
 ApcsOVtfNAqVdj+3ko+NZn9yf+6JMELzJ6nYrwk6Ws7+WHC8zqYp2hsoja9au+/33fnE
 TUHgXkuQZ4uB0aQk6UjQzc4Up8oKsBc6kEiVp2hm5H6aff/xugDSSPhOwlPcy7XAKOzY
 YPJm0d5QH/ffsg3xKntFfr1eERK+Dtm+shLIRul/KQ3hXa9igXXu99aBm/J+pxoRpw18
 abYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=da1D08BSFwrFl+/DOs3EwV7BlyBgYJnhBZVQpyydfnM=;
 b=PMiBdT5pulbschIKQNasWFvfI+eZp58xs84d6Nqm0zWg7qtoZb+rTtnzFpPvACjWLV
 dH/7frMCu83hiIkBODlTNmuVXvPiGvjszHmzC6ZLvT6WnEt7Ygp4Y4hpm9/VBk7hf1aV
 Rvquxsk86JpTODRISD13N/uqd1kvdBa1trqePGlMO1e3RiArcg4HuqlCLZEfvab7t4V4
 B5RqpPpL9GTnHffy+qH7AhW00dBjf2j0FhFMjKD+NkJYeS+L3M3dtidonjcCgHL24lf9
 TerLtkcX12VJR9E66jYq3LtF51zvViG3Cd0HpEMCxnWgkXOz8lDRMJim7c3dA8wZjKjC
 QfZQ==
X-Gm-Message-State: AOAM532YCSU2WyUDWFY14lQuXLIQds4hiSSDGfio3bGSFf/VNd6TUd4M
 NvGVAr3/w1Yqcl9pMKL5DIYTmRujLzPV8JvxqNAT4Q==
X-Google-Smtp-Source: ABdhPJxiULPvML47o1sRLVoP/LFgvf+tWNywtJtJRj52EnolZwu19rvATvF37FywTCxugsHZSDqY1ygpGh7IYliDzh0=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr2754020ejc.482.1611316136532; 
 Fri, 22 Jan 2021 03:48:56 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-14-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 11:48:45 +0000
Message-ID: <CAFEAcA9Hh6hx2s1iYWatUYD2500PQcLxzOYMOiDL=7hF=va_aQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/21] linux-user/aarch64: Implement PR_MTE_TCF and
 PR_MTE_TAG
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These prctl fields are required for the function of MTE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_syscall.h |  9 ++++++
>  linux-user/syscall.c                | 44 +++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
>
> diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
> index 820601dfcc..76f6c3391d 100644
> --- a/linux-user/aarch64/target_syscall.h
> +++ b/linux-user/aarch64/target_syscall.h
> @@ -33,5 +33,14 @@ struct target_pt_regs {
>  #define TARGET_PR_SET_TAGGED_ADDR_CTRL 55
>  #define TARGET_PR_GET_TAGGED_ADDR_CTRL 56
>  # define TARGET_PR_TAGGED_ADDR_ENABLE  (1UL << 0)
> +/* MTE tag check fault modes */
> +# define TARGET_PR_MTE_TCF_SHIFT       1
> +# define TARGET_PR_MTE_TCF_NONE        (0UL << TARGET_PR_MTE_TCF_SHIFT)
> +# define TARGET_PR_MTE_TCF_SYNC        (1UL << TARGET_PR_MTE_TCF_SHIFT)
> +# define TARGET_PR_MTE_TCF_ASYNC       (2UL << TARGET_PR_MTE_TCF_SHIFT)
> +# define TARGET_PR_MTE_TCF_MASK        (3UL << TARGET_PR_MTE_TCF_SHIFT)
> +/* MTE tag inclusion mask */
> +# define TARGET_PR_MTE_TAG_SHIFT       3
> +# define TARGET_PR_MTE_TAG_MASK        (0xffffUL << TARGET_PR_MTE_TAG_SHIFT)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

