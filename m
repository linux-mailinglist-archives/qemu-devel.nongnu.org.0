Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA523141CE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:31:32 +0100 (CET)
Received: from localhost ([::1]:60614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9E81-0004tR-UU
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9A7M-0005dp-Fy
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:14:32 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99sf-0001mm-Sp
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:59:24 -0500
Received: by mail-ej1-x62b.google.com with SMTP id hs11so26069266ejc.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 08:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7lrcl0AGTHCZpOqWVGnqUjlPHsFDdL9A6NivSCkJQ5o=;
 b=xlPnt9T6YXChNdFuhdi6LWM6RsfHp2EhmFIUazAj4avI5tjbj7Oz3VMmrThLFxxXUc
 bO5GKmIE+JMcBYjyLoanSKKnaY8ql8lKgjoU8oZga3ZxtFbK3VbzCkM+FYaqtcKxurrN
 9B5F2+ggjAaIW3uGWYkLmt0XadxGq7OINvmX4L+kmjzEyPeIv+5AngyXBn7Ba5a9E8a8
 bc07lnqBKINgA0ahGnQ30J+8SUXujKpdgYR1TIa9pyqdDh/kpZKp+MG4fNzO3l06kWgg
 97AsP5DlmGzSehEjklhnV5a1FIv7XOmtbLUyLxIBcsKeFtFJdqQl34DTI17jFvfkoRCC
 Kv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7lrcl0AGTHCZpOqWVGnqUjlPHsFDdL9A6NivSCkJQ5o=;
 b=iAwId7sNYnRdWykIm3WuJnFNdzHPDZLjFHQedH/WX2uOTxIBLw2ezx0lQIQxXi7BwV
 g1w68rjiBKoMDHm/iBGhgA77JWAbvp3LerDL0VxGa9gioj+1Dy4efPqu2XcjTS4tg53h
 uSCV3HtFE0ZsMCzu7GbAYfqCJP05yfVOUxIhMOSD1mDCOQs+QUqwubhVrxzshO86ZOSe
 TGzTqTO4BOG9o46UmdCJnj/0GyVRfvg987eqSZbAL2MELJpwOJZqGsxQSwLeHo9jBQ0W
 9Vy1lGkqbXDguwQFkbGqjcfpJrPqBu6o73qEJznJUUPE16nOXxoz2aY4vlgKAu3VEazP
 Km5w==
X-Gm-Message-State: AOAM532mbGE+1Pupj/WxbgyNF40bLH0GsYM3vb96cpPrfFAg8Km7lJzz
 +zup3uWhdTshkTY2bFilQWLCwRZ4C4lJoFBEa/V/Fg==
X-Google-Smtp-Source: ABdhPJxnIe3wQ+VQIeU7qJ6faqOAv4pqI8BktNOe8I1JRvbhW7MwO5Q2R8tch565B4pQYMCvfxBjkGBfKwIxwA3PTiQ=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr18434619ejd.250.1612803557895; 
 Mon, 08 Feb 2021 08:59:17 -0800 (PST)
MIME-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
 <20210129005845.416272-7-wuhaotsh@google.com>
In-Reply-To: <20210129005845.416272-7-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 16:59:06 +0000
Message-ID: <CAFEAcA-8q2DZpdbeiMhrxtAMkzx1_1BqcGTk8HfxX_6F_FOUfQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 01:04, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch implements the FIFO mode of the SMBus module. In FIFO, the
> user transmits or receives at most 16 bytes at a time. The FIFO mode
> allows the module to transmit large amount of data faster than single
> byte mode.
>
> Reviewed-by: Doug Evans<dje@google.com>
> Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Corey Minyard <cminyard@mvista.com>
> Ack-by: Corey Minyard <cminyard@mvista.com>
> ---
>  hw/i2c/npcm7xx_smbus.c           | 342 +++++++++++++++++++++++++++++--
>  hw/i2c/trace-events              |   1 +
>  include/hw/i2c/npcm7xx_smbus.h   |  25 +++
>  tests/qtest/npcm7xx_smbus-test.c | 149 +++++++++++++-
>  4 files changed, 501 insertions(+), 16 deletions(-)
>
> diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
> index c72b6e446f..be3253d251 100644
> --- a/hw/i2c/npcm7xx_smbus.c
> +++ b/hw/i2c/npcm7xx_smbus.c
> @@ -27,7 +27,7 @@
>  #include "trace.h"
>
>  #define NPCM7XX_SMBUS_VERSION 1
> -#define NPCM7XX_SMBUS_FIFO_EN 0
> +#define NPCM7XX_SMBUS_FIFO_EN 1

Why has this define changed ?

>  #define NPCM7XX_SMBUS_ENABLED(s)    ((s)->ctl2 & NPCM7XX_SMBCTL2_ENABLE)
> +#define NPCM7XX_SMBUS_FIFO_ENABLED(s) (NPCM7XX_SMBUS_FIFO_EN && \
> +        (s)->fif_ctl & NPCM7XX_SMBFIF_CTL_FIFO_EN)

...and why are we testing something that's always 1 ?
Is NPCM7XX_SMBUS_FIFO_EN supposed to be a debug "turn this feature off"
switch for QEMU developers? If, so it would be helpful to give it a name
that doesn't look like it's defining a bit value for the hardware
and adding a comment saying what it does.

> @@ -754,6 +1059,17 @@ static const VMStateDescription vmstate_npcm7xx_smbus = {
>          VMSTATE_UINT8_ARRAY(addr, NPCM7xxSMBusState, NPCM7XX_SMBUS_NR_ADDRS),
>          VMSTATE_UINT8(scllt, NPCM7xxSMBusState),
>          VMSTATE_UINT8(sclht, NPCM7xxSMBusState),
> +        VMSTATE_UINT8(fif_ctl, NPCM7xxSMBusState),
> +        VMSTATE_UINT8(fif_cts, NPCM7xxSMBusState),
> +        VMSTATE_UINT8(fair_per, NPCM7xxSMBusState),
> +        VMSTATE_UINT8(txf_ctl, NPCM7xxSMBusState),
> +        VMSTATE_UINT8(t_out, NPCM7xxSMBusState),
> +        VMSTATE_UINT8(txf_sts, NPCM7xxSMBusState),
> +        VMSTATE_UINT8(rxf_sts, NPCM7xxSMBusState),
> +        VMSTATE_UINT8(rxf_ctl, NPCM7xxSMBusState),
> +        VMSTATE_UINT8_ARRAY(rx_fifo, NPCM7xxSMBusState,
> +                            NPCM7XX_SMBUS_FIFO_SIZE),
> +        VMSTATE_UINT8(rx_cur, NPCM7xxSMBusState),
>          VMSTATE_END_OF_LIST(),
>      },
>  };

It's OK to add fields to the vmstate without bumping the version
number in this special case, because we only just added the device
a few commits earlier in the series, but it's worth specifically
saying that in the commit message.

thanks
-- PMM

