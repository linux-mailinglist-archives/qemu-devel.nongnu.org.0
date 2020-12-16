Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FDB2DC6DB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:04:54 +0100 (CET)
Received: from localhost ([::1]:58990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpc6W-0000zS-W0
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpc4e-0008M7-Ka
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:02:56 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpc4b-0006kQ-TW
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:02:56 -0500
Received: by mail-ej1-x633.google.com with SMTP id x16so34311222ejj.7
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+8DGERduX/BzmMtGxMWFcsJvvCASeG+0eCwkYEVU1Sk=;
 b=rM3gmBZaFrSTR1rDxSaJymxn1SnAnBkfKdPniKGkBqKjHFNLhRC7xt9KszbDQb2Vi+
 QlVqfwmK5E1V06UKGAT/nO7MtM5PUQ/TXoiMKksoKknd9ExatvddYGpfUDcMWk0zd541
 w3AtJFtvFT4fJvf18dWM2XgNfIxNJXk3icEleFYiAoOMsLeutmdxvPswRNQiFQ8uaWKW
 8Es52la5d307ygxMUZAYFPJuLDabwEV8loCV7CNh/RILnlEuukPuQj/SqIjnqH1XITi3
 /aqjZo76/lkMCz0BTJ72Mz97ei5rql2Ezbe/QQbqL2Ix+y6+yrHRUssNiX/Ypc7y2JaZ
 f4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+8DGERduX/BzmMtGxMWFcsJvvCASeG+0eCwkYEVU1Sk=;
 b=llvntzJZGjQw82q56OgdkOsOWm3Yy701p3L0RcmSEKEUfPnf70dWqABPizVDHZG4G+
 xXsPvaoAtv0tZiay5TL7+8qEXJ1ve8otSZ1P8PUR8fsizj/kCnRgUFGL2oo2N8c0lJtE
 IDzC8buA5FmHLlq52S37HQAFb+f++sC12GjPiDgUQWIb8RpUUYSCQmz56BVAvKeqJRAc
 oawAnLLf5ptOx5cBrI4jGwRV1po1MVcKAvtcSEuXiRIJRM42qhyu0zuMAh3O5r0wcTX/
 7wRZcAo5An5G52qRp0jbH/8GJz6Vi0UO0af1k+M4b4PuAYFuOtUdhmuZduNBwDRn4+ND
 9SoQ==
X-Gm-Message-State: AOAM530Rhk9rAEiTgnEWumVo1c8yt2H9ODJ8QTB0bEU4mDT/farMBcpV
 UiUTbEh5Y2lexPO9KBfYQBHmP6MI7Qjl+ue8SSUsXQ==
X-Google-Smtp-Source: ABdhPJwDxs2YUGdqvnHmKS5Od7CXtrp/fGskH/1P+Z1dnhT3zNscUUP7RK/Ye6iJzpyiKGNAgX+7LyUM6aX3wuMxtyo=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr32444921ejb.56.1608145371961; 
 Wed, 16 Dec 2020 11:02:51 -0800 (PST)
MIME-Version: 1.0
References: <20201215001312.3120777-1-wuhaotsh@google.com>
 <20201215001312.3120777-5-wuhaotsh@google.com>
In-Reply-To: <20201215001312.3120777-5-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Dec 2020 19:02:40 +0000
Message-ID: <CAFEAcA_Nd0TNjiXkPXp7T29BYO2PnQLQUAFhEg+AR87B8YP+kA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/misc: Add a PWM module for NPCM7XX
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 f4bug@armsat.org, qemu-arm <qemu-arm@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Dec 2020 at 00:13, Hao Wu <wuhaotsh@google.com> wrote:
>
> The PWM module is part of NPCM7XX module. Each NPCM7XX module has two
> identical PWM modules. Each module contains 4 PWM entries. Each PWM has
> two outputs: frequency and duty_cycle. Both are computed using inputs
> from software side.
>
> This module does not model detail pulse signals since it is expensive.
> It also does not model interrupts and watchdogs that are dependant on
> the detail models. The interfaces for these are left in the module so
> that anyone in need for these functionalities can implement on their
> own.
>
> The user can read the duty cycle and frequency using qom-get command.
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>


> +static void npcm7xx_pwm_init(Object *obj)
> +{
> +    NPCM7xxPWMState *s = NPCM7XX_PWM(obj);
> +    SysBusDevice *sbd = &s->parent;

This isn't right. A device shouldn't be poking around
in the 'parent' or 'parentobj' member of its struct --
that is a QOM internal. If you want "this device, cast
to a SysBusDevice", the way to write that is:
   SysBusDevice *sbd = SYS_BUS_DEVICE(s);

(or you could pass 'obj'; same thing).

Looking at the code currently in the tree it also is making this
same mistake:

$ git grep -- '->parent' hw/*/npcm*
hw/arm/npcm7xx_boards.c:    MachineClass *mc = &nmc->parent;
hw/mem/npcm7xx_mc.c:    sysbus_init_mmio(&s->parent, &s->mmio);
hw/misc/npcm7xx_clk.c:    sysbus_init_mmio(&s->parent, &s->iomem);
hw/misc/npcm7xx_gcr.c:    sysbus_init_mmio(&s->parent, &s->iomem);
hw/misc/npcm7xx_rng.c:    sysbus_init_mmio(&s->parent, &s->iomem);
hw/nvram/npcm7xx_otp.c:    SysBusDevice *sbd = &s->parent;
hw/ssi/npcm7xx_fiu.c:    SysBusDevice *sbd = &s->parent;
hw/timer/npcm7xx_timer.c:    SysBusDevice *sbd = &s->parent;

These all should be using QOM cast macros. Would somebody
who's working on these devices like to send a patch ?

thanks
-- PMM

