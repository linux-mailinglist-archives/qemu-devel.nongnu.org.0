Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861BD6FF6DF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 18:15:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8v4-0006ZE-Em; Thu, 11 May 2023 12:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8v2-0006Z5-Os
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:13:28 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8v1-0001CI-36
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:13:28 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f49bf0223cso21338925e9.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 09:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683821605; x=1686413605;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5H8RtjP4IZ4Dsi09pBOsNwuUSFsT1+JbEtoiLHC68IM=;
 b=Ip/ZQA0kXYqYxFBnyQTRV7Lndx6bJbFINM+a6iSnU9H7JhqT74Ubsk1kF2/7eSXb1f
 x5AzqWxA56kw4Vk6chM6ppWy6Pm6A25QcSNKGIvfLENf01A8doVs4fPqDC0raCELql6P
 b6v/owYipZtHzDEbFhjgj2YY1GYO6BkbGiFyTK3Gu87CY8rMpx15e9wWnG3qM/qv9d9r
 +fHdpJDIZx4cvxlWA0QIqAHeK2RrjHERLciqWz7neTPWX3YA7zFOqccC1XCC3/gS9MWZ
 2ZpHPKtwE+Zeztub1/co6XtkKnGlKkphmT9Av9uWxgE/MiKl2r6my5W48tyv1fUzdcwx
 Fr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683821605; x=1686413605;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5H8RtjP4IZ4Dsi09pBOsNwuUSFsT1+JbEtoiLHC68IM=;
 b=LdTIjzgtmPBHPf4uMIjM+HuBtmK/AO8isFHGx3RGjXcv5XkGuZ40TgBafMZitX95C6
 OH5TBsNwg4oCt6Yf4n7fvkByISxd1u6ZBxM+T5rtgqFP4h6lzTdf5URSGMjTJJNCIVT8
 SL72FeJ6785IL45R2NU0iNhupCxrRFDW7GJA2Cerr6OWYBrcoO0kuDMjmnkj7xmUqTpt
 7pEzO3r05LiXs3haLBKyZc5AP98Nc/psVj5aXAANDZEnfUQpKGCICF5pxGzuEugUAfD6
 dK5C5gCjAUihdlNIUq50g10oR6hPuaoChUG5XGR75eXb/ZmxypxmOCFSalgoRBVk7rd/
 CH/w==
X-Gm-Message-State: AC+VfDyDvUBE0X0Yejpd6+FQ1uEqxx8ZUa+NeSSjBXTq4lB1rMRLbmbg
 lVeCBnHUbhrnZR/WrDr2EyjLow==
X-Google-Smtp-Source: ACHHUZ6m2QTfwMR4d/G2Nh2MmJeoQhkLAvS5GYdfaoyeu9lbjFQThQuyximsTk7ioZuoohgrNMHFiA==
X-Received: by 2002:adf:fdcc:0:b0:307:7e68:3a47 with SMTP id
 i12-20020adffdcc000000b003077e683a47mr14835915wrs.37.1683821605247; 
 Thu, 11 May 2023 09:13:25 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a5d4252000000b00304aba2cfcbsm20977235wrr.7.2023.05.11.09.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 09:13:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C44F1FFBB;
 Thu, 11 May 2023 17:13:24 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-14-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 13/84] tcg: Remove TCGv from tcg_gen_atomic_*
Date: Thu, 11 May 2023 17:09:49 +0100
In-reply-to: <20230503072331.1747057-14-richard.henderson@linaro.org>
Message-ID: <87ednm26e3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Expand from TCGv to TCGTemp inline in the translators,
> and validate that the size matches tcg_ctx->addr_type.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-op.h | 184 ++++++++++++++++++++++++++++++----------
>  tcg/tcg-op-ldst.c    | 198 ++++++++++++++++++++++++++++---------------
>  2 files changed, 267 insertions(+), 115 deletions(-)
>
<snip>
> diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
> index a94a70e8c4..4624b0a25b 100644
> --- a/tcg/tcg-op-ldst.c
> +++ b/tcg/tcg-op-ldst.c
<snip>
>=20=20
> -static void do_atomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
> +static void do_atomic_op_i64(TCGv_i64 ret, TCGTemp *addr, TCGv_i64 val,
>                               TCGArg idx, MemOp memop, void * const table=
[])
>  {
>      memop =3D tcg_canonicalize_memop(memop, 1, 0);
>=20=20
>      if ((memop & MO_SIZE) =3D=3D MO_64) {
> -#ifdef CONFIG_ATOMIC64

The commit message could briefly mention the table expansion is
controlled by CONFIG_ATOMIC64 so why we don't check it here.

> -        gen_atomic_op_i64 gen;
> -        TCGv_i64 a64;
> -        MemOpIdx oi;
> +        gen_atomic_op_i64 gen =3D table[memop & (MO_SIZE | MO_BSWAP)];
>=20=20
> -        gen =3D table[memop & (MO_SIZE | MO_BSWAP)];
> -        tcg_debug_assert(gen !=3D NULL);
> +        if (gen) {
> +            MemOpIdx oi =3D make_memop_idx(memop & ~MO_SIGN, idx);
> +            TCGv_i64 a64 =3D maybe_extend_addr64(addr);
> +            gen(ret, cpu_env, a64, val, tcg_constant_i32(oi));
> +            maybe_free_addr64(a64);
> +            return;
> +        }

personal preference nit, we don't need an early return, you could just
hoist into the else leg.


Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

