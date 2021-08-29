Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02D53FABD5
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 15:19:54 +0200 (CEST)
Received: from localhost ([::1]:56700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKKj3-00082A-B4
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 09:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKKhX-0006lj-Cp
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 09:18:19 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKKhV-0006L6-JD
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 09:18:18 -0400
Received: by mail-ej1-x62f.google.com with SMTP id h9so24920346ejs.4
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 06:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IMGJAnCBy17Bl+LNhd+hg82SR0x76ir9YJlsz6w62FU=;
 b=GC96u3xtNMG59aqO/Vtiec+P6bscniEUG4mEZ90MUpYlQaXmk0Al8l08t+GS9vo0fF
 Yk7DTT2Lmqh4QXo3VTa3S01EtBbAKQrX+/xpwyiKPJGRNsuAT1gj2ngAyZwaV9lfQBZW
 pU46Oyz6f3E77BzSg3G0qlXGyS09WhOsnkRgow36wOuLFXB1Rvl7ynIegzPJ4m2va9JT
 U3e/fnKaXStbfsFCE0Z3ZP03Fw9xwt6pCM9H8G2vMyxp+iYO5ClEAfpBhQm9XGieeJzz
 a0NX6kKV8B78b2ZeQT/zJvQOm1ej7oCS507dahZdlC2ZvMOVtjCWHqimaDT1f+l7UJxs
 BcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IMGJAnCBy17Bl+LNhd+hg82SR0x76ir9YJlsz6w62FU=;
 b=BNMDZ3WQvrLCAf52UArj16DoO4D0zrxGmyA+R5QoyvXZyM/mt5kcvgeaQaS2rWOLiw
 gVitH4UN6Wo/sKmZpOxN8L1SkwnJr9ZNbaKZGD4TuAm2l+7F4pCjpFZKggE0WoH4O7Md
 9bGFqPjKV2jkBNUN7hwi2O/MlvVKusI1WYrOVLzrDjYk7ezrcObzYtsnTqzM4QLkmorO
 +lZYcrNP28w+0whA52f9f0/Hw1GoxDEpg5U3M71I/hmrX9qcFokSdeujBzifMIIdVEU+
 zZPGPdszq6hHCbJgZ5ZiUVNN4zyiAVZjsBiGYtmCMUAHBgSqyZQj5EMdSJ/pac03nUzV
 7rzg==
X-Gm-Message-State: AOAM532FFpZ4S0J/yfbiEvkEcNL8IIWvjm/8c6kUjLNwkHYAehumA5CE
 imOcv8kqzcaSHzoURR4fkkylhEePzuSH+v6uOe+heg==
X-Google-Smtp-Source: ABdhPJx/KKDx4j7JOy2eqL2JCtv0VrsBTDSHvbdTq4k72T6oBUkpDZOS+nLNmISp7cHav1Si+aYiuNiPuJnksTe6D1Y=
X-Received: by 2002:a17:907:923:: with SMTP id
 au3mr17934501ejc.482.1630243095623; 
 Sun, 29 Aug 2021 06:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210829100103.1950-1-mark.cave-ayland@ilande.co.uk>
 <20210829100103.1950-3-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210829100103.1950-3-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 29 Aug 2021 14:17:27 +0100
Message-ID: <CAFEAcA9WwdDfTAZDzseT4ox8z-BdEcdmFQ6Vn3JOoeF9Vu+6LQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] escc: fix R_STATUS channel reset value
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 29 Aug 2021 at 11:07, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> According to the "Z80X30 Register Reset Values" table in the ESCC datasheet
> bits 2 and 6 are set whilst bits 0 and 1 are cleared during channel reset.
> All other bits should be left unaltered.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/char/escc.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/hw/char/escc.c b/hw/char/escc.c
> index 63e0f15dfa..0f6957ba8b 100644
> --- a/hw/char/escc.c
> +++ b/hw/char/escc.c
> @@ -281,12 +281,11 @@ static void escc_reset_chn(ESCCChannelState *s)
>      s->wregs[W_MISC2] = MISC2_PLLDIS;
>      /* Enable most interrupts */
>      s->wregs[W_EXTINT] = EXTINT_DCD | EXTINT_SYNCINT | EXTINT_CTSINT |
> -        EXTINT_TXUNDRN | EXTINT_BRKINT;
> +                         EXTINT_TXUNDRN | EXTINT_BRKINT;

This indentation fix should probably have been in the
coding-style-fixes patch.

> +    s->rregs[R_STATUS] &= ~(STATUS_RXAV | STATUS_ZERO);
> +    s->rregs[R_STATUS] |= STATUS_TXEMPTY | STATUS_TXUNDRN;
>      if (s->disabled) {
> -        s->rregs[R_STATUS] = STATUS_TXEMPTY | STATUS_DCD | STATUS_SYNC |
> -            STATUS_CTS | STATUS_TXUNDRN;
> -    } else {
> -        s->rregs[R_STATUS] = STATUS_TXEMPTY | STATUS_TXUNDRN;
> +        s->rregs[R_STATUS] |= STATUS_DCD | STATUS_CTS;
>      }
>      s->rregs[R_SPEC] = SPEC_BITS8 | SPEC_ALLSENT;

We seem to use this function for both 'channel reset' and
'hardware reset' -- escc_reset just calls escc_reset_chn for
each channel, and is used as the DeviceState::reset as well
as for the 'hardware reset' you get by writing to WR9 with
both D6 and D7 set to 1.

Because we want this software-triggered 'hardware reset' to not
reset all registers to fixed values, I think we need to disentangle
the power-on reset DeviceState::reset so that power-on reset always
brings the device back to exactly the state that it has when QEMU
first starts.

thanks
-- PMM

