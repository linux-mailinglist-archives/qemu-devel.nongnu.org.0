Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16985965FE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 01:28:24 +0200 (CEST)
Received: from localhost ([::1]:48488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO5yy-00005S-0x
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 19:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oO5uI-0002pe-FG
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 19:23:34 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:40650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oO5uF-0007hV-Lq
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 19:23:33 -0400
Received: by mail-pl1-x630.google.com with SMTP id x23so10556896pll.7
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 16:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=vv26pdib1adNyStVwEuJL+bIguhGfeKKu6J55bI+kLI=;
 b=5UHep+Qp8gzdJAHFAF62nKbyJ6BHhLK39hKyGkrAnKwJ22P4CDahcIuN6d44O21lZc
 BV4bfpE93XHaVb3R9EsmKCD/xyb4wnglsfRW0Gg+qjv94NjSIVI/sLQtgqSfcbXeutrr
 C36crq1vqJI/sAOsHf+kyvGwEU1I03vODjSnM6JLwyO2IsFxtR6M1CfFM5lBm8wjn1cL
 rw0htQAdsjyypP2/igbRpHZUuoc1Clx8e7gxlRywVtepubz8TgGoLP3gfkvBSCHekZPx
 hRckaT4s0YuSuiqD51qcORLqm6PGR+T0srn4rL8TCkdjLdhV2QasVgHv5rJv0SAhv8T0
 eMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vv26pdib1adNyStVwEuJL+bIguhGfeKKu6J55bI+kLI=;
 b=COhkeYuyGIisgshLlSA+jwyb+yTcMQWo6mxGAvB1aqwpi+Q7/IeLQkZd6RTTzMJZk5
 ov4JRBu60s92aNjmL8DoGz+b/uxuqmlEINzgd7y50isjPURfZ8ahsqAqL28du1vFVpJk
 2CRJOJ5yjIz3ik2n4GEGFAa4sh8CGu2nrRAGILZcmOmFMJKdD4aQB6cXndDEbSHZwP+1
 wDk+zkkqEs4fGMBwT0zKa2pTAer++ehKnRVi90LBsk549K8ZI6mQNiwQ7Glw2XUXmPE2
 J74WZ++ETGDu8QbXBnxx3ZJOp4QQ8t1LWkXS4LsS+5DnkokTEXlke7V+iVTi9o48YuH+
 M6rQ==
X-Gm-Message-State: ACgBeo0ZU5Jz8f4kqqKFIhJESbOCbvfu7qX/kXVnaxv2saPUYjyUwZG3
 buSkKZAi4mcVOVbPIUu+zGjad8GYCwVtRQ==
X-Google-Smtp-Source: AA6agR6OUjPcb3+bwqXheAplv37xAaoTu3igdNs8DYeYlFAXp4aLfRX73CGfZAYzg5AcsH+z/FBbmw==
X-Received: by 2002:a17:902:ea0d:b0:170:cabd:b28 with SMTP id
 s13-20020a170902ea0d00b00170cabd0b28mr24036565plg.115.1660692209374; 
 Tue, 16 Aug 2022 16:23:29 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a17090a2c4400b001eafa265869sm78608pjm.56.2022.08.16.16.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 16:23:29 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Heiko Stuebner <heiko@sntech.de>, Atish Patra <atishp@rivosinc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v13 3/6] target/riscv: Add few cache related PMU events
Date: Tue, 16 Aug 2022 16:23:18 -0700
Message-Id: <20220816232321.558250-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816232321.558250-1-atishp@rivosinc.com>
References: <20220816232321.558250-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Atish Patra <atish.patra@wdc.com>

Qemu can monitor the following cache related PMU events through
tlb_fill functions.

1. DTLB load/store miss
3. ITLB prefetch miss

Increment the PMU counter in tlb_fill function.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu_helper.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 1e4faa84e839..81948b37dd9a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -21,11 +21,13 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "pmu.h"
 #include "exec/exec-all.h"
 #include "instmap.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
+#include "cpu_bits.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -1188,6 +1190,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     cpu_loop_exit_restore(cs, retaddr);
 }
 
+
+static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType access_type)
+{
+    enum riscv_pmu_event_idx pmu_event_type;
+
+    switch (access_type) {
+    case MMU_INST_FETCH:
+        pmu_event_type = RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS;
+        break;
+    case MMU_DATA_LOAD:
+        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS;
+        break;
+    case MMU_DATA_STORE:
+        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS;
+        break;
+    default:
+        return;
+    }
+
+    riscv_pmu_incr_ctr(cpu, pmu_event_type);
+}
+
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr)
@@ -1286,6 +1310,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.25.1


