Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F104C4D1126
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:38:00 +0100 (CET)
Received: from localhost ([::1]:33282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUPw-0005gL-06
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:38:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU98-0005EC-3H
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:38 -0500
Received: from [2607:f8b0:4864:20::1034] (port=33334
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU94-0006Ke-6r
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:37 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 v1-20020a17090a088100b001bf25f97c6eso1571576pjc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fvPkig6MleWF0+ZI0/vzSM/1Jm6/BuAY/JiF4TBlCT4=;
 b=AxCRoAzmytGONJj3q1hSb8bgILGopXte4C+JrHlP5WW7LHHfKsU+Kf6MRTSZ/36AVH
 ZoK6Fn/0E/LPcOZmpdjFzeU+7aRRA2RyL/QU4LlcxXMoUjHXtcY8DBMjH5FTdhyOwvZ2
 Sndijdrb3Zx8YtuA11o8ptjkOG6El/TYbLjMjGdh5NhbvjpJTyXWm1e3Pm6nYa1HgSfD
 qTvUqPVdQ3IxIRqnhMhoFbdu/bTFMIrCkjb5pwdScqbLffBXIKn7f3ofEbhJgtzNIKEh
 yw3hxiQeVhmU0CVHJ7Occv+SWyCZ8exJJ+FKYjjiRHwHjGNcjx7AK4KhP65u4axRqkVh
 01fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fvPkig6MleWF0+ZI0/vzSM/1Jm6/BuAY/JiF4TBlCT4=;
 b=5mMaqqkwVfxPo79cJBr6EBTUVRshviajD8BKcHwIu0EAFNkfj/9BkOMZNR0aDMLPsO
 qzKD8ExgqCaVe89P5nN4JoqEv/2wsqkG8U4S+w0b91ulSSuWFOmbf0+aQawl1wM9D6C7
 VPtqMoYrzNzD4KTeMFxbB1U7o4BngP/8SAePQKx/VXawlxnTsCe8d6cB3XQ9GV0axNiP
 P2wA9AMyYWlqwaAGXwyZKpsWdlbSfOjuRuy02sNyVD4DKDmQq6uHodhxlWJRtKbQzYX5
 xVhrt/repReTxj9BvbVwRozxbB61kWkk0AI5QDgzFX39mqIucM0ebHb/cgG11lluPnqA
 FQCQ==
X-Gm-Message-State: AOAM530xHuZfTmwFKc5AyZ5KlnoE/Jnht1sPIoUWhWzFeN1tOR6TxozT
 tXIIb6/5PpjlYjl0bsLqXYZNoRhogbszKQ==
X-Google-Smtp-Source: ABdhPJzfOZo5ZZ4rFpiZlWjWCmov+6iKZlaMOqKisDJh+88d29X4dqNtMiTMM69IBtsQczDY8vlXbA==
X-Received: by 2002:a17:902:ce86:b0:151:a78b:44fe with SMTP id
 f6-20020a170902ce8600b00151a78b44femr15650242plg.159.1646724031423; 
 Mon, 07 Mar 2022 23:20:31 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/33] target/nios2: Use hw/registerfields.h for CR_TLBACC
 fields
Date: Mon,  7 Mar 2022 21:19:46 -1000
Message-Id: <20220308072005.307955-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
 target/nios2/cpu.h | 23 +++++++++++++++--------
 target/nios2/mmu.c | 16 ++++++++--------
 2 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 84138000fa..024ef3ccc0 100644
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
+#define CR_TLBACC_C  (1u << R_CR_TLBACC_C_SHIFT)
+#define CR_TLBACC_R  (1u << R_CR_TLBACC_R_SHIFT)
+#define CR_TLBACC_W  (1u << R_CR_TLBACC_W_SHIFT)
+#define CR_TLBACC_X  (1u << R_CR_TLBACC_X_SHIFT)
+#define CR_TLBACC_G  (1u << R_CR_TLBACC_G_SHIFT)
+
 #define CR_TLBMISC       10
 #define   CR_TLBMISC_WAY_SHIFT 20
 #define   CR_TLBMISC_WAY_MASK  (0xF << CR_TLBMISC_WAY_SHIFT)
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 8017f2af93..d6221936f7 100644
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
     if (env->tlbmisc & CR_TLBMISC_WR) {
         int way = (env->tlbmisc >> CR_TLBMISC_WAY_SHIFT);
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
 
-        env->tlbacc &= CR_TLBACC_IGN_MASK;
+        env->tlbacc &= R_CR_TLBACC_IG_MASK;
         env->tlbacc |= entry->data;
         env->tlbacc |= (entry->tag & (1 << 11)) ? CR_TLBACC_G : 0;
         env->tlbmisc =
@@ -207,7 +207,7 @@ void dump_mmu(CPUNios2State *env)
                     entry->tag >> 12,
                     entry->tag & ((1 << cpu->pid_num_bits) - 1),
                     (entry->tag & (1 << 11)) ? 'G' : '-',
-                    entry->data & CR_TLBACC_PFN_MASK,
+                    FIELD_EX32(entry->data, CR_TLBACC, PFN),
                     (entry->data & CR_TLBACC_C) ? 'C' : '-',
                     (entry->data & CR_TLBACC_R) ? 'R' : '-',
                     (entry->data & CR_TLBACC_W) ? 'W' : '-',
-- 
2.25.1


