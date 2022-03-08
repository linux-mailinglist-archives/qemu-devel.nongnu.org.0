Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8174C4D1076
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 07:47:40 +0100 (CET)
Received: from localhost ([::1]:34970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRTdD-0000d3-Be
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 01:47:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRTYB-000769-FV; Tue, 08 Mar 2022 01:42:28 -0500
Received: from [2607:f8b0:4864:20::d36] (port=36576
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRTY8-0000YA-BT; Tue, 08 Mar 2022 01:42:26 -0500
Received: by mail-io1-xd36.google.com with SMTP id b16so5529369ioz.3;
 Mon, 07 Mar 2022 22:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wwQxHg87rgATAIFN138+byD8xJcNZiHztfaTuelWFkw=;
 b=Bop/v+jasDb1TtUO99hPPyV/57Z5oB0YyD2SB1dIZLD3Pcd4FXj2GEUOM83nxitrEF
 NXp5XhlNHFFhw2vCQQcFmcoN8hi/eg3JPCqNfCmXpaZe8V0pclcjygOXHjr3MzuGRlIo
 bv+AwYPtb9DYsCqCwWTi6STzcaA4IUBq3ym2XgLBgsm4hnIX9t/eiU0ghErnVhSr2TuT
 /1AA956DKRW5Ptoo/4+TpxlIesPN6WhB90S8G571L+ClBWHg6pqFkceXALDW0AT0ZKV9
 PJ3F0Togv90xRpkAJ04vVGv8ZOiTD3acZ5InPVXiVGzdAHCYGx10t0UHDpturkF73AmX
 7oQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wwQxHg87rgATAIFN138+byD8xJcNZiHztfaTuelWFkw=;
 b=c5eWt9/TXnXK3FLcSYzuHZYMU5HhQ4vCrV1VSPdG2f6SRnQ/Q+/hgcfypBHNxe37vs
 zg/SWL24KFnzkmdkbZtE86NsmQhY2h2cmUZUT+a1xQ3FBPuEM7TyleFr9Z1TlV/RdeL0
 s2xhNVHlyLkvKyyS/tLSUhbcRQfnNtxYX0d/sQ3TZ1dncYOkAYYoLBqp8D9rv8VwVTAA
 dofCAys6SnQ4cVakUNQw5JxW8MgfXk/yClhByROmFUq6kv6h6xfAvpacMU2pfkike4KM
 JkyC+nan3fuXnw8osgcQpG7lHZ6ZpTUUOFGMutJnlgfB5s0rHNEOwriBMQIW+PPnIEiU
 AWXg==
X-Gm-Message-State: AOAM530aiOd+8LXc3MHCunnQ+rjTY7PCqERgBgZ3uPpkoblfpdfxPe2p
 wpHEl+DBguQwlqsfINhac/9ZoGGWvAAP9J0bVo8=
X-Google-Smtp-Source: ABdhPJxy5L7brfuV9icY1dMI6smN1s/r0x/2kl3fxJb/lGcbU35v5EqvUW/dC8+aWkVey275FLxG4DP4oqEjORCM1vQ=
X-Received: by 2002:a05:6638:15ce:b0:317:b681:157b with SMTP id
 i14-20020a05663815ce00b00317b681157bmr9521743jat.66.1646721742176; Mon, 07
 Mar 2022 22:42:22 -0800 (PST)
MIME-Version: 1.0
References: <20220307071856.1410731-1-clg@kaod.org>
 <20220307071856.1410731-6-clg@kaod.org>
In-Reply-To: <20220307071856.1410731-6-clg@kaod.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Mar 2022 16:41:56 +1000
Message-ID: <CAKmqyKOxi+0VJUd+a2oJCoRoz1=3RE335BySrO8p5UsYM45ofg@mail.gmail.com>
Subject: Re: [PATCH 5/6] aspeed/smc: Let the SSI core layer define the bus name
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 7, 2022 at 5:34 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> If no id is provided, qdev automatically assigns a unique ename with
> the following pattern "<type>.<index>".
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ssi/aspeed_smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index f194182beacf..113f31899a6b 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -1130,7 +1130,7 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
>      /* DMA irq. Keep it first for the initialization in the SoC */
>      sysbus_init_irq(sbd, &s->irq);
>
> -    s->spi =3D ssi_create_bus(dev, "spi");
> +    s->spi =3D ssi_create_bus(dev, NULL);
>
>      /* Setup cs_lines for peripherals */
>      s->cs_lines =3D g_new0(qemu_irq, asc->max_cs);
> --
> 2.34.1
>
>

