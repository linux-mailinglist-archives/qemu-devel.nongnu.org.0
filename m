Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EADE66E568
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:57:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqCa-0005E0-7Y; Tue, 17 Jan 2023 12:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqC8-0004x4-5t
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:56:27 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqC6-0005v7-5L
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:56:23 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so3744217wms.4
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pmSPuC8gnR5Hy2+GhaJz2GkLI3SWvrs6j/a3t0pLIQA=;
 b=JHywrll9pbu0cAinSnphaUW1/VcZgQxrz6nr0SRZmY1H0nlVvdow/2BMYwmg8orp2w
 Sb51oOW6kU2NiGkXkIpkZ+FAC3gr+LndB+n67Dy3ebi7BE/5oxy+aBBMaQ0ROfDznUmP
 bTJmVW0a0Z1PNgkSZps8YXZ19LxTzxKD8lEjlwSOKgevVNejxhVGs09Qnlir8hx3WWgp
 dV6zJ5eqXnb0t6h6EcZeNl+jOG8TnWXEmoGL3dAOBJ7FM19Hre3QuL+bQ/CW7KSVr0rs
 wZf0CEAUgmeBNST1WvGUflw/UPswxsfhRpUYQLPZMp2KzrxIre+sA/uMczcUFTx0jAw1
 4yKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pmSPuC8gnR5Hy2+GhaJz2GkLI3SWvrs6j/a3t0pLIQA=;
 b=XqEg6kq6hAUXrLGa5pAR9nkK1+M04lyRXICZmnM0pxCZnVlk5oSdnGpc1XKDUsEMMv
 tQiKW49eiIwObKHMpw+lXckLUhDjvzJM+UDQ4uLFFbv+8HI2zatqJNjP5BVxB0wAquSv
 mTsuTBbnj1bXmDl5QWSouE6xc+mT4nDFxYhLPjvU3tLzM5DOnfmHWhaI7gYp5ToW6kED
 v//1d2kZkUcEy7Ivbrck2Pxx7qHYY2WENyt0/l3O9PJHXLlERewChGNr41bmaFlhwQTo
 1MFBgZPm4p1ZGdYUY8Jn3jxQmv3lI0diPGly5LttKou/opAoloJrO+/8/v7Y8yqi3Wvf
 E1SA==
X-Gm-Message-State: AFqh2kr+hU2y5c8ee/GLLxmTdc4GhTovBCO3XpSuKLupFSAYGQE4TE15
 v4etcSUNhtxEi29FLDeY7FBhUQ==
X-Google-Smtp-Source: AMrXdXsOwW/KrJxkOd10GGHRpWMy3r2pw10+WFqngPZgw3pYUVZvMLdUbCSojfIiGhmioITUpE+3pw==
X-Received: by 2002:a05:600c:4395:b0:3c6:f7ff:6f87 with SMTP id
 e21-20020a05600c439500b003c6f7ff6f87mr3813692wmn.11.1673978180538; 
 Tue, 17 Jan 2023 09:56:20 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a05600c1c8900b003dafbd859a6sm7787979wms.43.2023.01.17.09.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:56:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A353B1FFB7;
 Tue, 17 Jan 2023 17:56:19 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-8-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 07/22] tcg: Introduce get_jmp_target_addr
Date: Tue, 17 Jan 2023 17:51:31 +0000
In-reply-to: <20230109014248.2894281-8-richard.henderson@linaro.org>
Message-ID: <87wn5l2gfw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

> Similar to the existing set_jmp_reset_offset.  Include the
> rw->rx address space conversion done by arm and s390x, and
> forgotten by mips and riscv.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c                  | 9 +++++++++
>  tcg/arm/tcg-target.c.inc   | 2 +-
>  tcg/mips/tcg-target.c.inc  | 2 +-
>  tcg/riscv/tcg-target.c.inc | 2 +-
>  tcg/tci/tcg-target.c.inc   | 2 +-
>  5 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index edd86d6a59..f59f0bfe39 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -322,6 +322,15 @@ static void G_GNUC_UNUSED set_jmp_insn_offset(TCGCon=
text *s, int which)
>      s->tb_jmp_insn_offset[which] =3D tcg_current_code_size(s);
>  }
>=20=20
> +static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int wh=
ich)
> +{
> +    /*
> +     * Return the read-execute version of the pointer, for the benefit
> +     * of any pc-relative addressing mode.
> +     */
> +    return (uintptr_t)tcg_splitwx_to_rx(s->tb_jmp_target_addr +
> which);

You could do &s->tb_jmp_target_addr[which] here which you convert to
later anyway. Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> +}
> +
>  /* Signal overflow, starting over with fewer guest insns. */
>  static G_NORETURN
>  void tcg_raise_tb_overflow(TCGContext *s)
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index 033ff90daa..83b6d77e2e 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -1954,7 +1954,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>              TCGReg base =3D TCG_REG_PC;
>=20=20
>              qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
> -            ptr =3D (intptr_t)tcg_splitwx_to_rx(s->tb_jmp_target_addr + =
args[0]);
> +            ptr =3D get_jmp_target_addr(s, args[0]);
>              dif =3D tcg_pcrel_diff(s, (void *)ptr) - 8;
>              dil =3D sextract32(dif, 0, 12);
>              if (dif !=3D dil) {
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index 02887d7cb1..c30173ab64 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -1989,7 +1989,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          /* indirect jump method */
>          qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
>          tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
> -                   (uintptr_t)(s->tb_jmp_target_addr + a0));
> +                   get_jmp_target_addr(s, a0));
>          tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
>          tcg_out_nop(s);
>          set_jmp_reset_offset(s, a0);
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index b977c8025d..5b2eac6ab8 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1314,7 +1314,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
>          /* indirect jump method */
>          tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
> -                   (uintptr_t)(s->tb_jmp_target_addr + a0));
> +                   get_jmp_target_addr(s, a0));
>          tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, TCG_REG_TMP0, 0);
>          set_jmp_reset_offset(s, a0);
>          break;
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index ad356f1875..59daffc0a0 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -605,7 +605,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>      case INDEX_op_goto_tb:
>          qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
>          /* indirect jump method. */
> -        tcg_out_op_p(s, opc, s->tb_jmp_target_addr + args[0]);
> +        tcg_out_op_p(s, opc, (void *)get_jmp_target_addr(s, args[0]));
>          set_jmp_reset_offset(s, args[0]);
>          break;


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

