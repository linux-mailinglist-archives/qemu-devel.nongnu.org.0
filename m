Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002C0370F21
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 22:50:02 +0200 (CEST)
Received: from localhost ([::1]:40032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldJ2Q-00047J-25
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 16:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldJ0g-000338-KH
 for qemu-devel@nongnu.org; Sun, 02 May 2021 16:48:14 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldJ0d-0000X6-UD
 for qemu-devel@nongnu.org; Sun, 02 May 2021 16:48:14 -0400
Received: by mail-ej1-x632.google.com with SMTP id t4so4985612ejo.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 13:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8Y2JInxxq3BF5yZ61pBjPVFMuDnWB1KwokFQSejViw4=;
 b=EAaM3Ppdu6SALKim2CFiVla5hUHBi1M1QOrbCU2FwkjHHrpiabtisoHM5gjGEmxdgK
 39Ppp8/AiYBtEewOeHuHG5gad4S7j346UYJEK1V3sJHvSDkY3z28blplynS11+sAtGqC
 7sbHyOm0ulVd+bOV8Wuga47B3vSWrBySdtPiBOyUj6VfdPky3QLzjFBQ6GSldBhtbtrE
 +//eJkDN9IjrwByib72/+vr+dQxJQj7j9/mnP+HoM8ypF2t9joZqqO+GIAX8ju0fnS8y
 y3bItbUTgDMZlHiQ61oJtdo1RLkMZ49TX9rMZO/PH+7aeUwPfN/vEPsA1KNVjSj49z/k
 o0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8Y2JInxxq3BF5yZ61pBjPVFMuDnWB1KwokFQSejViw4=;
 b=PZW/ImbA1A4qzaCOomLNka77NbybCYxZo4bKecwfqywZ/zc29mTcwEAkmRo19NYc9/
 gOz4gmkDUfZBxsMyb6B/QxFENFUcZPh6Uv1VMjo46qfS7OJgQJ7gX/1D1B2qKrvfcnfW
 Td0VvWXvPljj93rQhOQWmUcCzYq3WCvEUkzDHctZZOhKL3E9K1sgYcenyZsx9S2m8u38
 8Yhz3kXv9C4lDTSok2ZnWvrS5zVctzengA1fgTQyp4+NCtPeFOEGw9pUfZdqhyl7Y7Jz
 hirOqZLvM5WqjqJT+jt4gzs1eQvYaQENvMFLEpphw8AKnTNgtySs94/vc62q7A4TOfTK
 tbrQ==
X-Gm-Message-State: AOAM531kOGHHerzBrEa8FwzyEf41v4GVTxglk3HDmgBOl0u2lHfgbx72
 PwEqTdHLv8fzIiz5/9xXBVbXBh444z5sHUhgSccO9g==
X-Google-Smtp-Source: ABdhPJzfROMnffJOlQhJqaohct7XpE6+l0wVyZ/3AIiItLdwmzc00IACeSx1crE+V19L4ivWhXHCP/1efnxWS55F1w0=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr13510415ejh.4.1619988490527; 
 Sun, 02 May 2021 13:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210502203121.630944-1-f4bug@amsat.org>
 <20210502203121.630944-4-f4bug@amsat.org>
In-Reply-To: <20210502203121.630944-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 2 May 2021 21:47:06 +0100
Message-ID: <CAFEAcA-4i3mu2=n=kiJqixPQLcinJ3uYv7_3e10PEH+Q8vLXXg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/arm/armsse: Manually reset the OR_IRQ devices
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc <qemu-ppc@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 2 May 2021 at 21:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The OR_IRQ device is bus-less, thus isn't reset automatically.
> Manually reset the OR IRQs in the armsse_reset() handler.
>
> Fixes: bb75e16d5e6 ("hw/arm/iotkit: Wire up MPC interrupt lines")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/armsse.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index 2e5d0679e7b..a5f8e89950e 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -1668,6 +1668,10 @@ static void armsse_reset(DeviceState *dev)
>      ARMSSE *s =3D ARM_SSE(dev);
>
>      s->nsccfg =3D 0;
> +
> +    device_cold_reset(DEVICE(&s->mpc_irq_orgate));
> +    device_cold_reset(DEVICE(&s->ppc_irq_orgate));
> +    device_cold_reset(DEVICE(&s->sec_resp_splitter));
>  }

I guess we should put in this temporary fix pending figuring out
the better more systematic one.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

