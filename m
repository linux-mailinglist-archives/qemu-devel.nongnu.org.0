Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B9E52402E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 00:23:18 +0200 (CEST)
Received: from localhost ([::1]:57814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noujl-0000cB-RD
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 18:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nouNe-0004mM-CM
 for qemu-devel@nongnu.org; Wed, 11 May 2022 18:00:28 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nouNb-0006mw-OI
 for qemu-devel@nongnu.org; Wed, 11 May 2022 18:00:25 -0400
Received: by mail-pl1-x635.google.com with SMTP id c11so3118887plg.13
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 15:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rl/bIy4sIdeQ+LppbeDLoegjUd00vZYCBef7PVEx7x8=;
 b=6XDcJOAhJN+rBrE/zRACmI8IndmffeqKQONoxxv6s3kxsXXU07eqNsYpDj2XyhRAT2
 hGZkS5blQgntJik7IfT9EPLqi2FX2K6Lz50xHbNaIgMcOtSIxCB/k6LBtDgYsjvcvVyM
 PeKRBepTgiBmSo2sG2r9QFoO5ojbbaR+g1g/gC6A+1yDOc6oByiuZ+ONSbU9AVKHTeBJ
 1pATZRKPkDWq6HGkxneOeSdxcQXBn8sMAhnw+GTuGReU4PgB6DknIBLcTY60HwGx/f68
 ivc8KNoXBWmWzOON+3CLmtEnve/cceFmFRhlyf6v6/TYGsBodwTgVHJ8z8s5LlY74Anl
 z+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rl/bIy4sIdeQ+LppbeDLoegjUd00vZYCBef7PVEx7x8=;
 b=UtelxMVpBhHJ6H0AYUoyIJYHs7QUzJhD3ai/mAJOIAS4HI/+rat5GvC9QtL/n3w6H6
 Dn3qXmbUWQpNfZ7pJ/c25e8luvl18mDuKT2HfJ2RpJLoVNSXgMkzUJF/0IJ4ln6rxUUg
 39as0dUt09t6WpZxfp3Dkk+AEL5lE7CkgOTIrJikmbHCNcjzA5DWboGxm2tzRtm5T4j4
 nPkAOREvWNSwys8wqBS8VeyB4oP9hbFE8+aWo1XgKrd/1qNtX+Q0BnqUoqBXUc4egmZf
 PJl/f4Hz4cUdkIafl74EPc34/3P0s0Vese3rnAUh42BZpfM1iCQkitjiL0jFHC2rvoeq
 2j2A==
X-Gm-Message-State: AOAM532k4cjeoS80FlxnLQrqJtlJuB1M3DX7gonXQplAYigh2YQ4GzKd
 M22xm4VOmz47p6pfHYctkUMbyA==
X-Google-Smtp-Source: ABdhPJy2axMEpnhXpcegSt4PRtZLSdgXgs1lzAhGg4dNqS4cRKarIJHwIcsAK+psu1xIhqt4zJ7Ixg==
X-Received: by 2002:a17:902:9884:b0:15f:4eb:8e76 with SMTP id
 s4-20020a170902988400b0015f04eb8e76mr19397445plp.57.1652306422324; 
 Wed, 11 May 2022 15:00:22 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a62e417000000b0050dc762816asm2261303pfh.68.2022.05.11.15.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 15:00:21 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v8 10/12] target/riscv: Add few cache related PMU events
Date: Wed, 11 May 2022 14:59:54 -0700
Message-Id: <20220511215956.2351243-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511215956.2351243-1-atishp@rivosinc.com>
References: <20220511215956.2351243-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x635.google.com
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


