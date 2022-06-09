Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5580F5444DA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 09:33:32 +0200 (CEST)
Received: from localhost ([::1]:42800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzCfa-0000zY-QI
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 03:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzCYy-0000Bk-VT
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:26:42 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzCYw-0006wq-PU
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:26:40 -0400
Received: by mail-wr1-x432.google.com with SMTP id h5so31170361wrb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 00:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2SFu2HtkOUwy/jTaH3okMFuI2t4yINjmCnz8bJNlNYM=;
 b=jeWQbdRbWMeoHcI19SIOLd+KUaR5iTgApt7gK/2fpdrL81xN3naVwyeNkJKJKrfWLP
 eTG0umtZJYj1T/K4LEhJoG0wMOAsbYeqJPSeHvpUOTgEIUhGUC/mDxcFHZJTj31rR+Rj
 dkdY1AN1rFHQso4NL0Blp790ckl8ThbFZKHFz4QysYASWI5STQghy53tPgCez7YKeIdx
 lU9YTGpqzD8qyqguRr+5nQEXX1MxWVqkoQMlVkOyKuac1N5exGH3oTZyijQr09b/VbJU
 ETLnX6O4UHFB5MdPvN0giTZfBgbDdzvcPhYkfOiu61nO/WLlttLARcdpBcReNx8w7lK2
 sMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2SFu2HtkOUwy/jTaH3okMFuI2t4yINjmCnz8bJNlNYM=;
 b=jHOhXuEPPBlRiJbQuBebtDW0aY3bhusxrOcB3Gvx4htS5Mx3rd0pHbzk7Yu/qZZOd+
 dELieR8pjkqVSFFb6+zOUB+bztMGBXCTizHt2aJeDroqNv4hrhZkucXZT0LHi8e1BXTm
 9fiur/D748MHJGJyFt9MKTKK1gJ4g/Bds0tevkLhDzbWOyPUdJNfT5ooRUbUALZm/Mdf
 IvhK/kixAI/tzN0b++Sh0Rsd0JXHohe5RFmFJbQ1y0bnlUw74GZbBnFYLcSz0iX29uS4
 B2CDVBCp6a9dNwHCkUwsYTOU1UwHICLj5yzv173HMMO5WClC6Bmxgl/binINkoK8uvdj
 bjsg==
X-Gm-Message-State: AOAM533BcKtPJ+iVfNgXn5L2jh+hwYkrCS0TCgKT3GlETNvH3fofFSI5
 M51Qdmx2l3sElZ1UF5lFLKhq/A==
X-Google-Smtp-Source: ABdhPJwah6x0xZ6/kaMiMMMF1J11TdewnvqFaMJkwMjXH+d8hbwc7lE0425h7d4Rg7tANc+rMvE2TQ==
X-Received: by 2002:adf:eb11:0:b0:213:19dd:e1aa with SMTP id
 s17-20020adfeb11000000b0021319dde1aamr36027474wrn.324.1654759597087; 
 Thu, 09 Jun 2022 00:26:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 bh11-20020a05600c3d0b00b0039c63f4bce0sm4441951wmb.12.2022.06.09.00.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 00:26:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EADF61FFB7;
 Thu,  9 Jun 2022 08:26:34 +0100 (BST)
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-9-richard.henderson@linaro.org>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 08/53] semihosting: Split out guestfd.c
Date: Thu, 09 Jun 2022 08:24:04 +0100
In-reply-to: <20220607204557.658541-9-richard.henderson@linaro.org>
Message-ID: <87wndqs3f9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> In arm-compat-semi.c, we have more advanced treatment of
> guest file descriptors than we do in other implementations.
> Split out GuestFD and related functions to a new file so
> that they can be shared.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configs/targets/aarch64-linux-user.mak    |   1 +
>  configs/targets/aarch64_be-linux-user.mak |   1 +
>  configs/targets/arm-linux-user.mak        |   1 +
>  configs/targets/armeb-linux-user.mak      |   1 +
>  configs/targets/riscv32-linux-user.mak    |   1 +
>  configs/targets/riscv64-linux-user.mak    |   1 +
>  include/semihosting/guestfd.h             |  83 +++++++++++
>  semihosting/arm-compat-semi.c             | 164 +++-------------------
>  semihosting/guestfd.c                     | 118 ++++++++++++++++
>  semihosting/meson.build                   |   4 +
>  10 files changed, 233 insertions(+), 142 deletions(-)
>  create mode 100644 include/semihosting/guestfd.h
>  create mode 100644 semihosting/guestfd.c
>
> diff --git a/configs/targets/aarch64-linux-user.mak b/configs/targets/aar=
ch64-linux-user.mak
> index d0c603c54e..db552f1839 100644
> --- a/configs/targets/aarch64-linux-user.mak
> +++ b/configs/targets/aarch64-linux-user.mak
> @@ -2,4 +2,5 @@ TARGET_ARCH=3Daarch64
>  TARGET_BASE_ARCH=3Darm
>  TARGET_XML_FILES=3D gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
>  TARGET_HAS_BFLT=3Dy
> +CONFIG_SEMIHOSTING=3Dy
>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
> diff --git a/configs/targets/aarch64_be-linux-user.mak b/configs/targets/=
aarch64_be-linux-user.mak
> index 7794424745..dc78044fb1 100644
> --- a/configs/targets/aarch64_be-linux-user.mak
> +++ b/configs/targets/aarch64_be-linux-user.mak
> @@ -3,4 +3,5 @@ TARGET_BASE_ARCH=3Darm
>  TARGET_BIG_ENDIAN=3Dy
>  TARGET_XML_FILES=3D gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
>  TARGET_HAS_BFLT=3Dy
> +CONFIG_SEMIHOSTING=3Dy
>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
> diff --git a/configs/targets/arm-linux-user.mak b/configs/targets/arm-lin=
ux-user.mak
> index 3e10d6b15d..7f5d65794c 100644
> --- a/configs/targets/arm-linux-user.mak
> +++ b/configs/targets/arm-linux-user.mak
> @@ -3,4 +3,5 @@ TARGET_SYSTBL_ABI=3Dcommon,oabi
>  TARGET_SYSTBL=3Dsyscall.tbl
>  TARGET_XML_FILES=3D gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm=
-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-pr=
ofile.xml gdb-xml/arm-m-profile-mve.xml
>  TARGET_HAS_BFLT=3Dy
> +CONFIG_SEMIHOSTING=3Dy
>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
> diff --git a/configs/targets/armeb-linux-user.mak b/configs/targets/armeb=
-linux-user.mak
> index a249cc2e29..943d0d87bf 100644
> --- a/configs/targets/armeb-linux-user.mak
> +++ b/configs/targets/armeb-linux-user.mak
> @@ -4,4 +4,5 @@ TARGET_SYSTBL=3Dsyscall.tbl
>  TARGET_BIG_ENDIAN=3Dy
>  TARGET_XML_FILES=3D gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm=
-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-pr=
ofile.xml gdb-xml/arm-m-profile-mve.xml
>  TARGET_HAS_BFLT=3Dy
> +CONFIG_SEMIHOSTING=3Dy
>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
> diff --git a/configs/targets/riscv32-linux-user.mak b/configs/targets/ris=
cv32-linux-user.mak
> index bd2f1fd497..9761618e67 100644
> --- a/configs/targets/riscv32-linux-user.mak
> +++ b/configs/targets/riscv32-linux-user.mak
> @@ -2,4 +2,5 @@ TARGET_ARCH=3Driscv32
>  TARGET_BASE_ARCH=3Driscv
>  TARGET_ABI_DIR=3Driscv
>  TARGET_XML_FILES=3D gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.=
xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-virtual.xml
> +CONFIG_SEMIHOSTING=3Dy
>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
> diff --git a/configs/targets/riscv64-linux-user.mak b/configs/targets/ris=
cv64-linux-user.mak
> index 4aca7662ce..cfd1fd382f 100644
> --- a/configs/targets/riscv64-linux-user.mak
> +++ b/configs/targets/riscv64-linux-user.mak
> @@ -2,4 +2,5 @@ TARGET_ARCH=3Driscv64
>  TARGET_BASE_ARCH=3Driscv
>  TARGET_ABI_DIR=3Driscv
>  TARGET_XML_FILES=3D gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.=
xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-virtual.xml
> +CONFIG_SEMIHOSTING=3Dy
>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy

Why are these needed? The:

config ARM_COMPATIBLE_SEMIHOSTING
       bool
       select SEMIHOSTING

stanza should ensure we select SEMIHOSTING automatically.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

