Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB7632E744
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 12:35:19 +0100 (CET)
Received: from localhost ([::1]:47012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI8jm-0004cy-Gt
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 06:35:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8ib-0003yZ-T1
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:34:05 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8iZ-0001Mi-2R
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:34:05 -0500
Received: by mail-ed1-x52f.google.com with SMTP id m9so2109990edd.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 03:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZtZ7Ryo+/dzTYxD9daQmFc/Jm1BA0ESUiL0rfejY0sY=;
 b=o4c5iBauHI1CyVUIxjOdFXC7aaVjgSiBBON2/9azc5SKILV9k3fBCc3Ryuk763Vonw
 83VUfCtoy2pZf3Z4P07v4VE/tFIxwIgBEu6a1bANgTCHXmKdShClG8YuvRFJns7GTlm7
 hgbpuAJARJR905zPVQBd04PmZ50ARtYxCkn/iAOngORv2xDfNM1orrwTM8osYsxo8zqq
 f7/Yux8IqbGESLy1JLwXjKM+1OTY6uH7z1kKII/lIrQhSVGdchosySV2m88x0to74TPN
 +UMtHBABI3PMBzcxrFPBa6hxvMHiRI+kDXk1OiElEkP+p5YIC5/fXiFTLaVRPTDMRGD4
 uRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZtZ7Ryo+/dzTYxD9daQmFc/Jm1BA0ESUiL0rfejY0sY=;
 b=WmUML5QcRouiFbo2pDMvD0YucS3FXVQvGXJTPOFI+gEP/9YEyKMJSCc6aXKSWFtdpX
 D62N5K2BtCpCZRad2CyS0AGQ7dtKOHjpTHJ+fUNHgo9CV49To+VOKM7c6wVSBccfft9R
 lcj0n7DIvuU6KblxFziBqxfWm6bnWnpHh4I9pk58yanU5TGj8/nWf1Rx34puPycf2WxR
 FzOi841gu8HggHcIQMalSQikGeXdyjrDKc51/Zz8GgrPpXA40OnbuNmb83X4rdGlydp+
 SVHLQ6KPvTo0hNwgCuXLM4QWkvCZfKNG+SCBElmwiqqvYO5V2OnXqVfgIxXLCRWEFP+v
 b60A==
X-Gm-Message-State: AOAM532E334A/t74fe80SkcWUisViAikhqgp/xFtadXbOrEpMaUGJ3OJ
 x4cXam5daGd1inTen3GdCw1Zef8+3g+fW7w43MuOHA==
X-Google-Smtp-Source: ABdhPJzrZsMi26bRlyq+34Ki0yMc0w1uoarccJLzLXNoet+N/OMdP28QGpo5br/hA8Mww/KBuMbBlfwdSklao9IHNOs=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr8494937edt.251.1614944041554; 
 Fri, 05 Mar 2021 03:34:01 -0800 (PST)
MIME-Version: 1.0
References: <20210228224813.312532-1-f4bug@amsat.org>
In-Reply-To: <20210228224813.312532-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 11:33:45 +0000
Message-ID: <CAFEAcA-5=AuN1n-i5AaDeiJ2M_vOJDQCaWaX+AN=scQTQzo79Q@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/npcm7xx_smbus: Simplify npcm7xx_smbus_init()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Tyrone Ting <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 28 Feb 2021 at 22:50, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The STATUS register will be reset to IDLE in
> cnpcm7xx_smbus_enter_reset(), no need to preset
> it in instance_init().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i2c/npcm7xx_smbus.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
> index 6b2f9e1aaad..e7e0ba66fe7 100644
> --- a/hw/i2c/npcm7xx_smbus.c
> +++ b/hw/i2c/npcm7xx_smbus.c
> @@ -1040,7 +1040,6 @@ static void npcm7xx_smbus_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->iomem);
>
>      s->bus =3D i2c_init_bus(DEVICE(s), "i2c-bus");
> -    s->status =3D NPCM7XX_SMBUS_STATUS_IDLE;
>  }
>
>  static const VMStateDescription vmstate_npcm7xx_smbus =3D



Applied to target-arm.next, thanks.

-- PMM

