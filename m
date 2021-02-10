Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB8D31644D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:51:21 +0100 (CET)
Received: from localhost ([::1]:38162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9n5c-0005Cz-Jh
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:51:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9n3H-00049L-ED
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 05:48:55 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9n3D-0002NV-6q
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 05:48:55 -0500
Received: by mail-wm1-x336.google.com with SMTP id i9so1430138wmq.1
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 02:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=NiBfM+U34oF3bgOMD7amn8+my/KQguNh21/jqJurgTM=;
 b=Jx1jTAugxJZ5wfOHESO3r8g0O7DuUcMa96wtBx9MeA40/81Tll7UzDhOhHV0LRclf6
 7glkNprOD1koDJUOY6Ocmt9Y/QaCsPCh0AoMqJ6BcGL+514GtFY3kx+lmhwKYxXdv5gq
 VtjdcKBKz4Sj/adeRaUKlojtpGIHcK/R0ormHsSaXGePA9zFuVctY7XWzuXLLfgMGqYJ
 ADGqGGgYZ0cmwbQT2Q7Cy0liteSXkqvfO4uU2YWq6zHl8T/UoOWHFlziVBPOnfnWBc5w
 aHMuruuktA44HR2g7SnQo6R35yG+6dVNpQixmJ2pA5Xdt7asUZGCBH0hBVAZjLmI/vOo
 bL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=NiBfM+U34oF3bgOMD7amn8+my/KQguNh21/jqJurgTM=;
 b=p4qoIeMo83rZRukSDBikr+Xi0DxQPIapWOz4aagV5R2N+EI4L6ggzv4uWi0NRoGZeU
 mFZ/ecBHG+Y21DTLQukJxr29kQjPPRZMLUGou37M8yqPzzhqwluQZeODtVFrKNqgPlr7
 KMWZikVByv0gjBzx+NNOkEfhWCemeTr3NFLdaJRdH/UsxF5/I3Xc/TyUsDc5PtJNmHIK
 IvrFV6Tn+BG/eYjZFQ8ux0RSKOwAsiYRuTBHyOyW6SFIwnWMxpObe7NMc+ss0MPL7qLs
 qHtM/ITTWqbww1NHWJdhHDBWc2Uly3JLjyAZ5UPN9ZgRktiSCoJGOO2lgC9mhtya5ycN
 bINw==
X-Gm-Message-State: AOAM533Zmr8S9Kl9Notx4LseuTLf5hrgvx9RFebHfoGLLwhr3ax3yu0T
 wUk1oqkj7V+wvlWiazJ/wZwH2g==
X-Google-Smtp-Source: ABdhPJzidFrQhIPtqEm0dU/X/8qPkGbbV67RXuOaH7CUnPL/5oyI27lSbC9EAi94W/1qsKjrEEgARA==
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr2386947wmo.98.1612954127546; 
 Wed, 10 Feb 2021 02:48:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u206sm2001540wme.12.2021.02.10.02.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 02:48:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 935361FF7E;
 Wed, 10 Feb 2021 10:48:44 +0000 (GMT)
References: <20210114021654.647242-1-richard.henderson@linaro.org>
 <20210114021654.647242-15-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL 14/24] tcg: Use tcg_constant_{i32,i64} with tcg int
 expanders
Date: Wed, 10 Feb 2021 10:38:12 +0000
In-reply-to: <20210114021654.647242-15-richard.henderson@linaro.org>
Message-ID: <87o8gs8agj.fsf@linaro.org>
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
Cc: peter.maydell@linaro.org, cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Hi Richard,

I've just tracked this commit down to breaking the plugin inline support
(qemu_plugin_register_vcpu_insn_exec_inline). It wasn't picked up by CI
because inline isn't the default (normal callbacks are). I was just
adding inline support into check-tcg to workaround the rep issue for x86
and ran into the following:

  ./qemu-i386 -plugin tests/plugin/libinsn.so,arg=3Dinline -d plugin sha1

Gives:

  Thread 1 "qemu-i386" received signal SIGSEGV, Segmentation fault.
  0x000055555565bbad in test_bit (addr=3D<optimized out>, nr=3D<optimized o=
ut>) at /home/alex.bennee/lsrc/qemu.git/include/qemu/bitops.h:135
  135         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
  (gdb) bt
  #0  0x000055555565bbad in test_bit (addr=3D<optimized out>, nr=3D<optimiz=
ed out>) at /home/alex.bennee/lsrc/qemu.git/include/qemu/bitops.h:135
  #1  init_ts_info (temps_used=3Dtemps_used@entry=3D0x7fffffffd9b0, ts=3D0x=
7ffff4521018 <insn_count>) at ../../tcg/optimize.c:97
  #2  0x000055555565bde0 in init_arg_info (arg=3D<optimized out>, temps_use=
d=3D0x7fffffffd9b0) at ../../tcg/optimize.c:126
  #3  tcg_optimize (s=3Ds@entry=3D0x555555bd48c0 <tcg_init_ctx>) at ../../t=
cg/optimize.c:641
  #4  0x000055555562e729 in tcg_gen_code (s=3D0x555555bd48c0 <tcg_init_ctx>=
, tb=3Dtb@entry=3D0x7fffe8000040 <code_gen_buffer+19>) at ../../tcg/tcg.c:4=
401
  #5  0x0000555555691e5b in tb_gen_code (cpu=3Dcpu@entry=3D0x555555c46c00, =
pc=3Dpc@entry=3D134519520, cs_base=3Dcs_base@entry=3D0, flags=3Dflags@entry=
=3D4194483, cflags=3D-16777216, cflags@entry=3D0) at ../../accel/tcg/transl=
ate-all.c:1952
  #6  0x000055555565ed72 in tb_find (cf_mask=3D0, tb_exit=3D0, last_tb=3D0x=
0, cpu=3D0x555555c46c00) at ../../accel/tcg/cpu-exec.c:454
  #7  cpu_exec (cpu=3Dcpu@entry=3D0x555555c46c00) at ../../accel/tcg/cpu-ex=
ec.c:810
  #8  0x00005555555db848 in cpu_loop (env=3D0x555555c4eef0) at ../../linux-=
user/i386/cpu_loop.c:207
  #9  0x00005555555d28da in main (argc=3D<optimized out>, argv=3D<optimized=
 out>, envp=3D<optimized out>) at ../../linux-user/main.c:859
  (gdb)


> ---
>  include/tcg/tcg-op.h |  13 +--
>  tcg/tcg-op.c         | 227 ++++++++++++++++++++-----------------------
>  2 files changed, 109 insertions(+), 131 deletions(-)
>
> diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
> index 901b19f32a..ed8de045e2 100644
> --- a/include/tcg/tcg-op.h
> +++ b/include/tcg/tcg-op.h
> @@ -271,6 +271,7 @@ void tcg_gen_mb(TCGBar);
>=20=20
>  /* 32 bit ops */
>=20=20
> +void tcg_gen_movi_i32(TCGv_i32 ret, int32_t arg);
>  void tcg_gen_addi_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2);
>  void tcg_gen_subfi_i32(TCGv_i32 ret, int32_t arg1, TCGv_i32 arg2);
>  void tcg_gen_subi_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2);
> @@ -349,11 +350,6 @@ static inline void tcg_gen_mov_i32(TCGv_i32 ret, TCG=
v_i32 arg)
>      }
>  }
>=20=20
> -static inline void tcg_gen_movi_i32(TCGv_i32 ret, int32_t arg)
> -{
> -    tcg_gen_op2i_i32(INDEX_op_movi_i32, ret, arg);
> -}
> -
>  static inline void tcg_gen_ld8u_i32(TCGv_i32 ret, TCGv_ptr arg2,
>                                      tcg_target_long offset)
>  {
> @@ -467,6 +463,7 @@ static inline void tcg_gen_not_i32(TCGv_i32 ret, TCGv=
_i32 arg)
>=20=20
>  /* 64 bit ops */
>=20=20
> +void tcg_gen_movi_i64(TCGv_i64 ret, int64_t arg);
>  void tcg_gen_addi_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2);
>  void tcg_gen_subfi_i64(TCGv_i64 ret, int64_t arg1, TCGv_i64 arg2);
>  void tcg_gen_subi_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2);
> @@ -550,11 +547,6 @@ static inline void tcg_gen_mov_i64(TCGv_i64 ret, TCG=
v_i64 arg)
>      }
>  }
>=20=20
> -static inline void tcg_gen_movi_i64(TCGv_i64 ret, int64_t arg)
> -{
> -    tcg_gen_op2i_i64(INDEX_op_movi_i64, ret, arg);
> -}
> -
>  static inline void tcg_gen_ld8u_i64(TCGv_i64 ret, TCGv_ptr arg2,
>                                      tcg_target_long offset)
>  {
> @@ -698,7 +690,6 @@ static inline void tcg_gen_sub_i64(TCGv_i64 ret, TCGv=
_i64 arg1, TCGv_i64 arg2)
>=20=20
>  void tcg_gen_discard_i64(TCGv_i64 arg);
>  void tcg_gen_mov_i64(TCGv_i64 ret, TCGv_i64 arg);
> -void tcg_gen_movi_i64(TCGv_i64 ret, int64_t arg);
>  void tcg_gen_ld8u_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offse=
t);
>  void tcg_gen_ld8s_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offse=
t);
>  void tcg_gen_ld16u_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offs=
et);
> diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
> index 0374b5d56d..70475773f4 100644
> --- a/tcg/tcg-op.c
> +++ b/tcg/tcg-op.c
> @@ -104,15 +104,18 @@ void tcg_gen_mb(TCGBar mb_type)
>=20=20
>  /* 32 bit ops */
>=20=20
> +void tcg_gen_movi_i32(TCGv_i32 ret, int32_t arg)
> +{
> +    tcg_gen_mov_i32(ret, tcg_constant_i32(arg));
> +}
> +
>  void tcg_gen_addi_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
>  {
>      /* some cases can be optimized here */
>      if (arg2 =3D=3D 0) {
>          tcg_gen_mov_i32(ret, arg1);
>      } else {
> -        TCGv_i32 t0 =3D tcg_const_i32(arg2);
> -        tcg_gen_add_i32(ret, arg1, t0);
> -        tcg_temp_free_i32(t0);
> +        tcg_gen_add_i32(ret, arg1, tcg_constant_i32(arg2));
>      }
>  }
>=20=20
> @@ -122,9 +125,7 @@ void tcg_gen_subfi_i32(TCGv_i32 ret, int32_t arg1, TC=
Gv_i32 arg2)
>          /* Don't recurse with tcg_gen_neg_i32.  */
>          tcg_gen_op2_i32(INDEX_op_neg_i32, ret, arg2);
>      } else {
> -        TCGv_i32 t0 =3D tcg_const_i32(arg1);
> -        tcg_gen_sub_i32(ret, t0, arg2);
> -        tcg_temp_free_i32(t0);
> +        tcg_gen_sub_i32(ret, tcg_constant_i32(arg1), arg2);
>      }
>  }
>=20=20
> @@ -134,15 +135,12 @@ void tcg_gen_subi_i32(TCGv_i32 ret, TCGv_i32 arg1, =
int32_t arg2)
>      if (arg2 =3D=3D 0) {
>          tcg_gen_mov_i32(ret, arg1);
>      } else {
> -        TCGv_i32 t0 =3D tcg_const_i32(arg2);
> -        tcg_gen_sub_i32(ret, arg1, t0);
> -        tcg_temp_free_i32(t0);
> +        tcg_gen_sub_i32(ret, arg1, tcg_constant_i32(arg2));
>      }
>  }
>=20=20
>  void tcg_gen_andi_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
>  {
> -    TCGv_i32 t0;
>      /* Some cases can be optimized here.  */
>      switch (arg2) {
>      case 0:
> @@ -165,9 +163,8 @@ void tcg_gen_andi_i32(TCGv_i32 ret, TCGv_i32 arg1, in=
t32_t arg2)
>          }
>          break;
>      }
> -    t0 =3D tcg_const_i32(arg2);
> -    tcg_gen_and_i32(ret, arg1, t0);
> -    tcg_temp_free_i32(t0);
> +
> +    tcg_gen_and_i32(ret, arg1, tcg_constant_i32(arg2));
>  }
>=20=20
>  void tcg_gen_ori_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
> @@ -178,9 +175,7 @@ void tcg_gen_ori_i32(TCGv_i32 ret, TCGv_i32 arg1, int=
32_t arg2)
>      } else if (arg2 =3D=3D 0) {
>          tcg_gen_mov_i32(ret, arg1);
>      } else {
> -        TCGv_i32 t0 =3D tcg_const_i32(arg2);
> -        tcg_gen_or_i32(ret, arg1, t0);
> -        tcg_temp_free_i32(t0);
> +        tcg_gen_or_i32(ret, arg1, tcg_constant_i32(arg2));
>      }
>  }
>=20=20
> @@ -193,9 +188,7 @@ void tcg_gen_xori_i32(TCGv_i32 ret, TCGv_i32 arg1, in=
t32_t arg2)
>          /* Don't recurse with tcg_gen_not_i32.  */
>          tcg_gen_op2_i32(INDEX_op_not_i32, ret, arg1);
>      } else {
> -        TCGv_i32 t0 =3D tcg_const_i32(arg2);
> -        tcg_gen_xor_i32(ret, arg1, t0);
> -        tcg_temp_free_i32(t0);
> +        tcg_gen_xor_i32(ret, arg1, tcg_constant_i32(arg2));
>      }
>  }
>=20=20
> @@ -205,9 +198,7 @@ void tcg_gen_shli_i32(TCGv_i32 ret, TCGv_i32 arg1, in=
t32_t arg2)
>      if (arg2 =3D=3D 0) {
>          tcg_gen_mov_i32(ret, arg1);
>      } else {
> -        TCGv_i32 t0 =3D tcg_const_i32(arg2);
> -        tcg_gen_shl_i32(ret, arg1, t0);
> -        tcg_temp_free_i32(t0);
> +        tcg_gen_shl_i32(ret, arg1, tcg_constant_i32(arg2));
>      }
>  }
>=20=20
> @@ -217,9 +208,7 @@ void tcg_gen_shri_i32(TCGv_i32 ret, TCGv_i32 arg1, in=
t32_t arg2)
>      if (arg2 =3D=3D 0) {
>          tcg_gen_mov_i32(ret, arg1);
>      } else {
> -        TCGv_i32 t0 =3D tcg_const_i32(arg2);
> -        tcg_gen_shr_i32(ret, arg1, t0);
> -        tcg_temp_free_i32(t0);
> +        tcg_gen_shr_i32(ret, arg1, tcg_constant_i32(arg2));
>      }
>  }
>=20=20
> @@ -229,9 +218,7 @@ void tcg_gen_sari_i32(TCGv_i32 ret, TCGv_i32 arg1, in=
t32_t arg2)
>      if (arg2 =3D=3D 0) {
>          tcg_gen_mov_i32(ret, arg1);
>      } else {
> -        TCGv_i32 t0 =3D tcg_const_i32(arg2);
> -        tcg_gen_sar_i32(ret, arg1, t0);
> -        tcg_temp_free_i32(t0);
> +        tcg_gen_sar_i32(ret, arg1, tcg_constant_i32(arg2));
>      }
>  }
>=20=20
> @@ -250,9 +237,7 @@ void tcg_gen_brcondi_i32(TCGCond cond, TCGv_i32 arg1,=
 int32_t arg2, TCGLabel *l)
>      if (cond =3D=3D TCG_COND_ALWAYS) {
>          tcg_gen_br(l);
>      } else if (cond !=3D TCG_COND_NEVER) {
> -        TCGv_i32 t0 =3D tcg_const_i32(arg2);
> -        tcg_gen_brcond_i32(cond, arg1, t0, l);
> -        tcg_temp_free_i32(t0);
> +        tcg_gen_brcond_i32(cond, arg1, tcg_constant_i32(arg2), l);
>      }
>  }
>=20=20
> @@ -271,9 +256,7 @@ void tcg_gen_setcond_i32(TCGCond cond, TCGv_i32 ret,
>  void tcg_gen_setcondi_i32(TCGCond cond, TCGv_i32 ret,
>                            TCGv_i32 arg1, int32_t arg2)
>  {
> -    TCGv_i32 t0 =3D tcg_const_i32(arg2);
> -    tcg_gen_setcond_i32(cond, ret, arg1, t0);
> -    tcg_temp_free_i32(t0);
> +    tcg_gen_setcond_i32(cond, ret, arg1, tcg_constant_i32(arg2));
>  }
>=20=20
>  void tcg_gen_muli_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
> @@ -283,9 +266,7 @@ void tcg_gen_muli_i32(TCGv_i32 ret, TCGv_i32 arg1, in=
t32_t arg2)
>      } else if (is_power_of_2(arg2)) {
>          tcg_gen_shli_i32(ret, arg1, ctz32(arg2));
>      } else {
> -        TCGv_i32 t0 =3D tcg_const_i32(arg2);
> -        tcg_gen_mul_i32(ret, arg1, t0);
> -        tcg_temp_free_i32(t0);
> +        tcg_gen_mul_i32(ret, arg1, tcg_constant_i32(arg2));
>      }
>  }
>=20=20
> @@ -433,9 +414,7 @@ void tcg_gen_clz_i32(TCGv_i32 ret, TCGv_i32 arg1, TCG=
v_i32 arg2)
>=20=20
>  void tcg_gen_clzi_i32(TCGv_i32 ret, TCGv_i32 arg1, uint32_t arg2)
>  {
> -    TCGv_i32 t =3D tcg_const_i32(arg2);
> -    tcg_gen_clz_i32(ret, arg1, t);
> -    tcg_temp_free_i32(t);
> +    tcg_gen_clz_i32(ret, arg1, tcg_constant_i32(arg2));
>  }
>=20=20
>  void tcg_gen_ctz_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
> @@ -468,10 +447,9 @@ void tcg_gen_ctz_i32(TCGv_i32 ret, TCGv_i32 arg1, TC=
Gv_i32 arg2)
>              tcg_gen_clzi_i32(t, t, 32);
>              tcg_gen_xori_i32(t, t, 31);
>          }
> -        z =3D tcg_const_i32(0);
> +        z =3D tcg_constant_i32(0);
>          tcg_gen_movcond_i32(TCG_COND_EQ, ret, arg1, z, arg2, t);
>          tcg_temp_free_i32(t);
> -        tcg_temp_free_i32(z);
>      } else {
>          gen_helper_ctz_i32(ret, arg1, arg2);
>      }
> @@ -487,9 +465,7 @@ void tcg_gen_ctzi_i32(TCGv_i32 ret, TCGv_i32 arg1, ui=
nt32_t arg2)
>          tcg_gen_ctpop_i32(ret, t);
>          tcg_temp_free_i32(t);
>      } else {
> -        TCGv_i32 t =3D tcg_const_i32(arg2);
> -        tcg_gen_ctz_i32(ret, arg1, t);
> -        tcg_temp_free_i32(t);
> +        tcg_gen_ctz_i32(ret, arg1, tcg_constant_i32(arg2));
>      }
>  }
>=20=20
> @@ -547,9 +523,7 @@ void tcg_gen_rotli_i32(TCGv_i32 ret, TCGv_i32 arg1, i=
nt32_t arg2)
>      if (arg2 =3D=3D 0) {
>          tcg_gen_mov_i32(ret, arg1);
>      } else if (TCG_TARGET_HAS_rot_i32) {
> -        TCGv_i32 t0 =3D tcg_const_i32(arg2);
> -        tcg_gen_rotl_i32(ret, arg1, t0);
> -        tcg_temp_free_i32(t0);
> +        tcg_gen_rotl_i32(ret, arg1, tcg_constant_i32(arg2));
>      } else {
>          TCGv_i32 t0, t1;
>          t0 =3D tcg_temp_new_i32();
> @@ -653,9 +627,8 @@ void tcg_gen_deposit_z_i32(TCGv_i32 ret, TCGv_i32 arg,
>          tcg_gen_andi_i32(ret, arg, (1u << len) - 1);
>      } else if (TCG_TARGET_HAS_deposit_i32
>                 && TCG_TARGET_deposit_i32_valid(ofs, len)) {
> -        TCGv_i32 zero =3D tcg_const_i32(0);
> +        TCGv_i32 zero =3D tcg_constant_i32(0);
>          tcg_gen_op5ii_i32(INDEX_op_deposit_i32, ret, zero, arg, ofs, len=
);
> -        tcg_temp_free_i32(zero);
>      } else {
>          /* To help two-operand hosts we prefer to zero-extend first,
>             which allows ARG to stay live.  */
> @@ -1052,7 +1025,7 @@ void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg)
>      } else {
>          TCGv_i32 t0 =3D tcg_temp_new_i32();
>          TCGv_i32 t1 =3D tcg_temp_new_i32();
> -        TCGv_i32 t2 =3D tcg_const_i32(0x00ff00ff);
> +        TCGv_i32 t2 =3D tcg_constant_i32(0x00ff00ff);
>=20=20
>                                          /* arg =3D abcd */
>          tcg_gen_shri_i32(t0, arg, 8);   /*  t0 =3D .abc */
> @@ -1067,7 +1040,6 @@ void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg)
>=20=20
>          tcg_temp_free_i32(t0);
>          tcg_temp_free_i32(t1);
> -        tcg_temp_free_i32(t2);
>      }
>  }
>=20=20
> @@ -1114,8 +1086,15 @@ void tcg_gen_discard_i64(TCGv_i64 arg)
>=20=20
>  void tcg_gen_mov_i64(TCGv_i64 ret, TCGv_i64 arg)
>  {
> -    tcg_gen_mov_i32(TCGV_LOW(ret), TCGV_LOW(arg));
> -    tcg_gen_mov_i32(TCGV_HIGH(ret), TCGV_HIGH(arg));
> +    TCGTemp *ts =3D tcgv_i64_temp(arg);
> +
> +    /* Canonicalize TCGv_i64 TEMP_CONST into TCGv_i32 TEMP_CONST. */
> +    if (ts->kind =3D=3D TEMP_CONST) {
> +        tcg_gen_movi_i64(ret, ts->val);
> +    } else {
> +        tcg_gen_mov_i32(TCGV_LOW(ret), TCGV_LOW(arg));
> +        tcg_gen_mov_i32(TCGV_HIGH(ret), TCGV_HIGH(arg));
> +    }
>  }
>=20=20
>  void tcg_gen_movi_i64(TCGv_i64 ret, int64_t arg)
> @@ -1237,6 +1216,14 @@ void tcg_gen_mul_i64(TCGv_i64 ret, TCGv_i64 arg1, =
TCGv_i64 arg2)
>      tcg_temp_free_i64(t0);
>      tcg_temp_free_i32(t1);
>  }
> +
> +#else
> +
> +void tcg_gen_movi_i64(TCGv_i64 ret, int64_t arg)
> +{
> +    tcg_gen_mov_i64(ret, tcg_constant_i64(arg));
> +}
> +
>  #endif /* TCG_TARGET_REG_SIZE =3D=3D 32 */
>=20=20
>  void tcg_gen_addi_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
> @@ -1244,10 +1231,12 @@ void tcg_gen_addi_i64(TCGv_i64 ret, TCGv_i64 arg1=
, int64_t arg2)
>      /* some cases can be optimized here */
>      if (arg2 =3D=3D 0) {
>          tcg_gen_mov_i64(ret, arg1);
> +    } else if (TCG_TARGET_REG_BITS =3D=3D 64) {
> +        tcg_gen_add_i64(ret, arg1, tcg_constant_i64(arg2));
>      } else {
> -        TCGv_i64 t0 =3D tcg_const_i64(arg2);
> -        tcg_gen_add_i64(ret, arg1, t0);
> -        tcg_temp_free_i64(t0);
> +        tcg_gen_add2_i32(TCGV_LOW(ret), TCGV_HIGH(ret),
> +                         TCGV_LOW(arg1), TCGV_HIGH(arg1),
> +                         tcg_constant_i32(arg2), tcg_constant_i32(arg2 >=
> 32));
>      }
>  }
>=20=20
> @@ -1256,10 +1245,12 @@ void tcg_gen_subfi_i64(TCGv_i64 ret, int64_t arg1=
, TCGv_i64 arg2)
>      if (arg1 =3D=3D 0 && TCG_TARGET_HAS_neg_i64) {
>          /* Don't recurse with tcg_gen_neg_i64.  */
>          tcg_gen_op2_i64(INDEX_op_neg_i64, ret, arg2);
> +    } else if (TCG_TARGET_REG_BITS =3D=3D 64) {
> +        tcg_gen_sub_i64(ret, tcg_constant_i64(arg1), arg2);
>      } else {
> -        TCGv_i64 t0 =3D tcg_const_i64(arg1);
> -        tcg_gen_sub_i64(ret, t0, arg2);
> -        tcg_temp_free_i64(t0);
> +        tcg_gen_sub2_i32(TCGV_LOW(ret), TCGV_HIGH(ret),
> +                         tcg_constant_i32(arg1), tcg_constant_i32(arg1 >=
> 32),
> +                         TCGV_LOW(arg2), TCGV_HIGH(arg2));
>      }
>  }
>=20=20
> @@ -1268,17 +1259,17 @@ void tcg_gen_subi_i64(TCGv_i64 ret, TCGv_i64 arg1=
, int64_t arg2)
>      /* some cases can be optimized here */
>      if (arg2 =3D=3D 0) {
>          tcg_gen_mov_i64(ret, arg1);
> +    } else if (TCG_TARGET_REG_BITS =3D=3D 64) {
> +        tcg_gen_sub_i64(ret, arg1, tcg_constant_i64(arg2));
>      } else {
> -        TCGv_i64 t0 =3D tcg_const_i64(arg2);
> -        tcg_gen_sub_i64(ret, arg1, t0);
> -        tcg_temp_free_i64(t0);
> +        tcg_gen_sub2_i32(TCGV_LOW(ret), TCGV_HIGH(ret),
> +                         TCGV_LOW(arg1), TCGV_HIGH(arg1),
> +                         tcg_constant_i32(arg2), tcg_constant_i32(arg2 >=
> 32));
>      }
>  }
>=20=20
>  void tcg_gen_andi_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
>  {
> -    TCGv_i64 t0;
> -
>      if (TCG_TARGET_REG_BITS =3D=3D 32) {
>          tcg_gen_andi_i32(TCGV_LOW(ret), TCGV_LOW(arg1), arg2);
>          tcg_gen_andi_i32(TCGV_HIGH(ret), TCGV_HIGH(arg1), arg2 >> 32);
> @@ -1313,9 +1304,8 @@ void tcg_gen_andi_i64(TCGv_i64 ret, TCGv_i64 arg1, =
int64_t arg2)
>          }
>          break;
>      }
> -    t0 =3D tcg_const_i64(arg2);
> -    tcg_gen_and_i64(ret, arg1, t0);
> -    tcg_temp_free_i64(t0);
> +
> +    tcg_gen_and_i64(ret, arg1, tcg_constant_i64(arg2));
>  }
>=20=20
>  void tcg_gen_ori_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
> @@ -1331,9 +1321,7 @@ void tcg_gen_ori_i64(TCGv_i64 ret, TCGv_i64 arg1, i=
nt64_t arg2)
>      } else if (arg2 =3D=3D 0) {
>          tcg_gen_mov_i64(ret, arg1);
>      } else {
> -        TCGv_i64 t0 =3D tcg_const_i64(arg2);
> -        tcg_gen_or_i64(ret, arg1, t0);
> -        tcg_temp_free_i64(t0);
> +        tcg_gen_or_i64(ret, arg1, tcg_constant_i64(arg2));
>      }
>  }
>=20=20
> @@ -1351,9 +1339,7 @@ void tcg_gen_xori_i64(TCGv_i64 ret, TCGv_i64 arg1, =
int64_t arg2)
>          /* Don't recurse with tcg_gen_not_i64.  */
>          tcg_gen_op2_i64(INDEX_op_not_i64, ret, arg1);
>      } else {
> -        TCGv_i64 t0 =3D tcg_const_i64(arg2);
> -        tcg_gen_xor_i64(ret, arg1, t0);
> -        tcg_temp_free_i64(t0);
> +        tcg_gen_xor_i64(ret, arg1, tcg_constant_i64(arg2));
>      }
>  }
>=20=20
> @@ -1415,9 +1401,7 @@ void tcg_gen_shli_i64(TCGv_i64 ret, TCGv_i64 arg1, =
int64_t arg2)
>      } else if (arg2 =3D=3D 0) {
>          tcg_gen_mov_i64(ret, arg1);
>      } else {
> -        TCGv_i64 t0 =3D tcg_const_i64(arg2);
> -        tcg_gen_shl_i64(ret, arg1, t0);
> -        tcg_temp_free_i64(t0);
> +        tcg_gen_shl_i64(ret, arg1, tcg_constant_i64(arg2));
>      }
>  }
>=20=20
> @@ -1429,9 +1413,7 @@ void tcg_gen_shri_i64(TCGv_i64 ret, TCGv_i64 arg1, =
int64_t arg2)
>      } else if (arg2 =3D=3D 0) {
>          tcg_gen_mov_i64(ret, arg1);
>      } else {
> -        TCGv_i64 t0 =3D tcg_const_i64(arg2);
> -        tcg_gen_shr_i64(ret, arg1, t0);
> -        tcg_temp_free_i64(t0);
> +        tcg_gen_shr_i64(ret, arg1, tcg_constant_i64(arg2));
>      }
>  }
>=20=20
> @@ -1443,9 +1425,7 @@ void tcg_gen_sari_i64(TCGv_i64 ret, TCGv_i64 arg1, =
int64_t arg2)
>      } else if (arg2 =3D=3D 0) {
>          tcg_gen_mov_i64(ret, arg1);
>      } else {
> -        TCGv_i64 t0 =3D tcg_const_i64(arg2);
> -        tcg_gen_sar_i64(ret, arg1, t0);
> -        tcg_temp_free_i64(t0);
> +        tcg_gen_sar_i64(ret, arg1, tcg_constant_i64(arg2));
>      }
>  }
>=20=20
> @@ -1468,12 +1448,17 @@ void tcg_gen_brcond_i64(TCGCond cond, TCGv_i64 ar=
g1, TCGv_i64 arg2, TCGLabel *l)
>=20=20
>  void tcg_gen_brcondi_i64(TCGCond cond, TCGv_i64 arg1, int64_t arg2, TCGL=
abel *l)
>  {
> -    if (cond =3D=3D TCG_COND_ALWAYS) {
> +    if (TCG_TARGET_REG_BITS =3D=3D 64) {
> +        tcg_gen_brcond_i64(cond, arg1, tcg_constant_i64(arg2), l);
> +    } else if (cond =3D=3D TCG_COND_ALWAYS) {
>          tcg_gen_br(l);
>      } else if (cond !=3D TCG_COND_NEVER) {
> -        TCGv_i64 t0 =3D tcg_const_i64(arg2);
> -        tcg_gen_brcond_i64(cond, arg1, t0, l);
> -        tcg_temp_free_i64(t0);
> +        l->refs++;
> +        tcg_gen_op6ii_i32(INDEX_op_brcond2_i32,
> +                          TCGV_LOW(arg1), TCGV_HIGH(arg1),
> +                          tcg_constant_i32(arg2),
> +                          tcg_constant_i32(arg2 >> 32),
> +                          cond, label_arg(l));
>      }
>  }
>=20=20
> @@ -1499,9 +1484,19 @@ void tcg_gen_setcond_i64(TCGCond cond, TCGv_i64 re=
t,
>  void tcg_gen_setcondi_i64(TCGCond cond, TCGv_i64 ret,
>                            TCGv_i64 arg1, int64_t arg2)
>  {
> -    TCGv_i64 t0 =3D tcg_const_i64(arg2);
> -    tcg_gen_setcond_i64(cond, ret, arg1, t0);
> -    tcg_temp_free_i64(t0);
> +    if (TCG_TARGET_REG_BITS =3D=3D 64) {
> +        tcg_gen_setcond_i64(cond, ret, arg1, tcg_constant_i64(arg2));
> +    } else if (cond =3D=3D TCG_COND_ALWAYS) {
> +        tcg_gen_movi_i64(ret, 1);
> +    } else if (cond =3D=3D TCG_COND_NEVER) {
> +        tcg_gen_movi_i64(ret, 0);
> +    } else {
> +        tcg_gen_op6i_i32(INDEX_op_setcond2_i32, TCGV_LOW(ret),
> +                         TCGV_LOW(arg1), TCGV_HIGH(arg1),
> +                         tcg_constant_i32(arg2),
> +                         tcg_constant_i32(arg2 >> 32), cond);
> +        tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
> +    }
>  }
>=20=20
>  void tcg_gen_muli_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
> @@ -1690,7 +1685,7 @@ void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg)
>      } else {
>          TCGv_i64 t0 =3D tcg_temp_new_i64();
>          TCGv_i64 t1 =3D tcg_temp_new_i64();
> -        TCGv_i64 t2 =3D tcg_const_i64(0x00ff00ff);
> +        TCGv_i64 t2 =3D tcg_constant_i64(0x00ff00ff);
>=20=20
>                                          /* arg =3D ....abcd */
>          tcg_gen_shri_i64(t0, arg, 8);   /*  t0 =3D .....abc */
> @@ -1706,7 +1701,6 @@ void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg)
>=20=20
>          tcg_temp_free_i64(t0);
>          tcg_temp_free_i64(t1);
> -        tcg_temp_free_i64(t2);
>      }
>  }
>=20=20
> @@ -1850,16 +1844,16 @@ void tcg_gen_clzi_i64(TCGv_i64 ret, TCGv_i64 arg1=
, uint64_t arg2)
>      if (TCG_TARGET_REG_BITS =3D=3D 32
>          && TCG_TARGET_HAS_clz_i32
>          && arg2 <=3D 0xffffffffu) {
> -        TCGv_i32 t =3D tcg_const_i32((uint32_t)arg2 - 32);
> -        tcg_gen_clz_i32(t, TCGV_LOW(arg1), t);
> +        TCGv_i32 t =3D tcg_temp_new_i32();
> +        tcg_gen_clzi_i32(t, TCGV_LOW(arg1), arg2 - 32);
>          tcg_gen_addi_i32(t, t, 32);
>          tcg_gen_clz_i32(TCGV_LOW(ret), TCGV_HIGH(arg1), t);
>          tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
>          tcg_temp_free_i32(t);
>      } else {
> -        TCGv_i64 t =3D tcg_const_i64(arg2);
> -        tcg_gen_clz_i64(ret, arg1, t);
> -        tcg_temp_free_i64(t);
> +        TCGv_i64 t0 =3D tcg_const_i64(arg2);
> +        tcg_gen_clz_i64(ret, arg1, t0);
> +        tcg_temp_free_i64(t0);
>      }
>  }
>=20=20
> @@ -1881,7 +1875,7 @@ void tcg_gen_ctz_i64(TCGv_i64 ret, TCGv_i64 arg1, T=
CGv_i64 arg2)
>              tcg_gen_clzi_i64(t, t, 64);
>              tcg_gen_xori_i64(t, t, 63);
>          }
> -        z =3D tcg_const_i64(0);
> +        z =3D tcg_constant_i64(0);
>          tcg_gen_movcond_i64(TCG_COND_EQ, ret, arg1, z, arg2, t);
>          tcg_temp_free_i64(t);
>          tcg_temp_free_i64(z);
> @@ -1895,8 +1889,8 @@ void tcg_gen_ctzi_i64(TCGv_i64 ret, TCGv_i64 arg1, =
uint64_t arg2)
>      if (TCG_TARGET_REG_BITS =3D=3D 32
>          && TCG_TARGET_HAS_ctz_i32
>          && arg2 <=3D 0xffffffffu) {
> -        TCGv_i32 t32 =3D tcg_const_i32((uint32_t)arg2 - 32);
> -        tcg_gen_ctz_i32(t32, TCGV_HIGH(arg1), t32);
> +        TCGv_i32 t32 =3D tcg_temp_new_i32();
> +        tcg_gen_ctzi_i32(t32, TCGV_HIGH(arg1), arg2 - 32);
>          tcg_gen_addi_i32(t32, t32, 32);
>          tcg_gen_ctz_i32(TCGV_LOW(ret), TCGV_LOW(arg1), t32);
>          tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
> @@ -1911,9 +1905,9 @@ void tcg_gen_ctzi_i64(TCGv_i64 ret, TCGv_i64 arg1, =
uint64_t arg2)
>          tcg_gen_ctpop_i64(ret, t);
>          tcg_temp_free_i64(t);
>      } else {
> -        TCGv_i64 t64 =3D tcg_const_i64(arg2);
> -        tcg_gen_ctz_i64(ret, arg1, t64);
> -        tcg_temp_free_i64(t64);
> +        TCGv_i64 t0 =3D tcg_const_i64(arg2);
> +        tcg_gen_ctz_i64(ret, arg1, t0);
> +        tcg_temp_free_i64(t0);
>      }
>  }
>=20=20
> @@ -1969,9 +1963,7 @@ void tcg_gen_rotli_i64(TCGv_i64 ret, TCGv_i64 arg1,=
 int64_t arg2)
>      if (arg2 =3D=3D 0) {
>          tcg_gen_mov_i64(ret, arg1);
>      } else if (TCG_TARGET_HAS_rot_i64) {
> -        TCGv_i64 t0 =3D tcg_const_i64(arg2);
> -        tcg_gen_rotl_i64(ret, arg1, t0);
> -        tcg_temp_free_i64(t0);
> +        tcg_gen_rotl_i64(ret, arg1, tcg_constant_i64(arg2));
>      } else {
>          TCGv_i64 t0, t1;
>          t0 =3D tcg_temp_new_i64();
> @@ -2089,9 +2081,8 @@ void tcg_gen_deposit_z_i64(TCGv_i64 ret, TCGv_i64 a=
rg,
>          tcg_gen_andi_i64(ret, arg, (1ull << len) - 1);
>      } else if (TCG_TARGET_HAS_deposit_i64
>                 && TCG_TARGET_deposit_i64_valid(ofs, len)) {
> -        TCGv_i64 zero =3D tcg_const_i64(0);
> +        TCGv_i64 zero =3D tcg_constant_i64(0);
>          tcg_gen_op5ii_i64(INDEX_op_deposit_i64, ret, zero, arg, ofs, len=
);
> -        tcg_temp_free_i64(zero);
>      } else {
>          if (TCG_TARGET_REG_BITS =3D=3D 32) {
>              if (ofs >=3D 32) {
> @@ -3117,9 +3108,8 @@ void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv=
 addr, TCGv_i32 cmpv,
>=20=20
>  #ifdef CONFIG_SOFTMMU
>          {
> -            TCGv_i32 oi =3D tcg_const_i32(make_memop_idx(memop & ~MO_SIG=
N, idx));
> -            gen(retv, cpu_env, addr, cmpv, newv, oi);
> -            tcg_temp_free_i32(oi);
> +            TCGMemOpIdx oi =3D make_memop_idx(memop & ~MO_SIGN, idx);
> +            gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
>          }
>  #else
>          gen(retv, cpu_env, addr, cmpv, newv);
> @@ -3162,9 +3152,8 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv=
 addr, TCGv_i64 cmpv,
>=20=20
>  #ifdef CONFIG_SOFTMMU
>          {
> -            TCGv_i32 oi =3D tcg_const_i32(make_memop_idx(memop, idx));
> -            gen(retv, cpu_env, addr, cmpv, newv, oi);
> -            tcg_temp_free_i32(oi);
> +            TCGMemOpIdx oi =3D make_memop_idx(memop, idx);
> +            gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
>          }
>  #else
>          gen(retv, cpu_env, addr, cmpv, newv);
> @@ -3226,9 +3215,8 @@ static void do_atomic_op_i32(TCGv_i32 ret, TCGv add=
r, TCGv_i32 val,
>=20=20
>  #ifdef CONFIG_SOFTMMU
>      {
> -        TCGv_i32 oi =3D tcg_const_i32(make_memop_idx(memop & ~MO_SIGN, i=
dx));
> -        gen(ret, cpu_env, addr, val, oi);
> -        tcg_temp_free_i32(oi);
> +        TCGMemOpIdx oi =3D make_memop_idx(memop & ~MO_SIGN, idx);
> +        gen(ret, cpu_env, addr, val, tcg_constant_i32(oi));
>      }
>  #else
>      gen(ret, cpu_env, addr, val);
> @@ -3272,9 +3260,8 @@ static void do_atomic_op_i64(TCGv_i64 ret, TCGv add=
r, TCGv_i64 val,
>=20=20
>  #ifdef CONFIG_SOFTMMU
>          {
> -            TCGv_i32 oi =3D tcg_const_i32(make_memop_idx(memop & ~MO_SIG=
N, idx));
> -            gen(ret, cpu_env, addr, val, oi);
> -            tcg_temp_free_i32(oi);
> +            TCGMemOpIdx oi =3D make_memop_idx(memop & ~MO_SIGN, idx);
> +            gen(ret, cpu_env, addr, val, tcg_constant_i32(oi));
>          }
>  #else
>          gen(ret, cpu_env, addr, val);


--=20
Alex Benn=C3=A9e

