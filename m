Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBA62F8D82
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 15:01:54 +0100 (CET)
Received: from localhost ([::1]:33754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0m9J-0007tl-QB
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 09:01:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0m57-0006Qz-HV; Sat, 16 Jan 2021 08:57:33 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:44137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0m55-0004K9-JJ; Sat, 16 Jan 2021 08:57:33 -0500
Received: by mail-yb1-xb30.google.com with SMTP id x78so3455439ybe.11;
 Sat, 16 Jan 2021 05:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nu3Bbd5pelM1fs79IiPKF/oYSY6ihGViecK8gbgsqF4=;
 b=Sdbbdles0ebpcggKdpbjt7/oZsqNtFq3m7Lkqrk+KxM6jAXH/ZXNl92zWWfOmSF20s
 /8z8xllvcObSLOfM95CHgmxez9Jgbb0uEfFYMfjcEJfcyEboI5VMFkkrwE5erGL0oTS1
 IVGQ8qbZBkxjn4i8W5VKNZmskgaB1kCOeoctTKfN2xdEVZm+gE5Z+jAhuY4dI/0z2zme
 mTPmgwPbZgnCmpHnhy71RCEyj0NCG3VPj/TThotRod3sBRDh17NArebSzPqVoMtGWaY5
 fGh+Yr/0y+RwS4gUeJKKAnegeLJXlvuko6N4QJfhONdnSWk0MybRnvZrG0GF54H5HY92
 sbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nu3Bbd5pelM1fs79IiPKF/oYSY6ihGViecK8gbgsqF4=;
 b=tO5lCxSqv2Ulz67aj2FLBYG96g8tuMksXcBTNVwSI//VtrvYyz8V/9WRKIKm7WJ5eZ
 L7MXKV+PxhkWseK1oCYmVqb6Lm1SJDdvdIktDzm2GlcoztE02AF0RGr5QI7mBJv5YCI6
 BlpvLGYjAT0eZNbplTUqtUZg9E4QyMUhdjTZEHQEz6PjGL4NixSac239Cst1w9n9J1N1
 YELA8nJtcb9X0tBQt3F3RIXd/wULtfeSBAFNhPa1fzj9lTKT5tB3qj2zQjFRa6QJfiT8
 fhSHedQCpV8v+8Y2prI7pQY1XFCBelGd9IRUfDWIInQRsYa09eeQJnLO2e8D047Ljcg0
 PiLw==
X-Gm-Message-State: AOAM531heGn//Ysxtsadwl0SgslBhR/KSLYCJWpUPv48yjehd/f5QOG6
 7X6BRmu4yyolbJ1hjsBfVTM9wBkXjnnRs9Tg714=
X-Google-Smtp-Source: ABdhPJzNfcvG3zTLkwI+Bg2jvj332qvO/TQi8r1shvPpXnOXmvY8VyuostzoudxHG/hFcBpyUeIGCHFPN93Rx3k3OtE=
X-Received: by 2002:a5b:5ce:: with SMTP id w14mr11892488ybp.314.1610805450189; 
 Sat, 16 Jan 2021 05:57:30 -0800 (PST)
MIME-Version: 1.0
References: <20210115153049.3353008-1-f4bug@amsat.org>
 <20210115153049.3353008-6-f4bug@amsat.org>
In-Reply-To: <20210115153049.3353008-6-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 16 Jan 2021 21:57:19 +0800
Message-ID: <CAEUhbmUXfm4JqqopEhq9-FQYJeY8Md7uwCczbSHm2H9oqERkJg@mail.gmail.com>
Subject: Re: [PATCH v7 5/9] hw/ssi: imx_spi: Rework imx_spi_write() to handle
 block disabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 11:37 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> When the block is disabled, only the ECSPI_CONREG register can
> be modified. Setting the EN bit enabled the device, clearing it

I don't know how this conclusion came out. The manual only says the
following 2 registers ignore the write when the block is disabled.

ECSPI_TXDATA, ECSPI_INTREG

> "disables the block and resets the internal logic with the
> exception of the ECSPI_CONREG" register.
>
> Move the imx_spi_is_enabled() check earlier.
>
> Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
>      chapter 21.7.3: Control Register (ECSPIx_CONREG)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/ssi/imx_spi.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index ba7d3438d87..f06bbf317e2 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -322,6 +322,21 @@ static void imx_spi_write(void *opaque, hwaddr offse=
t, uint64_t value,
>      DPRINTF("reg[%s] <=3D 0x%" PRIx32 "\n", imx_spi_reg_name(index),
>              (uint32_t)value);
>
> +    if (!imx_spi_is_enabled(s)) {
> +        /* Block is disabled */
> +        if (index !=3D ECSPI_CONREG) {
> +            /* Ignore access */
> +            return;
> +        }
> +        s->regs[ECSPI_CONREG] =3D value;
> +        if (!(value & ECSPI_CONREG_EN)) {
> +            /* Keep disabled */

So other bits except ECSPI_CONREG_EN are discarded? The manual does
not explicitly mention this but this looks suspicious.

> +            return;
> +        }
> +        /* Enable the block */
> +        imx_spi_reset(DEVICE(s));
> +    }
> +
>      change_mask =3D s->regs[index] ^ value;
>
>      switch (index) {
> @@ -330,10 +345,7 @@ static void imx_spi_write(void *opaque, hwaddr offse=
t, uint64_t value,
>                        TYPE_IMX_SPI, __func__);
>          break;
>      case ECSPI_TXDATA:
> -        if (!imx_spi_is_enabled(s)) {
> -            /* Ignore writes if device is disabled */
> -            break;
> -        } else if (fifo32_is_full(&s->tx_fifo)) {
> +        if (fifo32_is_full(&s->tx_fifo)) {
>              /* Ignore writes if queue is full */
>              break;
>          }
> @@ -359,12 +371,6 @@ static void imx_spi_write(void *opaque, hwaddr offse=
t, uint64_t value,
>      case ECSPI_CONREG:
>          s->regs[ECSPI_CONREG] =3D value;
>
> -        if (!imx_spi_is_enabled(s)) {
> -            /* device is disabled, so this is a reset */
> -            imx_spi_reset(DEVICE(s));
> -            return;
> -        }
> -
>          if (imx_spi_channel_is_master(s)) {
>              int i;
>

Regards,
Bin

