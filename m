Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969BE337605
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:45:11 +0100 (CET)
Received: from localhost ([::1]:54168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMYo-0000Nk-Kf
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:45:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMTv-00031W-Vr
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:08 -0500
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:33536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMTq-00068g-F3
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:07 -0500
Received: by mail-qt1-x829.google.com with SMTP id 94so1264130qtc.0
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0YgZnnekdOsfwodh3wE7rMUA7VsUCoglVP2DCkiNxkA=;
 b=adJS2HLVGPWPwwtam23YKrfpkfyH+OlTxDXJUNPZ8Q5znD/LsWmvakHflerYQnjLPL
 zXygJjExC6EHiJR7kkXZ3VIOMqUia1poDXgp/HJbJmxdQ7srBpCb8ySY3/HFz1+l+pBa
 bPENO1Xuwd+m1Ow84ZpkT+suNSIE4S9HFFl12PVCmBujr/sQFZwZStdgaapkPGsAZffg
 40BN1qTXGBBKizEsiAd8Ao6p0o21T92Kc+Tbj8cUdZ6lCoD3Z86/Gj6yrfmSw4XZmnO/
 CHV/7Dj4QRrMecSEHvpkV3G/yMxuWy7CyvGpgRAhJChV8LsN7sQIuO7NV0lNj329eASi
 mb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0YgZnnekdOsfwodh3wE7rMUA7VsUCoglVP2DCkiNxkA=;
 b=qIZTBpxNm3wXM9uUouNu8OH/6cX0YHYMSIHbDfi7fmUXWACNaXYz7U+lNMf3RW6LZL
 rne//xD3o5fZ4nT+cRaPiCv6eDN7bQIb4xGZ9YYqrZ+fPxmi1ODZzdwGA07fRRo4Zgg5
 G0FC9P1P+i7eA4LGSnvuiZF85mdwEvxhKgYAaUD1AYBqzZqAvYz+d/XCSJ6kohWB9Wse
 w3lUo6B03gqEp99dx6SKM1H6N9RuskJ/60YawJQeIUMBMLyb5qqdeFG6ZvElKYBu18Ax
 AEYa9sBZC8p+N0cmZjTH1PQmW0UaQ3oirGfxn2FQpjhT3nJ3DklqTyQZ2+sKl3v79hIP
 vVqg==
X-Gm-Message-State: AOAM531hkkUJ47TQCvFm+rkiXnPG+y+pZ6TK+d0+36ocJ3PLML9f30MF
 53wq4rmWsBnfPlQLsZ6SykvzaXMStUbupQnH
X-Google-Smtp-Source: ABdhPJzcP7lAGXYlXDQ3Ba2L9EzZNnvq0e99BXLKZ1RfXJIlmkFJOf1bT/0OdEjdOYfc74tasFK7rg==
X-Received: by 2002:ac8:4e95:: with SMTP id 21mr7532108qtp.177.1615473601130; 
 Thu, 11 Mar 2021 06:40:01 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/57] TCI fixes and cleanups
Date: Thu, 11 Mar 2021 08:39:01 -0600
Message-Id: <20210311143958.562625-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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

Changes since v4:
  * 19 more patches now upstream.

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


Richard Henderson (57):
  tcg/tci: Remove ifdefs for TCG_TARGET_HAS_ext32[us]_i64
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
  gitlab: Rename ACCEL_CONFIGURE_OPTS to EXTRA_CONFIGURE_OPTS
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
 tcg/tcg.c                                     |   88 +-
 tcg/tci.c                                     | 1517 ++++++++++-------
 tcg/tci/tcg-target.c.inc                      |  704 +++++---
 .gitlab-ci.d/crossbuilds.yml                  |   21 +-
 tcg/tci/README                                |   20 +-
 .../dockerfiles/fedora-i386-cross.docker      |    1 +
 tests/docker/dockerfiles/fedora.docker        |    1 +
 tests/tcg/Makefile.target                     |    6 +-
 21 files changed, 1668 insertions(+), 1004 deletions(-)
 create mode 100644 include/exec/helper-ffi.h
 delete mode 100644 disas/tci.c

-- 
2.25.1


