Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAE34343E1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 05:27:15 +0200 (CEST)
Received: from localhost ([::1]:49316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md2G2-0007GZ-NB
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 23:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26P-0006fW-7H
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:17:17 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26L-0000wm-25
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:17:16 -0400
Received: by mail-pg1-x534.google.com with SMTP id r2so21230991pgl.10
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 20:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NFxpn2R0k5C60j5k65WXwQSMBvI9nKjCadLREfX3z84=;
 b=qeaVne62wE4WzWwlVTv8weO0PKpjJQb7jYn34OfoyGQZ5ohArNhljFa8gWa1E/El2A
 8IWGqrwtCVSHrhFFdvplQJwBEslYWvZ6yaozBcJZCAvmWwfC8xKKjtI+Tf/RBTKg2TPN
 sSIFWFeCMqpACUZc2c8HiprM7k/iPXSWeA2mwzmEXAxemPZdj+i64D3XspmlRIGIgkG9
 mJ3CJyW2/jVOG/eSbwG2WX5es3wIwx/mcyrtWKPGrJ5w5miMwYderi0raaRsLGWe3+tZ
 5aPlEljWRBgT/Rs7JVNx8YxkZdd3lvzAvKepiKrlU60YCw5QauYuSaY+k5MjPkpB8oBD
 KXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NFxpn2R0k5C60j5k65WXwQSMBvI9nKjCadLREfX3z84=;
 b=ZOaAK+36khhpUqwc61LrUR4ox/Xkj06ba7EAuTaglgRwVfZQpmPERyMH0J35YHTvi/
 VcAjjpCFYQ9j2ht0f+70Jwq8RmvqOKr7CWl+x5tHkiC66fwBum1LCxNLnYZzVKCxssPN
 Bc1wrCX64b2Q5KBbNmkYS7gmawPJo0Vo9PqsxyrTIcmDUFgkHPQJz7mR609KyJXxd7Vo
 mMryc8WFAjR24BJkgQZNoML7Ejt1FJM30WKE3Fx75Bc+Xgv8ksxgWSFJb3PvtLX2VpLl
 vh99tCzcY6mvDCeeA1QCBZX2T3soIi3rTRId9fvWqclBT4c7eT7ROBOfkL49+M7DPue1
 tiWA==
X-Gm-Message-State: AOAM531uc8QW2vARE3khIHtBvPOpCWYcKwCKGWDT++Qau2OlpJwgbOMi
 5VmgrsQB7flp4rYNdsXhtCaT8qtsq+G+wg==
X-Google-Smtp-Source: ABdhPJzPz7+abLUWx3VdJYQCy/zUL7ZvhneQ/gnig6HRUmGDKfemeWIT7BFlYxBCWg623fVXmca5Fw==
X-Received: by 2002:a63:2a92:: with SMTP id
 q140mr31818693pgq.412.1634699831067; 
 Tue, 19 Oct 2021 20:17:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c8sm505364pjr.38.2021.10.19.20.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:17:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/15] target/riscv: Rationalize XLEN and operand length
Date: Tue, 19 Oct 2021 20:16:54 -0700
Message-Id: <20211020031709.359469-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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


Changes for v6:
  * Rebase on riscv-to-apply.next.

Changes for v5:
  * Fix cpu_dump, which asserted for -accel qtest.
    Instead of filtering CSRs explicitly in cpu_dump,
    let the riscv_csr_operations predicate do the job.
    This means we won't dump S-mode registers when RVS
    is not enabled, much like we currently filter on RVH.

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


Richard Henderson (15):
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
  target/riscv: Use riscv_csrrw_debug for cpu_dump
  target/riscv: Compute mstatus.sd on demand

 target/riscv/cpu.h                      |  73 +++------
 target/riscv/cpu_bits.h                 |   8 +-
 hw/riscv/boot.c                         |   2 +-
 linux-user/elfload.c                    |   2 +-
 linux-user/riscv/cpu_loop.c             |   2 +-
 semihosting/arm-compat-semi.c           |   2 +-
 target/riscv/cpu.c                      | 195 +++++++++++++-----------
 target/riscv/cpu_helper.c               |  92 ++++++++++-
 target/riscv/csr.c                      | 104 ++++++++-----
 target/riscv/gdbstub.c                  |  10 +-
 target/riscv/machine.c                  |  10 +-
 target/riscv/monitor.c                  |   4 +-
 target/riscv/translate.c                | 174 +++++++++++++++------
 target/riscv/insn_trans/trans_rvb.c.inc | 140 +++++++++--------
 target/riscv/insn_trans/trans_rvi.c.inc |  44 +++---
 target/riscv/insn_trans/trans_rvm.c.inc |  36 ++++-
 target/riscv/insn_trans/trans_rvv.c.inc |  29 ++--
 17 files changed, 576 insertions(+), 351 deletions(-)

-- 
2.25.1


