Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF84251070A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:32:03 +0200 (CEST)
Received: from localhost ([::1]:41896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njPyk-00043A-NS
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmi-0002gQ-Uk
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:38 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:41733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmg-0004RE-AK
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:36 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so3310335pjf.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JmB13VTyuzzFASmlJJ9jmm7vtSLnsoUw3SQpc47Yi90=;
 b=g0Pd1C5CnXSYSs52J5VmMJeCH1fTh/QhEmbJ92GlzLKsUsx1OfJRFDCQ6/gr2svX0r
 Wmx+KWOZeGMnpaff+K2yht169rRV7mshCfHyyX0UPsHHLlxYPsUa+g21H8J4VTthKHbl
 U7RiLcypbQy3dOZFP2qs+mgsUSTCyCmNWWcaCsO1Dbz/xJJGrmFTdyzjaFg711FuhGuX
 lP70vfNK19eNE1N7fLOhgF8cJ/g7mYZ4+1euoFmKjzJ6Cde5W72LzDCjDeb6/jYcC+kN
 IEP+yetcd1IL4z4hsQU3GJcIbDeOfqzpOqUznwwbaEOyicv6ZzZM+xQj5jRejACahF0s
 57jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JmB13VTyuzzFASmlJJ9jmm7vtSLnsoUw3SQpc47Yi90=;
 b=EuHrMI9zXqycqqbsWxlXAoRwIXfAfwAKGQpWL5k2JPnAYgeYwEJhUJTzq+8iC5Pk4t
 eEavElYnTKZEBJ4oOVuRSOn5wglKz4HIgMxNiymO9WaqR6Q/tmQQ+4GDaM6Ff5sSHJWq
 GWN0JBL8EsNnqn6KaF30i/20TQyArM7J1k8xmQFYoBZmC4CDSKOFW9ivIa150LSaCybb
 xwa75ILTibgC4yeDRGkjDKgAGQyO/A1xhA+o6/f2nzAaq0XbK/bJr9KTE0srfvDHMVj9
 XmuSzCX+WnUBQsWYal7ekmvQEIpkjWBj7R8LIetUIXD7XeDTg3I4fyjFDltrDYOiCZkQ
 kUrg==
X-Gm-Message-State: AOAM532za25DSytwxTHOCyw798k0b9SXIz8wYSJuZ6U72AfbZELDVVsG
 SR9Mak2niJ8JXMF8+2OIA7OOXNDNgiD3eA==
X-Google-Smtp-Source: ABdhPJwAwG1D+Cpu25yH+n27WTcoYLjaUe6+t+1LgbSXOUS7gw68v0n/0u3NbGG9ownR9od2fZy2Ag==
X-Received: by 2002:a17:902:a710:b0:156:5650:f94a with SMTP id
 w16-20020a170902a71000b001565650f94amr24026328plq.86.1650997172907; 
 Tue, 26 Apr 2022 11:19:32 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/68] target/nios2: Use hw/registerfields.h for CR_TLBACC
 fields
Date: Tue, 26 Apr 2022 11:18:26 -0700
Message-Id: <20220426181907.103691-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Retain the helper macros for single bit fields as aliases to
the longer R_*_MASK names.  Use FIELD_EX32 and FIELD_DP32
instead of manually manipulating the fields.

Since we're rewriting the references to CR_TLBACC_IGN_* anyway,
we correct the name of this field to IG, which is its name in
the official CPU documentation.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-28-richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 23 +++++++++++++++--------
 target/nios2/mmu.c | 16 ++++++++--------
 2 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index a6811ff7ea..bfa86edd97 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -115,14 +115,21 @@ FIELD(CR_PTEADDR, VPN, 2, 20)
 FIELD(CR_PTEADDR, PTBASE, 22, 10)
 
 #define CR_TLBACC        9
-#define   CR_TLBACC_IGN_SHIFT 25
-#define   CR_TLBACC_IGN_MASK  (0x7F << CR_TLBACC_IGN_SHIFT)
-#define   CR_TLBACC_C         (1 << 24)
-#define   CR_TLBACC_R         (1 << 23)
-#define   CR_TLBACC_W         (1 << 22)
-#define   CR_TLBACC_X         (1 << 21)
-#define   CR_TLBACC_G         (1 << 20)
-#define   CR_TLBACC_PFN_MASK  0x000FFFFF
+
+FIELD(CR_TLBACC, PFN, 0, 20)
+FIELD(CR_TLBACC, G, 20, 1)
+FIELD(CR_TLBACC, X, 21, 1)
+FIELD(CR_TLBACC, W, 22, 1)
+FIELD(CR_TLBACC, R, 23, 1)
+FIELD(CR_TLBACC, C, 24, 1)
+FIELD(CR_TLBACC, IG, 25, 7)
+
+#define CR_TLBACC_C      R_CR_TLBACC_C_MASK
+#define CR_TLBACC_R      R_CR_TLBACC_R_MASK
+#define CR_TLBACC_W      R_CR_TLBACC_W_MASK
+#define CR_TLBACC_X      R_CR_TLBACC_X_MASK
+#define CR_TLBACC_G      R_CR_TLBACC_G_MASK
+
 #define CR_TLBMISC       10
 #define   CR_TLBMISC_WAY_SHIFT 20
 #define   CR_TLBMISC_WAY_MASK  (0xF << CR_TLBMISC_WAY_SHIFT)
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 75afc56daf..826cd2afb4 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -49,7 +49,7 @@ unsigned int mmu_translate(CPUNios2State *env,
         }
 
         lu->vaddr = vaddr & TARGET_PAGE_MASK;
-        lu->paddr = (entry->data & CR_TLBACC_PFN_MASK) << TARGET_PAGE_BITS;
+        lu->paddr = FIELD_EX32(entry->data, CR_TLBACC, PFN) << TARGET_PAGE_BITS;
         lu->prot = ((entry->data & CR_TLBACC_R) ? PAGE_READ : 0) |
                    ((entry->data & CR_TLBACC_W) ? PAGE_WRITE : 0) |
                    ((entry->data & CR_TLBACC_X) ? PAGE_EXEC : 0);
@@ -86,27 +86,27 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
     CPUState *cs = env_cpu(env);
     Nios2CPU *cpu = env_archcpu(env);
 
-    trace_nios2_mmu_write_tlbacc(v >> CR_TLBACC_IGN_SHIFT,
+    trace_nios2_mmu_write_tlbacc(FIELD_EX32(v, CR_TLBACC, IG),
                                  (v & CR_TLBACC_C) ? 'C' : '.',
                                  (v & CR_TLBACC_R) ? 'R' : '.',
                                  (v & CR_TLBACC_W) ? 'W' : '.',
                                  (v & CR_TLBACC_X) ? 'X' : '.',
                                  (v & CR_TLBACC_G) ? 'G' : '.',
-                                 v & CR_TLBACC_PFN_MASK);
+                                 FIELD_EX32(v, CR_TLBACC, PFN));
 
     /* if tlbmisc.WE == 1 then trigger a TLB write on writes to TLBACC */
     if (env->ctrl[CR_TLBMISC] & CR_TLBMISC_WR) {
         int way = (env->ctrl[CR_TLBMISC] >> CR_TLBMISC_WAY_SHIFT);
         int vpn = FIELD_EX32(env->mmu.pteaddr_wr, CR_PTEADDR, VPN);
         int pid = (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4;
-        int g = (v & CR_TLBACC_G) ? 1 : 0;
-        int valid = ((vpn & CR_TLBACC_PFN_MASK) < 0xC0000) ? 1 : 0;
+        int g = FIELD_EX32(v, CR_TLBACC, G);
+        int valid = FIELD_EX32(vpn, CR_TLBACC, PFN) < 0xC0000;
         Nios2TLBEntry *entry =
             &env->mmu.tlb[(way * cpu->tlb_num_ways) +
                           (vpn & env->mmu.tlb_entry_mask)];
         uint32_t newTag = (vpn << 12) | (g << 11) | (valid << 10) | pid;
         uint32_t newData = v & (CR_TLBACC_C | CR_TLBACC_R | CR_TLBACC_W |
-                                CR_TLBACC_X | CR_TLBACC_PFN_MASK);
+                                CR_TLBACC_X | R_CR_TLBACC_PFN_MASK);
 
         if ((entry->tag != newTag) || (entry->data != newData)) {
             if (entry->tag & (1 << 10)) {
@@ -153,7 +153,7 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
             &env->mmu.tlb[(way * cpu->tlb_num_ways) +
                           (vpn & env->mmu.tlb_entry_mask)];
 
-        env->ctrl[CR_TLBACC] &= CR_TLBACC_IGN_MASK;
+        env->ctrl[CR_TLBACC] &= R_CR_TLBACC_IG_MASK;
         env->ctrl[CR_TLBACC] |= entry->data;
         env->ctrl[CR_TLBACC] |= (entry->tag & (1 << 11)) ? CR_TLBACC_G : 0;
         env->ctrl[CR_TLBMISC] =
@@ -208,7 +208,7 @@ void dump_mmu(CPUNios2State *env)
                     entry->tag >> 12,
                     entry->tag & ((1 << cpu->pid_num_bits) - 1),
                     (entry->tag & (1 << 11)) ? 'G' : '-',
-                    entry->data & CR_TLBACC_PFN_MASK,
+                    FIELD_EX32(entry->data, CR_TLBACC, PFN),
                     (entry->data & CR_TLBACC_C) ? 'C' : '-',
                     (entry->data & CR_TLBACC_R) ? 'R' : '-',
                     (entry->data & CR_TLBACC_W) ? 'W' : '-',
-- 
2.34.1


