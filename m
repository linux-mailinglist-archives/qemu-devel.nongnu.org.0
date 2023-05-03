Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24496F5200
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:41:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6th-00053q-QY; Wed, 03 May 2023 03:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tZ-0004lV-1r
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:25 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tU-0005d5-PL
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:24 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fd8so29134215e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098840; x=1685690840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMJ6jx51ujYbLYVaLec++cI+Ra4MeMOvx0ZIb8CprVc=;
 b=XdtHQvlYkYchbEyrp6n7Fb2nklgleiOP+V4ntLlSLYA3RpKF32ziRBTboc9NMtliYe
 HdDZYBK/KFw33MXbnQ3OcXmAR8txEFSryRMRGgDSXn/6NZ/v+QHakWV0QZ73WccZ7oaG
 lxd+EyNorZqmBY/DLhbrzZngQ95jnIRuII/4y5Pv2LAL6nDwDkNE3ezD+11ArKREJ+7k
 RKnERNMNE7ByuotLoIhHqJPAcGFUVLB/qnlUp7q7hUcg57rlGp5IvFedidlnZxR36yZO
 /e0tIrRq1ZOlTBqEJwHmB+2cczkqN9VLka4ESm5jyeg1/eCWe+yd//WiEO7OFq5rFCuR
 R64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098840; x=1685690840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dMJ6jx51ujYbLYVaLec++cI+Ra4MeMOvx0ZIb8CprVc=;
 b=jqsheu2TbNStIc81GWUNHgHy2OfdS/GVpOc5CS4dr/+aTqktsJKY0thQWrZrHahzOn
 OdueCTjEjvj0AzIdwAha6/NHzSlaSE8vY0ZKSoSC9FmE9HzQTcl2TCyXjvGub2fBVdix
 KeBBgBO1Luj1mOWFC2Arq57VKUkE3HBv/xwppUUFxov2JkaZWNA92JvfbyC+vVsrmc1c
 uI0haUrDiUZ/q1DBX4LlEKZqbNFqdGTB9/P9R2FFO7j8AcQAVNrugs/uJge5nVgpTTW7
 Nec5Xb9M3B+2RY7aCoiUzeRk4Oo0B2IKf9tSWA21E+cNvtI2LNx+KlkbOjJKbV+/bOpm
 1Zxg==
X-Gm-Message-State: AC+VfDxiL2JZ0O+MuUOtahJM6uy998OwEjjuZYEJinlrygrsg6T9DpW/
 HpZXSq4vrZ5AcaTa0MKZDK9KTzHjcj42IW6MESzKaQ==
X-Google-Smtp-Source: ACHHUZ59zQTIfRiIwj4OsJm1n877KFWcchS0/MdQefj3Ar1d0lATPCezHVcRLZSobEc+98CeFhmA5w==
X-Received: by 2002:a1c:7718:0:b0:3ef:8b0:dbb1 with SMTP id
 t24-20020a1c7718000000b003ef08b0dbb1mr13858627wmi.7.1683098839659; 
 Wed, 03 May 2023 00:27:19 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 63/84] tcg: Spit out exec/translation-block.h
Date: Wed,  3 May 2023 08:23:10 +0100
Message-Id: <20230503072331.1747057-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is all that is required by tcg/ from exec-all.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h          | 135 +--------------------------
 include/exec/translation-block.h | 152 +++++++++++++++++++++++++++++++
 tcg/tcg-op-ldst.c                |   2 +-
 3 files changed, 154 insertions(+), 135 deletions(-)
 create mode 100644 include/exec/translation-block.h

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index a09d754624..f01c7d57e8 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -24,20 +24,9 @@
 #ifdef CONFIG_TCG
 #include "exec/cpu_ldst.h"
 #endif
-#include "qemu/interval-tree.h"
+#include "exec/translation-block.h"
 #include "qemu/clang-tsa.h"
 
-/* Page tracking code uses ram addresses in system mode, and virtual
-   addresses in userspace mode.  Define tb_page_addr_t to be an appropriate
-   type.  */
-#if defined(CONFIG_USER_ONLY)
-typedef vaddr tb_page_addr_t;
-#define TB_PAGE_ADDR_FMT "%" VADDR_PRIx
-#else
-typedef ram_addr_t tb_page_addr_t;
-#define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
-#endif
-
 /**
  * cpu_unwind_state_data:
  * @cpu: the cpu context
@@ -478,8 +467,6 @@ int probe_access_full(CPUArchState *env, target_ulong addr, int size,
                       CPUTLBEntryFull **pfull, uintptr_t retaddr);
 #endif
 
-#define CODE_GEN_ALIGN           16 /* must be >= of the size of a icache line */
-
 /* Estimated block size for TB allocation.  */
 /* ??? The following is based on a 2015 survey of x86_64 host output.
    Better would seem to be some sort of dynamically sized TB array,
@@ -490,126 +477,6 @@ int probe_access_full(CPUArchState *env, target_ulong addr, int size,
 #define CODE_GEN_AVG_BLOCK_SIZE 150
 #endif
 
-/*
- * Translation Cache-related fields of a TB.
- * This struct exists just for convenience; we keep track of TB's in a binary
- * search tree, and the only fields needed to compare TB's in the tree are
- * @ptr and @size.
- * Note: the address of search data can be obtained by adding @size to @ptr.
- */
-struct tb_tc {
-    const void *ptr;    /* pointer to the translated code */
-    size_t size;
-};
-
-struct TranslationBlock {
-    /*
-     * Guest PC corresponding to this block.  This must be the true
-     * virtual address.  Therefore e.g. x86 stores EIP + CS_BASE, and
-     * targets like Arm, MIPS, HP-PA, which reuse low bits for ISA or
-     * privilege, must store those bits elsewhere.
-     *
-     * If CF_PCREL, the opcodes for the TranslationBlock are written
-     * such that the TB is associated only with the physical page and
-     * may be run in any virtual address context.  In this case, PC
-     * must always be taken from ENV in a target-specific manner.
-     * Unwind information is taken as offsets from the page, to be
-     * deposited into the "current" PC.
-     */
-    vaddr pc;
-
-    /*
-     * Target-specific data associated with the TranslationBlock, e.g.:
-     * x86: the original user, the Code Segment virtual base,
-     * arm: an extension of tb->flags,
-     * s390x: instruction data for EXECUTE,
-     * sparc: the next pc of the instruction queue (for delay slots).
-     */
-    uint64_t cs_base;
-
-    uint32_t flags; /* flags defining in which context the code was generated */
-    uint32_t cflags;    /* compile flags */
-
-/* Note that TCG_MAX_INSNS is 512; we validate this match elsewhere. */
-#define CF_COUNT_MASK    0x000001ff
-#define CF_NO_GOTO_TB    0x00000200 /* Do not chain with goto_tb */
-#define CF_NO_GOTO_PTR   0x00000400 /* Do not chain with goto_ptr */
-#define CF_SINGLE_STEP   0x00000800 /* gdbstub single-step in effect */
-#define CF_LAST_IO       0x00008000 /* Last insn may be an IO access.  */
-#define CF_MEMI_ONLY     0x00010000 /* Only instrument memory ops */
-#define CF_USE_ICOUNT    0x00020000
-#define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock held */
-#define CF_PARALLEL      0x00080000 /* Generate code for a parallel context */
-#define CF_NOIRQ         0x00100000 /* Generate an uninterruptible TB */
-#define CF_PCREL         0x00200000 /* Opcodes in TB are PC-relative */
-#define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
-#define CF_CLUSTER_SHIFT 24
-
-    /* Per-vCPU dynamic tracing state used to generate this TB */
-    uint32_t trace_vcpu_dstate;
-
-    /*
-     * Above fields used for comparing
-     */
-
-    /* size of target code for this block (1 <= size <= TARGET_PAGE_SIZE) */
-    uint16_t size;
-    uint16_t icount;
-
-    struct tb_tc tc;
-
-    /*
-     * Track tb_page_addr_t intervals that intersect this TB.
-     * For user-only, the virtual addresses are always contiguous,
-     * and we use a unified interval tree.  For system, we use a
-     * linked list headed in each PageDesc.  Within the list, the lsb
-     * of the previous pointer tells the index of page_next[], and the
-     * list is protected by the PageDesc lock(s).
-     */
-#ifdef CONFIG_USER_ONLY
-    IntervalTreeNode itree;
-#else
-    uintptr_t page_next[2];
-    tb_page_addr_t page_addr[2];
-#endif
-
-    /* jmp_lock placed here to fill a 4-byte hole. Its documentation is below */
-    QemuSpin jmp_lock;
-
-    /* The following data are used to directly call another TB from
-     * the code of this one. This can be done either by emitting direct or
-     * indirect native jump instructions. These jumps are reset so that the TB
-     * just continues its execution. The TB can be linked to another one by
-     * setting one of the jump targets (or patching the jump instruction). Only
-     * two of such jumps are supported.
-     */
-#define TB_JMP_OFFSET_INVALID 0xffff /* indicates no jump generated */
-    uint16_t jmp_reset_offset[2]; /* offset of original jump target */
-    uint16_t jmp_insn_offset[2];  /* offset of direct jump insn */
-    uintptr_t jmp_target_addr[2]; /* target address */
-
-    /*
-     * Each TB has a NULL-terminated list (jmp_list_head) of incoming jumps.
-     * Each TB can have two outgoing jumps, and therefore can participate
-     * in two lists. The list entries are kept in jmp_list_next[2]. The least
-     * significant bit (LSB) of the pointers in these lists is used to encode
-     * which of the two list entries is to be used in the pointed TB.
-     *
-     * List traversals are protected by jmp_lock. The destination TB of each
-     * outgoing jump is kept in jmp_dest[] so that the appropriate jmp_lock
-     * can be acquired from any origin TB.
-     *
-     * jmp_dest[] are tagged pointers as well. The LSB is set when the TB is
-     * being invalidated, so that no further outgoing jumps from it can be set.
-     *
-     * jmp_lock also protects the CF_INVALID cflag; a jump must not be chained
-     * to a destination TB that has CF_INVALID set.
-     */
-    uintptr_t jmp_list_head;
-    uintptr_t jmp_list_next[2];
-    uintptr_t jmp_dest[2];
-};
-
 /* Hide the qatomic_read to make code a little easier on the eyes */
 static inline uint32_t tb_cflags(const TranslationBlock *tb)
 {
diff --git a/include/exec/translation-block.h b/include/exec/translation-block.h
new file mode 100644
index 0000000000..37aa979e20
--- /dev/null
+++ b/include/exec/translation-block.h
@@ -0,0 +1,152 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/*
+ * Definition of TranslationBlock.
+ *  Copyright (c) 2003 Fabrice Bellard
+ */
+
+#ifndef EXEC_TRANSLATION_BLOCK_H
+#define EXEC_TRANSLATION_BLOCK_H
+
+#include "qemu/atomic.h"
+#include "qemu/thread.h"
+#include "qemu/interval-tree.h"
+#include "exec/cpu-common.h"
+#include "exec/target_page.h"
+
+/*
+ * Page tracking code uses ram addresses in system mode, and virtual
+ * addresses in userspace mode.  Define tb_page_addr_t to be an
+ * appropriate type.
+ */
+#if defined(CONFIG_USER_ONLY)
+typedef vaddr tb_page_addr_t;
+#define TB_PAGE_ADDR_FMT "%" VADDR_PRIx
+#else
+typedef ram_addr_t tb_page_addr_t;
+#define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
+#endif
+
+/*
+ * Translation Cache-related fields of a TB.
+ * This struct exists just for convenience; we keep track of TB's in a binary
+ * search tree, and the only fields needed to compare TB's in the tree are
+ * @ptr and @size.
+ * Note: the address of search data can be obtained by adding @size to @ptr.
+ */
+struct tb_tc {
+    const void *ptr;    /* pointer to the translated code */
+    size_t size;
+};
+
+struct TranslationBlock {
+    /*
+     * Guest PC corresponding to this block.  This must be the true
+     * virtual address.  Therefore e.g. x86 stores EIP + CS_BASE, and
+     * targets like Arm, MIPS, HP-PA, which reuse low bits for ISA or
+     * privilege, must store those bits elsewhere.
+     *
+     * If CF_PCREL, the opcodes for the TranslationBlock are written
+     * such that the TB is associated only with the physical page and
+     * may be run in any virtual address context.  In this case, PC
+     * must always be taken from ENV in a target-specific manner.
+     * Unwind information is taken as offsets from the page, to be
+     * deposited into the "current" PC.
+     */
+    vaddr pc;
+
+    /*
+     * Target-specific data associated with the TranslationBlock, e.g.:
+     * x86: the original user, the Code Segment virtual base,
+     * arm: an extension of tb->flags,
+     * s390x: instruction data for EXECUTE,
+     * sparc: the next pc of the instruction queue (for delay slots).
+     */
+    uint64_t cs_base;
+
+    uint32_t flags; /* flags defining in which context the code was generated */
+    uint32_t cflags;    /* compile flags */
+
+/* Note that TCG_MAX_INSNS is 512; we validate this match elsewhere. */
+#define CF_COUNT_MASK    0x000001ff
+#define CF_NO_GOTO_TB    0x00000200 /* Do not chain with goto_tb */
+#define CF_NO_GOTO_PTR   0x00000400 /* Do not chain with goto_ptr */
+#define CF_SINGLE_STEP   0x00000800 /* gdbstub single-step in effect */
+#define CF_LAST_IO       0x00008000 /* Last insn may be an IO access.  */
+#define CF_MEMI_ONLY     0x00010000 /* Only instrument memory ops */
+#define CF_USE_ICOUNT    0x00020000
+#define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock held */
+#define CF_PARALLEL      0x00080000 /* Generate code for a parallel context */
+#define CF_NOIRQ         0x00100000 /* Generate an uninterruptible TB */
+#define CF_PCREL         0x00200000 /* Opcodes in TB are PC-relative */
+#define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
+#define CF_CLUSTER_SHIFT 24
+
+    /* Per-vCPU dynamic tracing state used to generate this TB */
+    uint32_t trace_vcpu_dstate;
+
+    /*
+     * Above fields used for comparing
+     */
+
+    /* size of target code for this block (1 <= size <= TARGET_PAGE_SIZE) */
+    uint16_t size;
+    uint16_t icount;
+
+    struct tb_tc tc;
+
+    /*
+     * Track tb_page_addr_t intervals that intersect this TB.
+     * For user-only, the virtual addresses are always contiguous,
+     * and we use a unified interval tree.  For system, we use a
+     * linked list headed in each PageDesc.  Within the list, the lsb
+     * of the previous pointer tells the index of page_next[], and the
+     * list is protected by the PageDesc lock(s).
+     */
+#ifdef CONFIG_USER_ONLY
+    IntervalTreeNode itree;
+#else
+    uintptr_t page_next[2];
+    tb_page_addr_t page_addr[2];
+#endif
+
+    /* jmp_lock placed here to fill a 4-byte hole. Its documentation is below */
+    QemuSpin jmp_lock;
+
+    /* The following data are used to directly call another TB from
+     * the code of this one. This can be done either by emitting direct or
+     * indirect native jump instructions. These jumps are reset so that the TB
+     * just continues its execution. The TB can be linked to another one by
+     * setting one of the jump targets (or patching the jump instruction). Only
+     * two of such jumps are supported.
+     */
+#define TB_JMP_OFFSET_INVALID 0xffff /* indicates no jump generated */
+    uint16_t jmp_reset_offset[2]; /* offset of original jump target */
+    uint16_t jmp_insn_offset[2];  /* offset of direct jump insn */
+    uintptr_t jmp_target_addr[2]; /* target address */
+
+    /*
+     * Each TB has a NULL-terminated list (jmp_list_head) of incoming jumps.
+     * Each TB can have two outgoing jumps, and therefore can participate
+     * in two lists. The list entries are kept in jmp_list_next[2]. The least
+     * significant bit (LSB) of the pointers in these lists is used to encode
+     * which of the two list entries is to be used in the pointed TB.
+     *
+     * List traversals are protected by jmp_lock. The destination TB of each
+     * outgoing jump is kept in jmp_dest[] so that the appropriate jmp_lock
+     * can be acquired from any origin TB.
+     *
+     * jmp_dest[] are tagged pointers as well. The LSB is set when the TB is
+     * being invalidated, so that no further outgoing jumps from it can be set.
+     *
+     * jmp_lock also protects the CF_INVALID cflag; a jump must not be chained
+     * to a destination TB that has CF_INVALID set.
+     */
+    uintptr_t jmp_list_head;
+    uintptr_t jmp_list_next[2];
+    uintptr_t jmp_dest[2];
+};
+
+/* The alignment given to TranslationBlock during allocation. */
+#define CODE_GEN_ALIGN  16
+
+#endif /* EXEC_TRANSLATION_BLOCK_H */
diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
index c962a2aa17..7e690d0e92 100644
--- a/tcg/tcg-op-ldst.c
+++ b/tcg/tcg-op-ldst.c
@@ -23,11 +23,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "exec/exec-all.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-temp-internal.h"
 #include "tcg/tcg-op-common.h"
 #include "tcg/tcg-mo.h"
+#include "exec/translation-block.h"
 #include "exec/plugin-gen.h"
 #include "tcg-internal.h"
 
-- 
2.34.1


