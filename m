Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8674DBE01
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:13:33 +0100 (CET)
Received: from localhost ([::1]:56218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiS4-00019n-Mb
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:13:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKk-0000vS-9o
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:58 -0400
Received: from [2607:f8b0:4864:20::630] (port=39425
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKi-0002F4-Id
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:58 -0400
Received: by mail-pl1-x630.google.com with SMTP id d18so3558910plr.6
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f9kEO6gPHdFHbcVjWJEx3cRnSvZ1MpAPY6GCaaYYMWU=;
 b=vVRgau5y8JyOGkXSsmqecLafh1PANnbK9GxxRuQJTZLdz/uLKmf0tolNhi5aEaLPeQ
 BchlVTULed1Tw8IZhZ76ctWeHQNXBa86AhZGoWQmzzeJ/9hDSmlmdTxJMGi6565iuhq4
 merqVJA2Dcluw62GVlTS2kmv7C8yHYuBw6yzWomM7e6FVm5gWj5Diak//i5Vq8rsHocO
 aJXKa87lXjng9/9Cc9I3fyHZe5Ft7Ogm02v1EluaJzPWPvpfLSj/tCq3OlJH2yaMwQQ+
 yYVHS6qZ7/IIwkUcmBYOdYqWafnuCe8zbxFUBHnJSxbbGM4ctAizqRp84i/iAfsjUnug
 rKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f9kEO6gPHdFHbcVjWJEx3cRnSvZ1MpAPY6GCaaYYMWU=;
 b=a8cjmzruIOt2CWEBXvFh0qjlTSP3lfBNiHaIWl6UhwypkdW49LxVvzOCu6uG71NMCA
 sdrVaKfkM7IMuFONJRApYC0DJS0YqQa0hd+oNxUd1hphVUpN3kEZ8wW+QpL95Ti0N6ci
 sKu5zTf+d2abOb7VPLEQHE1GrTL3vMyz6gFF7/llSnzY+ByAD4dmpfj92sUsXUG9SgRQ
 TaQW7kgApUNhi73EjV97Go23R5MwoJzzAyqKEcGXccIR5MHyQyE7o9aP2vwUDwTp0/pi
 OzohxXwXFlO4Fucw+p1P0uw9MtS8nCaEnPoBHgPwutKSdBXgY4lNJcq0JFeV9rK5PpDw
 /Y0Q==
X-Gm-Message-State: AOAM531OWRPO7gQmsUzv5wxH9KGbHzvt/osOdrVhIl4XASP22wsTmGwS
 yiZFv9cRdGMoX6HhcbqagjXf5zeK7k2CDw==
X-Google-Smtp-Source: ABdhPJx8/sKcnOq3P0JLYGFxUprdvVrL6wKEL4mPlB0mz4Azc6rSPQb/LaDq2SM3gB3e+7G3um9rKA==
X-Received: by 2002:a17:902:9007:b0:14f:3680:66d1 with SMTP id
 a7-20020a170902900700b0014f368066d1mr3270516plp.91.1647493555330; 
 Wed, 16 Mar 2022 22:05:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 15/51] target/nios2: Use hw/registerfields.h for
 CR_TLBADDR fields
Date: Wed, 16 Mar 2022 22:05:02 -0700
Message-Id: <20220317050538.924111-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use FIELD_EX32 and FIELD_DP32 instead of manual manipulation
of the fields.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  8 ++++----
 target/nios2/helper.c    |  4 ++--
 target/nios2/mmu.c       | 17 +++++++++--------
 target/nios2/translate.c |  2 +-
 4 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 963cdec161..e1c2bf8c31 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -110,10 +110,10 @@ FIELD(CR_EXCEPTION, CAUSE, 2, 5)
 FIELD(CR_EXCEPTION, ECCFTL, 31, 1)
 
 #define CR_PTEADDR       8
-#define   CR_PTEADDR_PTBASE_SHIFT 22
-#define   CR_PTEADDR_PTBASE_MASK  (0x3FF << CR_PTEADDR_PTBASE_SHIFT)
-#define   CR_PTEADDR_VPN_SHIFT    2
-#define   CR_PTEADDR_VPN_MASK     (0xFFFFF << CR_PTEADDR_VPN_SHIFT)
+
+FIELD(CR_PTEADDR, VPN, 2, 20)
+FIELD(CR_PTEADDR, PTBASE, 22, 10)
+
 #define CR_TLBACC        9
 #define   CR_TLBACC_IGN_SHIFT 25
 #define   CR_TLBACC_IGN_MASK  (0x7F << CR_TLBACC_IGN_SHIFT)
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 54458a5447..da3a289fc7 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -306,8 +306,8 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else {
         env->ctrl[CR_TLBMISC] |= CR_TLBMISC_D;
     }
-    env->ctrl[CR_PTEADDR] &= CR_PTEADDR_PTBASE_MASK;
-    env->ctrl[CR_PTEADDR] |= (address >> 10) & CR_PTEADDR_VPN_MASK;
+    env->ctrl[CR_PTEADDR] = FIELD_DP32(env->ctrl[CR_PTEADDR], CR_PTEADDR, VPN,
+                                       address >> TARGET_PAGE_BITS);
     env->mmu.pteaddr_wr = env->ctrl[CR_PTEADDR];
 
     cs->exception_index = excp;
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 95900724e8..75afc56daf 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -97,7 +97,7 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
     /* if tlbmisc.WE == 1 then trigger a TLB write on writes to TLBACC */
     if (env->ctrl[CR_TLBMISC] & CR_TLBMISC_WR) {
         int way = (env->ctrl[CR_TLBMISC] >> CR_TLBMISC_WAY_SHIFT);
-        int vpn = (env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK) >> 2;
+        int vpn = FIELD_EX32(env->mmu.pteaddr_wr, CR_PTEADDR, VPN);
         int pid = (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4;
         int g = (v & CR_TLBACC_G) ? 1 : 0;
         int valid = ((vpn & CR_TLBACC_PFN_MASK) < 0xC0000) ? 1 : 0;
@@ -148,7 +148,7 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
     /* if tlbmisc.RD == 1 then trigger a TLB read on writes to TLBMISC */
     if (v & CR_TLBMISC_RD) {
         int way = (v >> CR_TLBMISC_WAY_SHIFT);
-        int vpn = (env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK) >> 2;
+        int vpn = FIELD_EX32(env->mmu.pteaddr_wr, CR_PTEADDR, VPN);
         Nios2TLBEntry *entry =
             &env->mmu.tlb[(way * cpu->tlb_num_ways) +
                           (vpn & env->mmu.tlb_entry_mask)];
@@ -160,8 +160,9 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
             (v & ~CR_TLBMISC_PID_MASK) |
             ((entry->tag & ((1 << cpu->pid_num_bits) - 1)) <<
              CR_TLBMISC_PID_SHIFT);
-        env->ctrl[CR_PTEADDR] &= ~CR_PTEADDR_VPN_MASK;
-        env->ctrl[CR_PTEADDR] |= (entry->tag >> 12) << CR_PTEADDR_VPN_SHIFT;
+        env->ctrl[CR_PTEADDR] = FIELD_DP32(env->ctrl[CR_PTEADDR],
+                                           CR_PTEADDR, VPN,
+                                           entry->tag >> TARGET_PAGE_BITS);
     } else {
         env->ctrl[CR_TLBMISC] = v;
     }
@@ -171,12 +172,12 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
 
 void helper_mmu_write_pteaddr(CPUNios2State *env, uint32_t v)
 {
-    trace_nios2_mmu_write_pteaddr(v >> CR_PTEADDR_PTBASE_SHIFT,
-                                  (v & CR_PTEADDR_VPN_MASK) >> CR_PTEADDR_VPN_SHIFT);
+    trace_nios2_mmu_write_pteaddr(FIELD_EX32(v, CR_PTEADDR, PTBASE),
+                                  FIELD_EX32(v, CR_PTEADDR, VPN));
 
     /* Writes to PTEADDR don't change the read-back VPN value */
-    env->ctrl[CR_PTEADDR] = ((v & ~CR_PTEADDR_VPN_MASK) |
-                             (env->ctrl[CR_PTEADDR] & CR_PTEADDR_VPN_MASK));
+    env->ctrl[CR_PTEADDR] = ((v & ~R_CR_PTEADDR_VPN_MASK) |
+                             (env->ctrl[CR_PTEADDR] & R_CR_PTEADDR_VPN_MASK));
     env->mmu.pteaddr_wr = v;
 }
 
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 45fe2f9a05..9b81a2b29e 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -923,7 +923,7 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         }
     }
     qemu_fprintf(f, " mmu write: VPN=%05X PID %02X TLBACC %08X\n",
-                 env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK,
+                 env->mmu.pteaddr_wr & R_CR_PTEADDR_VPN_MASK,
                  (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4,
                  env->mmu.tlbacc_wr);
 #endif
-- 
2.25.1


