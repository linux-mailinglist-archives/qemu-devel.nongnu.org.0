Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB573F326A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 19:46:28 +0200 (CEST)
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH8b5-0008Rw-QR
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 13:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Xp-0005HD-Ig
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:43:05 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Xm-0003lZ-Ib
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:43:04 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 mw10-20020a17090b4d0a00b0017b59213831so2475624pjb.0
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 10:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ERGQYv45viNbqLNcyLp84MnhONr2ziQF+vDzp95nLg=;
 b=F5TKMZfEJmdQ4Eg+uwi0ReWdBaN6scS9yA6eu8+XizKRIz1wlNMazWl9wuBDO9NlI5
 ZAnJH5Aun1+dhsHT8MLqFX8WFGP/uVbLr1RQ/ZCxAWrRxSp2W3nLonUN/vUxyerDh+MS
 uqyRSTUhUtVTywH6IM4nB0gTcBbAkhD8tUHKUKmZPXvzz4mG1n2zWzD+fa0yYIzidwJR
 gv+P4Un3/4RLzJIgB4L9PmEeJ1pcJSrKtGaxtL2AcLyfrpmQdXaFt49baMlfUXewPME1
 D4+QqQ3O4Xugu3JTBCohLdKrzIDTyyw4+nDballfpl5f6BgCqX/WJnYXYC+qZoTscKdP
 schA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ERGQYv45viNbqLNcyLp84MnhONr2ziQF+vDzp95nLg=;
 b=DLYQ/w5EgT+pq0EqrxrDgMVRpX8iewSxKixOzZTefP6ftw12qP0rFyNodpH8BIm0ck
 ZJChxsc2WyEGxzfPmWsY/dCZ7tEorAccj+DTDsVfJerU6AnJUJh0rvzNBHEUFPYlg3K4
 64TMhqEII0gWPJ87qzshXx0OKx8S5UiWYnVPS/u+h4v4itasX73DAG8WixvBwtkt1FDc
 /g0M7rOM4mMEeUVWo7xFTm1IY0QnwHb03alG5M5Mz1WPC1f9icYU/Akm0esu7FulH/H2
 KbtJ41hD8HMMtwQRYKdNnVZ34cluWLTfp6EB0vCxM+rQnoYR26A7kudGE1jzI9ndGLIS
 TK3A==
X-Gm-Message-State: AOAM533lhT7oVPwjuiI6t2h0t8qMj4tM3KIEKAFowvt6xFfK9U8GvXUO
 TqXpK1YX+JdzCC4iIbmycjOCvqueTCn/Vg==
X-Google-Smtp-Source: ABdhPJybsPoylQvO4Im3tgREZd0jFj5wIuta07oiEogeSFFil49Q1Bd/V3Ko+nuP2OUswBYlVZlsyg==
X-Received: by 2002:a17:903:3109:b029:12d:3160:a815 with SMTP id
 w9-20020a1709033109b029012d3160a815mr16849492plc.45.1629481381043; 
 Fri, 20 Aug 2021 10:43:01 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/21] target/riscv: Use tcg_constant_*
Date: Fri, 20 Aug 2021 07:42:36 -1000
Message-Id: <20210820174257.548286-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
  02-tests-tcg-riscv64-Add-test-for-division.patch
  03-target-riscv-Clean-up-division-helpers.patch
  11-target-riscv-Add-DisasExtend-to-gen_unary.patch
  17-target-riscv-Use-gen_shift_imm_fn-for-slli_uw.patch
  21-target-riscv-Use-get-dest-_gpr-for-RVV.patch

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


Richard Henderson (21):
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
  target/riscv: Use get_gpr in branches
  target/riscv: Use {get,dest}_gpr for integer load/store
  target/riscv: Reorg csr instructions
  target/riscv: Use {get,dest}_gpr for RVA
  target/riscv: Use gen_shift_imm_fn for slli_uw
  target/riscv: Use {get,dest}_gpr for RVF
  target/riscv: Use {get,dest}_gpr for RVD
  target/riscv: Tidy trans_rvh.c.inc
  target/riscv: Use {get,dest}_gpr for RVV

 target/riscv/helper.h                   |   6 +-
 target/riscv/insn32.decode              |   1 +
 target/riscv/op_helper.c                |  18 +-
 target/riscv/translate.c                | 701 ++++++------------------
 tests/tcg/riscv64/test-div.c            |  58 ++
 target/riscv/insn_trans/trans_rva.c.inc |  51 +-
 target/riscv/insn_trans/trans_rvb.c.inc | 370 ++++++++++---
 target/riscv/insn_trans/trans_rvd.c.inc | 127 +++--
 target/riscv/insn_trans/trans_rvf.c.inc | 149 +++--
 target/riscv/insn_trans/trans_rvh.c.inc | 266 ++-------
 target/riscv/insn_trans/trans_rvi.c.inc | 360 ++++++------
 target/riscv/insn_trans/trans_rvm.c.inc | 191 +++++--
 target/riscv/insn_trans/trans_rvv.c.inc | 151 ++---
 tests/tcg/riscv64/Makefile.target       |   5 +
 14 files changed, 1125 insertions(+), 1329 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-div.c
 create mode 100644 tests/tcg/riscv64/Makefile.target

-- 
2.25.1


