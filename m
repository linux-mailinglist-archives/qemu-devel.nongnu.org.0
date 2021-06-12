Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75323A4DDF
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 11:21:36 +0200 (CEST)
Received: from localhost ([::1]:39016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrzpd-00088A-NF
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 05:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lrzoO-0007MX-HQ
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 05:20:16 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lrzoM-0004g9-B8
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 05:20:16 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c5so8541289wrq.9
 for <qemu-devel@nongnu.org>; Sat, 12 Jun 2021 02:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9Fx5sFAY3EeDLvYctWXzDPghSOMEO7BXtFV6Yw/t8rU=;
 b=Fj+tAG1zy1IgsQbcn3E7IYITNCO3LicgbsgvYC1+jsjs/0v1qhEHwqvPLZkTB/ZXbs
 mxbjzr5f11ZndawAjuAuiJurnDOewV4vhk9kF5U/MswnXTs8V2D5auHMK3qmr4DbEs+R
 t+trSRpz9BIujHXw3yhhRT7J6P9JnSBO9gFvs48Qc9S6uk8x27OakC3VVngrGwfmwa/f
 W83aBZBbrj8JpwnsMp31M4bEktxjw8RXmWhOyakWOTA50VXADJ/N+cyDVKbN+G1O+cmr
 P0KZVcahofKE6TKgYpeWxMBtCoxuO5Hu7zSK5WZeQbByqdcXagMmB9pvyD2liJ0CFAbA
 ANWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Fx5sFAY3EeDLvYctWXzDPghSOMEO7BXtFV6Yw/t8rU=;
 b=PRuHJIJrtaH6OkPJ41C0a/6ye3FZseYFfvb1KpnuC+adHhbIkXcFVZ2UzYIbO0ETkX
 vhTZVlCj510ERG+6V31wldk2nK4/8YOJljNt6f9kbNsqVA7G4pBmHoWrvjrww3+4lWTr
 RSQQYbAqq1gZAk3W+bN+PHsxQtXXacYDPwYGawyyVu4DGM+2uUzSJ1VHHFUVBsWHKzZH
 0lekhKJYRlapX5Tvh8t17gUyg/xNoYDsza1JIIZELRYzkek+2iho32wEFNSPRrU06Xng
 4pHLiU1epUYqhMEKiyrJb/Fmdpu5VKJM2/zbay4CKp9G2qHyxojJWAOEUlPxcnQoiAbm
 Zm5g==
X-Gm-Message-State: AOAM530Gh8Dk/kRIHi7G8lCUWYBsnoJvinbQdY+x1gIca8L5GbLflH8A
 q/uPqpW+nD2XKkYd/s9H2Zg=
X-Google-Smtp-Source: ABdhPJy3wwUCN5Iz4KWfJJ4aj/0Rts445sOaWfeSJ1C0wc3PKp8FGg7P2I4zKDBksxj8TnOgFb5WvA==
X-Received: by 2002:a05:6000:1acd:: with SMTP id
 i13mr8013609wry.327.1623489612204; 
 Sat, 12 Jun 2021 02:20:12 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id m23sm8531664wmc.29.2021.06.12.02.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jun 2021 02:20:11 -0700 (PDT)
Subject: Re: [PATCH] Fix assertion failure in lsi53c810 emulator
To: qemu-devel@nongnu.org, Liu Cyrus <cyruscyliu@gmail.com>
References: <CAAKa2jn2vwC6oZtrL6CtbQ5U7r7tS4GXmmALjCMSby6KiupeAQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b91537e4-5a6d-caa1-d946-8f215fe57093@amsat.org>
Date: Sat, 12 Jun 2021 11:20:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAAKa2jn2vwC6oZtrL6CtbQ5U7r7tS4GXmmALjCMSby6KiupeAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheolwoo Myung <cwmyung@snu.ac.kr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/12/21 8:24 AM, Liu Cyrus wrote:
> Hi folks, this is a suggestion for fixing this bug.
> I'm willing to discuss this with you because I'm new to contribute to
QEMU.

Thanks for your fix!

You didn't Cc'ed the maintainers of the SCSI subsystem (see
https://wiki.qemu.org/Contribute/SubmitAPatch#CC_the_relevant_maintainer
) so I'm doing it for you:

  $ ./scripts/get_maintainer.pl -f hw/scsi/lsi53c895a.c
  Paolo Bonzini <pbonzini@redhat.com> (supporter:SCSI)
  Fam Zheng <fam@euphon.net> (reviewer:SCSI)

>
> Best,
> Qiang Liu

> From: cyruscyliu <cyruscyliu@gmail.com <mailto:cyruscyliu@gmail.com>>
> 
> An assertion failure can be triggered in the lsi53c810 emulator by a guest
> when ((s->sstat1 & 0x7) == PHASE_DO) || (s->sstat1 & 0x7) == PHASE_DI))
> && (!s->current) holds.
> Check s->sstat1 and s->current in lsi_reg_writeb before lsi_execute_script()
> to discard this MMIO write.
> 
> Fixes: 7d8406be69ce ("PCI SCSI HBA emulation.")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/305
> <https://gitlab.com/qemu-project/qemu/-/issues/305>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1908515
> <https://bugs.launchpad.net/qemu/+bug/1908515>

It seems you didn't send your patch with the proper tool, see
https://wiki.qemu.org/Contribute/SubmitAPatch#Use_git_format-patch

Please also mention the reporter:

  Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>

> Signed-off-by: cyruscyliu <cyruscyliu@gmail.com
> <mailto:cyruscyliu@gmail.com>>

Also your git-config is missing your name. Fixable using:

  $ git config user.name "Liu Cyrus"

for your QEMU repository, or globally:

  $ git config --global user.name "Liu Cyrus"

> ---
>  hw/scsi/lsi53c895a.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index e2c1918..5c08f7f 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -1919,6 +1919,10 @@ static void lsi_reg_writeb(LSIState *s, int
> offset, uint8_t val)
>              lsi_update_irq(s);
>          }
>          if (s->waiting == LSI_WAIT_RESELECT && val & LSI_ISTAT0_SIGP) {
> +            if (!(((((s->sstat1 & 0x7) == PHASE_DO)
> +                    || (s->sstat1 & 0x7) == PHASE_DI))
> +                    && s->current))
> +                break;
>              trace_lsi_awoken();
>              s->waiting = LSI_NOWAIT;
>              s->dsp = s->dnad;
> @@ -1980,8 +1984,13 @@ static void lsi_reg_writeb(LSIState *s, int
> offset, uint8_t val)
>           * instruction.  Is this correct?
>           */
>          if ((s->dmode & LSI_DMODE_MAN) == 0
> -            && (s->istat1 & LSI_ISTAT1_SRUN) == 0)
> +                && (s->istat1 & LSI_ISTAT1_SRUN) == 0) {
> +            if (!(((((s->sstat1 & 0x7) == PHASE_DO)
> +                    || (s->sstat1 & 0x7) == PHASE_DI))
> +                    && s->current))

Instead of duplicating multiple times the same complex code, you could
add an helper once and call it. Something like:

  static bool can_execute(LSIState *s)
  {
      if (!s->current) {
          return false;
      }
      switch (s->sstat1 & 0x7) {
          case PHASE_DO:
          case PHASE_DI:
              return true;
          default:
              return false;
      }
  }

which is while being more verbose, is easier to read.

Then you could use:

  if (!can_execute(s)) {
    ...
  }

> +                break;
>              lsi_execute_script(s);
> +        }
>          break;
>      CASE_SET_REG32(dsps, 0x30)
>      CASE_SET_REG32(scratch[0], 0x34)
> @@ -2001,8 +2010,13 @@ static void lsi_reg_writeb(LSIState *s, int
> offset, uint8_t val)
>           * FIXME: if s->waiting != LSI_NOWAIT, this will only execute one
>           * instruction.  Is this correct?
>           */
> -        if ((val & LSI_DCNTL_STD) && (s->istat1 & LSI_ISTAT1_SRUN) == 0)
> +        if ((val & LSI_DCNTL_STD) && (s->istat1 & LSI_ISTAT1_SRUN) == 0) {
> +            if (!(((((s->sstat1 & 0x7) == PHASE_DO)
> +                    || (s->sstat1 & 0x7) == PHASE_DI))
> +                    && s->current))
> +                break;
>              lsi_execute_script(s);
> +        }
>          break;
>      case 0x40: /* SIEN0 */
>          s->sien0 = val;
> --
> 2.7.4

However back to the bug you are trying to fix, I wonder if your check
is correct regarding the hardware we are modelling. Have you looked
at the specifications? See https://docs.broadcom.com/doc/12352475
Chapter 5.3 Block Move Instruction (from SCSI SCRIPTS Instruction Set),
"DMA Command" register.

Why are we reaching these places with s->current == NULL in the first
place? We are probably missing something earlier.

Regards,

Phil.

