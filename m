Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1328E557298
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 07:35:40 +0200 (CEST)
Received: from localhost ([::1]:41774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4FV3-0001MB-7B
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 01:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o4FOh-0007xd-RQ; Thu, 23 Jun 2022 01:28:55 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o4FOg-000270-AY; Thu, 23 Jun 2022 01:28:55 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r20so5857954wra.1;
 Wed, 22 Jun 2022 22:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rHeQ9F9gRYAU6ZPZSUiPL6Cm2BUKBsqOpVipP9lZqww=;
 b=k5aHX8ZT9bLLgO+L7GWX9C4+L1X/P8CHfiASQ7L6IadUNJM0+zasyGt6aHqJpXEGOa
 +HfH4qLDdcNNVvt/7YRfsfEwvhxo8nizex7LpTVagPeKd3Y99u8y7mC4w2OGdU73pV7N
 YXiOo3+0ExTmd1wPx4vhHb5/6dckx6YyhUVMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rHeQ9F9gRYAU6ZPZSUiPL6Cm2BUKBsqOpVipP9lZqww=;
 b=5gt4YOAmJV9tpGW5exnruqf1hTmYzrkfGyym3HgWGGg1D7x89Ef/3PjWcXRt2t7Xwo
 K0nFV6wKMe0hH5b5MCIABPhyHf07gAsahx2FeFyzheyBEca2eVJXYwr+1bXcbwjOdoyC
 2U8H3KxAW/FBMs7f7293yU1iRI6jaOPAi7Snlitug/Y2YQ2GurDH2NYbVH/pGzaFD2yO
 JabzHrkih0PIFVoey53Zck+dAIrWUukBASKlavkKyySjc8IN3wcSqQ3jq3BCFBVKR8o6
 L0M75UWJeSqAwVin1egZ4GqlVsfAmgW9TTA9KkAZTVF3FLZheTO4DtYTyFbvjVcEtdaP
 pQ3w==
X-Gm-Message-State: AJIora9hwVrUTcr5tawSsT7+gZZeC+0XNlLRSz7pIs5MXRJBPPVwVCrN
 vdPKquc8RJrqCTI0Vlge86LQIp3bsCjM6utt9jo=
X-Google-Smtp-Source: AGRyM1uTSYOsP5j+YHBzjhPp300yn2LRDftS+/5JtSy8BJLuejpSs5COxFMaH8v2nxKiljsjkzzNXN2WJjScrlofPA0=
X-Received: by 2002:adf:9d88:0:b0:21b:8a7a:30c5 with SMTP id
 p8-20020adf9d88000000b0021b8a7a30c5mr6334773wre.606.1655962132464; Wed, 22
 Jun 2022 22:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-4-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220622172830.101210-4-quic_jaehyoo@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Jun 2022 05:28:40 +0000
Message-ID: <CACPK8XdBVanZ8D8sR77KnfOw=KD8LPGrNY2KeEx7HWcMwxP-Wg@mail.gmail.com>
Subject: Re: [PATCH 3/9] hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU
 device
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Titus Rwantare <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Graeme Gregory <quic_ggregory@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Jun 2022 at 17:29, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> From: Graeme Gregory <quic_ggregory@quicinc.com>
>
> The FRU device uses the index 0 device on bus IF_NONE.
>
> -drive file=$FRU,format=raw,if=none
>
> file must match FRU size of 128k
>
> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
> ---
>  hw/arm/aspeed.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 785cc543d046..36d6b2c33e48 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -992,17 +992,29 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
>       */
>  }
>
> +static void qcom_dc_scm_fru_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
> +{
> +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> +    DeviceState *dev = DEVICE(i2c_dev);
> +    /* Use First Index for DC-SCM FRU */
> +    DriveInfo *dinfo = drive_get(IF_NONE, 0, 0);
> +
> +    qdev_prop_set_uint32(dev, "rom-size", rsize);
> +
> +    if (dinfo) {
> +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
> +    }
> +
> +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> +}
> +
>  static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
>
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 15), "tmp105", 0x4d);
>
> -    uint8_t *eeprom_buf = g_malloc0(128 * 1024);
> -    if (eeprom_buf) {
> -        smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53,
> -                              eeprom_buf);
> -    }

Again, it's strange to see code that was just added being removed. If
you want the FRU to be in its own patch then remove the eeprom from
the previous patch.

> +    qcom_dc_scm_fru_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53, 128 * 1024);
>  }
>
>  static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
> --
> 2.25.1
>

