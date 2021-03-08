Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F66F331037
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:58:19 +0100 (CET)
Received: from localhost ([::1]:59998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGOo-0007Ng-ME
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJGG1-0004uz-VQ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:49:13 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:43889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJGFy-0000Bb-IM
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:49:13 -0500
Received: by mail-io1-xd36.google.com with SMTP id f20so9926815ioo.10
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e2NLynRv2F6cWFPeBeBTaz93LXTBypGhwvQtbh8Evkw=;
 b=G48r/BiORvaZ3Tta+aIaUY5cYnPpxR2T0Wt0zW6Xbot4mDVOo017xtE7Vb77LikNpp
 ifk1rrPdY6YtvQeoU6w/L7aEyrAQYaUt4yrew0ULlFA9R6qYvLDd+4VcWLAqbS4w4Qhj
 Rpc4yMHjmB/FZAA/Y4mI2PS8QtodYNbXnPNRJFop2UI3Kiu6rRinAS+rkjJzDLi3IT2D
 oRshBDnjZxV1xBJVDA1GTA+jnj2s50H6GhOy4h7m490sAnPIPpWdZ7uUnUkwuI6hYysd
 rAOGogUYqtDJjdkQ6Zpr+WaM8cUbnzjBzU0ieHMMrUTw8n9cXEZHYQUVnJWwON1XeOIS
 CzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e2NLynRv2F6cWFPeBeBTaz93LXTBypGhwvQtbh8Evkw=;
 b=KIUGLmFT0vXn0wNHIoEhUD79swdaoOW33242vD8Ts3XQVGZGJ9DPnNn6C7BmNitB3h
 1/WcON99Mc00GfUkZN8++vGMXHWqO7J38l3RFoPX8F8h3obzY3FqOLaWHxu9xHz7q5TB
 A2rjXmyBX0OzW5r8OyUrAPjNlzdgPKPqUJl4lt6FJ/QTYUw5TFq1cJbGUpFfOsbEWEJ6
 L+Q79f3lXQfkD+5JmgoyHDQ2cm4cbJgyiiwYH55ASAREr6K6kdD8kipvBmEHRrV8RRl5
 7Ro5AorEakJpwbXlL72HX93WryDp7QZ2mzKc9br5RtywNZR7qlrXMeQ1QfZfyYLXDFhY
 K1JQ==
X-Gm-Message-State: AOAM531byiPuNqVRJl6mNURHVNH+WRMOz8prpsPT7W+BvQnIIL+IkqKM
 9zN2bcRmsqTMO0GMAdJzcTl9ZU52hRA00nKH43c=
X-Google-Smtp-Source: ABdhPJwHrM8CmK8iLlG8X1mMtU0vLlsTmupbsKgrIBjU4bbOf1IiUvTlyB4KfYeQKTgDavXacLrDZknQrpdJUOs2NUc=
X-Received: by 2002:a02:94cb:: with SMTP id x69mr23978750jah.8.1615211349440; 
 Mon, 08 Mar 2021 05:49:09 -0800 (PST)
MIME-Version: 1.0
References: <20210215231528.2718086-1-alexander.wagner@ulal.de>
In-Reply-To: <20210215231528.2718086-1-alexander.wagner@ulal.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Mar 2021 08:47:50 -0500
Message-ID: <CAKmqyKM4ewocr51Qhx8R1XR=r2rcgyuBLTqhpi-MYVpFko_Rcg@mail.gmail.com>
Subject: Re: [PATCH] hw/char: disable ibex uart receive if the buffer is full
To: Alexander Wagner <alexander.wagner@ulal.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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

On Mon, Feb 15, 2021 at 9:06 PM Alexander Wagner
<alexander.wagner@ulal.de> wrote:
>
> Not disabling the UART leads to QEMU overwriting the UART receive buffer with
> the newest received byte. The rx_level variable is added to allow the use of
> the existing OpenTitan driver libraries.
>
> Signed-off-by: Alexander Wagner <alexander.wagner@ulal.de>

Thanks for the patch!

I'm glad to see others using OT on QEMU.

> ---
>  hw/char/ibex_uart.c         | 20 +++++++++++++++-----
>  include/hw/char/ibex_uart.h |  4 ++++
>  2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
> index 89f1182c9b..dac09d53d6 100644
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
> @@ -83,6 +84,8 @@ static void ibex_uart_receive(void *opaque, const uint8_t *buf, int size)
>
>      s->uart_status &= ~R_STATUS_RXIDLE_MASK;
>      s->uart_status &= ~R_STATUS_RXEMPTY_MASK;
> +    s->uart_status |= R_STATUS_RXFULL_MASK;

Doesn't this mean we set RXFULL on every receive? Shouldn't this check
the rx_level first?

Alistair

> +    s->rx_level += 1;
>
>      if (size > rx_fifo_level) {
>          s->uart_intr_state |= R_INTR_STATE_RX_WATERMARK_MASK;
> @@ -199,6 +202,7 @@ static void ibex_uart_reset(DeviceState *dev)
>      s->uart_timeout_ctrl = 0x00000000;
>
>      s->tx_level = 0;
> +    s->rx_level = 0;
>
>      s->char_tx_time = (NANOSECONDS_PER_SECOND / 230400) * 10;
>
> @@ -243,11 +247,15 @@ static uint64_t ibex_uart_read(void *opaque, hwaddr addr,
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
> @@ -261,7 +269,8 @@ static uint64_t ibex_uart_read(void *opaque, hwaddr addr,
>      case R_FIFO_STATUS:
>          retvalue = s->uart_fifo_status;
>
> -        retvalue |= s->tx_level & 0x1F;
> +        retvalue |= (s->rx_level & 0x1F) << R_FIFO_STATUS_RXLVL_SHIFT;
> +        retvalue |= (s->tx_level & 0x1F) << R_FIFO_STATUS_TXLVL_SHIFT;
>
>          qemu_log_mask(LOG_UNIMP,
>                        "%s: RX fifos are not supported\n", __func__);
> @@ -364,6 +373,7 @@ static void ibex_uart_write(void *opaque, hwaddr addr,
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

