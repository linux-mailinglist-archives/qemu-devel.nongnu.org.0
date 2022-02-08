Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFC24ADE9B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:48:07 +0100 (CET)
Received: from localhost ([::1]:50606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTew-0002sU-MD
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:48:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSLt-0001RC-7D
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:24:22 -0500
Received: from [2607:f8b0:4864:20::102c] (port=45669
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSLr-0000Ql-7m
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:24:20 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 g15-20020a17090a67cf00b001b7d5b6bedaso3131652pjm.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UWXw31Ssif2lgsyaqU6PaE6PgTRRfqWihjZzyOMk/e0=;
 b=L+kxNgqDw9JON2YVfL0KcHsRX41CSSoR4a7cDp6FhykLY/NkXecxw8IQ1O5+wyynUf
 Xh0MMsDhOuzNkl09vNq6Cti9lWCJ7APK9UeCkg1rzhUBDEORvwipGXtWilcmEDP8z5JR
 DeFj87tPVCia3x+ZarEIaJ019wuWQWu8FDbrkwcEzwWtzblzPeVr3avdY1Q79zD4F3Fe
 V8y7R9wELvPgOtahsNeCebdzSsootTwK+CPFWN5OFWWa/dHu+DJBxdS5HVPjRc7E+PVE
 2usTPlQqXiRM7g5eJQxTERxQvu4kocUrmud5HYrpFvGGe+D0MuHkpacTrmBSGR0Dm95h
 yDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UWXw31Ssif2lgsyaqU6PaE6PgTRRfqWihjZzyOMk/e0=;
 b=2GtnbpxOFYjK+JztADhxm9yvLTpyRfpwc5UnzMfruFnSmdmPVASK5CMjhu+kB9gjjJ
 S0Yz//wmfmOu0apB5Iyd5MbSaPmiI2PHItIiCzLpeuPW0QGcW8zqk8Bx9U4PcoPlWOpE
 p66iz529m2UsvHLO8EDK32t4sMdfUjjYqF2fuodPjSoFrhRqC5CwZ72qJMaHx+VJFGZY
 RxYGqrptJmQH3jczLNg8j5MbgGUbqYunoy1y93eSJke6PIuKZ3aZ9gnzibBfigG46RWk
 ts5aePhQHB0CPCN9zLOjfMa/F/RlgkcKkgR5y/2fq6Av7kbop276j/02UZUETpUAQ3nU
 uBIw==
X-Gm-Message-State: AOAM530YhkUyMp1ZFQkL9/i2Jgwlc9N+izf/CZid0nJgaxep28dkDrER
 DMREWwaKNDzQRUJEk98FTK40BpvliKE=
X-Google-Smtp-Source: ABdhPJxoMLQz0rbL0f6Mv68smgjYsB7EjPYQ11oU32Ry3s3hRinXaRP7wMC/wFX36AVblLg/Q2ibmw==
X-Received: by 2002:a17:90b:1802:: with SMTP id
 lw2mr1938731pjb.232.1644333857389; 
 Tue, 08 Feb 2022 07:24:17 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id j23sm11711265pgb.75.2022.02.08.07.24.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Feb 2022 07:24:17 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 11/13] exec/cpu_ldst: Restrict TCG-specific code
Date: Tue,  8 Feb 2022 16:22:41 +0100
Message-Id: <20220208152243.16452-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208152243.16452-1-f4bug@amsat.org>
References: <20220208152243.16452-1-f4bug@amsat.org>
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu_ldst.h | 53 ++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 5c999966de..0932096d29 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -321,6 +321,8 @@ void cpu_atomic_sto_le_mmu(CPUArchState *env, target_ulong addr, Int128 val,
 void cpu_atomic_sto_be_mmu(CPUArchState *env, target_ulong addr, Int128 val,
                            MemOpIdx oi, uintptr_t retaddr);
 
+#ifdef CONFIG_TCG
+
 #if defined(CONFIG_USER_ONLY)
 
 extern __thread uintptr_t helper_retaddr;
@@ -374,9 +376,34 @@ static inline CPUTLBEntry *tlb_entry(CPUArchState *env, uintptr_t mmu_idx,
 {
     return &env_tlb(env)->f[mmu_idx].table[tlb_index(env, mmu_idx, addr)];
 }
-
 #endif /* defined(CONFIG_USER_ONLY) */
 
+/**
+ * tlb_vaddr_to_host:
+ * @env: CPUArchState
+ * @addr: guest virtual address to look up
+ * @access_type: 0 for read, 1 for write, 2 for execute
+ * @mmu_idx: MMU index to use for lookup
+ *
+ * Look up the specified guest virtual index in the TCG softmmu TLB.
+ * If we can translate a host virtual address suitable for direct RAM
+ * access, without causing a guest exception, then return it.
+ * Otherwise (TLB entry is for an I/O access, guest software
+ * TLB fill required, etc) return NULL.
+ */
+#ifdef CONFIG_USER_ONLY
+static inline void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
+                                      MMUAccessType access_type, int mmu_idx)
+{
+    return g2h(env_cpu(env), addr);
+}
+#else
+void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
+                        MMUAccessType access_type, int mmu_idx);
+#endif
+
+#endif /* CONFIG_TCG */
+
 #ifdef TARGET_WORDS_BIGENDIAN
 # define cpu_lduw_data        cpu_lduw_be_data
 # define cpu_ldsw_data        cpu_ldsw_be_data
@@ -450,28 +477,4 @@ static inline int cpu_ldsw_code(CPUArchState *env, abi_ptr addr)
     return (int16_t)cpu_lduw_code(env, addr);
 }
 
-/**
- * tlb_vaddr_to_host:
- * @env: CPUArchState
- * @addr: guest virtual address to look up
- * @access_type: 0 for read, 1 for write, 2 for execute
- * @mmu_idx: MMU index to use for lookup
- *
- * Look up the specified guest virtual index in the TCG softmmu TLB.
- * If we can translate a host virtual address suitable for direct RAM
- * access, without causing a guest exception, then return it.
- * Otherwise (TLB entry is for an I/O access, guest software
- * TLB fill required, etc) return NULL.
- */
-#ifdef CONFIG_USER_ONLY
-static inline void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
-                                      MMUAccessType access_type, int mmu_idx)
-{
-    return g2h(env_cpu(env), addr);
-}
-#else
-void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
-                        MMUAccessType access_type, int mmu_idx);
-#endif
-
 #endif /* CPU_LDST_H */
-- 
2.34.1


