Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDF544B1AB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 18:02:43 +0100 (CET)
Received: from localhost ([::1]:60404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUW6-0002eR-PP
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 12:02:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkUSD-0008M7-RS
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:58:37 -0500
Received: from [2607:f8b0:4864:20::d32] (port=33410
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkUS8-00046S-BE
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:58:37 -0500
Received: by mail-io1-xd32.google.com with SMTP id m9so8688485iop.0
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 08:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=mATdzEcQXJGsQMLycsWHAnVQlvBax+qUFp8agNQAzfE=;
 b=FhdRCLJn6JPZM0evpWAuGy7RY7tEbkSdFk8oLCKTg7NUk865m7V+/nhvzRrpIqqW8q
 U1UyFv2iNaSMpnneCkVoK8nBQvcJdnCQEePYeZEZ+9iwEC4taZKagRICxGKw71lINvXA
 DsjF+TviRlRPueg5bQwprTx1oRed0XPgRRLu25LEdykrG9DrAUDsG/2YRfarD6UTjXol
 ws3nOhMGigTyEoQK7ozCoN9Qm0oEZEpzbcCWRzlBoDpYRfFxUq8jMzU7q5PxFCPkwjVn
 w4uliixXqbpjQr7bGeV7EOPM+/vN2M7H9FNNHg7NcxnXN3pL+9lEevX+nwMxumZQ7YPn
 Rj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=mATdzEcQXJGsQMLycsWHAnVQlvBax+qUFp8agNQAzfE=;
 b=5xH0lxaBHnfEdzMBMr+KQWQVZDz5OiAleF3NrWpXmBTPR9DyZczs9eqn1nrVVz4O49
 cKXE9HLre1svDvzI1HiUtgPa7LOSfa/OvkmAlfvyuZB9hpPaV5a+zsNJbDdchx1Phkk8
 MYzAWrP7iE/Dc5xpwyENwSqLqo/M2NEDHfJ4rxPokRptNWHCtzQqZ7tkuLV1BnCVIe4D
 YrNKphdNB/Mjqy6eMzTjHwIQAJr1IMfGg9rUDJUu2M59Zy9Wpj9+cCKz97CzSaUSozY+
 ct4G6Xyp2J6u8I79i/9a7lmm89d/TRBoISw3Z7mkjIcB5Dm8HbHil4uDkAWIobvbHXsX
 40Hg==
X-Gm-Message-State: AOAM5325xgkjCGYHq62sstvnvEO2N5341ApUcaUnK4vuPouXB2r+qoiG
 Phl3zPHjL7g8jldygnMrtimm3Q==
X-Google-Smtp-Source: ABdhPJwVMo4yLG/NNfwXbCw99STWn4/iHz7bkhmGQGtyzxY/ohifQ0t3XBNmPRYHZ6nihj7LFF77iA==
X-Received: by 2002:a6b:8bc2:: with SMTP id n185mr6049810iod.174.1636477109651; 
 Tue, 09 Nov 2021 08:58:29 -0800 (PST)
Received: from ?IPv6:2603:300b:6:5100:3543:ecc0:2149:6a1b?
 ([2603:300b:6:5100:3543:ecc0:2149:6a1b])
 by smtp.gmail.com with ESMTPSA id g17sm11919052iow.20.2021.11.09.08.58.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Nov 2021 08:58:29 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH] linux-user: Add GPL-2.0+ SPDX license identifier
In-Reply-To: <20211103203146.3630550-1-f4bug@amsat.org>
Date: Tue, 9 Nov 2021 09:58:28 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A04B4E3-3B85-45CA-AC1C-AD2628AA7CA9@gmail.com>
References: <20211103203146.3630550-1-f4bug@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=wlosh@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Nov 3, 2021, at 2:31 PM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> Use Qualcomm License Identifier tool [*] to classify linux-user/
> files per license type, filtering those matching at least 60% the
> "GPLv2 or later" type, and manually add the GPL-2.0-or-later SPDX
> comment.
>=20
>  $ license-identifier --output_format easy_read \
>      --threshold 0.6 --input_path linux-user \
>    | egrep '(Name of the input file|Matched license type is|The found =
license text has the score of)'
>    | fgrep -1 GPL-2.0+
>  Name of the input file: linux-user/cpu_loop-common.h
>  Matched license type is GPL-2.0+
>  The found license text has the score of 0.69
>  --
>  Name of the input file: linux-user/exit.c
>  Matched license type is GPL-2.0+
>  The found license text has the score of 0.685
>  --
>  Name of the input file: linux-user/fd-trans.c
>  Matched license type is GPL-2.0+
>  The found license text has the score of 0.715
>  --
>  Name of the input file: linux-user/fd-trans.h
>  Matched license type is GPL-2.0+
>  The found license text has the score of 0.715
>  --
>  Name of the input file: linux-user/flatload.c
>  Matched license type is GPL-2.0+
>  The found license text has the score of 0.715
>  --
>  ...
>=20
> [*] Qualcomm Open Source Technology Group License Identifier tool
>    https://www.codeaurora.org/projects/qualcomm-ostg-lid
>    https://github.com/quic/lid#usage
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> linux-user/aarch64/target_elf.h      | 2 ++
> linux-user/aarch64/target_fcntl.h    | 2 ++
> linux-user/alpha/target_elf.h        | 2 ++
> linux-user/alpha/target_fcntl.h      | 2 ++
> linux-user/arm/target_elf.h          | 2 ++
> linux-user/arm/target_fcntl.h        | 2 ++
> linux-user/cpu_loop-common.h         | 2 ++
> linux-user/cris/target_elf.h         | 2 ++
> linux-user/cris/target_fcntl.h       | 2 ++
> linux-user/fd-trans.h                | 2 ++
> linux-user/hexagon/sockbits.h        | 2 ++
> linux-user/hexagon/target_cpu.h      | 2 ++
> linux-user/hexagon/target_elf.h      | 2 ++
> linux-user/hexagon/target_fcntl.h    | 2 ++
> linux-user/hexagon/target_signal.h   | 2 ++
> linux-user/hexagon/target_structs.h  | 2 ++
> linux-user/hexagon/target_syscall.h  | 2 ++
> linux-user/hexagon/termbits.h        | 2 ++
> linux-user/hppa/target_elf.h         | 2 ++
> linux-user/hppa/target_fcntl.h       | 2 ++
> linux-user/i386/target_elf.h         | 2 ++
> linux-user/i386/target_fcntl.h       | 2 ++
> linux-user/loader.h                  | 2 ++
> linux-user/m68k/target_elf.h         | 2 ++
> linux-user/m68k/target_fcntl.h       | 2 ++
> linux-user/microblaze/target_elf.h   | 2 ++
> linux-user/microblaze/target_fcntl.h | 2 ++
> linux-user/mips/target_fcntl.h       | 2 ++
> linux-user/mips64/target_elf.h       | 2 ++
> linux-user/nios2/target_elf.h        | 2 ++
> linux-user/nios2/target_fcntl.h      | 2 ++
> linux-user/openrisc/target_elf.h     | 2 ++
> linux-user/openrisc/target_fcntl.h   | 2 ++
> linux-user/ppc/target_elf.h          | 2 ++
> linux-user/ppc/target_fcntl.h        | 2 ++
> linux-user/riscv/target_elf.h        | 2 ++
> linux-user/riscv/target_fcntl.h      | 2 ++
> linux-user/s390x/target_cpu.h        | 2 ++
> linux-user/s390x/target_elf.h        | 2 ++
> linux-user/s390x/target_fcntl.h      | 2 ++
> linux-user/safe-syscall.h            | 2 ++
> linux-user/sh4/target_elf.h          | 2 ++
> linux-user/sh4/target_fcntl.h        | 2 ++
> linux-user/signal-common.h           | 2 ++
> linux-user/sparc/target_elf.h        | 2 ++
> linux-user/sparc/target_fcntl.h      | 2 ++
> linux-user/strace.h                  | 2 ++
> linux-user/user-internals.h          | 2 ++
> linux-user/user-mmap.h               | 2 ++
> linux-user/x86_64/target_elf.h       | 2 ++
> linux-user/x86_64/target_fcntl.h     | 2 ++
> linux-user/xtensa/target_elf.h       | 2 ++
> linux-user/xtensa/target_fcntl.h     | 2 ++
> linux-user/aarch64/cpu_loop.c        | 2 ++
> linux-user/aarch64/signal.c          | 2 ++
> linux-user/alpha/cpu_loop.c          | 2 ++
> linux-user/alpha/signal.c            | 2 ++
> linux-user/arm/cpu_loop.c            | 2 ++
> linux-user/arm/signal.c              | 2 ++
> linux-user/cris/cpu_loop.c           | 2 ++
> linux-user/cris/signal.c             | 2 ++
> linux-user/exit.c                    | 2 ++
> linux-user/fd-trans.c                | 2 ++
> linux-user/flatload.c                | 2 ++
> linux-user/hexagon/cpu_loop.c        | 2 ++
> linux-user/hexagon/signal.c          | 2 ++
> linux-user/hppa/cpu_loop.c           | 2 ++
> linux-user/hppa/signal.c             | 2 ++
> linux-user/i386/cpu_loop.c           | 2 ++
> linux-user/i386/signal.c             | 2 ++
> linux-user/m68k/cpu_loop.c           | 2 ++
> linux-user/m68k/signal.c             | 2 ++
> linux-user/main.c                    | 2 ++
> linux-user/microblaze/cpu_loop.c     | 2 ++
> linux-user/microblaze/signal.c       | 2 ++
> linux-user/mips/cpu_loop.c           | 2 ++
> linux-user/mips/signal.c             | 2 ++
> linux-user/mips64/cpu_loop.c         | 2 ++
> linux-user/mips64/signal.c           | 2 ++
> linux-user/mmap.c                    | 2 ++
> linux-user/nios2/cpu_loop.c          | 2 ++
> linux-user/nios2/signal.c            | 2 ++
> linux-user/openrisc/cpu_loop.c       | 2 ++
> linux-user/openrisc/signal.c         | 2 ++
> linux-user/ppc/cpu_loop.c            | 2 ++
> linux-user/ppc/signal.c              | 2 ++
> linux-user/riscv/cpu_loop.c          | 2 ++
> linux-user/riscv/signal.c            | 2 ++
> linux-user/s390x/cpu_loop.c          | 2 ++
> linux-user/s390x/signal.c            | 2 ++
> linux-user/sh4/cpu_loop.c            | 2 ++
> linux-user/sh4/signal.c              | 2 ++
> linux-user/signal.c                  | 2 ++
> linux-user/sparc/cpu_loop.c          | 2 ++
> linux-user/sparc/signal.c            | 2 ++
> linux-user/syscall.c                 | 2 ++
> linux-user/uname.c                   | 2 ++
> linux-user/vm86.c                    | 2 ++
> linux-user/x86_64/cpu_loop.c         | 2 ++
> linux-user/x86_64/signal.c           | 2 ++
> linux-user/xtensa/cpu_loop.c         | 2 ++
> linux-user/xtensa/signal.c           | 2 ++
> linux-user/errnos.c.inc              | 2 ++
> 103 files changed, 206 insertions(+)

Reviewed-by: Warner Losh <imp@bsdiimp.com>

There=E2=80=99s at least half a dozen different variations of this text =
that I counted in reviewing.
I looked at each one to make sure =E2=80=98version 2=E2=80=99 and =E2=80=98=
any later version=E2=80=99 were in these files.


>=20
> diff --git a/linux-user/aarch64/target_elf.h =
b/linux-user/aarch64/target_elf.h
> index a7eb962fba7..7c50bb656b7 100644
> --- a/linux-user/aarch64/target_elf.h
> +++ b/linux-user/aarch64/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/aarch64/target_fcntl.h =
b/linux-user/aarch64/target_fcntl.h
> index efdf6e5f058..6a944dce72e 100644
> --- a/linux-user/aarch64/target_fcntl.h
> +++ b/linux-user/aarch64/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/alpha/target_elf.h =
b/linux-user/alpha/target_elf.h
> index 344e9f4d395..5ce7bc157f8 100644
> --- a/linux-user/alpha/target_elf.h
> +++ b/linux-user/alpha/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/alpha/target_fcntl.h =
b/linux-user/alpha/target_fcntl.h
> index 99774d73172..7197ed1bd9e 100644
> --- a/linux-user/alpha/target_fcntl.h
> +++ b/linux-user/alpha/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/arm/target_elf.h b/linux-user/arm/target_elf.h
> index 58ff6a0986f..a0a029275ce 100644
> --- a/linux-user/arm/target_elf.h
> +++ b/linux-user/arm/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/arm/target_fcntl.h =
b/linux-user/arm/target_fcntl.h
> index c8ff6b2505a..8feb6b67369 100644
> --- a/linux-user/arm/target_fcntl.h
> +++ b/linux-user/arm/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/cpu_loop-common.h =
b/linux-user/cpu_loop-common.h
> index 8828af28a4d..63979b57d3d 100644
> --- a/linux-user/cpu_loop-common.h
> +++ b/linux-user/cpu_loop-common.h
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/cris/target_elf.h =
b/linux-user/cris/target_elf.h
> index 99eb4ec7046..2eccd496331 100644
> --- a/linux-user/cris/target_elf.h
> +++ b/linux-user/cris/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/cris/target_fcntl.h =
b/linux-user/cris/target_fcntl.h
> index df0aceea344..7f3daecb164 100644
> --- a/linux-user/cris/target_fcntl.h
> +++ b/linux-user/cris/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/fd-trans.h b/linux-user/fd-trans.h
> index 1b9fa2041c0..2fb94d3f58e 100644
> --- a/linux-user/fd-trans.h
> +++ b/linux-user/fd-trans.h
> @@ -1,5 +1,7 @@
> /*
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/hexagon/sockbits.h =
b/linux-user/hexagon/sockbits.h
> index b7ad5dc60e5..9ee09c52dfe 100644
> --- a/linux-user/hexagon/sockbits.h
> +++ b/linux-user/hexagon/sockbits.h
> @@ -1,7 +1,9 @@
> /*
>  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights =
Reserved.
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/hexagon/target_cpu.h =
b/linux-user/hexagon/target_cpu.h
> index ecb76e9268e..92bd3bf0846 100644
> --- a/linux-user/hexagon/target_cpu.h
> +++ b/linux-user/hexagon/target_cpu.h
> @@ -1,7 +1,9 @@
> /*
>  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights =
Reserved.
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/hexagon/target_elf.h =
b/linux-user/hexagon/target_elf.h
> index b4e9f405272..abadb6d91a9 100644
> --- a/linux-user/hexagon/target_elf.h
> +++ b/linux-user/hexagon/target_elf.h
> @@ -1,7 +1,9 @@
> /*
>  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights =
Reserved.
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/hexagon/target_fcntl.h =
b/linux-user/hexagon/target_fcntl.h
> index 2892db80989..e9ad26fa2fb 100644
> --- a/linux-user/hexagon/target_fcntl.h
> +++ b/linux-user/hexagon/target_fcntl.h
> @@ -1,7 +1,9 @@
> /*
>  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights =
Reserved.
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/hexagon/target_signal.h =
b/linux-user/hexagon/target_signal.h
> index 9e0223d3222..fd9d96c2a47 100644
> --- a/linux-user/hexagon/target_signal.h
> +++ b/linux-user/hexagon/target_signal.h
> @@ -1,7 +1,9 @@
> /*
>  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights =
Reserved.
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/hexagon/target_structs.h =
b/linux-user/hexagon/target_structs.h
> index c217d9442ae..f5a5479cda7 100644
> --- a/linux-user/hexagon/target_structs.h
> +++ b/linux-user/hexagon/target_structs.h
> @@ -1,7 +1,9 @@
> /*
>  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights =
Reserved.
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/hexagon/target_syscall.h =
b/linux-user/hexagon/target_syscall.h
> index 7f91a4abc77..6a4cff0f64c 100644
> --- a/linux-user/hexagon/target_syscall.h
> +++ b/linux-user/hexagon/target_syscall.h
> @@ -1,7 +1,9 @@
> /*
>  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights =
Reserved.
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/hexagon/termbits.h =
b/linux-user/hexagon/termbits.h
> index 49f974cdde1..2e40fccbf21 100644
> --- a/linux-user/hexagon/termbits.h
> +++ b/linux-user/hexagon/termbits.h
> @@ -1,7 +1,9 @@
> /*
>  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights =
Reserved.
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/hppa/target_elf.h =
b/linux-user/hppa/target_elf.h
> index 82b4e9535e1..4955c00240e 100644
> --- a/linux-user/hppa/target_elf.h
> +++ b/linux-user/hppa/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/hppa/target_fcntl.h =
b/linux-user/hppa/target_fcntl.h
> index 4eb0ec98e25..31c95011021 100644
> --- a/linux-user/hppa/target_fcntl.h
> +++ b/linux-user/hppa/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/i386/target_elf.h =
b/linux-user/i386/target_elf.h
> index 1c6142e7da0..2a5c78906e6 100644
> --- a/linux-user/i386/target_elf.h
> +++ b/linux-user/i386/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/i386/target_fcntl.h =
b/linux-user/i386/target_fcntl.h
> index 4819743dae4..5d31309254b 100644
> --- a/linux-user/i386/target_fcntl.h
> +++ b/linux-user/i386/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/loader.h b/linux-user/loader.h
> index f375ee0679b..fd25e7be65f 100644
> --- a/linux-user/loader.h
> +++ b/linux-user/loader.h
> @@ -1,7 +1,9 @@
> /*
>  * loader.h: prototypes for linux-user guest binary loader
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/m68k/target_elf.h =
b/linux-user/m68k/target_elf.h
> index 998fe0fe2f3..3562e775eac 100644
> --- a/linux-user/m68k/target_elf.h
> +++ b/linux-user/m68k/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/m68k/target_fcntl.h =
b/linux-user/m68k/target_fcntl.h
> index 068bc3243e0..66a5a8c2762 100644
> --- a/linux-user/m68k/target_fcntl.h
> +++ b/linux-user/m68k/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/microblaze/target_elf.h =
b/linux-user/microblaze/target_elf.h
> index 8a8f1debff9..b64aaa1e2a2 100644
> --- a/linux-user/microblaze/target_elf.h
> +++ b/linux-user/microblaze/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/microblaze/target_fcntl.h =
b/linux-user/microblaze/target_fcntl.h
> index 45402275fff..08faa3c1553 100644
> --- a/linux-user/microblaze/target_fcntl.h
> +++ b/linux-user/microblaze/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/mips/target_fcntl.h =
b/linux-user/mips/target_fcntl.h
> index 6fc7b8a12bf..06aa89e5a01 100644
> --- a/linux-user/mips/target_fcntl.h
> +++ b/linux-user/mips/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/mips64/target_elf.h =
b/linux-user/mips64/target_elf.h
> index 5f2f2df29f7..84d4e178176 100644
> --- a/linux-user/mips64/target_elf.h
> +++ b/linux-user/mips64/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/nios2/target_elf.h =
b/linux-user/nios2/target_elf.h
> index 801e20afafa..ad1856436ef 100644
> --- a/linux-user/nios2/target_elf.h
> +++ b/linux-user/nios2/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/nios2/target_fcntl.h =
b/linux-user/nios2/target_fcntl.h
> index 714583215df..719defd92a8 100644
> --- a/linux-user/nios2/target_fcntl.h
> +++ b/linux-user/nios2/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/openrisc/target_elf.h =
b/linux-user/openrisc/target_elf.h
> index 265ecd30794..9c919ad837d 100644
> --- a/linux-user/openrisc/target_elf.h
> +++ b/linux-user/openrisc/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/openrisc/target_fcntl.h =
b/linux-user/openrisc/target_fcntl.h
> index ea31bf8b701..eca172d17d2 100644
> --- a/linux-user/openrisc/target_fcntl.h
> +++ b/linux-user/openrisc/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/ppc/target_elf.h b/linux-user/ppc/target_elf.h
> index 06166188542..7f01a32b417 100644
> --- a/linux-user/ppc/target_elf.h
> +++ b/linux-user/ppc/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/ppc/target_fcntl.h =
b/linux-user/ppc/target_fcntl.h
> index d74ab710cf7..5b6e7688acf 100644
> --- a/linux-user/ppc/target_fcntl.h
> +++ b/linux-user/ppc/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/riscv/target_elf.h =
b/linux-user/riscv/target_elf.h
> index 9dd65652ee4..fbd3510fc5b 100644
> --- a/linux-user/riscv/target_elf.h
> +++ b/linux-user/riscv/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/riscv/target_fcntl.h =
b/linux-user/riscv/target_fcntl.h
> index 9c3d0fbe2b3..541c85bc5b8 100644
> --- a/linux-user/riscv/target_fcntl.h
> +++ b/linux-user/riscv/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/s390x/target_cpu.h =
b/linux-user/s390x/target_cpu.h
> index 7cd71e2dbab..60b335643d9 100644
> --- a/linux-user/s390x/target_cpu.h
> +++ b/linux-user/s390x/target_cpu.h
> @@ -2,8 +2,10 @@
>  * S/390 specific CPU ABI and functions for linux-user
>  *
>  * Copyright (c) 2009 Ulrich Hecht
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License as published =
by
>  * the Free Software Foundation; either version 2 of the License, or
>  * (at your option) any later version.
> diff --git a/linux-user/s390x/target_elf.h =
b/linux-user/s390x/target_elf.h
> index 8114b59c1d6..c61236b93de 100644
> --- a/linux-user/s390x/target_elf.h
> +++ b/linux-user/s390x/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/s390x/target_fcntl.h =
b/linux-user/s390x/target_fcntl.h
> index 36dc50fba05..0f14258f507 100644
> --- a/linux-user/s390x/target_fcntl.h
> +++ b/linux-user/s390x/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
> index 6bc03902628..900c72faf7e 100644
> --- a/linux-user/safe-syscall.h
> +++ b/linux-user/safe-syscall.h
> @@ -1,7 +1,9 @@
> /*
>  * safe-syscall.h: prototypes for linux-user signal-race-safe syscalls
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/sh4/target_elf.h b/linux-user/sh4/target_elf.h
> index f485e0cef27..e0594954e22 100644
> --- a/linux-user/sh4/target_elf.h
> +++ b/linux-user/sh4/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/sh4/target_fcntl.h =
b/linux-user/sh4/target_fcntl.h
> index 2622d95539d..a19a858ff3b 100644
> --- a/linux-user/sh4/target_fcntl.h
> +++ b/linux-user/sh4/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
> index 7457f8025c4..e0ce1daaf45 100644
> --- a/linux-user/signal-common.h
> +++ b/linux-user/signal-common.h
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/sparc/target_elf.h =
b/linux-user/sparc/target_elf.h
> index a510ceb6129..677e7a9c10e 100644
> --- a/linux-user/sparc/target_elf.h
> +++ b/linux-user/sparc/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/sparc/target_fcntl.h =
b/linux-user/sparc/target_fcntl.h
> index c2532989e59..209c72f312e 100644
> --- a/linux-user/sparc/target_fcntl.h
> +++ b/linux-user/sparc/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/strace.h b/linux-user/strace.h
> index 1e232d07fc8..e0b21a8bebf 100644
> --- a/linux-user/strace.h
> +++ b/linux-user/strace.h
> @@ -1,7 +1,9 @@
> /*
>  * strace.h: prototypes for linux-user builtin strace handling
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
> index 661612a088b..605da369412 100644
> --- a/linux-user/user-internals.h
> +++ b/linux-user/user-internals.h
> @@ -1,7 +1,9 @@
> /*
>  * user-internals.h: prototypes etc internal to the linux-user =
implementation
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/user-mmap.h b/linux-user/user-mmap.h
> index d1dec99c024..7f800f2bab2 100644
> --- a/linux-user/user-mmap.h
> +++ b/linux-user/user-mmap.h
> @@ -1,7 +1,9 @@
> /*
>  * user-mmap.h: prototypes for linux-user guest binary loader
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/x86_64/target_elf.h =
b/linux-user/x86_64/target_elf.h
> index 7b76a90de88..c2751593047 100644
> --- a/linux-user/x86_64/target_elf.h
> +++ b/linux-user/x86_64/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/x86_64/target_fcntl.h =
b/linux-user/x86_64/target_fcntl.h
> index 3c7238e56be..64a79d35e5b 100644
> --- a/linux-user/x86_64/target_fcntl.h
> +++ b/linux-user/x86_64/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/xtensa/target_elf.h =
b/linux-user/xtensa/target_elf.h
> index a9a3fabd89b..f67b0b00816 100644
> --- a/linux-user/xtensa/target_elf.h
> +++ b/linux-user/xtensa/target_elf.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/xtensa/target_fcntl.h =
b/linux-user/xtensa/target_fcntl.h
> index dc1ca7eaa50..14c4d5d1d6c 100644
> --- a/linux-user/xtensa/target_fcntl.h
> +++ b/linux-user/xtensa/target_fcntl.h
> @@ -1,5 +1,7 @@
> /*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  * This program is free software; you can redistribute it and/or =
modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation, or (at your option) any
>  * later version. See the COPYING file in the top-level directory.
> diff --git a/linux-user/aarch64/cpu_loop.c =
b/linux-user/aarch64/cpu_loop.c
> index 97e0728b679..c4bbe845420 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
> index 29c52db3f13..74967d1157a 100644
> --- a/linux-user/aarch64/signal.c
> +++ b/linux-user/aarch64/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
> index 4029849d5cd..4896e25d8c4 100644
> --- a/linux-user/alpha/cpu_loop.c
> +++ b/linux-user/alpha/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
> index bbe3dd175a7..92437c032cc 100644
> --- a/linux-user/alpha/signal.c
> +++ b/linux-user/alpha/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index 01cb6eb534e..50e050c0350 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
> index df9f8e8eb20..a1c218033d1 100644
> --- a/linux-user/arm/signal.c
> +++ b/linux-user/arm/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
> index 0d5d268609a..2abc7f0286d 100644
> --- a/linux-user/cris/cpu_loop.c
> +++ b/linux-user/cris/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/cris/signal.c b/linux-user/cris/signal.c
> index 7f6aca934e1..162df62930a 100644
> --- a/linux-user/cris/signal.c
> +++ b/linux-user/cris/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/exit.c b/linux-user/exit.c
> index fa6ef0b9b44..970b64727b7 100644
> --- a/linux-user/exit.c
> +++ b/linux-user/exit.c
> @@ -2,8 +2,10 @@
>  *  exit support for qemu
>  *
>  *  Copyright (c) 2018 Alex Benn=C3=A9e <alex.bennee@linaro.org>
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> index 69410899590..1ef211e02d5 100644
> --- a/linux-user/fd-trans.c
> +++ b/linux-user/fd-trans.c
> @@ -1,5 +1,7 @@
> /*
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/flatload.c b/linux-user/flatload.c
> index e4c2f89a226..d91bf733475 100644
> --- a/linux-user/flatload.c
> +++ b/linux-user/flatload.c
> @@ -1,8 +1,10 @@
> =
/*************************************************************************=
***/
> /*
>  *  QEMU bFLT binary loader.  Based on linux/fs/binfmt_flat.c
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/hexagon/cpu_loop.c =
b/linux-user/hexagon/cpu_loop.c
> index 6b24cbaba93..285dde2e800 100644
> --- a/linux-user/hexagon/cpu_loop.c
> +++ b/linux-user/hexagon/cpu_loop.c
> @@ -3,8 +3,10 @@
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights =
Reserved.
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
> index 74e61739a0a..bc2466f8184 100644
> --- a/linux-user/hexagon/signal.c
> +++ b/linux-user/hexagon/signal.c
> @@ -3,8 +3,10 @@
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights =
Reserved.
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
> index 375576c8f09..a38f137c3de 100644
> --- a/linux-user/hppa/cpu_loop.c
> +++ b/linux-user/hppa/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
> index c2fbc26ebb6..6aa9f203fc6 100644
> --- a/linux-user/hppa/signal.c
> +++ b/linux-user/hppa/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
> index f6a1cc632b1..b5a6dfaacc1 100644
> --- a/linux-user/i386/cpu_loop.c
> +++ b/linux-user/i386/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
> index 433efa3d693..2157b998669 100644
> --- a/linux-user/i386/signal.c
> +++ b/linux-user/i386/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
> index 790bd558c3f..5ebee46a99c 100644
> --- a/linux-user/m68k/cpu_loop.c
> +++ b/linux-user/m68k/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c
> index ec33482e140..cec8cfe23ef 100644
> --- a/linux-user/m68k/signal.c
> +++ b/linux-user/m68k/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 16def5215d9..afb67bbdd64 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -2,8 +2,10 @@
>  *  qemu user main
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/microblaze/cpu_loop.c =
b/linux-user/microblaze/cpu_loop.c
> index a94467dd2da..18a435aab7f 100644
> --- a/linux-user/microblaze/cpu_loop.c
> +++ b/linux-user/microblaze/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/microblaze/signal.c =
b/linux-user/microblaze/signal.c
> index 8ebb6a1b7df..c274b48a098 100644
> --- a/linux-user/microblaze/signal.c
> +++ b/linux-user/microblaze/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
> index b735c99a24a..576b2b40148 100644
> --- a/linux-user/mips/cpu_loop.c
> +++ b/linux-user/mips/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
> index 8f79e405ecb..011ef25df22 100644
> --- a/linux-user/mips/signal.c
> +++ b/linux-user/mips/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/mips64/cpu_loop.c =
b/linux-user/mips64/cpu_loop.c
> index 858bc5be78a..b53efeb96f0 100644
> --- a/linux-user/mips64/cpu_loop.c
> +++ b/linux-user/mips64/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/mips64/signal.c b/linux-user/mips64/signal.c
> index 4ed0ed90b3c..f952d63f51d 100644
> --- a/linux-user/mips64/signal.c
> +++ b/linux-user/mips64/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index c125031b904..74c533f5f03 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -2,8 +2,10 @@
>  *  mmap support for qemu
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
> index 34290fb3b51..3de3dc609e6 100644
> --- a/linux-user/nios2/cpu_loop.c
> +++ b/linux-user/nios2/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
> index a77e8a40f46..334d9997366 100644
> --- a/linux-user/nios2/signal.c
> +++ b/linux-user/nios2/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/openrisc/cpu_loop.c =
b/linux-user/openrisc/cpu_loop.c
> index 3cfdbbf0372..d2824fe17c7 100644
> --- a/linux-user/openrisc/cpu_loop.c
> +++ b/linux-user/openrisc/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/openrisc/signal.c =
b/linux-user/openrisc/signal.c
> index be8b68784a2..7e228ea7dce 100644
> --- a/linux-user/openrisc/signal.c
> +++ b/linux-user/openrisc/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
> index 483e669300f..6d6523de64e 100644
> --- a/linux-user/ppc/cpu_loop.c
> +++ b/linux-user/ppc/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
> index 90a0369632f..083eede016f 100644
> --- a/linux-user/ppc/signal.c
> +++ b/linux-user/ppc/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
> index b301dac802e..31bed421abc 100644
> --- a/linux-user/riscv/cpu_loop.c
> +++ b/linux-user/riscv/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
> index a0f9542ce39..a7f4356c0bf 100644
> --- a/linux-user/riscv/signal.c
> +++ b/linux-user/riscv/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
> index d089c8417e7..29743ed13b2 100644
> --- a/linux-user/s390x/cpu_loop.c
> +++ b/linux-user/s390x/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index 676b9481476..102a9e5ead0 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
> index ac9b01840c5..7baa92adcf0 100644
> --- a/linux-user/sh4/cpu_loop.c
> +++ b/linux-user/sh4/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
> index faa869fb195..5f303b30e71 100644
> --- a/linux-user/sh4/signal.c
> +++ b/linux-user/sh4/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 81c45bfce9c..cc34ec35d3b 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
> index 0ba65e431cd..a59b4bb768c 100644
> --- a/linux-user/sparc/cpu_loop.c
> +++ b/linux-user/sparc/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
> index 23e1e761de4..de8b6da6f22 100644
> --- a/linux-user/sparc/signal.c
> +++ b/linux-user/sparc/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 544f5b662ff..de22674909d 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -2,8 +2,10 @@
>  *  Linux syscalls
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/uname.c b/linux-user/uname.c
> index 1d82608c100..f633116c049 100644
> --- a/linux-user/uname.c
> +++ b/linux-user/uname.c
> @@ -2,8 +2,10 @@
>  *  cpu to uname machine name map
>  *
>  *  Copyright (c) 2009 Lo=C3=AFc Minier
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/vm86.c b/linux-user/vm86.c
> index c2facf3fc2d..eaf13b61375 100644
> --- a/linux-user/vm86.c
> +++ b/linux-user/vm86.c
> @@ -2,8 +2,10 @@
>  *  vm86 linux syscall support
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/x86_64/cpu_loop.c =
b/linux-user/x86_64/cpu_loop.c
> index 8b5af8ea1f1..e0342bd351f 100644
> --- a/linux-user/x86_64/cpu_loop.c
> +++ b/linux-user/x86_64/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/x86_64/signal.c b/linux-user/x86_64/signal.c
> index a509a38045b..ba48fb8b271 100644
> --- a/linux-user/x86_64/signal.c
> +++ b/linux-user/x86_64/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/xtensa/cpu_loop.c =
b/linux-user/xtensa/cpu_loop.c
> index a83490ab35a..87c830fa2ac 100644
> --- a/linux-user/xtensa/cpu_loop.c
> +++ b/linux-user/xtensa/cpu_loop.c
> @@ -2,8 +2,10 @@
>  *  qemu user cpu loop
>  *
>  *  Copyright (c) 2003-2008 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
> index 81572a5fc7b..07dd1fd3351 100644
> --- a/linux-user/xtensa/signal.c
> +++ b/linux-user/xtensa/signal.c
> @@ -2,8 +2,10 @@
>  *  Emulation of Linux signals
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> diff --git a/linux-user/errnos.c.inc b/linux-user/errnos.c.inc
> index 963ba1ce9d1..00885dcc420 100644
> --- a/linux-user/errnos.c.inc
> +++ b/linux-user/errnos.c.inc
> @@ -5,8 +5,10 @@
>  * Please keep this list sorted alphabetically.
>  *
>  *  Copyright (c) 2003 Fabrice Bellard
>  *
> + *  SPDX-License-Identifier: GPL-2.0-or-later
> + *
>  *  This program is free software; you can redistribute it and/or =
modify
>  *  it under the terms of the GNU General Public License as published =
by
>  *  the Free Software Foundation; either version 2 of the License, or
>  *  (at your option) any later version.
> --=20
> 2.31.1
>=20
>=20


