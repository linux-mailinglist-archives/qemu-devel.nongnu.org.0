Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3AF3DE4F5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:16:54 +0200 (CEST)
Received: from localhost ([::1]:47814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlrJ-0005LQ-3a
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpL-0002OP-BQ
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:51 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:41683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpJ-0001yK-Ii
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:51 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so3039144pjd.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GtaQj9QfmURnELbbHbrbfY1ywWXKj/RVJuZ95M6bRY0=;
 b=STCxblRfVGTpS/32qFLcKO3sKZnfDVgpgDf01GqBgptLSvGOKSyTgRfxjwDJE0J1Ot
 zVGSgkjLBhF8oYDdAE0dAH/wdxboMzrNzVaBmVrnzAgVG/C5VoOFM3dDoV7FJTnFRDsS
 dPOUtaqQ1Vt7Sdeg9bSf0Pl1GVt582Lxe/bVcZx68dr4wA2fUgZ21dnXUU25fg1Wd+UW
 wF0w6xHVGAr53MrguUbe8wPSmVVPpVoe+58F9X+wZA8Drygbtl9Llto96Oau2QR9YH3z
 TeacgumBByI6FhiIlzTiX/QOk84OT/ebabe3JhwoPpimtDVhllJPzf1guG1WvRJanRs+
 nLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GtaQj9QfmURnELbbHbrbfY1ywWXKj/RVJuZ95M6bRY0=;
 b=KhT7iHgHPBddy/gnXcq3uLW+VmdSQpWE1pfsb01eK1Q/8/DeGknVFoaG0C0+ikLaLg
 FFXTGrUUl8/vYqSlNaWAx+uh+RdOUm1dpWX1ho/lZt5UpTeQfjOfKxSvf0hmXGaYqqTv
 6bB0NGiEJnrk5lsqObkvsB0o1d2sSqSI38+96izn9J/l/TTQNHqMgzRi9Q75t4JQHkLl
 oghos5aCz9/USMBolsdEji94H99XLuEgq5Kz7yvsfkftbqns2QfcDCDI81pQmdsXlugZ
 6FzdOR6fsaxL2hMjyZpx0fCb13tYjgyMKEtYHPuNgTzw9SAg11g8CfIm+Dje5KaNcHNj
 3JbQ==
X-Gm-Message-State: AOAM533IMkuAUtx2hzpvGpe0ZgwMfyb8Ef7T+5uXN4n+ZTD8YKwbCgp1
 ZnLD8SNGbfl1dfb6b5nNv1vA6E34j3gyrA==
X-Google-Smtp-Source: ABdhPJygOpjvmJ6fNkMqm6HZfHtL+Ua+QkjskDgRlIAWRI7tRPNpA/SrPP4gdq6ZnMq0pl6kWRt7OA==
X-Received: by 2002:a63:5119:: with SMTP id f25mr802986pgb.271.1627964088417; 
 Mon, 02 Aug 2021 21:14:48 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.14.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:14:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/55] hw/core: Make do_unaligned_access available to
 user-only
Date: Mon,  2 Aug 2021 18:13:50 -1000
Message-Id: <20210803041443.55452-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We shouldn't be ignoring SIGBUS for user-only.

Move our existing TCGCPUOps hook out from CONFIG_SOFTMMU.
Move the wrapper, cpu_unaligned_access, to cpu-exec-common.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h          |  4 ++++
 include/hw/core/tcg-cpu-ops.h | 16 ++++++++--------
 accel/tcg/cpu-exec-common.c   | 12 ++++++++++++
 accel/tcg/cputlb.c            |  9 ---------
 4 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 881bc1ede0..a5e70cd91d 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -19,4 +19,8 @@ void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 void page_init(void);
 void tb_htable_init(void);
 
+void QEMU_NORETURN cpu_unaligned_access(CPUState *cpu, vaddr addr,
+                                        MMUAccessType access_type,
+                                        int mmu_idx, uintptr_t retaddr);
+
 #endif /* ACCEL_TCG_INTERNAL_H */
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index ee0795def4..3753af03d8 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -60,6 +60,14 @@ struct TCGCPUOps {
     /** @debug_excp_handler: Callback for handling debug exceptions */
     void (*debug_excp_handler)(CPUState *cpu);
 
+    /**
+     * @do_unaligned_access: Callback for unaligned access handling
+     * The callback must exit via raising an exception.
+     */
+    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
+                                MMUAccessType access_type,
+                                int mmu_idx, uintptr_t retaddr) QEMU_NORETURN;
+
 #ifdef NEED_CPU_H
 #ifdef CONFIG_SOFTMMU
     /**
@@ -70,14 +78,6 @@ struct TCGCPUOps {
                                   unsigned size, MMUAccessType access_type,
                                   int mmu_idx, MemTxAttrs attrs,
                                   MemTxResult response, uintptr_t retaddr);
-    /**
-     * @do_unaligned_access: Callback for unaligned access handling
-     * The callback must exit via raising an exception.
-     */
-    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
-                                MMUAccessType access_type,
-                                int mmu_idx, uintptr_t retaddr) QEMU_NORETURN;
-
     /**
      * @adjust_watchpoint_address: hack for cpu_check_watchpoint used by ARM
      */
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index be6fe45aa5..eeff20a347 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -21,6 +21,8 @@
 #include "sysemu/cpus.h"
 #include "sysemu/tcg.h"
 #include "exec/exec-all.h"
+#include "hw/core/tcg-cpu-ops.h"
+#include "internal.h"
 
 bool tcg_allowed;
 
@@ -81,3 +83,13 @@ void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
     cpu->exception_index = EXCP_ATOMIC;
     cpu_loop_exit_restore(cpu, pc);
 }
+
+void cpu_unaligned_access(CPUState *cpu, vaddr addr,
+                          MMUAccessType access_type,
+                          int mmu_idx, uintptr_t retaddr)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    assert(cc->tcg_ops->do_unaligned_access != NULL);
+    cc->tcg_ops->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
+}
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b1e5471f94..116b289907 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1306,15 +1306,6 @@ static void tlb_fill(CPUState *cpu, target_ulong addr, int size,
     assert(ok);
 }
 
-static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
-                                        MMUAccessType access_type,
-                                        int mmu_idx, uintptr_t retaddr)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    cc->tcg_ops->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
-}
-
 static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
                                           vaddr addr, unsigned size,
                                           MMUAccessType access_type,
-- 
2.25.1


