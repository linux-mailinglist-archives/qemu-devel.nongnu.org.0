Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F38646253
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 21:26:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p30zH-0005bF-G1; Wed, 07 Dec 2022 15:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1p30zF-0005ah-J6; Wed, 07 Dec 2022 15:25:49 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1p30zD-0005Sv-66; Wed, 07 Dec 2022 15:25:49 -0500
Received: by mail-wr1-x433.google.com with SMTP id d1so29776860wrs.12;
 Wed, 07 Dec 2022 12:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2VNSMgdKQNLzX5eqvdUnkuWpJBLr/A1SR5jGj0zcsUw=;
 b=S1Wu4MGOjLq84Elaijszv9U6A+gH59a1o06KwIvA2oZKDD5i+TBnX0/e7IdmULUjOH
 4gbGkMfDtIXKCpHO0Lt4zYd0bBPrvGG0Hxp/aVAhV4SfOTBIUb9aynNjhJ+nIgXnyKUR
 Kpddgk4o8PsUISdtaHt/VUFW18wQdFVZOikoNbsFPz+dUJRNOynO3uy4VJ4Cuzdb12wF
 kBZI8FUXBrVRJMwJcuzDbJIO2+cJRCRcceTzYqGIu9tjcGS5d2vAdN+Oazr0ZkE36zf2
 AcZvqsT643VHXbSZIhRHBirzh/stMKA6DKxOlzgrK4+ItusVZqAY8YLOfbNFlc0u6edv
 5crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2VNSMgdKQNLzX5eqvdUnkuWpJBLr/A1SR5jGj0zcsUw=;
 b=DrENy1bBQ4jkBR4uI96dflpOoOuTsIIeYPn4xjargtJ2xOAmg4MEJO3+4WbxG9vY7d
 WNC3pDGH96FN2ir9bAARx2t0eGR6MxK60ysHjUoqD7xRm4J7651XSIuJe9qqjsVA/TOC
 xpcq3OFatyfpMIxebaoc3+TN+CjARgpJLrRA7DRsbMhmXSrNIAnsPRHRRH0EIuMeDUrw
 G7fy07vZTANB3EVyEftrK6KhCWSmS/arbe7RARPJ0A0C7IkCRWM+//w8mE9Hh16q8XwU
 v5jpxefV3NeZt7YahXzTcFQxKxu7cxByrDrTaD6qLpt5d8OqrEwrce8UbICa+sHyAUUi
 A/6A==
X-Gm-Message-State: ANoB5plv33rcBiOHjYUoekKwvACSwqDRYypb2TkyZE7WBi4VmCry9EsD
 Ay9+5Ux+afLIzU9LAC6WCL5vMbeOEnDtOzjR0Lg=
X-Google-Smtp-Source: AA0mqf7jwMCsZlRTCjDO4QkQhwgQnoEkYOqTlGLknLODJk2PrsyL7qaBCB90lGUG4F39aoqM8+ty/L2scZYjO3xG9Hc=
X-Received: by 2002:a5d:628c:0:b0:242:23e0:b070 with SMTP id
 k12-20020a5d628c000000b0024223e0b070mr23278982wru.255.1670444743593; Wed, 07
 Dec 2022 12:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 7 Dec 2022 21:25:31 +0100
Message-ID: <CAPan3WoHZXTY4+EAkgwcHdYTice62OtRdLyjW7hdn8oQ-Swa-A@mail.gmail.com>
Subject: Re: [PATCH 0/6] Enable Cubieboard A10 boot SPL from SD card
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008f118a05ef42b91f"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000008f118a05ef42b91f
Content-Type: text/plain; charset="UTF-8"

Hello Strahinja,

Thanks for contribution these patches, and also taking the H3 into account
:-)

I've ran the avocado based acceptance tests for both boards and got these
results:

$ ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes
./build/tests/venv/bin/avocado --show=app,console run -t
machine:orangepi-pc tests/avocado/boot_linux_console.py
...
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
CANCEL 0
JOB TIME   : 114.24 s

$ ./build/tests/venv/bin/avocado --show=app,console run -t
machine:cubieboard tests/avocado/boot_linux_console.py
...
RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
CANCEL 0
JOB TIME   : 22.79 s

So that shows both machines are still running fine. During startup of the
bionic 20.08 image for orangepi-pc it did show this message:
  console: i2c i2c-0: mv64xxx: I2C bus locked, block: 1, time_left: 0
  console: sy8106a: probe of 0-0065 failed with error -110

The SY8106a appears to be an peripheral attached to the I2C bus on the
orangepi-pc, and we don't emulate the SY8106a yet, so that's an error to be
expected:
  https://linux-sunxi.org/SY8106A

So for the series:
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>

I'll try to reply to each patch as well.

Kind regards,
Niek

On Sun, Dec 4, 2022 at 12:19 AM Strahinja Jankovic <
strahinjapjankovic@gmail.com> wrote:

> This patch series adds missing Allwinner A10 modules needed for
> successful SPL boot:
> - Clock controller module
> - DRAM controller
> - I2C0 controller (added also for Allwinner H3 since it is the same)
> - AXP-209 connected to I2C0 bus
>
> It also updates Allwinner A10 emulation so SPL is copied from attached
> SD card if `-kernel` parameter is not passed when starting QEMU
> (approach adapted from Allwinner H3 implementation).
>
> Boot from SD card has been tested with Cubieboard Armbian SD card image
> and custom
> Yocto image built for Cubieboard.
> Example usage for Armbian image:
> qemu-system-arm -M cubieboard -nographic -sd
> ~/Armbian_22.11.0-trunk_Cubieboard_kinetic_edge_6.0.7.img
>
>
> Strahinja Jankovic (6):
>   hw/misc: Allwinner-A10 Clock Controller Module Emulation
>   hw/misc: Allwinner A10 DRAM Controller Emulation
>   hw/i2c: Allwinner TWI/I2C Emulation
>   hw/misc: Allwinner AXP-209 Emulation
>   hw/arm: Add AXP-209 to Cubieboard
>   hw/arm: Allwinner A10 enable SPL load from MMC
>
>  hw/arm/Kconfig                        |   5 +
>  hw/arm/allwinner-a10.c                |  40 +++
>  hw/arm/allwinner-h3.c                 |  11 +-
>  hw/arm/cubieboard.c                   |  11 +
>  hw/i2c/Kconfig                        |   4 +
>  hw/i2c/allwinner-i2c.c                | 417 ++++++++++++++++++++++++++
>  hw/i2c/meson.build                    |   1 +
>  hw/misc/Kconfig                       |  10 +
>  hw/misc/allwinner-a10-ccm.c           | 224 ++++++++++++++
>  hw/misc/allwinner-a10-dramc.c         | 179 +++++++++++
>  hw/misc/allwinner-axp-209.c           | 263 ++++++++++++++++
>  hw/misc/meson.build                   |   3 +
>  include/hw/arm/allwinner-a10.h        |  27 ++
>  include/hw/arm/allwinner-h3.h         |   3 +
>  include/hw/i2c/allwinner-i2c.h        | 112 +++++++
>  include/hw/misc/allwinner-a10-ccm.h   |  67 +++++
>  include/hw/misc/allwinner-a10-dramc.h |  68 +++++
>  17 files changed, 1444 insertions(+), 1 deletion(-)
>  create mode 100644 hw/i2c/allwinner-i2c.c
>  create mode 100644 hw/misc/allwinner-a10-ccm.c
>  create mode 100644 hw/misc/allwinner-a10-dramc.c
>  create mode 100644 hw/misc/allwinner-axp-209.c
>  create mode 100644 include/hw/i2c/allwinner-i2c.h
>  create mode 100644 include/hw/misc/allwinner-a10-ccm.h
>  create mode 100644 include/hw/misc/allwinner-a10-dramc.h
>
> --
> 2.30.2
>
>

-- 
Niek Linnenbank

--0000000000008f118a05ef42b91f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello Strahinja,</div><div><br></div=
><div>Thanks for contribution these patches, and also taking the H3 into ac=
count :-)</div><div><br></div><div>I&#39;ve ran the avocado based acceptanc=
e tests for both boards and got these results:</div><div><br></div><div>$ A=
RMBIAN_ARTIFACTS_CACHED=3Dyes AVOCADO_ALLOW_LARGE_STORAGE=3Dyes ./build/tes=
ts/venv/bin/avocado --show=3Dapp,console run -t machine:orangepi-pc tests/a=
vocado/boot_linux_console.py</div><div>...</div><div>RESULTS =C2=A0 =C2=A0:=
 PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0<br>JO=
B TIME =C2=A0 : 114.24 s</div><div><br></div><div>$ ./build/tests/venv/bin/=
avocado --show=3Dapp,console run -t machine:cubieboard tests/avocado/boot_l=
inux_console.py</div><div>...</div><div>RESULTS =C2=A0 =C2=A0: PASS 2 | ERR=
OR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0<br>JOB TIME =C2=A0=
 : 22.79 s</div><div><br></div><div>So that shows both machines are still r=
unning fine. During startup of the bionic 20.08 image for orangepi-pc it di=
d show this message:</div><div>=C2=A0 console: i2c i2c-0: mv64xxx: I2C bus =
locked, block: 1, time_left: 0<br>=C2=A0 console: sy8106a: probe of 0-0065 =
failed with error -110</div><div><br></div><div>The SY8106a appears to be a=
n peripheral attached to the I2C bus on the orangepi-pc, and we don&#39;t e=
mulate the SY8106a yet, so that&#39;s an error to be expected:<br></div><di=
v>=C2=A0 <a href=3D"https://linux-sunxi.org/SY8106A">https://linux-sunxi.or=
g/SY8106A</a></div></div><div dir=3D"ltr"><br></div><div>So for the series:=
</div><div>Tested-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@=
gmail.com">nieklinnenbank@gmail.com</a>&gt;</div><div><br></div><div>I&#39;=
ll try to reply to each patch as well.<br></div><div><br></div><div>Kind re=
gards,</div><div>Niek<br></div><div dir=3D"ltr"><br></div><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 4, 2022 at 12:1=
9 AM Strahinja Jankovic &lt;<a href=3D"mailto:strahinjapjankovic@gmail.com"=
>strahinjapjankovic@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">This patch series adds missing Allwinner A10 m=
odules needed for<br>
successful SPL boot:<br>
- Clock controller module<br>
- DRAM controller<br>
- I2C0 controller (added also for Allwinner H3 since it is the same)<br>
- AXP-209 connected to I2C0 bus<br>
<br>
It also updates Allwinner A10 emulation so SPL is copied from attached<br>
SD card if `-kernel` parameter is not passed when starting QEMU<br>
(approach adapted from Allwinner H3 implementation).<br>
<br>
Boot from SD card has been tested with Cubieboard Armbian SD card image and=
 custom<br>
Yocto image built for Cubieboard.<br>
Example usage for Armbian image:<br>
qemu-system-arm -M cubieboard -nographic -sd ~/Armbian_22.11.0-trunk_Cubieb=
oard_kinetic_edge_6.0.7.img<br>
<br>
<br>
Strahinja Jankovic (6):<br>
=C2=A0 hw/misc: Allwinner-A10 Clock Controller Module Emulation<br>
=C2=A0 hw/misc: Allwinner A10 DRAM Controller Emulation<br>
=C2=A0 hw/i2c: Allwinner TWI/I2C Emulation<br>
=C2=A0 hw/misc: Allwinner AXP-209 Emulation<br>
=C2=A0 hw/arm: Add AXP-209 to Cubieboard<br>
=C2=A0 hw/arm: Allwinner A10 enable SPL load from MMC<br>
<br>
=C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<br>
=C2=A0hw/arm/allwinner-a10.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 40 +++<br>
=C2=A0hw/arm/allwinner-h3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 11 +-<br>
=C2=A0hw/arm/cubieboard.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +<br>
=C2=A0hw/i2c/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0hw/i2c/allwinner-i2c.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 417 ++++++++++++++++++++++++++<br>
=C2=A0hw/i2c/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0hw/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +<br>
=C2=A0hw/misc/allwinner-a10-ccm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 224 ++++++++++++++<br>
=C2=A0hw/misc/allwinner-a10-dramc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 179 =
+++++++++++<br>
=C2=A0hw/misc/allwinner-axp-209.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 263 ++++++++++++++++<br>
=C2=A0hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0include/hw/arm/allwinner-a10.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 27 =
++<br>
=C2=A0include/hw/arm/allwinner-h3.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A03 +<br>
=C2=A0include/hw/i2c/allwinner-i2c.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 112 +++++=
++<br>
=C2=A0include/hw/misc/allwinner-a10-ccm.h=C2=A0 =C2=A0|=C2=A0 67 +++++<br>
=C2=A0include/hw/misc/allwinner-a10-dramc.h |=C2=A0 68 +++++<br>
=C2=A017 files changed, 1444 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 hw/i2c/allwinner-i2c.c<br>
=C2=A0create mode 100644 hw/misc/allwinner-a10-ccm.c<br>
=C2=A0create mode 100644 hw/misc/allwinner-a10-dramc.c<br>
=C2=A0create mode 100644 hw/misc/allwinner-axp-209.c<br>
=C2=A0create mode 100644 include/hw/i2c/allwinner-i2c.h<br>
=C2=A0create mode 100644 include/hw/misc/allwinner-a10-ccm.h<br>
=C2=A0create mode 100644 include/hw/misc/allwinner-a10-dramc.h<br>
<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--0000000000008f118a05ef42b91f--

