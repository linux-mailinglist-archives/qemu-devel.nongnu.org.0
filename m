Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116F559CD2A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:23:15 +0200 (CEST)
Received: from localhost ([::1]:53136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHhJ-0006DN-Vw
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJ7-000476-RW
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:13 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:44564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJ6-0002jV-0C
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:13 -0400
Received: by mail-pl1-x632.google.com with SMTP id g8so7453068plq.11
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=2h0TkUJc4yOQJXhyjibyZnOW4r9x66hUQmDkisOxO7c=;
 b=jQaWIit9DJQsK5JU89O5yLCmnL1cwa7xYwv7V2w459VwYGg+VqoXJZaggx+uJPIi8Y
 Z4joCT9TrsiuJe6aytCCk3zAd85IarP5tWxijkwaONzsgk44Ct3FaPZvuwxQTvi/rRdh
 KH8PKBTf+XVuDMuEto0zAYXK6t10DVEHwnV+YYkLxfupFRWmXsQ7KgY4Mks9dUGeQYj8
 ya8m/fVy6Q3Bk8L3HOv0uWA6QSvwbYJcr5fBNK9FrA1H4goTj4fL2UUutagREJS3k27w
 UTB6Dd++wx/4ODRN9zFiOm/a3/cw5SG+vtRgqL40Zd0iHJ1zj5vB+9GApBhlc3cdtmc2
 qaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=2h0TkUJc4yOQJXhyjibyZnOW4r9x66hUQmDkisOxO7c=;
 b=LEva+zmpjN1c617kuway+TrIVusBnCwn3o71TXa5gRz0x7TNKImu0z09ebk6h6vssM
 DhEwp60hxXUn+LH87odwUe9+NdAO5rMfYjDD1JpzMs+DMv53oxzlCy2or3sW0pJX1sFN
 3YJhEPKlVQCvx2u4mTYNLEB9cOqXA37P7P8pCcuMSClQp5HJ5ylvhlwydx+Ay3YBl7xL
 Pm51GYq30q2rxH2vuXjpVzpHZIosnx1AfBzlIpNXuZsGmSDqrziKpcM7SuefWFoy4JGi
 H6Jgd+C9IpTmnfvTsX3LBpA42APrZO9R2SKs4PvXhJF0lg4KXXfmhdu+UElmTOxVqf6d
 aj4g==
X-Gm-Message-State: ACgBeo3h8pyUDZ8C/dcKcfNbBX1gBPANQAX16kNllGIlAsYGD3ZAh63U
 i26eHPwobWObnh/zMArrNJ8n7uQl2HcLrg==
X-Google-Smtp-Source: AA6agR7Gp/9kIdTFF6Sb+/U14fqYQ1I1IHpftdc8UIKVHXDBeWkLG7LUEPQmg44pCaxOsV00HHFGQg==
X-Received: by 2002:a17:90b:1c8e:b0:1f7:524f:bfcc with SMTP id
 oo14-20020a17090b1c8e00b001f7524fbfccmr708311pjb.132.1661212690517; 
 Mon, 22 Aug 2022 16:58:10 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 w190-20020a6230c7000000b0052d52de6726sm9173159pfw.124.2022.08.22.16.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:58:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	eduardo@habkost.net
Subject: [PATCH 07/14] target/i386: Use MMUAccessType across excp_helper.c
Date: Mon, 22 Aug 2022 16:57:56 -0700
Message-Id: <20220822235803.1729290-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822235803.1729290-1-richard.henderson@linaro.org>
References: <20220822235803.1729290-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace int is_write1 and magic numbers with the proper
MMUAccessType access_type and enumerators.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/sysemu/excp_helper.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 48feba7e75..414d8032de 100644
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


