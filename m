Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8544D1110
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:34:48 +0100 (CET)
Received: from localhost ([::1]:52860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUMp-0008I0-RB
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:34:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU99-0005Ei-4j
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:42 -0500
Received: from [2607:f8b0:4864:20::432] (port=36733
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU96-0006L1-13
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:38 -0500
Received: by mail-pf1-x432.google.com with SMTP id z16so16597345pfh.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PeEk0hRIn7gVJ9vzq1rBS+HNY64ueqVJYCGvJDWDHRY=;
 b=huzGOJr4yd4nEsl/mgLSTvP6N8FX8fx1aDGpI9gqrLphO1baeQaNAXivrS36duL2fR
 VdHYnmOhQ53GmszxiKsS+dj+2KS0RumOez7DfmiFh3pH3JukXyFrreU2LNcC7lJ5evWy
 BFlkA6sWHxaq37Ei2+CG72lTKkE5YsX4LazRSKFAaNa5aGio9bglRqIWfp5roXR1z4af
 UnbYTYPbyCuAsCJ/pVsG40sSl0nU2aNE92LAf1hGKf+OpWPMrLHG5DLQbaVdjbvXef3n
 AKfn7YFXj/5cDEN++cjjYTQejgYFi3QcLNn05ktvGW1FtaRgm/0eXhq1UqHXM7xydiZe
 Efsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PeEk0hRIn7gVJ9vzq1rBS+HNY64ueqVJYCGvJDWDHRY=;
 b=4uPEgsZpISO8byU4X3JhvE8qwDyytdn2oROl1aX6WGm0vVeCj4O+q6Vnh+xlP0dEY9
 bxLv4eGPv4UPRKuFRyzM8ndYYN+D3kefYfStJGTIY3Fv4O4lxg+opfgSmDZAEXHHyLEt
 /c14HbkyaARqewB3OcaStBLc2IGEz+ZmdPvSniVW+EA72DWxwXk6G+InB5vy1UF0myxN
 iXTbtL5Kk3f+pFguaNfGZ6MsXr1I2UlU/vfMFqX7GGW2m8x537g/xo5xXGATjMWCtgpI
 fX1GemO2G2rU97ujLYEz23N8XkmgHY/cdnupAh+EbBlML5sx3opYjexTrQozUbLszoyy
 J9/Q==
X-Gm-Message-State: AOAM530bki7/PYoU8x2tN2vPjsdhOK4K/FUtGu8srUgscXWf4ELrLulT
 LEl6w45HBrUM8+gXiHMj1FOzN5xzeffvrA==
X-Google-Smtp-Source: ABdhPJxJJs0X4E56BdlSGPiTS8bb6IbK9FRoT3qa5CqTzWd5VIVDp+12DCNJ80VXA+tQ3oaKp0FMSg==
X-Received: by 2002:aa7:928c:0:b0:4f3:dca7:8b37 with SMTP id
 j12-20020aa7928c000000b004f3dca78b37mr16866492pfa.41.1646724033066; 
 Mon, 07 Mar 2022 23:20:33 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/33] target/nios2: Use hw/registerfields.h for CR_TLBMISC
 fields
Date: Mon,  7 Mar 2022 21:19:47 -1000
Message-Id: <20220308072005.307955-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       | 28 ++++++++++++++++++----------
 target/nios2/helper.c    |  7 ++-----
 target/nios2/mmu.c       | 33 +++++++++++++++------------------
 target/nios2/translate.c |  2 +-
 4 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 024ef3ccc0..3857848f7c 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -131,16 +131,24 @@ FIELD(CR_TLBACC, IG, 25, 7)
 #define CR_TLBACC_G  (1u << R_CR_TLBACC_G_SHIFT)
 
 #define CR_TLBMISC       10
-#define   CR_TLBMISC_WAY_SHIFT 20
-#define   CR_TLBMISC_WAY_MASK  (0xF << CR_TLBMISC_WAY_SHIFT)
-#define   CR_TLBMISC_RD        (1 << 19)
-#define   CR_TLBMISC_WR        (1 << 18)
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
+FIELD(CR_TLBMISC, WR, 18, 1)
+FIELD(CR_TLBMISC, RD, 19, 1)
+FIELD(CR_TLBMISC, WAY, 20, 4)
+FIELD(CR_TLBMISC, EE, 24, 1)
+
+#define CR_TLBMISC_RD    (1u << R_CR_TLBMISC_RD_SHIFT)
+#define CR_TLBMISC_WR    (1u << R_CR_TLBMISC_WR_SHIFT)
+#define CR_TLBMISC_DBL   (1u << R_CR_TLBMISC_DBL_SHIFT)
+#define CR_TLBMISC_BAD   (1u << R_CR_TLBMISC_BAD_SHIFT)
+#define CR_TLBMISC_PERM  (1u << R_CR_TLBMISC_PERM_SHIFT)
+#define CR_TLBMISC_D     (1u << R_CR_TLBMISC_D_SHIFT)
+
 #define CR_ENCINJ        11
 #define CR_BADADDR       12
 #define CR_CONFIG        13
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 37fb53dadb..93338e86f0 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -276,11 +276,8 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         return false;
     }
 
-    if (access_type == MMU_INST_FETCH) {
-        env->tlbmisc &= ~CR_TLBMISC_D;
-    } else {
-        env->tlbmisc |= CR_TLBMISC_D;
-    }
+    env->tlbmisc = FIELD_DP32(env->tlbmisc, CR_TLBMISC, D,
+                              access_type == MMU_INST_FETCH);
     env->pteaddr = FIELD_DP32(env->pteaddr, CR_PTEADDR, VPN,
                               address >> TARGET_PAGE_BITS);
     env->mmu.pteaddr_wr = env->pteaddr;
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index d6221936f7..c8b74b5479 100644
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
     if (env->tlbmisc & CR_TLBMISC_WR) {
-        int way = (env->tlbmisc >> CR_TLBMISC_WAY_SHIFT);
+        int way = FIELD_EX32(env->tlbmisc, CR_TLBMISC, WAY);
         int vpn = FIELD_EX32(env->mmu.pteaddr_wr, CR_PTEADDR, VPN);
-        int pid = (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4;
+        int pid = FIELD_EX32(env->mmu.tlbmisc_wr, CR_TLBMISC, PID);
         int g = FIELD_EX32(v, CR_TLBACC, G);
         int valid = FIELD_EX32(vpn, CR_TLBACC, PFN) < 0xC0000;
         Nios2TLBEntry *entry =
@@ -117,10 +117,8 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
             entry->data = newData;
         }
         /* Auto-increment tlbmisc.WAY */
-        env->tlbmisc =
-            (env->tlbmisc & ~CR_TLBMISC_WAY_MASK) |
-            (((way + 1) & (cpu->tlb_num_ways - 1)) <<
-             CR_TLBMISC_WAY_SHIFT);
+        env->tlbmisc = FIELD_DP32(env->tlbmisc, CR_TLBMISC, WAY,
+                                  (way + 1) & (cpu->tlb_num_ways - 1));
     }
 
     /* Writes to TLBACC don't change the read-back value */
@@ -130,24 +128,25 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
 void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
 {
     Nios2CPU *cpu = env_archcpu(env);
+    uint32_t new_pid = FIELD_EX32(v, CR_TLBMISC, PID);
+    uint32_t old_pid = FIELD_EX32(env->mmu.tlbmisc_wr, CR_TLBMISC, PID);
+    uint32_t way = FIELD_EX32(v, CR_TLBMISC, WAY);
 
-    trace_nios2_mmu_write_tlbmisc(v >> CR_TLBMISC_WAY_SHIFT,
+    trace_nios2_mmu_write_tlbmisc(way,
                                   (v & CR_TLBMISC_RD) ? 'R' : '.',
                                   (v & CR_TLBMISC_WR) ? 'W' : '.',
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
@@ -156,10 +155,8 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
         env->tlbacc &= R_CR_TLBACC_IG_MASK;
         env->tlbacc |= entry->data;
         env->tlbacc |= (entry->tag & (1 << 11)) ? CR_TLBACC_G : 0;
-        env->tlbmisc =
-            (v & ~CR_TLBMISC_PID_MASK) |
-            ((entry->tag & ((1 << cpu->pid_num_bits) - 1)) <<
-             CR_TLBMISC_PID_SHIFT);
+        env->tlbmisc = FIELD_DP32(v, CR_TLBMISC, PID,
+                                  entry->tag & ((1 << cpu->pid_num_bits) - 1));
         env->pteaddr = FIELD_DP32(env->pteaddr, CR_PTEADDR, VPN,
                                   entry->tag >> TARGET_PAGE_BITS);
     } else {
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 3cdef16519..77b3bf05f3 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -910,7 +910,7 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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


