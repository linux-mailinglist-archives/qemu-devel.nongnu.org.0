Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9AA332D2D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:26:26 +0100 (CET)
Received: from localhost ([::1]:40592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJg7l-0006fS-KR
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJf2e-0004T3-Hh
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:17:04 -0500
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:41612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJf2W-0001A9-7Y
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:17:00 -0500
Received: by mail-il1-x133.google.com with SMTP id c10so12661749ilo.8
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WHViNTgRXuPPlrzegpMBTO5z6udyit9TJorfQvUwZJk=;
 b=q8pb2auX6U0d7gX5JY1ykHvNpNigW0ynSKAdm5IQOizOV/Sn5gzml0ApRDvkh6gabF
 x6q3j1gPpqgQnQdYqzlHPfPd6Egl9Uwbmed8BAYzUTmrywidLSLl0cW/ekPMDAY5zYx9
 Gow9uqvkJisFjszA+n5GadATN4kjA0NwYLXTYos6uNK7r5jyKFEPjjhzYLZ0c8OZQjET
 /F0SdNQEeQqpPcW3dyxyFOdffeB7944VIPlOr99nSyQRscYOU1pzdtnvguBvAXEjqzZs
 E+LlT7GL38V9w3/qgljGv4TQ7blFndORVKPA/SFlBFcaaDKiIAN23xBYATvYFmMPkCPl
 NW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WHViNTgRXuPPlrzegpMBTO5z6udyit9TJorfQvUwZJk=;
 b=mPVZ9Y1YC62ddYRWH1WNZ+kTFTheczFoqvDZLaHKjggsbhPCUAoIZDMmyaRsLXNNfW
 Le8qNVl6TBsOIGKRdfGYsahko8th6OveiNoPFSqchJZqhEJT8U/DsZuuSyR7AcBJPJFo
 ycUuCrOp+mQTYIumuPoa37nc8sc1IoDQ301D7iXJTC62KLf0PyEmb9J+UU3l1n/HqXNm
 aj6WXxPFUCr0/PRCvNXl/n5sB0qbcdj0zjLJ0sFS35Y1NfjrDbWHQqx+8R1B4AvX3MWG
 9pnzUrC2ZTxuUA1sPgnWMil3oe1XpdFBvsTMlHvARX3jRvP8boGsTtzQRsdEwprXz3Xv
 LVJA==
X-Gm-Message-State: AOAM530B0TIa5jtwvTahRsecxq2Ebm2C6taUaWAXqzOSdbu0Gb6TKeBz
 eoQsl6O/37T+GYkgrhdXLHvmh1f1td6GtGMX5kE=
X-Google-Smtp-Source: ABdhPJyzEjIP73sbqEv50NOpXITFbGZkCwAJhI7aB6LZHa/ttH/43Q3utgYRqua42Awr9u3Fg+qS7YF49v6O03W+wyg=
X-Received: by 2002:a92:c102:: with SMTP id p2mr24545842ile.227.1615306615150; 
 Tue, 09 Mar 2021 08:16:55 -0800 (PST)
MIME-Version: 1.0
References: <20210309152130.13038-1-alexander.wagner@ulal.de>
In-Reply-To: <20210309152130.13038-1-alexander.wagner@ulal.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Mar 2021 11:15:34 -0500
Message-ID: <CAKmqyKNkg0WG=A_8eiwipwt9Et_=8pomdA-sFcpQTdCc8oWdGw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/char: disable ibex uart receive if the buffer is
 full
To: Alexander Wagner <alexander.wagner@ulal.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 9, 2021 at 10:56 AM Alexander Wagner
<alexander.wagner@ulal.de> wrote:
>
> Not disabling the UART leads to QEMU overwriting the UART receive buffer with
> the newest received byte. The rx_level variable is added to allow the use of
> the existing OpenTitan driver libraries.
>
> Signed-off-by: Alexander Wagner <alexander.wagner@ulal.de>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/ibex_uart.c         | 23 ++++++++++++++++++-----
>  include/hw/char/ibex_uart.h |  4 ++++
>  2 files changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
> index 89f1182c9b..bc3e2482bc 100644
> --- a/hw/char/ibex_uart.c
> +++ b/hw/char/ibex_uart.c
> @@ -66,7 +66,8 @@ static int ibex_uart_can_receive(void *opaque)
>  {
>      IbexUartState *s = opaque;
>
> -    if (s->uart_ctrl & R_CTRL_RX_ENABLE_MASK) {
> +    if ((s->uart_ctrl & R_CTRL_RX_ENABLE_MASK)
> +           && !(s->uart_status & R_STATUS_RXFULL_MASK)) {
>          return 1;
>      }
>
> @@ -83,6 +84,11 @@ static void ibex_uart_receive(void *opaque, const uint8_t *buf, int size)
>
>      s->uart_status &= ~R_STATUS_RXIDLE_MASK;
>      s->uart_status &= ~R_STATUS_RXEMPTY_MASK;
> +    /* The RXFULL is set after receiving a single byte
> +     * as the FIFO buffers are not yet implemented.
> +     */
> +    s->uart_status |= R_STATUS_RXFULL_MASK;
> +    s->rx_level += 1;
>
>      if (size > rx_fifo_level) {
>          s->uart_intr_state |= R_INTR_STATE_RX_WATERMARK_MASK;
> @@ -199,6 +205,7 @@ static void ibex_uart_reset(DeviceState *dev)
>      s->uart_timeout_ctrl = 0x00000000;
>
>      s->tx_level = 0;
> +    s->rx_level = 0;
>
>      s->char_tx_time = (NANOSECONDS_PER_SECOND / 230400) * 10;
>
> @@ -243,11 +250,15 @@ static uint64_t ibex_uart_read(void *opaque, hwaddr addr,
>
>      case R_RDATA:
>          retvalue = s->uart_rdata;
> -        if (s->uart_ctrl & R_CTRL_RX_ENABLE_MASK) {
> +        if ((s->uart_ctrl & R_CTRL_RX_ENABLE_MASK) && (s->rx_level > 0)) {
>              qemu_chr_fe_accept_input(&s->chr);
>
> -            s->uart_status |= R_STATUS_RXIDLE_MASK;
> -            s->uart_status |= R_STATUS_RXEMPTY_MASK;
> +            s->rx_level -= 1;
> +            s->uart_status &= ~R_STATUS_RXFULL_MASK;
> +            if (s->rx_level == 0) {
> +                s->uart_status |= R_STATUS_RXIDLE_MASK;
> +                s->uart_status |= R_STATUS_RXEMPTY_MASK;
> +            }
>          }
>          break;
>      case R_WDATA:
> @@ -261,7 +272,8 @@ static uint64_t ibex_uart_read(void *opaque, hwaddr addr,
>      case R_FIFO_STATUS:
>          retvalue = s->uart_fifo_status;
>
> -        retvalue |= s->tx_level & 0x1F;
> +        retvalue |= (s->rx_level & 0x1F) << R_FIFO_STATUS_RXLVL_SHIFT;
> +        retvalue |= (s->tx_level & 0x1F) << R_FIFO_STATUS_TXLVL_SHIFT;
>
>          qemu_log_mask(LOG_UNIMP,
>                        "%s: RX fifos are not supported\n", __func__);
> @@ -364,6 +376,7 @@ static void ibex_uart_write(void *opaque, hwaddr addr,
>          s->uart_fifo_ctrl = value;
>
>          if (value & R_FIFO_CTRL_RXRST_MASK) {
> +            s->rx_level = 0;
>              qemu_log_mask(LOG_UNIMP,
>                            "%s: RX fifos are not supported\n", __func__);
>          }
> diff --git a/include/hw/char/ibex_uart.h b/include/hw/char/ibex_uart.h
> index 03d19e3f6f..546f958eb8 100644
> --- a/include/hw/char/ibex_uart.h
> +++ b/include/hw/char/ibex_uart.h
> @@ -62,6 +62,8 @@ REG32(FIFO_CTRL, 0x1c)
>      FIELD(FIFO_CTRL, RXILVL, 2, 3)
>      FIELD(FIFO_CTRL, TXILVL, 5, 2)
>  REG32(FIFO_STATUS, 0x20)
> +    FIELD(FIFO_STATUS, TXLVL, 0, 5)
> +    FIELD(FIFO_STATUS, RXLVL, 16, 5)
>  REG32(OVRD, 0x24)
>  REG32(VAL, 0x28)
>  REG32(TIMEOUT_CTRL, 0x2c)
> @@ -82,6 +84,8 @@ struct IbexUartState {
>      uint8_t tx_fifo[IBEX_UART_TX_FIFO_SIZE];
>      uint32_t tx_level;
>
> +    uint32_t rx_level;
> +
>      QEMUTimer *fifo_trigger_handle;
>      uint64_t char_tx_time;
>
> --
> 2.25.1
>
>

