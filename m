Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6AB3F1AE9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:50:20 +0200 (CEST)
Received: from localhost ([::1]:34846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGiR2-0005hb-0T
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiPu-0004oF-Jj
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:49:12 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiPs-0003XG-7i
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:49:10 -0400
Received: by mail-ed1-x529.google.com with SMTP id v2so8955052edq.10
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 06:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dMZLYIOfpnKXXXNu876DaFZq6/F+WJ79ngg4WXo5gsw=;
 b=CSVuo4A7GU4n5I8gHHaFYibOt9JbsR65IBBFNlsWC4p+vONjkOd/uM7mD1XuAVWIS7
 HiE40/ToaUghjIZF06e5RaSes/m/RwunVfhyiJg+Hu4uMk+QRHGZDfVAPUr/66tq/MIY
 JYxJcF1/5mtGUIvb8UU+0SQiIHqwDUN2ltq5WwwQrCOt9C8yuTBXTFapFEmpn3Pp7kqC
 O2ypLMIBsImIWNtyV6IM/VBuCjZSjnMvf6Oh6aT6K98bOnA7dHgn6yD9oHPC53YBSZQN
 ORX9H3uXtNN7IYdyEjdDR2nvz14fDWCIdI7hAyBjBXhHrZ+CkbyicgoYUoHNtYQl9ezQ
 9jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dMZLYIOfpnKXXXNu876DaFZq6/F+WJ79ngg4WXo5gsw=;
 b=HcjRu66sLSbZCM/K+8Fw0ghAakz/t2bC6M7wySHn8pGnY+s/FfIDIFty37hpqP6JGZ
 dr3ONowTJatIaCoIwKXyBvyz5K5bTFpZguRqYC/UsJEPw/1j+bXI0doeqZemho+1WSO7
 9fbhQoUYJSRfPNyWpWs0FF/5pd6NnG38HkxCV6Sd+MRQFzA4Gpq03Usfur1ZgrmoOWbJ
 +cDl4X7VvNlPl9Ol8tpZQInYFMgGZDGeXTfacWdLP5ZFlzxy3A5pDFr4fCke0/ba/leN
 V1RMbcuL+ePcRVuJJJ/n964T6cUL9P+uk7rfe//mqXbR3+4BGvh5egY3gLJAmJ3T6OlQ
 X6/A==
X-Gm-Message-State: AOAM530LQL4Xgx/HnBdsOgznJYA6AQmF9I9nnyL8eFEao2eJnWXCa+BU
 Mb3drmUT/b71EpyAGWbQ08n8FkDQLVLJVJnCMI/mtw==
X-Google-Smtp-Source: ABdhPJzij5sJasaawMXv2Tny/FIx12Kq+PXdjeNGyLp9Y00W8WgVWRTle3gpg0a4XcSVixakvxYJyvSvo6gMZ7w2skQ=
X-Received: by 2002:aa7:c0c6:: with SMTP id j6mr5217640edp.146.1629380942565; 
 Thu, 19 Aug 2021 06:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-5-richard.henderson@linaro.org>
In-Reply-To: <20210818010041.337010-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:48:16 +0100
Message-ID: <CAFEAcA_fSTRTxDaU21HySQk7MoQjKZTRdE=Sqg6KZb86FQf2=Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] target/arm: Suppress bp for exceptions with more
 priority
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Wed, 18 Aug 2021 at 02:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Both single-step and pc alignment faults have priority over
> breakpoint exceptions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/debug_helper.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> +
> +    /*
> +     * PC alignment faults have priority over breakpoint exceptions.
> +     */
> +    pc = is_a64(env) ? env->pc : env->regs[15];
> +    if ((is_a64(env) || !env->thumb) && (pc & 3) != 0) {
> +        return false;
> +    }

Other than the obvious adjustment if we need to handle
env->thumb && (pc & 1)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

