Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968AC3542E7
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:38:08 +0200 (CEST)
Received: from localhost ([::1]:36676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQMh-0005Pj-J6
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHA-0001Ba-Rh
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:24 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQH6-0001iQ-W8
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:24 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so7681086wml.2
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ne5CzDA1fzWbf8pAEALTVl8gNjy5JmBvAw+Zn97Dbag=;
 b=Y001oOET/ZEpsWRX8bYsjhIPELmaJOjpOTvd7nnwlROIIlwb+9yzpjh0mRA5KKXfzs
 LBtk2zNjPMvYMaNfZaITaVPTx4OVzle/8overCG+ClGxiBbzf2DUtuug5iYF8b2A+yzg
 j0RVCPS8xVM6GNJlmwBVP9tIfr7FtcR2OPzI+oxsmurEYmT2z2aef7JFAfSj+Rk1OYTU
 YYtb1N28KdtB/5WiFeOdBPO1AFi+eRa2Jahn8cRmA3zWCHKPepb6uVEwkqpmgvwBuYvM
 ZI8MsUwXH+b+JDZMCMpSl3j0ixyAbp2etsrmOHPGL7V6/sMZiG0a5mkB8eVJZuxxZaTT
 ZiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ne5CzDA1fzWbf8pAEALTVl8gNjy5JmBvAw+Zn97Dbag=;
 b=BtZlGhoKLQwK1yEXqEmu3stjJzxI4CKY/OGeiwQxFWzhX1QOZnGCQGWkg06WtztFaZ
 9sge6VsXje7cF0qRpW6sTZU2bnT8ydtWBhK+4niWiaASF3HT0q29UoPdKzIDUSQeA+Im
 uWIrp+E9TYjys86t3pwwVTwurOtuZdibU/vbopEkmS/Jqw29trakcjwlGPVv5pAbrYsF
 iPjn97/KGMwM1WB7yoJXI6LXxVJTlcZYwL4dLxWwiAVvHD3x2qo69G795fcuy3Btk9id
 9ilfGkewEeUOPctXhGEwQeKQWsBipeA4WxbO82jNthRQBeQoCVHr9AAN8uCPDx4hxPok
 p4QQ==
X-Gm-Message-State: AOAM532rPl35gs1m+VFpeZts+uWEfdYcvbTAl7GbTPU3B9Uxi/f+Vd2W
 BkXVuB2MTALjDP34RZxZ9OFWfY+XlJwuoA==
X-Google-Smtp-Source: ABdhPJzQgxF36aZZUz862dTSqloZGTmfWWNb4eayoTHMI3T8m9KOAJNZli5j0BamqzFpvb42cLynEA==
X-Received: by 2002:a1c:b0c4:: with SMTP id z187mr24906136wme.81.1617633137910; 
 Mon, 05 Apr 2021 07:32:17 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:17 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 10/27] arc: Add memory management unit (MMU) support
Date: Mon,  5 Apr 2021 15:31:21 +0100
Message-Id: <20210405143138.17016-11-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cupertino Miranda <cmiranda@synopsys.com>

Add Synopsys ARC MMU version 4 support. The implementation is
restricted to 8K page size support.

Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
---
 target/arc/mmu.c | 805 +++++++++++++++++++++++++++++++++++++++++++++++
 target/arc/mmu.h | 148 +++++++++
 2 files changed, 953 insertions(+)
 create mode 100644 target/arc/mmu.c
 create mode 100644 target/arc/mmu.h

diff --git a/target/arc/mmu.c b/target/arc/mmu.c
new file mode 100644
index 0000000000..f79c910d80
--- /dev/null
+++ b/target/arc/mmu.c
@@ -0,0 +1,805 @@
+/*
+ * QEMU ARC CPU
+ *
+ * Copyright (c) 2020 Synppsys Inc.
+ * Contributed by Cupertino Miranda <cmiranda@synopsys.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * http://www.gnu.org/licenses/lgpl-2.1.html
+ */
+
+#include "qemu/osdep.h"
+#include "mmu.h"
+#include "target/arc/regs.h"
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+
+target_ulong
+arc_mmu_aux_get(const struct arc_aux_reg_detail *aux_reg_detail, void *data)
+{
+    CPUARCState *env = (CPUARCState *) data;
+    struct arc_mmu *mmu = &env->mmu;
+    uint32_t reg = 0;
+
+    switch (aux_reg_detail->id) {
+    case AUX_ID_mmu_build:
+        /*
+         * For now hardcode the TLB geometry and canonical page sizes
+         * MMUv4: 2M Super Page, 8k Page, 4 way set associative,
+         *        1K entries (256x4), 4 uITLB, 8 uDTLB
+         */
+        reg = 0x04e21a4a;
+        break;
+    case AUX_ID_tlbindex:
+        reg = mmu->tlbindex;
+        break;
+    case AUX_ID_tlbpd0:
+        reg = mmu->tlbpd0;
+        break;
+    case AUX_ID_tlbpd1:
+        reg = mmu->tlbpd1;
+        break;
+    case AUX_ID_tlbpd1_hi:
+        reg = mmu->tlbpd1_hi;
+        break;
+    case AUX_ID_scratch_data0:
+        reg = mmu->scratch_data0;
+        break;
+    case AUX_ID_tlbcommand:
+        reg = mmu->tlbcmd;
+        break;
+    case AUX_ID_pid:
+        reg = (mmu->enabled << 31) | mmu->pid_asid;
+        break;
+    case AUX_ID_sasid0:
+        reg = mmu->sasid0;
+        break;
+    case AUX_ID_sasid1:
+        reg = mmu->sasid1;
+        break;
+    default:
+        break;
+    }
+
+    return reg;
+}
+
+void
+arc_mmu_aux_set(const struct arc_aux_reg_detail *aux_reg_detail,
+                target_ulong val, void *data)
+{
+    CPUARCState *env = (CPUARCState *) data;
+    CPUState *cs = env_cpu(env);
+    struct arc_mmu *mmu = &env->mmu;
+
+    switch (aux_reg_detail->id) {
+    /* AUX_ID_tlbcommand is more involved and handled seperately */
+    case AUX_ID_tlbindex:
+        mmu->tlbindex = val;
+        break;
+    case AUX_ID_tlbpd0:
+        mmu->tlbpd0 = val;
+        break;
+    case AUX_ID_tlbpd1:
+        mmu->tlbpd1 = val;
+        break;
+    case AUX_ID_tlbpd1_hi:
+        mmu->tlbpd1_hi = val;
+        break;
+    case AUX_ID_scratch_data0:
+        mmu->scratch_data0 = val;
+        break;
+    case AUX_ID_pid:
+        qemu_log_mask(CPU_LOG_MMU,
+                      "[MMU] Writing PID_ASID with value 0x" TARGET_FMT_lx
+                      " at 0x" TARGET_FMT_lx "\n",
+                      val, env->pc);
+        mmu->enabled = (val >> 31);
+        mmu->pid_asid = val & 0xff;
+        tlb_flush(cs);
+        break;
+    case AUX_ID_sasid0:
+        mmu->sasid0 = val;
+        break;
+    case AUX_ID_sasid1:
+        mmu->sasid1 = val;
+        break;
+    default:
+        break;
+    }
+}
+
+/* vaddr can't have top bit */
+#define VPN(addr) ((addr) & (PAGE_MASK & (~0x80000000)))
+#define PFN(addr) ((addr) & PAGE_MASK)
+
+static void
+arc_mmu_debug_tlb_for_set(CPUARCState *env, int set)
+{
+    int j;
+    bool set_printed = false;
+
+    for (j = 0; j < N_WAYS; j++) {
+        struct arc_tlb_e *tlb = &env->mmu.nTLB[set][j];
+
+        if ((tlb->pd0 & PD0_V) != 0) {
+            if (set_printed == false) {
+                printf("set %d\n", set);
+                set_printed = true;
+            }
+            if (set_printed == true) {
+                printf(" way %d\n", j);
+            }
+            printf("  tlppd0: %08x: vaddr=\t%08x %s %s%s asid=%02x\n",
+                   tlb->pd0, VPN(tlb->pd0),
+                   (char *) ((tlb->pd0 & PD0_SZ) != 0 ? "sz1" : "sz0"),
+                   (char *) ((tlb->pd0 & PD0_V) != 0 ? "V" : ""),
+                   (char *) ((tlb->pd0 & PD0_G) != 0 ? "g" : ""),
+                   tlb->pd0 & PD0_ASID);
+
+            printf("  tlppd1: %08x: paddr=\t%08x k:%s%s%s u:%s%s%s f:%s\n",
+                   (unsigned int) tlb->pd1, (unsigned int) PFN(tlb->pd1),
+                   (char *) ((tlb->pd1 & PD1_RK) != 0 ? "R" : "r"),
+                   (char *) ((tlb->pd1 & PD1_WK) != 0 ? "W" : "w"),
+                   (char *) ((tlb->pd1 & PD1_XK) != 0 ? "X" : "x"),
+                   (char *) ((tlb->pd1 & PD1_RU) != 0 ? "R" : "r"),
+                   (char *) ((tlb->pd1 & PD1_WU) != 0 ? "W" : "w"),
+                   (char *) ((tlb->pd1 & PD1_XU) != 0 ? "X" : "x"),
+                   (char *) ((tlb->pd1 & PD1_FC) != 0 ? "C" : "c"));
+        }
+    }
+}
+
+void
+arc_mmu_debug_tlb(CPUARCState *env)
+{
+    int i;
+
+    for (i = 0; i < N_SETS; i++) {
+        arc_mmu_debug_tlb_for_set(env, i);
+    }
+}
+
+void
+arc_mmu_debug_tlb_for_vaddr(CPUARCState *env, uint32_t vaddr)
+{
+    uint32_t set = (vaddr >> PAGE_SHIFT) & (N_SETS - 1);
+    arc_mmu_debug_tlb_for_set(env, set);
+}
+
+
+static struct arc_tlb_e *
+arc_mmu_get_tlb_at_index(uint32_t index, struct arc_mmu *mmu)
+{
+    uint32_t set = index / N_WAYS;
+    uint32_t bank = index % N_WAYS;
+    return &mmu->nTLB[set][bank];
+}
+
+static inline bool
+match_sasid(struct arc_tlb_e *tlb, struct arc_mmu *mmu)
+{
+    /* Match to a shared library. */
+    uint8_t position = tlb->pd0 & PD0_ASID_MATCH;
+    uint64_t pos = 1ULL << position;
+    uint64_t sasid = ((uint64_t) mmu->sasid1 << 32) | mmu->sasid0;
+    if ((pos & sasid) == 0) {
+        return false;
+    }
+    return true;
+}
+
+static struct arc_tlb_e *
+arc_mmu_lookup_tlb(uint32_t vaddr, uint32_t compare_mask, struct arc_mmu *mmu,
+                   int *num_finds, uint32_t *index)
+{
+    struct arc_tlb_e *ret = NULL;
+    uint32_t set = (vaddr >> PAGE_SHIFT) & (N_SETS - 1);
+    struct arc_tlb_e *tlb = &mmu->nTLB[set][0];
+    int w;
+
+    if (num_finds != NULL) {
+        *num_finds = 0;
+    }
+
+    bool general_match = true;
+    for (w = 0; w < N_WAYS; w++, tlb++) {
+        uint32_t match = vaddr & compare_mask;
+        uint32_t final_compare_mask = compare_mask;
+
+        if ((tlb->pd0 & PD0_G) == 0) {
+            if ((tlb->pd0 & PD0_S) != 0) {
+                /* Match to a shared library. */
+                if (match_sasid(tlb, mmu) == false) {
+                    general_match = false;
+                }
+            } else {
+                /* Match to a process. */
+                match |= mmu->pid_asid & PD0_PID_MATCH;
+                final_compare_mask |= PD0_PID_MATCH;
+            }
+        }
+
+        if (match == (tlb->pd0 & final_compare_mask) && general_match) {
+            ret = tlb;
+            if (num_finds != NULL) {
+                *num_finds += 1;
+            }
+            if (index != NULL) {
+                *index = (set * N_WAYS) + w;
+            }
+        }
+    }
+
+    if (ret == NULL) {
+        uint32_t way = mmu->way_sel[set];
+        ret = &mmu->nTLB[set][way];
+
+        /* TODO: Replace by something more significant. */
+        if (index != NULL) {
+            *index = (set * N_WAYS) + way;
+        }
+
+        mmu->way_sel[set] = (mmu->way_sel[set] + 1) & (N_WAYS - 1);
+    }
+
+    return ret;
+}
+
+/*
+ * TLB Insert/Delete triggered by writing the cmd to TLBCommand Aux
+ *  - Requires PD0 and PD1 be setup apriori
+ */
+void
+arc_mmu_aux_set_tlbcmd(const struct arc_aux_reg_detail *aux_reg_detail,
+                       target_ulong val, void *data)
+{
+    CPUARCState *env = (CPUARCState *) data;
+    CPUState *cs = env_cpu(env);
+    struct arc_mmu *mmu = &env->mmu;
+    uint32_t pd0 = mmu->tlbpd0;
+    uint32_t pd1 = mmu->tlbpd1;
+    int num_finds = 4;
+    uint32_t index;
+    struct arc_tlb_e *tlb;
+
+    mmu->tlbcmd = val;
+    uint32_t matching_mask = (PD0_VPN | PD0_SZ | PD0_G | PD0_S | PD0_ASID);
+
+    if ((pd0 & PD0_G) != 0) {
+        /*
+         * When Global do not check for asid match.
+         */
+        matching_mask &= ~(PD0_S | PD0_ASID);
+    }
+
+    /*
+     * NOTE: Write and WriteNI commands are the same because we do not model
+     * uTLBs in QEMU.
+     */
+    if (val == TLB_CMD_WRITE || val == TLB_CMD_WRITENI) {
+        /*
+         * TODO: Include index verification. We are always clearing the index as
+         * we assume it is always valid.
+         */
+        tlb = arc_mmu_get_tlb_at_index(mmu->tlbindex & TLBINDEX_INDEX, mmu);
+        tlb->pd0 = mmu->tlbpd0;
+        tlb->pd1 = mmu->tlbpd1;
+
+        /*
+         * don't try to optimize this: upon ASID rollover the entire TLB is
+         * unconditionally flushed for any ASID
+         */
+        tlb_flush(cs);
+    }
+    if (val == TLB_CMD_READ) {
+        /*
+         * TODO: Include index verification. We are always clearing the index as
+         * we assume it is always valid.
+         */
+
+        tlb = arc_mmu_get_tlb_at_index(mmu->tlbindex & TLBINDEX_INDEX, mmu);
+        mmu->tlbpd0 = tlb->pd0;
+        mmu->tlbpd1 = tlb->pd1;
+
+        mmu->tlbindex &= ~(TLBINDEX_E | TLBINDEX_RC);
+    }
+    if (val == TLB_CMD_DELETE || val == TLB_CMD_INSERT) {
+        tlb_flush_page_by_mmuidx(cs, VPN(pd0), 3);
+
+        if ((pd0 & PD0_G) != 0) {
+            /*
+             * When Global do not check for asid match.
+             */
+            matching_mask &= ~(PD0_S | PD0_ASID);
+        }
+
+        matching_mask &= (VPN(PD0_VPN) | (~PD0_VPN)) ;
+        tlb = arc_mmu_lookup_tlb(pd0,
+                                 matching_mask | PD0_V,
+                                 &env->mmu, &num_finds, &index);
+
+        if (num_finds == 0) {
+            mmu->tlbindex = 0x80000000; /* No entry to delete */
+        } else if (num_finds == 1) {
+            mmu->tlbindex = index; /* Entry is deleted set index */
+            tlb->pd0 &= ~PD0_V;
+            num_finds--;
+            qemu_log_mask(CPU_LOG_MMU,
+                          "[MMU] Delete at 0x" TARGET_FMT_lx
+                          ", pd0 = 0x%08x, pd1 = 0x%08x\n",
+                          env->pc, tlb->pd0, tlb->pd1);
+        } else {
+            while (num_finds > 0) {
+                tlb->pd0 &= ~PD0_V;
+                qemu_log_mask(CPU_LOG_MMU,
+                              "[MMU] Delete at 0x" TARGET_FMT_lx
+                              ", pd0 = 0x%08x, pd1 = 0x%08x\n",
+                              env->pc, tlb->pd0, tlb->pd1);
+                tlb = arc_mmu_lookup_tlb(pd0,
+                                         (VPN(PD0_VPN) | PD0_V
+                                          | PD0_SZ | PD0_G | PD0_S),
+                                         mmu, &num_finds, NULL);
+            }
+        }
+    }
+
+    if (val == TLB_CMD_INSERT) {
+        if ((pd0 & PD0_V) == 0) {
+            mmu->tlbindex = 0x80000000;
+        } else {
+            tlb->pd0 = pd0;
+            tlb->pd1 = pd1;
+
+            /* Set index for latest inserted element. */
+            mmu->tlbindex |= index;
+
+            /* TODO: More verifications needed. */
+
+            qemu_log_mask(CPU_LOG_MMU,
+                          "[MMU] Insert at 0x" TARGET_FMT_lx
+                          ", PID = %d, VPN = 0x%08x, "
+                          "PFN = 0x%08x, pd0 = 0x%08x, pd1 = 0x%08x\n",
+                          env->pc,
+                          pd0 & 0xff,
+                          VPN(pd0), PFN(pd1),
+                          pd0, pd1);
+        }
+    }
+
+    /* NOTE: We do not implement IVUTLB as we do not model uTLBs. */
+    assert(val == TLB_CMD_INSERT
+           || val == TLB_CMD_DELETE
+           || val == TLB_CMD_WRITE
+           || val == TLB_CMD_READ
+           || val == TLB_CMD_WRITENI
+           || val == TLB_CMD_IVUTLB
+           );
+}
+
+/* Function to verify if we have permission to use MMU TLB entry. */
+static bool
+arc_mmu_have_permission(CPUARCState *env,
+                        struct arc_tlb_e *tlb,
+                        enum mmu_access_type type)
+{
+    bool ret = false;
+    /* Read status for user mode. */
+    bool in_kernel_mode = !GET_STATUS_BIT(env->stat, Uf);
+    switch (type) {
+    case MMU_MEM_READ:
+        ret = in_kernel_mode ? tlb->pd1 & PD1_RK : tlb->pd1 & PD1_RU;
+        break;
+    case MMU_MEM_WRITE:
+        ret = in_kernel_mode ? tlb->pd1 & PD1_WK : tlb->pd1 & PD1_WU;
+        break;
+    case MMU_MEM_FETCH:
+        ret = in_kernel_mode ? tlb->pd1 & PD1_XK : tlb->pd1 & PD1_XU;
+        break;
+    case MMU_MEM_ATTOMIC:
+        ret = in_kernel_mode ? tlb->pd1 & PD1_RK : tlb->pd1 & PD1_RU;
+        ret = ret & (in_kernel_mode ? tlb->pd1 & PD1_WK : tlb->pd1 & PD1_WU);
+        break;
+    case MMU_MEM_IRRELEVANT_TYPE:
+        ret = true;
+        break;
+    }
+
+    return ret;
+}
+
+#define SET_MMU_EXCEPTION(ENV, N, C, P) { \
+  ENV->mmu.exception.number = N; \
+  ENV->mmu.exception.causecode = C; \
+  ENV->mmu.exception.parameter = P; \
+}
+
+/* Translation function to get physical address from virtual address. */
+static uint32_t
+arc_mmu_translate(struct CPUARCState *env,
+                  uint32_t vaddr, enum mmu_access_type rwe,
+                  uint32_t *index)
+{
+    struct arc_mmu *mmu = &(env->mmu);
+    struct arc_tlb_e *tlb = NULL;
+    int num_matching_tlb = 0;
+
+    SET_MMU_EXCEPTION(env, EXCP_NO_EXCEPTION, 0, 0);
+
+    if (rwe != MMU_MEM_IRRELEVANT_TYPE
+        && GET_STATUS_BIT(env->stat, Uf) != 0 && vaddr >= 0x80000000) {
+        goto protv_exception;
+    }
+
+    /*
+     * Check that we are not addressing an address above 0x80000000.
+     * Return the same address in that case.
+     */
+    if ((vaddr >= 0x80000000) || mmu->enabled == false) {
+        return vaddr;
+    }
+
+    if (rwe != MMU_MEM_IRRELEVANT_TYPE) {
+        qemu_log_mask(CPU_LOG_MMU,
+                      "[MMU] Translate at 0x" TARGET_FMT_lx
+                      ", vaddr 0x%08x, pid %d, rwe = %s\n",
+                      env->pc, vaddr, mmu->pid_asid, RWE_STRING(rwe));
+    }
+
+    uint32_t match_pd0 = (VPN(vaddr) | PD0_V);
+    tlb = arc_mmu_lookup_tlb(match_pd0, (VPN(PD0_VPN) | PD0_V), mmu,
+                              &num_matching_tlb, index);
+
+    /*
+     * Check for multiple matches in nTLB, and return machine check
+     *  exception.
+     */
+    if (num_matching_tlb > 1) {
+        qemu_log_mask(CPU_LOG_MMU,
+                      "[MMU] Machine Check exception. num_matching_tlb = %d\n",
+                      num_matching_tlb);
+        SET_MMU_EXCEPTION(env, EXCP_MACHINE_CHECK, 0x01, 0x00);
+        return 0;
+    }
+
+
+    bool match = true;
+
+    if (num_matching_tlb == 0) {
+        match = false;
+    }
+
+    /* Check if entry if related to this address */
+    if (VPN(vaddr) != VPN(tlb->pd0) || (tlb->pd0 & PD0_V) == 0) {
+        /* Call the interrupt. */
+        match = false;
+    }
+
+    if (match == true) {
+        if ((tlb->pd0 & PD0_G) == 0) {
+            if ((tlb->pd0 & PD0_S) != 0) {
+                /* Match to a shared library. */
+                if (match_sasid(tlb, mmu) == false) {
+                    match = false;
+                }
+            } else if ((tlb->pd0 & PD0_PID_MATCH) !=
+                       (mmu->pid_asid & PD0_PID_MATCH)) {
+                /* Match to a process. */
+                      match = false;
+            }
+        }
+    }
+
+    if (match == true && !arc_mmu_have_permission(env, tlb, rwe)) {
+  protv_exception:
+        qemu_log_mask(CPU_LOG_MMU,
+                      "[MMU] ProtV exception at 0x" TARGET_FMT_lx
+                      " for 0x%08x. rwe = %s, "
+                      "tlb->pd0 = %08x, tlb->pd1 = %08x\n",
+                      env->pc,
+                      vaddr,
+                      RWE_STRING(rwe),
+                      tlb->pd0, tlb->pd1);
+
+        SET_MMU_EXCEPTION(env, EXCP_PROTV, CAUSE_CODE(rwe), 0x08);
+        return 0;
+    }
+
+    if (match == true) {
+        if (rwe != MMU_MEM_IRRELEVANT_TYPE) {
+            qemu_log_mask(CPU_LOG_MMU,
+                          "[MMU] Translated to 0x%08x, pd0=0x%08x, pd1=0x%08x\n",
+                          (tlb->pd1 & PAGE_MASK) | (vaddr & (~PAGE_MASK)),
+                          tlb->pd0, tlb->pd1);
+        }
+        return (tlb->pd1 & PAGE_MASK) | (vaddr & (~PAGE_MASK));
+    } else {
+        if (rwe != MMU_MEM_IRRELEVANT_TYPE) {
+            /* To remove eventually, just fail safe to check kernel. */
+            if (mmu->sasid0 != 0 || mmu->sasid1 != 0) {
+                assert(0);
+            } else {
+                mmu->tlbpd0 = (vaddr & (VPN(PD0_VPN)))
+                              | PD0_V | (mmu->pid_asid & PD0_ASID);
+            }
+            if (rwe == MMU_MEM_FETCH) {
+                qemu_log_mask(CPU_LOG_MMU,
+                              "[MMU] TLB_MissI exception at 0x"
+                              TARGET_FMT_lx ". rwe = %s, "
+                              "vaddr = %08x, tlb->pd0 = %08x, tlb->pd1 = %08x\n",
+                              env->pc,
+                              RWE_STRING(rwe),
+                              vaddr, tlb->pd0, tlb->pd1);
+                SET_MMU_EXCEPTION(env, EXCP_TLB_MISS_I, 0x00, 0x00);
+            } else {
+                qemu_log_mask(CPU_LOG_MMU,
+                              "[MMU] TLB_MissD exception at 0x" TARGET_FMT_lx
+                              ". rwe = %s, "
+                              "vaddr = %08x, tlb->pd0 = %08x, tlb->pd1 = %08x\n",
+                              env->pc,
+                              RWE_STRING(rwe),
+                              vaddr, tlb->pd0, tlb->pd1);
+                SET_MMU_EXCEPTION(env, EXCP_TLB_MISS_D, CAUSE_CODE(rwe),
+                                  0x00);
+            }
+        } else if (rwe != MMU_MEM_IRRELEVANT_TYPE) {
+            qemu_log_mask(CPU_LOG_MMU,
+                          "[MMU] Failed to translate to 0x%08x\n",
+                          vaddr);
+        }
+        return 0;
+    }
+}
+
+uint32_t arc_mmu_page_address_for(uint32_t vaddr)
+{
+    uint32_t ret = VPN(vaddr);
+    if (vaddr >= 0x80000000) {
+        ret |= 0x80000000;
+    }
+    return ret;
+}
+
+static int
+arc_mmu_get_prot_for_index(uint32_t index, CPUARCState *env)
+{
+    struct arc_tlb_e *tlb;
+    int ret = 0;
+    /* Read status for user mode. */
+    bool in_kernel_mode = !GET_STATUS_BIT(env->stat, Uf);
+
+    tlb = arc_mmu_get_tlb_at_index(
+            index,
+            &env->mmu);
+
+    if ((in_kernel_mode && (tlb->pd1 & PD1_RK) != 0)
+       || (!in_kernel_mode && (tlb->pd1 & PD1_RU) != 0)) {
+        ret |= PAGE_READ;
+    }
+
+    if ((in_kernel_mode && (tlb->pd1 & PD1_WK) != 0)
+       || (!in_kernel_mode && (tlb->pd1 & PD1_WU) != 0)) {
+        ret |= PAGE_WRITE;
+    }
+
+    if ((in_kernel_mode && (tlb->pd1 & PD1_XK) != 0)
+       || (!in_kernel_mode && (tlb->pd1 & PD1_XU) != 0)) {
+        ret |= PAGE_EXEC;
+    }
+
+    return ret;
+}
+
+static void QEMU_NORETURN raise_mem_exception(
+        CPUState *cs, target_ulong addr, uintptr_t host_pc,
+        int32_t excp_idx, uint8_t excp_cause_code, uint8_t excp_param)
+{
+    CPUARCState *env = &(ARC_CPU(cs)->env);
+    if (excp_idx != EXCP_TLB_MISS_I) {
+        cpu_restore_state(cs, host_pc, true);
+    }
+
+    env->efa = addr;
+    env->eret = env->pc;
+    env->erbta = env->bta;
+
+    cs->exception_index = excp_idx;
+    env->causecode = excp_cause_code;
+    env->param = excp_param;
+    cpu_loop_exit(cs);
+}
+
+/* MMU range */
+static const uint32_t MMU_VA_START = 0x00000000;  /* inclusive */
+static const uint32_t MMU_VA_END = 0x80000000;    /* exclusive */
+
+typedef enum {
+    DIRECT_ACTION,
+    MPU_ACTION,
+    MMU_ACTION,
+    EXCEPTION_ACTION
+} ACTION;
+
+/*
+ * Applying the following logic
+ * ,-----.-----.-----------.---------.---------------.
+ * | MMU | MPU | MMU range | mmu_idx |     action    |
+ * |-----+-----+-----------+---------+---------------|
+ * | dis | dis |     x     |    x    | phys = virt   |
+ * |-----+-----+-----------+---------+---------------|
+ * | dis | ena |     x     |    x    | mpu_translate |
+ * |-----+-----+-----------+---------+---------------|
+ * | ena | dis |   true    |    x    | mmu_translate |
+ * |-----+-----+-----------+---------+---------------|
+ * | ena | dis |   false   |    0    | phys = virt   |
+ * |-----+-----+-----------+---------+---------------|
+ * | ena | dis |   false   |    1    | exception     |
+ * |-----+-----+-----------+---------+---------------|
+ * | ena | ena |   false   |    x    | mpu_translate |
+ * |-----+-----+-----------+---------+---------------|
+ * | ena | ena |   true    |    x    | mmu_translate |
+ * `-----^-----^-----------^---------^---------------'
+ */
+static int decide_action(const CPUARCState *env,
+                         target_ulong       addr,
+                         int                mmu_idx)
+{
+    static ACTION table[2][2][2][2] = { };
+    static bool is_initialized;
+    const bool is_user = (mmu_idx == 1);
+    const bool is_mmu_range = ((addr >= MMU_VA_START) && (addr < MMU_VA_END));
+
+    if (!is_initialized) {
+        /* Both MMU and MPU disabled */
+#define T true
+#define F false
+
+        table[F][F][F][F] = DIRECT_ACTION;
+        table[F][F][F][T] = DIRECT_ACTION;
+        table[F][F][T][F] = DIRECT_ACTION;
+        table[F][F][T][T] = DIRECT_ACTION;
+
+        /* Only MPU */
+        table[F][T][F][F] = MPU_ACTION;
+        table[F][T][F][T] = MPU_ACTION;
+        table[F][T][T][F] = MPU_ACTION;
+        table[F][T][T][T] = MPU_ACTION;
+
+        /* Only MMU; non-mmu range; kernel access */
+        table[T][F][F][F] = DIRECT_ACTION;
+        /* Only MMU; non-mmu range; user access */
+        table[T][F][F][T] = EXCEPTION_ACTION;
+
+        /* Only MMU; mmu range; both modes access */
+        table[T][F][T][F] = MMU_ACTION;
+        table[T][F][T][T] = MMU_ACTION;
+
+        /* Both MMU and MPU enabled; non-mmu range */
+        table[T][T][F][F] = MPU_ACTION;
+        table[T][T][F][T] = MPU_ACTION;
+
+        /* Both MMU and MPU enabled; mmu range */
+        table[T][T][T][F] = MMU_ACTION;
+        table[T][T][T][T] = MMU_ACTION;
+
+#undef T
+#undef F
+
+        is_initialized = true;
+    }
+
+    return table[env->mmu.enabled][env->mpu.enabled][is_mmu_range][is_user];
+}
+
+void arc_mmu_init(CPUARCState *env)
+{
+    env->mmu.enabled = 0;
+    env->mmu.pid_asid = 0;
+    env->mmu.sasid0 = 0;
+    env->mmu.sasid1 = 0;
+
+    env->mmu.tlbpd0 = 0;
+    env->mmu.tlbpd1 = 0;
+    env->mmu.tlbpd1_hi = 0;
+    env->mmu.tlbindex = 0;
+    env->mmu.tlbcmd = 0;
+    env->mmu.scratch_data0 = 0;
+
+    memset(env->mmu.nTLB, 0, sizeof(env->mmu.nTLB));
+}
+
+
+#ifndef CONFIG_USER_ONLY
+/* Softmmu support function for MMU. */
+bool arc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr)
+{
+    /* TODO: this rwe should go away when the TODO below is done */
+    enum mmu_access_type rwe = (char) access_type;
+    CPUARCState *env = &((ARC_CPU(cs))->env);
+    int action = decide_action(env, address, mmu_idx);
+
+    switch (action) {
+    case DIRECT_ACTION:
+        tlb_set_page(cs, address & PAGE_MASK, address & PAGE_MASK,
+                     PAGE_READ | PAGE_WRITE | PAGE_EXEC,
+                     mmu_idx, TARGET_PAGE_SIZE);
+        break;
+    case MPU_ACTION:
+        if (arc_mpu_translate(env, address, access_type, mmu_idx)) {
+            if (probe) {
+                return false;
+            }
+            MPUException *mpu_excp = &env->mpu.exception;
+            raise_mem_exception(cs, address, retaddr,
+                    mpu_excp->number, mpu_excp->code, mpu_excp->param);
+        }
+        break;
+    case MMU_ACTION: {
+        /*
+         * TODO: these lines must go inside arc_mmu_translate and it
+         * should only signal a failure or success --> generate an
+         * exception or not
+         */
+        uint32_t index;
+        target_ulong paddr = arc_mmu_translate(env, address, rwe, &index);
+        if ((enum exception_code_list) env->mmu.exception.number !=
+                EXCP_NO_EXCEPTION) {
+            if (probe) {
+                return false;
+            }
+            const struct mmu_exception *mmu_excp = &env->mmu.exception;
+            raise_mem_exception(cs, address, retaddr,
+                    mmu_excp->number, mmu_excp->causecode, mmu_excp->parameter);
+        } else {
+            int prot = arc_mmu_get_prot_for_index(index, env);
+            address = arc_mmu_page_address_for(address);
+            tlb_set_page(cs, address, paddr & PAGE_MASK, prot,
+                         mmu_idx, TARGET_PAGE_SIZE);
+        }
+        break;
+    }
+    case EXCEPTION_ACTION:
+        if (probe) {
+            return false;
+        }
+        /* TODO: like TODO above, this must move inside mmu */
+        qemu_log_mask(CPU_LOG_MMU, "[MMU_TLB_FILL] ProtV "
+                      "exception at 0x" TARGET_FMT_lx ". rwe = %s\n",
+                      env->pc, RWE_STRING(rwe));
+        raise_mem_exception(cs, address, retaddr,
+                            EXCP_PROTV, CAUSE_CODE(rwe), 0x08);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return true;
+}
+
+hwaddr arc_mmu_debug_translate(CPUARCState *env, vaddr addr)
+{
+   return arc_mmu_translate(env, addr, MMU_MEM_IRRELEVANT_TYPE,
+                            NULL);
+}
+
+
+#endif /* ifndef CONFIG_USER_ONLY */
+
+void arc_mmu_disable(CPUARCState *env)
+{
+    env->mmu.enabled = false;
+}
diff --git a/target/arc/mmu.h b/target/arc/mmu.h
new file mode 100644
index 0000000000..00a26e828c
--- /dev/null
+++ b/target/arc/mmu.h
@@ -0,0 +1,148 @@
+/*
+ * QEMU ARC CPU
+ *
+ * Copyright (c) 2020 Synppsys Inc.
+ * Contributed by Cupertino Miranda <cmiranda@synopsys.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * http://www.gnu.org/licenses/lgpl-2.1.html
+ */
+
+#ifndef ARC_MMU_H
+#define ARC_MMU_H
+
+#include "target/arc/regs.h"
+
+/* PD0 flags */
+#define PD0_VPN 0x7ffff000
+#define PD0_ASID 0x000000ff
+#define PD0_G   0x00000100      /* Global */
+#define PD0_V   0x00000200      /* Valid */
+#define PD0_SZ  0x00000400      /* Size: Normal or Super Page */
+#define PD0_L   0x00000800      /* Lock */
+#define PD0_S   0x80000000      /* Shared Library ASID */
+#define PD0_FLG (PD0_G | PD0_V | PD0_SZ | PD0_L)
+
+#define PD0_ASID_MATCH 0x0000003f
+#define PD0_PID_MATCH  0x000000ff
+
+/* PD1 permission bits */
+#define PD1_PPN 0xfffff000      /* Cached */
+#define PD1_FC  0x00000001      /* Cached */
+#define PD1_XU  0x00000002      /* User Execute */
+#define PD1_WU  0x00000004      /* User Write */
+#define PD1_RU  0x00000008      /* User Read */
+#define PD1_XK  0x00000010      /* Kernel Execute */
+#define PD1_WK  0x00000020      /* Kernel Write */
+#define PD1_RK  0x00000040      /* Kernel Read */
+#define PD1_FLG (PD1_FC | PD1_XU | PD1_WU | PD1_RU | PD1_XK | PD1_WK | PD1_RK)
+
+#define TLBINDEX_INDEX  0x00001fff
+#define TLBINDEX_E      0x80000000
+#define TLBINDEX_RC        0x70000000
+
+#define TLB_CMD_WRITE   0x1
+#define TLB_CMD_WRITENI 0x5
+#define TLB_CMD_READ    0x2
+#define TLB_CMD_INSERT  0x7
+#define TLB_CMD_DELETE  0x8
+#define TLB_CMD_IVUTLB  0x6
+
+#define N_SETS          256
+#define N_WAYS          4
+#define TLB_ENTRIES     (N_SETS * N_WAYS)
+
+#define PAGE_SHIFT      TARGET_PAGE_BITS
+#define PAGE_SIZE       (1 << PAGE_SHIFT)
+#define PAGE_MASK       (~(PAGE_SIZE - 1))
+
+/* NOTE: Do not reorder, this is casted in tbl_fill function. */
+enum mmu_access_type {
+    MMU_MEM_READ = 0,
+    MMU_MEM_WRITE,
+    MMU_MEM_FETCH,  /* Read for execution. */
+    MMU_MEM_ATTOMIC,
+    MMU_MEM_IRRELEVANT_TYPE,
+};
+
+#define RWE_STRING(RWE) \
+    (RWE == MMU_MEM_READ ? "MEM_READ" : \
+     (RWE == MMU_MEM_WRITE ? "MEM_WRITE" : \
+      (RWE == MMU_MEM_ATTOMIC ? "MEM_ATTOMIC" : \
+       (RWE == MMU_MEM_FETCH ? "MEM_FETCH" : \
+        (RWE == MMU_MEM_IRRELEVANT_TYPE ? "MEM_IRRELEVANT" \
+         : "NOT_VALID_RWE")))))
+
+
+#define CAUSE_CODE(ENUM) \
+    ((ENUM == MMU_MEM_FETCH) ? 0 : \
+     ((ENUM == MMU_MEM_READ) ? 1 : \
+       ((ENUM == MMU_MEM_WRITE) ? 2 : 3)))
+
+
+struct arc_tlb_e {
+    /*
+     * TLB entry is {PD0,PD1} tuple, kept "unpacked" to avoid bit fiddling
+     * flags includes both PD0 flags and PD1 permissions.
+     */
+    uint32_t pd0, pd1;
+};
+
+#define RAISE_MMU_EXCEPTION(ENV) { \
+    do_exception_no_delayslot(ENV, \
+                              ENV->mmu.exception.number, \
+                              ENV->mmu.exception.causecode, \
+                              ENV->mmu.exception.parameter); \
+}
+
+struct arc_mmu {
+    uint32_t enabled;
+    struct mmu_exception {
+      int32_t number;
+      uint8_t causecode;
+      uint8_t parameter;
+    } exception;
+
+    struct arc_tlb_e nTLB[N_SETS][N_WAYS];
+
+    /* insert uses vaddr to find set; way selection could be random/rr/lru */
+    uint32_t way_sel[N_SETS];
+
+    /*
+     * Current Address Space ID (in whose context mmu lookups done)
+     * Note that it is actually present in AUX PID reg, which we don't
+     * explicitly maintain, but {re,de}construct as needed by LR/SR insns
+     * respectively.
+     */
+    uint32_t pid_asid;
+    uint32_t sasid0;
+    uint32_t sasid1;
+
+    uint32_t tlbpd0;
+    uint32_t tlbpd1;
+    uint32_t tlbpd1_hi;
+    uint32_t tlbindex;
+    uint32_t tlbcmd;
+    uint32_t scratch_data0;
+};
+
+
+struct CPUARCState;
+
+void arc_mmu_debug_tlb(struct CPUARCState *env);
+void arc_mmu_debug_tlb_for_vaddr(struct CPUARCState *env, uint32_t vaddr);
+
+uint32_t arc_mmu_page_address_for(uint32_t vaddr);
+
+#endif /* ARC_MMU_H */
-- 
2.20.1


