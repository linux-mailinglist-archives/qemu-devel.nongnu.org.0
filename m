Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C773B3B44CC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:48:41 +0200 (CEST)
Received: from localhost ([::1]:55316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmCG-000099-TD
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwmAt-00073V-DO; Fri, 25 Jun 2021 09:47:15 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:38629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwmAr-0004Yu-HA; Fri, 25 Jun 2021 09:47:15 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id m9so4686310ybo.5;
 Fri, 25 Jun 2021 06:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=keeF0r9wwuoPu88ZxP9GQVYtgkHNs1BHeIhRT0tGbj0=;
 b=iNn0c92By5L9HI2WczWjblTOcshO1mefnHcHGbsOM+TFklfIyc9d1Tr7YTEc4y8Tqr
 fqW2Fa3mpWEMS2v3VcmktCKfQh/yf9jGedcXXS+CVsV1hVTNRXB7anWXsNX4SQJ2X8l3
 BgtOL6ivBsqb4SdehZB/88ldmLNFVlC0ytMBKHi1/0WUbxKM8oiICBa1fJdPjEBBZE2C
 4kkAN2QkBHKCrCD34JZw9M9o0LMBQFWfv9Q2254dkzmSfRPyZ7YaiGEK5Wp/4hhAse9/
 ng0mbPwhWPoh9CRbpUFa0bg3c7UFwSfyEHV5zjCOmbfUf9lUyWPL7GPRALeeqOQ8TE39
 BLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=keeF0r9wwuoPu88ZxP9GQVYtgkHNs1BHeIhRT0tGbj0=;
 b=iNmdosTfNF7avq2uocCMCSBBH+F1AViZZozV9BlzysL+e26BlDCSo+KEU1FGriKeWm
 gETRgScOwOpvVYsoScQAOlVs/enWwct38q9qfNz76NjuhBRYyzr2ZmbXWfOR/EIuLqPv
 r3ay42gzaz+vEeVGtxXtvCaajwtcq3mGNt7ZpHoSRM3kD5gRB+u3J5xdscR/Xasw0g52
 Tu6eP0OQETecalbEkmgqQq9UZzwaFelyK3M3J+c1BnUZ1nXmF5oqkTPr+jCVnyDun9dF
 t0lPwB0568ZqiOr4ZYBlNsIadsMtsb3jiJRugtwt7qfpAmkr8RpbruGJSLxvFbb9yoxv
 65CA==
X-Gm-Message-State: AOAM531+Ndi64lOftPz676mf3QJhESHPkUpWLPNXK32i1onqzY/mTcJL
 T3SIubXM8qEui4SW1hKhbSrGDtZ/NLHiJB++gEM=
X-Google-Smtp-Source: ABdhPJyaRV7wx3W8j6E0Z1KqFGvklzyBO1cEEGrG7DvlR9K2tAokkZ6it8ncqp4M4OLVJIkd1BkUympzvJuKJKhOYPE=
X-Received: by 2002:a25:be09:: with SMTP id h9mr13397583ybk.239.1624628832292; 
 Fri, 25 Jun 2021 06:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-6-f4bug@amsat.org>
In-Reply-To: <20210624142209.1193073-6-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 25 Jun 2021 21:47:01 +0800
Message-ID: <CAEUhbmUMeuirsW+kFrevJweBn4+d+7B+bXTk=i2Z+cG7fZeb6A@mail.gmail.com>
Subject: Re: [RFC PATCH 05/10] hw/sd: Add sd_cmd_illegal() handler
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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

On Thu, Jun 24, 2021 at 10:23 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Log illegal commands as GUEST_ERROR.
>
> Note: we are logging back the SDIO commands (CMD5, CMD52-54).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 57 ++++++++++++++++++++++--------------------------------
>  1 file changed, 23 insertions(+), 34 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index ce1eec0374f..0215bdb3689 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -965,6 +965,14 @@ static sd_rsp_type_t sd_invalid_state_for_cmd(SDStat=
e *sd, SDRequest req)
>      return sd_illegal;
>  }
>
> +static sd_rsp_type_t sd_cmd_illegal(SDState *sd, SDRequest req)
> +{
> +    qemu_log_mask(LOG_GUEST_ERROR, "%s: Unknown CMD%i\n",
> +                  sd->proto->name, req.cmd);
> +
> +    return sd_illegal;
> +}
> +
>  static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>  {
>      uint32_t rca =3D 0x0000;
> @@ -1017,15 +1025,10 @@ static sd_rsp_type_t sd_normal_command(SDState *s=
d, SDRequest req)
>          break;
>
>      case 1:    /* CMD1:   SEND_OP_CMD */
> -        if (!sd->spi)
> -            goto bad_cmd;
> -
>          sd->state =3D sd_transfer_state;
>          return sd_r1;
>
>      case 2:    /* CMD2:   ALL_SEND_CID */
> -        if (sd->spi)
> -            goto bad_cmd;
>          switch (sd->state) {
>          case sd_ready_state:
>              sd->state =3D sd_identification_state;
> @@ -1037,8 +1040,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
>          break;
>
>      case 3:    /* CMD3:   SEND_RELATIVE_ADDR */
> -        if (sd->spi)
> -            goto bad_cmd;
>          switch (sd->state) {
>          case sd_identification_state:
>          case sd_standby_state:
> @@ -1052,8 +1053,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
>          break;
>
>      case 4:    /* CMD4:   SEND_DSR */
> -        if (sd->spi)
> -            goto bad_cmd;
>          switch (sd->state) {
>          case sd_standby_state:
>              break;
> @@ -1063,9 +1062,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
>          }
>          break;
>
> -    case 5: /* CMD5: reserved for SDIO cards */
> -        return sd_illegal;
> -
>      case 6:    /* CMD6:   SWITCH_FUNCTION */
>          switch (sd->mode) {
>          case sd_data_transfer_mode:
> @@ -1081,8 +1077,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
>          break;
>
>      case 7:    /* CMD7:   SELECT/DESELECT_CARD */
> -        if (sd->spi)
> -            goto bad_cmd;
>          switch (sd->state) {
>          case sd_standby_state:
>              if (sd->rca !=3D rca)
> @@ -1212,8 +1206,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
>          break;
>
>      case 15:   /* CMD15:  GO_INACTIVE_STATE */
> -        if (sd->spi)
> -            goto bad_cmd;
>          switch (sd->mode) {
>          case sd_data_transfer_mode:
>              if (sd->rca !=3D rca)
> @@ -1320,8 +1312,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
>          break;
>
>      case 26:   /* CMD26:  PROGRAM_CID */
> -        if (sd->spi)
> -            goto bad_cmd;
>          switch (sd->state) {
>          case sd_transfer_state:
>              sd->state =3D sd_receivingdata_state;
> @@ -1466,15 +1456,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd=
, SDRequest req)
>          }
>          break;
>
> -    case 52 ... 54:
> -        /* CMD52, CMD53, CMD54: reserved for SDIO cards
> -         * (see the SDIO Simplified Specification V2.0)
> -         * Handle as illegal command but do not complain
> -         * on stderr, as some OSes may use these in their
> -         * probing for presence of an SDIO card.
> -         */
> -        return sd_illegal;
> -
>      /* Application specific commands (Class 8) */
>      case 55:   /* CMD55:  APP_CMD */
>          switch (sd->state) {
> @@ -1515,19 +1496,12 @@ static sd_rsp_type_t sd_normal_command(SDState *s=
d, SDRequest req)
>          break;
>
>      case 58:    /* CMD58:   READ_OCR (SPI) */
> -        if (!sd->spi) {
> -            goto bad_cmd;
> -        }
>          return sd_r3;
>
>      case 59:    /* CMD59:   CRC_ON_OFF (SPI) */
> -        if (!sd->spi) {
> -            goto bad_cmd;
> -        }
>          return sd_r1;
>
>      default:
> -    bad_cmd:
>          qemu_log_mask(LOG_GUEST_ERROR, "SD: Unknown CMD%i\n", req.cmd);
>          return sd_illegal;
>      }
> @@ -2114,10 +2088,25 @@ void sd_enable(SDState *sd, bool enable)
>
>  static const SDProto sd_proto_spi =3D {
>      .name =3D "SPI",
> +    .cmd =3D {
> +        [2 ... 4]   =3D sd_cmd_illegal,
> +        [5]         =3D sd_cmd_illegal,

Above 2 can be merged into [2 ... 5]

> +        [7]         =3D sd_cmd_illegal,
> +        [15]        =3D sd_cmd_illegal,
> +        [26]        =3D sd_cmd_illegal,
> +        [52 ... 54] =3D sd_cmd_illegal,
> +    },
>  };
>
>  static const SDProto sd_proto_sd =3D {
>      .name =3D "SD",
> +    .cmd =3D {
> +        [1]         =3D sd_cmd_illegal,
> +        [5]         =3D sd_cmd_illegal,
> +        [52 ... 54] =3D sd_cmd_illegal,
> +        [58]        =3D sd_cmd_illegal,
> +        [59]        =3D sd_cmd_illegal,
> +    },
>  };
>
>  static void sd_instance_init(Object *obj)

Otherwise LGTM:
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

