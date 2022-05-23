Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CA4531F92
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 02:08:28 +0200 (CEST)
Received: from localhost ([::1]:56694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntI67-0003tx-MN
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 20:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ntHpv-0004bn-Ce
 for qemu-devel@nongnu.org; Mon, 23 May 2022 19:51:43 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ntHps-0000QM-Nd
 for qemu-devel@nongnu.org; Mon, 23 May 2022 19:51:43 -0400
Received: by mail-pf1-x431.google.com with SMTP id w200so14992722pfc.10
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 16:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rl/bIy4sIdeQ+LppbeDLoegjUd00vZYCBef7PVEx7x8=;
 b=sMMBV9W/fa0y64jfk+4WtDUmnTcJzT/EgZcubni9z4GWmWQYH+lA3OuLkM/2JZbFIm
 f/XV11wGVlk5JM+JCIWr4fzNZfYP57OYuU/WQPKSnY2Yj1NzLUf91v7QD7eoukzDtfF1
 3QbGQEHHRokIuILsIjIGrm6+mIns+OER21XvpMcl9662uEkP68WxM43J2L+cdL77BXL7
 Bjm0of4Dpr4b6mspH8iHJ45C+Dt1EUr+iUAJ3JXnxpQmB8RUs9GrRMDNKOcm+CAdeHa1
 I033D6n7x1GedNxqMiA13ELA5krU8NCAZzZgRQrkUY1JEbd6TuymYZrC7aN2MxXG/srt
 F+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rl/bIy4sIdeQ+LppbeDLoegjUd00vZYCBef7PVEx7x8=;
 b=rTDcgDJOKT2bjYS3R3GKu3kjeKyxZEAIl7vzumrZ4c99lWYhOIbDqO2Fit3m3xqJuo
 lz5VJiqyTHE7NxNP+ts8x9Uui5t+bvdgNMLcMsYdQeYTACX2wnCPFyKu3KvuPg+Hin7J
 /FfNXMUjttY53Z+FCrhe+Lu+PruRlnIP5g24JGqVTUiCRJHFSzsMCJ5E+0kfy+AAfrI2
 p1jYFo4tWEq/wHRpc6m3mPqS4KA0J0BhMyfqktq+gGXqEAX3BYucvomI3ky3rui694kx
 nOhtduax/uj0bMYcyzlWB/hW50TJi83K6UoPRRfi+or23H98Kt1j0pLjuy8P9SVtYmwU
 UAQQ==
X-Gm-Message-State: AOAM530IQjCJRhUEFIFm13iHUowZsC8fxg3wiXOEJRqovprDq3/l9nP+
 cbBVzKs1VKE6XRVZa0oV5IuFvg==
X-Google-Smtp-Source: ABdhPJye6cnpZrbyV6ZTK5yoXxhp37OeSpLvnn+M4BhP7JS+U61bhMRsDiz0iLb9bRCF7pNcmnaNgw==
X-Received: by 2002:a63:1d12:0:b0:3f6:3a64:7594 with SMTP id
 d18-20020a631d12000000b003f63a647594mr21014301pgd.294.1653349899436; 
 Mon, 23 May 2022 16:51:39 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 pl15-20020a17090b268f00b001df4b919937sm257084pjb.16.2022.05.23.16.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 16:51:38 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v9 10/12] target/riscv: Add few cache related PMU events
Date: Mon, 23 May 2022 16:50:55 -0700
Message-Id: <20220523235057.123882-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523235057.123882-1-atishp@rivosinc.com>
References: <20220523235057.123882-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x431.google.com
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
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu_helper.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e1aa4f2097c1..004cef0febad 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -21,10 +21,12 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "pmu.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
+#include "cpu_bits.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -1178,6 +1180,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
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
@@ -1274,6 +1298,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.25.1


