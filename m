Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814733FE7CC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 04:52:30 +0200 (CEST)
Received: from localhost ([::1]:35446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLcq5-0001Wu-KF
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 22:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcoV-00084y-Kr; Wed, 01 Sep 2021 22:50:51 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:35787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcoU-0005sS-5g; Wed, 01 Sep 2021 22:50:51 -0400
Received: by mail-io1-xd33.google.com with SMTP id a15so638361iot.2;
 Wed, 01 Sep 2021 19:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TLO7SuqixQSx12j6hU1WBtNsE1Kx3JVmxZU5bd2uLwI=;
 b=mzRqVSl/btYxTDroNBUTngs/UF6/ZfYvqbMjIU9kTE3Wei42UPjgW4ax8zc9vkxX8J
 PCNzj1NrzEFGVeoPOxxq/7quArouhEKIwIQyz0gKHwiUjE4rBzNCTVEMEYH04dZu2OkB
 03qSxpk0IWg3nEhIuszT5xbQk0IizGnbCxo54+itgI1OZ8BXURh990hDFl2kp9f2JVEH
 JaBcTxfGVe1jFcd7GdwSF3fw5Vw2tOP2LTwnDqA5TSeDGT2o+QpKAseTpHrEXnZFIn9F
 NSH6xoI4pnh2QinWIK0hKklqkqLZ5IYhgZEUjyr+MiqcF4RxsbhC/NW78Q4FKy+7JPcY
 kn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TLO7SuqixQSx12j6hU1WBtNsE1Kx3JVmxZU5bd2uLwI=;
 b=NHMGMjfUS/Z5QYizl8O59rbwZ86hKJGm/QLCbGtXoTTOug64kWL8mEG4zDebvdbWX8
 dAGf8isaqE9zzltFsu7T1qjgpUjrvknDFlx9X2m5WB20imA16geOUSWkHxJeJAHf5Xvq
 3tIpo+SOXHxMyDYuwSXBwcmBBfzsO/jZ8z+2KY9ts/asrDMdxVBBKdtk9/WoVcwP5O/B
 rXZzSx61/I16Zn1j9XXLIZrB99e1HU/gc6DZwNLrT/wIzwMy0jmMSZnb3MpwaMPLpLH4
 FDxNg3FofsHwxDIfZBlS3OPuPHUpIAI/qmaxXWfzhVkcGI595H5oAGZYlltrxbmF3nej
 bJJA==
X-Gm-Message-State: AOAM533TNHd3rm9ReLnwzU1Xwe3odgxK1L6lNV1Zkszsauf8r9+XBRok
 SPLvEMSLlEHxMKu0EB/PHTiH/jxkyHqPLxXUnXA=
X-Google-Smtp-Source: ABdhPJzC/Hy/FK9+9Gx5n1FGuWaavduvlntCryUnpbbikhf4YELCeirWC6vgDEV604rTXaH/gNRskHzx/7pHVU8eU/Q=
X-Received: by 2002:a6b:8e87:: with SMTP id q129mr891035iod.176.1630551048506; 
 Wed, 01 Sep 2021 19:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210901124521.30599-1-bmeng.cn@gmail.com>
 <20210901124521.30599-4-bmeng.cn@gmail.com>
In-Reply-To: <20210901124521.30599-4-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Sep 2021 12:50:22 +1000
Message-ID: <CAKmqyKMPFVKkW+R_2QaAgm_eumb-adrkMCN28oiLk_D4EyUMHA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] hw/char: cadence_uart: Move clock/reset check to
 uart_can_receive()
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 1, 2021 at 10:49 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Currently the clock/reset check is done in uart_receive(), but we
> can move the check to uart_can_receive() which is earlier.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - avoid declaring variables mid-scope
>
>  hw/char/cadence_uart.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index 154be34992..fff8be3619 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -235,8 +235,16 @@ static void uart_parameters_setup(CadenceUARTState *s)
>  static int uart_can_receive(void *opaque)
>  {
>      CadenceUARTState *s = opaque;
> -    int ret = MAX(CADENCE_UART_RX_FIFO_SIZE, CADENCE_UART_TX_FIFO_SIZE);
> -    uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
> +    int ret;
> +    uint32_t ch_mode;
> +
> +    /* ignore characters when unclocked or in reset */
> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        return 0;
> +    }
> +
> +    ret = MAX(CADENCE_UART_RX_FIFO_SIZE, CADENCE_UART_TX_FIFO_SIZE);
> +    ch_mode = s->r[R_MR] & UART_MR_CHMODE;
>
>      if (ch_mode == NORMAL_MODE || ch_mode == ECHO_MODE) {
>          ret = MIN(ret, CADENCE_UART_RX_FIFO_SIZE - s->rx_count);
> @@ -358,11 +366,6 @@ static void uart_receive(void *opaque, const uint8_t *buf, int size)
>      CadenceUARTState *s = opaque;
>      uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
>
> -    /* ignore characters when unclocked or in reset */
> -    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> -        return;
> -    }
> -
>      if (ch_mode == NORMAL_MODE || ch_mode == ECHO_MODE) {
>          uart_write_rx_fifo(opaque, buf, size);
>      }
> --
> 2.25.1
>
>

