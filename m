Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1A62FBA94
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:58:32 +0100 (CET)
Received: from localhost ([::1]:57190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sSl-00072h-52
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sQ3-00050A-9r
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:55:43 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:39387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sQ0-00079S-Ve
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:55:43 -0500
Received: by mail-ej1-x635.google.com with SMTP id g3so9505397ejb.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tt3XH6f4MnuP9eEV61mln9zUs5qNii2iermPxh2W/RE=;
 b=iBCyXBN6nM3obpohYmQEzWRZx1rfqy93ggNEd5qoNjnwVRscVXovt8lEG7/KAYXiWP
 FtRduBafkFbrtcBeoap79BGfOOCWrX/04+qTXymXtCrgnF6FdvUKR0f8m8d5LCDxdOox
 4Qa62rMdHP962u+XOA1Cg8UbHpxKUyPqW1FrATMzrc6dHhz8DWE94zc/CBliQnkIdw72
 LdS1pUbQo/+ZJWfcKoiRPAsOk8CDtBO5mHh8tOwipVaB07L4yywFNPov+Oj0eCp+3V5x
 TC9qnCrJlv85Bb/+EG/05j1VqaWAGcDAY1pocb0BlAQGiEx1q6LNWbCmT1YncoGIs/JN
 1MzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tt3XH6f4MnuP9eEV61mln9zUs5qNii2iermPxh2W/RE=;
 b=n9cQ/EO7gRN+fTLLDaibNzovlAOv+R8kDm+EtUcLYT8zf/egKGGCoJxNu91T8U7iLs
 Qb+TRwNn9cWWU93UrjzmlL1rFCko/zd/dVMemPchSxuRo5rMxCA3DSAFcvvKpYZmGoV1
 Rf19h8cA6uguwy2pRsZNxdFWdrFyHeawwHE8LjZOhKWZUd0SblTQr1YLnFy7rCCzh1Qy
 EXVGWT77hBi9QZefKSkhAhPJzV0EP0pbQv62Rvh9OXNHKjWpBesWVwfNTXEUOhlVv/4W
 YV+L39n9UddKhSLbwjR8jYdnnixjy1SM+HHQZ8Z8i1yJUeZOkvTBdhoLQ5Lz1fNYKLB2
 rxTg==
X-Gm-Message-State: AOAM533JAohg4drU649hcB4j55SXGECJAhgJAvHHnXWBLztqJpQZKelV
 wnlAwB18dFTlcRl65kYCco7YDoVC5Ygw4e6p9I70i+77nRE=
X-Google-Smtp-Source: ABdhPJy56xeSl3GLOKJ1v/AtkNVyG9qv2VkKlVPLPisUsirw+v9WriyvH/fg0wWcJ3m3dRGXT3eZ37I1CTsr/AR7Nw8=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr3316001ejd.250.1611068139260; 
 Tue, 19 Jan 2021 06:55:39 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-11-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 14:55:28 +0000
Message-ID: <CAFEAcA9_eEp=As+q5MYyxaDKbYZL82MDH7Fruw1kTBRDfXoeaA@mail.gmail.com>
Subject: Re: [PATCH v2 10/22] tcg/s390: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Fri, 15 Jan 2021 at 21:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390/tcg-target-con-str.h | 23 ++++++++++++++++++++
>  tcg/s390/tcg-target.h         |  1 +
>  tcg/s390/tcg-target.c.inc     | 40 -----------------------------------
>  3 files changed, 24 insertions(+), 40 deletions(-)
>  create mode 100644 tcg/s390/tcg-target-con-str.h
>
> diff --git a/tcg/s390/tcg-target-con-str.h b/tcg/s390/tcg-target-con-str.h
> new file mode 100644
> index 0000000000..f905b357c3
> --- /dev/null
> +++ b/tcg/s390/tcg-target-con-str.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Define S390 target-specific operand constraints.
> + * Copyright (c) 2021 Linaro
> + */
> +
> +/*
> + * Define constraint letters for register sets:
> + * REGS(letter, register_mask)
> + */
> +REGS('r', 0xffff)
> +REGS('L', 0xffff & ~((1 << TCG_REG_R2) | (1 << TCG_REG_R3) | (1 << TCG_REG_R4)))

I think this would be better using an ALL_GENERAL_REGS and
an ALL_QLDST_REGS the way you do for the other targets,
rather than hardcoding the 0xffff.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

