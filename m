Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44F039F58D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:49:35 +0200 (CEST)
Received: from localhost ([::1]:45360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaEg-0003hM-U9
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqaDK-0002XR-G9
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:48:10 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqaDI-0005hq-EC
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:48:10 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1423381wmc.1
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5XBb9PjynsHMin5oYyVwQVG3GnI3DOiCJhAHKtHZgMo=;
 b=WBR3+otiKOMnDJAcIT01dVMjJpeFArcLxpTniHL+gFanPUj76KzxGk7Si9hryR2Qyk
 g5cw9/LUswG19IYrXVcEUIg+8cV4fzTEN7U0GJyJO1gDdRenMNA287R5PAWkHYFkOZVk
 FP0S5jTjAppTR4np/Ed/QykgQ0Fm9R6BGfiB43hwjCe51RALOGO5BxebUMHRDhgAqamS
 2SgvVF72TNx3zhYsLYtqLzXC+Erw4ZutuEKU7A2TDIl5dyJ9N5cBD6T2r8Z+RsBMFDNv
 nxHNvexabmi2MkkWwFH+X6F0pcZGzHcvnoC4rFpKyx3x0VBtYoDlWN7b1VuHNMKybl9n
 HRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5XBb9PjynsHMin5oYyVwQVG3GnI3DOiCJhAHKtHZgMo=;
 b=UPg+B/8P/7qSm2d4XYrSdOyz1y/fvpW2VrkhfYhFn0nahK5LyQCkFXY4+zLhzW6+PF
 s4zZNG+b+1uZXagjm6f4C4gvPZsbErkYDRPg6Cump5NiwdIm0KFoCZU3p6KBQoScocbs
 QtU3hUMDf6ghX/KaMPMvGStiwFI/fjp329IuTKjli85LdD07QLKkyytmyYPTumvagdTo
 207vZtVYoXTlLGvU58lWg6jD/UdS3Itb8guK6uyHVi3eZ3a6jKbieyRV34Bk540pvefp
 fpBGKJMDo3Xmy2L2tzkggTClL/2ucIbp+FnnJwz029WC6fBEpt4jGal6sRcfpgpEkAJg
 jvvw==
X-Gm-Message-State: AOAM531tGq+eaybYxJK85YDunSHiVaBXuoin0yQOFR97k1JOBAyPhAI3
 fjKzJJYF+iqovhlB/ZbPEhcOrWJ3yyYmkA==
X-Google-Smtp-Source: ABdhPJxbowmG47CmJJEjf60hA6TSLp/72534hdPwrvddBwOW8PA0IElPoAA2r0fwRPN6tHCClYAKXA==
X-Received: by 2002:a1c:a917:: with SMTP id s23mr17410104wme.55.1623152886499; 
 Tue, 08 Jun 2021 04:48:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c12sm22657347wrr.90.2021.06.08.04.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:48:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F27251FF7E;
 Tue,  8 Jun 2021 12:48:04 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-7-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 06/28] tcg: Split out tcg_region_prologue_set
Date: Tue, 08 Jun 2021 12:47:58 +0100
In-reply-to: <20210502231844.1977630-7-richard.henderson@linaro.org>
Message-ID: <878s3kmvbf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This has only one user, but will make more sense after some
> code motion.
>
> Always leave the tcg_init_ctx initialized to the first region,
> in preparation for tcg_prologue_init().  This also requires
> that we don't re-allocate the region for the first cpu, lest
> we hit the assertion for total number of regions allocated .
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tcg/tcg.c | 37 ++++++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 15 deletions(-)
>
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index df78c89673..ee3319e163 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -885,10 +885,26 @@ void tcg_region_init(void)
>=20=20
>      tcg_region_trees_init();
>=20=20
> -    /* In user-mode we support only one ctx, so do the initial allocatio=
n now */
> -#ifdef CONFIG_USER_ONLY
> -    tcg_region_initial_alloc__locked(tcg_ctx);
> -#endif
> +    /*
> +     * Leave the initial context initialized to the first region.
> +     * This will be the context into which we generate the prologue.
> +     * It is also the only context for CONFIG_USER_ONLY.
> +     */
> +    tcg_region_initial_alloc__locked(&tcg_init_ctx);
> +}
> +
> +static void tcg_region_prologue_set(TCGContext *s)
> +{
> +    /* Deduct the prologue from the first region.  */
> +    g_assert(region.start =3D=3D s->code_gen_buffer);
> +    region.start =3D s->code_ptr;
> +
> +    /* Recompute boundaries of the first region. */
> +    tcg_region_assign(s, 0);
> +
> +    /* Register the balance of the buffer with gdb. */
> +    tcg_register_jit(tcg_splitwx_to_rx(region.start),
> +                     region.end - region.start);
>  }
>=20=20
>  #ifdef CONFIG_DEBUG_TCG
> @@ -968,10 +984,10 @@ void tcg_register_thread(void)
>=20=20
>      if (n > 0) {
>          alloc_tcg_plugin_context(s);
> +        tcg_region_initial_alloc(s);
>      }
>=20=20
>      tcg_ctx =3D s;
> -    tcg_region_initial_alloc(s);
>  }
>  #endif /* !CONFIG_USER_ONLY */
>=20=20
> @@ -1211,8 +1227,6 @@ void tcg_prologue_init(TCGContext *s)
>  {
>      size_t prologue_size;
>=20=20
> -    /* Put the prologue at the beginning of code_gen_buffer.  */
> -    tcg_region_assign(s, 0);
>      s->code_ptr =3D s->code_gen_ptr;
>      s->code_buf =3D s->code_gen_ptr;
>      s->data_gen_ptr =3D NULL;
> @@ -1244,14 +1258,7 @@ void tcg_prologue_init(TCGContext *s)
>                          (uintptr_t)s->code_buf, prologue_size);
>  #endif
>=20=20
> -    /* Deduct the prologue from the first region.  */
> -    region.start =3D s->code_ptr;
> -
> -    /* Recompute boundaries of the first region. */
> -    tcg_region_assign(s, 0);
> -
> -    tcg_register_jit(tcg_splitwx_to_rx(region.start),
> -                     region.end - region.start);
> +    tcg_region_prologue_set(s);
>=20=20
>  #ifdef DEBUG_DISAS
>      if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {


--=20
Alex Benn=C3=A9e

