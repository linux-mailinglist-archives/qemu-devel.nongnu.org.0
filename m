Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD4E54528C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:58:58 +0200 (CEST)
Received: from localhost ([::1]:46146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLUm-0002H0-MI
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzKQa-0006I4-3b
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:50:33 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzKQW-0005Fa-1K
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:50:29 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 r187-20020a1c44c4000000b0039c76434147so34836wma.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=waa+lo/43fb0uWQGg2BCd+M2boOSQAUt5Na8xbdgyM0=;
 b=tGeCBf4XbecI1Oq9sVYSz25XuWE/dkajRoeCAJwFkhbrkjpAtNwc/aL95cBK3YUj5X
 CchZamHeNJxCgtHqHI3a77++K6Ns2bF812S8H1EsNQaaZQM8I5BI0gSyTY+8Gf0G1i40
 zif1FnqrxOkg6I2OlY7zYV3rja9B80XDDZDOMsr0tEpST+VnXZ8zOhd5/VV4twt1HKm3
 cv9WRzn0XAU/fS8hqT/SJdDZsIXonhYg4I8iV+ZTLB5HCcFGioG+sDfXDsWijQ9E6KhI
 TpONepwxnZUKrYdCtjWtV68HXbuSiu/jcp/3pZCPGKg7n2a1VuOTTj8ZCw3wHr1X2ZQt
 ROlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=waa+lo/43fb0uWQGg2BCd+M2boOSQAUt5Na8xbdgyM0=;
 b=DM5tgb2dCLKZuUfNxerUJE54PjinPLYkxv80ViaxUEl3sbBzDwut6NUamASg4tpgIz
 ddOAUSpM2QzRlm4nzROIWXToLj54Lbb/6ipUDkN9BlnDM4hsLDqWfYvT1Xf4u68x6SVH
 UuqX4V1EH/vUo2kfd6hd4z66I3ev2y5OG+sGpHFUbxYqHro5gPkX3QrBiDfoMTgPRUU2
 xG+B78S8si19N5FFG5jzMxcbWXZCJN+nCoOG/4IgXdIbslB3BzwHci6+boJThDLipDTr
 qMkUYCEjIX1P9khXB6LJpRPZFNCyn/dLm2IxXB4CKtzUsuPEWuKF0gKXxAt6TLlLkVX6
 5kFQ==
X-Gm-Message-State: AOAM531rRb55QiJdcpVJDiTHuRoaGhEZ4H1n1ozhL2R42gM26IKbinEj
 bsRJyLCoMzUA71lXk+JPBmEtzg==
X-Google-Smtp-Source: ABdhPJyVpv5ma7Iamc6R4LJXPaTu7slCljaWg7p3yqFLrwKxIQpjZgzzt5Ck5HwgPGS+QsZtW0MmGg==
X-Received: by 2002:a1c:4484:0:b0:39c:4597:1f74 with SMTP id
 r126-20020a1c4484000000b0039c45971f74mr3927435wma.13.1654789825874; 
 Thu, 09 Jun 2022 08:50:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a5d456d000000b0021024f82e01sm24509875wrc.16.2022.06.09.08.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 08:50:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 44F751FFB7;
 Thu,  9 Jun 2022 16:50:24 +0100 (BST)
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-16-richard.henderson@linaro.org>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 15/53] semihosting: Remove GDB_O_BINARY
Date: Thu, 09 Jun 2022 16:49:42 +0100
In-reply-to: <20220607204557.658541-16-richard.henderson@linaro.org>
Message-ID: <87fskdsunz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

> The value is zero, and gdb always opens files in binary mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

It might be worth mentioning these are the FILEIO_ flags in
include/gdb/fileio.h to make future referencing easier.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> ---
>  semihosting/arm-compat-semi.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index cebbad2355..92c1375b15 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -92,21 +92,20 @@
>  #define GDB_O_APPEND  0x008
>  #define GDB_O_CREAT   0x200
>  #define GDB_O_TRUNC   0x400
> -#define GDB_O_BINARY  0
>=20=20
>  static int gdb_open_modeflags[12] =3D {
>      GDB_O_RDONLY,
> -    GDB_O_RDONLY | GDB_O_BINARY,
> +    GDB_O_RDONLY,
> +    GDB_O_RDWR,
>      GDB_O_RDWR,
> -    GDB_O_RDWR | GDB_O_BINARY,
>      GDB_O_WRONLY | GDB_O_CREAT | GDB_O_TRUNC,
> -    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_TRUNC | GDB_O_BINARY,
> +    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_TRUNC,
> +    GDB_O_RDWR | GDB_O_CREAT | GDB_O_TRUNC,
>      GDB_O_RDWR | GDB_O_CREAT | GDB_O_TRUNC,
> -    GDB_O_RDWR | GDB_O_CREAT | GDB_O_TRUNC | GDB_O_BINARY,
>      GDB_O_WRONLY | GDB_O_CREAT | GDB_O_APPEND,
> -    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_APPEND | GDB_O_BINARY,
> +    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_APPEND,
> +    GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND,
>      GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND,
> -    GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND | GDB_O_BINARY
>  };
>=20=20
>  static int open_modeflags[12] =3D {


--=20
Alex Benn=C3=A9e

