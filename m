Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15FB32F272
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:25:25 +0100 (CET)
Received: from localhost ([::1]:46934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIF8e-0002t9-Sb
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:25:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEVs-0001DY-75
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:45:21 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEVo-00088C-TD
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:45:19 -0500
Received: by mail-ed1-x529.google.com with SMTP id bd6so3728899edb.10
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=W3Ub2NjyIaOKz4gKANaEYkrmc7P1romTFfo07vnOg9c=;
 b=aF4bHmRrVFWbFUgGF0GG9+wecrjjmjxxI5Ykn4b8lG/ILw4CLlir9J9sAz+Y4kjdAN
 U4nMK++1DhykzJ74Cb22FGXLc2wLuHH4J34mLdyMJqSiWXN9apo5yvIOnrchpwijwKR5
 RnboJ2fJxdqkh7qGYI/GaoECKUAW88tRzuzTgxBBAHRytWswg0U6hZG3jKyNQsJfeLEc
 7DBcyR0tEhRJDUSj1Ol1eKlf6wVHUu8FuryAVLz70ZHY32G300pv05u3Mm4FpBlO3TZ4
 57r6cyMb79ukJWmRR20sa7oY5zXX1daBpvWH2w3HAFulV1fVXBN/33fm50vueAC5Jqv5
 yEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=W3Ub2NjyIaOKz4gKANaEYkrmc7P1romTFfo07vnOg9c=;
 b=I770LFJbp7JLJ2ShzC26SdjCUX5C/xFKiEKMy0srDuIxaCBTxHyB4MmpwO9YOxBRnD
 rzljRG6cyueAKzcLY4lLBlkNHt//24x1JUaXxTrpelZestfakWvEcnmxi0fpJAF0VSGo
 T0q2+pVfIwsmcYQGlH4wJ0SLJ/yAf+OhZVGdt7szOLst/q0OnWUiCL3Zt9DSvfA7YqcL
 hHnPja3+jc8WnNsx4HLMlf4nP2QhMJY/7Qjq4F+cq0wXB+KTqyNNn3oxxQBBFibpjkip
 AyJjtVdHzMBcg702o/qBWdGEMwvRwqNYVCSCDYxqoxdkMDFomQJGhXWJKFUfRg5n+25f
 pNVw==
X-Gm-Message-State: AOAM533Q9x13AoTyNUuzboeQEI3V6gdXH+X0tj3YGZv0jUYbwVg5E20D
 UAzJ+5NEjmsde6dxoxA876f44Q==
X-Google-Smtp-Source: ABdhPJwJz9jHuRkLIAiTAjphLolA4g890ar0rpzHbTBxE6rVXmPFg9cD7pndTxr58peuvN9nUU426w==
X-Received: by 2002:a05:6402:35d3:: with SMTP id
 z19mr10031352edc.143.1614966314621; 
 Fri, 05 Mar 2021 09:45:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id bi26sm1823013ejb.120.2021.03.05.09.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:45:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 287AA1FF7E;
 Fri,  5 Mar 2021 17:45:12 +0000 (GMT)
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-5-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 04/27] tcg/tci: Use exec/cpu_ldst.h interfaces
Date: Fri, 05 Mar 2021 17:45:04 +0000
In-reply-to: <20210302175741.1079851-5-richard.henderson@linaro.org>
Message-ID: <87lfb1ebpz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Use the provided cpu_ldst.h interfaces.  This fixes the build vs
> the unconverted uses of g2h(), adds missed memory trace events,
> and correctly recognizes when a SIGSEGV belongs to the guest via
> set_helper_retaddr().
>
> Fixes: 3e8f1628e864
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tcg/tci.c | 73 +++++++++++++++++++++----------------------------------
>  1 file changed, 28 insertions(+), 45 deletions(-)
>
> diff --git a/tcg/tci.c b/tcg/tci.c
> index fb3c97aaf1..1c667537fe 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -346,51 +346,34 @@ static bool tci_compare64(uint64_t u0, uint64_t u1,=
 TCGCond condition)
>      return result;
>  }
>=20=20
> -#ifdef CONFIG_SOFTMMU
> -# define qemu_ld_ub \
> -    helper_ret_ldub_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
> -# define qemu_ld_leuw \
> -    helper_le_lduw_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
> -# define qemu_ld_leul \
> -    helper_le_ldul_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
> -# define qemu_ld_leq \
> -    helper_le_ldq_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
> -# define qemu_ld_beuw \
> -    helper_be_lduw_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
> -# define qemu_ld_beul \
> -    helper_be_ldul_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
> -# define qemu_ld_beq \
> -    helper_be_ldq_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
> -# define qemu_st_b(X) \
> -    helper_ret_stb_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
> -# define qemu_st_lew(X) \
> -    helper_le_stw_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
> -# define qemu_st_lel(X) \
> -    helper_le_stl_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
> -# define qemu_st_leq(X) \
> -    helper_le_stq_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
> -# define qemu_st_bew(X) \
> -    helper_be_stw_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
> -# define qemu_st_bel(X) \
> -    helper_be_stl_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
> -# define qemu_st_beq(X) \
> -    helper_be_stq_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
> -#else
> -# define qemu_ld_ub      ldub_p(g2h(taddr))
> -# define qemu_ld_leuw    lduw_le_p(g2h(taddr))
> -# define qemu_ld_leul    (uint32_t)ldl_le_p(g2h(taddr))
> -# define qemu_ld_leq     ldq_le_p(g2h(taddr))
> -# define qemu_ld_beuw    lduw_be_p(g2h(taddr))
> -# define qemu_ld_beul    (uint32_t)ldl_be_p(g2h(taddr))
> -# define qemu_ld_beq     ldq_be_p(g2h(taddr))
> -# define qemu_st_b(X)    stb_p(g2h(taddr), X)
> -# define qemu_st_lew(X)  stw_le_p(g2h(taddr), X)
> -# define qemu_st_lel(X)  stl_le_p(g2h(taddr), X)
> -# define qemu_st_leq(X)  stq_le_p(g2h(taddr), X)
> -# define qemu_st_bew(X)  stw_be_p(g2h(taddr), X)
> -# define qemu_st_bel(X)  stl_be_p(g2h(taddr), X)
> -# define qemu_st_beq(X)  stq_be_p(g2h(taddr), X)
> -#endif
> +#define qemu_ld_ub \
> +    cpu_ldub_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
> +#define qemu_ld_leuw \
> +    cpu_lduw_le_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
> +#define qemu_ld_leul \
> +    cpu_ldl_le_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
> +#define qemu_ld_leq \
> +    cpu_ldq_le_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
> +#define qemu_ld_beuw \
> +    cpu_lduw_be_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
> +#define qemu_ld_beul \
> +    cpu_ldl_be_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
> +#define qemu_ld_beq \
> +    cpu_ldq_be_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
> +#define qemu_st_b(X) \
> +    cpu_stb_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
> +#define qemu_st_lew(X) \
> +    cpu_stw_le_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_pt=
r)
> +#define qemu_st_lel(X) \
> +    cpu_stl_le_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_pt=
r)
> +#define qemu_st_leq(X) \
> +    cpu_stq_le_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_pt=
r)
> +#define qemu_st_bew(X) \
> +    cpu_stw_be_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_pt=
r)
> +#define qemu_st_bel(X) \
> +    cpu_stl_be_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_pt=
r)
> +#define qemu_st_beq(X) \
> +    cpu_stq_be_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_pt=
r)
>=20=20
>  #if TCG_TARGET_REG_BITS =3D=3D 64
>  # define CASE_32_64(x) \


--=20
Alex Benn=C3=A9e

