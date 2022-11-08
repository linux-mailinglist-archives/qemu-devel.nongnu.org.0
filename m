Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E9C620BF4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 10:19:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKl4-0004xC-Tu; Tue, 08 Nov 2022 04:19:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKkx-0004wn-RO
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:18:57 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKkw-00029m-0m
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:18:55 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so11253496wmb.2
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 01:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v2JRmEKAT6f4qXFlo0Y5LNXYJSwLhiIsRo5jMa/3LGc=;
 b=MC/EKtWOlYmitLIW5PeOgz1AgEPLH7dF6f5aNwm0IhVeENyV3K6jQVDfVEp4Eyil9p
 214uVa6MPZvNyTmuU4IJbRVfirR1i60dcOuHJfuaF5IQSyQ/yfvahQwLySUpVxw8UaDJ
 xbkYhZOEBHZOaZ4wopd6bZGp0imsfASckksG7qWUrmLAiwpcSXFtNSYogO93fTh2C5J5
 y5LhPlVp4OuzKMqGM02Mkd5lWg+wVftFqSMUxE4HFu6VRZa0IzQZJP6+Y7n0BAyt7XqZ
 vH1ZX8NQPdXE3p8hBPGe+l4elFyudcXrvc4xxH1S0YQmoYP7rHeZO+j+KoRcywsE/pWF
 qXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=v2JRmEKAT6f4qXFlo0Y5LNXYJSwLhiIsRo5jMa/3LGc=;
 b=oRwAVZ4cTQxxsWKp0DmLI0qmioxWpr6ULgjTQWIpkrtEIj69VAHfHscIEZwrCigSya
 pwRohhY+RLXuipygWWQ8PLhRbHdrBBLKkxlBPR3hdhjG+EU1UpGoZO0BRFC5/TVxeCAW
 YTWUxmZNNp+ZuGF081YUw3asUCuz+MkEPYtUvTVbFt+xFKSshuD3zJPn0qfNFQJF8i3+
 Y6bgQo+5wYYe9qkoNvgxV7bePLe2BoHPf8zA4nNhoOXOsPEfAqOL59f/xT7EACMAfKDo
 hL45zS0ORlGVYy1wayDRnKGnQwxeOaoyfc2sQTxk+2dhL3AmMAy7Iwj+6t/CCtwLdzmb
 CQYw==
X-Gm-Message-State: ANoB5pkCqYRaH+WYWQ6/vGofpD9+hwEvjf/0PhmMMoPtSMq2lnmo8uOB
 wqu2jNST95OLzF7EUqA8bQAlNQ==
X-Google-Smtp-Source: AA0mqf6MdGpQ2hTAs4nWflGHR28uIPBth3Lm7GdWMSsRUweg4G63C8r4T0wSWjdHSsTiIFFEyOc5Rw==
X-Received: by 2002:a1c:f710:0:b0:3cf:b079:df13 with SMTP id
 v16-20020a1cf710000000b003cfb079df13mr4935480wmh.16.1667899132050; 
 Tue, 08 Nov 2022 01:18:52 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c351300b003b4ff30e566sm32874518wmq.3.2022.11.08.01.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 01:18:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9EB031FFB7;
 Tue,  8 Nov 2022 09:18:50 +0000 (GMT)
References: <20221108023542.17557-1-schspa@gmail.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Schspa Shi <schspa@gmail.com>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
Date: Tue, 08 Nov 2022 09:14:04 +0000
In-reply-to: <20221108023542.17557-1-schspa@gmail.com>
Message-ID: <87fsetg5xh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Schspa Shi <schspa@gmail.com> writes:

> We use 32bit value for linux,initrd-[start/end], when we have
> loader_start > 4GB, there will be a wrong initrd_start passed
> to the kernel, and the kernel will report the following warning.
>
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] initrd not fully accessible via the linear mapping -- plea=
se check your bootloader ...
> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/init.c:355 arm64_m=
emblock_init+0x158/0x244
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W          6=
.1.0-rc3-13250-g30a0b95b1335-dirty #28
> [    0.000000] Hardware name: Horizon Sigi Virtual development board
> (DT)

Is this an out-of-tree board model?

> [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    0.000000] pc : arm64_memblock_init+0x158/0x244
> [    0.000000] lr : arm64_memblock_init+0x158/0x244
> [    0.000000] sp : ffff800009273df0
> [    0.000000] x29: ffff800009273df0 x28: 0000001000cc0010 x27: 000080000=
0000000
> [    0.000000] x26: 000000000050a3e2 x25: ffff800008b46000 x24: ffff80000=
8b46000
> [    0.000000] x23: ffff800008a53000 x22: ffff800009420000 x21: ffff80000=
8a53000
> [    0.000000] x20: 0000000004000000 x19: 0000000004000000 x18: 00000000f=
fff1020
> [    0.000000] x17: 6568632065736165 x16: 6c70202d2d20676e x15: 697070616=
d207261
> [    0.000000] x14: 656e696c20656874 x13: 0a2e2e2e20726564 x12: 000000000=
0000000
> [    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 000000000=
0000000
> [    0.000000] x8 : 0000000000000000 x7 : 796c6c756620746f x6 : 6e2064727=
4696e69
> [    0.000000] x5 : ffff8000093c7c47 x4 : ffff800008a2102f x3 : ffff80000=
9273a88
> [    0.000000] x2 : 80000000fffff038 x1 : 00000000000000c0 x0 : 000000000=
0000056
> [    0.000000] Call trace:
> [    0.000000]  arm64_memblock_init+0x158/0x244
> [    0.000000]  setup_arch+0x164/0x1cc
> [    0.000000]  start_kernel+0x94/0x4ac
> [    0.000000]  __primary_switched+0xb4/0xbc
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000001000000000-0x0000001007ffffff]
>
> To fix it, we can change it to u64 type.
>
> Signed-off-by: Schspa Shi <schspa@gmail.com>
> ---
>  hw/arm/boot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 57efb61ee419..da719a4f8874 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -638,14 +638,14 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot=
_info *binfo,
>      }
>=20=20
>      if (binfo->initrd_size) {
> -        rc =3D qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start=
",
> +        rc =3D qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-start",
>                                     binfo->initrd_start);
>          if (rc < 0) {
>              fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
>              goto fail;
>          }
>=20=20
> -        rc =3D qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
> +        rc =3D qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-end",
>                                     binfo->initrd_start + binfo->initrd_s=
ize);
>          if (rc < 0) {
>              fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");

On the face of things this seems fine because unlike the other linux
properties they are not specified to be "expressed in #address-cells and
#size-cells" but I do wonder how we got into the situation where the
kernel and initrd ended up so high in the physical address space.

There is a whole comment in boot.c talking about keeping initrd within
lowmem:

    /*
     * We want to put the initrd far enough into RAM that when the
     * kernel is uncompressed it will not clobber the initrd. However
     * on boards without much RAM we must ensure that we still leave
     * enough room for a decent sized initrd, and on boards with large
     * amounts of RAM we must avoid the initrd being so far up in RAM
     * that it is outside lowmem and inaccessible to the kernel.
     * So for boards with less  than 256MB of RAM we put the initrd
     * halfway into RAM, and for boards with 256MB of RAM or more we put
     * the initrd at 128MB.
     * We also refuse to put the initrd somewhere that will definitely
     * overlay the kernel we just loaded, though for kernel formats which
     * don't tell us their exact size (eg self-decompressing 32-bit kernels)
     * we might still make a bad choice here.
     */

Is this just because the base RAM address of the board is outside of the
32 bit address range?

--=20
Alex Benn=C3=A9e

