Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3385A5FD685
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 10:59:42 +0200 (CEST)
Received: from localhost ([::1]:43698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiu45-00028i-9o
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 04:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oitaV-00060F-1Y
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:29:07 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53734 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oitaQ-0004QL-R6
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:29:05 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxvmtGzEdjCdwsAA--.18330S4; 
 Thu, 13 Oct 2022 16:28:58 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 alex.bennee@linaro.org, maobibo@loongson.cn
Subject: [RISU PATCH v2 2/5] loongarch: Add LoongArch basic test support
Date: Thu, 13 Oct 2022 16:28:51 +0800
Message-Id: <20221013082854.878546-3-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221013082854.878546-1-gaosong@loongson.cn>
References: <20221013082854.878546-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxvmtGzEdjCdwsAA--.18330S4
X-Coremail-Antispam: 1UD129KBjvJXoW3CryfWry8KF4xXF1rCrWxWFg_yoWDtrW7pa
 13G34rJr4UXw13Zr4fG3yqvF15Kr1rJw17GF9xGw1jyFy8Jw1vqrn5Kr1UAF1DJw1UKr9I
 9F1DtFW5Wr1rJrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds LoongArch server, client support, and basic test file.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 risu_loongarch64.c         |  50 ++++++++++
 risu_reginfo_loongarch64.c | 183 +++++++++++++++++++++++++++++++++++++
 risu_reginfo_loongarch64.h |  25 +++++
 test_loongarch64.s         |  92 +++++++++++++++++++
 4 files changed, 350 insertions(+)
 create mode 100644 risu_loongarch64.c
 create mode 100644 risu_reginfo_loongarch64.c
 create mode 100644 risu_reginfo_loongarch64.h
 create mode 100644 test_loongarch64.s

diff --git a/risu_loongarch64.c b/risu_loongarch64.c
new file mode 100644
index 0000000..bda15d4
--- /dev/null
+++ b/risu_loongarch64.c
@@ -0,0 +1,50 @@
+/******************************************************************************
+ * Copyright (c) 2022 Loongson Technology Corporation Limited
+ * All rights reserved. This program and the accompanying materials
+ * are made available under the terms of the Eclipse Public License v1.0
+ * which accompanies this distribution, and is available at
+ * http://www.eclipse.org/legal/epl-v10.html
+ *
+ * Contributors:
+ *     based on Peter Maydell's risu_arm.c
+ *****************************************************************************/
+
+#include <asm/types.h>
+#include <signal.h>
+#include <asm/ucontext.h>
+
+#include "risu.h"
+
+void advance_pc(void *vuc)
+{
+    struct ucontext *uc = vuc;
+    uc->uc_mcontext.sc_pc += 4;
+}
+
+void set_ucontext_paramreg(void *vuc, uint64_t value)
+{
+    struct ucontext *uc = vuc;
+    uc->uc_mcontext.sc_regs[4] = value;
+}
+
+uint64_t get_reginfo_paramreg(struct reginfo *ri)
+{
+    return ri->regs[4];
+}
+
+int get_risuop(struct reginfo *ri)
+{
+    /* Return the risuop we have been asked to do
+     * (or OP_SIGILL if this was a SIGILL for a non-risuop insn)
+     */
+    uint32_t insn = ri->faulting_insn;
+    uint32_t op = insn & 0xf;
+    uint32_t key = insn & ~0xf;
+    uint32_t risukey = 0x000001f0;
+    return (key != risukey) ? OP_SIGILL : op;
+}
+
+uintptr_t get_pc(struct reginfo *ri)
+{
+   return ri->pc;
+}
diff --git a/risu_reginfo_loongarch64.c b/risu_reginfo_loongarch64.c
new file mode 100644
index 0000000..af6ab77
--- /dev/null
+++ b/risu_reginfo_loongarch64.c
@@ -0,0 +1,183 @@
+/******************************************************************************
+ * Copyright (c) 2022 Loongson Technology Corporation Limited
+ * All rights reserved. This program and the accompanying materials
+ * are made available under the terms of the Eclipse Public License v1.0
+ * which accompanies this distribution, and is available at
+ * http://www.eclipse.org/legal/epl-v10.html
+ *
+ * Contributors:
+ *     based on Peter Maydell's risu_reginfo_arm.c
+ *****************************************************************************/
+
+#include <stdio.h>
+#include <asm/types.h>
+#include <signal.h>
+#include <asm/ucontext.h>
+
+#include <string.h>
+#include <stdlib.h>
+#include <stddef.h>
+#include <stdbool.h>
+#include <inttypes.h>
+#include <assert.h>
+#include <sys/prctl.h>
+
+#include "risu.h"
+#include "risu_reginfo_loongarch64.h"
+
+const struct option * const arch_long_opts;
+const char * const arch_extra_help;
+
+struct _ctx_layout {
+        struct sctx_info *addr;
+        unsigned int size;
+};
+
+struct extctx_layout {
+        unsigned long size;
+        unsigned int flags;
+        struct _ctx_layout fpu;
+        struct _ctx_layout end;
+};
+
+void process_arch_opt(int opt, const char *arg)
+{
+    abort();
+}
+
+void arch_init(void)
+{
+}
+
+int reginfo_size(struct reginfo *ri)
+{
+    return sizeof(*ri);
+}
+
+static int parse_extcontext(struct sigcontext *sc, struct extctx_layout *extctx)
+{
+    uint32_t magic, size;
+    struct sctx_info *info = (struct sctx_info *)&sc->sc_extcontext;
+
+    while(1) {
+        magic = (uint32_t)info->magic;
+        size =  (uint32_t)info->size;
+        switch (magic) {
+        case 0: /* END*/
+            return 0;
+        case FPU_CTX_MAGIC:
+            if (size < (sizeof(struct sctx_info) +
+                        sizeof(struct fpu_context))) {
+                return -1;
+            }
+            extctx->fpu.addr = info;
+            break;
+        default:
+            return -1;
+       }
+       info = (struct sctx_info *)((char *)info +size);
+    }
+    return 0;
+}
+
+/* reginfo_init: initialize with a ucontext */
+void reginfo_init(struct reginfo *ri, ucontext_t *context)
+{
+    int i;
+    struct ucontext *uc = (struct ucontext *)context;
+    struct extctx_layout extctx;
+
+    memset(&extctx, 0, sizeof(struct extctx_layout));
+    memset(ri, 0, sizeof(*ri));
+
+    for (i = 1; i < 32; i++) {
+        ri->regs[i] = uc->uc_mcontext.sc_regs[i]; //sp:r3, tp:r2
+    }
+
+    ri->regs[2] = 0xdeadbeefdeadbeef;
+    ri->pc = uc->uc_mcontext.sc_pc - (unsigned long)image_start_address;
+    ri->flags = uc->uc_mcontext.sc_flags;
+    ri->faulting_insn = *(uint32_t *)uc->uc_mcontext.sc_pc;
+
+    parse_extcontext(&uc->uc_mcontext, &extctx);
+    if (extctx.fpu.addr) {
+        struct sctx_info *info = extctx.fpu.addr;
+        struct fpu_context *fpu_ctx = (struct fpu_context *)((char *)info +
+                                       sizeof(struct sctx_info));
+        for(i = 0; i < 32; i++) {
+	    ri->fpregs[i] = fpu_ctx->regs[i];
+        }
+	ri->fcsr = fpu_ctx->fcsr;
+	ri->fcc = fpu_ctx->fcc;
+    }
+}
+
+/* reginfo_is_eq: compare the reginfo structs, returns nonzero if equal */
+int reginfo_is_eq(struct reginfo *r1, struct reginfo *r2)
+{
+    return !memcmp(r1, r2, sizeof(*r1));
+}
+
+/* reginfo_dump: print state to a stream, returns nonzero on success */
+int reginfo_dump(struct reginfo *ri, FILE * f)
+{
+    int i;
+    fprintf(f, "  faulting insn %08x\n", ri->faulting_insn);
+
+    for (i = 0; i < 32; i++) {
+        fprintf(f, "  r%-2d    : %016" PRIx64 "\n", i, ri->regs[i]);
+    }
+
+    fprintf(f, "  pc     : %016" PRIx64 "\n", ri->pc);
+    fprintf(f, "  flags  : %08x\n", ri->flags);
+    fprintf(f, "  fcc    : %016" PRIx64 "\n", ri->fcc);
+    fprintf(f, "  fcsr   : %08x\n", ri->fcsr);
+
+    for (i = 0; i < 32; i++) {
+        fprintf(f, "  f%-2d    : %016lx\n", i, ri->fpregs[i]);
+    }
+
+    return !ferror(f);
+}
+
+/* reginfo_dump_mismatch: print mismatch details to a stream, ret nonzero=ok */
+int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
+{
+    int i;
+    fprintf(f, "mismatch detail (master : apprentice):\n");
+    if (m->faulting_insn != a->faulting_insn) {
+        fprintf(f, "  faulting insn mismatch %08x vs %08x\n",
+                m->faulting_insn, a->faulting_insn);
+    }
+    /* r2:tp, r3:sp */
+    for (i = 0; i < 32; i++) {
+        if (m->regs[i] != a->regs[i]) {
+            fprintf(f, "  r%-2d    : %016" PRIx64 " vs %016" PRIx64 "\n",
+                    i, m->regs[i], a->regs[i]);
+        }
+    }
+
+    if (m->pc != a->pc) {
+        fprintf(f, "  pc     : %016" PRIx64 " vs %016" PRIx64 "\n",
+                m->pc, a->pc);
+    }
+    if (m->flags != a->flags) {
+        fprintf(f, "  flags  : %08x vs %08x\n", m->flags, a->flags);
+    }
+    if (m->fcc != a->fcc) {
+        fprintf(f, "  fcc    : %016" PRIx64 " vs %016" PRIx64 "\n",
+                m->fcc, a->fcc);
+    }
+    if (m->fcsr != a->fcsr) {
+        fprintf(f, "  fcsr   : %08x vs %08x\n", m->fcsr, a->fcsr);
+    }
+
+    for (i = 0; i < 32; i++) {
+        if (m->fpregs[i]!= a->fpregs[i]) {
+            fprintf(f, "  f%-2d    : %016lx vs %016lx\n",
+                    i, m->fpregs[i], a->fpregs[i]);
+        }
+    }
+
+    return !ferror(f);
+}
diff --git a/risu_reginfo_loongarch64.h b/risu_reginfo_loongarch64.h
new file mode 100644
index 0000000..b6c5aaa
--- /dev/null
+++ b/risu_reginfo_loongarch64.h
@@ -0,0 +1,25 @@
+/******************************************************************************
+ * Copyright (c) 2022 Loongson Technology Corporation Limited
+ * All rights reserved. This program and the accompanying materials
+ * are made available under the terms of the Eclipse Public License v1.0
+ * which accompanies this distribution, and is available at
+ * http://www.eclipse.org/legal/epl-v10.html
+ *
+ * Contributors:
+ *     based on Peter Maydell's risu_reginfo_arm.h
+ *****************************************************************************/
+
+#ifndef RISU_REGINFO_LOONGARCH64_H
+#define RISU_REGINFO_LOONGARCH64_H
+
+struct reginfo {
+    uint64_t regs[32];
+    uint64_t pc;
+    uint64_t fcc;
+    uint32_t flags;
+    uint32_t fcsr;
+    uint32_t faulting_insn;
+    uint64_t fpregs[32];
+};
+
+#endif /* RISU_REGINFO_LOONGARCH64_H */
diff --git a/test_loongarch64.s b/test_loongarch64.s
new file mode 100644
index 0000000..431416d
--- /dev/null
+++ b/test_loongarch64.s
@@ -0,0 +1,92 @@
+/*****************************************************************************
+ * Copyright (c) 2022 Loongson Technology Corporation Limited
+ * All rights reserved. This program and the accompanying materials
+ * are made available under the terms of the Eclipse Public License v1.0
+ * rhich accompanies this distribution, and is available at
+ * http://rrr.eclipse.org/legal/epl-v10.html
+ *
+ * Contributors:
+ *     based on test_arm.s by Peter Maydell
+ *****************************************************************************/
+
+/* Initialise the gp regs */
+# $r0 is always 0
+addi.w $r1, $r0, 1
+#r2 tp skip r2
+#r3 sp
+addi.w $r3, $r0, 3
+addi.w $r4, $r0, 4
+addi.w $r5, $r0, 5
+addi.w $r6, $r0, 6
+addi.w $r7, $r0, 7
+addi.w $r8, $r0, 8
+addi.w $r9, $r0, 9
+addi.w $r10, $r0, 10
+addi.w $r11, $r0, 11
+addi.w $r12, $r0, 12
+addi.w $r13, $r0, 13
+addi.w $r14, $r0, 14
+addi.w $r15, $r0, 15
+addi.w $r16, $r0, 16
+addi.w $r17, $r0, 17
+addi.w $r18, $r0, 18
+addi.w $r19, $r0, 19
+addi.w $r20, $r0, 20
+addi.w $r21, $r0, 21
+addi.w $r22, $r0, 22
+addi.w $r23, $r0, 23
+addi.w $r24, $r0, 24
+addi.w $r25, $r0, 25
+addi.w $r26, $r0, 26
+addi.w $r27, $r0, 27
+addi.w $r28, $r0, 28
+addi.w $r29, $r0, 29
+addi.w $r30, $r0, 30
+addi.w $r31, $r0, 31
+
+/* Initialise the fp regs */
+movgr2fr.d $f0, $r0
+movgr2fr.d $f1, $r1
+movgr2fr.d $f2, $r0
+movgr2fr.d $f3, $r0
+movgr2fr.d $f4, $r4
+movgr2fr.d $f5, $r5
+movgr2fr.d $f6, $r6
+movgr2fr.d $f7, $r7
+movgr2fr.d $f8, $r8
+movgr2fr.d $f9, $r9
+movgr2fr.d $f10, $r10
+movgr2fr.d $f11, $r11
+movgr2fr.d $f12, $r12
+movgr2fr.d $f13, $r13
+movgr2fr.d $f14, $r14
+movgr2fr.d $f15, $r15
+movgr2fr.d $f16, $r16
+movgr2fr.d $f17, $r17
+movgr2fr.d $f18, $r18
+movgr2fr.d $f19, $r19
+movgr2fr.d $f20, $r20
+movgr2fr.d $f21, $r21
+movgr2fr.d $f22, $r22
+movgr2fr.d $f23, $r23
+movgr2fr.d $f24, $r24
+movgr2fr.d $f25, $r25
+movgr2fr.d $f26, $r26
+movgr2fr.d $f27, $r27
+movgr2fr.d $f28, $r28
+movgr2fr.d $f29, $r29
+movgr2fr.d $f30, $r30
+movgr2fr.d $f31, $r31
+movgr2cf $fcc0, $r0
+movgr2cf $fcc1, $r0
+movgr2cf $fcc2, $r0
+movgr2cf $fcc3, $r0
+movgr2cf $fcc4, $r0
+movgr2cf $fcc5, $r0
+movgr2cf $fcc6, $r0
+movgr2cf $fcc7, $r0
+
+/* do compare. */
+.int 0x000001f0
+/* exit test */
+.int 0x000001f1
-- 
2.31.1


