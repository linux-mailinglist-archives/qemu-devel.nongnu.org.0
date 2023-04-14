Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B796E1EE1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 10:59:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnFFi-0001em-NQ; Fri, 14 Apr 2023 04:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnFFg-0001eX-4N
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 04:57:53 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnFFd-0008Tb-7h
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 04:57:51 -0400
Received: by mail-wr1-x435.google.com with SMTP id s12so8273920wrb.1
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 01:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681462666; x=1684054666;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eDD6Wtd9xSL8VMkeMgcMdqY5gqO9FJ6mHihjzupIffE=;
 b=QZ9fpUT5qSKLlIJGH/whe/vwDwnG/G6kj+ieSKHFOOpxExuj9K3yE/BgRzci5Cnwod
 BFqlKOQG3sLFSLQtDnhY/TdxnvetOcRqeR3rjBQwbBjkhr6Nd2OwnfVCnHn9uXbUaRjt
 yrkwjzHADhzz9WARPZiczfgjtRK6u2vnuyCGTCfvevjWFylXi12oYlLl0IZpBtZARo83
 yT0KpA/u3MH+RZdqMVr8W7Ar3ZHzk/AtV1yg5WPuT73e3Ws+IO4ZipxZh12NMtkZ3L4p
 Zr9uE2ExJ+oz0U5dFFyO4faggeZjHw9R78nnD6HP+PEjUnjeT7pLlgVewsK/N1YKK734
 i7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681462666; x=1684054666;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eDD6Wtd9xSL8VMkeMgcMdqY5gqO9FJ6mHihjzupIffE=;
 b=Sn4OqnIoVtxeXWfUnlYdQjYmn0B/CaDnjtxX0QKSkxQDyEPxpX9APXZS20N6m6r2fJ
 HV9RqFes5Eih05+yHXrKkMidpRBIGdjjySPbq8RmkFxwGlkZdQKzkU7hR5bGgnZe4HEK
 zPKi+l2pGzGirt7l25iLSE6d4HR9v3qVbSXjbMir6qDgFrq/9FRON4drjaCK2aD0CEzx
 vC06s5Ehspb7oHLM3VuJ65lPHIdxF9GTqOoyXcLVoEgnOghHjAaRELcOtuu680/6LjQ5
 pa1VhEMonbdUn4TBo8RHuNWMi2m7C7h6dB94D8T/WjTddloPoro+jA1aY9+3wrf2Q6ly
 VjYw==
X-Gm-Message-State: AAQBX9enalpphp89KUHW/D7RC/WuoPdw4ZMmXAt57NDwo3h/82snWQop
 Gqva3T/JiC3d+Hx9CE5wf4u75Q==
X-Google-Smtp-Source: AKy350ZJ5z5hKOIaTjYFpnI6jc0qM3SgzKNhlqI4bLSGQvMMOxcpUysrvjSARNdthd1Mzbz0eBp45w==
X-Received: by 2002:adf:edce:0:b0:2f4:a60f:3cd8 with SMTP id
 v14-20020adfedce000000b002f4a60f3cd8mr4098491wro.49.1681462666190; 
 Fri, 14 Apr 2023 01:57:46 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w13-20020adfec4d000000b002efb6e0c495sm3058052wrn.91.2023.04.14.01.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 01:57:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6E6E51FFB7;
 Fri, 14 Apr 2023 09:57:45 +0100 (BST)
References: <20230414073432.36000-1-slankes@eonerc.rwth-aachen.de>
 <20230414073432.36000-2-slankes@eonerc.rwth-aachen.de>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Lankes <slankes@eonerc.rwth-aachen.de>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [RFC 1/1] add support of `--initrd` for ELF-ARM kernels
Date: Fri, 14 Apr 2023 09:54:50 +0100
In-reply-to: <20230414073432.36000-2-slankes@eonerc.rwth-aachen.de>
Message-ID: <87v8hyc03a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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


Stefan Lankes <slankes@eonerc.rwth-aachen.de> writes:

> Currently, the flag `--initrd` is only support for Linux ARM kernels.
> However, also other ELF kernels could depend on an initial ramdisk.
> This PR loads also the initrd for ELF kernels and announce the
> location by the nodes "/chosen/initrd-start" and
> "/chosen/initrd-end" within the device tree.
>
> Signed-off-by: Stefan Lankes <slankes@eonerc.rwth-aachen.de>
> ---
>  hw/arm/boot.c | 106 +++++++++++++++++++++++++++++---------------------
>  1 file changed, 62 insertions(+), 44 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 54f6a3e0b3..f767a4809e 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -657,20 +657,38 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot=
_info *binfo,
>      }
>=20=20
>      if (binfo->initrd_size) {
> -        rc =3D qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initr=
d-start",
> +        if (binfo->is_linux) {
> +            rc =3D qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,i=
nitrd-start",
>                                            acells, binfo->initrd_start);
> -        if (rc < 0) {
> -            fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
> -            goto fail;
> -        }
> +            if (rc < 0) {
> +                fprintf(stderr, "couldn't set /chosen/linux,initrd-start=
\n");
> +                goto fail;
> +            }
>=20=20
> -        rc =3D qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initr=
d-end",
> -                                          acells,
> -                                          binfo->initrd_start +
> -                                          binfo->initrd_size);
> -        if (rc < 0) {
> -            fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
> -            goto fail;
> +            rc =3D qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,i=
nitrd-end",
> +                                              acells,
> +                                              binfo->initrd_start +
> +                                              binfo->initrd_size);
> +            if (rc < 0) {
> +                fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n=
");
> +                goto fail;
> +            }
> +        } else {
> +            rc =3D qemu_fdt_setprop_sized_cells(fdt, "/chosen", "initrd-=
start",
> +                                          acells, binfo->initrd_start);
> +            if (rc < 0) {
> +                fprintf(stderr, "couldn't set /chosen/initrd-start\n");
> +                goto fail;
> +            }
> +
> +            rc =3D qemu_fdt_setprop_sized_cells(fdt, "/chosen", "initrd-=
end",
> +                                              acells,
> +                                              binfo->initrd_start +
> +                                              binfo->initrd_size);
> +            if (rc < 0) {
> +                fprintf(stderr, "couldn't set /chosen/initrd-end\n");
> +                goto fail;
> +            }

Where are these DTB nodes documented?

Also could you not achieve the same thing using the guest-loader which
uses the multiboot spec and sets:

        const char *compat[2] =3D { "multiboot,module", "multiboot,ramdisk"=
 };
        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
                                          (char **) &compat,
                                          ARRAY_SIZE(compat)) < 0) {
            error_setg(errp, "couldn't set %s/compatible", node);
            return;
        }


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

