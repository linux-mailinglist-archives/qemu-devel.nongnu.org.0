Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2D653F2E4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 02:14:46 +0200 (CEST)
Received: from localhost ([::1]:44394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMrt-0006UH-9j
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 20:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nyM3O-0007x9-Ti; Mon, 06 Jun 2022 19:22:35 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nyM3N-0004y3-7l; Mon, 06 Jun 2022 19:22:34 -0400
Received: by mail-wm1-x32a.google.com with SMTP id e5so1566393wma.0;
 Mon, 06 Jun 2022 16:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=H8k9fFKFjQw9pubzVp6SvoQ2qYfox4LemA0BqkC0FUI=;
 b=ceUmkcyQFFwRbHIcp5E1OSjPxvXDi4VvAwCXoSEuArd+U0uggCLmFM20keqSD+oDlT
 yftcV/JSdcXnHLvpk8wOVGQAjiXA1R4NApRob6B9Md/ElLXnhkL7jbxE9emrXKv1h6hl
 WMo/NRw0U+xk2k/VUzAH8hDnnkpdQGQBLPkEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H8k9fFKFjQw9pubzVp6SvoQ2qYfox4LemA0BqkC0FUI=;
 b=2DCMBeOJ9dzZGHm3uOYhI4QdtfifJ5Px06PvYdOfj+zWNpPmTD+BLLys9pPnvUGDQd
 5zLGPcg2CYszbKAda2vIe2gU+FpygcdpS7niDpDWVcp505ojrvBqI/+QpCCdQURLQsgC
 EzkOsy7BWklTykA6lMUBtxe54aLOKEf2w0oTjMhHQb4/Eabo0SOpQaJfekUBgX5nWFXk
 chnKONMBY1PHs4dw7xTf76+v1QoPbvqdpBKpe5IhBGN6Ll0F0t58N/Lfa/3/Smzl93TI
 E0BzQ/YCqkYYhiQaLd5T0qqWXOwV+uR8ceOvhH8sjgwPOBFNAqsC7DTaYoUuUCNLdBUn
 IfqA==
X-Gm-Message-State: AOAM5316VUkda7Rl9uy/Xok8wtRNUtHDW/9p53adAHi/75hDWOzrLuSq
 oAJkXJYYkif328XeIplzk7iBi3mDCd+4kjUdTEI=
X-Google-Smtp-Source: ABdhPJz7uK47AGVX9Q9Lec0sKaPiSAF5AqpxnK5hLBmRyM7yc+nME3crmQHO6aMrhwql4FFDGRLYcUzZEmxt1ddHG3k=
X-Received: by 2002:a05:600c:5d3:b0:39c:506d:c987 with SMTP id
 p19-20020a05600c05d300b0039c506dc987mr7246479wmd.10.1654557751130; Mon, 06
 Jun 2022 16:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220606150732.2282041-1-clg@kaod.org>
 <20220606150732.2282041-13-clg@kaod.org>
In-Reply-To: <20220606150732.2282041-13-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Jun 2022 23:22:19 +0000
Message-ID: <CACPK8XdE87Agi9z_hPno-1E-eRFfD-ooQMkFy3tM-0xu9OMKZA@mail.gmail.com>
Subject: Re: [PATCH 12/21] aspeed/i2c: Add ast1030 controller models
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, Klaus Jensen <k.jensen@samsung.com>, 
 Peter Delevoryas <pdel@fb.com>, Corey Minyard <cminyard@mvista.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>, 
 Andrew Jeffery <andrew@aj.id.au>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=joel.stan@gmail.com; helo=mail-wm1-x32a.google.com
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

On Mon, 6 Jun 2022 at 15:09, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Based on :
>   https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg06017.html

Perhaps use the link to lore (which also includes the message id):

https://lore.kernel.org/qemu-devel/20220324100439.478317-2-troy_lee@aspeedt=
ech.com/

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Cc: Troy Lee <troy_lee@aspeedtech.com>
> Cc: Jamin Lin <jamin_lin@aspeedtech.com>
> Cc: Steven Lee <steven_lee@aspeedtech.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/i2c/aspeed_i2c.h |  1 +
>  hw/i2c/aspeed_i2c.c         | 24 ++++++++++++++++++++++++
>  2 files changed, 25 insertions(+)
>
> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> index 506bcf1a9daf..79c6779c6c1e 100644
> --- a/include/hw/i2c/aspeed_i2c.h
> +++ b/include/hw/i2c/aspeed_i2c.h
> @@ -30,6 +30,7 @@
>  #define TYPE_ASPEED_2400_I2C TYPE_ASPEED_I2C "-ast2400"
>  #define TYPE_ASPEED_2500_I2C TYPE_ASPEED_I2C "-ast2500"
>  #define TYPE_ASPEED_2600_I2C TYPE_ASPEED_I2C "-ast2600"
> +#define TYPE_ASPEED_1030_I2C TYPE_ASPEED_I2C "-ast1030"
>  OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
>
>  #define ASPEED_I2C_NR_BUSSES 16
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 8425e928890a..5fce516517a5 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -1185,6 +1185,29 @@ static const TypeInfo aspeed_2600_i2c_info =3D {
>      .class_init =3D aspeed_2600_i2c_class_init,
>  };
>
> +static void aspeed_1030_i2c_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    AspeedI2CClass *aic =3D ASPEED_I2C_CLASS(klass);
> +
> +    dc->desc =3D "ASPEED 1030 I2C Controller";
> +
> +    aic->num_busses =3D 14;
> +    aic->reg_size =3D 0x80;
> +    aic->gap =3D -1; /* no gap */
> +    aic->bus_get_irq =3D aspeed_2600_i2c_bus_get_irq;
> +    aic->pool_size =3D 0x200;
> +    aic->pool_base =3D 0xC00;
> +    aic->bus_pool_base =3D aspeed_2600_i2c_bus_pool_base;
> +    aic->has_dma =3D true;
> +}
> +
> +static const TypeInfo aspeed_1030_i2c_info =3D {
> +    .name =3D TYPE_ASPEED_1030_I2C,
> +    .parent =3D TYPE_ASPEED_I2C,
> +    .class_init =3D aspeed_1030_i2c_class_init,
> +};
> +
>  static void aspeed_i2c_register_types(void)
>  {
>      type_register_static(&aspeed_i2c_bus_info);
> @@ -1192,6 +1215,7 @@ static void aspeed_i2c_register_types(void)
>      type_register_static(&aspeed_2400_i2c_info);
>      type_register_static(&aspeed_2500_i2c_info);
>      type_register_static(&aspeed_2600_i2c_info);
> +    type_register_static(&aspeed_1030_i2c_info);
>  }
>
>  type_init(aspeed_i2c_register_types)
> --
> 2.35.3
>

