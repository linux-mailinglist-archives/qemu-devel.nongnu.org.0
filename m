Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2782B6A66
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:39:48 +0100 (CET)
Received: from localhost ([::1]:50792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf41D-00019l-MG
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf3zn-0000Nk-BE
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:38:19 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:43181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf3zk-0001uv-Ml
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:38:19 -0500
Received: by mail-ej1-x641.google.com with SMTP id k27so2936316ejs.10
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j8B3bzND2pZrtEJ8hHyK4Zxc4rb7L5ZbLHvYjId0vBM=;
 b=mxG8dJ/3fdIQSAgZnroh+sCwur7LDDG5o0VSNPyBQlfPUAvTQc8zz6AVclNvCdoMQg
 dJ9p0ogpy2c6z0rYHbYD78BaHmSBqAI3JpMmllYVwI/ediFeSOx+oYzdHwm8iGies2ag
 +7Xo3Sf1eT2/wSeoprr7WZXngFCwQGr9LUOjRADqwMnIxYoOa2Gl/ArQqrdY/zsV/DZU
 fn0liTPjTxEU+huK68pmVmQMQJm6XC05bFUmnlA/1NLY9tHRczpo24218dLtTX5oagyc
 TwueBfkqUexyvR4mUVfMp/H9eZgtULeNausZNgwDhcrczCjMXFW7j49pLZhFJ3ZOsLT8
 TUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j8B3bzND2pZrtEJ8hHyK4Zxc4rb7L5ZbLHvYjId0vBM=;
 b=sXDhctqGu/Ypj8sa33HKS+KNBmW/ekfDNrP/8NptQR05oUkOEHzEnRVpFOrsdZpWww
 SRKEa1x8cwh09rCxy6LfRrbEz4Bp3aTgr7oTMB6DzBs/TzjGidNO+jXux1HFO59YZp8y
 Bf+VY5hvM9p0sw8HPV4tEjsVSyr8tIsN/pVtON7ejJ0HcvG6PCd5cPjqg39+7hOKxXAt
 aZC9g+yr1ekX3Z/i+8Gev34gDugEgq92DxdaQ2nQ2MUKRQoKEyMGj0vz1KEWSnilz5j5
 Z0hORq+U6nVa/Pb/Qw2y5/SsRUQqiAvHNFEK04tUKeu8qAXEfuJ83FmY5v9SIcjRcPqO
 MVng==
X-Gm-Message-State: AOAM5328BFmmNkA+ebemfAsjuMNStecKR/YwHP9B+seME1y/lIyvpLE6
 byWzhb1DT0Ucz05s+gC/87+Go7pjYIKHeQJ2wcP3mw==
X-Google-Smtp-Source: ABdhPJxXzAXaXtLIZswZ2Fg7cUgryCmBmA6a2ru5LKvhqRsqCMPSWmxRJcKbf84YevBaJ09j0k0jtkOvcbltkEIqTfk=
X-Received: by 2002:a17:906:6949:: with SMTP id
 c9mr19768209ejs.482.1605631094618; 
 Tue, 17 Nov 2020 08:38:14 -0800 (PST)
MIME-Version: 1.0
References: <107912fb-4570-2e61-c6ff-7b8df1ec5cac@gmail.com>
In-Reply-To: <107912fb-4570-2e61-c6ff-7b8df1ec5cac@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 16:38:03 +0000
Message-ID: <CAFEAcA_-+pFri8yQd0S0Uk3BCEDCtAMbR5k=ei-jUmQUS-dPEg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/char/cmsdk-apb-uart: Fix rx interrupt handling
To: =?UTF-8?B?VGFkZWogUGXEjWFy?= <tpecar95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 at 19:58, Tadej Pe=C4=8Dar <tpecar95@gmail.com> wrote:
>
> Previously, the RX interrupt got missed if:
> - the character backend provided next character before
>    the RX IRQ Handler managed to clear the currently served interrupt.
> - the character backend provided next character while the RX interrupt
>    was disabled. Enabling the interrupt did not trigger the interrupt
>    even if the RXFULL status bit was set.
>
> These bugs become apparent when the terminal emulator buffers the line
> before sending it to qemu stdin (Eclipse IDE console does this).
>
>
> diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
> index 626b68f2ec..d76ca76e01 100644
> --- a/hw/char/cmsdk-apb-uart.c
> +++ b/hw/char/cmsdk-apb-uart.c
> @@ -96,19 +96,34 @@ static void uart_update_parameters(CMSDKAPBUART *s)
>
>   static void cmsdk_apb_uart_update(CMSDKAPBUART *s)
>   {
> -    /* update outbound irqs, including handling the way the rxo and txo
> -     * interrupt status bits are just logical AND of the overrun bit in
> -     * STATE and the overrun interrupt enable bit in CTRL.
> +    /*
> +     * update outbound irqs
> +     * (
> +     *     state     [rxo,  txo,  rxbf, txbf ] at bit [3, 2, 1, 0]
> +     *   | intstatus [rxo,  txo,  rx,   tx   ] at bit [3, 2, 1, 0]
> +     * )
> +     * & ctrl        [rxoe, txoe, rxe,  txe  ] at bit [5, 4, 3, 2]
> +     * =3D masked_intstatus
> +     *
> +     * state: status register
> +     * intstatus: pending interrupts and is sticky (has to be cleared by=
 sw)
> +     * masked_intstatus: masked (by ctrl) pending interrupts
> +     *
> +     * intstatus [rxo, txo, rx] bits are set here
> +     * intstatus [tx] is managed in uart_transmit
>        */
> -    uint32_t omask =3D (R_INTSTATUS_RXO_MASK | R_INTSTATUS_TXO_MASK);
> -    s->intstatus &=3D ~omask;
> -    s->intstatus |=3D (s->state & (s->ctrl >> 2) & omask);
> -
> -    qemu_set_irq(s->txint, !!(s->intstatus & R_INTSTATUS_TX_MASK));
> -    qemu_set_irq(s->rxint, !!(s->intstatus & R_INTSTATUS_RX_MASK));
> -    qemu_set_irq(s->txovrint, !!(s->intstatus & R_INTSTATUS_TXO_MASK));
> -    qemu_set_irq(s->rxovrint, !!(s->intstatus & R_INTSTATUS_RXO_MASK));
> -    qemu_set_irq(s->uartint, !!(s->intstatus));
> +    s->intstatus |=3D s->state &
> +        (R_INTSTATUS_RXO_MASK | R_INTSTATUS_TXO_MASK | R_INTSTATUS_RX_MA=
SK);
> +
> +    uint32_t masked_intstatus =3D s->intstatus & (s->ctrl >> 2);

I don't think this logic is correct. It makes the values we
send out on the output interrupt lines different from the
values visible in the INTSTATUS register bits, and I don't
think that's how the hardware behaves.

thanks
-- PMM

