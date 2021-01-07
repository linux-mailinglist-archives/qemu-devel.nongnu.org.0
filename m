Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13D42ED441
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:28:32 +0100 (CET)
Received: from localhost ([::1]:39640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxY9H-0003k0-ND
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:28:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxY75-0002za-H4
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:26:15 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:34042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxY73-0008H8-Qp
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:26:15 -0500
Received: by mail-ed1-x533.google.com with SMTP id dk8so8379882edb.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 08:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oURt8cyDt5n8khhHPgTUbOfWdfzgKim0RhWxjUuNImI=;
 b=UuwgodhEhzsTNhCqzCFhxIrxkXKV0SEwZSJblv5m0B3Nh01tW+JrSq9GtKSFfjRB53
 xZKFEv6ozVEiwwQoTlZiirC6Z6MgaT1NzLpYJCLPK6Bu63nDX8tksj+DlkI/Hh8bBTy9
 LvsDcTmDVey05CH+lM3bdI5LFVkTkzEnBs3CKc+ciu3gosM5Dd9/q+X1KV8E8ufyWmKb
 Kf4ocF1ScKfQPdFk0FjNbPnZMow0p5AVqd6Jh0dc41XaJDX3CER1z73YzT4f314ePTcp
 iuzrV6zYnav5qihbsmfIvlRbqUre1wADKFwQtFHyw6KTuyNDWJ9iS/8eKHFsrynz8o0p
 IGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oURt8cyDt5n8khhHPgTUbOfWdfzgKim0RhWxjUuNImI=;
 b=imIH2Pn0JBLnD6oMb9sOavAoW9O7p087KyF6+ld6Yfl98A5Q4Yg6CUwkn14Pfs2Tte
 5dRDDD/6M3sQgyatbyUtQGiDA2Ixk93To66darz1V126j2vrfBZeIjygY5k3/JJmC75m
 xPBWrC58R3OgwK0LcQb8SYHLv+w58mJzkvqLVDOnBeSm5N1SAC0jWar0bt+TyoqXw3bh
 nFhVnvpUvmF98Rk9PhPZX8Ob/C3mGcViUs7YaRpF6V7g16eFNQ8NaqOF237dq6hSJ79u
 fzkQj9bBxAoolwFkL1R3pvNx603BAiP5KnMHSCloKXOchRnX6UpTkhHO1YyheGCHVHsL
 gfcw==
X-Gm-Message-State: AOAM530IxPEQVndsL8/leKVnr1TDhioA4NQRKKhGau4p5hnmbiAfuGCQ
 zo6NV9gQHTEh6Mg29OHCS3fRBiIN9DMh4T+A16684jSwGlc=
X-Google-Smtp-Source: ABdhPJw+3RRxv+EL3nAb3G4g4B0zv/m02jhZaOJ4DakZWlsWK4Z9iU254j2sD/FebdZQhe/qgWyTftJMSZqSrLhVuS4=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr2308305eds.146.1610036772326; 
 Thu, 07 Jan 2021 08:26:12 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-15-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:26:01 +0000
Message-ID: <CAFEAcA_Wosffh-DteyDSqXdGSHMKeB87d_x5+acWw1h0xQ6xuw@mail.gmail.com>
Subject: Re: [PATCH v2 14/24] target/arm: Enforce alignment for VLD1 (all
 lanes)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-neon.c.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Patch subject says "VLD1", but trans_VLD_all_lanes handles all of
the "VLDn to all lanes" insns.

> diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
> index 18d9042130..7cb89b18e0 100644
> --- a/target/arm/translate-neon.c.inc
> +++ b/target/arm/translate-neon.c.inc
> @@ -522,6 +522,7 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
>      int size = a->size;
>      int nregs = a->n + 1;
>      TCGv_i32 addr, tmp;
> +    MemOp mop;
>
>      if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
>          return false;
> @@ -556,12 +557,12 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
>       */
>      stride = a->t ? 2 : 1;
>      vec_size = nregs == 1 ? stride * 8 : 8;
> -
> +    mop = size | (a->a ? MO_ALIGN : 0);
>      tmp = tcg_temp_new_i32();
>      addr = tcg_temp_new_i32();
>      load_reg_var(s, addr, a->rn);
>      for (reg = 0; reg < nregs; reg++) {
> -        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), size);
> +        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
>          if ((vd & 1) && vec_size == 16) {
>              /*
>               * We cannot write 16 bytes at once because the

I think this code is correct for VLD1 (A bit means "address must
be aligned to the size of the element") and VLD3 (A bit is always 0),
but not for VLD2 (A bit means "address must be aligned to 2* size
of element") or VLD4 (A bit means "address must be aligned to 4* size",
and there is a special case for size==3 meaning "32 bits at 16-byte
alignment").

thanks
-- PMM

