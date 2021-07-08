Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB07E3BFA57
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:36:21 +0200 (CEST)
Received: from localhost ([::1]:56154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1TGO-0004SX-N4
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1T9Z-0002IT-Cr
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:29:17 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1T9X-0000Wx-QX
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:29:17 -0400
Received: by mail-ej1-x62a.google.com with SMTP id o5so9323514ejy.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m1YrIuZsZ3crQFkJoALY6+/liuvPQwR+RUCyUwWRNyU=;
 b=ZKYJIaQ6H+G8Ey8dLY/cD3Lp4aTKLI781QVamcxOjDKSb7EtRjXI/+wHMcmIRHHarV
 P8lLP7rfFIit3GhGt/dxU1cCib55Nqrow0IrHP/mqtXlu+bF9tDGyRKZ1ipcnTRKOSat
 NJKoqivRRvkrFPvPCEmt7KazUOEo9n9JJBWkbU/SO9aNLK+fEnoOuNtLPXenVasYXDAp
 nmI26cSfOzS4u4aA+QlRpaNVtvhKvCk+kZf9TiXgvFiPA9y6c3JX2G+sgmAnesUcgcpa
 6OuBSbEvm5Lus5cheBe1nzxRnnwIdvbRMY1nVjoptFdGY84PU37z2jP27uw81Jz2Ynm2
 ONLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m1YrIuZsZ3crQFkJoALY6+/liuvPQwR+RUCyUwWRNyU=;
 b=f5lpslO+sIawAsX8pRjfM5Uw2bUnJectFEZDhuiYyCQ/J2he869PqI/FpmRUTlb8jc
 DGt6jFdCCUDDqHS7Ubu6orW2+xTMXP6Tq01xsT0X1Mwlbab0ovxz0z2FzgwdXxV6Kso9
 vDr7AnjBYafIMjXEzDXOaA+sA8jUNjadsvrwmUS5pTSBu8qfzjac/JPy4kKm959gsWEq
 PWKhOehBhQflp5lSk1MLu6DjcFY8K0SMobv9OhmGLrQIu+2Fe4jLXJi/YbNhVs7SDnbr
 cBNIfxTB3vhpu0bV1xo9TYEAIPXEmSiu3UAI9YaPROrdYUjcfLTSFWuPjNDh4/Z/MzN9
 f8aA==
X-Gm-Message-State: AOAM530rPDBJPTIvwHf62DlVZIsguqcfSDKREdjwFQmQ+EYy40vrMVrQ
 X3Q3fMyRjttHX8ktey5leIHcGXRyQ0suBj1RP0idQA==
X-Google-Smtp-Source: ABdhPJxBBgniTxifmcMVj6n4gBpyfeM1Y+m22icITkT5mZDqL1SDyQ7BaY+IiB5YY19YuBYt13mJeqhosxPHIFd5gYI=
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr13014511ejx.85.1625747354456; 
 Thu, 08 Jul 2021 05:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-9-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:28:35 +0100
Message-ID: <CAFEAcA9L0XJdfUAESPTv4Wz-WRfT9jt1QZbeFZpJw3cXCOq1kg@mail.gmail.com>
Subject: Re: [PATCH v2 08/28] target/avr: Use translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Michael Rolnik <mrolnik@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 19:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Single stepping is not the only reason not to use goto_tb.
> If goto_tb is disallowed, and single-stepping is not enabled,
> then use tcg_gen_lookup_and_goto_tb to indirectly chain.
>
> Cc: Michael Rolnik <mrolnik@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

