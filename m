Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43A03F5194
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 21:57:20 +0200 (CEST)
Received: from localhost ([::1]:46666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIG4D-0000DX-SS
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 15:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2g-0005dK-65
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:34 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2e-00030p-Dg
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:33 -0400
Received: by mail-pl1-x636.google.com with SMTP id u15so10781357plg.13
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E7RIwy/OiQ2rOC7rZgxQOSkvjFCJNIxCxQoPAyr0p+g=;
 b=tFnnuHRlpCh1aRXLj6tqJgCn6rFvYMCYJkRK03RAgQtSl2sD5IiwP6l0m/CyAJAbYq
 PBsBBqz6cFN2BHjgsxxG/dizjYOjvm0MsoNeMUu6nLO79P5Pjw1EjMdpTLNc8MoMnqAG
 aUSyDjiwalcQGW2ivTFDMNTPyNONFyQ/LIKBUhEs20b6K1YaCb6Mq29H4D/0g/fPwPD8
 743xTBnqKm+gFcAbNBmOtGOWetH6xGIccPZqKA3MUZdkIuTpY0RQj/Huo8apR1NZzx3/
 FDA1YxzTrv0TiLhrDUUk0I2GCGEV7fuNM5oiFrPsvX6MuRkvt1lNcSRtbUgM5xct1Xcx
 4/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E7RIwy/OiQ2rOC7rZgxQOSkvjFCJNIxCxQoPAyr0p+g=;
 b=WC7b63hI1nCKl1nxr78bJPxkPSHuiq+5m/TZbplVHiGifmYayMGrlnTd9QZn+csw7O
 KaC5tIk4K1zHP5hrQ6C3eS08PtjFENF6pywSySAX4CSedb+Vhksgg2g22qqbk48icGLQ
 rjJdf/aJBHe98xaiE8qfq+S9lHVu74XJMr2uVnVOaRCKMdlNBRdtPDPuPSoujahBR0SR
 ecACMrgUowGKfLn4RqYeXAH/9vSd/cT4+hqkhiSqC6fL/2xdAU6o+oSYS1v76TSv2Yz7
 AUNICjauAHSN/qkguGBrJbhT4oj3JDkPPzP06Jr4BIrX8137NPLKAN/AXpXVLuGImjrn
 ZfAg==
X-Gm-Message-State: AOAM5303Tk19PW8kD2upZIRzAGKxV+xq+lFgM269EXRNiiPYCn7fBYmD
 Yt/X6FJpCpd9NcZrnS10Dn13DwP3WajxFA==
X-Google-Smtp-Source: ABdhPJxtvII/s+WgO/HgJZXBIxEqQuyUc+Vl5otFYP00KbLdNE1REkv15rjdgoA8M9u85ISn7muuLw==
X-Received: by 2002:a17:902:d0ce:b0:12d:c570:370c with SMTP id
 n14-20020a170902d0ce00b0012dc570370cmr30252484pln.40.1629748531029; 
 Mon, 23 Aug 2021 12:55:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/24] target/riscv: Use tcg_constant_*
Date: Mon, 23 Aug 2021 12:55:05 -0700
Message-Id: <20210823195529.560295-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace use of tcg_const_*, which makes a copy into a temp which must
be freed, with direct use of the constant.  Reorg handling of $zero,
with different accessors for source and destination.  Reorg handling
of csrs, passing the actual write_mask instead of a regno.  Use more
helpers for RVH expansion.

Patches lacking review:
  13-target-riscv-Use-extracts-for-sraiw-and-srliw.patch      (new)
  16-target-riscv-Fix-rmw_sip-rmw_vsip-rmw_hsip-vs-wri.patch  (new)
  17-target-riscv-Fix-hgeie-hgeip.patch                       (new)
  20-target-riscv-Use-gen_shift_imm_fn-for-slli_uw.patch
  24-target-riscv-Use-get-dest-_gpr-for-RVV.patch

Changes for v5:
  * Use extract for sraiw, srliw.
  * Fix some broken csr helpers.

Changes for v4:
  * Add a test for division, primarily checking the edge cases.
  * Dropped the greviw patch, since grev has been dropped from Zbb 1.0.0.

Changes for v3:
  * Fix an introduced remainder bug (bin meng),
    and remove one extra movcond from rem/remu.
  * Do not zero DisasContext on allocation (bin meng).

Changes for v2:
  * Retain the requirement to call gen_set_gpr.
  * Add DisasExtend as an argument to get_gpr, and ctx->w as a member
    of DisasContext.  This should help in implementing UXL, where we
    should be able to set ctx->w for all insns, but there is certainly
    more required for that.


r~


Richard Henderson (24):
  target/riscv: Use tcg_constant_*
  tests/tcg/riscv64: Add test for division
  target/riscv: Clean up division helpers
  target/riscv: Add DisasContext to gen_get_gpr, gen_set_gpr
  target/riscv: Introduce DisasExtend and new helpers
  target/riscv: Add DisasExtend to gen_arith*
  target/riscv: Remove gen_arith_div*
  target/riscv: Use gen_arith for mulh and mulhu
  target/riscv: Move gen_* helpers for RVM
  target/riscv: Move gen_* helpers for RVB
  target/riscv: Add DisasExtend to gen_unary
  target/riscv: Use DisasExtend in shift operations
  target/riscv: Use extracts for sraiw and srliw
  target/riscv: Use get_gpr in branches
  target/riscv: Use {get,dest}_gpr for integer load/store
  target/riscv: Fix rmw_sip, rmw_vsip, rmw_hsip vs write-only operation
  target/riscv: Fix hgeie, hgeip
  target/riscv: Reorg csr instructions
  target/riscv: Use {get,dest}_gpr for RVA
  target/riscv: Use gen_shift_imm_fn for slli_uw
  target/riscv: Use {get,dest}_gpr for RVF
  target/riscv: Use {get,dest}_gpr for RVD
  target/riscv: Tidy trans_rvh.c.inc
  target/riscv: Use {get,dest}_gpr for RVV

 target/riscv/helper.h                   |   6 +-
 target/riscv/insn32.decode              |   1 +
 target/riscv/csr.c                      |  49 +-
 target/riscv/op_helper.c                |  18 +-
 target/riscv/translate.c                | 701 ++++++------------------
 tests/tcg/riscv64/test-div.c            |  58 ++
 target/riscv/insn_trans/trans_rva.c.inc |  51 +-
 target/riscv/insn_trans/trans_rvb.c.inc | 366 ++++++++++---
 target/riscv/insn_trans/trans_rvd.c.inc | 127 +++--
 target/riscv/insn_trans/trans_rvf.c.inc | 149 +++--
 target/riscv/insn_trans/trans_rvh.c.inc | 266 ++-------
 target/riscv/insn_trans/trans_rvi.c.inc | 370 +++++++------
 target/riscv/insn_trans/trans_rvm.c.inc | 191 +++++--
 target/riscv/insn_trans/trans_rvv.c.inc | 151 ++---
 tests/tcg/riscv64/Makefile.target       |   5 +
 15 files changed, 1154 insertions(+), 1355 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-div.c
 create mode 100644 tests/tcg/riscv64/Makefile.target

-- 
2.25.1


