Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833A54B011C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 00:19:24 +0100 (CET)
Received: from localhost ([::1]:53322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHwF9-00068a-Hg
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 18:19:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvy1-0004UX-5G
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:01:41 -0500
Received: from [2607:f8b0:4864:20::102c] (port=54261
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvxv-000364-Rx
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:01:38 -0500
Received: by mail-pj1-x102c.google.com with SMTP id qe15so3540039pjb.3
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 15:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D9qxvMLg2aA1jlJbM4yenjefdRbyB4Cli0TTYvf9xu4=;
 b=XsmADXnvr4q8zRjvBWOgNSpcKM/I9XyJuswxYmJCo8GmmII84gn1nXWBTZOvhVEQAl
 XSllfMfOCf32QUnEiSFjj0wSuTpOES7nL9bSK1ecsIRTqoLjDSB0rnFXzhbllRW/JDNf
 wp13Y1dYnScJozhRRM5cY33MaiDIdAvhLhcAJEOtHfof681tcsXrbCul8KXAAVeDNTdS
 hYI+HwZCq3KlIggB6IFUgj0rf7VYdkdo0dlDNVLzr5+BL/0PnzjV9Ycpj9xOUQHVxiLj
 9Ft9GrFA3xOTRjh3VP/JfaE3bjkbqw9mZGUUrFDLNTezQOuPSd7gEP2Wa172uws9bt6S
 /uDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D9qxvMLg2aA1jlJbM4yenjefdRbyB4Cli0TTYvf9xu4=;
 b=m/4G1/mN1lRdi9M82dv4K6rGklveqreKu0sKQjbiZQpQ3LT5/rnQHeSLZmfu/a3J7p
 ZF9U0TRJv4t7Pr+Ubvwe94ECmlIpimLJOoVpuehz0Bwt2jRk7JkY5q0LNERVPxAElv3u
 YqyiUzOxhkBkHWopMmOmZXjMSTJIchQPipt6EtjrRmVXiaSGZMz5KH2fzb9qzxPJlw8P
 dQBQ32FBK+KlPVOUCPfCTnvvOVVASo+39POeGGHuuqoh100CAo9IB+A2IYwQBrVot5aX
 PDmknVrjWgIsy8w1wrhe9KXqAnE1IVCiRVAkL+nZeecNBm/s1E0dgqEucrl1l3vY2zad
 DFyg==
X-Gm-Message-State: AOAM530Ojw6d469Hqkwim1s1YXGwPey76FlhH8fYr9R/cMJxRT3tEuoT
 WlolDgYAs1x/XV+xbXgK89xX35IuMu4=
X-Google-Smtp-Source: ABdhPJw7mPmGD2eEtBxWUuBu4mVBIfi/+dR8FQd5r5aHhoK4YqAJpEItoK+98BiNIVeDXtusYnLGIg==
X-Received: by 2002:a17:903:2310:: with SMTP id
 d16mr4452079plh.39.1644447685200; 
 Wed, 09 Feb 2022 15:01:25 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id l20sm21692354pfc.53.2022.02.09.15.01.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 15:01:24 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 6/9] exec: Define MMUAccessType in 'exec/cpu-tlb.h' header
Date: Thu, 10 Feb 2022 00:00:27 +0100
Message-Id: <20220209230030.93987-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209230030.93987-1-f4bug@amsat.org>
References: <20220209230030.93987-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

To reduce the inclusion of "hw/core/cpu.h", extract
MMUAccessType to its own "exec/cpu-tlb.h" header.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu-defs.h       |  1 +
 include/exec/cpu-tlb.h        | 16 ++++++++++++++++
 include/exec/cpu_ldst.h       |  1 +
 include/exec/exec-all.h       |  3 +++
 include/hw/core/cpu.h         |  6 ------
 include/hw/core/tcg-cpu-ops.h |  1 +
 target/arm/internals.h        |  1 +
 target/mips/internal.h        |  1 +
 target/ppc/internal.h         |  2 ++
 target/ppc/mmu-hash32.h       |  2 ++
 target/ppc/mmu-hash64.h       |  2 ++
 target/ppc/mmu-radix64.h      |  2 ++
 target/s390x/s390x-internal.h |  2 ++
 13 files changed, 34 insertions(+), 6 deletions(-)
 create mode 100644 include/exec/cpu-tlb.h

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index ba3cd32a1e..c7eefb8633 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -29,6 +29,7 @@
 #include "exec/hwaddr.h"
 #endif
 #include "exec/memattrs.h"
+#include "exec/cpu-tlb.h"
 #include "hw/core/cpu.h"
 
 #include "cpu-param.h"
diff --git a/include/exec/cpu-tlb.h b/include/exec/cpu-tlb.h
new file mode 100644
index 0000000000..dccf91a817
--- /dev/null
+++ b/include/exec/cpu-tlb.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * cpu-tlb.h: MMUAccessType definitions
+ *
+ */
+
+#ifndef EXEC_CPU_TLB_H
+#define EXEC_CPU_TLB_H
+
+typedef enum MMUAccessType {
+    MMU_DATA_LOAD  = 0,
+    MMU_DATA_STORE = 1,
+    MMU_INST_FETCH = 2
+} MMUAccessType;
+
+#endif
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 5c999966de..3784316471 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -63,6 +63,7 @@
 #define CPU_LDST_H
 
 #include "exec/memopidx.h"
+#include "exec/cpu-tlb.h"
 #include "qemu/int128.h"
 #include "cpu.h"
 
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index d2cb0981f4..537f465f54 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -381,6 +381,9 @@ static inline void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
 {
 }
 #endif
+
+#include "exec/cpu-tlb.h"
+
 /**
  * probe_access:
  * @env: CPUArchState
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c9d41e4ece..0b844cbf27 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -55,12 +55,6 @@ typedef struct CPUClass CPUClass;
 DECLARE_CLASS_CHECKERS(CPUClass, CPU,
                        TYPE_CPU)
 
-typedef enum MMUAccessType {
-    MMU_DATA_LOAD  = 0,
-    MMU_DATA_STORE = 1,
-    MMU_INST_FETCH = 2
-} MMUAccessType;
-
 typedef struct CPUWatchpoint CPUWatchpoint;
 
 /* see tcg-cpu-ops.h */
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index e13898553a..2c81fff428 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -10,6 +10,7 @@
 #ifndef TCG_CPU_OPS_H
 #define TCG_CPU_OPS_H
 
+#include "exec/cpu-tlb.h"
 #include "hw/core/cpu.h"
 
 struct TCGCPUOps {
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3f05748ea4..4c006aa6b4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -25,6 +25,7 @@
 #ifndef TARGET_ARM_INTERNALS_H
 #define TARGET_ARM_INTERNALS_H
 
+#include "exec/cpu-tlb.h"
 #include "hw/registerfields.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "syndrome.h"
diff --git a/target/mips/internal.h b/target/mips/internal.h
index ac6e03e2f2..f0f885005f 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -8,6 +8,7 @@
 #ifndef MIPS_INTERNAL_H
 #define MIPS_INTERNAL_H
 
+#include "exec/cpu-tlb.h"
 #include "exec/memattrs.h"
 #ifdef CONFIG_TCG
 #include "tcg/tcg-internal.h"
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 6aa9484f34..20010f53e7 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -18,6 +18,8 @@
 #ifndef PPC_INTERNAL_H
 #define PPC_INTERNAL_H
 
+#include "exec/cpu-tlb.h"
+
 #define FUNC_MASK(name, ret_type, size, max_val)                  \
 static inline ret_type name(uint##size##_t start,                 \
                               uint##size##_t end)                 \
diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
index 3892b693d6..c6fcdebac5 100644
--- a/target/ppc/mmu-hash32.h
+++ b/target/ppc/mmu-hash32.h
@@ -3,6 +3,8 @@
 
 #ifndef CONFIG_USER_ONLY
 
+#include "exec/cpu-tlb.h"
+
 hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash);
 bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
                       hwaddr *raddrp, int *psizep, int *protp, int mmu_idx,
diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
index 1496955d38..002dc4aec7 100644
--- a/target/ppc/mmu-hash64.h
+++ b/target/ppc/mmu-hash64.h
@@ -3,6 +3,8 @@
 
 #ifndef CONFIG_USER_ONLY
 
+#include "exec/cpu-tlb.h"
+
 #ifdef TARGET_PPC64
 void dump_slb(PowerPCCPU *cpu);
 int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
index 4c768aa5cc..601967ae82 100644
--- a/target/ppc/mmu-radix64.h
+++ b/target/ppc/mmu-radix64.h
@@ -3,6 +3,8 @@
 
 #ifndef CONFIG_USER_ONLY
 
+#include "exec/cpu-tlb.h"
+
 /* Radix Quadrants */
 #define R_EADDR_MASK            0x3FFFFFFFFFFFFFFF
 #define R_EADDR_VALID_MASK      0xC00FFFFFFFFFFFFF
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 6fc8cad2d5..b451b702d0 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -10,6 +10,8 @@
 #ifndef S390X_INTERNAL_H
 #define S390X_INTERNAL_H
 
+#include "exec/cpu-tlb.h"
+
 #include "cpu.h"
 
 #ifndef CONFIG_USER_ONLY
-- 
2.34.1


