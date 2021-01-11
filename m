Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C00F2F218C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 22:11:51 +0100 (CET)
Received: from localhost ([::1]:36578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz4Tb-0003Lo-Eo
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 16:11:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kz4SU-00026r-0O
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 16:10:38 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kz4SP-0006le-QQ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 16:10:35 -0500
Received: by mail-ej1-x629.google.com with SMTP id d17so370309ejy.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 13:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V3Y24u4f3XsuoekKmrHK2KtvxnNYvILaxvs27bkssoY=;
 b=SKdB6HEPIzdptpE7YtQQ0jVyRnh73HPfr5rV6I/VHiC0588MIFbFsvGAHQ83dTT6ZC
 l7eF5qoVudg6OhcBlyTAYDc5y/NkDIl8heBqkS0FzZ/FycbcSwhDnWCVWpnd+UcGLlWd
 6hLXuKeJCQNgh1b7oyj0C2ee7FstefVzcnZgmAahYbsVWPGes1UbbnjhP/ayDuUWehiU
 9JA6mnDnsCdyM8EK65CNeO2iMsYLMNuC3mdNbJY6XFPn626e77duKhrFq/p0eGsVu+zj
 jhRflmvQlyMuWcDrXpVq044pE1mHfaolamj2qzHOwVKqJEEPVayb0e6pB3mEHw/PLyNX
 mcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V3Y24u4f3XsuoekKmrHK2KtvxnNYvILaxvs27bkssoY=;
 b=hTFjNxrlNqLfpy3EsF3sRf9wZwqTHNoAhmEa/mNUkfIhaH6GkKyHdW3HyMIE/CwZVu
 7jGHu/zfwe9hiBLVmNbUOAlZGfMI0zSdjbLZdJNe8P+uMBoq/NVrsUXrurpvaVSIn1jQ
 Z7GpKNJWPaRBGiie4t92uz25P7pliQ9EqlnyPV0+0zzjuXGSCAAXZHSbAb5ixW5oecpb
 U0IUxn3a0c9lrEebk52NGE1kn4pIRjOWt4C8eCLkBk2Uaq/hZuLq1tEvW6QPt5eYhI2M
 kPqzEP5uRZEi+Y7r+CSq3TPT4M2ppDC5rfyXCLF27AThBnnZrqYU7QgnNNIwr1OtDPwD
 HPcQ==
X-Gm-Message-State: AOAM530QpuwJ3RGGSk9Pk2dih9QdC5y9h5vrf2kQTMDoVhZZNjkUG/u1
 ltDt7dy1eLgYidLlt05PvSZKae9DVTTAwyHYeHPlqQ==
X-Google-Smtp-Source: ABdhPJwygr7Ns0kEAEEa+6gp0Fjf33LQvfY3icL8kFVysLjs8SqknnnpuzKzw/NqkYCaDdEQWXgAPje2HYUixEj46go=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr907701ejf.85.1610399431490; 
 Mon, 11 Jan 2021 13:10:31 -0800 (PST)
MIME-Version: 1.0
References: <20210111171623.18871-1-peter.maydell@linaro.org>
 <alpine.LMD.2.03.2101112015580.7627@eik.bme.hu>
In-Reply-To: <alpine.LMD.2.03.2101112015580.7627@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jan 2021 21:10:20 +0000
Message-ID: <CAFEAcA-npFT=-ZQevChci7Ru=ZnBL+mKPP7371EJnxqKjACixg@mail.gmail.com>
Subject: Re: [PATCH] hw/ppc/ppc400_bamboo: Set dcr-base correctly when
 creating UIC
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jan 2021 at 19:19, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Mon, 11 Jan 2021, Peter Maydell wrote:
> > In commit 0270d74ef8862350 we switched from ppcuic_init() to directly
> > creating the UIC device, but I missed that the Bamboo's UIC has a
> > non-standard DCR base register value (0xc0 rather than the default
> > of 0x30). This made Linux panic early in the boot process.
> >
> > Specify the correct dcr-base property value when creating the UIC.
> >
> > Fixes: 0270d74ef8862350
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reported-by?

Yes, sorry --

Reported-by: Nathan Chancellor <natechancellor@gmail.com>

> > diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> > index b156bcb9990..2c7a578ba73 100644
> > --- a/hw/ppc/ppc440_bamboo.c
> > +++ b/hw/ppc/ppc440_bamboo.c
> > @@ -198,6 +198,7 @@ static void bamboo_init(MachineState *machine)
> >     uicdev = qdev_new(TYPE_PPC_UIC);
> >     uicsbd = SYS_BUS_DEVICE(uicdev);
> >
> > +    qdev_prop_set_uint32(uicdev, "dcr-base", 0xc0);
>
> This fixes Bamboo but not virtex and 405 which seem to have same problem
> as I've just shown in replies to those patches. So maybe this is better
> fixed by changing default value in ppc-uic.c to 0xc0 then. You say in
> commit message that 0xc0 is non-standard but most boards seem to use that
> than the default you have now. I don't know if there's a standard by the
> way or every CPU implementation just puts DCRs where they want.

My intention when I wrote the code was just to set the default value of
the property on the device to the value that most of the users seemed to
need -- I don't know if there's any actual standard. It sounds
like the actual bug is that I put in the wrong default value by
accident.

For the QEMU boards we have with UICs, they all use 0xc0 --
the only special case is sam460ex because it has four UICs,
so they go at 0xc0, 0xd0, 0xe0, 0xf0.

New patch coming up that fixes the default property value.

thanks
-- PMM

