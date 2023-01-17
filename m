Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6605066E602
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:31:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqji-0007aK-BE; Tue, 17 Jan 2023 13:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqjg-0007Wr-Qz
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:31:04 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqjf-0007My-27
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:31:04 -0500
Received: by mail-wm1-x32d.google.com with SMTP id j17so4461685wms.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 10:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oiKfTbnXXDJ7cQSJEc7SRERJTcSf3n9IUvj+lsbX6Bo=;
 b=mQFLzt1zcnGNKgJHkxHbxBUZr693JNL6QANYa0/nzLr9VFVwIodq4Efmh1ExdU3nBU
 5LyTuSdzodi+5KNuQd1uf/GZSIqzB5yrZHMVbafrwsodslnaF451xddnRtGLfd0rRNXK
 DKGor6L2XXJFjZ8Y95OF2hLdkVQGOPP9J8cN3WuDw5dh+l65fXDm6k+Q80lMJdOiTXds
 pHtkfnY/KTKigxoPZagK9wRX+aLIc60qrVSQ3w0zZJEbNnNpG/65jOIVBfjxwN87HqGm
 khCy8a+lfWONQvFPNbac/MBhkUVb8tPzTzllMc6eYTFg+1l+RXcNDascz28o0ARZkir7
 5QoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oiKfTbnXXDJ7cQSJEc7SRERJTcSf3n9IUvj+lsbX6Bo=;
 b=G8Y1qjOkFkVA5T+O6fqCxC2aZxIeFYKeqUctBeUclf6mx1q8ABjE4+2Zr26J0bgptk
 YADvxLpyM1dbZUkjROfo1Au68MKbe2NbYhptBo53Kn0z48rIs0cPnxWxh7oCDw15VJ/2
 XLNHCaDVbooS2gBmuLG43D+x3KqTiZNmev2ZC3+3S9B91Td7JzZ16VrYQw9ZIsktrPkz
 6Bp25JAutwoWQ1Fe+y4159T579noRUa9B+V/TRTUOqK6e0rBjyz0+PfXFcQssOTfDF7c
 tDd7eYzwmcSvrAhv0+Ak64LatVgqKkEPJcDPuVyxfAPHgpfdRtk0g01t8AAtcvP5qtFA
 as1Q==
X-Gm-Message-State: AFqh2kqEc0FqJD4WuGq3TkJ4nnNKlZJmwLnq8CgOKcigHMrx+pwKh916
 MEHX3e2Qj/H5ipNhZGqF2lGe6Q==
X-Google-Smtp-Source: AMrXdXuwVptfK+2oBhiP48t1Ez3IJHWNBAry5drVUnXsh/UvJDUokxgC1mpPs/SjcqPPfuvrmEyJ2Q==
X-Received: by 2002:a05:600c:b54:b0:3c6:e60f:3f6f with SMTP id
 k20-20020a05600c0b5400b003c6e60f3f6fmr3970382wmr.38.1673980260172; 
 Tue, 17 Jan 2023 10:31:00 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b003c6bd12ac27sm41957902wmq.37.2023.01.17.10.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:30:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 627871FFB7;
 Tue, 17 Jan 2023 18:30:59 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-18-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 17/22] tcg/ppc: Reorg goto_tb implementation
Date: Tue, 17 Jan 2023 18:30:13 +0000
In-reply-to: <20230109014248.2894281-18-richard.henderson@linaro.org>
Message-ID: <87pmbd109o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

> The old ppc64 implementation replaces 2 or 4 insns, which leaves a race
> condition in which a thread could be stopped at a PC in the middle of
> the sequence, and when restarted does not see the complete address
> computation and branches to nowhere.
>
> The new implemetation replaces only one insn, swapping between
>
> 	b       <dest>
> and
> 	mtctr	r31
>
> falling through to a general-case indirect branch.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
<snip>
>=20=20
>  static void tcg_out_goto_tb(TCGContext *s, int which)
>  {
> -    /* Direct jump. */
> -    if (TCG_TARGET_REG_BITS =3D=3D 64) {
> -        /* Ensure the next insns are 8 or 16-byte aligned. */
> -        while ((uintptr_t)s->code_ptr & (have_isa_2_07 ? 15 : 7)) {
> -            tcg_out32(s, NOP);
> -        }
> +    uintptr_t ptr =3D get_jmp_target_addr(s, which);
> +
> +    if (USE_REG_TB) {
> +        ptrdiff_t offset =3D tcg_tbrel_diff(s, (void *)ptr);
> +        tcg_out_mem_long(s, LD, LDX, TCG_REG_TB, TCG_REG_TB, offset);
> +=20=20=20=20
> +        /* Direct branch will be patched by tb_target_set_jmp_target. */
>          set_jmp_insn_offset(s, which);
> -        tcg_out32(s, ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, 0));
> -        tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, 0));
>          tcg_out32(s, MTSPR | RS(TCG_REG_TB) | CTR);
> +
> +        /* When branch is out of range, fall through to indirect. */
> +        tcg_out32(s, BCCTR | BO_ALWAYS);
> +
> +        /* For the unlinked case, need to reset TCG_REG_TB.  */
> +        set_jmp_reset_offset(s, which);
> +        tcg_out_mem_long(s, ADDI, ADD, TCG_REG_TB, TCG_REG_TB,
> +                         -tcg_current_code_size(s));
> +    } else {
> +        /* Direct branch will be patched by tb_target_set_jmp_target. */
> +        set_jmp_insn_offset(s, which);
> +        tcg_out32(s, NOP);
> +
> +        /* When branch is out of range, fall through to indirect. */
> +        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP1, ptr - (int16_t)ptr);
> +        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_REG_TMP1, (int16_t=
)ptr);
> +        tcg_out32(s, MTSPR | RS(TCG_REG_TMP1) | CTR);
>          tcg_out32(s, BCCTR | BO_ALWAYS);
>          set_jmp_reset_offset(s, which);
> -        if (USE_REG_TB) {
> -            /* For the unlinked case, need to reset TCG_REG_TB.  */
> -            tcg_out_mem_long(s, ADDI, ADD, TCG_REG_TB, TCG_REG_TB,
> -                             -tcg_current_code_size(s));
> -        }
> -    } else {
> -        set_jmp_insn_offset(s, which);
> -        tcg_out32(s, B);
> -        set_jmp_reset_offset(s, which);
>      }
>  }
>=20=20
> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
> +                              uintptr_t jmp_rx, uintptr_t jmp_rw)
> +{
> +    uintptr_t addr =3D tb->jmp_target_addr[n];
> +    intptr_t diff =3D addr - jmp_rx;
> +    tcg_insn_unit insn;
> +
> +    if (in_range_b(diff)) {
> +        insn =3D B | (diff & 0x3fffffc);

Again deposit would be nice here.

> +    } else if (USE_REG_TB) {
> +        insn =3D MTSPR | RS(TCG_REG_TB) | CTR;
> +    } else {
> +        insn =3D NOP;
> +    }
> +
> +    qatomic_set((uint32_t *)jmp_rw, insn);
> +    flush_idcache_range(jmp_rx, jmp_rw, 4);
> +}
> +
>  static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>                         const TCGArg args[TCG_MAX_OP_ARGS],
>                         const int const_args[TCG_MAX_OP_ARGS])

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

