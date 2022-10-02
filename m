Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1AB5F2449
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 19:34:22 +0200 (CEST)
Received: from localhost ([::1]:46054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of2r7-0001FW-Ph
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 13:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2nO-0005SX-OZ
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:30:43 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:35527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2nM-0006BB-MT
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:30:30 -0400
Received: by mail-pf1-x436.google.com with SMTP id i6so8409126pfb.2
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 10:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=D7KYNabvnNZChlZWMiOVnXqz2ASnpJf3GCFatgE5ov8=;
 b=M2lE7HctTwIGVIvrFgxBA/1gzsFGcI4H4ycyZ9grYJc8lnsQqHiVcT0MHWnUJG90vE
 ft6ORPuYTRixiEm3HvOvRvda13pPMUxzkMMcCdnnBP001BYyetl1MaOh7U4f9IeI+Sw4
 T7OICAFVjkiu7HDkvPZVaJG75nc9hc9t4RhN5m5ufpo+ikK1kl7hMUSucVO2fKMFcIgI
 PFBtEwj1WEDN08LPrRQVBGEV0vhL4pnwcVG2FUK0xJKle6OemJcuebI1G0ZWcozoCAds
 VuX6O5DLbMroYySJCrAD0vPKgDHpjeQJAR4UpfqlDFRpKjsFwWqW+JB4TtB9TUoa686A
 zv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=D7KYNabvnNZChlZWMiOVnXqz2ASnpJf3GCFatgE5ov8=;
 b=pZYpVCJFrPn1auOYhsTu0xE2OkdCqmdiuKBuK1UgXOYgWSEfsZl60LiD+yn3d5kk1a
 w/gMJOL5eGcWaxXSf0nBpS1Gl3Cp+clES52vlrIMIahgjf1h3iJ5/7KEaD2Hn3ddXWq6
 fq0+BWrZOpCd+uxZ0AXJ0RUkU92HMrT2GPIYa/pPgTTqBaU4T3m1IORmoJ+k0jyxNWpH
 7rOFAnaH3VeULsKKuF7o9HI0FtbvpBWJlQN2VIWgmPWBgTCQkhqy3M//Fs2GAIQ5VXZG
 VCtFjsQSwMAWrEkx+U3vzAuvEWZ1nVFDuKKzVlgGVHDOEpFqvejrSaiP2S7px3T0y68n
 4HBA==
X-Gm-Message-State: ACrzQf0EcpIHyMw+6G/htlFJOcKPJ+lrCJn09rJvFIz7MgQ9MHvrNo9t
 +hIUACoTx4q5LpAd3UEofcNo9k/8mpwu9Q==
X-Google-Smtp-Source: AMsMyM6iKU/tMyBmVCA3SXsOTZ94Yr1TdFu61pCJatd+mZus9rhGy9h9do4RRIx3/p7X5of3zWOcsg==
X-Received: by 2002:a65:6c08:0:b0:448:c216:fe9 with SMTP id
 y8-20020a656c08000000b00448c2160fe9mr5715598pgu.243.1664731827193; 
 Sun, 02 Oct 2022 10:30:27 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8002:3cad:72cd:dd96:98f6:c3cf])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62168d000000b0056025ccc3bbsm2749783pfw.146.2022.10.02.10.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 10:30:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 1/9] target/i386: Use MMUAccessType across excp_helper.c
Date: Sun,  2 Oct 2022 10:29:48 -0700
Message-Id: <20221002172956.265735-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221002172956.265735-1-richard.henderson@linaro.org>
References: <20221002172956.265735-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Replace int is_write1 and magic numbers with the proper
MMUAccessType access_type and enumerators.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/sysemu/excp_helper.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 796dc2a1f3..eee59aa977 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -30,8 +30,10 @@ typedef hwaddr (*MMUTranslateFunc)(CPUState *cs, hwaddr gphys, MMUAccessType acc
 #define GET_HPHYS(cs, gpa, access_type, prot)  \
 	(get_hphys_func ? get_hphys_func(cs, gpa, access_type, prot) : gpa)
 
-static int mmu_translate(CPUState *cs, hwaddr addr, MMUTranslateFunc get_hphys_func,
-                         uint64_t cr3, int is_write1, int mmu_idx, int pg_mode,
+static int mmu_translate(CPUState *cs, hwaddr addr,
+                         MMUTranslateFunc get_hphys_func,
+                         uint64_t cr3, MMUAccessType access_type,
+                         int mmu_idx, int pg_mode,
                          hwaddr *xlat, int *page_size, int *prot)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -40,13 +42,13 @@ static int mmu_translate(CPUState *cs, hwaddr addr, MMUTranslateFunc get_hphys_f
     int32_t a20_mask;
     target_ulong pde_addr, pte_addr;
     int error_code = 0;
-    int is_dirty, is_write, is_user;
+    bool is_dirty, is_write, is_user;
     uint64_t rsvd_mask = PG_ADDRESS_MASK & ~MAKE_64BIT_MASK(0, cpu->phys_bits);
     uint32_t page_offset;
     uint32_t pkr;
 
     is_user = (mmu_idx == MMU_USER_IDX);
-    is_write = is_write1 & 1;
+    is_write = (access_type == MMU_DATA_STORE);
     a20_mask = x86_get_a20_mask(env);
 
     if (!(pg_mode & PG_MODE_NXE)) {
@@ -264,14 +266,14 @@ do_check_protect_pse36:
         }
 
         *prot &= pkr_prot;
-        if ((pkr_prot & (1 << is_write1)) == 0) {
-            assert(is_write1 != 2);
+        if ((pkr_prot & (1 << access_type)) == 0) {
+            assert(access_type != MMU_INST_FETCH);
             error_code |= PG_ERROR_PK_MASK;
             goto do_fault_protect;
         }
     }
 
-    if ((*prot & (1 << is_write1)) == 0) {
+    if ((*prot & (1 << access_type)) == 0) {
         goto do_fault_protect;
     }
 
@@ -297,7 +299,7 @@ do_check_protect_pse36:
     /* align to page_size */
     pte &= PG_ADDRESS_MASK & ~(*page_size - 1);
     page_offset = addr & (*page_size - 1);
-    *xlat = GET_HPHYS(cs, pte + page_offset, is_write1, prot);
+    *xlat = GET_HPHYS(cs, pte + page_offset, access_type, prot);
     return PG_ERROR_OK;
 
  do_fault_rsvd:
@@ -308,7 +310,7 @@ do_check_protect_pse36:
     error_code |= (is_write << PG_ERROR_W_BIT);
     if (is_user)
         error_code |= PG_ERROR_U_MASK;
-    if (is_write1 == 2 &&
+    if (access_type == MMU_INST_FETCH &&
         ((pg_mode & PG_MODE_NXE) || (pg_mode & PG_MODE_SMEP)))
         error_code |= PG_ERROR_I_D_MASK;
     return error_code;
@@ -353,7 +355,7 @@ hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
  * 1  = generate PF fault
  */
 static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
-                            int is_write1, int mmu_idx)
+                            MMUAccessType access_type, int mmu_idx)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
@@ -365,7 +367,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
 
 #if defined(DEBUG_MMU)
     printf("MMU fault: addr=%" VADDR_PRIx " w=%d mmu=%d eip=" TARGET_FMT_lx "\n",
-           addr, is_write1, mmu_idx, env->eip);
+           addr, access_type, mmu_idx, env->eip);
 #endif
 
     if (!(env->cr[0] & CR0_PG_MASK)) {
@@ -393,7 +395,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
             }
         }
 
-        error_code = mmu_translate(cs, addr, get_hphys, env->cr[3], is_write1,
+        error_code = mmu_translate(cs, addr, get_hphys, env->cr[3], access_type,
                                    mmu_idx, pg_mode,
                                    &paddr, &page_size, &prot);
     }
@@ -404,7 +406,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
         vaddr = addr & TARGET_PAGE_MASK;
         paddr &= TARGET_PAGE_MASK;
 
-        assert(prot & (1 << is_write1));
+        assert(prot & (1 << access_type));
         tlb_set_page_with_attrs(cs, vaddr, paddr, cpu_get_mem_attrs(env),
                                 prot, mmu_idx, page_size);
         return 0;
-- 
2.34.1


