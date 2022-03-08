Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDBB4D113E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:44:03 +0100 (CET)
Received: from localhost ([::1]:44982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUVm-0005Fi-AM
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:44:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU92-0005Cl-K8
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:32 -0500
Received: from [2607:f8b0:4864:20::1029] (port=35578
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU90-0006K5-RG
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:32 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso1503656pjb.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bvaugvOzZH4H7UXLjWeBiC+O86PySPHli6r8YDJVb2o=;
 b=jOhgAKO41fVKEcwM1BCN9G/ODL+80FR6HLfGlXOd9oglzrry5/OO0/9E0LgYu5Qgbz
 JzpZUPaPYG8JAHJ3qxHVHIPzCq9YpU+MbfwhTsiOEsJYsUV5O6+7AEnR5BVzIqzb4Os/
 XmW3zhRhfRedXw1T5BGyd04suJ1LXPGfSJpEyyqhdEy0IJeBKfr4+WIjp3W8g4iH6jNK
 yrBDL54fWEs0d/VZr7FnWxwDkfp9+/oQYsqlST3ZN7TgtS1vq1blli3uAtN45hLzkuVh
 aUtGxXtvgw1mYZSUBQKRanKBWBmsmvGEbOJdBukcE13aPN0gvYgw0Cq0L0n58jy73oc/
 8B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bvaugvOzZH4H7UXLjWeBiC+O86PySPHli6r8YDJVb2o=;
 b=vfFibLkTG4NIYPDgaWbsFU3iCMsLIimdoioSGC99M0arHes75ihKmBDFOIHluTpjaZ
 c3c5+Gl93zCZrP0Ylx2M+1zk0PvAobPg98C1GNQymODWT2BjEKVXBbMJNUDIoXMCVILj
 ceIVRMxJl0HL7vTG+Nb/ZwYAnAARPjFhtAbnTxUThqhKf/XRibDUB7mJSpKOvRlAKusY
 EqWZ96vBGl7iTcBU7UyFb2qun/png+Hp0JWD1gmqPHb5Byd/R2LRikGJtbTGavXYcYie
 GYpK1vrxyq4dGCOxOSBajJzrQGJHashhYNCReZoInJk/LnQycxZ/Udg+KRojEDcYFPh0
 2qRA==
X-Gm-Message-State: AOAM532If9Cr3OSh5iQzlg/vzczq5XgPncPU0kJ+2RWyXEhrMwD6XjXZ
 VGEj1QQ9QxwUcrRsrHU83V7WZqYoRJRWng==
X-Google-Smtp-Source: ABdhPJwnaH1kdyTmV6oz+Q2GhXK6lhHtn3lp81QIcC/kfHfnysVhmeU6FO13mauIhcZskUtMmXgglw==
X-Received: by 2002:a17:903:234d:b0:151:bff9:9217 with SMTP id
 c13-20020a170903234d00b00151bff99217mr16047233plh.39.1646724029671; 
 Mon, 07 Mar 2022 23:20:29 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/33] target/nios2: Use hw/registerfields.h for CR_TLBADDR
 fields
Date: Mon,  7 Mar 2022 21:19:45 -1000
Message-Id: <20220308072005.307955-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
 target/nios2/cpu.h       |  8 ++++----
 target/nios2/helper.c    |  4 ++--
 target/nios2/mmu.c       | 16 ++++++++--------
 target/nios2/translate.c |  2 +-
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 35b4d88859..84138000fa 100644
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
index eb354f78e2..37fb53dadb 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -281,8 +281,8 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else {
         env->tlbmisc |= CR_TLBMISC_D;
     }
-    env->pteaddr &= CR_PTEADDR_PTBASE_MASK;
-    env->pteaddr |= (address >> 10) & CR_PTEADDR_VPN_MASK;
+    env->pteaddr = FIELD_DP32(env->pteaddr, CR_PTEADDR, VPN,
+                              address >> TARGET_PAGE_BITS);
     env->mmu.pteaddr_wr = env->pteaddr;
 
     cs->exception_index = excp;
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 382b190ae7..8017f2af93 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -97,7 +97,7 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
     /* if tlbmisc.WE == 1 then trigger a TLB write on writes to TLBACC */
     if (env->tlbmisc & CR_TLBMISC_WR) {
         int way = (env->tlbmisc >> CR_TLBMISC_WAY_SHIFT);
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
@@ -160,8 +160,8 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
             (v & ~CR_TLBMISC_PID_MASK) |
             ((entry->tag & ((1 << cpu->pid_num_bits) - 1)) <<
              CR_TLBMISC_PID_SHIFT);
-        env->pteaddr &= ~CR_PTEADDR_VPN_MASK;
-        env->pteaddr |= (entry->tag >> 12) << CR_PTEADDR_VPN_SHIFT;
+        env->pteaddr = FIELD_DP32(env->pteaddr, CR_PTEADDR, VPN,
+                                  entry->tag >> TARGET_PAGE_BITS);
     } else {
         env->tlbmisc = v;
     }
@@ -171,12 +171,12 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
 
 void helper_mmu_write_pteaddr(CPUNios2State *env, uint32_t v)
 {
-    trace_nios2_mmu_write_pteaddr(v >> CR_PTEADDR_PTBASE_SHIFT,
-                                  (v & CR_PTEADDR_VPN_MASK) >> CR_PTEADDR_VPN_SHIFT);
+    trace_nios2_mmu_write_pteaddr(FIELD_EX32(v, CR_PTEADDR, PTBASE),
+                                  FIELD_EX32(v, CR_PTEADDR, VPN));
 
     /* Writes to PTEADDR don't change the read-back VPN value */
-    env->pteaddr = (v & ~CR_PTEADDR_VPN_MASK) |
-                    (env->pteaddr & CR_PTEADDR_VPN_MASK);
+    env->pteaddr = (v & ~R_CR_PTEADDR_VPN_MASK) |
+                   (env->pteaddr & R_CR_PTEADDR_VPN_MASK);
     env->mmu.pteaddr_wr = v;
 }
 
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 7a32e6626d..3cdef16519 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -909,7 +909,7 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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


