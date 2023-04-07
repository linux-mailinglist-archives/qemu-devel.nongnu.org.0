Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFD86DAA90
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 11:04:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkhzj-00087m-U1; Fri, 07 Apr 2023 05:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pkhzh-0007xe-6g; Fri, 07 Apr 2023 05:02:53 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pkhzf-00018i-5a; Fri, 07 Apr 2023 05:02:52 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 nh20-20020a17090b365400b0024496d637e1so3784239pjb.5; 
 Fri, 07 Apr 2023 02:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680858166; x=1683450166;
 h=to:from:subject:cc:message-id:date:content-transfer-encoding
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U3vYh4wBxeALICsHqGaNz+6QzYeHaYPS4NyTqx0X6co=;
 b=USQlsQkoEKoxYr6E7y0ShX6G/4KX/yUwUENqsiBx2HgXn9uQG69DxRAWexc//Zio5d
 glNBkrO7DsdcnaTGkvXahlmo34CQFj5yHpPh1ynuCq11dYZn45nmLlQRdXVlUbxLmovK
 rnrmR42fWfaaAED/tYeMbZxyer5ceaGPgxO7fZ+Se0C7kc2PLqZljjI4bNTaakGKN7PB
 Ur8KKphM6gY8vKX35dJpV6YOlWqNAksVEAVt5yeCztpqNnKtoZsMrNDrSlUDdHHW3x1B
 Xzw7ssn6uYDkixxK5aph570ysz9gggXlPQD/Y1lMLD8mckZEkiSTX75F4hae2qdRjuq7
 +Umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680858166; x=1683450166;
 h=to:from:subject:cc:message-id:date:content-transfer-encoding
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U3vYh4wBxeALICsHqGaNz+6QzYeHaYPS4NyTqx0X6co=;
 b=BC2TWjA2qJsZAT3nIsI0Rw/QZyU1sPnhXnylY3SyhK71YdEMSSO+xH/IkZnsObbC6C
 BJmXzHfOfw0wfwpI7JVBarnJjzdBf+WehkRPhdTQxNTtFxxG8S6f12J38PF9/42iq/dN
 Lgmz/CuyEcZCOqxpxN6fc72jAqPfPVmLWENiwd5HsGNBu/KgW6sPgx9i/4bJ6P1RzEBF
 zZIbRJ3JW575UUrqq5V97zF+GE/kwyY96L2jF05ciC6aziZ2vh99OacvLih2BsUrXzB6
 oASd/7t/fQ3Ol9etY0xRAST+vR/lF8Qx9d5s+9x1H7TZE/uyyvcdAWcrcaPyZAuLlZ9X
 mtbg==
X-Gm-Message-State: AAQBX9d77jU4nyVS0WNaRj//KSCTS8pa8fcEEcABIzBOe1CwOeMN+Mjb
 i8T8JiDNTGUYsg2FTk1tuov9BWp7+FRxHA==
X-Google-Smtp-Source: AKy350ZlLWPpE3d0zFggVQXaVRj7zSR3BBJmx0+uyYNRriT2n5dtlNagJF8UrgDiMV/F6WTBX1dEJg==
X-Received: by 2002:a05:6a20:b547:b0:de:d3ce:9d14 with SMTP id
 ev7-20020a056a20b54700b000ded3ce9d14mr2121881pzb.60.1680858166480; 
 Fri, 07 Apr 2023 02:02:46 -0700 (PDT)
Received: from localhost ([203.59.189.25]) by smtp.gmail.com with ESMTPSA id
 bm17-20020a056a00321100b0062de3e977bcsm2603493pfb.26.2023.04.07.02.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 02:02:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Apr 2023 19:02:41 +1000
Message-Id: <CRQEHNGPTSUM.34NYFP2RDLQA6@wheely>
Cc: "Richard Henderson" <richard.henderson@linaro.org>, <qemu-ppc@nongnu.org>
Subject: assert !temp_readonly(ts) in tcg_reg_alloc_op
From: "Nicholas Piggin" <npiggin@gmail.com>
To: <qemu-devel@nongnu.org>
X-Mailer: aerc 0.14.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

I get a crash running a powerpc64 TCG machine on x86.

It can be triggered by booting a custom vmlinux patched to use powerpc
prefix instructions and pcrel addressing, I don't know if that's related
or coincidence. I can give Linux patches or a vmlinux file to reproduce
if needed, or I can test patches quickly.

The first bad commit is 7058ff5231a0 ("target/ppc: Avoid tcg_const_* in
translate.c")

Some gdb stuff

  0x00007ffff76d5395 in __assert_fail_base
    (fmt=3D0x7ffff7849a70 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", asse=
rtion=3Dassertion@entry=3D0x55555625a99c "!temp_readonly(ts)", file=3Dfile@=
entry=3D0x555556256211 "../tcg/tcg.c", line=3Dline@entry=3D4450, function=
=3Dfunction@entry=3D0x55555625b640 <__PRETTY_FUNCTION__.9> "tcg_reg_alloc_o=
p") at ./assert/assert.c:92
#5  0x00007ffff76e3df2 in __GI___assert_fail
    (assertion=3D0x55555625a99c "!temp_readonly(ts)", file=3D0x555556256211=
 "../tcg/tcg.c", line=3D4450, function=3D0x55555625b640 <__PRETTY_FUNCTION_=
_.9> "tcg_reg_alloc_op") at ./assert/assert.c:101
#6  0x0000555555e078b9 in tcg_reg_alloc_op
    (s=3D0x7ffd60000b70, op=3D0x7ffd600097f8) at ../tcg/tcg.c:4450
#7  0x0000555555e08e77 in tcg_gen_code
    (s=3D0x7ffd60000b70, tb=3D0x7fffb07612c0, pc_start=3D138350580552863879=
16)
    at ../tcg/tcg.c:5122
#8  0x0000555555e49a3f in setjmp_gen_code
    (env=3D0x555556be9e30, tb=3D0x7fffb07612c0, pc=3D13835058055286387916, =
host_pc=3D0x7ffd702074cc, max_insns=3D0x7ffff65076ac, ti=3D0x7ffff65076c8)
    at ../accel/tcg/translate-all.c:297
#9  0x0000555555e49c67 in tb_gen_code
    (cpu=3D0x555556be7a40, pc=3D13835058055286387916, cs_base=3D0, flags=3D=
3053453367, cflags=3D-16777216) at ../accel/tcg/translate-all.c:365
#10 0x0000555555e40db4 in cpu_exec_loop (cpu=3D0x555556be7a40, sc=3D0x7ffff=
6507800)
    at ../accel/tcg/cpu-exec.c:978
#11 0x0000555555e40f95 in cpu_exec_setjmp
    (cpu=3D0x555556be7a40, sc=3D0x7ffff6507800) at ../accel/tcg/cpu-exec.c:=
1043
#12 0x0000555555e4101c in cpu_exec (cpu=3D0x555556be7a40)
    at ../accel/tcg/cpu-exec.c:1069

(gdb) frame 6
#6  0x0000555555e078b9 in tcg_reg_alloc_op (s=3D0x7ffd60000b70,
    op=3D0x7ffd600097f8) at ../tcg/tcg.c:4450
4450	            tcg_debug_assert(!temp_readonly(ts));
(gdb) p *op
$1 =3D {opc =3D INDEX_op_divu2_i32, nargs =3D 5, param1 =3D 0, param2 =3D 0=
,
  life =3D 464, link =3D {tqe_next =3D 0x7ffd60009840, tqe_circ =3D {
      tql_next =3D 0x7ffd60009840, tql_prev =3D 0x7ffd60009770}}, output_pr=
ef =3D {
    0, 4}, args =3D 0x7ffd60009818}
(gdb) print *def
$2 =3D {name =3D 0x55555625baf5 "divu2_i32", nb_oargs =3D 2 '\002',
  nb_iargs =3D 3 '\003', nb_cargs =3D 0 '\000', nb_args =3D 5 '\005',
  flags =3D 0 '\000', args_ct =3D 0x555556ba793c}
(gdb) p k
$3 =3D 1
(gdb) p *ts
$4 =3D {reg =3D TCG_REG_R12, val_type =3D TEMP_VAL_CONST, base_type =3D TCG=
_TYPE_I32,
  type =3D TCG_TYPE_I32, kind =3D TEMP_CONST, indirect_reg =3D 0, indirect_=
base =3D 0,
  mem_coherent =3D 0, mem_allocated =3D 0, temp_allocated =3D 1, temp_subin=
dex =3D 0,
  val =3D 0, mem_base =3D 0x0, mem_offset =3D 0, name =3D 0x0, state =3D 0,
  state_ptr =3D 0x7ffd6000a9fc}
(gdb) p *arg_ct
$5 =3D {ct =3D 0, alias_index =3D 3, sort_index =3D 1, pair_index =3D 0, pa=
ir =3D 0,
  oalias =3D true, ialias =3D false, newreg =3D false, regs =3D 4}

Thanks,
Nick

