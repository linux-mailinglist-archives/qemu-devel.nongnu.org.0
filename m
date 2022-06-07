Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8959A5400A6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 16:03:31 +0200 (CEST)
Received: from localhost ([::1]:53606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyZnu-0003yf-Ip
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 10:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyZlG-0000x3-4G
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 10:00:47 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyZlE-0006Nr-0i
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 10:00:45 -0400
Received: by mail-wr1-x433.google.com with SMTP id u8so19973971wrm.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 07:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=W+UstAfSJiXFEtsDgwEx0lKKEf1AzgKeAaciQOsmrxw=;
 b=DNys//0q1+OBGIV+DOh4/hmrLTo+dwhz9xBY09EhxEFGWeRIf0f8P6expKmrZaJYII
 0AznBkKrIT9VljeSMTCW3rfuizoBSzPe7zZ89UYMmhIr2Np3m5BUZEY9TTPtoUydxh/K
 hi17246WGcJ95HBPVjtXNtu4en6hzGNolxsB8FBh3L4Rg9AeC73R9idmBUMmEPImoEcQ
 iGjsTpJ/LzRK6eGG9KmMtsm+BHZ3tPxbRouqWKkVKTRmDmrhPX/BTy0QkwzNRXKHX04h
 IWdXfWZIv9b0yMXqlu31Slsrx+AAcPudAcDPwmP1tzzfIq8+pG1eoxzqhe3kb5U55xeo
 Kapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=W+UstAfSJiXFEtsDgwEx0lKKEf1AzgKeAaciQOsmrxw=;
 b=L6X4JEJA6UkYcBzWmQjst7C7MhUqAcnvpu/ILnq4A/FMaugOhvVj9MgHDsNFk97PUk
 y6sRiviEyHAZlOGby46oNqPIZUlp3PiR57LtapMqWpdLUps8q7+ucOW3YHH/eREZgoAp
 76tnt7x1jLdQ3Fk1DSNrasPlg/L/0SLmZM1RiXZ/sMatqZwjqSknUAETYyNSLlRZEfiW
 /GlevbjfFbjvoize7RqcZd1RK1cKpHoFd4XPC8UzDFBj1I6j++A35jG8kT6RbtTWjbiV
 fiM8Z9jD4PqmhLWIAB+WnGkwGiqLqhmkOj22UbTfcS/zPz8IFM+dSyNHCS55SnIZ/y6D
 neLw==
X-Gm-Message-State: AOAM532TpX/2ZzMtAieHW454ILXf8eCmm1rkaEaAwcESS05FPQwtdJ/E
 ZtASb4IyOe7TPk7uHh7jfkVUlvFVcBXKGA==
X-Google-Smtp-Source: ABdhPJwTP3fXEH/1300kPFhIry7LzC+sPiWqHcLWMZK9fggXp80Yj38bhR7UvColKRu042AW9IQEow==
X-Received: by 2002:a5d:6c64:0:b0:20f:f2ad:6623 with SMTP id
 r4-20020a5d6c64000000b0020ff2ad6623mr28276689wrz.28.1654610442137; 
 Tue, 07 Jun 2022 07:00:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c2cce00b0039751bb8c62sm26816987wmc.24.2022.06.07.07.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 07:00:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 844EC1FFB7;
 Tue,  7 Jun 2022 15:00:40 +0100 (BST)
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-16-richard.henderson@linaro.org>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH v3 15/49] include/exec: Move gdb_stat and gdb_timeval to
 gdbstub.h
Date: Tue, 07 Jun 2022 14:59:31 +0100
In-reply-to: <20220521000400.454525-16-richard.henderson@linaro.org>
Message-ID: <874k0wvaif.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

> We have two copies of these structures, and require them
> in semihosting/ going forward.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/gdbstub.h    | 25 +++++++++++++++++++++++++
>  target/m68k/m68k-semi.c   | 30 +++---------------------------
>  target/nios2/nios2-semi.c | 30 +++---------------------------
>  3 files changed, 31 insertions(+), 54 deletions(-)
>
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index 2aaba9c723..33a262a5a3 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -20,6 +20,31 @@
>  #define GDB_O_TRUNC   0x400
>  #define GDB_O_EXCL    0x800
>=20=20
> +/* For gdb file i/o stat/fstat. */
> +typedef uint32_t gdb_mode_t;
> +typedef uint32_t gdb_time_t;
> +
> +struct gdb_stat {
> +  uint32_t    gdb_st_dev;     /* device */
> +  uint32_t    gdb_st_ino;     /* inode */
> +  gdb_mode_t  gdb_st_mode;    /* protection */
> +  uint32_t    gdb_st_nlink;   /* number of hard links */
> +  uint32_t    gdb_st_uid;     /* user ID of owner */
> +  uint32_t    gdb_st_gid;     /* group ID of owner */
> +  uint32_t    gdb_st_rdev;    /* device type (if inode device) */
> +  uint64_t    gdb_st_size;    /* total size, in bytes */
> +  uint64_t    gdb_st_blksize; /* blocksize for filesystem I/O */
> +  uint64_t    gdb_st_blocks;  /* number of blocks allocated */
> +  gdb_time_t  gdb_st_atime;   /* time of last access */
> +  gdb_time_t  gdb_st_mtime;   /* time of last modification */
> +  gdb_time_t  gdb_st_ctime;   /* time of last change */
> +} QEMU_PACKED;
> +
> +struct gdb_timeval {
> +  gdb_time_t tv_sec;  /* second */
> +  uint64_t tv_usec;   /* microsecond */
> +} QEMU_PACKED;
> +
>  #ifdef NEED_CPU_H
>  #include "cpu.h"
>=20=20
> diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
> index 475a6b13b7..da0186f3ef 100644
> --- a/target/m68k/m68k-semi.c
> +++ b/target/m68k/m68k-semi.c
> @@ -45,30 +45,6 @@
>  #define HOSTED_ISATTY 12
>  #define HOSTED_SYSTEM 13
>=20=20
> -typedef uint32_t gdb_mode_t;
> -typedef uint32_t gdb_time_t;
> -
> -struct m68k_gdb_stat {
> -  uint32_t    gdb_st_dev;     /* device */
> -  uint32_t    gdb_st_ino;     /* inode */
> -  gdb_mode_t  gdb_st_mode;    /* protection */
> -  uint32_t    gdb_st_nlink;   /* number of hard links */
> -  uint32_t    gdb_st_uid;     /* user ID of owner */
> -  uint32_t    gdb_st_gid;     /* group ID of owner */
> -  uint32_t    gdb_st_rdev;    /* device type (if inode device) */
> -  uint64_t    gdb_st_size;    /* total size, in bytes */
> -  uint64_t    gdb_st_blksize; /* blocksize for filesystem I/O */
> -  uint64_t    gdb_st_blocks;  /* number of blocks allocated */
> -  gdb_time_t  gdb_st_atime;   /* time of last access */
> -  gdb_time_t  gdb_st_mtime;   /* time of last modification */
> -  gdb_time_t  gdb_st_ctime;   /* time of last change */
> -} QEMU_PACKED;
> -
> -struct gdb_timeval {
> -  gdb_time_t tv_sec;  /* second */
> -  uint64_t tv_usec;   /* microsecond */
> -} QEMU_PACKED;
> -
>  static int translate_openflags(int flags)
>  {
>      int hf;
> @@ -90,9 +66,9 @@ static int translate_openflags(int flags)
>=20=20
>  static void translate_stat(CPUM68KState *env, target_ulong addr, struct =
stat *s)
>  {
> -    struct m68k_gdb_stat *p;
> +    struct gdb_stat *p;
>=20=20
> -    if (!(p =3D lock_user(VERIFY_WRITE, addr, sizeof(struct m68k_gdb_sta=
t), 0)))
> +    if (!(p =3D lock_user(VERIFY_WRITE, addr, sizeof(struct gdb_stat),
> 0)))

checkpatch hard fails on the assignment in an if condition so it's
probably worth cleaning that up while you go.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

