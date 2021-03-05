Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8C832F0C3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:09:52 +0100 (CET)
Received: from localhost ([::1]:50384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDxX-0006JZ-PK
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIDkE-0006sk-Vw
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:07 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:34485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIDk1-0007BC-Lo
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:06 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so1077788wmq.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 08:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=eBGSu6a8euiZB0MZ5ugTbmleCiMoYJb/yO0/4iz+Y70=;
 b=Lp1SsttxEpQea4OnJFTdZttZ3amq0ysN/0ouQF7wtlNhkMphcx9sffD0NMH99n9yXK
 kJukghs8JdrZbHrBb5jZl3CtN2SFV3gyPiwa0RLVXxNPorsR3g9+bIVDj3f7zEMeqyIz
 1NOn7gQ4+y/36SJs9JTm4MfVCs0lj0Uga4uOeenH0y0nf6DeULVHDWiwBcwHfrSZQ2HK
 SrkAj0Fm1i7DaObeYKFCc+HuzCQg/Zdkp11cHPaL9iuk+iLrG4VNAiTufJ/RYhOY8mq0
 4/fLYzzwe8DjYCDxMGNCiEpj81+6qT7KFr5bLM5pAs1fVx5FcpwEdmgRfCRAqUnatdy/
 mfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=eBGSu6a8euiZB0MZ5ugTbmleCiMoYJb/yO0/4iz+Y70=;
 b=BGiUWec8HGQx3iHYd48DmR6D5v11wfSYli9QvXfenu9n4I21jHO9FZ22H3O5ON7nX7
 KXNJI7bPHQefISez31JxT8NDi2SfaIinobc7RSV6yBeU2gkYhuWlUaBAhSzo9xyQnSQ5
 1RYTxgC3FVK8ONk4e95haOFClshFExl9TxelXMazfiOjKr0gTVQXHpF7kP5JCQQCpavO
 aPZbF1OpjLvQGQnKNobMOtLkBTu5xyGYaHrRGDfoNQbs5pBx7TmZLDIlmsZhGDEMjSx5
 J8MD6OILDUPs/tWjJgwOTiO9j2wzNndGPkG8uH1zYO1vGvQET8KpawSLa0u0933vAgde
 4uAw==
X-Gm-Message-State: AOAM533t4DIAZvRP5R+LTYtI7Te5V237EUKpFUAvUzznAewGbZAeFZGr
 1ZSyRa46j7yl/COyPEYHgJE7hA==
X-Google-Smtp-Source: ABdhPJwBDaAZCQCbYLfImwrjrtXhzoiLkVDLJxbrDTydAAeQpsfjg2KRbqE0S41Xy7EwNvYTqBfRqg==
X-Received: by 2002:a7b:c1c9:: with SMTP id a9mr9470527wmj.145.1614963351428; 
 Fri, 05 Mar 2021 08:55:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f7sm5135351wmh.39.2021.03.05.08.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 08:55:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6625E1FF7E;
 Fri,  5 Mar 2021 16:55:49 +0000 (GMT)
References: <20210208023752.270606-1-richard.henderson@linaro.org>
 <87zgzheeto.fsf@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 00/70] TCI fixes and cleanups
Date: Fri, 05 Mar 2021 16:55:27 +0000
In-reply-to: <87zgzheeto.fsf@linaro.org>
Message-ID: <87wnulee0a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> Changes since v2:
>>   * 20-something patches are now upstream.
>>   * Increase testing timeout for tci.
>>   * Gitlab testing for tci w/ 32-bit host.
>
> Hmm that fails with this applied on the current master:
>
> cc -Ilibqemu-i386-linux-user.fa.p -I. -I.. -Itarget/i386 -I../target/i386=
 -I../linux-user/host/i386 -Ilinux-user -I../linux-user -Ilinux-user/i386 -=
I../linux-user/i386 -I../capstone/include/capstone -Itrace -Iqapi -Iui -Iui=
/shader -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -fdiagnostics-c=
olor=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=3Dgnu99 -O2 -g -isystem =
/builds/stsquad/qemu/linux-headers -isystem linux-headers -iquote . -iquote=
 /builds/stsquad/qemu -iquote /builds/stsquad/qemu/include -iquote /builds/=
stsquad/qemu/disas/libvixl -iquote /builds/stsquad/qemu/tcg/tci -iquote /bu=
ilds/stsquad/qemu/accel/tcg -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D=
2 -m32 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-=
prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -=
fno-strict-aliasing -fno-common -fwrapv -m32 -Wold-style-declaration -Wold-=
style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -=
Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansio=
n-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs -Wno-shif=
t-negative-value -Wno-psabi -fstack-protector-strong -fPIC -isystem../linux=
-headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D"i386-linux-=
user-config-target.h"' '-DCONFIG_DEVICES=3D"i386-linux-user-config-devices.=
h"' -MD -MQ libqemu-i386-linux-user.fa.p/tcg_tci.c.o -MF libqemu-i386-linux=
-user.fa.p/tcg_tci.c.o.d -o libqemu-i386-linux-user.fa.p/tcg_tci.c.o -c ../=
tcg/tci.c
> ../tcg/tci.c: In function 'tcg_qemu_tb_exec':
> ../tcg/tci.c:317:37: error: passing argument 1 of 'g2h' makes pointer fro=
m integer without a cast [-Werror=3Dint-conversion]
>   317 | # define qemu_ld_ub      ldub_p(g2h(taddr))
>       |                                     ^~~~~
>       |                                     |
>       |                                     target_ulong {aka unsigned in=
t}
> ../tcg/tci.c:923:25: note: in expansion of macro 'qemu_ld_ub'
>   923 |                 tmp32 =3D qemu_ld_ub;
>       |                         ^~~~~~~~~~
>
> and more:
>
> https://gitlab.com/stsquad/qemu/-/jobs/1076231320

Looks like it was broken by:

3e8f1628e864201692aa28996f8f64f9761555af is the first bad commit
commit 3e8f1628e864201692aa28996f8f64f9761555af
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Fri Feb 12 10:48:43 2021 -0800

    exec: Use cpu_untagged_addr in g2h; split out g2h_untagged

    Use g2h_untagged in contexts that have no cpu, e.g. the binary
    loaders that operate before the primary cpu is created.  As a
    colollary, target_mmap and friends must use untagged addresses,
    since they are used by the loaders.

    Use g2h_untagged on values returned from target_mmap, as the
    kernel never applies a tag itself.

    Use g2h_untagged on all pc values.  The only current user of
    tags, aarch64, removes tags from code addresses upon branch,
    so "pc" is always untagged.

    Use g2h with the cpu context on hand wherever possible.

    Use g2h_untagged in lock_user, which will be updated soon.

    Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
    Message-id: 20210212184902.1251044-13-richard.henderson@linaro.org
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


>
>
>
>>
>>
>> r~
>>
>>
>> Richard Henderson (70):
>>   gdbstub: Fix handle_query_xfer_auxv
>>   tcg: Split out tcg_raise_tb_overflow
>>   tcg: Manage splitwx in tc_ptr_to_region_tree by hand
>>   tcg/tci: Merge identical cases in generation
>>   tcg/tci: Remove tci_read_r8
>>   tcg/tci: Remove tci_read_r8s
>>   tcg/tci: Remove tci_read_r16
>>   tcg/tci: Remove tci_read_r16s
>>   tcg/tci: Remove tci_read_r32
>>   tcg/tci: Remove tci_read_r32s
>>   tcg/tci: Reduce use of tci_read_r64
>>   tcg/tci: Merge basic arithmetic operations
>>   tcg/tci: Merge extension operations
>>   tcg/tci: Remove ifdefs for TCG_TARGET_HAS_ext32[us]_i64
>>   tcg/tci: Merge bswap operations
>>   tcg/tci: Merge mov, not and neg operations
>>   tcg/tci: Rename tci_read_r to tci_read_rval
>>   tcg/tci: Split out tci_args_rrs
>>   tcg/tci: Split out tci_args_rr
>>   tcg/tci: Split out tci_args_rrr
>>   tcg/tci: Split out tci_args_rrrc
>>   tcg/tci: Split out tci_args_l
>>   tcg/tci: Split out tci_args_rrrrrc
>>   tcg/tci: Split out tci_args_rrcl and tci_args_rrrrcl
>>   tcg/tci: Split out tci_args_ri and tci_args_rI
>>   tcg/tci: Reuse tci_args_l for calls.
>>   tcg/tci: Reuse tci_args_l for exit_tb
>>   tcg/tci: Reuse tci_args_l for goto_tb
>>   tcg/tci: Split out tci_args_rrrrrr
>>   tcg/tci: Split out tci_args_rrrr
>>   tcg/tci: Clean up deposit operations
>>   tcg/tci: Reduce qemu_ld/st TCGMemOpIdx operand to 32-bits
>>   tcg/tci: Split out tci_args_{rrm,rrrm,rrrrm}
>>   tcg/tci: Hoist op_size checking into tci_args_*
>>   tcg/tci: Remove tci_disas
>>   tcg/tci: Implement the disassembler properly
>>   tcg: Build ffi data structures for helpers
>>   tcg/tci: Use ffi for calls
>>   tcg/tci: Improve tcg_target_call_clobber_regs
>>   tcg/tci: Move call-return regs to end of tcg_target_reg_alloc_order
>>   tcg/tci: Push opcode emit into each case
>>   tcg/tci: Split out tcg_out_op_rrs
>>   tcg/tci: Split out tcg_out_op_l
>>   tcg/tci: Split out tcg_out_op_p
>>   tcg/tci: Split out tcg_out_op_rr
>>   tcg/tci: Split out tcg_out_op_rrr
>>   tcg/tci: Split out tcg_out_op_rrrc
>>   tcg/tci: Split out tcg_out_op_rrrrrc
>>   tcg/tci: Split out tcg_out_op_rrrbb
>>   tcg/tci: Split out tcg_out_op_rrcl
>>   tcg/tci: Split out tcg_out_op_rrrrrr
>>   tcg/tci: Split out tcg_out_op_rrrr
>>   tcg/tci: Split out tcg_out_op_rrrrcl
>>   tcg/tci: Split out tcg_out_op_{rrm,rrrm,rrrrm}
>>   tcg/tci: Split out tcg_out_op_v
>>   tcg/tci: Split out tcg_out_op_np
>>   tcg/tci: Split out tcg_out_op_r[iI]
>>   tcg/tci: Reserve r13 for a temporary
>>   tcg/tci: Emit setcond before brcond
>>   tcg/tci: Remove tci_write_reg
>>   tcg/tci: Change encoding to uint32_t units
>>   tcg/tci: Implement goto_ptr
>>   tcg/tci: Implement movcond
>>   tcg/tci: Implement andc, orc, eqv, nand, nor
>>   tcg/tci: Implement extract, sextract
>>   tcg/tci: Implement clz, ctz, ctpop
>>   tcg/tci: Implement mulu2, muls2
>>   tcg/tci: Implement add2, sub2
>>   tests/tcg: Increase timeout for TCI
>>   gitlab: Enable cross-i386 builds of TCI
>>
>>  configure                                     |    3 +
>>  meson.build                                   |    9 +-
>>  include/exec/helper-ffi.h                     |  115 ++
>>  include/exec/helper-tcg.h                     |   24 +-
>>  include/tcg/tcg-opc.h                         |    6 +-
>>  include/tcg/tcg.h                             |    1 +
>>  target/hppa/helper.h                          |    2 +
>>  target/i386/ops_sse_header.h                  |    6 +
>>  target/m68k/helper.h                          |    1 +
>>  target/ppc/helper.h                           |    3 +
>>  tcg/tci/tcg-target-con-set.h                  |    2 +-
>>  tcg/tci/tcg-target.h                          |   81 +-
>>  disas/tci.c                                   |   61 -
>>  gdbstub.c                                     |   17 +-
>>  tcg/tcg.c                                     |  117 +-
>>  tcg/tci.c                                     | 1536 ++++++++++-------
>>  tcg/tci/tcg-target.c.inc                      |  926 +++++-----
>>  .gitlab-ci.d/crossbuilds.yml                  |   17 +-
>>  tcg/tci/README                                |   20 +-
>>  .../dockerfiles/fedora-i386-cross.docker      |    1 +
>>  tests/docker/dockerfiles/fedora.docker        |    1 +
>>  tests/tcg/Makefile.target                     |    6 +-
>>  22 files changed, 1727 insertions(+), 1228 deletions(-)
>>  create mode 100644 include/exec/helper-ffi.h
>>  delete mode 100644 disas/tci.c


--=20
Alex Benn=C3=A9e

