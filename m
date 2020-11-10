Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460972ADA71
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:31:56 +0100 (CET)
Received: from localhost ([::1]:42098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVcf-0000vL-Be
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:31:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcVbD-00008k-MN
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:30:23 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:41675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcVb4-0000bx-EX
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:30:23 -0500
Received: by mail-ej1-x644.google.com with SMTP id cw8so18158163ejb.8
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 07:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=S1HiF5C3TKGaf9Bw+/pivouI/Say+5867xsAgJWW/pg=;
 b=GJ/7YK+E3dpQarZORms1mvcdv0BDBd3xN5JnwKkChclmSg92N2wlafNWzuoy84+w6l
 bsqX7Mmcdu9pys2nEMGzBk325DUHL0qJBWl5RJRIWyZXKGvHcesy5I8Lih24vnxxRuwY
 I7mBPZGXLjSe/kErYcEm3I6AhtEXoPiXcp/YwhqXBwxlI9uBHsqQr3L8M19QDNmxhTLV
 TTaAZ+aHYFcrw88b0CB2GjXqgEvP9Hk6zMpZ/90yYuBB2ltWnNk4RtN5QLVLHLRsLHCt
 6w1poYl6Cl417Lz03gihAOkqKNuiTQ26Hwe9cu3LZ6DROeUN8VJNnprWf+vYZwsxGY13
 4ekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S1HiF5C3TKGaf9Bw+/pivouI/Say+5867xsAgJWW/pg=;
 b=cv/RYKt1+U1cBSZkx1Y+heEcV+KCHlveslbJj+6AUMf3qBYcbzpvd3dUhJEPkAslDL
 vVhImtBvOKcY+INxhwAjvyXPb/cY/vR3gRmwQH3JJyVcRblEyAD386HaGS3rjHs4zHtl
 w+xmlDHRdUO0BdtP28Ed5pPNVcT9ZAG0a2Wlzmt04gkMz+8kXjQOW7218PJlongdKxTx
 gKwQu3EgatCe5w4Jysv1ghUoSwnq6+XD6yzdIYh8rJ1zTb5n3T3o3euMP/LkqrQDESWD
 z0fSFrlM9FwvAVvdsaOLKnD6QztR/E+AW8U+5p3cYszlfLpL4T2LzZLgWlExw+TOvKOE
 JBzA==
X-Gm-Message-State: AOAM531ODbtm0E4gBqTE2U2mQjB1vyp2FfVMhcPKiDXHmiVZmIQmxdRu
 027MCx2LVY7Cj7abwD8m56N5I7z+wMc+7MqMIXEUxQ==
X-Google-Smtp-Source: ABdhPJzz/jVu+0a2r1LsCB2Bv96YNUhZx2OggjRGxKoqYHgSSI0Q+GfrCtVCXoqJSfFbkozQ1a1axCEZevkecS7ps8M=
X-Received: by 2002:a17:906:3a97:: with SMTP id
 y23mr20210481ejd.250.1605022212190; 
 Tue, 10 Nov 2020 07:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20201105070626.2277696-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20201105070626.2277696-1-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2020 15:30:00 +0000
Message-ID: <CAFEAcA_0=HHG8+p0j2W2j5hLUgGZ_aWfKMQkROLj0HGoU0D7eg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: fix heap-buffer-overflow in rxicu_realize()
To: Chen Qun <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gan Qixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 Nov 2020 at 07:08, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> When 'j =3D icu->nr_sense =E2=80=93 1', the 'j < icu->nr_sense' condition=
 is true,
> then 'j =3D icu->nr_sense', the'icu->init_sense[j]' has out-of-bounds acc=
ess.

Yes, this is a bug...

> Maybe this could lead to some security problems.

...but it's not a security bug, because this device can't
be used with KVM, so it's not on the QEMU security boundary.


>  hw/intc/rx_icu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/intc/rx_icu.c b/hw/intc/rx_icu.c
> index 94e17a9dea..692a4c78e0 100644
> --- a/hw/intc/rx_icu.c
> +++ b/hw/intc/rx_icu.c
> @@ -308,11 +308,9 @@ static void rxicu_realize(DeviceState *dev, Error **=
errp)
>          return;
>      }
>      for (i =3D j =3D 0; i < NR_IRQS; i++) {
> -        if (icu->init_sense[j] =3D=3D i) {
> +        if (j < icu->nr_sense && icu->init_sense[j] =3D=3D i) {
>              icu->src[i].sense =3D TRG_LEVEL;
> -            if (j < icu->nr_sense) {
> -                j++;
> -            }
> +            j++;
>          } else {
>              icu->src[i].sense =3D TRG_PEDGE;
>          }

This works, so:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

but to be honest I think this would be more readable:

    for (i =3D 0; i < NR_IRQS; i++) {
        ice->src[i].sense =3D TRG_PEDGE;
    }
    for (i =3D 0; i < icu->nr_sense; i++) {
        uint8_t irqno =3D icu->init_sense[i];
        if (irqno < NR_IRQS) {
            icu->src[irqno].sense =3D TRG_LEVEL;
        }
    }

so we first initialize everything to the default before
processing the init_sense array to identify which irqs
should be level-triggered. (It also means that the caller
doesn't have to ensure the input property is in sorted
order.)

thanks
-- PMM

