Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E9D36A8D8
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 20:40:01 +0200 (CEST)
Received: from localhost ([::1]:50062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lajfk-0006b9-5P
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 14:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lajd3-0005AP-Qs
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 14:37:13 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:33546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lajd2-0001tG-9j
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 14:37:13 -0400
Received: by mail-ej1-x631.google.com with SMTP id g5so74348799ejx.0
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 11:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a10iXpHggY1pPFPu4cpj6hoidaqPYdTsUtgMEkNcZZg=;
 b=YHMql7aiYthLz3cXHenjBtJLYsUX71VLKWi9X2/EPYWSE9L9Y7x6sPJlZeHkOFMN+Y
 epAqzvoTKIp+kektTW6oY0/a1tS9D3PiRYgEB5+2cckv+mOtNH1IBfTn5+UkZ1tf3+Ag
 KfTt3YiGPuUoI7t+/g565y0mc3ExFgQ/2WjReTMabbZnfoHB3l+94ZT/L1QVNsEPfl1u
 nDxd+3mtQaI14PLUuiE+ACM1+6E1S/yfDaEq24KqM0kykrWg20t9EYWwI3uJaNUdgCTF
 VsCk3DASV3CLgpZgRxupSErXCczudI7Qveq/EhFyDlBkPoCqWb+xXeDEDgSEppdSSPa7
 n3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a10iXpHggY1pPFPu4cpj6hoidaqPYdTsUtgMEkNcZZg=;
 b=qjgEzYchiRbiDkj58pQI6yi6bQq5ZYZiRmgO7fulE5XDm5fNlZMJlslxW7mR2zMo8S
 p6+aFP31UZRAGb0iOFRAJAmOamfhINWSXoYEcT2Jk6jFL5leef2Y6oaGkfsfOzK333dN
 eLiStB7Ax/k+6pWrlRc8DBNwwUtorrPLVoAf4tqnwDlPRPmBv5AdpiSIg0Jw4l1fnM0c
 ovSYzR7WEPdeuUkbANuwwlS/cdgTtgXCDerT0qBMKvLxhG19sJst6UEUaqt+Hr1y8E57
 8OxClLDMQt+KAkhziDYk3Ar7WUnxn+t6H9Z8gPoIZJOuKJf3BCd/B8hWB4MUFikUNKFt
 HyMg==
X-Gm-Message-State: AOAM530VHzBdSSGRCXXsYwcCjfsOcLddEVbClgkW/L79HDw3ibCJc9J1
 OGyze7nOQtaHoyD7DYOBetMj/eRu93V9MNG6hJPo/Q==
X-Google-Smtp-Source: ABdhPJxkOmwnRAFxtBjIHchKJgkizyxE5o3yfnn8ykHe+K7f5+J1AEw1ceG68O7WP6+KIdWtvwkHzaAaEnTe1n/oI4M=
X-Received: by 2002:a17:906:29ca:: with SMTP id
 y10mr15133614eje.250.1619375830691; 
 Sun, 25 Apr 2021 11:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210424162229.3312116-1-f4bug@amsat.org>
 <20210424162229.3312116-3-f4bug@amsat.org>
In-Reply-To: <20210424162229.3312116-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Apr 2021 19:36:13 +0100
Message-ID: <CAFEAcA8=YAABLQL+n1gDXafhoZeUo9emmjCmi_BTqvH=3NS6GA@mail.gmail.com>
Subject: Re: [PATCH 2/5] hw/pcmcia/microdrive: Register machine reset handler
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 24 Apr 2021 at 17:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The abstract PCMCIA_CARD is a bus-less TYPE_DEVICE, so devices
> implementing it are not reset automatically.
> Register a reset handler so children get reset on machine reset.
>
> Note, the DSCM-1XXXX device (TYPE_DSCM1XXXX) which inherits
> TYPE_MICRODRIVE and PCMCIA_CARD reset itself when a disk is
> attached or detached, but was not resetting itself on machine
> reset.
>
> It doesn't seem to be an issue because it is that way since the
> device QDev'ifycation 8 years ago, in commit d1f2c96a81a
> ("pcmcia: QOM'ify PCMCIACardState and MicroDriveState").
> Still, correct to have a proper API usage.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/pcmcia/pcmcia.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/hw/pcmcia/pcmcia.c b/hw/pcmcia/pcmcia.c
> index 03d13e7d670..73656257227 100644
> --- a/hw/pcmcia/pcmcia.c
> +++ b/hw/pcmcia/pcmcia.c
> @@ -6,14 +6,39 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/module.h"
> +#include "sysemu/reset.h"
>  #include "hw/pcmcia.h"
>
> +static void pcmcia_card_reset_handler(void *dev)
> +{
> +    device_legacy_reset(DEVICE(dev));
> +}
> +
> +static void pcmcia_card_realize(DeviceState *dev, Error **errp)
> +{
> +    qemu_register_reset(pcmcia_card_reset_handler, dev);
> +}
> +
> +static void pcmcia_card_unrealize(DeviceState *dev)
> +{
> +    qemu_unregister_reset(pcmcia_card_reset_handler, dev);
> +}

Why isn't a pcmcia card something that plugs into a bus ?

-- PMM

