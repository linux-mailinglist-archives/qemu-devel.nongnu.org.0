Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538FA4D4677
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:08:01 +0100 (CET)
Received: from localhost ([::1]:36506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHaK-0001Jc-EK
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:08:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxR-0005aP-Jd
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:49 -0500
Received: from [2607:f8b0:4864:20::1036] (port=34514
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxP-0007yF-QC
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:49 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 k5-20020a17090a3cc500b001befa0d3102so6092030pjd.1
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GADV/jExPWz+mF0nwm5rQZ+l5e8TEkrJvePYWSdN3A0=;
 b=RE03IV6b/3dyMzGnR7wG72Vp3/nmdtJZcyuEzlSI82IEs73wUWWmSTNgbwMHzQpDOP
 ryUM1/Fbj3KbuFfXDm/1N0TPUBP3kW/SyuPrRPyXph/DAaWNQGmk/CbLr5CecRzZlb+8
 szr4N2FXhTz7fFegQBo/SP8K/ahvgjzSvAAeMkwQZYqpgAlBWYZdUIDjD51KO0HnvYCI
 Bwc92zX1c+lj8mErM3CKFDv3+svmiEuxVSQCjOY0WCpyNtufQah+Y/cQP9F6ASBnEIT9
 4lxhuyH38B6LiDnCt/nnFAtAfj1Ao9KnfRRyu4JzjTCO3283caHTauIrUurGnEoEoG2Q
 B2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GADV/jExPWz+mF0nwm5rQZ+l5e8TEkrJvePYWSdN3A0=;
 b=eVBIPOe25JNT6fL20fPAVD1KW5xHX8sD9v4lMYznnCNmxvGXiZ20yYj5VYe9XtUgyk
 q9p7Pdp9mlRszyIVqvRIkcmkjYS4GTBNJo6dAPE7rEOmTMXcX1+5c/1HzuqSxjSS3zWq
 R5M08DpkksHtj4BGQ/p87BVSgARmQwxeNgcKGnyZl1QNnWwgoQgxXDi8W0/D+KV6Ruov
 l/kTBMz95qrlwQ911Bxz7JoxpsDfQsJWVT3wgYORDDkAOv6Vmsnlu7yoJyo697Vjun9W
 VT44E7WqmUeoX7/XPC4r0APtgXSBjBagMyTybpPbFiROCBs2ltY6i5pTxwWiE2WIAqBd
 HnOA==
X-Gm-Message-State: AOAM531bFRVjFWV6U0DwSyXj8MoscvT9T57gECDCVE4nPom6XctpN8EH
 Nc7mCQk2FRxiRpT9cCfMh9Lc6GVmkRNlhA==
X-Google-Smtp-Source: ABdhPJzXDflfc+ML5LCbYZ6AvJIcV+GlP35brHPretWzTkfDnBUpQgrP+cIzgxItE2LatMEqXZWGfg==
X-Received: by 2002:a17:902:9a0a:b0:14a:199:bc5c with SMTP id
 v10-20020a1709029a0a00b0014a0199bc5cmr4424586plp.10.1646911666313; 
 Thu, 10 Mar 2022 03:27:46 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/48] target/nios2: Use hw/registerfields.h for CR_TLBMISC
 fields
Date: Thu, 10 Mar 2022 03:26:55 -0800
Message-Id: <20220310112725.570053-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use FIELD_EX32 and FIELD_DP32 instead of managing the
masking by hand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       | 29 +++++++++++++++++++----------
 target/nios2/helper.c    |  7 ++-----
 target/nios2/mmu.c       | 35 +++++++++++++++++------------------
 target/nios2/translate.c |  2 +-
 4 files changed, 39 insertions(+), 34 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 81472be686..7f805a933e 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -131,16 +131,25 @@ FIELD(CR_TLBACC, IG, 25, 7)
 #define CR_TLBACC_G      R_CR_TLBACC_G_MASK
 
 #define CR_TLBMISC       10
-#define   CR_TLBMISC_WAY_SHIFT 20
-#define   CR_TLBMISC_WAY_MASK  (0xF << CR_TLBMISC_WAY_SHIFT)
-#define   CR_TLBMISC_RD        (1 << 19)
-#define   CR_TLBMISC_WE        (1 << 18)
-#define   CR_TLBMISC_PID_SHIFT 4
-#define   CR_TLBMISC_PID_MASK  (0x3FFF << CR_TLBMISC_PID_SHIFT)
-#define   CR_TLBMISC_DBL       (1 << 3)
-#define   CR_TLBMISC_BAD       (1 << 2)
-#define   CR_TLBMISC_PERM      (1 << 1)
-#define   CR_TLBMISC_D         (1 << 0)
+
+FIELD(CR_TLBMISC, D, 0, 1)
+FIELD(CR_TLBMISC, PERM, 1, 1)
+FIELD(CR_TLBMISC, BAD, 2, 1)
+FIELD(CR_TLBMISC, DBL, 3, 1)
+FIELD(CR_TLBMISC, PID, 4, 14)
+FIELD(CR_TLBMISC, WE, 18, 1)
+FIELD(CR_TLBMISC, RD, 19, 1)
+FIELD(CR_TLBMISC, WAY, 20, 4)
+FIELD(CR_TLBMISC, EE, 24, 1)
+
+#define CR_TLBMISC_EE    R_CR_TLBMISC_EE_MASK
+#define CR_TLBMISC_RD    R_CR_TLBMISC_RD_MASK
+#define CR_TLBMISC_WE    R_CR_TLBMISC_WE_MASK
+#define CR_TLBMISC_DBL   R_CR_TLBMISC_DBL_MASK
+#define CR_TLBMISC_BAD   R_CR_TLBMISC_BAD_MASK
+#define CR_TLBMISC_PERM  R_CR_TLBMISC_PERM_MASK
+#define CR_TLBMISC_D     R_CR_TLBMISC_D_MASK
+
 #define CR_ENCINJ        11
 #define CR_BADADDR       12
 #define CR_CONFIG        13
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 308d66ad93..52a49f7ead 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -301,11 +301,8 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         return false;
     }
 
-    if (access_type == MMU_INST_FETCH) {
-        env->ctrl[CR_TLBMISC] &= ~CR_TLBMISC_D;
-    } else {
-        env->ctrl[CR_TLBMISC] |= CR_TLBMISC_D;
-    }
+    env->ctrl[CR_TLBMISC] = FIELD_DP32(env->ctrl[CR_TLBMISC], CR_TLBMISC, D,
+                                       access_type != MMU_INST_FETCH);
     env->ctrl[CR_PTEADDR] = FIELD_DP32(env->ctrl[CR_PTEADDR], CR_PTEADDR, VPN,
                                        address >> TARGET_PAGE_BITS);
     env->mmu.pteaddr_wr = env->ctrl[CR_PTEADDR];
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 0f33ea5e04..d9b690b78e 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -33,7 +33,7 @@ unsigned int mmu_translate(CPUNios2State *env,
                            target_ulong vaddr, int rw, int mmu_idx)
 {
     Nios2CPU *cpu = env_archcpu(env);
-    int pid = (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4;
+    int pid = FIELD_EX32(env->mmu.tlbmisc_wr, CR_TLBMISC, PID);
     int vpn = vaddr >> 12;
     int way, n_ways = cpu->tlb_num_ways;
 
@@ -96,9 +96,9 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
 
     /* if tlbmisc.WE == 1 then trigger a TLB write on writes to TLBACC */
     if (env->ctrl[CR_TLBMISC] & CR_TLBMISC_WE) {
-        int way = (env->ctrl[CR_TLBMISC] >> CR_TLBMISC_WAY_SHIFT);
+        int way = FIELD_EX32(env->ctrl[CR_TLBMISC], CR_TLBMISC, WAY);
         int vpn = FIELD_EX32(env->mmu.pteaddr_wr, CR_PTEADDR, VPN);
-        int pid = (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4;
+        int pid = FIELD_EX32(env->mmu.tlbmisc_wr, CR_TLBMISC, PID);
         int g = FIELD_EX32(v, CR_TLBACC, G);
         int valid = FIELD_EX32(vpn, CR_TLBACC, PFN) < 0xC0000;
         Nios2TLBEntry *entry =
@@ -117,10 +117,9 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
             entry->data = newData;
         }
         /* Auto-increment tlbmisc.WAY */
-        env->ctrl[CR_TLBMISC] =
-            (env->ctrl[CR_TLBMISC] & ~CR_TLBMISC_WAY_MASK) |
-            (((way + 1) & (cpu->tlb_num_ways - 1)) <<
-             CR_TLBMISC_WAY_SHIFT);
+        env->ctrl[CR_TLBMISC] = FIELD_DP32(env->ctrl[CR_TLBMISC],
+                                           CR_TLBMISC, WAY,
+                                           (way + 1) & (cpu->tlb_num_ways - 1));
     }
 
     /* Writes to TLBACC don't change the read-back value */
@@ -130,24 +129,25 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
 void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
 {
     Nios2CPU *cpu = env_archcpu(env);
+    uint32_t new_pid = FIELD_EX32(v, CR_TLBMISC, PID);
+    uint32_t old_pid = FIELD_EX32(env->mmu.tlbmisc_wr, CR_TLBMISC, PID);
+    uint32_t way = FIELD_EX32(v, CR_TLBMISC, WAY);
 
-    trace_nios2_mmu_write_tlbmisc(v >> CR_TLBMISC_WAY_SHIFT,
+    trace_nios2_mmu_write_tlbmisc(way,
                                   (v & CR_TLBMISC_RD) ? 'R' : '.',
                                   (v & CR_TLBMISC_WE) ? 'W' : '.',
                                   (v & CR_TLBMISC_DBL) ? '2' : '.',
                                   (v & CR_TLBMISC_BAD) ? 'B' : '.',
                                   (v & CR_TLBMISC_PERM) ? 'P' : '.',
                                   (v & CR_TLBMISC_D) ? 'D' : '.',
-                                  (v & CR_TLBMISC_PID_MASK) >> 4);
+                                  new_pid);
 
-    if ((v & CR_TLBMISC_PID_MASK) !=
-        (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK)) {
-        mmu_flush_pid(env, (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >>
-                           CR_TLBMISC_PID_SHIFT);
+    if (new_pid != old_pid) {
+        mmu_flush_pid(env, old_pid);
     }
+
     /* if tlbmisc.RD == 1 then trigger a TLB read on writes to TLBMISC */
     if (v & CR_TLBMISC_RD) {
-        int way = (v >> CR_TLBMISC_WAY_SHIFT);
         int vpn = FIELD_EX32(env->mmu.pteaddr_wr, CR_PTEADDR, VPN);
         Nios2TLBEntry *entry =
             &env->mmu.tlb[(way * cpu->tlb_num_ways) +
@@ -156,10 +156,9 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
         env->ctrl[CR_TLBACC] &= R_CR_TLBACC_IG_MASK;
         env->ctrl[CR_TLBACC] |= entry->data;
         env->ctrl[CR_TLBACC] |= (entry->tag & (1 << 11)) ? CR_TLBACC_G : 0;
-        env->ctrl[CR_TLBMISC] =
-            (v & ~CR_TLBMISC_PID_MASK) |
-            ((entry->tag & ((1 << cpu->pid_num_bits) - 1)) <<
-             CR_TLBMISC_PID_SHIFT);
+        env->ctrl[CR_TLBMISC] = FIELD_DP32(v, CR_TLBMISC, PID,
+                                           entry->tag &
+                                           ((1 << cpu->pid_num_bits) - 1));
         env->ctrl[CR_PTEADDR] = FIELD_DP32(env->ctrl[CR_PTEADDR],
                                            CR_PTEADDR, VPN,
                                            entry->tag >> TARGET_PAGE_BITS);
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 9b81a2b29e..459e30b338 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -924,7 +924,7 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
     qemu_fprintf(f, " mmu write: VPN=%05X PID %02X TLBACC %08X\n",
                  env->mmu.pteaddr_wr & R_CR_PTEADDR_VPN_MASK,
-                 (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4,
+                 FIELD_EX32(env->mmu.tlbmisc_wr, CR_TLBMISC, PID),
                  env->mmu.tlbacc_wr);
 #endif
     qemu_fprintf(f, "\n\n");
-- 
2.25.1


