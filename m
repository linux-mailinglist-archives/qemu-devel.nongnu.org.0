Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3542D50A51A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:19:50 +0200 (CEST)
Received: from localhost ([::1]:58112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZX3-00061j-2U
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZa-0007mW-UW
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:22 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZZ-0006KS-4p
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:22 -0400
Received: by mail-pl1-x62b.google.com with SMTP id u15so1780057ple.4
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SnGYAMRPd2AIip4h6gfK80xy39D4M1+5zitHQBfnkAY=;
 b=M7FOXBOVT1TJ7SoK4u0CebdLbsZGcs0gJ6t4WAcBbE7HCsl45UYBcnrSwOK96Z8AqS
 KLYcpkHNo7c8dKbSe35cM8AcxNQYnrZlcXuq7VCBJ5d7bnq+lklNCfZCUa5PNjKWUtRs
 K+aTlMp8TfIMQs0WvSIZc+rk3ucgtz3wZBaj2jSvaMWqk6tKttmvH+Q7tNbPGUUasZmX
 1b1FgnfdLwwltGQYryLoppShTlqmIv443tsIVJOUoaG6PqtyreptQclyi0XB4h0kDzVk
 xO0DFt5J+a9vKLPbNsppkCf1uA9gIrKvEb58zhdgVChjeuI1WMLmQTtr4iO0uj2y86sI
 9jnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SnGYAMRPd2AIip4h6gfK80xy39D4M1+5zitHQBfnkAY=;
 b=FvXlIV0rSyLSPtQTTMR5g9hmMhuynjCElNBUGWq50tibBVW0fWKXAm6iLtvdd79G5L
 aqvz7zHqBqmwiMbS8tQL9tdBRUg6DbMGmyQycDh5ew1lFCbHCSvciKHxy+loiD0MBx3i
 J8REh4vs6DBELG27+chnWdywz/PD8g8BiVPqppDpCqkXHeIQSg+qM91a8uunyHBAdou4
 +WOcOyHnvN877Ioqb7hV0fIQ7iMSvVcunCQIiiitRjOYG99NmHH9GPfDYV7VXcW5s6Za
 /svRFe01k6p4BUXWHvRj5oedF8rba8pVHVo5lIhcJMyMhzbFjqsXdRkG5DZCAsVuJMTg
 1aSA==
X-Gm-Message-State: AOAM533UQ7AG/kznwKrSy5k/g96KQx0tb5tIqKnGT7VdoFkuh2lP8mDn
 /s8LpdcMq9LIwQWRiK4CeLZGEJ4WKlityQ==
X-Google-Smtp-Source: ABdhPJziX7UPro0p35BT2iro48El5alAzkomRN/8zhR0x0yJxM7bWt82zhacxpWR+K126vJdWH6Oxw==
X-Received: by 2002:a17:90a:be16:b0:1cd:5aef:69e8 with SMTP id
 a22-20020a17090abe1600b001cd5aef69e8mr120478pjs.233.1650554299812; 
 Thu, 21 Apr 2022 08:18:19 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 27/64] target/nios2: Use hw/registerfields.h for CR_TLBACC
 fields
Date: Thu, 21 Apr 2022 08:16:58 -0700
Message-Id: <20220421151735.31996-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
---
 target/nios2/cpu.h | 23 +++++++++++++++--------
 target/nios2/mmu.c | 16 ++++++++--------
 2 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 67ca62fc1f..11e9ed0063 100644
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


