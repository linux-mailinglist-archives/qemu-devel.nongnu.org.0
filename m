Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2057C66E5C7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:16:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqTz-0004oe-HU; Tue, 17 Jan 2023 13:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqTx-0004o6-G7
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:14:49 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqTv-0003qd-Q1
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:14:49 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso3105561wmq.5
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 10:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mAs1oQgT0UQcSg63W5J+HS9/rjLBow37bmFywFgRrnE=;
 b=k3NeV47e/M8ZhPeq2QCtVS/kQ4WrpiPp9ONZ7CpvZM+Kd38zcYoJYc87zfLD8k5UAD
 uAH3GG+7zoqCDUDBBSfcA2yMtt7zzi0JDHC7HjWWpHzICoq2zF5VFiREMpALuglmlLxB
 2O/rrnS5XuNaAgyDRVZDMnNv6M8qMx8Loqd7bOD0c0KJvkEg7W6BXyFsCyjpuA5SMY9G
 +8KLCRbWhXtVTY05lbmmk8sUSf4rE74LxB9Lo7T4CsmohznEb//PhmZsj4rVM4kjvqNe
 L+ZKn2Hs1DyHfFvAjYkNSO3Td+mh/EBLCXKmEITl7KKHJ+oEbuuSggzPFdpGRzHBW7+4
 OTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mAs1oQgT0UQcSg63W5J+HS9/rjLBow37bmFywFgRrnE=;
 b=yz+mg+FDiH56n/gJC6EdR7679roS7P9F91YqwaOQ7KNksrOviPBHkoApIZIkwgNfzF
 opTGgpVKDanoLY/aij98ayQI/SXvzipmgYMlL6ypSSrFPgayEBqmjsJEnNwpznb7snGs
 aQ4sjdrPSXnR2m2M2gwR6Ed23BMiTOfsHW+OSi6t+R4hteYiJc/ADxPhWnM91K7XtKDu
 7uL+uFcwbDa1wv1KtkDf1WTzkTW+tS1sdOML0HsREeW9AVPjqS2XETbZmTqjBf3teq++
 wlpiOrlHiKdDJwqPXM7iIEwqNnjbXM8p+WRLN2PGKIZncTaNL7UXVhrQMI/gseRbzy1q
 YLhw==
X-Gm-Message-State: AFqh2ko6M529B2Ysb3byZEQ+/88knbA31rj9knbV8afKEoqBLSf6L80S
 K5OU/EbII55kg8AHv06eTMoG9g==
X-Google-Smtp-Source: AMrXdXtmM0fSxlz8wdbnUwy1GMJFhUgmRgMEvWb8cd27/KQBS9v3i3jTMWZq1okBdheopbPKeNXB4g==
X-Received: by 2002:a05:600c:3555:b0:3da:f4d4:4c2 with SMTP id
 i21-20020a05600c355500b003daf4d404c2mr3873857wmq.37.1673979286026; 
 Tue, 17 Jan 2023 10:14:46 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w5-20020adfcd05000000b002bdc914a139sm19346055wrm.108.2023.01.17.10.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:14:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2CB9A1FFB7;
 Tue, 17 Jan 2023 18:14:45 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-15-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 14/22] tcg: Always define tb_target_set_jmp_target
Date: Tue, 17 Jan 2023 18:14:08 +0000
In-reply-to: <20230109014248.2894281-15-richard.henderson@linaro.org>
Message-ID: <8735892fl6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

> Install empty versions for !TCG_TARGET_HAS_direct_jump hosts.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc   | 6 ++++++
>  tcg/mips/tcg-target.c.inc  | 6 ++++++
>  tcg/riscv/tcg-target.c.inc | 6 ++++++
>  tcg/tci/tcg-target.c.inc   | 6 ++++++
>  4 files changed, 24 insertions(+)
>
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index b8f3b0c634..b21dd561fa 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -1964,6 +1964,12 @@ static void tcg_out_goto_tb(TCGContext *s, int whi=
ch)
>      set_jmp_reset_offset(s, which);
>  }
>=20=20
> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
> +                              uintptr_t jmp_rx, uintptr_t jmp_rw)
> +{
> +    /* Always indirect, nothing to do */

Should we assert and then remove when we fill in because some targets
never gain this ability.

> +}
> +
>  static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>                         const TCGArg args[TCG_MAX_OP_ARGS],
>                         const int const_args[TCG_MAX_OP_ARGS])
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index e54df4128b..0b5e100cb1 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -1977,6 +1977,12 @@ static void tcg_out_goto_tb(TCGContext *s, int whi=
ch)
>      set_jmp_reset_offset(s, which);
>  }
>=20=20
> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
> +                              uintptr_t jmp_rx, uintptr_t jmp_rw)
> +{
> +    /* Always indirect, nothing to do */
> +}
> +
>  static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>                         const TCGArg args[TCG_MAX_OP_ARGS],
>                         const int const_args[TCG_MAX_OP_ARGS])
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index ee6759f787..e6a3915859 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1310,6 +1310,12 @@ static void tcg_out_goto_tb(TCGContext *s, int whi=
ch)
>      set_jmp_reset_offset(s, which);
>  }
>=20=20
> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
> +                              uintptr_t jmp_rx, uintptr_t jmp_rw)
> +{
> +    /* Always indirect, nothing to do */
> +}
> +
>  static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>                         const TCGArg args[TCG_MAX_OP_ARGS],
>                         const int const_args[TCG_MAX_OP_ARGS])
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index f2ac356900..54779d86d9 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -603,6 +603,12 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
>      set_jmp_reset_offset(s, which);
>  }
>=20=20
> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
> +                              uintptr_t jmp_rx, uintptr_t jmp_rw)
> +{
> +    /* Always indirect, nothing to do */
> +}
> +
>  static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>                         const TCGArg args[TCG_MAX_OP_ARGS],
>                         const int const_args[TCG_MAX_OP_ARGS])


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

