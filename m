Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FEF3BBE29
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 16:22:38 +0200 (CEST)
Received: from localhost ([::1]:53092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0PUa-0007PE-9D
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 10:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0PTB-0006Vm-TN
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:21:09 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:47052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0PT9-0008Bk-4s
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:21:09 -0400
Received: by mail-ej1-x630.google.com with SMTP id c17so29216748ejk.13
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 07:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqPPPRrNU+LZFx5KUP6Cp8OQnYnfHIbr6N5ctiMheR4=;
 b=gS6o6OLIE94tps/3aCFv0ZycdjytWkkaaTKxO2rcMmphyv1T/UR+Zn5K+x5Sp0pVS5
 MlS3QGI3CJYgAo+FQKphw8PbwKxlZvYgvSn0uFwtJnbfDFgeh6KWkH8sMWjUhobj5MJO
 XvxEN9FyIBe0XZJp62eShUTSGSiLE4vRmuEYu9LX+5wpQ0nPLjuiSY882OhftcKjGohZ
 iFQPYazgvS6eNhVDg4fTiXn08bR5BGVpU9XxuJ/POnm8jOq94mYvqMTBNlfaRMoR7/8E
 vzW21QaGpWZqpzL/oRCVMo/rSLRCmaSR8Z6+MSgrFkNWdBozBbX/pkJ00m0sJZt14boo
 EWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqPPPRrNU+LZFx5KUP6Cp8OQnYnfHIbr6N5ctiMheR4=;
 b=RxIMo6GUDOHoXeR6MXyF3AgItRqcdFp6EK//NeIHYjF30CvFG+kLBNmwKQjvhZUaNc
 /TKOVwbCYg+rvPA/nTNnjLh+Q5sG1cgWNr1pd4hWR/METVEDJsmhFmpyxSzN+UYruIjj
 JC4gQ4Te/cbkGuSKrCY5GvAmYe4mQhZ5WZgQGLfi5dTi/yMvcTVOW9TpObyx7evXLF38
 ExaoWwzpb6yP9Fg7yNE94/93II7mqKK9H/b+ME4i1rJ3c5cGNEXEVlXPDwQvzLQFIVCo
 WtcaXUdr04D7ml00B5WLMaBbLBjI++KGESUT8Hc33qH8wCzFZ3AOjV3lboJeEfcCl2+N
 omYw==
X-Gm-Message-State: AOAM533LAKZtQeH/xhBm2woJEKsBKJFjNNgFY6SmHWhtCBOQ4kmfPXee
 BVFp/4E44qD8aVeX996tRn3x0OIAzsqtJKPsPSGQKQ==
X-Google-Smtp-Source: ABdhPJx+5HAj+nHaAmm73gxane5CP1659wG7zWkOZqgKLPoo1qWQRZBGkk6SLHSja72a7VUjLYCtGz9mN+Y2tIISjlA=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr13506362ejy.407.1625494865407; 
 Mon, 05 Jul 2021 07:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-6-shashi.mallela@linaro.org>
In-Reply-To: <20210630153156.9421-6-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 15:20:27 +0100
Message-ID: <CAFEAcA_Rn25iBodv+XOgSa-BUjxRHK8uCx82pkS4ZPNcO5NaQA@mail.gmail.com>
Subject: Re: [PATCH v5 05/10] hw/intc: GICv3 ITS Feature enablement
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added properties to enable ITS feature and define qemu system
> address space memory in gicv3 common,setup distributor and
> redistributor registers to indicate LPI support.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
>

> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index f7675a5adc..43ce4a8a95 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -68,6 +68,9 @@
>  #define GICD_CTLR_E1NWF             (1U << 7)
>  #define GICD_CTLR_RWP               (1U << 31)
>
> +#define GICD_TYPER_LPIS_OFFSET         17

This should be named GICD_TYPER_LPIS_SHIFT, in the usual naming convention.

> +#define GICD_TYPER_IDBITS_OFFSET       19
> +#define GICD_TYPER_IDBITS_MASK       0x1f

You never use these, so don't define them.

>  /* 16 bits EventId */
>  #define GICD_TYPER_IDBITS            0xf
>
> @@ -123,6 +126,9 @@
>  #define GICR_TYPER_COMMONLPIAFF      (0x3 << 24)
>  #define GICR_TYPER_AFFINITYVALUE     (0xFFFFFFFFULL << 32)
>
> +#define GICR_WAKER_ProcessorSleep    (1U << 1)
> +#define GICR_WAKER_ChildrenAsleep    (1U << 2)
> +
>  FIELD(GICR_PROPBASER, IDBITS, 0, 5)
>  FIELD(GICR_PROPBASER, INNERCACHE, 7, 3)
>  FIELD(GICR_PROPBASER, SHAREABILITY, 10, 2)
> @@ -137,9 +143,6 @@ FIELD(GICR_PENDBASER, PHYADDR, 16, 36)
>  FIELD(GICR_PENDBASER, OUTERCACHE, 56, 3)
>  FIELD(GICR_PENDBASER, PTZ, 62, 1)
>
> -#define GICR_WAKER_ProcessorSleep    (1U << 1)
> -#define GICR_WAKER_ChildrenAsleep    (1U << 2)
> -

Why move these defines?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

