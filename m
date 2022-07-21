Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B507057D450
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 21:41:13 +0200 (CEST)
Received: from localhost ([::1]:50794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEc2q-0001mc-Do
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 15:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oEbz9-00006G-A4
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:37:24 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oEbz7-0003rP-7S
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:37:22 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u5so3701829wrm.4
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 12:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=NoAsgHPsuEJFQowCGfy1qcczexg2o/8JOutiXeO3qLE=;
 b=ExeCciWHFTPNBWR12Ep9UrQp0sIbBYrKtuFThv7Ccsn4qs7ExJX20Z6kpMAEQktIt/
 qmIc6JnVPZsZi56X5oHRSU/fqOPfsZ3O5+bICnUhdohLLrb8YHm5fSjswKHdNttKe7FG
 nMElEQ1j4XmygYDfu7vrTKreC4BXWE7u+722IrAgOMVMDLjxOmgZ6tUF0X4SdDK7NThl
 L19g14b8/K9lqVEGFCpgywlFyoD6ZWm94Tcs8BgzKQHaPfUDh1ZYM+wmOFLCsl2pU8GK
 Ycc7yY4YwYv1twWfjA8aRwXz3xFCHqoWRU+GnKEnegt6AObgrRvNTXr120al91wuedgM
 fOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=NoAsgHPsuEJFQowCGfy1qcczexg2o/8JOutiXeO3qLE=;
 b=CaKdvKOse/BMj9pkvfIFrOKPNWcpZpPKfFfHCsDxF86rHt5luDjECXpVTfvXbaA0cy
 UluIsn6sMFe0XPMnMD2TrZCrZpgfh84htJA/+wSvM5IhizceDIf/j6FP8A1gA+eZWFps
 tEyoayfCKaXXMwl93Bgx1A9Y8w7xxvNGh9DscwBklUPdEYqADXhlEk7N5O/z7Tkx7io6
 zVM2XQp4x2rWi+2wJtWgoPbW/ugufKFNExjHbx6HCsc4hY9XRGcpaX/Wl5VZXv12yKbq
 zEQ1+3QGH1G3M2Xv0uhDNwR8TcqX68FP/Op5LgE2LWlEYSlbQ/TsVuRcKPyTikjPctGC
 sLcQ==
X-Gm-Message-State: AJIora9sXqHRcyJNLn9SY2eUCHDFlNumDz0DJsCYKzqSdNI8bOg2as9E
 KgnfrrbgMmjcUqDvoeLmkbCbpbSZx5XQdA==
X-Google-Smtp-Source: AGRyM1uRckwLsLvfdw6ts5qOt3vedyCLS6nMazszmVY/ryn4RomUWXE5TSWNfTsyjTiqkH3Hkv2dEA==
X-Received: by 2002:adf:f5cd:0:b0:21e:50bd:cbe1 with SMTP id
 k13-20020adff5cd000000b0021e50bdcbe1mr3803wrp.540.1658432237942; 
 Thu, 21 Jul 2022 12:37:17 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c2cd600b003a2f96935c0sm1335603wmc.9.2022.07.21.12.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 12:37:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F09981FFB7;
 Thu, 21 Jul 2022 20:37:15 +0100 (BST)
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-8-pbonzini@redhat.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PULL 7/9] hw/guest-loader: pass random seed to fdt
Date: Thu, 21 Jul 2022 20:36:10 +0100
In-reply-to: <20220721163621.761513-8-pbonzini@redhat.com>
Message-ID: <87tu7az28k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Paolo Bonzini <pbonzini@redhat.com> writes:

> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
>
> If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
> initialize early. Set this using the usual guest random number
> generation function. This FDT node is part of the DT specification.
>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> Message-Id: <20220719121559.135355-1-Jason@zx2c4.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/core/guest-loader.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
> index 391c875a29..4f8572693c 100644
> --- a/hw/core/guest-loader.c
> +++ b/hw/core/guest-loader.c
> @@ -31,6 +31,7 @@
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
>  #include "qemu/module.h"
> +#include "qemu/guest-random.h"
>  #include "guest-loader.h"
>  #include "sysemu/device_tree.h"
>  #include "hw/boards.h"
> @@ -46,6 +47,7 @@ static void loader_insert_platform_data(GuestLoaderStat=
e *s, int size,
>      g_autofree char *node =3D g_strdup_printf("/chosen/module@0x%08" PRI=
x64,
>                                              s->addr);
>      uint64_t reg_attr[2] =3D {cpu_to_be64(s->addr), cpu_to_be64(size)};
> +    uint8_t rng_seed[32];
>=20=20
>      if (!fdt) {
>          error_setg(errp, "Cannot modify FDT fields if the machine has no=
ne");
> @@ -55,6 +57,9 @@ static void loader_insert_platform_data(GuestLoaderStat=
e *s, int size,
>      qemu_fdt_add_subnode(fdt, node);
>      qemu_fdt_setprop(fdt, node, "reg", &reg_attr, sizeof(reg_attr));
>=20=20
> +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> +    qemu_fdt_setprop(fdt, node, "rng-seed", rng_seed, sizeof(rng_seed));
> +

Why are we inserting this here? The guest-loader is only building on
what the machine type has already constructed which in the case of -M
virt for riscv and ARM already has code for this.

>      if (s->kernel) {
>          const char *compat[2] =3D { "multiboot,module", "multiboot,kerne=
l" };
>          if (qemu_fdt_setprop_string_array(fdt, node, "compatible",


--=20
Alex Benn=C3=A9e

