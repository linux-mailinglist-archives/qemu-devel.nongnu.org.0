Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FDA698207
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLcS-0006kg-8W; Wed, 15 Feb 2023 12:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSLcP-0006k7-Ns
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:30:57 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSLcN-0007ek-OV
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:30:57 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bk16so19919312wrb.11
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 09:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8TmMS6MwZdgJOnLa7VlwFtOh4OKJvPj+jftYQVqkKsk=;
 b=gEczS0Lejz8yob903zOArqLumCdivb9ESDgSnQLOEqWQA0BwxP2t5+6fs1VlGvftRu
 PHH1h8zs4UexpeqqE9x5DICe+eovXmDpN7mBKxgOHCk54JQ5S8CLIzsysof79C9A2sd7
 bqgRW3zA5pYDSP1e+/di9ckfFniQl3Hz5moAekzBbHhUlUzBHAhBybvhnLL+0aLIL/dz
 aTNis50lYs3O2wgHhSsPtyr8vvGZdp4aqOyRRjRBHiV2vsab10zJObLuo8UOU2c1uned
 7D1c2K2TlRpnNZtQED84r9dtGcN+QAmmrwnd7dY8kXHZ6PzDzpQVLg6lTZw7HhJXsJV4
 Unow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8TmMS6MwZdgJOnLa7VlwFtOh4OKJvPj+jftYQVqkKsk=;
 b=ViZnkVomFaGIW2brX2BkG8oqe/Erfa0QsYlZTjbawJzWofbVUI07+IgqA0sdQZoOKH
 ruuf2UMZwLqlX3oUb9GBhazt6QYBxGqWrJ7cIn8zEg/EZ/rczhaV2aMUoWOPLFH1j6SJ
 LrGvC/pnM3rpDfJDdMdAWYrXB1IfocWSIfNfxnz/5E/iyVGPzFAFxzx94qYvppCw2Rd8
 mysyrOgnHYZDV+025Rk2dSWwYvTy38ZTat5trZ5IoFPb9XGY5fUpW/cHax0vP1vg5HPi
 um3WB9LOEhL4N9diVlKQMj+TjpEFKOnK4BynGr3rilUdjZiRdgsmzYEg5e7eEdNBpxoI
 MdTg==
X-Gm-Message-State: AO0yUKWaJe5AbRifDiti2cUWbYsPyiRvWMXo28oOrN9mR1K7ROgHBq3g
 mh4VOsXPiYjFhpmudHnqmielKQ==
X-Google-Smtp-Source: AK7set8mqvBKNVCmcof2kzZjv++FIEmek/NNx1aXQ6udkF1v7P5ZXs5wczgJcRP20lg/anjPURFOHg==
X-Received: by 2002:a5d:5744:0:b0:2c5:6d14:1d96 with SMTP id
 q4-20020a5d5744000000b002c56d141d96mr1783432wrw.9.1676482254057; 
 Wed, 15 Feb 2023 09:30:54 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a5d6549000000b002bfd524255esm9481867wrv.43.2023.02.15.09.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 09:30:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2CF1C1FFB7;
 Wed, 15 Feb 2023 17:30:53 +0000 (GMT)
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-3-philmd@linaro.org>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, John Snow
 <jsnow@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 02/20] hw/ide/mmio: Use CamelCase for MMIO_IDE state name
Date: Wed, 15 Feb 2023 17:29:04 +0000
In-reply-to: <20230215112712.23110-3-philmd@linaro.org>
Message-ID: <875yc2al9u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Following docs/devel/style.rst guidelines, rename MMIOIDEState
> as IdeMmioState.

Erm the comment doesn't match what you've done s/MMIOState/MMIOIDEState/

>
> Having the structure name and its typedef named equally, we can
> manually convert from the old DECLARE_INSTANCE_CHECKER() macro to the
> more recent OBJECT_DECLARE_SIMPLE_TYPE().
>
> Note, due to that name mismatch, this macro wasn't automatically
> converted during commit 8063396bf3 ("Use OBJECT_DECLARE_SIMPLE_TYPE
> when possible").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/ide/mmio.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
>
> diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
> index fb2ebd4847..f1c6e1479b 100644
> --- a/hw/ide/mmio.c
> +++ b/hw/ide/mmio.c
> @@ -40,9 +40,7 @@
>   */
>=20=20
>  #define TYPE_MMIO_IDE "mmio-ide"
> -typedef struct MMIOIDEState MMIOState;
> -DECLARE_INSTANCE_CHECKER(MMIOState, MMIO_IDE,
> -                         TYPE_MMIO_IDE)
> +OBJECT_DECLARE_SIMPLE_TYPE(MMIOIDEState, MMIO_IDE)
>=20=20
>  struct MMIOIDEState {
>      /*< private >*/
> @@ -58,7 +56,7 @@ struct MMIOIDEState {
>=20=20
>  static void mmio_ide_reset(DeviceState *dev)
>  {
> -    MMIOState *s =3D MMIO_IDE(dev);
> +    MMIOIDEState *s =3D MMIO_IDE(dev);
>=20=20
>      ide_bus_reset(&s->bus);
>  }
> @@ -66,7 +64,7 @@ static void mmio_ide_reset(DeviceState *dev)
>  static uint64_t mmio_ide_read(void *opaque, hwaddr addr,
>                                unsigned size)
>  {
> -    MMIOState *s =3D opaque;
> +    MMIOIDEState *s =3D opaque;
>      addr >>=3D s->shift;
>      if (addr & 7)
>          return ide_ioport_read(&s->bus, addr);
> @@ -77,7 +75,7 @@ static uint64_t mmio_ide_read(void *opaque, hwaddr addr,
>  static void mmio_ide_write(void *opaque, hwaddr addr,
>                             uint64_t val, unsigned size)
>  {
> -    MMIOState *s =3D opaque;
> +    MMIOIDEState *s =3D opaque;
>      addr >>=3D s->shift;
>      if (addr & 7)
>          ide_ioport_write(&s->bus, addr, val);
> @@ -94,14 +92,14 @@ static const MemoryRegionOps mmio_ide_ops =3D {
>  static uint64_t mmio_ide_status_read(void *opaque, hwaddr addr,
>                                       unsigned size)
>  {
> -    MMIOState *s=3D opaque;
> +    MMIOIDEState *s=3D opaque;
>      return ide_status_read(&s->bus, 0);
>  }
>=20=20
>  static void mmio_ide_ctrl_write(void *opaque, hwaddr addr,
>                                  uint64_t val, unsigned size)
>  {
> -    MMIOState *s =3D opaque;
> +    MMIOIDEState *s =3D opaque;
>      ide_ctrl_write(&s->bus, 0, val);
>  }
>=20=20
> @@ -116,8 +114,8 @@ static const VMStateDescription vmstate_ide_mmio =3D {
>      .version_id =3D 3,
>      .minimum_version_id =3D 0,
>      .fields =3D (VMStateField[]) {
> -        VMSTATE_IDE_BUS(bus, MMIOState),
> -        VMSTATE_IDE_DRIVES(bus.ifs, MMIOState),
> +        VMSTATE_IDE_BUS(bus, MMIOIDEState),
> +        VMSTATE_IDE_DRIVES(bus.ifs, MMIOIDEState),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> @@ -125,7 +123,7 @@ static const VMStateDescription vmstate_ide_mmio =3D {
>  static void mmio_ide_realizefn(DeviceState *dev, Error **errp)
>  {
>      SysBusDevice *d =3D SYS_BUS_DEVICE(dev);
> -    MMIOState *s =3D MMIO_IDE(dev);
> +    MMIOIDEState *s =3D MMIO_IDE(dev);
>=20=20
>      ide_init2(&s->bus, s->irq);
>=20=20
> @@ -140,14 +138,14 @@ static void mmio_ide_realizefn(DeviceState *dev, Er=
ror **errp)
>  static void mmio_ide_initfn(Object *obj)
>  {
>      SysBusDevice *d =3D SYS_BUS_DEVICE(obj);
> -    MMIOState *s =3D MMIO_IDE(obj);
> +    MMIOIDEState *s =3D MMIO_IDE(obj);
>=20=20
>      ide_bus_init(&s->bus, sizeof(s->bus), DEVICE(obj), 0, 2);
>      sysbus_init_irq(d, &s->irq);
>  }
>=20=20
>  static Property mmio_ide_properties[] =3D {
> -    DEFINE_PROP_UINT32("shift", MMIOState, shift, 0),
> +    DEFINE_PROP_UINT32("shift", MMIOIDEState, shift, 0),
>      DEFINE_PROP_END_OF_LIST()
>  };
>=20=20
> @@ -164,7 +162,7 @@ static void mmio_ide_class_init(ObjectClass *oc, void=
 *data)
>  static const TypeInfo mmio_ide_type_info =3D {
>      .name =3D TYPE_MMIO_IDE,
>      .parent =3D TYPE_SYS_BUS_DEVICE,
> -    .instance_size =3D sizeof(MMIOState),
> +    .instance_size =3D sizeof(MMIOIDEState),
>      .instance_init =3D mmio_ide_initfn,
>      .class_init =3D mmio_ide_class_init,
>  };
> @@ -176,7 +174,7 @@ static void mmio_ide_register_types(void)
>=20=20
>  void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *h=
d1)
>  {
> -    MMIOState *s =3D MMIO_IDE(dev);
> +    MMIOIDEState *s =3D MMIO_IDE(dev);
>=20=20
>      if (hd0 !=3D NULL) {
>          ide_create_drive(&s->bus, 0, hd0);


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

