Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381C22EF417
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 15:42:56 +0100 (CET)
Received: from localhost ([::1]:34984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxsyc-000618-Os
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 09:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxswT-0005BU-AI
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 09:40:41 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxswN-0008V1-Fp
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 09:40:41 -0500
Received: by mail-ed1-x533.google.com with SMTP id v26so2454823eds.13
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 06:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0LN0oJ+aDXDrxZB9Pk6yCOmV3Ijg+90M2UtZfIHI3O4=;
 b=VXu/8weXQ0FxTvNjve83Qdip8M722NsQYnoU7s5oqQ29iH9FwdSRFw1eZAAJoQIfs7
 JlOYLN7EroM7t2PatILsH2Dnt2hEcUS3DwM2DaDxpaQczeRysMYDRwh2qri3YUHU9iV0
 kKgaTDBE1D6ES/jLPmQ2CYBAieNo2qXBSV2VANNcF98c8HwUskr5R9/31/8QJicDuAPo
 pGDe23KL+l7C0drQJQsIuJ53JGRghi8bjblk59X7deU9U839M0KvXMmVsBTH56ztw+Z7
 CllISCHhkjMsrnDs+3fBJ0dY90CwDqAboOApaXFN4/qsD4lLciQsQh3v92j+VfAQOHb8
 UFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0LN0oJ+aDXDrxZB9Pk6yCOmV3Ijg+90M2UtZfIHI3O4=;
 b=iEOd+n/p39pbUhuF73DzUKFkZzNWT4mhryZQcxp2/c1rF3b3LDPVC131rzJROYL5iz
 PGMS6iNc8pkCICWnZZV0aVxnHy5SX4giZSKZAVzS5+BJU5NxcXVwxgPg0+Cer04cyELK
 r17BcbKXjrasoYihLnB1ctiw22cSJdHQY86Vt3nq+7/ofMPnMgFYv5AodeJPbTfETvZ3
 CkSK7bryOfeXXvjf87G/RGNr/rmR9AYIrt8YOpuL8uc2WbZiIBuwldBZBETCMkDn3HmR
 3qOYpMItQK32pU9T2pZyLmTnBxiXNOSJyBmhfm/MhCulQTymNIl6w3rq9vRRG5QZ4FAC
 YvCQ==
X-Gm-Message-State: AOAM5319J3oEgdTZoTCvzeamjHyfBzw2WwBzdfPoEjGLP3TzEvkj8+yn
 UMWrF+ib/itMjgHAshaOhlU+EVs1Fyen8PdC1OK3aQ==
X-Google-Smtp-Source: ABdhPJxcoTYB/1+b7l2JHFzF1E2qizve5Da6qfVk+rG8hBOHLPKmqxMkanHIxEFedb8mllEk64EaBqPiGhE3/dTU0Zk=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr5399953edr.251.1610116833710; 
 Fri, 08 Jan 2021 06:40:33 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
 <20201202144523.24526-2-bmeng.cn@gmail.com>
In-Reply-To: <20201202144523.24526-2-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 14:40:22 +0000
Message-ID: <CAFEAcA9weaHgHTZBmEeveOxaakpeQTAvqrKGG6pZAprr=DcpWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ssi: imx_spi: Disable chip selects in
 imx_spi_reset()
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Dec 2020 at 14:45, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> When a write to ECSPI_CONREG register to disable the SPI controller,
> imx_spi_reset() is called to reset the controller, during which CS
> lines should have been disabled, otherwise the state machine of any
> devices (e.g.: SPI flashes) connected to the SPI master is stuck to
> its last state and responds incorrectly to any follow-up commands.
>
> Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>
> ---
>
> Changes in v2:
> - Fix the "Fixes" tag in the commit message
>
>  hw/ssi/imx_spi.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index e605049a21..85c172e815 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -231,6 +231,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>  static void imx_spi_reset(DeviceState *dev)
>  {
>      IMXSPIState *s = IMX_SPI(dev);
> +    int i;
>
>      DPRINTF("\n");
>
> @@ -243,6 +244,10 @@ static void imx_spi_reset(DeviceState *dev)
>
>      imx_spi_update_irq(s);
>
> +    for (i = 0; i < ECSPI_NUM_CS; i++) {
> +        qemu_set_irq(s->cs_lines[i], 1);
> +    }

Calling qemu_set_irq() in a device reset function is a bad
idea, because you don't know whether the thing on the other
end of the IRQ line (a) has already reset before you or
(b) is going to reset after you. If you need to do this then
I think you need to convert this device (and perhaps whatever
it's connected to) to the 3-phase-reset API. (But you probably
don't, see below.)

Usually the approach is that the device on the other end
of the line is going to reset its state anyway, so there's
no need to actively signal an irq line change.

If this is required only for the case of "guest requested
a controller reset via the ECSPI_CONREG register" and not
for full system reset, then you can handle that by having
an imx_spi_soft_reset() which calls imx_spi_reset() and then
does the qemu_set_irq() calls, so full system (power-cycle)
reset still goes to imx_spi_reset() but guest-commanded
reset via the register interface calls imx_spi_soft_reset().

thanks
-- PMM

