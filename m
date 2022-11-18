Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7286A62F1C6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:48:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxym-00079c-SS; Fri, 18 Nov 2022 04:48:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxyb-00075y-IB
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:06 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxyZ-0001yM-LR
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:01 -0500
Received: by mail-pl1-x629.google.com with SMTP id d20so4089705plr.10
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=FHKYG/6wKj813Fy8VAIjSzu1Y9AXAR7KTA0mb42dl2E=;
 b=HzGb4diEInqjqlTyHonOZvclOqbsNQYphIvQBex7poENrdqPpokwd+m4jKZpC6cye+
 amsOG3/M0lg3001ALlj3OaYR3qOCDvhMZWnx5nfntCcxJV2eHtQT8al8Ijm/2en7bZ33
 mVEs3jekTwum+9cKXVOMTr3CqjPopu5UE0Wca053kwTgoC5wingGzSjCBf4LH0+zikt7
 aSr9hdi2Z43/+9qY5PaSkoxf7wiTVBwNb4olZ2vUtMWCnFjkW4YD90RbdQZxEvDRElMq
 o2HcXqfU3/6tHjIlNJcprtG3PQZle/dB9RvJRd9MI6M0UW0Iu908KjT7dUjJInDPJxev
 R5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FHKYG/6wKj813Fy8VAIjSzu1Y9AXAR7KTA0mb42dl2E=;
 b=wMZA4HRfzvoQ4KaMnyGPXFWnOziUejd9QiNan2TNQaUXqMDKa/uyPraq0JOaySgHqt
 wfF8YGMfBDDlNxWxS4UzB0oka6c2XmSC1bIl0U/ghGL61Olj+PVLW3cCamos8MgiASHW
 HqRsJql8E1ghuah1cq7rfY926pe8r+jNi2W9y4Sr99cKc6v6+vdbg6zd/kiolrBc31bN
 66KC66uI7y78UAQ2ZnXOJCu4U9xGaCgSj32LKjCJTL/S/pVlzudoF4ElQUXjh3fiQaC+
 RemiL+V/Nz41x9rvEwKUw9xjm8FWkqj09fk11To9Gd4BPcMUpFmw/S4DDDINlfG1cEeq
 TJMw==
X-Gm-Message-State: ANoB5pmqMJiHO5F3JASS6FBWK02mpZGDjhVBjY7OJ4Dz+V3W+Tj4+0qv
 HVPLO+lw3afbH7AOYEQC378+yiZaKcNe2w==
X-Google-Smtp-Source: AA0mqf4gst9BgndeCEUI+gyuWf3jj15hQ10SmPQ/3vyMgP418+RN7+u1gNgMtJB91V6CuTaI/QZ9Rw==
X-Received: by 2002:a17:90a:6046:b0:213:1936:e6b1 with SMTP id
 h6-20020a17090a604600b002131936e6b1mr12837903pjm.125.1668764877339; 
 Fri, 18 Nov 2022 01:47:57 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.47.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:47:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 00/29] tcg: Improve atomicity support
Date: Fri, 18 Nov 2022 01:47:25 -0800
Message-Id: <20221118094754.242910-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The main objective here is to support Arm FEAT_LSE2, which says that any
single memory access that does not cross a 16-byte boundary is atomic.
This is the MO_ATOM_WITHIN16 control.

While I'm touching all of this, a secondary objective is to handle the
atomicity of the IBM machines.  Both Power and s390x treat misaligned
accesses as atomic on the lsb of the pointer.  For instance, an 8-byte
access at ptr % 8 == 4 will appear as two atomic 4-byte accesses, and
ptr % 4 == 2 will appear as four 3-byte accesses.
This is the MO_ATOM_SUBALIGN control.

By default, acceses are atomic only if aligned, which is the current
behaviour of the tcg code generator (mostly, anyway, there were bugs).
This is the MO_ATOM_IFALIGN control.

Further, one can say that a large memory access is really a set of
contiguous smaller accesses, and we need not provide more atomicity
than that (modulo MO_ATOM_WITHIN16).  This is the MO_ATMAX_* control.

While I've had a go at documenting all of this, I'm certain it could
be improved -- soliciting suggestions.


r~


Based-on: 20221118091858.242569-1-richard.henderson@linaro.org
("main-loop: Introduce QEMU_IOTHREAD_LOCK_GUARD")
which itself depends on "tcg: Support for Int128 with helpers".

Richard Henderson (29):
  include/qemu/cpuid: Introduce xgetbv_low
  include/exec/memop: Add bits describing atomicity
  accel/tcg: Add cpu_in_serial_context
  accel/tcg: Introduce tlb_read_idx
  accel/tcg: Reorg system mode load helpers
  accel/tcg: Reorg system mode store helpers
  accel/tcg: Honor atomicity of loads
  accel/tcg: Honor atomicity of stores
  tcg/tci: Use cpu_{ld,st}_mmu
  tcg: Unify helper_{be,le}_{ld,st}*
  accel/tcg: Implement helper_{ld,st}*_mmu for user-only
  tcg: Add 128-bit guest memory primitives
  meson: Detect atomic128 support with optimization
  tcg/i386: Add have_atomic16
  include/qemu/int128: Add vector type to Int128Alias
  accel/tcg: Use have_atomic16 in ldst_atomicity.c.inc
  tcg/aarch64: Add have_lse, have_lse2
  accel/tcg: Add aarch64 specific support in ldst_atomicity
  tcg: Introduce TCG_OPF_TYPE_MASK
  tcg: Add INDEX_op_qemu_{ld,st}_i128
  tcg/i386: Introduce tcg_out_mov2
  tcg/i386: Introduce tcg_out_testi
  tcg/i386: Use full load/store helpers in user-only mode
  tcg/i386: Replace is64 with type in qemu_ld/st routines
  tcg/i386: Mark Win64 call-saved vector regs as reserved
  tcg/i386: Examine MemOp for atomicity and alignment
  tcg/i386: Support 128-bit load/store with have_atomic16
  tcg/i386: Add vex_v argument to tcg_out_vex_modrm_pool
  tcg/i386: Honor 64-bit atomicity in 32-bit mode

 accel/tcg/internal.h             |    5 +
 accel/tcg/tcg-runtime.h          |    3 +
 include/exec/cpu-defs.h          |    7 +-
 include/exec/cpu_ldst.h          |   26 +-
 include/exec/memop.h             |   36 +
 include/qemu/cpuid.h             |   25 +
 include/qemu/int128.h            |   10 +-
 include/tcg/tcg-ldst.h           |   70 +-
 include/tcg/tcg-opc.h            |    8 +
 include/tcg/tcg.h                |   22 +-
 tcg/aarch64/tcg-target.h         |    5 +
 tcg/arm/tcg-target.h             |    2 +
 tcg/i386/tcg-target.h            |    4 +
 tcg/loongarch64/tcg-target.h     |    2 +
 tcg/mips/tcg-target.h            |    2 +
 tcg/ppc/tcg-target.h             |    2 +
 tcg/riscv/tcg-target.h           |    2 +
 tcg/s390x/tcg-target.h           |    2 +
 tcg/sparc64/tcg-target.h         |    2 +
 tcg/tci/tcg-target.h             |    2 +
 accel/tcg/cpu-exec-common.c      |    3 +
 accel/tcg/cputlb.c               | 1884 +++++++++++++++++++-----------
 accel/tcg/tb-maint.c             |    2 +-
 accel/tcg/user-exec.c            |  478 +++++---
 tcg/optimize.c                   |   15 +-
 tcg/tcg-op.c                     |  246 ++--
 tcg/tcg.c                        |    8 +-
 tcg/tci.c                        |  127 +-
 util/bufferiszero.c              |    3 +-
 accel/tcg/ldst_atomicity.c.inc   | 1170 +++++++++++++++++++
 docs/devel/loads-stores.rst      |   36 +-
 meson.build                      |   52 +-
 tcg/README                       |   10 +-
 tcg/aarch64/tcg-target.c.inc     |   57 +-
 tcg/arm/tcg-target.c.inc         |   45 +-
 tcg/i386/tcg-target.c.inc        | 1228 +++++++++++++------
 tcg/loongarch64/tcg-target.c.inc |   25 +-
 tcg/mips/tcg-target.c.inc        |   40 +-
 tcg/ppc/tcg-target.c.inc         |   30 +-
 tcg/riscv/tcg-target.c.inc       |   51 +-
 tcg/s390x/tcg-target.c.inc       |   38 +-
 tcg/sparc64/tcg-target.c.inc     |   37 +-
 tcg/tci/tcg-target.c.inc         |    3 +-
 43 files changed, 4145 insertions(+), 1680 deletions(-)
 create mode 100644 accel/tcg/ldst_atomicity.c.inc

-- 
2.34.1


