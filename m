Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECB73B738C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:56:09 +0200 (CEST)
Received: from localhost ([::1]:53782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEDe-0002eM-R4
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyEBS-0000Mo-Jf
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:53:50 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:33726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyEBQ-0004MX-Tj
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:53:50 -0400
Received: by mail-ej1-x62a.google.com with SMTP id bu12so36619588ejb.0
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 06:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2DrScNjcE4u9BJj6JHm/ZK3scJ/nq7wXncOQikRS5Hg=;
 b=zlL/hLkSHJzSLxMgLy9e7MlcVXGql98ot5MtxCgieyErkTFAk4QlM4cBSZ4GM9gEPp
 xfuIsLncab1e+NhFs4uPjd0r3PIY6eMxRGzyF5rKR47Z2xNxjrLnJXF9CRFQareeBU3q
 /Vid+AM6rnhvDHEb8U3KqkHY+LAbYdtdRic862neLhAiKxeUCK1OFR1LB3Z5fiY/F6s7
 8+EBzkxPF87//EkJt/mw23c1eUwaBEJ/AbYd+cof3HgsDgxtfodytYz4WlIstEZwahCS
 HQa5Doge1KVs1Ym5DsY6TceNaTEom2Hh0gDlNp6/TD/wMmJabYGSEDh29oRTcwmxXt9h
 16zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2DrScNjcE4u9BJj6JHm/ZK3scJ/nq7wXncOQikRS5Hg=;
 b=d1/TLyhDhjaZhZEkwt0n8ypYLl8EFFUrJGWzU37gn626pIXdMjYIC0O1kqlR1AMWrF
 fOdHc4d82525qENqpe2WYAitogVUkEjUUF5yl1jAYKby9I99h6UCvZguZRcxWfNJpqVS
 yGhe/zyjr4mJKZivl2pDmmN5tvcJhxunlK6gADkjrX1bLt67QK2sgiuPimrHIJZURsPU
 LloJuqb3vz34R3B6Kd/pipZEdJyjcIUO4VIVFhPF+BS0oSacGZTE7pv0TaMBS69Ja4X9
 RnZHcgly7pO4rmZbgicOxrWL+2KW9h63IEM3nHEUwE4J7b8sgnVsHq84AYxpiV4rgIdh
 +aIA==
X-Gm-Message-State: AOAM533BMQDfwBzPILnn7uj5KwW8Q9SsDGlWre8v2bubq4iIDeYm96Jy
 Yna7JuNYLQdpcIoODACYLUnVWG6f97+4OhndIhKoWg==
X-Google-Smtp-Source: ABdhPJwFrKQLDSkrvmupyliyhjYlXiGjJpVfFHeqm2zrP5npqMZx2JtcJnAuJfvxvUpVYn2vafYqRgFjk1UDA8/nmPU=
X-Received: by 2002:a17:907:a064:: with SMTP id
 ia4mr30421707ejc.482.1624974827397; 
 Tue, 29 Jun 2021 06:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-4-richard.henderson@linaro.org>
In-Reply-To: <20210618192951.125651-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 14:53:09 +0100
Message-ID: <CAFEAcA92sHgV1DSKv6XaSBcuyaSfOLhm4OyH5hNsTJTVCx+Tkw@mail.gmail.com>
Subject: Re: [PATCH v2 03/23] linux-user/arm: Split out v2_frame
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Jun 2021 at 20:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split out a helper function to test for a v2 signal frame.
>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/signal.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
> index 32b68ee302..cb65623965 100644
> --- a/linux-user/arm/signal.c
> +++ b/linux-user/arm/signal.c
> @@ -165,6 +165,11 @@ static inline int valid_user_regs(CPUARMState *regs)
>      return 1;
>  }
>
> +static bool v2_frame(void)
> +{
> +    return get_osversion() >= 0x020612;
> +}

Not sure how much we care about supporting claiming to be a 15-year-old
kernel any more (especially since we set UNAME_MINIMUM_RELEASE to 2.6.32...)
so it's awfully tempting to just blow away the v1 frame support instead...

Anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

