Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53813DF217
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 18:06:01 +0200 (CEST)
Received: from localhost ([::1]:49722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAwvY-0004OQ-9F
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 12:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAwtL-0002ld-4H
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 12:03:43 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAwtJ-0003KA-5V
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 12:03:42 -0400
Received: by mail-wr1-x434.google.com with SMTP id n12so25886813wrr.2
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cl5gUWlkdYcSAYOONVN4XPHXHL5yH1YkzCBWvK9jc6k=;
 b=c5OEgXSfydtD/ztQehirT6/u0Djz7utQFtIkiygkau5pv+aWNz422U76+sIoeAIbjk
 Y9+iDes7H0nJHqwJQM2s9N5YtaOiqGEq5y0pVl/HOI7SLobRbTKp/9k6OdCe+Xl4cIna
 odvU7hmOUlESWuqZJ9YMq6V8mMKXqwzJsfralgdg01SdeHeWqktXK2HF+aoaAoAydsek
 /LQ1uj+AbDe+pyacYJwOngeordXjhrC02ThZLorL/tiaOEd9b4lC5LM7sQ1OEY2F+8Mf
 qje/v9l0jOujeCE87a2alvlKo93oL2Fy93GsfPSsTPFEEF7AMK+EIEAGn45l3WePzDDe
 jSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cl5gUWlkdYcSAYOONVN4XPHXHL5yH1YkzCBWvK9jc6k=;
 b=HvWyFz+tWG6kKpQZuYRSvO/a+MR16fTxCxwv0bnhZ1cZ/OMjgxN80lzhfrSwHcgeO4
 esCmkCNe1O4rcjM5iNvVRoAnm93ht4XkRI+yo29uZEgowwp3EmPCD9pp245etLUHbv6S
 elmhWKUIui3IHwLju4Eqs6P5R8xYabXiQiX1nzCJkqBejWEPtOY8zQNMPfJa1m3FXh4y
 oU3IfbGFGnnUJa6s90NxE3GyiPVx74cAmRS6x9oObcYfJFjarj8nGZeXWhkaBnnvn114
 CwWjgQ/gYcDM/lZ3FkRpYlJChFi0DaFy0Vu9vsu06YToChbK4KoZ3snilVfXZYWrWXdO
 8aOw==
X-Gm-Message-State: AOAM530J5agb0sbJBBUMYVXrqd38BdzKnikYghrF1XNVUNazl+RPUXiS
 q3f/sDvMc1VClRzz1NcHnY/N+w==
X-Google-Smtp-Source: ABdhPJzuU7sF5zWVSxd6N1hhGWtXBJQz71li/RuIvblFznrqhv9NigUfMI89WtW6hd/NYaMOMhRa8Q==
X-Received: by 2002:adf:d4cd:: with SMTP id w13mr23546707wrk.355.1628006619043; 
 Tue, 03 Aug 2021 09:03:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w10sm13176490wrr.23.2021.08.03.09.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 09:03:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4F25A1FF96;
 Tue,  3 Aug 2021 17:03:37 +0100 (BST)
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-22-richard.henderson@linaro.org>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 21/55] accel/tcg: Drop signness in tracing in cputlb.c
Date: Tue, 03 Aug 2021 16:58:39 +0100
In-reply-to: <20210803041443.55452-22-richard.henderson@linaro.org>
Message-ID: <87im0mfrc6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

> We are already inconsistent about whether or not
> MO_SIGN is set in trace_mem_get_info.  Dropping it
> entirely allows some simplification.

I think once 6.2 opens up we should just drop all the trace_mem stuff:

  Subject: [PATCH  v1 5/7] docs: mark intention to deprecate TCG tracing fu=
nctionality
  Date: Wed,  5 May 2021 10:22:57 +0100
  Message-Id: <20210505092259.8202-6-alex.bennee@linaro.org>

>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c    | 10 +++-------
>  accel/tcg/user-exec.c | 45 ++++++-------------------------------------
>  2 files changed, 9 insertions(+), 46 deletions(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 116b289907..acdd20b1bc 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -2110,7 +2110,6 @@ static inline uint64_t cpu_load_helper(CPUArchState=
 *env, abi_ptr addr,
>      meminfo =3D trace_mem_get_info(op, mmu_idx, false);
>      trace_guest_mem_before_exec(env_cpu(env), addr, meminfo);
>=20=20
> -    op &=3D ~MO_SIGN;
>      oi =3D make_memop_idx(op, mmu_idx);
>      ret =3D full_load(env, addr, oi, retaddr);
>=20=20
> @@ -2128,8 +2127,7 @@ uint32_t cpu_ldub_mmuidx_ra(CPUArchState *env, abi_=
ptr addr,
>  int cpu_ldsb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
>                         int mmu_idx, uintptr_t ra)
>  {
> -    return (int8_t)cpu_load_helper(env, addr, mmu_idx, ra, MO_SB,
> -                                   full_ldub_mmu);
> +    return (int8_t)cpu_ldub_mmuidx_ra(env, addr, mmu_idx, ra);
>  }
>=20=20
>  uint32_t cpu_lduw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
> @@ -2141,8 +2139,7 @@ uint32_t cpu_lduw_be_mmuidx_ra(CPUArchState *env, a=
bi_ptr addr,
>  int cpu_ldsw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
>                            int mmu_idx, uintptr_t ra)
>  {
> -    return (int16_t)cpu_load_helper(env, addr, mmu_idx, ra, MO_BESW,
> -                                    full_be_lduw_mmu);
> +    return (int16_t)cpu_lduw_be_mmuidx_ra(env, addr, mmu_idx, ra);
>  }
>=20=20
>  uint32_t cpu_ldl_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
> @@ -2166,8 +2163,7 @@ uint32_t cpu_lduw_le_mmuidx_ra(CPUArchState *env, a=
bi_ptr addr,
>  int cpu_ldsw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
>                            int mmu_idx, uintptr_t ra)
>  {
> -    return (int16_t)cpu_load_helper(env, addr, mmu_idx, ra, MO_LESW,
> -                                    full_le_lduw_mmu);
> +    return (int16_t)cpu_lduw_le_mmuidx_ra(env, addr, mmu_idx, ra);
>  }
>=20=20
>  uint32_t cpu_ldl_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 5ad808a25a..e687b9652e 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -866,13 +866,7 @@ uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr pt=
r)
>=20=20
>  int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr)
>  {
> -    int ret;
> -    uint16_t meminfo =3D trace_mem_get_info(MO_SB, MMU_USER_IDX, false);
> -
> -    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
> -    ret =3D ldsb_p(g2h(env_cpu(env), ptr));
> -    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
> -    return ret;
> +    return (int8_t)cpu_ldub_data(env, ptr);
>  }
>=20=20
>  uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr)
> @@ -888,13 +882,7 @@ uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr=
 ptr)
>=20=20
>  int cpu_ldsw_be_data(CPUArchState *env, abi_ptr ptr)
>  {
> -    int ret;
> -    uint16_t meminfo =3D trace_mem_get_info(MO_BESW, MMU_USER_IDX, false=
);
> -
> -    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
> -    ret =3D ldsw_be_p(g2h(env_cpu(env), ptr));
> -    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
> -    return ret;
> +    return (int16_t)cpu_lduw_be_data(env, ptr);
>  }
>=20=20
>  uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr)
> @@ -932,13 +920,7 @@ uint32_t cpu_lduw_le_data(CPUArchState *env, abi_ptr=
 ptr)
>=20=20
>  int cpu_ldsw_le_data(CPUArchState *env, abi_ptr ptr)
>  {
> -    int ret;
> -    uint16_t meminfo =3D trace_mem_get_info(MO_LESW, MMU_USER_IDX, false=
);
> -
> -    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
> -    ret =3D ldsw_le_p(g2h(env_cpu(env), ptr));
> -    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
> -    return ret;
> +    return (int16_t)cpu_lduw_le_data(env, ptr);
>  }
>=20=20
>  uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr)
> @@ -975,12 +957,7 @@ uint32_t cpu_ldub_data_ra(CPUArchState *env, abi_ptr=
 ptr, uintptr_t retaddr)
>=20=20
>  int cpu_ldsb_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
>  {
> -    int ret;
> -
> -    set_helper_retaddr(retaddr);
> -    ret =3D cpu_ldsb_data(env, ptr);
> -    clear_helper_retaddr();
> -    return ret;
> +    return (int8_t)cpu_ldub_data_ra(env, ptr, retaddr);
>  }
>=20=20
>  uint32_t cpu_lduw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t r=
etaddr)
> @@ -995,12 +972,7 @@ uint32_t cpu_lduw_be_data_ra(CPUArchState *env, abi_=
ptr ptr, uintptr_t retaddr)
>=20=20
>  int cpu_ldsw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retadd=
r)
>  {
> -    int ret;
> -
> -    set_helper_retaddr(retaddr);
> -    ret =3D cpu_ldsw_be_data(env, ptr);
> -    clear_helper_retaddr();
> -    return ret;
> +    return (int16_t)cpu_lduw_be_data_ra(env, ptr, retaddr);
>  }
>=20=20
>  uint32_t cpu_ldl_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t re=
taddr)
> @@ -1035,12 +1007,7 @@ uint32_t cpu_lduw_le_data_ra(CPUArchState *env, ab=
i_ptr ptr, uintptr_t retaddr)
>=20=20
>  int cpu_ldsw_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retadd=
r)
>  {
> -    int ret;
> -
> -    set_helper_retaddr(retaddr);
> -    ret =3D cpu_ldsw_le_data(env, ptr);
> -    clear_helper_retaddr();
> -    return ret;
> +    return (int16_t)cpu_lduw_le_data_ra(env, ptr, retaddr);
>  }
>=20=20
>  uint32_t cpu_ldl_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t re=
taddr)


--=20
Alex Benn=C3=A9e

