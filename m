Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2531830E995
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 02:49:02 +0100 (CET)
Received: from localhost ([::1]:34220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7TlU-0006m7-A2
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 20:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Thv-0004Ur-BJ
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:19 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Ths-0003VQ-HF
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:18 -0500
Received: by mail-pf1-x42b.google.com with SMTP id w14so1082796pfi.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/jFq9ud4tlslQZsPzfJqLsCKzWy28s7fmYZSPRNGO04=;
 b=vVvhNYYOiJV888I1KOO60BxcLbAlkFSWIXotU8Wak3zijzLpEDZlQDz0EfnRtabAUE
 7NsB1sjXKmfU67iiMf3hxAvoUGHtvlgZaE0TxE9xtuiH6d0+5BYAWpLYTz3lNJ/R/LCq
 30yohSE6jBX/alFnTf37ZUNBd5cwqdeJvxJu4ZUfXQuORJwaWuAFymQvPDjjCmKVQAvr
 GVcGTrd7VBP66avHdwkVVpPcpUcda8PKnLhOOAg4Snp7QT9nUZnWCt2IlSdQb9oDNOmV
 mXB3DfGkx3sihZb+tLhh0+FkntVEb2/ljvgxSBeBh/A10KXTrCmM/erx2ecmQWoSvAKW
 x4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/jFq9ud4tlslQZsPzfJqLsCKzWy28s7fmYZSPRNGO04=;
 b=lSKtA7tKG5lD7/ByLna8YqCe4JayfbcMDpYRdLU4HRLOSqFdoCkX8/ojMx8TXSSvzM
 Uymc81rk1MS28lrmSMtoiy43kRETuop5gXIzVL0htqPn/w6mUGoSAt7b8HPsuFYVCBzy
 Q+5eVoek5xGKkFzP/7hR4ir/q8W5yyv8danuj4HXDU3G+qlUICfEdrTMlgoxaMjdFxui
 Z4s9QlY7n6opG/c+I3I7lF9aRA1BwllyoXSUnvnZtkgy/4K67rg2n4pFl4tp1prxVJ6q
 MiReYOnWh2hXKarx2rpwHfEzbSjQRBvDpC2Otib0EMOIVFsxrpr3G+ia10EJltaISiEH
 0O8w==
X-Gm-Message-State: AOAM531ypV8+i3vUJWZaKp181EyWBsRlDHo3RM2Ht54g2QtNIA0Gt7QL
 L2AyB9+TEOtMPHYpDV2l9MhiR5CRT57tFKWD
X-Google-Smtp-Source: ABdhPJxk4UaYGPLDYiFc8WSFtOicdkQDwPg/5bw7MQDeCXl90K0YwgWRvKCd62Z5DmxKSlzOKHcU4w==
X-Received: by 2002:a65:4bc3:: with SMTP id p3mr6430926pgr.318.1612403114087; 
 Wed, 03 Feb 2021 17:45:14 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/93] TCI fixes and cleanups
Date: Wed,  3 Feb 2021 15:43:36 -1000
Message-Id: <20210204014509.882821-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Almost 7 years ago I detailed 5 major problems in tci[1], of
which three still remain:

  * Unaligned accesses to the bytecode stream, which means
    that we immediately SIGBUS on any host requiring alignment.
  * Non-portable calls to helper functions.
  * Full of useless ifdefs and TODOs.

To my mind, this means the code is unmaintained, despite what it
says in MAINTAINERS.  Thus tci *should* be simply removed.
However, every time removal is suggested, someone comes out of the
woodwork and says we should keep it, because it's useful for $FOO.

Anyway, if we're not going to remove tci, then we have to fix it.

Previously, I rewrote tci all in one lump.  Which was obviously a
mistake, since it meant that the patch was never going to get
reviewed.  This time I've done the rewrite in tiny pieces.

Previously, I invented a moderately complex encoding scheme that
allowed any operand to encode a register or an int32_t immediate.
This time the encoding is quite simple: with only 4 exceptions
all operands encoded into 4-bit slots (registers & conditions).
I rely on the new TEMP_CONST optimization to do a decent job of
loading an immediate value into a register once (via movi), and
reusing that across the TB.

There is a disassembler built into tcg/tci.c, replacing the stub
in disas/tci.c, which reuses the same decoding helpers that are
used by the interpreter.  So finally -d out_asm is useful.

This is good enough to pass make check check-tcg with all of the
docker cross-compilers enabled.  I can boot linux with aarch64,
alpha, and s390x guests.


r~


Based-on: 20210203021550.375058-1-richard.henderson@linaro.org
("[PULL 00/24] tcg patch queue")

[1] https://lists.gnu.org/archive/html/qemu-devel/2014-05/msg02594.html

Richard Henderson (91):
  gdbstub: Fix handle_query_xfer_auxv
  tcg: Split out tcg_raise_tb_overflow
  configure: Fix --enable-tcg-interpreter
  tcg: Manage splitwx in tc_ptr_to_region_tree by hand
  tcg/tci: Make tci_tb_ptr thread-local
  tcg/tci: Inline tci_write_reg32s into the only caller
  tcg/tci: Inline tci_write_reg8 into its callers
  tcg/tci: Inline tci_write_reg16 into the only caller
  tcg/tci: Inline tci_write_reg32 into all callers
  tcg/tci: Inline tci_write_reg64 into 64-bit callers
  tcg/tci: Merge INDEX_op_ld8u_{i32,i64}
  tcg/tci: Merge INDEX_op_ld8s_{i32,i64}
  tcg/tci: Merge INDEX_op_ld16u_{i32,i64}
  tcg/tci: Merge INDEX_op_ld16s_{i32,i64}
  tcg/tci: Merge INDEX_op_{ld_i32,ld32u_i64}
  tcg/tci: Merge INDEX_op_st8_{i32,i64}
  tcg/tci: Merge INDEX_op_st16_{i32,i64}
  tcg/tci: Move stack bounds check to compile-time
  tcg/tci: Merge INDEX_op_{st_i32,st32_i64}
  tcg/tci: Use g_assert_not_reached
  tcg/tci: Remove dead code for TCG_TARGET_HAS_div2_*
  tcg/tci: Implement 64-bit division
  tcg/tci: Remove TODO as unused
  tcg/tci: Restrict TCG_TARGET_NB_REGS to 16
  tcg/tci: Fix TCG_REG_R4 misusage
  tcg/tci: Use bool in tcg_out_ri*
  tcg/tci: Remove TCG_CONST
  tcg/tci: Merge identical cases in generation
  tcg/tci: Remove tci_read_r8
  tcg/tci: Remove tci_read_r8s
  tcg/tci: Remove tci_read_r16
  tcg/tci: Remove tci_read_r16s
  tcg/tci: Remove tci_read_r32s
  tcg/tci: Reduce use of tci_read_r64
  tcg/tci: Merge basic arithmetic operations
  tcg/tci: Merge extension operations
  tcg/tci: Remove ifdefs for TCG_TARGET_HAS_ext32[us]_i64
  tcg/tci: Merge bswap operations
  tcg/tci: Merge mov, not and neg operations
  tcg/tci: Rename tci_read_r to tci_read_rval
  tcg/tci: Split out tci_args_rrs
  tcg/tci: Split out tci_args_rr
  tcg/tci: Split out tci_args_rrr
  tcg/tci: Split out tci_args_rrrc
  tcg/tci: Split out tci_args_l
  tcg/tci: Split out tci_args_rrrrrc
  tcg/tci: Split out tci_args_rrcl and tci_args_rrrrcl
  tcg/tci: Split out tci_args_ri and tci_args_rI
  tcg/tci: Reuse tci_args_l for calls.
  tcg/tci: Reuse tci_args_l for exit_tb
  tcg/tci: Reuse tci_args_l for goto_tb
  tcg/tci: Split out tci_args_rrrrrr
  tcg/tci: Split out tci_args_rrrr
  tcg/tci: Clean up deposit operations
  tcg/tci: Reduce qemu_ld/st TCGMemOpIdx operand to 32-bits
  tcg/tci: Split out tci_args_{rrm,rrrm,rrrrm}
  tcg/tci: Hoist op_size checking into tci_args_*
  tcg/tci: Remove tci_disas
  tcg/tci: Implement the disassembler properly
  tcg: Build ffi data structures for helpers
  tcg/tci: Use ffi for calls
  tcg/tci: Improve tcg_target_call_clobber_regs
  tcg/tci: Move call-return regs to end of tcg_target_reg_alloc_order
  tcg/tci: Push opcode emit into each case
  tcg/tci: Split out tcg_out_op_rrs
  tcg/tci: Split out tcg_out_op_l
  tcg/tci: Split out tcg_out_op_p
  tcg/tci: Split out tcg_out_op_rr
  tcg/tci: Split out tcg_out_op_rrr
  tcg/tci: Split out tcg_out_op_rrrc
  tcg/tci: Split out tcg_out_op_rrrrrc
  tcg/tci: Split out tcg_out_op_rrrbb
  tcg/tci: Split out tcg_out_op_rrcl
  tcg/tci: Split out tcg_out_op_rrrrrr
  tcg/tci: Split out tcg_out_op_rrrr
  tcg/tci: Split out tcg_out_op_rrrrcl
  tcg/tci: Split out tcg_out_op_{rrm,rrrm,rrrrm}
  tcg/tci: Split out tcg_out_op_v
  tcg/tci: Split out tcg_out_op_np
  tcg/tci: Split out tcg_out_op_r[iI]
  tcg/tci: Reserve r13 for a temporary
  tcg/tci: Emit setcond before brcond
  tcg/tci: Remove tci_write_reg
  tcg/tci: Change encoding to uint32_t units
  tcg/tci: Implement goto_ptr
  tcg/tci: Implement movcond
  tcg/tci: Implement andc, orc, eqv, nand, nor
  tcg/tci: Implement extract, sextract
  tcg/tci: Implement clz, ctz, ctpop
  tcg/tci: Implement mulu2, muls2
  tcg/tci: Implement add2, sub2

Stefan Weil (2):
  tcg/tci: Implement INDEX_op_ld16s_i32
  tcg/tci: Implement INDEX_op_ld8s_i64

 configure                              |    5 +-
 meson.build                            |    9 +-
 include/exec/exec-all.h                |    2 +-
 include/exec/helper-ffi.h              |  115 ++
 include/exec/helper-tcg.h              |   24 +-
 include/tcg/tcg-opc.h                  |    6 +-
 include/tcg/tcg.h                      |    1 +
 target/hppa/helper.h                   |    2 +
 target/i386/ops_sse_header.h           |    6 +
 target/m68k/helper.h                   |    1 +
 target/ppc/helper.h                    |    3 +
 tcg/tci/tcg-target-con-set.h           |    8 +-
 tcg/tci/tcg-target.h                   |  118 +-
 disas/tci.c                            |   61 -
 gdbstub.c                              |   17 +-
 tcg/tcg-common.c                       |    4 -
 tcg/tcg.c                              |  117 +-
 tcg/tci.c                              | 1695 +++++++++++++-----------
 tcg/tci/tcg-target.c.inc               |  989 +++++++-------
 tcg/tci/README                         |   20 +-
 tests/docker/dockerfiles/fedora.docker |    1 +
 21 files changed, 1734 insertions(+), 1470 deletions(-)
 create mode 100644 include/exec/helper-ffi.h
 delete mode 100644 disas/tci.c

-- 
2.25.1


