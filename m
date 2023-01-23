Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FA567762B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:15:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJryV-0001jE-0P; Mon, 23 Jan 2023 03:14:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJryH-0001iH-Hc
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:14:31 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJryD-0005IM-H5
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:14:27 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso7880378wms.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 00:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DzBKvDs+bANJTA3YXdEwqYSjp5CkfEwWPAB+J5og4dw=;
 b=H973MFYK2G0AopTO1xX6ZGYVa5Z7kyQhtxySwvHbuwdRd2lVaFu2j/qFYl3bOq47sL
 NjWIxMak0Vz56v+j4FXpwZvbZwy88bfJAw/JSuza1cnDB4oC+vo3GKwvQBCFb7tTAWKd
 /y/CeZdnMx82jANlwTdfHVxADyErR3Q9DxA4K7Lyja/PaqCybktFqvGlo/ZkjQdjJF1h
 HhSD8MsQ7X3q6XdPX+Z0pmJKguXM+j/BrPI5PmvzfJSp94fSfPl7md7rQFZHyyW6b8hu
 CrEqzXmYb6Lsm4+hJ1UwkrTkShAO+nQq1TKujXFcQBfV6kFAYmXxzw/Ab2/ANbcKUcBA
 fN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DzBKvDs+bANJTA3YXdEwqYSjp5CkfEwWPAB+J5og4dw=;
 b=ZHUbmb0Q2Z6eWnokb+8GBSw5FQTQv9cA90/H8mYtD0zkygWv74VCiM+IcmGOkHDPPA
 N1GLJLbYUbPLIeDgwhcEPQ3T8O8zLsmUbbzgBt1eyuW4kXvzxDG6LtOnXOhfGyLj4Hk1
 bBxE7ZTdwANlZxMbdsqbZgsDcs87zwWXhcc/1uemi55BCaToK81YhUO81JVYY/NAqZvp
 mJ9gKfPT4a/QZ0MVroWERwVy0ANSmquxDENggnJpSS0h7cJsH4vKAGtS19ObJe3JPgEQ
 vOjaqwvdg487rZbTayQH2D/vuw/wIDt9WVfoF1Dz16IkPR9zBdguJhdQczjPoBKetbe3
 UKHA==
X-Gm-Message-State: AFqh2kogoTylD52sinZr3P1seZumNwCzUiUhtJXx+VYIIinPDv20Aswm
 Ux1Gt5ypkjul/92F+tKHFb9dvQ==
X-Google-Smtp-Source: AMrXdXttFyMZOF87JW6mRPsD8/LZZ9VJ8PP97mRxF9jOF5Msk6FcFLGjOONp5qN2hf1SuCoulOXMbQ==
X-Received: by 2002:a05:600c:4f8d:b0:3d3:3d1b:6354 with SMTP id
 n13-20020a05600c4f8d00b003d33d1b6354mr19813693wmq.3.1674461663243; 
 Mon, 23 Jan 2023 00:14:23 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 he11-20020a05600c540b00b003d9b89a39b2sm9837994wmb.10.2023.01.23.00.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 00:14:22 -0800 (PST)
Message-ID: <fc01ef6d-73d7-af1a-3e59-bd4f1e3e83ba@linaro.org>
Date: Mon, 23 Jan 2023 09:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 5/5] hw/char/pl011: check if UART is enabled before RX
 or TX operation
Content-Language: en-US
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-6-eiakovlev@linux.microsoft.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230120155447.31702-6-eiakovlev@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/1/23 16:54, Evgeny Iakovlev wrote:
> UART should be enabled in general and have RX enabled specifically to be
> able to receive data from peripheral device. Same goes for transmitting
> data to peripheral device and a TXE flag.
> 
> Check if UART CR register has EN and RXE or TXE bits enabled before
> trying to receive or transmit data.
> 
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/char/pl011.c | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)

> +static inline bool pl011_can_transmit(PL011State *s)
> +{
> +    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
> +}
> +
>   static void pl011_write(void *opaque, hwaddr offset,
>                           uint64_t value, unsigned size)
>   {
> @@ -221,7 +231,9 @@ static void pl011_write(void *opaque, hwaddr offset,
>   
>       switch (offset >> 2) {
>       case 0: /* UARTDR */
> -        /* ??? Check if transmitter is enabled.  */
> +        if (!pl011_can_transmit(s)) {
> +            break;
> +        }
>           ch = value;
>           /* XXX this blocks entire thread. Rewrite to use
>            * qemu_chr_fe_write and background I/O callbacks */
> @@ -292,7 +304,11 @@ static int pl011_can_receive(void *opaque)
>       PL011State *s = (PL011State *)opaque;
>       int r;
>   
> -    r = s->read_count < pl011_get_fifo_depth(s);
> +    if (!(s->cr & PL011_CR_UARTEN) || !(s->cr & PL011_CR_RXE)) {

Maybe add pl011_can_receive() similarly to pl011_can_transmit().

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        r = 0;
> +    } else {
> +        r = s->read_count < pl011_get_fifo_depth(s);
> +    }
>       trace_pl011_can_receive(s->lcr, s->read_count, r);
>       return r;
>   }


