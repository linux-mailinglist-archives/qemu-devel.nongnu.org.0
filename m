Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B8E2B49F5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 16:53:40 +0100 (CET)
Received: from localhost ([::1]:42636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kegp0-0008D1-Ji
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 10:53:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kegnc-0007ba-7n
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 10:52:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kegnY-0002Nq-Hv
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 10:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605541927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R0rX/kNZSwvKSrh96Zhu3HoPRziyEctQ6CeWLHmasBo=;
 b=iLJ/PPsSRKt9Cp5ElpQMDiNiePaO5z860aWDtZICZBGpoYDjUquyiVYCCW9DliTIWPqsd3
 dVe1y+tXxo/w22uQqkTNUUia0hYU1z5O/3uR+SAM0dPS5ayA0eO6jG4M79RgVngzn8d6vy
 7FBAvy4JWUaZluEE9giziW21P2dYh18=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-2A2PGnxsMl-eQds15i0PDQ-1; Mon, 16 Nov 2020 10:52:03 -0500
X-MC-Unique: 2A2PGnxsMl-eQds15i0PDQ-1
Received: by mail-wr1-f72.google.com with SMTP id u1so11341478wri.6
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 07:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R0rX/kNZSwvKSrh96Zhu3HoPRziyEctQ6CeWLHmasBo=;
 b=Snwbqq2LoCME5bWKID1l0OAC6XCOBC33q6usFVWHIprVzYoeOJKv96M7Be3c82rDNP
 hX/8AzsJiXUBZf81Jpc4D7Rm48VMUFbUpLXorHIcGlOeSNqbLM3s03p1T1hySfNSs5NZ
 JwB9sbCUTAXQ1AnqVLdfxYLOCJNRiaHqHg+04Q/I3OIlR1YwcKCNgqU1FGGqzssaAhQw
 nB3rV0swYEx7/P+BNBm7NIPLBbYvZZQkzqWi2eEBE2IfkxnBbw0GmZEmIH2gyGqWcMoh
 pqIucCHomk7Sif6nx9KSkXNX0vg6VBfGurk/7uh0FqRHhVux5LSDhO0WreVrPMVffak4
 CNHw==
X-Gm-Message-State: AOAM533fDwKbCodFlwBTqXYZwFM5chPBvUn9j2epxA6d+P/Kjd3KyAdd
 mae0Tedb84ZDhNDzs5J1bQIaUMzRrUmEWgESU7A/2gZ2jZYz0zkvRZxJx0pqPCAP+yollc7K72D
 5se763ragZPtvi0s=
X-Received: by 2002:a5d:654c:: with SMTP id z12mr19061685wrv.46.1605541921758; 
 Mon, 16 Nov 2020 07:52:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTe3vaVChk5dC0b/PvLLMyYpOQlpB4SVFtWy2z1fkFnJmwuzl2a8qa+quMSuDbAAsPp7hKZA==
X-Received: by 2002:a5d:654c:: with SMTP id z12mr19061667wrv.46.1605541921544; 
 Mon, 16 Nov 2020 07:52:01 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 30sm16532618wrd.88.2020.11.16.07.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 07:52:00 -0800 (PST)
Subject: Re: [PATCH] hw/char/cmsdk-apb-uart: Fix rx interrupt handling
To: Tadej Pecar <tpecar95@gmail.com>, qemu-devel@nongnu.org
References: <CAD-fBOBqRWQLW8xpJ+j8DSWeuDbCNEOr67uHqQJ+v=CwAFow7g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e01a895a-ef42-91f1-30e1-816f6e838a91@redhat.com>
Date: Mon, 16 Nov 2020 16:51:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAD-fBOBqRWQLW8xpJ+j8DSWeuDbCNEOr67uHqQJ+v=CwAFow7g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Tadej,

On 11/16/20 4:11 PM, Tadej Pecar wrote:
> Previously, the RX interrupt got missed if:
> - the character backend provided the next character before the RX IRQ
> Handler
>   managed to clear the currently served interrupt.
> - the character backend provided the next character while the RX interrupt
>   was disabled. Enabling the interrupt did not trigger the interrupt
>   even if the RXFULL status bit was set.
> 
> Signed-off-by: Tadej P <tpecar95@gmail.com <mailto:tpecar95@gmail.com>>

Thanks for your patch!

Minor comment, your git seems mis-configured (full name is expected
here: Tadej Pecar).

You might fix by running in a shell:

$ git config user.name "Tadej Pecar"

See:
https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line

> ---
>  hw/char/cmsdk-apb-uart.c | 54 ++++++++++++++++++++++++++++------------
>  hw/char/trace-events     |  1 +
>  2 files changed, 39 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
> index 626b68f2ec..1b361bc4d6 100644
> --- a/hw/char/cmsdk-apb-uart.c
> +++ b/hw/char/cmsdk-apb-uart.c
> @@ -96,19 +96,34 @@ static void uart_update_parameters(CMSDKAPBUART *s)
>  
>  static void cmsdk_apb_uart_update(CMSDKAPBUART *s)
>  {
> -    /* update outbound irqs, including handling the way the rxo and txo
> -     * interrupt status bits are just logical AND of the overrun bit in
> -     * STATE and the overrun interrupt enable bit in CTRL.
> +    /*
> +     * update outbound irqs
> +     * (
> +     *     state     [rxo,  txo,  rxbf, txbf ] at bit [3, 2, 1, 0]
> +     *   | intstatus [rxo,  txo,  rx,   tx   ] at bit [3, 2, 1, 0]
> +     * )
> +     * & ctrl        [rxoe, txoe, rxe,  txe  ] at bit [5, 4, 3, 2]
> +     * = masked_intstatus
> +     *
> +     * state: status register
> +     * intstatus: pending interrupts and is sticky (has to be cleared
> by sw)
> +     * masked_intstatus: masked (by ctrl) pending interrupts
> +     *
> +     * intstatus [rxo, txo, rx] bits are set here
> +     * intstatus [tx] is managed in uart_transmit
>       */
> -    uint32_t omask = (R_INTSTATUS_RXO_MASK | R_INTSTATUS_TXO_MASK);
> -    s->intstatus &= ~omask;
> -    s->intstatus |= (s->state & (s->ctrl >> 2) & omask);
> -
> -    qemu_set_irq(s->txint, !!(s->intstatus & R_INTSTATUS_TX_MASK));
> -    qemu_set_irq(s->rxint, !!(s->intstatus & R_INTSTATUS_RX_MASK));
> -    qemu_set_irq(s->txovrint, !!(s->intstatus & R_INTSTATUS_TXO_MASK));
> -    qemu_set_irq(s->rxovrint, !!(s->intstatus & R_INTSTATUS_RXO_MASK));
> -    qemu_set_irq(s->uartint, !!(s->intstatus));
> +    s->intstatus |= s->state &
> +        (R_INTSTATUS_RXO_MASK | R_INTSTATUS_TXO_MASK |
> R_INTSTATUS_RX_MASK);
> +
> +    uint32_t masked_intstatus = s->intstatus & (s->ctrl >> 2);
> +
> +    trace_cmsdk_apb_uart_update(s->state, s->intstatus, masked_intstatus);
> +
> +    qemu_set_irq(s->txint,    !!(masked_intstatus & R_INTSTATUS_TX_MASK));
> +    qemu_set_irq(s->rxint,    !!(masked_intstatus & R_INTSTATUS_RX_MASK));
> +    qemu_set_irq(s->txovrint, !!(masked_intstatus & R_INTSTATUS_TXO_MASK));
> +    qemu_set_irq(s->rxovrint, !!(masked_intstatus & R_INTSTATUS_RXO_MASK));
> +    qemu_set_irq(s->uartint,  !!(masked_intstatus));
>  }
>  
>  static int uart_can_receive(void *opaque)
> @@ -144,9 +159,11 @@ static void uart_receive(void *opaque, const
> uint8_t *buf, int size)
>  
>      s->rxbuf = *buf;
>      s->state |= R_STATE_RXFULL_MASK;
> -    if (s->ctrl & R_CTRL_RX_INTEN_MASK) {
> -        s->intstatus |= R_INTSTATUS_RX_MASK;
> -    }
> +
> +    /*
> +     * Handled in cmsdk_apb_uart_update, in order to properly handle
> +     * pending rx interrupt when rxen gets enabled
> +     */
>      cmsdk_apb_uart_update(s);
>  }
>  
> @@ -278,7 +295,12 @@ static void uart_write(void *opaque, hwaddr offset,
> uint64_t value,
>           * is then reflected into the intstatus value by the update
> function).
>           */
>          s->state &= ~(value & (R_INTSTATUS_TXO_MASK |
> R_INTSTATUS_RXO_MASK));
> -        s->intstatus &= ~value;
> +
> +        /*
> +         * Clear rx interrupt status only if no pending character
> +         * (no buffer full asserted).
> +         */
> +        s->intstatus &= ~value | (s->state & R_STATE_RXFULL_MASK);
>          cmsdk_apb_uart_update(s);
>          break;
>      case A_BAUDDIV:
> diff --git a/hw/char/trace-events b/hw/char/trace-events
> index 81026f6612..0821c8eb3a 100644
> --- a/hw/char/trace-events
> +++ b/hw/char/trace-events
> @@ -68,6 +68,7 @@ pl011_put_fifo_full(void) "FIFO now full, RXFF set"
>  pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t
> ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %"
> PRIu32 ", fbrd: %" PRIu32 ")"
>  
>  # cmsdk-apb-uart.c
> +cmsdk_apb_uart_update(uint32_t state, uint32_t intstatus, uint32_t
> masked_intstatus) "CMSDK APB UART update: state 0x%x intstatus 0x%x
> masked_intstatus 0x%x"
>  cmsdk_apb_uart_read(uint64_t offset, uint64_t data, unsigned size)
> "CMSDK APB UART read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>  cmsdk_apb_uart_write(uint64_t offset, uint64_t data, unsigned size)
> "CMSDK APB UART write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>  cmsdk_apb_uart_reset(void) "CMSDK APB UART: reset"
> --
> 2.29.2
> 


