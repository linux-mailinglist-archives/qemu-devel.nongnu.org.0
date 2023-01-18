Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536FA671104
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 03:17:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHy0e-0003jz-11; Tue, 17 Jan 2023 21:17:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pHy0a-0003jH-Vp; Tue, 17 Jan 2023 21:17:01 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pHy0Y-0003RY-Tc; Tue, 17 Jan 2023 21:17:00 -0500
Received: by mail-ed1-x531.google.com with SMTP id z11so47759060ede.1;
 Tue, 17 Jan 2023 18:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R2igMRUM6F2gKkQdviHdvbLQk4R2f2ltaALZ9dqD3I4=;
 b=GqUgYWJRsftLFXg3P4yakDydZ/s5t/JVduQFsrEKFp8JsLWZm2JbNNV/rZ31jsRc0a
 v54dNKCbaoF+deVM8prSztI4wTKGvgRs6CQTGlZCwZC6v0SW1F8HCwMOTdj6HKlQEN9E
 IzHemwzD6gcqHZnmXIwqV7eB+4LFZKXgJR2t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R2igMRUM6F2gKkQdviHdvbLQk4R2f2ltaALZ9dqD3I4=;
 b=2AUA/05yqDYCDxo8/1d5O3naTKN9wRgerKw3PzugIdU5vLFThZazHlb4JiPHdbohi8
 xfnFcdpqcsi5EOozWp9Ls1bRC1pxjHSMqto67eIsXUEdzWNNexJhT2Y3GP0IvX6swh8b
 bJz5Q5+5O8v7GD2kHm3CLh4/S/y7nEJO1b1FUkr9u8W7j0AS8lb/EDcMqhhdnfElJTLz
 h4SNBgdaR32zkw8v9Xw9DgsydAtYB4Libv9igcJsgEQBDhKMFr97j58rRe5CZ1Tl3gac
 tvQmMkQBO2Y6uTN9fW5t5FyKzMPFDD/LMxa4gshnlaGjQIZyl+iOa/ti0bGa5LSVlnOi
 WCCg==
X-Gm-Message-State: AFqh2kpeRFnP8VCByEYgW2om1n8iTq1Lv52/LhnggAxEIDn6F+L9MmS2
 JWQBZHfb/SpdVKX04+d5L68oyvd3t1V9W5uQfZ0=
X-Google-Smtp-Source: AMrXdXs6lr9T50oiWSanXyMLGWgZXqS+w5TcHecbhMi3V8DYRYmXAVdgkLGZZq8a7L7D1UJVdIyJC5ODX6QvOIjYMo8=
X-Received: by 2002:a05:6402:1109:b0:46c:d007:8642 with SMTP id
 u9-20020a056402110900b0046cd0078642mr536565edv.348.1674008216040; Tue, 17 Jan
 2023 18:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20230117232427.74496-1-peter@pjd.dev>
 <20230117232427.74496-3-peter@pjd.dev>
In-Reply-To: <20230117232427.74496-3-peter@pjd.dev>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 Jan 2023 02:16:42 +0000
Message-ID: <CACPK8XeafqKzLMNR-6L5hcYxgTr7WP2Qqq=3FUvsuaSjB5UBqA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] hw/arm/aspeed: Replace aspeed_eeprom_init with
 at24c_eeprom_init
To: Peter Delevoryas <peter@pjd.dev>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, 
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 17 Jan 2023 at 23:24, Peter Delevoryas <peter@pjd.dev> wrote:
>
> aspeed_eeprom_init is an exact copy of at24c_eeprom_init, not needed.
>
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed.c | 95 ++++++++++++++++++++++---------------------------
>  1 file changed, 43 insertions(+), 52 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 1f9799d4321e..c929c61d582a 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -660,15 +660,6 @@ static void g220a_bmc_i2c_init(AspeedMachineState *b=
mc)
>                            eeprom_buf);
>  }
>
> -static void aspeed_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize=
)
> -{
> -    I2CSlave *i2c_dev =3D i2c_slave_new("at24c-eeprom", addr);
> -    DeviceState *dev =3D DEVICE(i2c_dev);
> -
> -    qdev_prop_set_uint32(dev, "rom-size", rsize);
> -    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> -}
> -
>  static void fp5280g2_bmc_i2c_init(AspeedMachineState *bmc)
>  {
>      AspeedSoCState *soc =3D &bmc->soc;
> @@ -701,7 +692,7 @@ static void rainier_bmc_i2c_init(AspeedMachineState *=
bmc)
>      AspeedSoCState *soc =3D &bmc->soc;
>      I2CSlave *i2c_mux;
>
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51, 32 * KiB)=
;
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51, 32 * KiB);
>
>      create_pca9552(soc, 3, 0x61);
>
> @@ -714,9 +705,9 @@ static void rainier_bmc_i2c_init(AspeedMachineState *=
bmc)
>                       0x4a);
>      i2c_mux =3D i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4)=
,
>                                        "pca9546", 0x70);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x52, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x52, 64 * KiB);
>      create_pca9552(soc, 4, 0x60);
>
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP10=
5,
> @@ -727,8 +718,8 @@ static void rainier_bmc_i2c_init(AspeedMachineState *=
bmc)
>      create_pca9552(soc, 5, 0x61);
>      i2c_mux =3D i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5)=
,
>                                        "pca9546", 0x70);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
>
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP10=
5,
>                       0x48);
> @@ -738,10 +729,10 @@ static void rainier_bmc_i2c_init(AspeedMachineState=
 *bmc)
>                       0x4b);
>      i2c_mux =3D i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6)=
,
>                                        "pca9546", 0x70);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
>
>      create_pca9552(soc, 7, 0x30);
>      create_pca9552(soc, 7, 0x31);
> @@ -754,15 +745,15 @@ static void rainier_bmc_i2c_init(AspeedMachineState=
 *bmc)
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP10=
5,
>                       0x48);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "max31785"=
, 0x52);
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50, 64 * KiB)=
;
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51, 64 * KiB)=
;
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50, 64 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51, 64 * KiB);
>
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP10=
5,
>                       0x48);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP10=
5,
>                       0x4a);
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB)=
;
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB)=
;
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB);
>      create_pca9552(soc, 8, 0x60);
>      create_pca9552(soc, 8, 0x61);
>      /* Bus 8: ucd90320@11 */
> @@ -771,11 +762,11 @@ static void rainier_bmc_i2c_init(AspeedMachineState=
 *bmc)
>
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", =
0x4c);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", =
0x4d);
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 9), 0x50, 128 * KiB=
);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 9), 0x50, 128 * KiB)=
;
>
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423",=
 0x4c);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423",=
 0x4d);
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 10), 0x50, 128 * Ki=
B);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 10), 0x50, 128 * KiB=
);
>
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), TYPE_TMP1=
05,
>                       0x48);
> @@ -783,18 +774,18 @@ static void rainier_bmc_i2c_init(AspeedMachineState=
 *bmc)
>                       0x49);
>      i2c_mux =3D i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11=
),
>                                        "pca9546", 0x70);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
>      create_pca9552(soc, 11, 0x60);
>
>
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 64 * KiB=
);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 64 * KiB)=
;
>      create_pca9552(soc, 13, 0x60);
>
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50, 64 * KiB=
);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50, 64 * KiB)=
;
>      create_pca9552(soc, 14, 0x60);
>
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB=
);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB)=
;
>      create_pca9552(soc, 15, 0x60);
>  }
>
> @@ -838,45 +829,45 @@ static void fuji_bmc_i2c_init(AspeedMachineState *b=
mc)
>      i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
>      i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
>
> -    aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB);
> -    aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB);
> +    at24c_eeprom_init(i2c[19], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[20], 0x50, 2 * KiB);
> +    at24c_eeprom_init(i2c[22], 0x52, 2 * KiB);
>
>      i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
>      i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
>      i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
>      i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
>
> -    aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB);
> +    at24c_eeprom_init(i2c[8], 0x51, 64 * KiB);
>      i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
>
>      i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
> -    aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[50], 0x52, 64 * KiB);
>      i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
>      i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
>
>      i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
>      i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);
>
> -    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB);
> +    at24c_eeprom_init(i2c[65], 0x53, 64 * KiB);
>      i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
>      i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
> -    aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[68], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[69], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[70], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[71], 0x52, 64 * KiB);
>
> -    aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB);
> +    at24c_eeprom_init(i2c[73], 0x53, 64 * KiB);
>      i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
>      i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
> -    aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB);
> +    at24c_eeprom_init(i2c[76], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[77], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[78], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[79], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[28], 0x50, 2 * KiB);
>
>      for (int i =3D 0; i < 8; i++) {
> -        aspeed_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
> +        at24c_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
>          i2c_slave_create_simple(i2c[82 + i * 8], TYPE_TMP75, 0x48);
>          i2c_slave_create_simple(i2c[83 + i * 8], TYPE_TMP75, 0x4b);
>          i2c_slave_create_simple(i2c[84 + i * 8], TYPE_TMP75, 0x4a);
> @@ -947,11 +938,11 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
>      i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4e);
>      i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4f);
>
> -    aspeed_eeprom_init(i2c[4], 0x51, 128 * KiB);
> -    aspeed_eeprom_init(i2c[6], 0x51, 128 * KiB);
> -    aspeed_eeprom_init(i2c[8], 0x50, 32 * KiB);
> -    aspeed_eeprom_init(i2c[11], 0x51, 128 * KiB);
> -    aspeed_eeprom_init(i2c[11], 0x54, 128 * KiB);
> +    at24c_eeprom_init(i2c[4], 0x51, 128 * KiB);
> +    at24c_eeprom_init(i2c[6], 0x51, 128 * KiB);
> +    at24c_eeprom_init(i2c[8], 0x50, 32 * KiB);
> +    at24c_eeprom_init(i2c[11], 0x51, 128 * KiB);
> +    at24c_eeprom_init(i2c[11], 0x54, 128 * KiB);
>
>      /*
>       * TODO: There is a multi-master i2c connection to an AST1030 MiniBM=
C on
> --
> 2.39.0
>

