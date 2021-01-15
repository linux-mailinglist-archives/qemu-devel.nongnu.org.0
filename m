Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3AC2F893F
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 00:15:57 +0100 (CET)
Received: from localhost ([::1]:54220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0YJw-0003ul-S2
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 18:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0Y8G-0002Fn-DL
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 18:03:52 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:34929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0Y85-000254-Db
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 18:03:52 -0500
Received: by mail-io1-xd2a.google.com with SMTP id y19so21336897iov.2
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 15:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jWwYfZ+ZC9D0O7t2H3uZoFB+A5UC+2YU2GovKV3WvGo=;
 b=eW70USmIIF5/kP+V6C8o2QEy2eRpePSRCXMW1ql6yYhIlaeCQw6yTDffaya1AmZFja
 o5vVzhkoQsRy+uHIErwSk7qlKoiDvFhm1yL4o/nSxlKOnKT45GlSRPZAas5yxPi+BB6y
 P0pBW5TkGjleKybGUVw0SYUYl8g4yCDhMTdJXbQeYanLJNUF6d9UmthW3gpPDFBKrATs
 xBkg70mwIB26uZXOhKbgsSB8VRtEY1p+XWyO26u2MRkJC/MP/xQ2diQQq1MddL1xVP1Y
 hirLzalFiGDrtZsgoHyjlMFSHEhk7UG/E50VUY4rVPe/3bJ120hYaLX1AHq0YKfJfVTZ
 5M6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jWwYfZ+ZC9D0O7t2H3uZoFB+A5UC+2YU2GovKV3WvGo=;
 b=tfmCXSozx4p0EfNZWahYYfzNY9V/8HF02BGVC+C8c2N21I4SpChSjJzfN2+A5ZGCaM
 U25T+4cJc6q5jlbswXSc7WPTno6CL6TR3KXIPgmuqcObSQvA4lygFZGzBHJVmGCVOc+H
 KlVB8+W042ljNiCLG3sKbTbwCvbUyXbBXbE0xjjBr43FYWlzlz7hQxtXlowq1oPWU4KX
 tpfo1i4Ds1iJ5kmh/tlpJb0x5G8/jrq6ZOL1jhcwr+zEoOz/aBWkOyhhsLLDlpoBjTED
 rbBcjueCLOxFs0nCTuNnD4hoylMoq+hL8zsTbEl3t592A9H/lHwRHJCX5/c6eE6ppmBL
 3Hmg==
X-Gm-Message-State: AOAM533/5E2Nqbx18p8RMMOrsrK8YaSAplYIbD26dmRKHP/NUNo/h67L
 KEq2jXzWC2wIoegEBWP15LrsVvE3eRIrGbz/Em8=
X-Google-Smtp-Source: ABdhPJzsBFX3/VjjADNOBQvS+fDyJYaY997vi5zwvLyGD5Sw9ceBQVz3A94wQzD1jdZkv5Mr2VwvdFwmHAQfY6CpgJQ=
X-Received: by 2002:a92:8455:: with SMTP id l82mr743425ild.40.1610751818787;
 Fri, 15 Jan 2021 15:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20210114021654.647242-1-richard.henderson@linaro.org>
 <20210114021654.647242-12-richard.henderson@linaro.org>
In-Reply-To: <20210114021654.647242-12-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Jan 2021 15:03:12 -0800
Message-ID: <CAKmqyKOezdn_bjyjAsAbiXQj_Cz-fphYCezo-tbBAjGR=Emgng@mail.gmail.com>
Subject: Re: [PULL 11/24] tcg/optimize: Use tcg_constant_internal with
 constant folding
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 13, 2021 at 6:32 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

This patch results in a QEMU seg fault when starting userspace on RISC-V 32-bit.

This is the full backtrace:

```
#0  0x0000555555a67c4d in ts_are_copies (ts2=0x7fffa8008008,
ts1=0x7fffa8001e40) at ../tcg/optimize.c:163
#1  tcg_opt_gen_mov (s=s@entry=0x7fffa8000b60,
op=op@entry=0x7fffa81ac778, dst=140736011968064, src=140736011993096)
at ../tcg/optimize.c:191
#2  0x0000555555a67dcb in tcg_opt_gen_movi (s=s@entry=0x7fffa8000b60,
temps_used=temps_used@entry=0x7ffff1cb92c0,
op=op@entry=0x7fffa81ac778, dst=<optimized out>, val=<optimized out>)
at ../tcg/optimize.c:249
#3  0x0000555555a6914d in tcg_optimize (s=s@entry=0x7fffa8000b60) at
../tcg/optimize.c:1242
#4  0x0000555555abb248 in tcg_gen_code (s=0x7fffa8000b60,
tb=tb@entry=0x7fffae84edc0 <code_gen_buffer+42266003>) at
../tcg/tcg.c:4406
#5  0x0000555555a7f4d5 in tb_gen_code (cpu=cpu@entry=0x7ffff7fac930,
pc=160234, cs_base=0, flags=16640, cflags=-16252928) at
../accel/tcg/translate-all.c:1952
#6  0x0000555555ae4fe4 in tb_find (cf_mask=<optimized out>, tb_exit=0,
last_tb=0x0, cpu=0x7ffff7fac930) at ../accel/tcg/cpu-exec.c:454
#7  cpu_exec (cpu=cpu@entry=0x7ffff7fac930) at ../accel/tcg/cpu-exec.c:810
#8  0x0000555555aa6513 in tcg_cpus_exec (cpu=cpu@entry=0x7ffff7fac930)
at ../accel/tcg/tcg-cpus.c:57
#9  0x0000555555a8c7a3 in mttcg_cpu_thread_fn
(arg=arg@entry=0x7ffff7fac930) at ../accel/tcg/tcg-cpus-mttcg.c:69
#10 0x0000555555c94209 in qemu_thread_start (args=0x7ffff1cb96d0) at
../util/qemu-thread-posix.c:521
#11 0x00007ffff673a3e9 in start_thread () at /usr/lib/libpthread.so.0
#12 0x00007ffff6395293 in clone () at /usr/lib/libc.so.6
```

I run QEMU with these arguments:

./build/riscv32-softmmu/qemu-system-riscv32 \
    -machine virt -serial mon:stdio -serial null -nographic \
    -append "root=/dev/vda rw highres=off  console=ttyS0 ip=dhcp earlycon=sbi" \
    -device virtio-net-device,netdev=net0,mac=52:54:00:12:34:02
-netdev user,id=net0 \
    -object rng-random,filename=/dev/urandom,id=rng0 -device
virtio-rng-device,rng=rng0 \
    -smp 4 -d guest_errors -m 256M \
    -kernel ./Image \
    -drive id=disk0,file=./core-image-minimal-qemuriscv32.ext4,if=none,format=raw
\
    -device virtio-blk-device,drive=disk0 \
    -bios default

I am uploading the images to:
https://nextcloud.alistair23.me/index.php/s/MQFyGGNLPZjLZPH

Although apparently it will take a few hours to upload the 2GB rootFS.

Alistair


> ---
>  tcg/optimize.c | 108 ++++++++++++++++++++++---------------------------
>  1 file changed, 49 insertions(+), 59 deletions(-)
>
> diff --git a/tcg/optimize.c b/tcg/optimize.c
> index 49bf1386c7..bda727d5ed 100644
> --- a/tcg/optimize.c
> +++ b/tcg/optimize.c
> @@ -178,37 +178,6 @@ static bool args_are_copies(TCGArg arg1, TCGArg arg2)
>      return ts_are_copies(arg_temp(arg1), arg_temp(arg2));
>  }
>
> -static void tcg_opt_gen_movi(TCGContext *s, TCGOp *op, TCGArg dst, uint64_t val)
> -{
> -    const TCGOpDef *def;
> -    TCGOpcode new_op;
> -    uint64_t mask;
> -    TempOptInfo *di = arg_info(dst);
> -
> -    def = &tcg_op_defs[op->opc];
> -    if (def->flags & TCG_OPF_VECTOR) {
> -        new_op = INDEX_op_dupi_vec;
> -    } else if (def->flags & TCG_OPF_64BIT) {
> -        new_op = INDEX_op_movi_i64;
> -    } else {
> -        new_op = INDEX_op_movi_i32;
> -    }
> -    op->opc = new_op;
> -    /* TCGOP_VECL and TCGOP_VECE remain unchanged.  */
> -    op->args[0] = dst;
> -    op->args[1] = val;
> -
> -    reset_temp(dst);
> -    di->is_const = true;
> -    di->val = val;
> -    mask = val;
> -    if (TCG_TARGET_REG_BITS > 32 && new_op == INDEX_op_movi_i32) {
> -        /* High bits of the destination are now garbage.  */
> -        mask |= ~0xffffffffull;
> -    }
> -    di->mask = mask;
> -}
> -
>  static void tcg_opt_gen_mov(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg src)
>  {
>      TCGTemp *dst_ts = arg_temp(dst);
> @@ -259,6 +228,27 @@ static void tcg_opt_gen_mov(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg src)
>      }
>  }
>
> +static void tcg_opt_gen_movi(TCGContext *s, TCGTempSet *temps_used,
> +                             TCGOp *op, TCGArg dst, uint64_t val)
> +{
> +    const TCGOpDef *def = &tcg_op_defs[op->opc];
> +    TCGType type;
> +    TCGTemp *tv;
> +
> +    if (def->flags & TCG_OPF_VECTOR) {
> +        type = TCGOP_VECL(op) + TCG_TYPE_V64;
> +    } else if (def->flags & TCG_OPF_64BIT) {
> +        type = TCG_TYPE_I64;
> +    } else {
> +        type = TCG_TYPE_I32;
> +    }
> +
> +    /* Convert movi to mov with constant temp. */
> +    tv = tcg_constant_internal(type, val);
> +    init_ts_info(temps_used, tv);
> +    tcg_opt_gen_mov(s, op, dst, temp_arg(tv));
> +}
> +
>  static uint64_t do_constant_folding_2(TCGOpcode op, uint64_t x, uint64_t y)
>  {
>      uint64_t l64, h64;
> @@ -622,7 +612,7 @@ void tcg_optimize(TCGContext *s)
>      nb_temps = s->nb_temps;
>      nb_globals = s->nb_globals;
>
> -    bitmap_zero(temps_used.l, nb_temps);
> +    memset(&temps_used, 0, sizeof(temps_used));
>      for (i = 0; i < nb_temps; ++i) {
>          s->temps[i].state_ptr = NULL;
>      }
> @@ -727,7 +717,7 @@ void tcg_optimize(TCGContext *s)
>          CASE_OP_32_64(rotr):
>              if (arg_is_const(op->args[1])
>                  && arg_info(op->args[1])->val == 0) {
> -                tcg_opt_gen_movi(s, op, op->args[0], 0);
> +                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
>                  continue;
>              }
>              break;
> @@ -1054,7 +1044,7 @@ void tcg_optimize(TCGContext *s)
>
>          if (partmask == 0) {
>              tcg_debug_assert(nb_oargs == 1);
> -            tcg_opt_gen_movi(s, op, op->args[0], 0);
> +            tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
>              continue;
>          }
>          if (affected == 0) {
> @@ -1071,7 +1061,7 @@ void tcg_optimize(TCGContext *s)
>          CASE_OP_32_64(mulsh):
>              if (arg_is_const(op->args[2])
>                  && arg_info(op->args[2])->val == 0) {
> -                tcg_opt_gen_movi(s, op, op->args[0], 0);
> +                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
>                  continue;
>              }
>              break;
> @@ -1098,7 +1088,7 @@ void tcg_optimize(TCGContext *s)
>          CASE_OP_32_64_VEC(sub):
>          CASE_OP_32_64_VEC(xor):
>              if (args_are_copies(op->args[1], op->args[2])) {
> -                tcg_opt_gen_movi(s, op, op->args[0], 0);
> +                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
>                  continue;
>              }
>              break;
> @@ -1115,14 +1105,14 @@ void tcg_optimize(TCGContext *s)
>              break;
>          CASE_OP_32_64(movi):
>          case INDEX_op_dupi_vec:
> -            tcg_opt_gen_movi(s, op, op->args[0], op->args[1]);
> +            tcg_opt_gen_movi(s, &temps_used, op, op->args[0], op->args[1]);
>              break;
>
>          case INDEX_op_dup_vec:
>              if (arg_is_const(op->args[1])) {
>                  tmp = arg_info(op->args[1])->val;
>                  tmp = dup_const(TCGOP_VECE(op), tmp);
> -                tcg_opt_gen_movi(s, op, op->args[0], tmp);
> +                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
>                  break;
>              }
>              goto do_default;
> @@ -1132,7 +1122,7 @@ void tcg_optimize(TCGContext *s)
>              if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
>                  tmp = arg_info(op->args[1])->val;
>                  if (tmp == arg_info(op->args[2])->val) {
> -                    tcg_opt_gen_movi(s, op, op->args[0], tmp);
> +                    tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
>                      break;
>                  }
>              } else if (args_are_copies(op->args[1], op->args[2])) {
> @@ -1160,7 +1150,7 @@ void tcg_optimize(TCGContext *s)
>          case INDEX_op_extrh_i64_i32:
>              if (arg_is_const(op->args[1])) {
>                  tmp = do_constant_folding(opc, arg_info(op->args[1])->val, 0);
> -                tcg_opt_gen_movi(s, op, op->args[0], tmp);
> +                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
>                  break;
>              }
>              goto do_default;
> @@ -1190,7 +1180,7 @@ void tcg_optimize(TCGContext *s)
>              if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
>                  tmp = do_constant_folding(opc, arg_info(op->args[1])->val,
>                                            arg_info(op->args[2])->val);
> -                tcg_opt_gen_movi(s, op, op->args[0], tmp);
> +                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
>                  break;
>              }
>              goto do_default;
> @@ -1201,7 +1191,7 @@ void tcg_optimize(TCGContext *s)
>                  TCGArg v = arg_info(op->args[1])->val;
>                  if (v != 0) {
>                      tmp = do_constant_folding(opc, v, 0);
> -                    tcg_opt_gen_movi(s, op, op->args[0], tmp);
> +                    tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
>                  } else {
>                      tcg_opt_gen_mov(s, op, op->args[0], op->args[2]);
>                  }
> @@ -1214,7 +1204,7 @@ void tcg_optimize(TCGContext *s)
>                  tmp = deposit64(arg_info(op->args[1])->val,
>                                  op->args[3], op->args[4],
>                                  arg_info(op->args[2])->val);
> -                tcg_opt_gen_movi(s, op, op->args[0], tmp);
> +                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
>                  break;
>              }
>              goto do_default;
> @@ -1223,7 +1213,7 @@ void tcg_optimize(TCGContext *s)
>              if (arg_is_const(op->args[1])) {
>                  tmp = extract64(arg_info(op->args[1])->val,
>                                  op->args[2], op->args[3]);
> -                tcg_opt_gen_movi(s, op, op->args[0], tmp);
> +                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
>                  break;
>              }
>              goto do_default;
> @@ -1232,7 +1222,7 @@ void tcg_optimize(TCGContext *s)
>              if (arg_is_const(op->args[1])) {
>                  tmp = sextract64(arg_info(op->args[1])->val,
>                                   op->args[2], op->args[3]);
> -                tcg_opt_gen_movi(s, op, op->args[0], tmp);
> +                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
>                  break;
>              }
>              goto do_default;
> @@ -1249,7 +1239,7 @@ void tcg_optimize(TCGContext *s)
>                      tmp = (int32_t)(((uint32_t)v1 >> shr) |
>                                      ((uint32_t)v2 << (32 - shr)));
>                  }
> -                tcg_opt_gen_movi(s, op, op->args[0], tmp);
> +                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
>                  break;
>              }
>              goto do_default;
> @@ -1258,7 +1248,7 @@ void tcg_optimize(TCGContext *s)
>              tmp = do_constant_folding_cond(opc, op->args[1],
>                                             op->args[2], op->args[3]);
>              if (tmp != 2) {
> -                tcg_opt_gen_movi(s, op, op->args[0], tmp);
> +                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
>                  break;
>              }
>              goto do_default;
> @@ -1268,7 +1258,7 @@ void tcg_optimize(TCGContext *s)
>                                             op->args[1], op->args[2]);
>              if (tmp != 2) {
>                  if (tmp) {
> -                    bitmap_zero(temps_used.l, nb_temps);
> +                    memset(&temps_used, 0, sizeof(temps_used));
>                      op->opc = INDEX_op_br;
>                      op->args[0] = op->args[3];
>                  } else {
> @@ -1314,7 +1304,7 @@ void tcg_optimize(TCGContext *s)
>                  uint64_t a = ((uint64_t)ah << 32) | al;
>                  uint64_t b = ((uint64_t)bh << 32) | bl;
>                  TCGArg rl, rh;
> -                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_movi_i32);
> +                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_mov_i32);
>
>                  if (opc == INDEX_op_add2_i32) {
>                      a += b;
> @@ -1324,8 +1314,8 @@ void tcg_optimize(TCGContext *s)
>
>                  rl = op->args[0];
>                  rh = op->args[1];
> -                tcg_opt_gen_movi(s, op, rl, (int32_t)a);
> -                tcg_opt_gen_movi(s, op2, rh, (int32_t)(a >> 32));
> +                tcg_opt_gen_movi(s, &temps_used, op, rl, (int32_t)a);
> +                tcg_opt_gen_movi(s, &temps_used, op2, rh, (int32_t)(a >> 32));
>                  break;
>              }
>              goto do_default;
> @@ -1336,12 +1326,12 @@ void tcg_optimize(TCGContext *s)
>                  uint32_t b = arg_info(op->args[3])->val;
>                  uint64_t r = (uint64_t)a * b;
>                  TCGArg rl, rh;
> -                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_movi_i32);
> +                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_mov_i32);
>
>                  rl = op->args[0];
>                  rh = op->args[1];
> -                tcg_opt_gen_movi(s, op, rl, (int32_t)r);
> -                tcg_opt_gen_movi(s, op2, rh, (int32_t)(r >> 32));
> +                tcg_opt_gen_movi(s, &temps_used, op, rl, (int32_t)r);
> +                tcg_opt_gen_movi(s, &temps_used, op2, rh, (int32_t)(r >> 32));
>                  break;
>              }
>              goto do_default;
> @@ -1352,7 +1342,7 @@ void tcg_optimize(TCGContext *s)
>              if (tmp != 2) {
>                  if (tmp) {
>              do_brcond_true:
> -                    bitmap_zero(temps_used.l, nb_temps);
> +                    memset(&temps_used, 0, sizeof(temps_used));
>                      op->opc = INDEX_op_br;
>                      op->args[0] = op->args[5];
>                  } else {
> @@ -1368,7 +1358,7 @@ void tcg_optimize(TCGContext *s)
>                  /* Simplify LT/GE comparisons vs zero to a single compare
>                     vs the high word of the input.  */
>              do_brcond_high:
> -                bitmap_zero(temps_used.l, nb_temps);
> +                memset(&temps_used, 0, sizeof(temps_used));
>                  op->opc = INDEX_op_brcond_i32;
>                  op->args[0] = op->args[1];
>                  op->args[1] = op->args[3];
> @@ -1394,7 +1384,7 @@ void tcg_optimize(TCGContext *s)
>                      goto do_default;
>                  }
>              do_brcond_low:
> -                bitmap_zero(temps_used.l, nb_temps);
> +                memset(&temps_used, 0, sizeof(temps_used));
>                  op->opc = INDEX_op_brcond_i32;
>                  op->args[1] = op->args[2];
>                  op->args[2] = op->args[4];
> @@ -1429,7 +1419,7 @@ void tcg_optimize(TCGContext *s)
>                                              op->args[5]);
>              if (tmp != 2) {
>              do_setcond_const:
> -                tcg_opt_gen_movi(s, op, op->args[0], tmp);
> +                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
>              } else if ((op->args[5] == TCG_COND_LT
>                          || op->args[5] == TCG_COND_GE)
>                         && arg_is_const(op->args[3])
> @@ -1514,7 +1504,7 @@ void tcg_optimize(TCGContext *s)
>                 block, otherwise we only trash the output args.  "mask" is
>                 the non-zero bits mask for the first output arg.  */
>              if (def->flags & TCG_OPF_BB_END) {
> -                bitmap_zero(temps_used.l, nb_temps);
> +                memset(&temps_used, 0, sizeof(temps_used));
>              } else {
>          do_reset_output:
>                  for (i = 0; i < nb_oargs; i++) {
> --
> 2.25.1
>
>

