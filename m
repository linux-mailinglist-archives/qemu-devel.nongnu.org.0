Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FB86EC4F1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:43:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqoxL-0005PS-Fy; Mon, 24 Apr 2023 01:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowy-0005Bx-S0
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:20 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowp-0004Dj-9C
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:19 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2f7a7f9667bso2313963f8f.1
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314866; x=1684906866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7dfGiQBKAXIqxBwrd740S4+peVDG4jIjn+MoYXewMdY=;
 b=uaeGlaglkdcapwbYzoj95n7PAEMsEhH/d6ikHY8YeI6WVWcWjxWc0Wkqr55OdcwCLq
 i3pdFxL8YsuYPDkDJxJK+UZtFa4S8sJVeDThX9vRJvObJ1WT6rZFUyv3M1BCgWtXSI31
 X174F6qKIaZY5Tmi3fgGTIeBcVgVw5ZFZFZbEFWSfM4sUZXlT7Mbh3TIxePKjP1mgYvN
 uEo9gRlMo9gF3x8bYoMcAvlJZkJj/Sn9OD/zSafPT+QQPw1jScIYl6J1uRdRd/8G9bcV
 o3NLVc0Ul9lRR2xdmn/FEvQ0LfCloVZfqiMqCP6tX6I/S70c6G+EaTj6H+4WjtM7hKTb
 yHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314866; x=1684906866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7dfGiQBKAXIqxBwrd740S4+peVDG4jIjn+MoYXewMdY=;
 b=iZQoyTKwOwtBYzKTZQF+HfkdW+4lsbbua+H3YSkbL62uq6rHjk2bmM7vngqQgCizI5
 mde39iFWvpX4v47iQNxSbCnZcLB2yeGvkhUsUpoxdASUcmzXxinRIwPkCZVtjSbbQzXl
 /M9F5727qbxPxUVdmwPfIBm8b+iZOD/mFmAjApv+f2rxugKZyzQZ4eNhckO51dl9hz15
 XveHrv6pqyAWr5lSBIQH60CI5OSkidHJs0XOWZSRLaZFTXhyTVomX0JrpvU+BCzgFJUT
 mOeM26b/qZoQ/YE+ur9qP4fgi5W10XpcRTgLjhcy2CBksPNw2J92X6/0DNko/AeNAFgA
 kvfQ==
X-Gm-Message-State: AAQBX9eoUHre0F/l9oUQhV7oIFz9EreiegriQU63i2+VgyHd8RjmrYUb
 rYl8hJeM4QTGjmIw2cIMbcyZEB6rHH11eI3OehCFEw==
X-Google-Smtp-Source: AKy350ZFx1bdvGvFNqJGbeHnLGtEGmjvdTG0xDaXzNObD9lsZII51eUJakI96aU0UrtZu53QPgQSNQ==
X-Received: by 2002:a5d:46ce:0:b0:2fe:2775:6067 with SMTP id
 g14-20020a5d46ce000000b002fe27756067mr8138395wrs.28.1682314866418; 
 Sun, 23 Apr 2023 22:41:06 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 00/57] tcg: Simplify calls to load/store helpers
Date: Mon, 24 Apr 2023 06:40:08 +0100
Message-Id: <20230424054105.1579315-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

v1: https://lore.kernel.org/qemu-devel/20230408024314.3357414-1-richard.henderson@linaro.org/
v2: https://lore.kernel.org/qemu-devel/20230411010512.5375-1-richard.henderson@linaro.org/

There are several changes to the load/store helpers coming, and making
sure that those changes are properly reflected across all of the backends
was harrowing.

I have gone back and restarted by hoisting the code out of the backends
and into tcg.c.  We already have all of the parameters for the host
function call abi for "normal" helpers, we simply need to apply that to
the load/store slow path.

The major change for v3 is prepare_host_addr(), as a merge of several
routines and some code from tcg_out_qemu_{ld,st}.  This is pulled back
from my (working) atomicity patch set, making i128 easier.

The patches are many, but take heart: the diffstat is -523. :-)
About 1/3 of the patches have been reviewed in some form.


r~


Richard Henderson (57):
  tcg/loongarch64: Conditionalize tcg_out_exts_i32_i64
  tcg/mips: Conditionalize tcg_out_exts_i32_i64
  tcg/i386: Conditionalize tcg_out_extu_i32_i64
  tcg: Introduce tcg_out_movext2
  tcg/i386: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/i386: Generalize multi-part load overlap test
  tcg/i386: Introduce HostAddress
  tcg/i386: Drop r0+r1 local variables from tcg_out_tlb_load
  tcg/i386: Introduce tcg_out_testi
  tcg/i386: Introduce prepare_host_addr
  tcg/i386: Use indexed addressing for softmmu fast path
  tcg/aarch64: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/aarch64: Introduce HostAddress
  tcg/aarch64: Introduce prepare_host_addr
  tcg/arm: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/arm: Introduce HostAddress
  tcg/arm: Introduce prepare_host_addr
  tcg/loongarch64: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/loongarch64: Introduce HostAddress
  tcg/loongarch64: Introduce prepare_host_addr
  tcg/mips: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/mips: Introduce prepare_host_addr
  tcg/ppc: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/ppc: Introduce HostAddress
  tcg/ppc: Introduce prepare_host_addr
  tcg/riscv: Require TCG_TARGET_REG_BITS == 64
  tcg/riscv: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/riscv: Introduce prepare_host_addr
  tcg/s390x: Pass TCGType to tcg_out_qemu_{ld,st}
  tcg/s390x: Introduce HostAddress
  tcg/s390x: Introduce prepare_host_addr
  tcg/sparc64: Drop is_64 test from tcg_out_qemu_ld data return
  tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}
  tcg: Move TCGLabelQemuLdst to tcg.c
  tcg: Replace REG_P with arg_loc_reg_p
  tcg: Introduce arg_slot_stk_ofs
  tcg: Widen helper_*_st[bw]_mmu val arguments
  tcg: Add routines for calling slow-path helpers
  tcg/i386: Convert tcg_out_qemu_ld_slow_path
  tcg/i386: Convert tcg_out_qemu_st_slow_path
  tcg/aarch64: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/arm: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/loongarch64: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/mips: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/ppc: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/riscv: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/s390x: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/loongarch64: Simplify constraints on qemu_ld/st
  tcg/mips: Remove MO_BSWAP handling
  tcg/mips: Reorg tlb load within prepare_host_addr
  tcg/mips: Simplify constraints on qemu_ld/st
  tcg/ppc: Reorg tcg_out_tlb_read
  tcg/ppc: Adjust constraints on qemu_ld/st
  tcg/ppc: Remove unused constraints A, B, C, D
  tcg/riscv: Simplify constraints on qemu_ld/st
  tcg/s390x: Use ALGFR in constructing softmmu host address
  tcg/s390x: Simplify constraints on qemu_ld/st

 include/tcg/tcg-ldst.h               |  10 +-
 tcg/loongarch64/tcg-target-con-set.h |   2 -
 tcg/loongarch64/tcg-target-con-str.h |   1 -
 tcg/mips/tcg-target-con-set.h        |  13 +-
 tcg/mips/tcg-target-con-str.h        |   2 -
 tcg/mips/tcg-target.h                |   4 +-
 tcg/ppc/tcg-target-con-set.h         |  11 +-
 tcg/ppc/tcg-target-con-str.h         |   6 -
 tcg/riscv/tcg-target-con-set.h       |   8 -
 tcg/riscv/tcg-target-con-str.h       |   1 -
 tcg/riscv/tcg-target.h               |  22 +-
 tcg/s390x/tcg-target-con-set.h       |   2 -
 tcg/s390x/tcg-target-con-str.h       |   1 -
 tcg/tcg-internal.h                   |   4 -
 accel/tcg/cputlb.c                   |   6 +-
 tcg/tcg.c                            | 582 +++++++++++++++-
 tcg/aarch64/tcg-target.c.inc         | 363 +++++-----
 tcg/arm/tcg-target.c.inc             | 726 ++++++++------------
 tcg/i386/tcg-target.c.inc            | 707 +++++++++-----------
 tcg/loongarch64/tcg-target.c.inc     | 376 +++++------
 tcg/mips/tcg-target.c.inc            | 946 ++++++++-------------------
 tcg/ppc/tcg-target.c.inc             | 637 ++++++++----------
 tcg/riscv/tcg-target.c.inc           | 508 +++++---------
 tcg/s390x/tcg-target.c.inc           | 393 +++++------
 tcg/sparc64/tcg-target.c.inc         |   8 +-
 tcg/tcg-ldst.c.inc                   |  14 -
 26 files changed, 2415 insertions(+), 2938 deletions(-)

-- 
2.34.1


