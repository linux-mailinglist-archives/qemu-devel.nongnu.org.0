Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A713B44D4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:50:59 +0200 (CEST)
Received: from localhost ([::1]:58824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmEU-0002cR-7P
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwmDF-0001FY-Kh; Fri, 25 Jun 2021 09:49:43 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:44603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwmD9-0005eh-VY; Fri, 25 Jun 2021 09:49:41 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id p133so4700300yba.11;
 Fri, 25 Jun 2021 06:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C5YSSCHGDPYX1vmL/HfrCMJzr81/PmR/Gl4/dPxCEMk=;
 b=jHYicn+8ynGycC897ti0O3KDL96xsYKYyz/bVlAnP6/rryrfUnuU+HyvK1mAYORGOg
 Fme8k8f2gig2zStAjZNVr0TVxX5oLdhydCeSEDl5cnDJanyzfiWPb4OFHAhwBhqyY+q4
 ezmURyMgShRqLiMnHMqgf3yCKVCXXl2d6MVii1r4c6+mdiX/MUz2pRRp5hHv1TnFyGJY
 s7k2t5qdKXROcY8AjZH3Z2Jtuz5gJbMSPR0JwgmLUQUVo9V8dHb9Z1ARTI2b+YvKJMcG
 LYbVsxXqVB2l/boZKdy2pZHjLoknoHQDsv+tPXMsdsTdMRylkirw1OY0EBCYhFbsj7TA
 eyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C5YSSCHGDPYX1vmL/HfrCMJzr81/PmR/Gl4/dPxCEMk=;
 b=reqYo2mLoMfc7I3SnyqCRH02BG14fQTMCTrHIKnMEomaGHteDHKZDxnNjCIUPfpa73
 6S3z5MmxIESfJSPdLfcPIBM5cn1JUrEq5vaOlM6n2J8MZLlNay//+fRwQv51UMYMV61j
 uCrF066MB7aNhD3xwqF4tnTif+yh4+nJI3V3LJmJpj1jkuHC+0Z90GxVunB2Xc1BM4ei
 XO3p6P6yQX4fBh1Z/Om04okWmakkwRl4HxDWMiXwTnNEHovWlG4uSikK4/VmQCh1VkKS
 9Ypxvh4Lc8WZu+wj19CAGgcVhtbcf4t5LANMsc6UPD9vdF8loj3Ymg6z0FJGc73+34Rj
 819g==
X-Gm-Message-State: AOAM532TBCUzDpbxKHX9ge3zRv1niBvXOoUvoOxp6IA8HRp5XnXS8MpZ
 dhWvTTlI1AvOD3VQu4nR2r4ip9Lft5hrET1fB1U=
X-Google-Smtp-Source: ABdhPJx137g0mnnIFpa3yQmHQFCn6ejc+Xxbxkef7pc65Horu6bMBI2jSZEKwaPpGR+nFGwN37On3QVGdDy2PIuDHZ4=
X-Received: by 2002:a25:ac86:: with SMTP id x6mr12119158ybi.314.1624628974653; 
 Fri, 25 Jun 2021 06:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-7-f4bug@amsat.org>
In-Reply-To: <20210624142209.1193073-7-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 25 Jun 2021 21:49:23 +0800
Message-ID: <CAEUhbmW+k+voLnqx8-3Y53-y=OYNPbVeQ8h-6kZ+Y=gfcdjyfA@mail.gmail.com>
Subject: Re: [RFC PATCH 06/10] hw/sd: Add sd_cmd_unimplemented() handler
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 24, 2021 at 10:28 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 0215bdb3689..2647fd26566 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -973,6 +973,15 @@ static sd_rsp_type_t sd_cmd_illegal(SDState *sd, SDR=
equest req)
>      return sd_illegal;
>  }
>
> +/* Commands that are recognised but not yet implemented. */
> +static sd_rsp_type_t sd_cmd_unimplemented(SDState *sd, SDRequest req)
> +{
> +    qemu_log_mask(LOG_UNIMP, "%s: CMD%i not implemented\n",
> +                  sd->proto->name, req.cmd);
> +
> +    return sd_illegal;
> +}
> +
>  static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>  {
>      uint32_t rca =3D 0x0000;
> @@ -1522,9 +1531,6 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
>
>      switch (req.cmd) {
>      case 6:    /* ACMD6:  SET_BUS_WIDTH */
> -        if (sd->spi) {
> -            goto unimplemented_spi_cmd;
> -        }
>          switch (sd->state) {
>          case sd_transfer_state:
>              sd->sd_status[0] &=3D 0x3f;
> @@ -1655,12 +1661,6 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
>      default:
>          /* Fall back to standard commands.  */
>          return sd_normal_command(sd, req);
> -
> -    unimplemented_spi_cmd:
> -        /* Commands that are recognised but not yet implemented in SPI m=
ode.  */
> -        qemu_log_mask(LOG_UNIMP, "SD: CMD%i not implemented in SPI mode\=
n",
> -                      req.cmd);
> -        return sd_illegal;
>      }
>
>      qemu_log_mask(LOG_GUEST_ERROR, "SD: ACMD%i in a wrong state\n", req.=
cmd);
> @@ -2096,6 +2096,9 @@ static const SDProto sd_proto_spi =3D {
>          [26]        =3D sd_cmd_illegal,
>          [52 ... 54] =3D sd_cmd_illegal,
>      },
> +    .cmd =3D {
> +        [6]         =3D sd_cmd_unimplemented,
> +    },
>  };

Does this compile? Or is this another GCC extension to C?

But I think you wanted to say .acmd =3D ?

Regards,
Bin

