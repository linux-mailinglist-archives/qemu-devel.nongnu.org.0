Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E720C3128FE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:40:24 +0100 (CET)
Received: from localhost ([::1]:57230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wTJ-0002kg-W3
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wR4-00010T-Mv
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:37:58 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:39197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wR2-0005fK-Sk
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:37:58 -0500
Received: by mail-pl1-x633.google.com with SMTP id k22so2648667pll.6
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VZcop2dyPgWWGcD7xRsCRlsZbHSTwB0QnG6bpKYY9lk=;
 b=XzNpmEgmoLk7p8Fcy9l694GHAJQVtK6c/F1cp17VfN8DoEDx/rVrJyMKDXJbDKftPQ
 zeoJU8pQW/Igdf9pHUmp4b+UpM72s23HZkXVXUiaxqDFyOHh9WNdSpk/KqD7/pUheU4e
 5DS2NS/OA7ZZKWLZMJTF6iRJkfMeegUQv/QWUBEduOp3z5vhMKS9p8ZJwltvDU0tyZ0x
 +5zbl6o42ItnwOxsE6oMQoiV7UEh5xFeaHjR+jCvnc5NvzNUSADzbDzRj/yO3F/ogW1n
 WKJnfXpEp8j9MqQ7Edmnu2gdgp6ND09ytZ166hkPaixFj0UruqqBcoJzDeiCTVUjuaTQ
 dwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VZcop2dyPgWWGcD7xRsCRlsZbHSTwB0QnG6bpKYY9lk=;
 b=qUhJlLtYbrSiid+tR0Sx1ChgG//iLs1QUhRKV5SWLikDks1szWhj7r/IhsdvWAeHVH
 R++exWtqcTHj4c3ADc1fHSWssWpf/+nIrv4Xa0YHZUYqvorcDnW1oV9YpYAWssTc4py4
 yiSPgXVG9ifg39Q6eIxeVDBCVTsFwzfhXPhsAtikEKqtfm35J0Fw2EG96V1xxtTyLQB3
 S6NsnoFqMOKuG7mmf8HwPjs9xnq2YgHQzNJb4wfqXtLadRFGxlGrr2YpQCAUAIFN5O0q
 1Qkks0qOFTBe7efCHrj4og/79GKfU5n7fRTW43bHKLuJIBFVQJ0Cf0ZGj0h2A4fvy4Me
 m+fA==
X-Gm-Message-State: AOAM530SRkfgnnN9lyrvvCX8Mm/IfDBono7qNtWApZyaSZtyLBtHQ9Jv
 0I6S+nTZASiNmYlvZ+VHrEDT9/TvodVSJg==
X-Google-Smtp-Source: ABdhPJzHpWtuABlP2EDmIVL7Fd/Or/CZWYU8XXhfLgBGdGMgpPhAUuKhXtnTwCt1DnSzaiDmL+s70A==
X-Received: by 2002:a17:90a:9905:: with SMTP id
 b5mr14434460pjp.195.1612751875151; 
 Sun, 07 Feb 2021 18:37:55 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:37:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/70] TCI fixes and cleanups
Date: Sun,  7 Feb 2021 18:36:42 -0800
Message-Id: <20210208023752.270606-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Changes since v2:
  * 20-something patches are now upstream.
  * Increase testing timeout for tci.
  * Gitlab testing for tci w/ 32-bit host.


r~


Richard Henderson (70):
  gdbstub: Fix handle_query_xfer_auxv
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
 gdbstub.c                                     |   17 +-
 tcg/tcg.c                                     |  117 +-
 tcg/tci.c                                     | 1536 ++++++++++-------
 tcg/tci/tcg-target.c.inc                      |  926 +++++-----
 .gitlab-ci.d/crossbuilds.yml                  |   17 +-
 tcg/tci/README                                |   20 +-
 .../dockerfiles/fedora-i386-cross.docker      |    1 +
 tests/docker/dockerfiles/fedora.docker        |    1 +
 tests/tcg/Makefile.target                     |    6 +-
 22 files changed, 1727 insertions(+), 1228 deletions(-)
 create mode 100644 include/exec/helper-ffi.h
 delete mode 100644 disas/tci.c

-- 
2.25.1


