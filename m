Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CFE4AE274
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 20:57:47 +0100 (CET)
Received: from localhost ([::1]:36218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHWcT-0003jG-Qr
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 14:57:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nHUr0-0004B7-SC
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 13:04:38 -0500
Received: from [2a00:1450:4864:20::22d] (port=46771
 helo=mail-lj1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nHUqx-0002sr-HB
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 13:04:38 -0500
Received: by mail-lj1-x22d.google.com with SMTP id p21so16563266ljn.13
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 10:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PmhMLCeQtF/FY7eIo6f6RO2Xho6gsuukweFXBiw36HI=;
 b=Ak10pShRAsDNF0O1znNkYZPitxXdA/6geM5C591GfZHOPvWEEegg5KhGmJD6ingEzc
 VEDOXnvULN0rX3NpQCYDutkRy/S1mteTcmUe0mq/B6h0RjYHPA77FSZXj8PCxeeVxaBO
 X16nADkOWIU1ySNLxZJlEHD0c2s9edaeEslm0PDOB/ysnXVfQEK61/8X9EkanCmu85rJ
 TnlU9UxuGyRXz3FNdXWf0ZT9MIKElJsZbm5+Vf6QuNHbQbKbSCOVoNCseEVPxO3WuUc6
 aM14k9aYcx23IdnEV2y1adSbhlD9/wXomeZWiN6URWpf4xr0EZtGTek4/MBG4KwUmaCP
 TQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PmhMLCeQtF/FY7eIo6f6RO2Xho6gsuukweFXBiw36HI=;
 b=zUWYHip+N3SiIvGSrkC2YBLqR+BP4qbSUm3CHT3SLcqAIO4F9PhRHNouew52gZQSuC
 +NDvIGh9dvJRz/XEd5uqSEkl5LU355XvV6zwFT//9W4oE0TFuOc+2GynvDr4AoGRY+p2
 u4COpjX2Nhz4cIojRD/za0e/qDx6QNlXV8iTum9/afExL4m8D1KnlSgQGfxQyk5J+uDy
 YN/Ju0tu1ircmOaa1ZGluSYceJidmHzqw235+5QbfIA9XUTY/6hzmLAl6YC5rMMU25FA
 MfuZQYIMk549P6pSXJKasJ+RVa+F5GgkkJzjt35CaNxE8w4yT0CMiWfE8iJVxhFsDuh5
 6ugw==
X-Gm-Message-State: AOAM530yP4f0YD6V440LqAVTQW44Ux15JAYYC2BSb5uKv2xmhYGLIQme
 BQN3xzxYMDzPswry8ZcqTZNYDFED7bLmgDJI+G1Htg==
X-Google-Smtp-Source: ABdhPJwQl3Jgl3M345j8F7/dN5+ViyNstfinKv5EsofnNGz5R/gDxnkslG/6Lo/4gsZiCwy3fN7fbwZvnFGDO4tgM+8=
X-Received: by 2002:a2e:bc05:: with SMTP id b5mr3725541ljf.10.1644343473789;
 Tue, 08 Feb 2022 10:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20220208155911.3408455-1-peter.maydell@linaro.org>
 <20220208155911.3408455-3-peter.maydell@linaro.org>
In-Reply-To: <20220208155911.3408455-3-peter.maydell@linaro.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Tue, 8 Feb 2022 10:04:21 -0800
Message-ID: <CAGcCb106Jt2ms92jDbeRfT-+3NoU-hYdeO3Bbw6UxGcK14WjFg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Kconfig: Add 'imply I2C_DEVICES' on boards with
 available i2c bus
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Townsend <kevin.townsend@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a5615405d7858c5d"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=wuhaotsh@google.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--000000000000a5615405d7858c5d
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 9:23 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> For arm boards with an i2c bus which a user could reasonably
> want to plug arbitrary devices, add 'imply I2C_DEVICES' to the
> Kconfig stanza.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
> Again, slightly arbitrary but erring on the side of conservative.
> I leave non-Arm architectures out (afaict only ppc ppc4xx and e500
> enable any kind of I2C controller in their Kconfig anyway).
> ---
>  hw/arm/Kconfig | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2e0049196d6..6945330030e 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -46,6 +46,7 @@ config DIGIC
>
>  config EXYNOS4
>      bool
> +    imply I2C_DEVICES
>      select A9MPCORE
>      select I2C
>      select LAN9118
> @@ -184,6 +185,7 @@ config REALVIEW
>      bool
>      imply PCI_DEVICES
>      imply PCI_TESTDEV
> +    imply I2C_DEVICES
>      select SMC91C111
>      select LAN9118
>      select A9MPCORE
> @@ -229,6 +231,7 @@ config SABRELITE
>
>  config STELLARIS
>      bool
> +    imply I2C_DEVICES
>      select ARM_V7M
>      select CMSDK_APB_WATCHDOG
>      select I2C
> @@ -406,6 +409,7 @@ config NPCM7XX
>
>  config FSL_IMX25
>      bool
> +    imply I2C_DEVICES
>      select IMX
>      select IMX_FEC
>      select IMX_I2C
> @@ -414,6 +418,7 @@ config FSL_IMX25
>
>  config FSL_IMX31
>      bool
> +    imply I2C_DEVICES
>      select SERIAL
>      select IMX
>      select IMX_I2C
> @@ -422,6 +427,7 @@ config FSL_IMX31
>
>  config FSL_IMX6
>      bool
> +    imply I2C_DEVICES
>      select A9MPCORE
>      select IMX
>      select IMX_FEC
> @@ -450,6 +456,7 @@ config ASPEED_SOC
>
>  config MPS2
>      bool
> +    imply I2C_DEVICES
>      select ARMSSE
>      select LAN9118
>      select MPS2_FPGAIO
> @@ -466,6 +473,7 @@ config FSL_IMX7
>      bool
>      imply PCI_DEVICES
>      imply TEST_DEVICES
> +    imply I2C_DEVICES
>      select A15MPCORE
>      select PCI
>      select IMX
> @@ -481,6 +489,7 @@ config ARM_SMMUV3
>
>  config FSL_IMX6UL
>      bool
> +    imply I2C_DEVICES
>      select A15MPCORE
>      select IMX
>      select IMX_FEC
> @@ -495,6 +504,7 @@ config MICROBIT
>
>  config NRF51_SOC
>      bool
> +    imply I2C_DEVICES
>      select I2C
>      select ARM_V7M
>      select UNIMP
> --
> 2.25.1
>
>
>

--000000000000a5615405d7858c5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 8, 2022 at 9:23 AM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">For arm boards with an i2c bus which a user could reasonably<br>
want to plug arbitrary devices, add &#39;imply I2C_DEVICES&#39; to the<br>
Kconfig stanza.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br></blockquote><div>R=
eviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@goog=
le.com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
---<br>
Again, slightly arbitrary but erring on the side of conservative.<br>
I leave non-Arm architectures out (afaict only ppc ppc4xx and e500<br>
enable any kind of I2C controller in their Kconfig anyway).<br>
---<br>
=C2=A0hw/arm/Kconfig | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig<br>
index 2e0049196d6..6945330030e 100644<br>
--- a/hw/arm/Kconfig<br>
+++ b/hw/arm/Kconfig<br>
@@ -46,6 +46,7 @@ config DIGIC<br>
<br>
=C2=A0config EXYNOS4<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0 imply I2C_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0select A9MPCORE<br>
=C2=A0 =C2=A0 =C2=A0select I2C<br>
=C2=A0 =C2=A0 =C2=A0select LAN9118<br>
@@ -184,6 +185,7 @@ config REALVIEW<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0imply PCI_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0imply PCI_TESTDEV<br>
+=C2=A0 =C2=A0 imply I2C_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0select SMC91C111<br>
=C2=A0 =C2=A0 =C2=A0select LAN9118<br>
=C2=A0 =C2=A0 =C2=A0select A9MPCORE<br>
@@ -229,6 +231,7 @@ config SABRELITE<br>
<br>
=C2=A0config STELLARIS<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0 imply I2C_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0select ARM_V7M<br>
=C2=A0 =C2=A0 =C2=A0select CMSDK_APB_WATCHDOG<br>
=C2=A0 =C2=A0 =C2=A0select I2C<br>
@@ -406,6 +409,7 @@ config NPCM7XX<br>
<br>
=C2=A0config FSL_IMX25<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0 imply I2C_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0select IMX<br>
=C2=A0 =C2=A0 =C2=A0select IMX_FEC<br>
=C2=A0 =C2=A0 =C2=A0select IMX_I2C<br>
@@ -414,6 +418,7 @@ config FSL_IMX25<br>
<br>
=C2=A0config FSL_IMX31<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0 imply I2C_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0select SERIAL<br>
=C2=A0 =C2=A0 =C2=A0select IMX<br>
=C2=A0 =C2=A0 =C2=A0select IMX_I2C<br>
@@ -422,6 +427,7 @@ config FSL_IMX31<br>
<br>
=C2=A0config FSL_IMX6<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0 imply I2C_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0select A9MPCORE<br>
=C2=A0 =C2=A0 =C2=A0select IMX<br>
=C2=A0 =C2=A0 =C2=A0select IMX_FEC<br>
@@ -450,6 +456,7 @@ config ASPEED_SOC<br>
<br>
=C2=A0config MPS2<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0 imply I2C_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0select ARMSSE<br>
=C2=A0 =C2=A0 =C2=A0select LAN9118<br>
=C2=A0 =C2=A0 =C2=A0select MPS2_FPGAIO<br>
@@ -466,6 +473,7 @@ config FSL_IMX7<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0imply PCI_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0imply TEST_DEVICES<br>
+=C2=A0 =C2=A0 imply I2C_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0select A15MPCORE<br>
=C2=A0 =C2=A0 =C2=A0select PCI<br>
=C2=A0 =C2=A0 =C2=A0select IMX<br>
@@ -481,6 +489,7 @@ config ARM_SMMUV3<br>
<br>
=C2=A0config FSL_IMX6UL<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0 imply I2C_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0select A15MPCORE<br>
=C2=A0 =C2=A0 =C2=A0select IMX<br>
=C2=A0 =C2=A0 =C2=A0select IMX_FEC<br>
@@ -495,6 +504,7 @@ config MICROBIT<br>
<br>
=C2=A0config NRF51_SOC<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0 imply I2C_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0select I2C<br>
=C2=A0 =C2=A0 =C2=A0select ARM_V7M<br>
=C2=A0 =C2=A0 =C2=A0select UNIMP<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000a5615405d7858c5d--

