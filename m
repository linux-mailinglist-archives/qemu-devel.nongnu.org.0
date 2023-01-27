Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E27267ED5B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 19:24:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLTOZ-0000f6-Im; Fri, 27 Jan 2023 13:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pLTOY-0000ew-Hb
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:24:14 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pLTOW-0005Oz-Tb
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:24:14 -0500
Received: by mail-wr1-x42c.google.com with SMTP id b7so5759300wrt.3
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 10:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H5yg6SZB9OjWTXhOeooyo/5xRAp7xoZDmWqvG+ybkqk=;
 b=HJgtSMXkHyKRmUQphO7JnubRawX4mLzN7zh/jqsDyRiHeQ6p2C2rE037BsEYbcJWdz
 PJvoMneLQvWNNZQAbh6saurtBN9Cdp+q/Fbf5wMCgNQMKwYwQLKuy8mzbqSpj9GIycOH
 XxPBO8HVpUxRVJZP/0B7jJcEcS/WcwGOGUo68rTsJxFlMd9ji0ggTiWrNxAPN13BMVf9
 1At9T4Y30xCD4iMdxWxfR8XZRJlGOIRAfAAbNoSAZRne21FoOW4BZ2eP/aO7KFBaeGXO
 EbAomYpHHUaivznrmQhEKU3dVn4zSsFVm9puVEAalA+NpasbYtWcBhj0wtpyTqRJcDBC
 j3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=H5yg6SZB9OjWTXhOeooyo/5xRAp7xoZDmWqvG+ybkqk=;
 b=eMAjhrRWt5kLc2KlX8wgWm7AkhdfMTedXRWEMNvz1Gbb0QsDsItF1/ArUsLvETe0fd
 ZugyexNrb9wYuXmns6D237ZREqaJ9ekAhLsRr2gqtcZrl66ClDYI9CYl30bYJsBwKFd+
 xNVban+y8M2nHyiN32rUB5dSUWIe5dfRnkneub4PPAQKxKjrFWm74Gf1LVkI1L2w5ZDx
 TbdhsFW5Uqz1yKwKJ16WPp61Ot944Bz45Wg3ZdT/UlIUxsD2m7hPVZrhTZbH4+a78lln
 GATfnWULQ1VD3WfjFkhcQnigLWuiLkC0QNJSNfDZ5xHCX/++aBgSOvuHznN6B0NpTwIp
 XyBQ==
X-Gm-Message-State: AFqh2krFx24/BP2P9OE3VuhIumi60UaAURRrUORkN+OaK5dreY2EJhtm
 ObWhz5fDYzoN+es8XvPEUZgkcw==
X-Google-Smtp-Source: AMrXdXs3xbDzwj38Vozz349x6fSsGrXkTKhYQ/lqS7Pe6rAytdtUspC5XOJqjWTIfQnHF37Gaynl3w==
X-Received: by 2002:a5d:6b03:0:b0:2bd:e87a:7fb7 with SMTP id
 v3-20020a5d6b03000000b002bde87a7fb7mr36263636wrw.26.1674843850806; 
 Fri, 27 Jan 2023 10:24:10 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e28-20020a5d595c000000b002bfd8ad20a0sm532838wri.44.2023.01.27.10.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 10:24:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8BEF81FFB7;
 Fri, 27 Jan 2023 18:24:09 +0000 (GMT)
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-15-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v5 14/36] tcg: Add basic data movement for TCGv_i128
Date: Fri, 27 Jan 2023 18:23:34 +0000
In-reply-to: <20230126043824.54819-15-richard.henderson@linaro.org>
Message-ID: <875ycromye.fsf@linaro.org>
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Add code generation functions for data movement between
> TCGv_i128 (mov) and to/from TCGv_i64 (concat, extract).
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-op.h |  4 ++++
>  tcg/tcg-internal.h   | 13 +++++++++++++
>  tcg/tcg-op.c         | 20 ++++++++++++++++++++
>  3 files changed, 37 insertions(+)
>
> diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
> index 79b1cf786f..c4276767d1 100644
> --- a/include/tcg/tcg-op.h
> +++ b/include/tcg/tcg-op.h
> @@ -712,6 +712,10 @@ void tcg_gen_extrh_i64_i32(TCGv_i32 ret, TCGv_i64 ar=
g);
>  void tcg_gen_extr_i64_i32(TCGv_i32 lo, TCGv_i32 hi, TCGv_i64 arg);
>  void tcg_gen_extr32_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i64 arg);
>=20=20
> +void tcg_gen_mov_i128(TCGv_i128 dst, TCGv_i128 src);
> +void tcg_gen_extr_i128_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i128 arg);
> +void tcg_gen_concat_i64_i128(TCGv_i128 ret, TCGv_i64 lo, TCGv_i64 hi);
> +
>  static inline void tcg_gen_concat32_i64(TCGv_i64 ret, TCGv_i64 lo, TCGv_=
i64 hi)
>  {
>      tcg_gen_deposit_i64(ret, lo, hi, 32, 32);
> diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
> index 33f1d8b411..e542a4e9b7 100644
> --- a/tcg/tcg-internal.h
> +++ b/tcg/tcg-internal.h
> @@ -117,4 +117,17 @@ extern TCGv_i32 TCGV_LOW(TCGv_i64) QEMU_ERROR("32-bi=
t code path is reachable");
>  extern TCGv_i32 TCGV_HIGH(TCGv_i64) QEMU_ERROR("32-bit code path is reac=
hable");
>  #endif
>=20=20
> +static inline TCGv_i64 TCGV128_LOW(TCGv_i128 t)
> +{
> +    /* For 32-bit, offset by 2, which may then have TCGV_{LOW,HIGH} appl=
ied. */
> +    int o =3D HOST_BIG_ENDIAN ? 64 / TCG_TARGET_REG_BITS : 0;
> +    return temp_tcgv_i64(tcgv_i128_temp(t) + o);
> +}
> +
> +static inline TCGv_i64 TCGV128_HIGH(TCGv_i128 t)
> +{
> +    int o =3D HOST_BIG_ENDIAN ? 0 : 64 / TCG_TARGET_REG_BITS;
> +    return temp_tcgv_i64(tcgv_i128_temp(t) + o);
> +}
> +

I was going to question the names but I guess its following the style of
the other functions in the file so:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

