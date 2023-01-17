Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E6E66E622
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:35:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqnD-00034j-Vc; Tue, 17 Jan 2023 13:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqnC-00032X-34
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:34:42 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqn9-0007ld-Uv
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:34:41 -0500
Received: by mail-wr1-x429.google.com with SMTP id n7so5487912wrx.5
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 10:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eeXz5CxepjPyLlSgR73lzwLo8j2gRTTXupVmteqp9rk=;
 b=lHaclFeocmYMpYa3To0lDZKi5IuGtvvj3DDM9XEXIaaEMJFTuZ0qLMSVFSQqF7gU7y
 GBuvvDmcKzH7cQM8hBFXG+O+vdeZQTJCI3Wo3Yt3/dRWC7wpo6/04Mq0LNgn6CuI8mkP
 N/KZoURkpiAQW8wXeD54XdpPZGXZBPsaz+jcIwO3rIiw60KtW3RTFE0KwAEm9bkoBWQz
 jkCEVppWcWw88ogIXxRUjT9dXet2DK3A/AsBUJm/BKoFEWOZUyd215sb4vRU06SIPqkk
 zR05DYeFMXrXl7wS5/DpscxuLDwFEqT1IXzYLGu4svnKEW537ReDMZ20CqHrJbMFKPr0
 SAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eeXz5CxepjPyLlSgR73lzwLo8j2gRTTXupVmteqp9rk=;
 b=YhBcz+E+lQH6Q8e1C6Fl0l/6QmmNE2nYej93WAnZEuVsVh+WizhgnDHPbtYIebPnBO
 U8Qdl+oWjpJbxdxyAzoUF7CgSokBmLXnXJN+q6b6VCiHq/HPlpjgAJMu8Xr49uR+fQRn
 yyVpz6IHIIlrJq3FZUI+bTpjv0s5v/GlwMmpRy8AfFGWF/u3/i4vn/NuGKCHCY1AEHvX
 eaMtQsi14HKu2MDCvpgpc6wp5D8OhzIQdlF5kK/X4eU7cWpgr2zqDMrJrUqqkI6VYmbF
 fja7THrJWGXViFlNNZUsNe+mentQXRQ7sRz7Z6I7K3GudN3PpcOSQW9+XKNJQAMPYqBa
 E9XA==
X-Gm-Message-State: AFqh2kpzSFv6r8PRGBnqK9veXirhZ6aTWGfxgjpXRhFmItX7EtXezfK5
 A1nTxAstFDuKG9DlZskAKDNst/f0zKYIJO75
X-Google-Smtp-Source: AMrXdXvc0K4KPQUwGuMXU03OD3+48UcXmpKotjRqWqUaTwKq3BiLdx1BEFsX1uObeOv8CaSys2Yjqg==
X-Received: by 2002:adf:f342:0:b0:2bb:9106:d09 with SMTP id
 e2-20020adff342000000b002bb91060d09mr3287497wrp.15.1673980478273; 
 Tue, 17 Jan 2023 10:34:38 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a5d62c7000000b002bbeda3809csm23502777wrv.11.2023.01.17.10.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:34:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 436A51FFB7;
 Tue, 17 Jan 2023 18:34:37 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-21-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 20/22] tcg/arm: Implement direct branch for goto_tb
Date: Tue, 17 Jan 2023 18:33:24 +0000
In-reply-to: <20230109014248.2894281-21-richard.henderson@linaro.org>
Message-ID: <87cz7d103m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

> Now that tcg can handle direct and indirect goto_tb
> simultaneously, we can optimistically leave space for
> a direct branch and fall back to loading the pointer
> from the TB for an indirect branch.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 52 ++++++++++++++++++++++++++++------------
>  1 file changed, 37 insertions(+), 15 deletions(-)
>
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index e1e1c2620d..794ed8c3a2 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -135,6 +135,8 @@ typedef enum {
>      ARITH_BIC =3D 0xe << 21,
>      ARITH_MVN =3D 0xf << 21,
>=20=20
> +    INSN_B         =3D 0x0a000000,
> +
>      INSN_CLZ       =3D 0x016f0f10,
>      INSN_RBIT      =3D 0x06ff0f30,
>=20=20
> @@ -546,7 +548,7 @@ static bool tcg_target_const_match(int64_t val, TCGTy=
pe type, int ct)
>=20=20
>  static void tcg_out_b_imm(TCGContext *s, ARMCond cond, int32_t offset)
>  {
> -    tcg_out32(s, (cond << 28) | 0x0a000000 |
> +    tcg_out32(s, (cond << 28) | INSN_B |
>                      (((offset - 8) >> 2) & 0x00ffffff));

deposit32?

>  }
>=20=20
> @@ -1941,32 +1943,52 @@ static void tcg_out_exit_tb(TCGContext *s, uintpt=
r_t arg)
>=20=20
>  static void tcg_out_goto_tb(TCGContext *s, int which)
>  {
> -    /* Indirect jump method */
> -    intptr_t ptr, dif, dil;
> -    TCGReg base =3D TCG_REG_PC;
> +    uintptr_t i_addr;
> +    intptr_t i_disp;
>=20=20
> -    ptr =3D get_jmp_target_addr(s, which);
> -    dif =3D tcg_pcrel_diff(s, (void *)ptr) - 8;
> -    dil =3D sextract32(dif, 0, 12);
> -    if (dif !=3D dil) {
> +    /* Direct branch will be patched by tb_target_set_jmp_target. */
> +    set_jmp_insn_offset(s, which);
> +    tcg_out32(s, INSN_NOP);
> +
> +    /* When branch is out of range, fall through to indirect. */
> +    i_addr =3D get_jmp_target_addr(s, which);
> +    i_disp =3D tcg_pcrel_diff(s, (void *)i_addr) - 8;
> +    tcg_debug_assert(i_disp < 0);
> +    if (i_disp >=3D -0xfff) {
> +        tcg_out_ld32_12(s, COND_AL, TCG_REG_PC, TCG_REG_PC, i_disp);
> +    } else {
>          /*
>           * The TB is close, but outside the 12 bits addressable by
>           * the load.  We can extend this to 20 bits with a sub of a
> -         * shifted immediate from pc.  In the vastly unlikely event
> -         * the code requires more than 1MB, we'll use 2 insns and
> -         * be no worse off.
> +         * shifted immediate from pc.
>           */
> -        base =3D TCG_REG_R0;
> -        tcg_out_movi32(s, COND_AL, base, ptr - dil);
> +        int h =3D -i_disp;
> +        int l =3D h & 0xfff;
> +
> +        h =3D encode_imm_nofail(h - l);
> +        tcg_out_dat_imm(s, COND_AL, ARITH_SUB, TCG_REG_R0, TCG_REG_PC, h=
);
> +        tcg_out_ld32_12(s, COND_AL, TCG_REG_PC, TCG_REG_R0, l);
>      }
> -    tcg_out_ld32_12(s, COND_AL, TCG_REG_PC, base, dil);
>      set_jmp_reset_offset(s, which);
>  }
>=20=20
>  void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
>                                uintptr_t jmp_rx, uintptr_t jmp_rw)
>  {
> -    /* Always indirect, nothing to do */
> +    uintptr_t addr =3D tb->jmp_target_addr[n];
> +    ptrdiff_t offset =3D addr - (jmp_rx + 8);
> +    tcg_insn_unit insn;
> +
> +    /* Either directly branch, or fall through to indirect branch. */
> +    if (offset =3D=3D sextract64(offset, 0, 26)) {
> +        /* B <addr> */
> +        insn =3D (COND_AL << 28) | INSN_B | ((offset >> 2) &
>  0x00ffffff);

deposit32

> +    } else {
> +        insn =3D INSN_NOP;
> +    }
> +
> +    qatomic_set((uint32_t *)jmp_rw, insn);
> +    flush_idcache_range(jmp_rx, jmp_rw, 4);
>  }
>=20=20
>  static void tcg_out_op(TCGContext *s, TCGOpcode opc,

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

