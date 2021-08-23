Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5263F446E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 06:45:21 +0200 (CEST)
Received: from localhost ([::1]:51886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI1po-0003LK-JB
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 00:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI1oR-0002LD-CJ; Mon, 23 Aug 2021 00:43:55 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:43976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI1oP-0002ya-GE; Mon, 23 Aug 2021 00:43:54 -0400
Received: by mail-io1-xd2b.google.com with SMTP id n24so20239170ion.10;
 Sun, 22 Aug 2021 21:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NPuJ/uF35VmE6fDNEBB9W2rLpsRWgAg7mNFYYheQErI=;
 b=XfyE/Jn6R6ehSdAlkqZo/40cUYi3Vc0yuQRBzyPOPel/HFDJXGQHhPW/onZ2hYdscV
 R5mnbF4V1wCV7oNK5hrvBr1gYKu8REvwe2c1bAQFP8Q2OMbru5rIMyponHGeWrOf4M91
 vNIu1/suerzgkaNmEYVBSSA4a/QLOR+318OF+qY65jhozL/gq+o05Lh9jm7DAJurjAkk
 3kVxSNV2NwKmgax4bl+hHeIJa0aKhYWkk0BWckKMWJn/UMgxYxUJOHLemQi5YwFH1/UW
 C6O30TIMSo6Y14mE22OGaq8AgxcLqky/3BSmTSEQT1psJCfwIVMuUfAY+X3pAt8IdLsp
 y/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NPuJ/uF35VmE6fDNEBB9W2rLpsRWgAg7mNFYYheQErI=;
 b=fCcZib3f4HlCTgEw7vbZZG4bgV36F39FMfRZheWVuZp/ahRE6ChsShD/PI89LScWb3
 fSYwZUBBNeWjxBatGnc4wRZMabEJ/6ou57pANfl5890PRqWH9KiYKXJnhC9WBBB2O5D0
 rw6vVfqy3JQqOXmU/Z/zIx6NWQbZABVKm7TbMGE+QzvUsbklpE1rQovN7eaZUj8v3gc8
 zNTabjyyN8oxVECfbJEt3jGd7TrEIUP906G12V5BzRScFVvyzxdxe6vk/cRKWGFCfD44
 tUp/WBVJyft2ltQE7cFBf8FZ4pBY2nkU0QhzMN3mav1wJRQEup+jVD+7gwXZT3Di1dQQ
 So2A==
X-Gm-Message-State: AOAM531Ejuo3gcbvIpcLoThZ7JPoP+O0WyUX9YhLZcQYSk6orA/g/48u
 CnoaH1j7B7ow9DaNu6ctlHoU7T68Ufp+j+a/qyg=
X-Google-Smtp-Source: ABdhPJw/Z0KzxOoP19ANjfb3O8pOoAJyiHjgYU9AFcJbf+/PvHkVQsxAjNEsdFTER9Hmvyxr1EmR8l9sxtG+s2NA3gw=
X-Received: by 2002:a05:6638:338a:: with SMTP id
 h10mr4551503jav.8.1629693831856; 
 Sun, 22 Aug 2021 21:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
 <20210823020813.25192-3-bmeng.cn@gmail.com>
In-Reply-To: <20210823020813.25192-3-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Aug 2021 14:43:26 +1000
Message-ID: <CAKmqyKMzq-F=MYMA=_7MeLTodxY7Eo91Nta4nKuncvAZ=bQUOQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/char: cadence_uart: Disable transmit when input
 clock is disabled
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 12:11 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> At present when input clock is disabled, any character transmitted
> to tx fifo can still show on the serial line, which is wrong.
>
> Fixes: b636db306e06 ("hw/char/cadence_uart: add clock support")
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  hw/char/cadence_uart.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index b4b5e8a3ee..154be34992 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -327,6 +327,11 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
>  static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
>                                 int size)
>  {
> +    /* ignore characters when unclocked or in reset */
> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        return;
> +    }

Should we log a guest error here?

Alistair

> +
>      if ((s->r[R_CR] & UART_CR_TX_DIS) || !(s->r[R_CR] & UART_CR_TX_EN)) {
>          return;
>      }
> --
> 2.25.1
>
>

