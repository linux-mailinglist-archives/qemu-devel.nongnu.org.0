Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DAC3FAB8E
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 15:06:17 +0200 (CEST)
Received: from localhost ([::1]:48408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKKVs-0001e5-Bt
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 09:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKKSB-0007Ge-Qu
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 09:02:30 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:41765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKKSA-0006vM-12
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 09:02:27 -0400
Received: by mail-ej1-x62d.google.com with SMTP id t19so24812225ejr.8
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 06:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AjVl8XAj70+R9Aw+yBwPra+vDJ0aMaF5Sz2ENIcBVCI=;
 b=cuU2lTqJGvmSIGObR2X4V97PniaKA1/D9TrF5asoRIFIhV0al5mekl8d5Pm0mIlvNE
 nqyZPhzYgmpbrLDyxr7hiF6uTilvqD5AuN74CvF9j41ol1VROI7560Bgtdvw9wQjhXLu
 Q+CthraS+jvha4sigIuwAb76w+YuUSIMNOTDgAjrmpz76VbCx3tCHIU0zgtF+o9HvKda
 WxG0uWqiAOHxq1ODJ8oT3swSTjmzSqPZYTqmexQV+iL2jVFqCuFxJNPW7ESvqu/5/hsS
 OewGRm26/caB6i75yslLATjk1IO1dQtzNomWzqmLeIHQ+WCDFkcLdNj/DkRtkawxH8ED
 yEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AjVl8XAj70+R9Aw+yBwPra+vDJ0aMaF5Sz2ENIcBVCI=;
 b=siParpPX+fXgAP9Ssp2lJwpK5ZAGUnpnx37vMLV1FR0O1sSQKWF6hm84SuqHPl2NJZ
 Fb3++41/LuvFl7k6sYoBtuXKRhhQyseReaMToXLphZmVm2TPfa+Fx+kWqV/Mi4t2nIqj
 icuwZz2aeqVcpD3fLLLEvDZL53a/+jLFpiC36HAkzupdq7YLKUlIX2NdymdK772qdq/S
 hYqfKsU2yjSZGSn1baWBd8gx7Yst+5SEogkPslFxvjhEo7aLI4J1F+ylcnAKTRMkOxO4
 McQev0VNfvXb7I4VD5jtaL4OAtes5lSo1X/1U5rkhP+W/pl+SkbPmGHAPSgjAorLvMoD
 jhOw==
X-Gm-Message-State: AOAM530SO2xcLKOoQPGqHct6tjXQ35dU9DOfn/lOKQn2/ivRC+6FN2m3
 lYa8YLe7buX3L8C8qSAvxpPF8VMXCQmRf28Kpes2sA==
X-Google-Smtp-Source: ABdhPJzz5OHgRxv/0T4ug/Z639Rq3N/lsDduNptAjFMIY3fdEKruF22NlPMwkjAVuYLXerB9sbNd2wItAK0sFBL4860=
X-Received: by 2002:a17:907:75d9:: with SMTP id
 jl25mr19955176ejc.4.1630242144167; 
 Sun, 29 Aug 2021 06:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210829100103.1950-1-mark.cave-ayland@ilande.co.uk>
 <20210829100103.1950-4-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210829100103.1950-4-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 29 Aug 2021 14:01:36 +0100
Message-ID: <CAFEAcA8+qX5dYSX3viMm5ZFpPYLZirYDJmebfYQixKopwvQ5Vw@mail.gmail.com>
Subject: Re: [PATCH 3/3] escc: fix STATUS_SYNC bit in R_STATUS register
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 29 Aug 2021 at 11:04, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> After an SDLC "Enter hunt" command has been sent the STATUS_SYNC bit should remain
> high until the flag byte has been detected. Whilst the ESCC device doesn't yet
> implement SDLC mode, without this change the active low STATUS_SYNC is constantly
> asserted causing the MacOS OpenTransport extension to hang on startup as it thinks
> it is constantly receiving LocalTalk responses during its initial negotiation
> phase.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/char/escc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/escc.c b/hw/char/escc.c
> index 0f6957ba8b..eba6b45baa 100644
> --- a/hw/char/escc.c
> +++ b/hw/char/escc.c
> @@ -92,6 +92,7 @@
>  #define W_IVEC    2
>  #define W_RXCTRL  3
>  #define RXCTRL_RXEN    0x01
> +#define RXCTRL_HUNT    0x10
>  #define W_TXCTRL1 4
>  #define TXCTRL1_PAREN  0x01
>  #define TXCTRL1_PAREV  0x02
> @@ -508,7 +509,13 @@ static void escc_mem_write(void *opaque, hwaddr addr,
>                  break;
>              }
>              break;
> -        case W_INTR ... W_RXCTRL:
> +        case W_RXCTRL:
> +            s->wregs[s->reg] = val;
> +            if (val & RXCTRL_HUNT) {
> +                s->rregs[R_STATUS] |= STATUS_SYNC;
> +            }
> +            break;
> +        case W_INTR ... W_IVEC:
>          case W_SYNC1 ... W_TXBUF:
>          case W_MISC1 ... W_CLOCK:
>          case W_MISC2 ... W_EXTINT:

If I read the manual correctly I think strictly speaking if this
is a 0->1 transition for the SYNC bit it is supposed to generate
an interrupt. But I guess since we don't implement any of this
stuff we can ignore that...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

