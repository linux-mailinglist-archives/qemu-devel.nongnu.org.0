Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6F650A527
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:22:32 +0200 (CEST)
Received: from localhost ([::1]:38062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZZf-0003Ob-Nx
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZe-0007zw-Nx
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:26 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZc-0006L6-N2
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:26 -0400
Received: by mail-pl1-x634.google.com with SMTP id t12so5163689pll.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r91YNURcl3OsfIz0k5J10dSPdewEyH2V8uCqRyhHlGU=;
 b=BUi0cdHDnRq0rFpBKFQ9NjTgRcahaeE7EqOBvWIpBUTeH6jb3PYcj+ZEZsTODkk0k6
 1Et2qdm4Up+3eGeNdFxg1IOlbHeaqLrgK15pNacyVzBoDbs1fFf5iIe2pqj4H8T3BFGQ
 e60iMqU830PcWCK6TVaPGn6lT9pfiOLOUBZarR2c/5RbxVYS0ufAoKAtPnnqwQfjdKGW
 nAHGU7rAx51KHqn2AcXJA5sxtyQ62BLgwAgbHz9uU+yrc9fRkL8AAaJ1w5yp4Tj/8ba8
 fZXx2/DgZlA4SbbTTNHD/e9KPR+YYkJaKSZ0zJ+rZy1RpcOuCE5i3LlTetlV5k4Pf3kA
 dZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r91YNURcl3OsfIz0k5J10dSPdewEyH2V8uCqRyhHlGU=;
 b=teyzbhVn09TesXSbSIV0tsMybXUU/I1c/B9bSwnlrTzgDWrTsR1oAUktDG5T5yhvpg
 5UseMJ8guvMDm2/i5/fGSY5QtLIXznTnL12O3+a3yu8IskSTHPm22XFiINZhyjl2zr26
 JZN9qVpv2ixUhK+lQhC2IDnoYnGJLm1wWhiRBHZTw44fmnvK4bvyaN45MP8RHuHr7Vbc
 uocg6vUH6AaTJRygjwNoWYn2JZ5BGoKKSM2lNBC+ZmOoSSXPXG1xoMOs5QX9Li9v+gD1
 /wARt7xurL5oHBmAgPMPcxXOXjg2JiSFxdyqGRnpwRWYp5y5uAw6oK0IolTvb/zX180P
 tMdQ==
X-Gm-Message-State: AOAM530doFM7etvrXi7tJFVYq1yZ1pALyWznQDXQ0cM4ROqB/mUYwaZt
 M35fQ/Sha8wnDN7NcyuGYsWFFEqF8TZP1g==
X-Google-Smtp-Source: ABdhPJxM0+ZOAdo+RFInoUYoZrvo2QEFP1uAGxR3o5E5p0rLdQq6KOx6lmbZrwPNZ94j5JhvA6vZAA==
X-Received: by 2002:a17:902:7789:b0:156:8b5c:606f with SMTP id
 o9-20020a170902778900b001568b5c606fmr46920pll.100.1650554303416; 
 Thu, 21 Apr 2022 08:18:23 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 29/64] target/nios2: Use hw/registerfields.h for CR_TLBMISC
 fields
Date: Thu, 21 Apr 2022 08:17:00 -0700
Message-Id: <20220421151735.31996-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use FIELD_EX32 and FIELD_DP32 instead of managing the
masking by hand.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       | 29 +++++++++++++++++++----------
 target/nios2/helper.c    |  7 ++-----
 target/nios2/mmu.c       | 35 +++++++++++++++++------------------
 target/nios2/translate.c |  2 +-
 4 files changed, 39 insertions(+), 34 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 54b592c422..ec34cebf72 100644
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
index 31d83e0291..a56aaaea18 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -281,11 +281,8 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
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
index baa22c5101..4191db1342 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -925,7 +925,7 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
     qemu_fprintf(f, " mmu write: VPN=%05X PID %02X TLBACC %08X\n",
                  env->mmu.pteaddr_wr & R_CR_PTEADDR_VPN_MASK,
-                 (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4,
+                 FIELD_EX32(env->mmu.tlbmisc_wr, CR_TLBMISC, PID),
                  env->mmu.tlbacc_wr);
 #endif
     qemu_fprintf(f, "\n\n");
-- 
2.34.1


