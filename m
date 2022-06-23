Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797CC55729C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 07:39:21 +0200 (CEST)
Received: from localhost ([::1]:44314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4FYm-0003K8-8j
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 01:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o4FNK-0007KW-Au; Thu, 23 Jun 2022 01:27:30 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o4FNI-00023d-PB; Thu, 23 Jun 2022 01:27:30 -0400
Received: by mail-wr1-x436.google.com with SMTP id i10so22515515wrc.0;
 Wed, 22 Jun 2022 22:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hd//IKengoQDseyXtqsqh8Bu5uUyi1meP0Nyo4qw+Wo=;
 b=lQ0k1rKDw4Q481QSPrpnKs1omLecrE2XpV/NoHKgk4zfAlm6qlzXa9hUUcPBMuXdqX
 E+e1EOt2Cbr9YCb/jDhSnnfBu4YGfnGpwe4FowRrFjmJZAeyEl3tIWbbndIrq36M5yvX
 9owk0zQBP9lgZ8czKAEeG7PMgkNGSH+19TpGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hd//IKengoQDseyXtqsqh8Bu5uUyi1meP0Nyo4qw+Wo=;
 b=idNavUoxlH49OErHInKipTaAGkRYKz9g32kfC8pS2sc2nuQVsgfTQGX+QsZWDi70om
 JMsSLym/IWwZ+cutRrt8qUdY1COff8opZyZnAgRheaCkFiGNDi38GklG1iDTEHMH3run
 KFim2Pvf45REF3TKYRIpBh/76aJNO0Xi4hbk3J/pw7F9T6TLe39tSib9VAhj6d/ahgpZ
 OP+wQutS55QYaMj8nfXVFypiyisurOdMQ4c+pUs1E1iU+a/TqedDGUBymIJnbMW1wfyg
 nwQUaWtI+A76c6OCNUu43mY31TLZUm2793Tfsmh7YQ52yNqEDFLxUMnuC570jnDLhhbS
 HKKQ==
X-Gm-Message-State: AJIora/3HO0jz4LA9MM8jqsn7Fr3v6n+YzibRiHsqRs+qKhJFBpq4RJ5
 AYQ8G+4/xbsyBH7REogbnbwUpuHpqj66k1HnLro=
X-Google-Smtp-Source: AGRyM1uLbHDxSxBVxmzFwLQkjnKXp61asR1uUPBYp1Bft5pa+Zl8F+X9B3lNA6QCfb0VgC5DgfjBu4KLPqcFIrj+lWI=
X-Received: by 2002:a5d:47c9:0:b0:20f:e7da:6a48 with SMTP id
 o9-20020a5d47c9000000b0020fe7da6a48mr6583913wrc.315.1655962047045; Wed, 22
 Jun 2022 22:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-10-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220622172830.101210-10-quic_jaehyoo@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Jun 2022 05:27:14 +0000
Message-ID: <CACPK8XdtsfsV8_L9C_XZ+AHZ0wAwdxgXmSxW5bZ3YHOr72Qvkg@mail.gmail.com>
Subject: Re: [PATCH 9/9] hw/arm/aspeed: firework: add I2C MUXes for VR channels
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Titus Rwantare <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Graeme Gregory <quic_ggregory@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x436.google.com
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
> Add 2-level cascaded I2C MUXes for SOC VR channels into the Firework
> machine.
>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---
>  hw/arm/aspeed.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 526f3b651a9f..866a60cf7b4e 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1038,7 +1038,7 @@ static void qcom_firework_fru_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
>  static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
> -    I2CSlave *mux;
> +    I2CSlave *therm_mux, *cpuvr_mux;
>
>      /* Create the generic DC-SCM hardware */
>      qcom_dc_scm_bmc_i2c_init(bmc);
> @@ -1048,16 +1048,24 @@ static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
>      /* I2C4 */
>      qcom_firework_fru_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x50, 128 * 1024);
>
> -    /* I2C - 8 Thermal Diodes*/
> -    mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9548",
> -                                  0x70);
> -    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 0), TYPE_LM75, 0x4C);
> -    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 1), TYPE_LM75, 0x4C);
> -    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 2), TYPE_TMP75, 0x48);
> -    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 3), TYPE_TMP75, 0x48);
> -    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 4), TYPE_TMP75, 0x48);
> -

You only just added this. If you modify the previous patch to call the
"mux" variable "therm_mux" then you don't need to modify it in this
patch.

or just squash them both together. I don't think there's much value in
having two separate patches.

> -    /* I2C-9 Fan Controller (MAX31785) */
> +    /* I2C7 CPUVR MUX */
> +    cpuvr_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7),
> +                                        "pca9546", 0x70);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 0), "pca9548", 0x72);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 1), "pca9548", 0x72);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 2), "pca9548", 0x72);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 3), "pca9548", 0x72);
> +
> +    /* I2C8 Thermal Diodes*/
> +    therm_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8),
> +                                        "pca9548", 0x70);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 0), TYPE_LM75, 0x4C);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 1), TYPE_LM75, 0x4C);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 2), TYPE_LM75, 0x48);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 3), TYPE_LM75, 0x48);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 4), TYPE_LM75, 0x48);
> +
> +    /* I2C9 Fan Controller (MAX31785) */
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x52);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x54);
>  }
> --
> 2.25.1
>

