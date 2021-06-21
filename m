Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A283AEBBE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:50:23 +0200 (CEST)
Received: from localhost ([::1]:51004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLFn-0004rZ-0y
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLE3-0002vH-Q8
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:48:35 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:37576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLE1-00064q-4T
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:48:35 -0400
Received: by mail-ed1-x52b.google.com with SMTP id i24so8642356edx.4
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 07:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tF2nCDyZNb8iDyKchdOL/HnOEHyA1WjytSr0AyzcKgw=;
 b=YKdxWxF4jaK01pMNF/YX8uOg4IKmyQVtL1tdd/X/XXuPlmQN0F4hl7Kk5mBwFBHY0c
 4F869haWU+qVTwkr30RKImaaETEqP/DwFZYJgkbSxNMAh+0uqw/UYJf5Y8mb0QAafB7f
 nu3iel3H9UgPdh34eWZ/NnQEkTUqUAyLI0a9gj5S4e+AuVeSBcTQi59zQ2+sgB9MiMmu
 R6mEaPd9hkF8OmsLWgivAQD27Nkyf6oMN2fABppUVeZ/8ZAa8j6yjApXqDTMTiSkX66T
 eJIoHgoJ3QXzINB2+WDe6RztCIZzx5dIUoLYH9+HuyCOhk3VzPNmSNhUc7k2/v217y8k
 SvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tF2nCDyZNb8iDyKchdOL/HnOEHyA1WjytSr0AyzcKgw=;
 b=L3bw/epBJqROy58fr2KCi/VM1IU05aB5iFUW4NdMMwxH8XM9BVmdt2Hzcbwio77qc5
 HhOAjHi5/fvH73ZkS7MqhazmbykGINAlCjdyrKCVIHk4m3zswZ9qqakUd69ULQJw2TJ3
 TRtAQLYRyXKZwKJ6bMn/YdUgwpN48u/3z4JEdq71DfgQSHjV4HUzbhgyvrc6IKOI0h04
 nMP5musOyFWJqdeuB8Cu2EQMIqxRrhA2+9zPeBanf22uU7Ah4EicvkXFPq+tJG+T/eJn
 U96vM6FknPmjQPevtljThsDbi03TlR7AmSc1wSZvZjrHZPNrcNyk5hS03vMVQ1PLkHkz
 ivfw==
X-Gm-Message-State: AOAM532Qgx/sCroCtFKyrl/FgqEEDkSzNNzPytEbQkYcPf8UvGC/T25O
 b7HexPGt7+TpUyviYynQEkzrt+5RNU3Bu90e97ZrtA==
X-Google-Smtp-Source: ABdhPJwusscQvze6nos1u5zQwXsoJ4TGLEhTVLO797DvtpR/rDfmtOhnVWMi8vHzilqvDA7GFcQO/Kr3StiE72or2aE=
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr1485073edz.44.1624286911520; 
 Mon, 21 Jun 2021 07:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-17-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 15:47:55 +0100
Message-ID: <CAFEAcA-hr1E1kEA80DvgRmMmVAvYt=wSQWJTU=Ki8nGtt5U-OA@mail.gmail.com>
Subject: Re: [PATCH 16/28] tcg: Handle new bswap flags during optimize
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Mon, 14 Jun 2021 at 09:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Notice when the input is known to be zero-extended and force
> the TCG_BSWAP_IZ flag on.  Honor the TCG_BSWAP_OS bit during
> constant folding.  Propagate the input to the output mask.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 56 +++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 51 insertions(+), 5 deletions(-)

Not really familiar with the TCG optimizer internals, so review
from somebody who is would be useful, but this looks plausible:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

