Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8394832F035
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:41:39 +0100 (CET)
Received: from localhost ([::1]:58266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDWE-0001AO-Jg
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIDT0-0006xo-NR
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:38:20 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIDSw-0007G3-NS
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:38:17 -0500
Received: by mail-wm1-x336.google.com with SMTP id l22so2002999wme.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 08:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=73wiomn9JzNo/5HRlAbrmXrOw/89tv11TVyBFOLeK8M=;
 b=tQlXFhDJsQJWLKThDkhoNMcXtCAPgMKT5C3BzWu6KTO0gHNxIyGvmyVJIuUpWUt6kv
 c2qm1LsVHKRXVEvLgx3CQlA8pFvml3hwIVCujmZmicYb/HwMdLiEhJJw21K1lb8VX/xZ
 dxkY1hrSvwySXbbAZJ4nnasSL0qZ5zNw6qBx6hIHK5/PxxX4D0kMoxGnBKFXzI9Xxskq
 2PoXXyZMYF7jzG87lYzFmq/UXG4BVIy3JU7N6uGrDBVaE8oLXqxIuEOABKc6f+lEy6V5
 6uVbQOlUbMI5a5+i9Igd7zJQta5+RGSII+7Ff/vnomncSg4mcX2uSZWySZR9bJMQWf+Q
 BpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=73wiomn9JzNo/5HRlAbrmXrOw/89tv11TVyBFOLeK8M=;
 b=kmxJnlPJzvAWB4qTPiZn4Zb//zCj85Jlpl8NAf+8bXffC26VDCpFjoSI8hXGPtFMXU
 PuqdNqmpu9zBzLa7QQWzTTgDl8JOBPEaDQv2SbPjGeX3KdzoX919yCG6HGB/Qd7HfjuT
 xM+EEuitVKsLvd8lKyyChBJoiD+wvPcRdIAXKqaPeaDGKHWoCVZ2MrFB02YAfXt13+yp
 YdsgTvOw7uBkmcMgWGzLrCFdrBcRRx+Jk5BilgNlt7GatKmp9n3V40y+AurzOP1/aVbN
 wYMI79JQDrCJglfmvpJc1j8vPs40/y0W2+FszTzWlMKlCg+MX4CvxdA92eaRXs6CAo9y
 ZZ5A==
X-Gm-Message-State: AOAM532xqTeRHE9gdLLw+Ogj2kcs8h1AMQnYeYiDGUcrzewBdsAC4rKW
 5l2ubZfg0tHlSzyJGhbIi0BFTSy8ms2L1A==
X-Google-Smtp-Source: ABdhPJwsQiRhaRn0awPh+4zvDZZpwlECEuReeu7aS6c/+HU2bOjDKtKi2P3etJe/Qu87L2VvZFdsVQ==
X-Received: by 2002:a1c:cc14:: with SMTP id h20mr9684229wmb.14.1614962292965; 
 Fri, 05 Mar 2021 08:38:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r7sm5379486wre.25.2021.03.05.08.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 08:38:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F91D1FF7E;
 Fri,  5 Mar 2021 16:38:11 +0000 (GMT)
References: <20210208023752.270606-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 00/70] TCI fixes and cleanups
Date: Fri, 05 Mar 2021 16:37:40 +0000
In-reply-to: <20210208023752.270606-1-richard.henderson@linaro.org>
Message-ID: <87zgzheeto.fsf@linaro.org>
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Changes since v2:
>   * 20-something patches are now upstream.
>   * Increase testing timeout for tci.
>   * Gitlab testing for tci w/ 32-bit host.

Hmm that fails with this applied on the current master:

cc -Ilibqemu-i386-linux-user.fa.p -I. -I.. -Itarget/i386 -I../target/i386 -=
I../linux-user/host/i386 -Ilinux-user -I../linux-user -Ilinux-user/i386 -I.=
./linux-user/i386 -I../capstone/include/capstone -Itrace -Iqapi -Iui -Iui/s=
hader -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -fdiagnostics-col=
or=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=3Dgnu99 -O2 -g -isystem /b=
uilds/stsquad/qemu/linux-headers -isystem linux-headers -iquote . -iquote /=
builds/stsquad/qemu -iquote /builds/stsquad/qemu/include -iquote /builds/st=
squad/qemu/disas/libvixl -iquote /builds/stsquad/qemu/tcg/tci -iquote /buil=
ds/stsquad/qemu/accel/tcg -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 =
-m32 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-pr=
ototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fn=
o-strict-aliasing -fno-common -fwrapv -m32 -Wold-style-declaration -Wold-st=
yle-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wi=
gnored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-=
to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs -Wno-shift-=
negative-value -Wno-psabi -fstack-protector-strong -fPIC -isystem../linux-h=
eaders -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D"i386-linux-us=
er-config-target.h"' '-DCONFIG_DEVICES=3D"i386-linux-user-config-devices.h"=
' -MD -MQ libqemu-i386-linux-user.fa.p/tcg_tci.c.o -MF libqemu-i386-linux-u=
ser.fa.p/tcg_tci.c.o.d -o libqemu-i386-linux-user.fa.p/tcg_tci.c.o -c ../tc=
g/tci.c
../tcg/tci.c: In function 'tcg_qemu_tb_exec':
../tcg/tci.c:317:37: error: passing argument 1 of 'g2h' makes pointer from =
integer without a cast [-Werror=3Dint-conversion]
  317 | # define qemu_ld_ub      ldub_p(g2h(taddr))
      |                                     ^~~~~
      |                                     |
      |                                     target_ulong {aka unsigned int}
../tcg/tci.c:923:25: note: in expansion of macro 'qemu_ld_ub'
  923 |                 tmp32 =3D qemu_ld_ub;
      |                         ^~~~~~~~~~

and more:

https://gitlab.com/stsquad/qemu/-/jobs/1076231320



>
>
> r~
>
>
> Richard Henderson (70):
>   gdbstub: Fix handle_query_xfer_auxv
>   tcg: Split out tcg_raise_tb_overflow
>   tcg: Manage splitwx in tc_ptr_to_region_tree by hand
>   tcg/tci: Merge identical cases in generation
>   tcg/tci: Remove tci_read_r8
>   tcg/tci: Remove tci_read_r8s
>   tcg/tci: Remove tci_read_r16
>   tcg/tci: Remove tci_read_r16s
>   tcg/tci: Remove tci_read_r32
>   tcg/tci: Remove tci_read_r32s
>   tcg/tci: Reduce use of tci_read_r64
>   tcg/tci: Merge basic arithmetic operations
>   tcg/tci: Merge extension operations
>   tcg/tci: Remove ifdefs for TCG_TARGET_HAS_ext32[us]_i64
>   tcg/tci: Merge bswap operations
>   tcg/tci: Merge mov, not and neg operations
>   tcg/tci: Rename tci_read_r to tci_read_rval
>   tcg/tci: Split out tci_args_rrs
>   tcg/tci: Split out tci_args_rr
>   tcg/tci: Split out tci_args_rrr
>   tcg/tci: Split out tci_args_rrrc
>   tcg/tci: Split out tci_args_l
>   tcg/tci: Split out tci_args_rrrrrc
>   tcg/tci: Split out tci_args_rrcl and tci_args_rrrrcl
>   tcg/tci: Split out tci_args_ri and tci_args_rI
>   tcg/tci: Reuse tci_args_l for calls.
>   tcg/tci: Reuse tci_args_l for exit_tb
>   tcg/tci: Reuse tci_args_l for goto_tb
>   tcg/tci: Split out tci_args_rrrrrr
>   tcg/tci: Split out tci_args_rrrr
>   tcg/tci: Clean up deposit operations
>   tcg/tci: Reduce qemu_ld/st TCGMemOpIdx operand to 32-bits
>   tcg/tci: Split out tci_args_{rrm,rrrm,rrrrm}
>   tcg/tci: Hoist op_size checking into tci_args_*
>   tcg/tci: Remove tci_disas
>   tcg/tci: Implement the disassembler properly
>   tcg: Build ffi data structures for helpers
>   tcg/tci: Use ffi for calls
>   tcg/tci: Improve tcg_target_call_clobber_regs
>   tcg/tci: Move call-return regs to end of tcg_target_reg_alloc_order
>   tcg/tci: Push opcode emit into each case
>   tcg/tci: Split out tcg_out_op_rrs
>   tcg/tci: Split out tcg_out_op_l
>   tcg/tci: Split out tcg_out_op_p
>   tcg/tci: Split out tcg_out_op_rr
>   tcg/tci: Split out tcg_out_op_rrr
>   tcg/tci: Split out tcg_out_op_rrrc
>   tcg/tci: Split out tcg_out_op_rrrrrc
>   tcg/tci: Split out tcg_out_op_rrrbb
>   tcg/tci: Split out tcg_out_op_rrcl
>   tcg/tci: Split out tcg_out_op_rrrrrr
>   tcg/tci: Split out tcg_out_op_rrrr
>   tcg/tci: Split out tcg_out_op_rrrrcl
>   tcg/tci: Split out tcg_out_op_{rrm,rrrm,rrrrm}
>   tcg/tci: Split out tcg_out_op_v
>   tcg/tci: Split out tcg_out_op_np
>   tcg/tci: Split out tcg_out_op_r[iI]
>   tcg/tci: Reserve r13 for a temporary
>   tcg/tci: Emit setcond before brcond
>   tcg/tci: Remove tci_write_reg
>   tcg/tci: Change encoding to uint32_t units
>   tcg/tci: Implement goto_ptr
>   tcg/tci: Implement movcond
>   tcg/tci: Implement andc, orc, eqv, nand, nor
>   tcg/tci: Implement extract, sextract
>   tcg/tci: Implement clz, ctz, ctpop
>   tcg/tci: Implement mulu2, muls2
>   tcg/tci: Implement add2, sub2
>   tests/tcg: Increase timeout for TCI
>   gitlab: Enable cross-i386 builds of TCI
>
>  configure                                     |    3 +
>  meson.build                                   |    9 +-
>  include/exec/helper-ffi.h                     |  115 ++
>  include/exec/helper-tcg.h                     |   24 +-
>  include/tcg/tcg-opc.h                         |    6 +-
>  include/tcg/tcg.h                             |    1 +
>  target/hppa/helper.h                          |    2 +
>  target/i386/ops_sse_header.h                  |    6 +
>  target/m68k/helper.h                          |    1 +
>  target/ppc/helper.h                           |    3 +
>  tcg/tci/tcg-target-con-set.h                  |    2 +-
>  tcg/tci/tcg-target.h                          |   81 +-
>  disas/tci.c                                   |   61 -
>  gdbstub.c                                     |   17 +-
>  tcg/tcg.c                                     |  117 +-
>  tcg/tci.c                                     | 1536 ++++++++++-------
>  tcg/tci/tcg-target.c.inc                      |  926 +++++-----
>  .gitlab-ci.d/crossbuilds.yml                  |   17 +-
>  tcg/tci/README                                |   20 +-
>  .../dockerfiles/fedora-i386-cross.docker      |    1 +
>  tests/docker/dockerfiles/fedora.docker        |    1 +
>  tests/tcg/Makefile.target                     |    6 +-
>  22 files changed, 1727 insertions(+), 1228 deletions(-)
>  create mode 100644 include/exec/helper-ffi.h
>  delete mode 100644 disas/tci.c


--=20
Alex Benn=C3=A9e

