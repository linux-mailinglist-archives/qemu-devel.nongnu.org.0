Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A785B4AC3C9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:34:45 +0100 (CET)
Received: from localhost ([::1]:34994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH62O-0002JG-Jj
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:34:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH5Mt-000190-89
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:51:51 -0500
Received: from [2a00:1450:4864:20::334] (port=40757
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH5Mq-0002lX-1h
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:51:50 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso3383069wme.5
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 06:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C7B51Ayhz46IrlwdE1Qpqon4Rtz/DtnOSospTLTJqd4=;
 b=pTv8YMwWKzOpybwRi07uYGKLNW4/9vChexq0u6lx3xwvrmlS75+Jt4Dl2Wt2gsdR0U
 aL3hWbrSu9gyToCXHp+NDaArAoZRtPNz1b5CKWtTMonslDBxBQ3UNWqRJAhFbv32dfG/
 sfI75KqjNgOXEj6J95sbFqbh3BiQbjxR865QTGx0QD4U0vJ8AcHoqmhcepsB56FoU1kP
 yhSk6pYTIUIX/whwxwLQHw0nQm/cpDM0EMsRqtp9nTSS5GHWbAdOz5TEAzP1V0Yafhhs
 TMtz7egLLGl3Fp55CtpFhzvzj1fEtCdgLZBJNVI0nvNjFTPC1JeJGnqmEt6rUgND0Szp
 uLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C7B51Ayhz46IrlwdE1Qpqon4Rtz/DtnOSospTLTJqd4=;
 b=VAyWQS9YIdCoU1UHZrYtH5ZkdHCqF5Gwgd+2k4R0f/6nRaEkoo0JhnsJS5EsdYO5HQ
 7u58n9BBrLRT4sjFxvrs7K7akZMekredrEYr348MGKNes/PJeuUutwJqidVvMm/GOyRZ
 kULngdGtlUF16dYSaPJJtzR6WT4RrRPYflhAWhLZhYAPAiI893lYkVeCtggT0kUPeaNM
 NDra0v7Rq6AMiTn4RLOh1TVfhlIDUQydaLRXa+zRdu3ptKu7BgFLJ2wuNU1/Xde5LCCh
 MnKQh5s3RADa5N/ztWKH+maXg1uKjpz82h69TWPxrNcg1y2DoLB3ENx3nrL+Q4VMx585
 q3Hw==
X-Gm-Message-State: AOAM532UMgdUDiAt8wovbScTcwz9QUB+IoR6NtvuiyWjG7RYCnAUVRit
 yEK9QxbIQtcVc79c4jvcaGpSPOt3gTvY1OzdTBQNsw==
X-Google-Smtp-Source: ABdhPJxcG9hvTj8DiPjAFw/iX6OM61CXzN9WxW/hu53jnycVUYV18PUIqejzKGYF/ofTnIrgyqj7fQZF2RsREYqNetY=
X-Received: by 2002:a05:600c:3552:: with SMTP id
 i18mr14956851wmq.21.1644245506239; 
 Mon, 07 Feb 2022 06:51:46 -0800 (PST)
MIME-Version: 1.0
References: <20220124060449.22498-1-frank.chang@sifive.com>
In-Reply-To: <20220124060449.22498-1-frank.chang@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 14:51:35 +0000
Message-ID: <CAFEAcA9niv+SUJ+t1ewfYBj6R1ozFaFkxM3V+A2u8zAZmpBk=g@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: Correct card status clear conditions in SPI-mode
To: frank.chang@sifive.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 24 Jan 2022 at 06:09, <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> In SPI-mode, unlike SD-mode, card status bits: ILLEGAL_COMMAND and
> COM_CRC_ERROR have type C ("cleared by read") clear conditions.
> Also, type B ("cleared on valid command") clear condition is not
> supported in SPI-mode. As the "In idle state" bit in SPI-mode has type A
> ("according to current state") clear condition, the CURRENT_STATE bits
> in an SPI-mode response should be the SD card's state after the command
> is executed, instead of the state when it received the preceding
> command.
>
> This patch redefines the card status clear conditions used in SD-mode
> and SPI-mode according to SD spec.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

This looks mostly OK to me, but it does show up that we have a rather
odd way of implementing SPI mode. SPI mode's response word
is a different format to SD mode (it's 16 bits, not 32), but
we only report SD mode format status and require the device
model that's called us to do the conversion (hw/sd/ssi-sd.c
does this, for example).

> +static uint32_t sd_card_status_c(SDState *sd) {
> +    uint32_t sd_mask = R_CSR_AKE_SEQ_ERROR_MASK |
> +                       R_CSR_APP_CMD_MASK |
> +                       R_CSR_ERASE_RESET_MASK |
> +                       R_CSR_WP_ERASE_SKIP_MASK |
> +                       R_CSR_CSD_OVERWRITE_MASK |
> +                       R_CSR_ERROR_MASK |
> +                       R_CSR_CC_ERROR_MASK |
> +                       R_CSR_CARD_ECC_FAILED_MASK |
> +                       R_CSR_LOCK_UNLOCK_FAILED_MASK |
> +                       R_CSR_WP_VIOLATION_MASK |
> +                       R_CSR_ERASE_PARAM_MASK |
> +                       R_CSR_ERASE_SEQ_ERROR_MASK |
> +                       R_CSR_BLOCK_LEN_ERROR_MASK |
> +                       R_CSR_ADDRESS_ERROR_MASK |
> +                       R_CSR_OUT_OF_RANGE_MASK;
> +    uint32_t spi_mask = R_CSR_ERASE_RESET_MASK |
> +                        R_CSR_LOCK_UNLOCK_FAILED_MASK |
> +                        R_CSR_WP_ERASE_SKIP_MASK |
> +                        R_CSR_CSD_OVERWRITE_MASK |
> +                        R_CSR_ERROR_MASK |
> +                        R_CSR_CC_ERROR_MASK |
> +                        R_CSR_CARD_ECC_FAILED_MASK |
> +                        R_CSR_ILLEGAL_COMMAND_MASK |
> +                        R_CSR_COM_CRC_ERROR_MASK|
> +                        R_CSR_WP_VIOLATION_MASK |
> +                        R_CSR_ERASE_PARAM_MASK |
> +                        R_CSR_ERASE_SEQ_ERROR_MASK |
> +                        R_CSR_ADDRESS_ERROR_MASK |
> +                        R_CSR_OUT_OF_RANGE_MASK;
> +
> +    return !sd->spi ? sd_mask : spi_mask;
> +}

I feel like it ought to be possible to write this something like
  sd_mask = CARD_STATUS_C;
  if (sd->spi) {
      sd_mask |= CARD_STATUS_B;
  }

(ie all the SD mode status C bits are either not visible in
SPI mode or are status C, and all the status B bits in SD
mode should be status C.)

>  static void sd_set_cardstatus(SDState *sd)
>  {
> @@ -522,7 +548,7 @@ static void sd_response_r1_make(SDState *sd, uint8_t *response)
>      stl_be_p(response, sd->card_status);
>
>      /* Clear the "clear on read" status bits */
> -    sd->card_status &= ~CARD_STATUS_C;
> +    sd->card_status &= ~sd_card_status_c(sd);
>  }
>
>  static void sd_response_r3_make(SDState *sd, uint8_t *response)
> @@ -537,7 +563,7 @@ static void sd_response_r6_make(SDState *sd, uint8_t *response)
>      status = ((sd->card_status >> 8) & 0xc000) |
>               ((sd->card_status >> 6) & 0x2000) |
>                (sd->card_status & 0x1fff);
> -    sd->card_status &= ~(CARD_STATUS_C & 0xc81fff);
> +    sd->card_status &= ~(sd_card_status_c(sd) & 0xc81fff);
>      stw_be_p(response + 0, sd->rca);
>      stw_be_p(response + 2, status);
>  }
> @@ -1757,12 +1783,20 @@ int sd_do_command(SDState *sd, SDRequest *req,
>      if (rtype == sd_illegal) {
>          sd->card_status |= ILLEGAL_COMMAND;
>      } else {
> -        /* Valid command, we can update the 'state before command' bits.
> -         * (Do this now so they appear in r1 responses.)
> -         */
>          sd->current_cmd = req->cmd;
>          sd->card_status &= ~CURRENT_STATE;
> -        sd->card_status |= (last_state << 9);
> +
> +        if (!sd->spi) {
> +            /* Valid command, we can update the 'state before command' bits.
> +             * (Do this now so they appear in r1 responses.)
> +             */
> +            sd->card_status |= (last_state << 9);
> +        } else {
> +            /* Type B ("clear on valid command") is not supported
> +             * in SPI-mode.
> +             */
> +            sd->card_status |= (sd->state << 9);
> +        }

I think this is right, in that for SD mode we want these bits
to be "relating to previous command", and for SPI mode they
are going to end up being used by the caller to calculate the
Idle bit. But shouldn't the other bits that are type B for
SD mode also work this way? Either we're currently getting those
wrong in SD mode (returning the CRC-error/illegal-command state
for this command when we should be returning it for the previous
command), or we're getting it wrong still in SPI mode (returning
it for the previous command when it should be for this command)...

>      }
>
>  send_response:
> @@ -1811,7 +1845,7 @@ send_response:
>          /* Clear the "clear on valid command" status bits now we've
>           * sent any response
>           */
> -        sd->card_status &= ~CARD_STATUS_B;
> +        sd->card_status &= ~sd_card_status_b(sd);
>      }
>
>  #ifdef DEBUG_SD
> --
> 2.31.1

thanks
-- PMM

