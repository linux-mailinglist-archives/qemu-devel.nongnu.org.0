Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8208209D2B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 12:57:00 +0200 (CEST)
Received: from localhost ([::1]:41524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joPYx-0005p9-8k
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 06:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joPXs-0005Fv-C9
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 06:55:52 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joPXq-00045K-PM
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 06:55:52 -0400
Received: by mail-ot1-x344.google.com with SMTP id n6so4864600otl.0
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 03:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q2M7GQPC2tQspLAFffQmoNlxDsOGbT5YJ7CLVCmMh0U=;
 b=hArdeGkloosVFvDlJRUPV5UQd1ms12Z1Z/HFYM5jFJt54Nvzmgu+0rMCKUmFyqSlX0
 zqYPmZyewUrWyBjBXvike4u1bjenov3xWbMckyGB6OHjRaAZw6tra+U1Zixu1yB7l6Ek
 NA/sqKdUpKoQSBHfYCKejigNFwWAjs0QfQmMsbNW8uuNwQLoIVMDEQz9iiZulFhPVHxq
 bhlNcp1Z5X/qOGLUGrmD3GyWzwe+io9+b94ZQAII3PWvq2g4jQAoIINQk0WH1eHLhYN7
 qWdHKAt/LvH3WXSaqfGd3rfab/ZM5FTTufK1sm4IZCr2LBV3db55lzWeq3W76/7fbkIq
 xS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q2M7GQPC2tQspLAFffQmoNlxDsOGbT5YJ7CLVCmMh0U=;
 b=qumy4dV7y8q/B/6O4N1Y62sCSu23wDAXw9kSXbkRG2sB/FmAFdpHVawv8+4uXfhPjH
 bxPTdZq8HEt8vJOMOBxMZYpuCY07mQATNpLvjqOSTZnAdlOcnYDnOSNza6WBNpbCgkKj
 5gFulNJxybYUMv+Dn9hYJi0LGlpFZ63lp/bFCvfHyJ3fJ26d9jwhzZOtDagBaa5+sVjg
 KJQdo0XsY6UbsEOFlROeBMmhEsJ47A/QsdF2SORrzPEGdBduKShj9w9MOFUVCn9rzi4G
 GfGgs+S7GU+a1iQ6CNXMhBEBoAumQ7q1Vhg8SVHH8AlsETJc2WCSvce7+C1YVYbwL0Vs
 NFuw==
X-Gm-Message-State: AOAM531jEyKIe9wdWfmSvTTNjgtCgYFOH4ZBqBHo0QfLtgMNw8NwwebH
 f8PmXoEn/hqojVLr0c46Mh8yRLVuGykf5cTCx6/YSg==
X-Google-Smtp-Source: ABdhPJybLWf/akeHNMwA9GV3iKSwZp1qa4nW0/AgFOwDhnsSM3Ormqawu+qj/hhmK8fJSapuOtDirwphvP2XRsz8H6M=
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr26091000oto.91.1593082549370; 
 Thu, 25 Jun 2020 03:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-26-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 11:55:38 +0100
Message-ID: <CAFEAcA_Hp2MfmTJY0qVZHVGkppzCaD_ZF8TvCMDVJn_XLYQ-+Q@mail.gmail.com>
Subject: Re: [PATCH v8 25/45] target/arm: Implement helper_mte_check1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fill out the stub that was added earlier.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v8: Remove ra argument to mte_probe1 (pmm).
> ---
>  target/arm/internals.h  |  48 +++++++++++++++
>  target/arm/mte_helper.c | 132 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 179 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

