Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5801C370F20
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 22:48:53 +0200 (CEST)
Received: from localhost ([::1]:37352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldJ1H-00031D-UW
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 16:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldIzc-0001wt-Ry
 for qemu-devel@nongnu.org; Sun, 02 May 2021 16:47:08 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:41612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldIzS-0008Rd-Ij
 for qemu-devel@nongnu.org; Sun, 02 May 2021 16:47:08 -0400
Received: by mail-ej1-x633.google.com with SMTP id zg3so4912195ejb.8
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 13:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IZpRMhYriCArTic1oG4iRqGc+5388FGmmHJoIBEzmMA=;
 b=BEFfzu9XBymiw7DElN+jrP9/BXWaBHeTF2dCgOp4RcthLwpUXkRj2cYW0gRY65cT6u
 QhyuiXU00Fj9s46wtsukfc9urmIoI57JWq/h5k7lX5fRsS0gU3sN5vc57fezIjqIm+xo
 IAG5q+vruOOWT0yL7NSZubm6fy6Kfh6SKbLsIgDv5OViTbdX+pJN/jvEsH2kQk0EV56e
 8dyz0L5DH+LCApFEu1vz29MFyWYkI/d/nJiJYkS5wOvKSMDbGDDp6ZNmaoWFaVd2jCbL
 hb6o9EnfUahQirl98PWmkUKKcyAJPbdUVpWLOcwgVo2avxUtSnKStn+07b9SVXCYStp5
 rFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IZpRMhYriCArTic1oG4iRqGc+5388FGmmHJoIBEzmMA=;
 b=GBSpqDUWIGKGu6ZKrTxNbLztlXiZUpa6gusj7h0iu8qG8r4lKVIbMIW6ogyylMJT/5
 pSrbdapvxx0piBd0NDD/3Do2gVCQjhcx4vu5OHeV2HapahqBfDoFbyx5Cs193paLrrIb
 XY9mdMD+FLL9viLrGyhGsjSjkMNiUmEfWTeWU6whl9QNuOtyhK992RB2OWMXwm8Q4R30
 5OoumS9bFhyaN7reRCv7SofeHtLQXUIII4hq/5vTa2lEnsYDZ2sH5ypQynzA9gPDEuk3
 PnEwZB7ZmJS8t+g7bM0FdD6+oHE0P6qoWXKH8/SG1XnVPZfzop0pUcmBNgXM67M5xwmO
 6UjA==
X-Gm-Message-State: AOAM531Ouumf3BrdNHIzqjHVmZVNPpJusyuOXc/cxHT7btwtMY71kssL
 46MDEhH1EIbGxJmdeXI+tHFiJ/f4o9igzQ9feP1G1A==
X-Google-Smtp-Source: ABdhPJwmR7T2MnEzcsdBiKNhur2K5EvRQA5fQawboe8PftWpfzNrQXTHY49DFExDOzYS0kRBIQ7J8d7kTGu0XgeUFeA=
X-Received: by 2002:a17:906:953:: with SMTP id
 j19mr13908931ejd.56.1619988412098; 
 Sun, 02 May 2021 13:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210502203121.630944-1-f4bug@amsat.org>
 <20210502203121.630944-3-f4bug@amsat.org>
In-Reply-To: <20210502203121.630944-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 2 May 2021 21:45:47 +0100
Message-ID: <CAFEAcA_V6bM-UtEmF1a7_7Jad88aZ2J-dGpSs=cs+smvYEaV3g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/pci-host/raven: Manually reset the OR_IRQ device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 2 May 2021 at 21:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The OR_IRQ device is bus-less, thus isn't reset automatically.
> Add the raven_pcihost_reset() handler to manually reset the OR IRQ.
>
> Fixes: f40b83a4e31 ("40p: use OR gate to wire up raven PCI interrupts")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/pci-host/prep.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
> index 0a9162fba97..7481bbf99d4 100644
> --- a/hw/pci-host/prep.c
> +++ b/hw/pci-host/prep.c
> @@ -230,6 +230,15 @@ static void raven_change_gpio(void *opaque, int n, i=
nt level)
>      s->contiguous_map =3D level;
>  }
>
> +static void raven_pcihost_reset_enter(Object *obj, ResetType type)
> +{
> +    PREPPCIState *s =3D RAVEN_PCI_HOST_BRIDGE(obj);
> +
> +    if (!s->is_legacy_prep) {
> +        device_cold_reset(DEVICE(&s->or_irq));
> +    }
> +}
> +
>  static void raven_pcihost_realizefn(DeviceState *d, Error **errp)
>  {
>      SysBusDevice *dev =3D SYS_BUS_DEVICE(d);
> @@ -419,11 +428,13 @@ static Property raven_pcihost_properties[] =3D {
>  static void raven_pcihost_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
>
>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>      dc->realize =3D raven_pcihost_realizefn;
>      device_class_set_props(dc, raven_pcihost_properties);
>      dc->fw_name =3D "pci";
> +    rc->phases.enter =3D raven_pcihost_reset_enter;
>  }

Why does this device have an OR gate rather than having its
map_irq function say "all PCI IRQs go to interrupt 0" ?
(The PCI core code provides you the "OR" functionality for
free, because it has to do that anyway for when multiple PCI
cards share a PCI IRQ -- see pci_change_irq_level() and
pci_bus_change_irq_level().

Supplementary question: why does the legacy_prep setup create 4
outbound sysbus IRQs when the map_irq function can only ever
return 0 or 1 ?

thanks
-- PMM

