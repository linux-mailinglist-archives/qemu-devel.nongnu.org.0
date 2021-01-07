Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCCD2ED5D6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:42:18 +0100 (CET)
Received: from localhost ([::1]:35662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZIf-0006i8-5R
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZDs-0002XE-EI
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:37:20 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:33949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZDq-0002MU-Pz
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:37:20 -0500
Received: by mail-ej1-x62a.google.com with SMTP id g20so10907686ejb.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DbS0I2K8B65FPuWvq8j/kM7LVjQQGnnuwuhs1umMt2s=;
 b=iKyrx4VkTtSEI30W0iZa6NMBOAG/gZgLbcgaQQNQQByvdeB+KXaJgGjGf25FTukfYj
 5xeP6f/quVNqH13UoL89mY2Plury3ho2pVENPXo6ae7spUPJcfttmnuIMCbbtwlZYAsK
 NI4j42Dl3BNgRe3WDaAEFX/Xk0ZZAdzilTzN1aP6Znu/+YGIvwVLDHG2QJqyIB9b+mF2
 xi4fjPc/9KivFm8EILeYVt2H6USsDxD/uyHEoB57zrKqOUGAkNMxB5IFCcy7A3P+/8iL
 bjDeV+H+XRant+M3bXy+mBq9qDIrIEHxlNyZLdawuh+3r6axLaarApe+7Fk55C1LkGX4
 quSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DbS0I2K8B65FPuWvq8j/kM7LVjQQGnnuwuhs1umMt2s=;
 b=EDO+3Rq2ftUg2PoNDYOrUVlppBgb791AA1PIZkjCrBLFKARi5nOdDsORepN+N4jtE3
 W+alUPvmYbbl7PzWV8BjGpmo0oDlatCbcalnTTv04UMQF6vt4Au2iKNGKhp3s2PbeUfQ
 f7l0Y21cpONlqnDEH8IXbnxGphoEPqWZXM7GhMDdZD3ZgtSAoJrbS/g/gTBOJ9W/sCmw
 PFdh9R/97tmpfEaGG6PRJ1i1LklCWm61iYFbwh6VK+bfZUo+vqMXuvy8RCqDWUrWgzsg
 ZpVSifORZZQEnvS/OcX+rMuPu+jmyQigs8JUnj4etH0vDR/CNGfIOWv3UCocUQsqAMRT
 6gpA==
X-Gm-Message-State: AOAM531dhFC2Y/2yx/NhquEQSF2N1ZmU8TrroV+h9g1BtALVXsIOFsS5
 aN/53DSXzIHiSzfI9TEDUFZVe8+oqOZeP43NNbc1PXPHlNg=
X-Google-Smtp-Source: ABdhPJwpjLwONQKRUd7jwiBXnmUcWl1AKA4Cr6wq8BfcUVdzgfmHtu+DPMetCiqM5ciVtxOFKx9RDo2K5qucKw8Na3w=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr7289327eja.250.1610041037356; 
 Thu, 07 Jan 2021 09:37:17 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-24-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:37:06 +0000
Message-ID: <CAFEAcA-FuzJm1Ta=Ha_H1zNCb8s5rsHZ2nZ6ECwiDd42wTBo0w@mail.gmail.com>
Subject: Re: [PATCH v2 23/24] target/arm: Enforce alignment for sve LD1R
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
>  target/arm/translate-sve.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 0c3a6d2121..6125e734af 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -5011,7 +5011,7 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
>      clean_addr = gen_mte_check1(s, temp, false, true, msz);
>
>      tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s),
> -                        s->be_data | dtype_mop[a->dtype]);
> +                        finalize_memop(s, dtype_mop[a->dtype]));
>
>      /* Broadcast to *all* elements.  */
>      tcg_gen_gvec_dup_i64(esz, vec_full_reg_offset(s, a->rd),
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

