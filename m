Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579BA2ED5E1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:45:01 +0100 (CET)
Received: from localhost ([::1]:43694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZLI-0001hQ-Do
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZG6-0004mK-O4
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:39:40 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZG5-0003GN-1i
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:39:38 -0500
Received: by mail-ej1-x629.google.com with SMTP id 6so10844151ejz.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=srY4sloYL3cPGVkeYpWQV/O1Ofps9sp0I6HDWtlGXcc=;
 b=LICvEyFqiaZwHQ9R2roughkIhHn7GpvWoeDji5H252g2VhtbIPOCe4YJnF3HXQdl75
 NOJIReNZL49epSb3xDephCZ2yIMi2qhUgkx5NkpjwS6sc6JT0JEl5grjZy7hLEeegyo8
 5CZgUiBZ5ByhTYYPYS269Bxaa2MYAcsKO3oukH7LLSt216hREYkOl58BwE3B7H103yzo
 zz8MZbhXpZf+VrfLO+NEeZhd0VyN9Z757AV5TvgDl60PAeOeqp3YiHbczMX0YafiPQUj
 k1Az6OA8ab+UWUZKKWTlB1rxCo63ZTp/X/z5GTEewAkPPXEz3s3vPZiQ9FY4Q2Y8ek/S
 Uvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=srY4sloYL3cPGVkeYpWQV/O1Ofps9sp0I6HDWtlGXcc=;
 b=lNzdlPRSY7HLKsb01q0bv0KMlTGXpa7I1w5cW0wj+IBnWzxHApK2TpdS8XepswarVW
 nA2S6yfEAyObNGGZkHmxqJNZ7eKs7yhCiNV4kLwY3LlVN/O9ThKOmt+L4pup5woF9j5l
 +DjfeI4fcVzkjBAfVlQBeirVsYhl3o8HCNjAbtx9OQgCqJx2hV0iqGkGQMJuJ8MWViSX
 6qM/VeourUEjuJ4GUFmS5n0xGZh2mUPG6DBPLWOddKexGkrV01OqyVULqViPXc2buYrA
 u54o/ZUZxKVhFi4r/oRaqaTpCVa3Yu5aR0wYhGY7nTzcaKe3TyieHrF3+H4YcRwyDyHD
 CWsw==
X-Gm-Message-State: AOAM533OpfaTYCMbNfrUf17QVHRiA8qgcsoOiNZO9Eh0OwJ7BhhgYL90
 FAt51dAa6uk5UMHsvO0AwxMKuoKm/eWN3oQ9DdRqkg==
X-Google-Smtp-Source: ABdhPJyjmFsnMKU4qK6p+uJjYAtmp1LcieeLWkj+I8PybtslnGb1JZRDFmbi7jNRzTBzZBtDjxqJ9mxt1OOrgsI6DGI=
X-Received: by 2002:a17:906:195a:: with SMTP id
 b26mr6972262eje.4.1610041175734; 
 Thu, 07 Jan 2021 09:39:35 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-25-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:39:24 +0000
Message-ID: <CAFEAcA97CfTvAJkSHEYtEKrg9jZjCLTbra-KFxfYZVuCH7MMkA@mail.gmail.com>
Subject: Re: [PATCH v2 24/24] target/arm: Enforce alignment for sve
 unpredicated LDR/STR
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 18:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 58 +++++++++++++++++++++++++++++---------
>  1 file changed, 45 insertions(+), 13 deletions(-)
>
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 6125e734af..b481e97428 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -4263,7 +4263,8 @@ static bool trans_UCVTF_dd(DisasContext *s, arg_rpr_esz *a)
>   * The load should begin at the address Rn + IMM.
>   */
>
> -static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
> +static void do_ldr(DisasContext *s, uint32_t vofs, int len,
> +                   MemOp align, int rn, int imm)
>  {
>      int len_align = QEMU_ALIGN_DOWN(len, 8);
>      int len_remain = len % 8;
> @@ -4276,6 +4277,10 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
>      clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
>      tcg_temp_free_i64(dirty_addr);
>
> +    if (!s->align_mem) {
> +        align = 0;
> +    }
> +
>      /*
>       * Note that unpredicated load/store of vector/predicate registers
>       * are defined as a stream of bytes, which equates to little-endian
> @@ -4288,7 +4293,8 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
>
>          t0 = tcg_temp_new_i64();
>          for (i = 0; i < len_align; i += 8) {
> -            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ);
> +            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ | align);
> +            align = 0;
>              tcg_gen_st_i64(t0, cpu_env, vofs + i);
>              tcg_gen_addi_i64(clean_addr, clean_addr, 8);
>          }
> @@ -4302,6 +4308,16 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
>          clean_addr = new_tmp_a64_local(s);
>          tcg_gen_mov_i64(clean_addr, t0);
>
> +        if (align > MO_ALIGN_8) {
> +            t0 = tcg_temp_new_i64();
> +            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ | align);
> +            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
> +            tcg_gen_addi_ptr(i, i, 8);
> +            tcg_gen_st_i64(t0, cpu_env, vofs);
> +            tcg_temp_free_i64(t0);
> +            align = 0;
> +        }
> +

Why do we need to do this (and the similar thing in do_str()) ?
Most of the rest of the patch is fairly clear in that it is just
passing the alignment requirement through to the load/store fns,
but this is a bit more opaque to me...

thanks
-- PMM

