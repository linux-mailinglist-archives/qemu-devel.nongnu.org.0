Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7749731E04A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:29:24 +0100 (CET)
Received: from localhost ([::1]:36644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTRr-0006U0-I0
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTJf-00069E-BO
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:20:55 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTJd-0006fk-E6
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:20:54 -0500
Received: by mail-pg1-x533.google.com with SMTP id 75so5817848pgf.13
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EMneyiM4NFXz9Iwi8cCGiCS77QOpy3EzcfhSEAMFK04=;
 b=ZZPa/B7H7VeiVayoiTJyZBuHhI/I/S7s1EPhGrwle7NxW/BvQpB50odqvoFgPYhtFW
 TgOjAHBkAftVrnrfusk8jx7+0Cprqfi9mPUjD2J4Fp7EoV6J67F1I7Ajfvi13fxNCaYw
 SBNjB5r4UTz3A92ttnWekhsjzE2TD3jpQ6Ex/bU6F6ZqwQ1YscrZ/cxMsj+/1QeFin3u
 y2vOkTyPGAycpoMyHkXtngW7rJzJ1zNJmwkV0+G/hgYs/GPTihHCeyZ7fmX3KaZvjR5N
 YGfNMUw8WHccbXYKoamPxwEe45fG8gDQIAghJ6YPRGd6nWbimwcESbF6dYDn61drY66e
 kM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EMneyiM4NFXz9Iwi8cCGiCS77QOpy3EzcfhSEAMFK04=;
 b=b4SIiqp3Ip/hXJaTUnvn3yYPwrtBaa1MfHsYGVQR5jk05VhswD6sr9PfXvNQZJEN83
 ozniJ1KOyJiIdUxe3mlngesHMQ2nWxx0AQMscSPHCI0banxtt8oMjRZhzMeKvG61jnlH
 4pLCc3R4uTuj0vDde1oc6okXvQBIafpELjD5enhguC0WmJDCL0mf8nLnYBk+P012PQAs
 4+TLdEMoLQcGIfdLNLq8UFer240pkOOYxyEGXSICazkz99+JYs0cy8j8Ef4PJSqY/VEu
 IPwNSln2oY3ALaUt2ixLpBcU8Iw5a2r/SjKxDpWaZP7TKfdI+NAPWsLM2YL+T7qLUDFo
 RA/w==
X-Gm-Message-State: AOAM532PSnfCIORAfS2XW7it7hxB1bhEtY3ZCw3YLjkKaQJytyGRK7ka
 kvMpRz7RJUuRSpsTHYTVpoccltovAKY14A==
X-Google-Smtp-Source: ABdhPJycZzP8c5vyhrMIAzHneMt6sl98B1SyqMldC8ZX+lbYk9xZn6eSjk0K8VRVUVAEtu0qkabiRg==
X-Received: by 2002:a62:1ec5:0:b029:1ce:b354:b25f with SMTP id
 e188-20020a621ec50000b02901ceb354b25fmr934395pfe.56.1613593250949; 
 Wed, 17 Feb 2021 12:20:50 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:20:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/71] TCI fixes and cleanups
Date: Wed, 17 Feb 2021 12:19:25 -0800
Message-Id: <20210217202036.1724901-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes since v3:
  * First patch fixes g2h() breakage.  This shows a hole in our CI,
    in that we only build softmmu with TCI, not linux-user.
  * Tidy-up for the magic qemu_ld/st macros.
  * Fix libffi return value case with ffi_arg.

Changes since v2:
  * 20-something patches are now upstream.
  * Increase testing timeout for tci.
  * Gitlab testing for tci w/ 32-bit host.


r~


Richard Henderson (71):
  tcg/tci: Use exec/cpu_ldst.h interfaces
  tcg: Split out tcg_raise_tb_overflow
  tcg: Manage splitwx in tc_ptr_to_region_tree by hand
  tcg/tci: Merge identical cases in generation
  tcg/tci: Remove tci_read_r8
  tcg/tci: Remove tci_read_r8s
  tcg/tci: Remove tci_read_r16
  tcg/tci: Remove tci_read_r16s
  tcg/tci: Remove tci_read_r32
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
  tcg/tci: Split out tci_qemu_ld, tci_qemu_st
  tests/tcg: Increase timeout for TCI
  gitlab: Enable cross-i386 builds of TCI

 configure                                     |    3 +
 meson.build                                   |    9 +-
 include/exec/helper-ffi.h                     |  115 ++
 include/exec/helper-tcg.h                     |   24 +-
 include/tcg/tcg-opc.h                         |    6 +-
 include/tcg/tcg.h                             |    1 +
 target/hppa/helper.h                          |    2 +
 target/i386/ops_sse_header.h                  |    6 +
 target/m68k/helper.h                          |    1 +
 target/ppc/helper.h                           |    3 +
 tcg/tci/tcg-target-con-set.h                  |    2 +-
 tcg/tci/tcg-target.h                          |   81 +-
 disas/tci.c                                   |   61 -
 tcg/tcg.c                                     |  117 +-
 tcg/tci.c                                     | 1759 +++++++++--------
 tcg/tci/tcg-target.c.inc                      |  926 +++++----
 .gitlab-ci.d/crossbuilds.yml                  |   17 +-
 tcg/tci/README                                |   20 +-
 .../dockerfiles/fedora-i386-cross.docker      |    1 +
 tests/docker/dockerfiles/fedora.docker        |    1 +
 tests/tcg/Makefile.target                     |    6 +-
 21 files changed, 1789 insertions(+), 1372 deletions(-)
 create mode 100644 include/exec/helper-ffi.h
 delete mode 100644 disas/tci.c

-- 
2.25.1


