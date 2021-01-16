Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFA52F8D6F
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 14:38:09 +0100 (CET)
Received: from localhost ([::1]:57298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0lmK-0001LV-Ga
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 08:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0lk4-0000RL-Ak; Sat, 16 Jan 2021 08:35:49 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:39916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0lk0-0003BQ-R8; Sat, 16 Jan 2021 08:35:48 -0500
Received: by mail-yb1-xb34.google.com with SMTP id k4so7897871ybp.6;
 Sat, 16 Jan 2021 05:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8on2QyB1HDr8H7GCBL1pm3AsHHKa0V4OLPtywW5HFVo=;
 b=bwdhOMK2WEGXWe3uR6W+ZatKA48oN2rRWgd15YkOLcS1ujQViVCWeyziUCkRn/HmWs
 3AJ3q+s4Qw2RyqxUPDJEjoGQymHoh/CB3woG+xPSnPYAzmdgYPyuNYhPNtXDJazt1MDa
 TW2ku+gAeyIePFakgFH45MpIjWR10SUVxKshvQ1LDqMAZtkYAFRi2oOGQbcjsaEzYVBT
 EJJjIDtjFZyRsx/BALt+LpgoCCpT8zBoic9fRwlwkBL+16oAXFpMaxIa0dC3E5Ewm9MT
 klGWtDLitk+WIl5ZSmeqQaKtUpm/nR9ied/LnUxqCHrhyuf552GQAW201ebxeU8GCdKy
 XSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8on2QyB1HDr8H7GCBL1pm3AsHHKa0V4OLPtywW5HFVo=;
 b=TrX7rRGVEHCM7m68Ub2OarjZAkM7ZW7I6kpqU/LLpB24Wj7qFCXqiySxwQ9mxH18t5
 a6R1g8uuzw2wChJlPfWifLLA3E/27PO3nTq5dDShT8aCtiBTss7dW49f/PXQkyTFOieX
 tgzOnR7jE+R80ycYHu3YcKvfY7GywiPwa4pF6UwtNinpxtCzB49m2DQT4ClDS74oGCOU
 OcR0cLHFbUJ7UJG5qjzOMNFKqOr4mzvtr9CobvpwzsfSbGWibabk3YksysIjsBa1/YNF
 g1yqtVyF+7bF5nrffmd8HKejH32YGAmYsQGd8gSBVjNA3NLuVN1pPHQFofdTzKG3ZvUX
 zohQ==
X-Gm-Message-State: AOAM533lsRO6rpbcWAzMmSewQrN2nXuEI2mYgpYsj4yd9dOzE7hoNr6w
 VwMokPYCtpL2dcncOTpL7lU6MDSftJ8mYqA/CMo=
X-Google-Smtp-Source: ABdhPJyLgCVSYIReOxQC65fflqgo9k6uZK9xD/asuw++BB5YfK24cc/QEKnA6qjqZfWSwd/2Muzr6zQ10GTXIeM5F1w=
X-Received: by 2002:a25:b8ca:: with SMTP id g10mr23495282ybm.517.1610804142354; 
 Sat, 16 Jan 2021 05:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20210115153049.3353008-1-f4bug@amsat.org>
 <20210115153049.3353008-5-f4bug@amsat.org>
In-Reply-To: <20210115153049.3353008-5-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 16 Jan 2021 21:35:30 +0800
Message-ID: <CAEUhbmXJqF442vLcjm=g4TCJCOAybxxkE5cxKqpkPh=rRuGLZQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/9] hw/ssi: imx_spi: Rework imx_spi_read() to handle
 block disabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
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
 Juan Quintela <quintela@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 11:37 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> When the block is disabled, it stay it is 'internal reset logic'
> (internal clocks are gated off). Reading any register returns
> its reset value. Only update this value if the device is enabled.
>
> Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
>      chapter 21.7.3: Control Register (ECSPIx_CONREG)
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/ssi/imx_spi.c | 60 +++++++++++++++++++++++-------------------------
>  1 file changed, 29 insertions(+), 31 deletions(-)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 78b19c2eb91..ba7d3438d87 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -269,42 +269,40 @@ static uint64_t imx_spi_read(void *opaque, hwaddr o=
ffset, unsigned size)
>          return 0;
>      }
>
> -    switch (index) {
> -    case ECSPI_RXDATA:
> -        if (!imx_spi_is_enabled(s)) {
> -            value =3D 0;
> -        } else if (fifo32_is_empty(&s->rx_fifo)) {
> -            /* value is undefined */
> -            value =3D 0xdeadbeef;
> -        } else {
> -            /* read from the RX FIFO */
> -            value =3D fifo32_pop(&s->rx_fifo);
> +    value =3D s->regs[index];
> +
> +    if (imx_spi_is_enabled(s)) {
> +        switch (index) {
> +        case ECSPI_RXDATA:
> +            if (fifo32_is_empty(&s->rx_fifo)) {
> +                /* value is undefined */
> +                value =3D 0xdeadbeef;
> +            } else {
> +                /* read from the RX FIFO */
> +                value =3D fifo32_pop(&s->rx_fifo);
> +            }
> +            break;
> +        case ECSPI_TXDATA:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "[%s]%s: Trying to read from TX FIFO\n",
> +                          TYPE_IMX_SPI, __func__);
> +
> +            /* Reading from TXDATA gives 0 */

The new logic is a little bit non straight forward as the value 0
comes from s->regs[index] which was never written hence 0. While the
previous logic is returning explicitly zero. Perhaps a comment update
is needed.

> +            break;
> +        case ECSPI_MSGDATA:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "[%s]%s: Trying to read from MSG FIFO\n",
> +                          TYPE_IMX_SPI, __func__);
> +            /* Reading from MSGDATA gives 0 */

ditto

> +            break;
> +        default:
> +            break;
>          }
>
> -        break;
> -    case ECSPI_TXDATA:
> -        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Trying to read from TX F=
IFO\n",
> -                      TYPE_IMX_SPI, __func__);
> -
> -        /* Reading from TXDATA gives 0 */
> -
> -        break;
> -    case ECSPI_MSGDATA:
> -        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Trying to read from MSG =
FIFO\n",
> -                      TYPE_IMX_SPI, __func__);
> -
> -        /* Reading from MSGDATA gives 0 */
> -
> -        break;
> -    default:
> -        value =3D s->regs[index];
> -        break;
> +        imx_spi_update_irq(s);
>      }
> -
>      DPRINTF("reg[%s] =3D> 0x%" PRIx32 "\n", imx_spi_reg_name(index), val=
ue);
>
> -    imx_spi_update_irq(s);
> -
>      return (uint64_t)value;
>  }

Regards,
Bin

