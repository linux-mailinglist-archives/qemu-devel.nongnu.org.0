Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C999388330
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 01:33:19 +0200 (CEST)
Received: from localhost ([::1]:59292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj9DB-0002U7-VR
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 19:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lj982-0008GI-7x; Tue, 18 May 2021 19:27:58 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:36549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lj980-00037H-Mb; Tue, 18 May 2021 19:27:58 -0400
Received: by mail-qt1-x835.google.com with SMTP id t7so8865670qtn.3;
 Tue, 18 May 2021 16:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zr3gbfe3nEKjTQ3ubXtTdmZ02SvB3/QXG6/L7CdKajU=;
 b=euAwVxLCL5oRNZzSoVPMp53onJmmrCSh+SLCjZJb8UCiaRwlIDG/zPjhqSocaea8Fs
 trMih6Dnv7wBI3pZpuhrmrDe7vxNRDTDqH+w9KFowEjPy1DBfD7rwxTuMql8bHRkQj+8
 MM8aiBJ0kLjnRYrIW7/NlWmQyf8ZS4zoD+/j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zr3gbfe3nEKjTQ3ubXtTdmZ02SvB3/QXG6/L7CdKajU=;
 b=WyaqdRw6v4mdnRJZO654Q0pIkKLUAJ84VJRU40FGQEjCZUq45BoIk0pOzRuadAFXIp
 C0NkK1Bh4V30QQjAGycBYvrZ5w4/fAM5Z5bxu3NPhfKpRY9Mue/LVYGfRVck34LYWTR9
 hVtNjV+DT/mdVwW6FUegKPTDjFNBD+kSH7yIWA7lNARJQxrhzLvdQs/iVMCc5PXT5Su7
 FjwR71WeBMw2VMvvlZPpcks69OH4CFMHpF9H1/BJlg4MICOT67EtW52I8ETmCuUFX1lk
 UmR3BD5P44MH+FigJV/TnEqsRX/vbdGfX0r92QUrtvOWXpuMT1ONTfZtg69kV+aKbpYD
 DMQA==
X-Gm-Message-State: AOAM533YKf4qLGsq+nxPJjjIiN9OvoXhZ7BRNa4dtTzcOaKFvddB2QT7
 wt2CAqLDnkbmjQBSSbdzVILSVulgLZZ3UjCs6AA=
X-Google-Smtp-Source: ABdhPJxqKBQVwMZfKs9UUQhtkL0Au4TCbeEowBz8DFeTGyVl7v08sfklBrOprX/MHkHzy2RAbkS9DTnh4N9HUunX3jo=
X-Received: by 2002:ac8:5459:: with SMTP id d25mr7774744qtq.385.1621380471748; 
 Tue, 18 May 2021 16:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210518194118.755410-1-venture@google.com>
 <20210518194118.755410-5-venture@google.com>
In-Reply-To: <20210518194118.755410-5-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 18 May 2021 23:27:39 +0000
Message-ID: <CACPK8XcCOTQe2ObaBP3rfbM1oe0h=E2murXyPAvGBewKV=qBdw@mail.gmail.com>
Subject: Re: [PATCH 4/4] aspeed: sonorapass: enable pca954x muxes
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 May 2021 at 19:41, Patrick Venture <venture@google.com> wrote:
>
> Enables the pca954x muxes in the bmc board configuration.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>

Not sure about this one, there's no device tree for it in Linux.

> ---
>  hw/arm/aspeed.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 35a28b0e8b..27fd51980c 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -541,14 +541,16 @@ static void swift_bmc_i2c_init(AspeedMachineState *bmc)
>
>  static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
>  {
> +    I2CSlave *i2c_mux;
>      AspeedSoCState *soc = &bmc->soc;
>
>      /* bus 2 : */
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x48);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x49);
> -    /* bus 2 : pca9546 @ 0x73 */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9546", 0x73);
>
> -    /* bus 3 : pca9548 @ 0x70 */
> +    /* bus 3 : */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9548", 0x70);
>
>      /* bus 4 : */
>      uint8_t *eeprom4_54 = g_malloc0(8 * 1024);
> @@ -562,7 +564,7 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
>      /* bus 6 : */
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x48);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x49);
> -    /* bus 6 : pca9546 @ 0x73 */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "pca9546", 0x73);
>
>      /* bus 8 : */
>      uint8_t *eeprom8_56 = g_malloc0(8 * 1024);
> @@ -573,14 +575,12 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
>      /* bus 8 : adc128d818 @ 0x1d */
>      /* bus 8 : adc128d818 @ 0x1f */
>
> -    /*
> -     * bus 13 : pca9548 @ 0x71
> -     *      - channel 3:
> -     *          - tmm421 @ 0x4c
> -     *          - tmp421 @ 0x4e
> -     *          - tmp421 @ 0x4f
> -     */
> -
> +    /* bus 13 : */
> +    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 13),
> +                                      "pca9548", 0x71);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4c);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4e);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4f);
>  }
>
>  static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
> --
> 2.31.1.751.gd2f1c929bd-goog
>

