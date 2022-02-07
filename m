Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4F54AC518
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:13:35 +0100 (CET)
Received: from localhost ([::1]:50426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH6dy-00010M-91
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:13:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH5id-0005c2-Oe
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:14:19 -0500
Received: from [2a00:1450:4864:20::435] (port=33723
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH5iZ-0006OE-Ui
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:14:19 -0500
Received: by mail-wr1-x435.google.com with SMTP id e3so11435836wra.0
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 07:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=srncNjRPsfzQI8Tg/sJJEsr9anCuPPabe1mOZNWvc0Y=;
 b=Sx6u7/nVFswNGIIRv8XsU5WtpaTi6qfggqHuCtBDLfc9qYNmNMCf2RgqRvRHlg0HRb
 DYoJFoFX86Vk4+Ehiq09pX1vzyyLOb5CIOwbY1K/7DzhjvWGRo97dXVQvNVJvhd0jh8v
 IkO4PNrefODWy2o6Fi1my1b4B1fmmjxEnisLW5fwpVX+XFPMDRLqu4BjG7Fmu5dvgv87
 pNt1/SSBynCbdBtcAeFNUWBSPAhi6hoCJghUvDT7G8I1X+i+R7aGTGltw07h4lZsescH
 Dd2Nmhv3gcSrIKvHvw63V9T/934Kwk+qYOxEIcRF4HXqLptdlYMeXPUEj5s+ZXomLUaD
 dxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=srncNjRPsfzQI8Tg/sJJEsr9anCuPPabe1mOZNWvc0Y=;
 b=L+E0zTUh6B5Q9lRBfSyYQ77yFp7dcn/9PFxB4iB3mxwav4nBIHmXdS0lv4ISHHzRqM
 za5+kgcmJEM894CTF+YrBaRktvrB0yolfOuWyHDcgNHyIvVRfE5VY55vKyxoWt6Xl/L+
 62PdRVe2+UII+SsiUEqLAbuGcZstFw4g3HcvuREUU9jHoebC/t+JhmMMlvUHYMT12m49
 x7m9tv7koKvA63MKwPP0966PDQDzvuOfHmq4UlOZ461dTtTBRNgQRjDlBE5qx9cURr4i
 P58c4zMq3y8PaImTupAaMLFhlh6LO5xCWYNH1hN0jiFAZA5vkIcw/ygthFH6K7MDdQAQ
 LTfg==
X-Gm-Message-State: AOAM5331X1R7q/lXkkSlBTA4IevUU9mOLG1zgFwcNbFimyeRE5tMBbb1
 9FWUZSrl3ywn3dEIP1bjdDsrRxWtuWZMe95c0RQ0dw==
X-Google-Smtp-Source: ABdhPJzsaQtgJFwKHuBvtltmUCnmHj8xlEHpkYwl07sd0UDAJ8LfFmjdAUJiNEf2jumLF1gTfEP2m7avyFxnVuMBIHU=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr7816559wrs.295.1644246845089; 
 Mon, 07 Feb 2022 07:14:05 -0800 (PST)
MIME-Version: 1.0
References: <20220126031345.3372-1-frank.chang@sifive.com>
In-Reply-To: <20220126031345.3372-1-frank.chang@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 15:13:54 +0000
Message-ID: <CAFEAcA-QHzKpJhcB=pbXmGC4OSKnYO4p1nEyWqWf8HD08Cr0Cw@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: Correct CMD58's R3 response "in idle state" bit in
 SPI-mode
To: frank.chang@sifive.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Jan 2022 at 03:13, <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> In SPI-mode, CMD58 returns R3 response with the format:
>
> 39          32 31                                  0
> +------------+ +-----------------------------------+
> |     R1     | |                OCR                |
> +------------+ +-----------------------------------+
>
> Where R1 has bits[0] indicating whether SD card is "in idle state".
> However, according to SD card state transition table, CMD58 can only be
> transited from trans to data state, which the "in idle state" bit should
> not be set in CMD58's R3 response.
> (But CMD8 should still have "in idle state" bit to be set in its
> R7 response because it can only be transited from idle to idle state.)
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  hw/sd/ssi-sd.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> index 167c03b780..7faa969e82 100644
> --- a/hw/sd/ssi-sd.c
> +++ b/hw/sd/ssi-sd.c
> @@ -176,12 +176,17 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>                  s->arglen = 1;
>                  s->response[0] = 4;
>                  DPRINTF("SD command failed\n");
> -            } else if (s->cmd == 8 || s->cmd == 58) {
> -                /* CMD8/CMD58 returns R3/R7 response */
> -                DPRINTF("Returned R3/R7\n");
> +            } else if (s->cmd == 8) {
> +                /* CMD8 returns R7 response */
> +                DPRINTF("Returned R7\n");
>                  s->arglen = 5;
>                  s->response[0] = 1;
>                  memcpy(&s->response[1], longresp, 4);
> +            } else if (s->cmd == 58) {
> +                /* CMD58 returns R3 response */
> +                DPRINTF("Returned R3\n");
> +                s->arglen = 5;
> +                memcpy(&s->response[1], longresp, 4);
>              } else if (s->arglen != 4) {
>                  BADF("Unexpected response to cmd %d\n", s->cmd);
>                  /* Illegal command is about as near as we can get.  */

This demonstrates a problem with trying to implement SPI mode
as "SD mode but the controller has to fix up the differences".
Here CMD8 and CMD58 in SPI mode are supposed to return
5 bytes of data, of which one byte is format-R1 status information.
But our SD card emulation returns SD mode R3 or R7 format,
which don't include that information. In the current code
in ssi-sd.c, which this patch is tweaking, we try to fake up a
status byte. However, this isn't going to have the right behaviour,
because this should count as a read that clears the "clear on read"
status bits, and faking up the response byte won't do that.

(For that matter, presumably the clear-on-read bits that are
only present in the R2 2-byte response should not be cleared
when the SPI command gets a 1-byte R1 response. I think
that the other patch you've sent won't do that.)

That all leaves me wondering if what we should really do here
is make sd.c's SPI mode actually change the format of
responses, rather than leaving it to the controller to try
to do that. (This would also be useful if in future we need to
model more than one controller that puts the card in SPI mode.)

Side note, in sd.c sd_normal_command() we "return sd_r3" for
the cmd58 case, so I think this will cause us to actually send
the OCR data rather than the voltage-status data...

thanks
-- PMM

