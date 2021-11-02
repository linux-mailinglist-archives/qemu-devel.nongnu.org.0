Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA86D443144
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:09:27 +0100 (CET)
Received: from localhost ([::1]:47142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvPi-0000ya-LK
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhv4D-0008Rw-Jj
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:47:14 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:53129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhv4B-0001Tt-4Q
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:47:12 -0400
Received: by mail-wm1-x335.google.com with SMTP id b71so4367466wmd.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 07:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XmoIQDJS72PBLKPWinUN8wWCDmYPnoKKy9fR2TwgYqM=;
 b=RLe9llj96k+Gwjel5qObi5fKdI+L8M8qyWyk3eeAtv+T0AYi8Qd490/op9Xj6eK2aY
 87sPrTlnJB1b25PAdeC6RajE/czoMTBrkWCoL10L55G1Lp7GUTR6ZsWWgaPbF2dQCPJz
 torsRYa02BfpC62O0N79Pz9ba6E43XNWLjrNcjsfc9yNvETwGk02CI+taJAmj1BWyU8o
 Zpi2WJjRISi4a5IV9KQpHUB5sfq3L6K5Cn+rlqaHTJETnep4Av92YubXYk5A84qRyuq8
 vLESkzpxTaHZBb7Rr7xGM2iuzc/S65fqykek57+8pD6ZYNtlj3wndMwwTcJ3vZ59B9Ff
 QGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XmoIQDJS72PBLKPWinUN8wWCDmYPnoKKy9fR2TwgYqM=;
 b=ra0n6an+Ts4UU6wHSNruj6nqS+y+OCdy+wCnR/at/rRLLkuOflDrm3ZyrEYdggncb+
 9fnMqKuRQTzx40Lh9g5jZDPkKD2ScYJMStWF/rL7TbuzIq7rxwGWPhr5ELlaOthrAYpz
 uNzsq/wy7itt65uV0TZj6A6qdQIzS8hn6GA115uRgZ18WMUTVoZ2+883uA04OJRWBbHJ
 1YnzlqcYUua0/NnMBZTSIbjA9B0k6kujx8+nji3h4mTjgTQiWCFKNw2QHUCw6L+enhfj
 RV1trfq064kZDkBmcRRDjQ4ChQL9qtj/yrOCQXzQ5UnpQP78hoo3NEJJclPIEBdx8NmJ
 Uc5g==
X-Gm-Message-State: AOAM5332XSguiONgePcvKG2q+kiQ92i2Q6Y7PdKNdj5XHUcwDwu9AZLv
 QtVy4x98NPsIjq7gfs6gHW218tUlHUV+YxeHa5FsEw==
X-Google-Smtp-Source: ABdhPJz599DWI6me2YTBvvmaZF4Ps1uFyW2QbFUPzt4pBe5gLf747FcesUXcyOclGeNYcxvWaESxiohOTivNJG+pa4A=
X-Received: by 2002:a1c:f712:: with SMTP id v18mr7763706wmh.37.1635864429605; 
 Tue, 02 Nov 2021 07:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211101203049.28925-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20211101203049.28925-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Nov 2021 14:46:58 +0000
Message-ID: <CAFEAcA9ApYeHVYN_MPU4VLLt3kYeg5mQbPJMCH1Hq=3tcO9Gfw@mail.gmail.com>
Subject: Re: [PATCH] escc: update transmit status bits when switching to async
 mode
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Nov 2021 at 20:31, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The recent ESCC reset changes cause a regression when attemping to use a real
> SS-5 Sun PROM instead of OpenBIOS. The Sun PROM doesn't send an explicit reset
> command to the ESCC but gets stuck in a loop probing the keyboard waiting for
> STATUS_TXEMPTY to be set in R_STATUS followed by SPEC_ALLSENT in R_SPEC.
>
> Reading through the ESCC datasheet again indicates that SPEC_ALLSENT is updated
> when a write to W_TXCTRL1 selects async mode, or remains high if sync mode is
> selected. Whilst there is no explicit mention of STATUS_TXEMPTY, the ESCC device
> emulation always updates these two register bits together when transmitting data.

My reading of the spec is that this isn't the right behaviour. I think
what we ought to have is:
 * in both async and sync mode, TXEMPTY tracks the tx fifo status
   (which I think means "set if there is any space in it", contrary to
   what the name of the bit implies)
 * in sync mode, ALLSENT is always high
 * in async mode, ALLSENT reads the same as TXEMPTY (for us, since we have
   no extra delay between "data left the FIFO" and "data actually on the wire")
 * in sync mode TXEMPTY is apparently also set "when the last bit of the CRC
   has cleared the transmit shift register". I don't think I really understand
   what sync mode TXEMPTY does overall, but clearly it is not "always 0".

> Add extra logic to update both transmit status bits accordingly when writing to
> W_TXCTRL1 which enables the Sun PROM to initialise and boot again under QEMU.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/char/escc.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/hw/char/escc.c b/hw/char/escc.c
> index 0fce4f6324..b33cdc229f 100644
> --- a/hw/char/escc.c
> +++ b/hw/char/escc.c
> @@ -575,6 +575,18 @@ static void escc_mem_write(void *opaque, hwaddr addr,
>              s->wregs[s->reg] = val;
>              break;
>          case W_TXCTRL1:
> +            s->wregs[s->reg] = val;
> +            if (val & TXCTRL1_STPMSK) {
> +                ESCCSERIOQueue *q = &s->queue;
> +                if (s->type == escc_serial || q->count == 0) {
> +                    s->rregs[R_STATUS] |= STATUS_TXEMPTY;
> +                    s->rregs[R_SPEC] |= SPEC_ALLSENT;
> +                }

...should there be an 'else' clause here which clears these
bits if we are now in async mode and the tx queue is not empty ?

> +            } else {
> +                s->rregs[R_STATUS] &= ~STATUS_TXEMPTY;
> +                s->rregs[R_SPEC] |= SPEC_ALLSENT;
> +            }

Something is a bit odd with how we currently handle both these bits
For SPEC_ALLSENT:
 * it is zero on power-on
 * soft-reset leaves it unchanged
 * we set it on a write to SERIAL_DATA
 * this new code adds two places where we set it
 * but there is nowhere where we clear it

For STATUS_TXEMPTY:
 * it is set on power-on and soft-reset
 * it is set on write to SERIAL_DATA
 * it is never cleared

Shouldn't we be clearing these bits somewhere ?

> +            /* fallthrough */
>          case W_TXCTRL2:
>              s->wregs[s->reg] = val;
>              escc_update_parameters(s);

At this point all the "fallthrough" is doing is (1) repeat the
setting of s->wregs[s->reg] and (2) call escc_update_parameters().
So I think it would be clearer to instead make the two cases
completely separate, and have
   escc_update_parameters(s);
   break;

instead of the /* fallthrough */.

-- PMM

