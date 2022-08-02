Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AE85884D0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 01:41:56 +0200 (CEST)
Received: from localhost ([::1]:56502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ1WN-0005Lw-R7
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 19:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJ1O5-0003EV-Gn
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 19:33:21 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:46623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJ1O2-0007ls-LF
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 19:33:21 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so285942pjf.5
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 16:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=esQ//Au5WJ+tRLUgnJjRoCcWT37iXzjJWjBOyFruxfI=;
 b=EHq8TPD7K7tFU/KiC5uhS76u+o8aAy1kG2c09goPWCmQO/SqNeUH0gnqn2yrNedtt8
 YeUe/INP5voasT/baSu+WWwIawvL24UyrZyp3ZG6ClPZQgAo1JExv3HkbI92cZC4ARDL
 j5oY1P9qaQoJTcbNtaA9COlEaXXAZ21UhJvvocwyGPXe2C9pLAMNEB3C7dkJXi80/1Gv
 YqPsZTsaHHegiQt7CDauzyAK3+Dxg4FaXmCInfsKCVpPn4ptRs0DFCpl1tL86aPJC18s
 Ezin9q6IQDSG+nXFF2XdY94WPubBs6ebQUQiKJr6DmT+ERPAgj5javPsri+/k0t7YmSu
 CwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=esQ//Au5WJ+tRLUgnJjRoCcWT37iXzjJWjBOyFruxfI=;
 b=qWZG7sD2YoRW+mDeIv55DVfvF3QoMQRu9xZiKstXIJVqWWiU+oCbqOKHKyNsj3jlMU
 KkM3bS/WCPff05+pjakcbr+SLAq6YagUddvEJg0eMAUKuLIB9en0/TTtwQBOImtnyhg7
 l4N2tKpnlik92606ohvB2o4lcc2uVQRbn/82W8lD5+1shX7PbKuuWnGtuDAGqC93T/HO
 2W4E2r6c5XbhjZwWv8gVd8iiXNU3Rj7/MS5QNgfHhvO/y7ETGXlhc4sZ45KOdzn3S5VL
 llj3IZI6IE2Txz3POhQSBqKp8CNz933mUc2EiNcLIMUp5194/2gmqBCOCNRwXEm2L6z1
 SEdQ==
X-Gm-Message-State: ACgBeo0l3cwFEWFhuFpJkMDOOlnM+AVu7S+nnOOWzoWbX5jCyht6T2Qt
 TDZ0PhcoemLJVd2jp7sVHCVI29jwpDhICQ==
X-Google-Smtp-Source: AA6agR6+znEvMnOkO57sNauMBGwgvj6p05CqhMKnp8a0MzMaAwD4C0Q+JFY/qtuc2d0oqGcvKZg4yQ==
X-Received: by 2002:a17:903:244c:b0:16e:fa53:a54c with SMTP id
 l12-20020a170903244c00b0016efa53a54cmr8448445pls.46.1659483197256; 
 Tue, 02 Aug 2022 16:33:17 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a170902a50a00b001636d95fe59sm250543plq.172.2022.08.02.16.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 16:33:16 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Heiko Stuebner <heiko@sntech.de>, Atish Patra <atishp@rivosinc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v12 3/6] target/riscv: Add few cache related PMU events
Date: Tue,  2 Aug 2022 16:33:04 -0700
Message-Id: <20220802233307.2106839-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802233307.2106839-1-atishp@rivosinc.com>
References: <20220802233307.2106839-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
index 650574accf0a..c9333cc00389 100644
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
@@ -1183,6 +1185,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
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
@@ -1281,6 +1305,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.25.1


