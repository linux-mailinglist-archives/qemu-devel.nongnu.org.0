Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4856B646431
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 23:41:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p334f-0000LO-8T; Wed, 07 Dec 2022 17:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1p334c-0000Kx-Np; Wed, 07 Dec 2022 17:39:31 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1p334a-0003jj-Kz; Wed, 07 Dec 2022 17:39:30 -0500
Received: by mail-wr1-x42e.google.com with SMTP id u12so29298402wrr.11;
 Wed, 07 Dec 2022 14:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S0lktgq/GBydjp83+0uRokd3kX3/lB74XBdzTqh12+g=;
 b=l3iGLDkXJ8E5HlLj58b9X8pVBdNExU1SOsI7aPQh2JhcVCg55JTetyOjjO+haTDqPN
 kqVO8quBzPLxA6Y/aHIL2toAdG2XpES9AHWaFkuYMemPCNlKpRkBvWEmvLFu4Vn+tVJL
 4qOOsv6q+6yhlnG7qlHEPLT9cbaRJbJjBFtlSqmU4JIbMWbr3BAzOh7amn0TsM5XKcsp
 vdmX4wPOfvr9a/hw70Cx+A/ssV7TGIw6vLTsqoqQnLKd83q/K1Trx2JhjmdhHvrKxkow
 A1bQ5tAYTWbEml2uScjh7ra7HknJZfV4eOGvmfFr6/Um/y8PldowblIMbVFklHtIopSp
 0ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S0lktgq/GBydjp83+0uRokd3kX3/lB74XBdzTqh12+g=;
 b=UkZA4yo+kQaakrPQ78jGpGWcJteIwpm9fDMeEfq2JVyTjwLjKS/RUrLI21lg6Z4KfN
 M76tZDn2blRu224sr6tfhDf8+26SJY4seikVqmNoZDWWhAz2BbRAhkFVS9iSx1VmtRaI
 yfIELZQmShP/jVjJQUGQFml9WlMh7oY2As5Y566U5tdVoslYJ2qILs+VThLaWrGLTerC
 0EB+8F2Zq/cvWeTa0tUa+85wW98w0kK0NfEDsrKKzSIlWseWNlUQHxxUztwgAySkvDiA
 t2zMsrFQl2u3RtQ4Yc4uvy+woAX3jU6wqz5BXQaja0jKUKDKV3Iy1q5QZ862yku1Ss3O
 aYow==
X-Gm-Message-State: ANoB5pkLUB5zwsZDvBM9YYxJebiDswbbzaYMyN8h4KBTbzqV99IEcVUK
 /u/NC1aLFpN2GX9aUy/gnQdz5tAN72cvag+BIWk=
X-Google-Smtp-Source: AA0mqf70InLld4jkA0Y1Zr8XJeaVXfG6b1PK1BvQUJ2qLgr/FNBHt5U1KatAJfH06rDlkuP4acwh2ikkXdus0bBETn8=
X-Received: by 2002:a5d:5a12:0:b0:22e:c2a6:d00d with SMTP id
 bq18-20020a5d5a12000000b0022ec2a6d00dmr50240874wrb.29.1670452766331; Wed, 07
 Dec 2022 14:39:26 -0800 (PST)
MIME-Version: 1.0
References: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
 <20221203231904.25155-7-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20221203231904.25155-7-strahinja.p.jankovic@gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 7 Dec 2022 23:39:14 +0100
Message-ID: <CAPan3WpDbNczuHaOpOYQOD5MPZ-SyqyZ2172-U6JQFn7fvHaTg@mail.gmail.com>
Subject: Re: [PATCH 6/6] hw/arm: Allwinner A10 enable SPL load from MMC
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c05cd405ef4497ae"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-wr1-x42e.google.com
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

--000000000000c05cd405ef4497ae
Content-Type: text/plain; charset="UTF-8"

Hi Strahinja,


On Sun, Dec 4, 2022 at 12:19 AM Strahinja Jankovic <
strahinjapjankovic@gmail.com> wrote:

> This patch enables copying of SPL from MMC if `-kernel` parameter is not
> passed when starting QEMU. SPL is copied to SRAM_A.
>
> The approach is reused from Allwinner H3 implementation.
>
> Tested with Armbian and custom Yocto image.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>  hw/arm/allwinner-a10.c         | 18 ++++++++++++++++++
>  hw/arm/cubieboard.c            |  5 +++++
>  include/hw/arm/allwinner-a10.h | 21 +++++++++++++++++++++
>  3 files changed, 44 insertions(+)
>
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index 17e439777e..dc1966ff7a 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -24,7 +24,9 @@
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
>  #include "hw/usb/hcd-ohci.h"
> +#include "hw/loader.h"
>
> +#define AW_A10_SRAM_A_BASE      0x00000000
>  #define AW_A10_DRAMC_BASE       0x01c01000
>  #define AW_A10_MMC0_BASE        0x01c0f000
>  #define AW_A10_CCM_BASE         0x01c20000
> @@ -38,6 +40,22 @@
>  #define AW_A10_RTC_BASE         0x01c20d00
>  #define AW_A10_I2C0_BASE        0x01c2ac00
>
> +void allwinner_a10_bootrom_setup(AwA10State *s, BlockBackend *blk)
> +{
> +    const int64_t rom_size = 32 * KiB;
> +    g_autofree uint8_t *buffer = g_new0(uint8_t, rom_size);
> +
> +    if (blk_pread(blk, 8 * KiB, rom_size, buffer, 0) < 0) {
> +        error_setg(&error_fatal, "%s: failed to read BlockBackend data",
> +                   __func__);
> +        return;
> +    }
> +
> +    rom_add_blob("allwinner-a10.bootrom", buffer, rom_size,
> +                  rom_size, AW_A10_SRAM_A_BASE,
> +                  NULL, NULL, NULL, NULL, false);
> +}
>

Its probably fine for now to do it in the same way here for the A10 indeed.
Perhaps in the future, we can try
to share some overlapping code between the A10 and H3.

So the patch looks fine to me:
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Regards,
Niek


> +
>  static void aw_a10_init(Object *obj)
>  {
>      AwA10State *s = AW_A10(obj);
> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> index afc7980414..37659c35fd 100644
> --- a/hw/arm/cubieboard.c
> +++ b/hw/arm/cubieboard.c
> @@ -99,6 +99,11 @@ static void cubieboard_init(MachineState *machine)
>      memory_region_add_subregion(get_system_memory(), AW_A10_SDRAM_BASE,
>                                  machine->ram);
>
> +    /* Load target kernel or start using BootROM */
> +    if (!machine->kernel_filename && blk && blk_is_available(blk)) {
> +        /* Use Boot ROM to copy data from SD card to SRAM */
> +        allwinner_a10_bootrom_setup(a10, blk);
> +    }
>      /* TODO create and connect IDE devices for ide_drive_get() */
>
>      cubieboard_binfo.ram_size = machine->ram_size;
> diff --git a/include/hw/arm/allwinner-a10.h
> b/include/hw/arm/allwinner-a10.h
> index 763935fca9..b3c9ed24c7 100644
> --- a/include/hw/arm/allwinner-a10.h
> +++ b/include/hw/arm/allwinner-a10.h
> @@ -15,6 +15,7 @@
>  #include "hw/misc/allwinner-a10-ccm.h"
>  #include "hw/misc/allwinner-a10-dramc.h"
>  #include "hw/i2c/allwinner-i2c.h"
> +#include "sysemu/block-backend.h"
>
>  #include "target/arm/cpu.h"
>  #include "qom/object.h"
> @@ -47,4 +48,24 @@ struct AwA10State {
>      OHCISysBusState ohci[AW_A10_NUM_USB];
>  };
>
> +/**
> + * Emulate Boot ROM firmware setup functionality.
> + *
> + * A real Allwinner A10 SoC contains a Boot ROM
> + * which is the first code that runs right after
> + * the SoC is powered on. The Boot ROM is responsible
> + * for loading user code (e.g. a bootloader) from any
> + * of the supported external devices and writing the
> + * downloaded code to internal SRAM. After loading the SoC
> + * begins executing the code written to SRAM.
> + *
> + * This function emulates the Boot ROM by copying 32 KiB
> + * of data from the given block device and writes it to
> + * the start of the first internal SRAM memory.
> + *
> + * @s: Allwinner A10 state object pointer
> + * @blk: Block backend device object pointer
> + */
> +void allwinner_a10_bootrom_setup(AwA10State *s, BlockBackend *blk);
> +
>  #endif
> --
> 2.30.2
>
>

-- 
Niek Linnenbank

--000000000000c05cd405ef4497ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Strahinja,</div><div><br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Sun, Dec 4, 2022 at 12:19 AM Strahinja Jankovic &lt;<a href=3D"mailto:stra=
hinjapjankovic@gmail.com">strahinjapjankovic@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">This patch enables co=
pying of SPL from MMC if `-kernel` parameter is not<br>
passed when starting QEMU. SPL is copied to SRAM_A.<br>
<br>
The approach is reused from Allwinner H3 implementation.<br>
<br>
Tested with Armbian and custom Yocto image.<br>
<br>
Signed-off-by: Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p.jankovi=
c@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/arm/allwinner-a10.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++=
++++++++++<br>
=C2=A0hw/arm/cubieboard.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
5 +++++<br>
=C2=A0include/hw/arm/allwinner-a10.h | 21 +++++++++++++++++++++<br>
=C2=A03 files changed, 44 insertions(+)<br>
<br>
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c<br>
index 17e439777e..dc1966ff7a 100644<br>
--- a/hw/arm/allwinner-a10.c<br>
+++ b/hw/arm/allwinner-a10.c<br>
@@ -24,7 +24,9 @@<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
=C2=A0#include &quot;hw/usb/hcd-ohci.h&quot;<br>
+#include &quot;hw/loader.h&quot;<br>
<br>
+#define AW_A10_SRAM_A_BASE=C2=A0 =C2=A0 =C2=A0 0x00000000<br>
=C2=A0#define AW_A10_DRAMC_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c01000<br>
=C2=A0#define AW_A10_MMC0_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c0f000<br>
=C2=A0#define AW_A10_CCM_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x01c20000<b=
r>
@@ -38,6 +40,22 @@<br>
=C2=A0#define AW_A10_RTC_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x01c20d00<b=
r>
=C2=A0#define AW_A10_I2C0_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c2ac00<br>
<br>
+void allwinner_a10_bootrom_setup(AwA10State *s, BlockBackend *blk)<br>
+{<br>
+=C2=A0 =C2=A0 const int64_t rom_size =3D 32 * KiB;<br>
+=C2=A0 =C2=A0 g_autofree uint8_t *buffer =3D g_new0(uint8_t, rom_size);<br=
>
+<br>
+=C2=A0 =C2=A0 if (blk_pread(blk, 8 * KiB, rom_size, buffer, 0) &lt; 0) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;error_fatal, &quot;%s: failed =
to read BlockBackend data&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__fun=
c__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 rom_add_blob(&quot;allwinner-a10.bootrom&quot;, buffer, rom_=
size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rom_size, A=
W_A10_SRAM_A_BASE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL,=
 NULL, NULL, false);<br>
+}<br></blockquote><div><br></div><div>Its probably fine for now to do it i=
n the same way here for the A10 indeed. Perhaps in the future, we can try</=
div><div>to share some overlapping code between the A10 and H3.</div><div><=
br></div><div>So the patch looks fine to me:</div><div>Reviewed-by: Niek Li=
nnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">nieklinnenbank@gma=
il.com</a>&gt;</div><div><br></div><div>Regards,</div><div>Niek<br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0static void aw_a10_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0AwA10State *s =3D AW_A10(obj);<br>
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c<br>
index afc7980414..37659c35fd 100644<br>
--- a/hw/arm/cubieboard.c<br>
+++ b/hw/arm/cubieboard.c<br>
@@ -99,6 +99,11 @@ static void cubieboard_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(get_system_memory(), AW_A10=
_SDRAM_BASE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0machine-&gt;ram);<br>
<br>
+=C2=A0 =C2=A0 /* Load target kernel or start using BootROM */<br>
+=C2=A0 =C2=A0 if (!machine-&gt;kernel_filename &amp;&amp; blk &amp;&amp; b=
lk_is_available(blk)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Use Boot ROM to copy data from SD card to S=
RAM */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner_a10_bootrom_setup(a10, blk);<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0/* TODO create and connect IDE devices for ide_drive_ge=
t() */<br>
<br>
=C2=A0 =C2=A0 =C2=A0cubieboard_binfo.ram_size =3D machine-&gt;ram_size;<br>
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.=
h<br>
index 763935fca9..b3c9ed24c7 100644<br>
--- a/include/hw/arm/allwinner-a10.h<br>
+++ b/include/hw/arm/allwinner-a10.h<br>
@@ -15,6 +15,7 @@<br>
=C2=A0#include &quot;hw/misc/allwinner-a10-ccm.h&quot;<br>
=C2=A0#include &quot;hw/misc/allwinner-a10-dramc.h&quot;<br>
=C2=A0#include &quot;hw/i2c/allwinner-i2c.h&quot;<br>
+#include &quot;sysemu/block-backend.h&quot;<br>
<br>
=C2=A0#include &quot;target/arm/cpu.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
@@ -47,4 +48,24 @@ struct AwA10State {<br>
=C2=A0 =C2=A0 =C2=A0OHCISysBusState ohci[AW_A10_NUM_USB];<br>
=C2=A0};<br>
<br>
+/**<br>
+ * Emulate Boot ROM firmware setup functionality.<br>
+ *<br>
+ * A real Allwinner A10 SoC contains a Boot ROM<br>
+ * which is the first code that runs right after<br>
+ * the SoC is powered on. The Boot ROM is responsible<br>
+ * for loading user code (e.g. a bootloader) from any<br>
+ * of the supported external devices and writing the<br>
+ * downloaded code to internal SRAM. After loading the SoC<br>
+ * begins executing the code written to SRAM.<br>
+ *<br>
+ * This function emulates the Boot ROM by copying 32 KiB<br>
+ * of data from the given block device and writes it to<br>
+ * the start of the first internal SRAM memory.<br>
+ *<br>
+ * @s: Allwinner A10 state object pointer<br>
+ * @blk: Block backend device object pointer<br>
+ */<br>
+void allwinner_a10_bootrom_setup(AwA10State *s, BlockBackend *blk);<br>
+<br>
=C2=A0#endif<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000c05cd405ef4497ae--

