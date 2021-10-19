Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E62432AF0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 02:04:22 +0200 (CEST)
Received: from localhost ([::1]:50022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mccc8-0007UA-Mt
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 20:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZ7-0004bM-1Z
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:13 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:56177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZ5-0001bs-6u
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:12 -0400
Received: by mail-pj1-x102b.google.com with SMTP id om14so13333411pjb.5
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 17:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C9F9tI/rqlGGF57t6AqXKgYAHw97tLQc+VYqRavmhEc=;
 b=JEW0Dy4ndZ7HwEMq0EcEAjyA1aX9sVg1z5OMXLdulDqTyNbnR6mU5A7Q5gaabxC1gB
 j5W4TN6SBVh4piRbRmfIeTNOtL6RyFFudTD3Iye08R3cdOCbiERopSyEgPgKaeGj/pXI
 avVD6Uuy1wyi5H5NH/9LKb0UvOUsqmJemhPQtPatxA4+yDmoqHdUd9eM1LLyOlUXqvK5
 Kd6PLqvQDwXg/ZYxpuPaPKdXNx4v8JUNvDc202oixW+wddUZ2MYxwKlG4+M28yQ0CQdN
 2OaF6I38fj6OTygI89CdDywJ9MKZ2lNTsOP73opWxUSNVluRf9aNWU9zuzJIIjtKir2g
 5l7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C9F9tI/rqlGGF57t6AqXKgYAHw97tLQc+VYqRavmhEc=;
 b=eShKnrKougYDXiJbCj0E3irToAvE+YhjrXWdQiKwr6hS4E9s+e5IbvWXRE8L22T36B
 g8EDZXgLYreiQPxk1B/3GjN0qPt9BUDQFG8ntKXsxuxbsUDq+K3UTzEShG2uKME8+AlD
 nKFvwSkMFHzNzkXK2/e4qSqNFCsZFJiKRpUX9KRaNUq9WjdS/vQxuC0rU1cHdx0/cm/B
 tnkIWL+d1j93WtRX7Nzq+eoIDaLdBw9UeFQZVFdTY2LNp/q7BuYwH1iYuLPj3kW1z8gB
 s0jKCYsmyoZGhYx9I1cpSJfVsSPRC8D02qloktO8M1n0AyIBLk5v7laltx5Ml4TiQkuv
 OE1Q==
X-Gm-Message-State: AOAM5311P8ePdFUnZWQ7go72WXDyI7/t3P88fH/MsncPXdUwWnxSkdIQ
 /cZA4o6R6SctK1/72wTNRJg8XpycupM=
X-Google-Smtp-Source: ABdhPJxunxaqxuL+JigxudqI5GiCyazRp8mQJ6rTyT2cM5JxfRgOjeBZq1GGJnADOlb7aBZBsVF8rA==
X-Received: by 2002:a17:902:bb94:b0:13c:9113:5652 with SMTP id
 m20-20020a170902bb9400b0013c91135652mr30742474pls.70.1634601669531; 
 Mon, 18 Oct 2021 17:01:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/16] target/riscv: Rationalize XLEN and operand length
Date: Mon, 18 Oct 2021 17:00:52 -0700
Message-Id: <20211019000108.3678724-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a partial patch set attempting to set things in the
right direction for both the UXL and RV128 patch sets.


r~


Changes for v4:
  * Use riscv_csrrw_debug for cpu_dump.
    This fixes the issue that Alistair pointed out wrt the
    MSTATUS.SD bit not being correct in the dump; note that
    gdbstub already uses riscv_csrrw_debug, and so did not
    have a problem.
  * Align the registers in cpu_dump.

Changes for v3:
  * Fix CONFIG_ typo.
  * Fix ctzw typo.
  * Mark get_xlen unused (clang werror)
  * Compute MSTATUS_SD on demand.

Changes for v2:
  * Set mxl/sxl/uxl at reset.
  * Set sxl/uxl in write_mstatus.


Richard Henderson (16):
  target/riscv: Move cpu_get_tb_cpu_state out of line
  target/riscv: Create RISCVMXL enumeration
  target/riscv: Split misa.mxl and misa.ext
  target/riscv: Replace riscv_cpu_is_32bit with riscv_cpu_mxl
  target/riscv: Add MXL/SXL/UXL to TB_FLAGS
  target/riscv: Use REQUIRE_64BIT in amo_check64
  target/riscv: Properly check SEW in amo_op
  target/riscv: Replace is_32bit with get_xl/get_xlen
  target/riscv: Replace DisasContext.w with DisasContext.ol
  target/riscv: Use gen_arith_per_ol for RVM
  target/riscv: Adjust trans_rev8_32 for riscv64
  target/riscv: Use gen_unary_per_ol for RVB
  target/riscv: Use gen_shift*_per_ol for RVB, RVI
  target/riscv: Align gprs and fprs in cpu_dump
  target/riscv: Use riscv_csrrw_debug for cpu_dump
  target/riscv: Compute mstatus.sd on demand

 target/riscv/cpu.h                      |  73 +++-----
 target/riscv/cpu_bits.h                 |   8 +-
 hw/riscv/boot.c                         |   2 +-
 linux-user/elfload.c                    |   2 +-
 linux-user/riscv/cpu_loop.c             |   2 +-
 semihosting/arm-compat-semi.c           |   2 +-
 target/riscv/cpu.c                      | 212 ++++++++++++++----------
 target/riscv/cpu_helper.c               |  92 +++++++++-
 target/riscv/csr.c                      | 104 +++++++-----
 target/riscv/gdbstub.c                  |  10 +-
 target/riscv/machine.c                  |  10 +-
 target/riscv/monitor.c                  |   4 +-
 target/riscv/translate.c                | 174 ++++++++++++++-----
 target/riscv/insn_trans/trans_rvb.c.inc | 140 +++++++++-------
 target/riscv/insn_trans/trans_rvi.c.inc |  44 ++---
 target/riscv/insn_trans/trans_rvm.c.inc |  36 +++-
 target/riscv/insn_trans/trans_rvv.c.inc |  29 ++--
 17 files changed, 590 insertions(+), 354 deletions(-)

-- 
2.25.1


