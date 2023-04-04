Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88BE6D676C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:34:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjif9-0004kl-2Z; Tue, 04 Apr 2023 11:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjif7-0004kO-EO
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:33:33 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjif5-0006kB-HE
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:33:32 -0400
Received: by mail-wr1-x432.google.com with SMTP id d17so33240865wrb.11
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 08:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680622410;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=30Xb4MTU0LlwxYPEYNjJgbxv/W9Xn5OKDhMjBDvqHn4=;
 b=tQ4jjBvyLW05DLzWMDnqE7A7XEYc50yMfLoM574J+6A5W+UVGTvfK0Ry+I5DD6jNXq
 8HxcojrxDCa+uBccBd5qf0VigCeXn/OqviAAakmD/4UXKRlJxqXkt5jl0H/SQKkxN1C2
 Es5J0K+oa2UMNr49O71S46PLu5VO/3IUrpXzjD035ov5kaJDVwxfwgOyKhZ1evT7/+SB
 CCwS9iDbYi2/kyPxrrjc4QO2gRGWcBEXGpHcJ/w0dKI1dA0YjrxVPWE3y/eSQNs24GQd
 n82e1hrfCbzgyAbZxHV3LEY2OAN+XQLowQ9yxH9bNijXx2xYLGnesN0JIKLhXIM7dKS0
 XrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680622410;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=30Xb4MTU0LlwxYPEYNjJgbxv/W9Xn5OKDhMjBDvqHn4=;
 b=54Wet4jfyDZZV9iVxtZHloAQ8uWMq0Gwro3GaYo5uvgJpeTyF3KG9LlR0Tesw05xzm
 EJ0ruja5mzgArE/Via3nYqFfnHcUUr748kBNu9xibOqJoOWVGBOFwKvTi/c4SoUA0Ve7
 zmK/7hUERkYNK89y7hWmp4nD/T0i/T4k/8CevKL1lqEM766jRsn2DG6WZxYCQyILmk4F
 DVOHvMzWDVF/GGxMjAlMV/UynqPqXXMMHu+AHMppp7jmcURg+xWbAvbQ6j8kFJJRL3qt
 LIR//B7+IIrfigbm7L+UPTvpFox+zyW9pDJsqWyG+Eu1AladIiijLFeygDoeoLt3R6yp
 U2QQ==
X-Gm-Message-State: AAQBX9cEh50WOJPyQfRkQcS20flLn1zk/RkwXXTw2AkMNxrNuwkoeGER
 y/ehhDjwAFKKFyG5N0ulR1pDpA==
X-Google-Smtp-Source: AKy350Yzfe49FrsH9Z6/OB3y6cRhc5pawFX7sPJxAsFbpa/SuN7vKe9GYPn9ooNnRuhTB2fPANY9MA==
X-Received: by 2002:adf:ed05:0:b0:2c3:dd81:49ad with SMTP id
 a5-20020adfed05000000b002c3dd8149admr2130934wro.33.1680622409707; 
 Tue, 04 Apr 2023 08:33:29 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a5d6812000000b002cde25fba30sm12671041wru.1.2023.04.04.08.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 08:33:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 082A91FFB7;
 Tue,  4 Apr 2023 16:33:29 +0100 (BST)
References: <20230404150435.1571646-1-richard.henderson@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, philmd@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH for-8.0] tcg/sparc64: Disable direct linking for goto_tb
Date: Tue, 04 Apr 2023 16:32:14 +0100
In-reply-to: <20230404150435.1571646-1-richard.henderson@linaro.org>
Message-ID: <87pm8jll13.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

> Something is wrong with this code, and also wrong with gdb on the
> sparc systems to which I have access, so I cannot debug it either.
> Disable for now, so the release is not broken.

Why isn't this a revert then?

>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target.c.inc | 30 ++++--------------------------
>  1 file changed, 4 insertions(+), 26 deletions(-)
>
> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
> index ccc4144f7c..694f2b9dd4 100644
> --- a/tcg/sparc64/tcg-target.c.inc
> +++ b/tcg/sparc64/tcg-target.c.inc
> @@ -1445,12 +1445,12 @@ static void tcg_out_goto_tb(TCGContext *s, int wh=
ich)
>  {
>      ptrdiff_t off =3D tcg_tbrel_diff(s, (void *)get_jmp_target_addr(s, w=
hich));
>=20=20
> -    /* Direct branch will be patched by tb_target_set_jmp_target. */
> +    /* Load link and indirect branch. */
>      set_jmp_insn_offset(s, which);
> -    tcg_out32(s, CALL);
> -    /* delay slot */
> -    tcg_debug_assert(check_fit_ptr(off, 13));
>      tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TB, TCG_REG_TB, off);
> +    tcg_out_arithi(s, TCG_REG_G0, TCG_REG_TB, 0, JMPL);
> +    /* delay slot */
> +    tcg_out_nop(s);
>      set_jmp_reset_offset(s, which);
>=20=20
>      /*
> @@ -1469,28 +1469,6 @@ static void tcg_out_goto_tb(TCGContext *s, int whi=
ch)
>  void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
>                                uintptr_t jmp_rx, uintptr_t jmp_rw)
>  {
> -    uintptr_t addr =3D tb->jmp_target_addr[n];
> -    intptr_t br_disp =3D (intptr_t)(addr - jmp_rx) >> 2;
> -    tcg_insn_unit insn;
> -
> -    br_disp >>=3D 2;
> -    if (check_fit_ptr(br_disp, 19)) {
> -        /* ba,pt %icc, addr */
> -        insn =3D deposit32(INSN_OP(0) | INSN_OP2(1) | INSN_COND(COND_A)
> -                         | BPCC_ICC | BPCC_PT, 0, 19, br_disp);
> -    } else if (check_fit_ptr(br_disp, 22)) {
> -        /* ba addr */
> -        insn =3D deposit32(INSN_OP(0) | INSN_OP2(2) | INSN_COND(COND_A),
> -                         0, 22, br_disp);
> -    } else {
> -        /* The code_gen_buffer can't be larger than 2GB.  */
> -        tcg_debug_assert(check_fit_ptr(br_disp, 30));
> -        /* call addr */
> -        insn =3D deposit32(CALL, 0, 30, br_disp);
> -    }
> -
> -    qatomic_set((uint32_t *)jmp_rw, insn);
> -    flush_idcache_range(jmp_rx, jmp_rw, 4);

So the result it we never patch the jump so return to the main loop
after every block?

In so far this won't break anything else and I suspect you are one of
the last people who actually uses the backend:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

