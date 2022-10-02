Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134AC5F245E
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 19:44:51 +0200 (CEST)
Received: from localhost ([::1]:54734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of31G-0001At-2t
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 13:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2ne-0005VU-J4
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:30:47 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:43643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2nc-0006BH-UU
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:30:46 -0400
Received: by mail-pl1-x62a.google.com with SMTP id z20so1371319plb.10
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 10:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=D0hniRphEJcjKKIvbS4Fy3DBAta1qY7jOe+vkMzXYeQ=;
 b=z5AyP6nKX8goP7XUWqYqX6MFobpaM1j0TE4LIzJcuyBmhLaZqlDIJG6mu5NMTkFMif
 eYYEQXUU5DLliKf9pKv1B4Oj7RUEiyr0lUaKLtwaHcdypCx2rVgSjqeUjaPNNKSiXXqU
 blQ/O+FGeJc7HriPaaPaurUFZthofAHWlFM7s4TBIv1/I3Oiomyt+meM3Kt4B3rJefch
 283in8Mdeanm2NUdnZGXITIIcfh2N4FViY/gsgYAJuGsXayBnL2nw0RHavAXpHGBcot2
 zgL8CCY8wq+FVVVadT2shxqRj2fCeX18Sg+EjzzM4hVeCbOb+VIjmoV9MMuXf/68O4Lx
 Bl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=D0hniRphEJcjKKIvbS4Fy3DBAta1qY7jOe+vkMzXYeQ=;
 b=5zsGSlkAlzs8lJbiU0+tt0k5DAWDHx4XGmZn2wRLdmv8Xl6xF7rXpT3Y9XqTodffyY
 bC/ZyraiGZ/kJEMvRbdDXNyEBqRsBf027bKyWKkGqTG/qeDkJ3VTtTDTDKBK2waiRsaE
 ET91Xh4/ra1+XHB7xnHUE5eXCIjYWt9kO/6vhj8vMxDgRnT+fEMCJ5Awa/KPfoGxfC5o
 u3FbeDMRSNg4qCRCsfcIab479WnuEpWoPhYWwK+muia1Mq7z62gZ4EdB0VQo46JmzWco
 Zf7dVDubu4SqNtSLAB6wXguHOhz5Slv8UPl8ZoHIBHtaiPfoStXAW0PvDu53PxS7trZ4
 +m8g==
X-Gm-Message-State: ACrzQf0sku9wMKm81X+1BMUy7zDDE6IvhkCDtTz22tqJ1xhDQ4Scck8b
 uPHvnLxIl4f56UQJ9c1W4dBL95tiUKqwgA==
X-Google-Smtp-Source: AMsMyM4a9VUqawBqM4VHPOX3SpNRG1LXvhUguiJa1Vk/ixXfHKACV9kACB1U2WhZdImv7seku1xfRA==
X-Received: by 2002:a17:902:ab11:b0:178:23f5:3718 with SMTP id
 ik17-20020a170902ab1100b0017823f53718mr18795649plb.96.1664731843798; 
 Sun, 02 Oct 2022 10:30:43 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8002:3cad:72cd:dd96:98f6:c3cf])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62168d000000b0056025ccc3bbsm2749783pfw.146.2022.10.02.10.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 10:30:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 9/9] target/i386: Use probe_access_full for final stage2
 translation
Date: Sun,  2 Oct 2022 10:29:56 -0700
Message-Id: <20221002172956.265735-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221002172956.265735-1-richard.henderson@linaro.org>
References: <20221002172956.265735-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Rather than recurse directly on mmu_translate, go through the
same softmmu lookup that we did for the page table walk.
This centralizes all knowledge of MMU_NESTED_IDX, with respect
to setup of TranslationParams, to get_physical_address.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/sysemu/excp_helper.c | 40 +++++++++++++++++++---------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index e8457e9b21..d51b5d7431 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -143,7 +143,7 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
         .err = err,
         .ptw_idx = in->ptw_idx,
     };
-    hwaddr pte_addr;
+    hwaddr pte_addr, paddr;
     uint32_t pkr;
     int page_size;
 
@@ -420,33 +420,47 @@ do_check_protect_pse36:
     }
 
     /* align to page_size */
-    out->paddr = (pte & a20_mask & PG_ADDRESS_MASK & ~(page_size - 1))
-               | (addr & (page_size - 1));
+    paddr = (pte & a20_mask & PG_ADDRESS_MASK & ~(page_size - 1))
+          | (addr & (page_size - 1));
 
     if (in->ptw_idx == MMU_NESTED_IDX) {
-        TranslateParams nested_in = {
-            .addr = out->paddr,
-            .access_type = access_type,
-            .cr3 = env->nested_cr3,
-            .pg_mode = env->nested_pg_mode,
-            .mmu_idx = MMU_USER_IDX,
-            .ptw_idx = MMU_PHYS_IDX,
-        };
+        CPUTLBEntryFull *full;
+        int flags, nested_page_size;
 
-        if (!mmu_translate(env, &nested_in, out, err)) {
+        flags = probe_access_full(env, paddr, access_type,
+                                  MMU_NESTED_IDX, true,
+                                  &pte_trans.haddr, &full, 0);
+        if (unlikely(flags & TLB_INVALID_MASK)) {
+            err->exception_index = 0; /* unused */
+            err->error_code = env->error_code;
+            err->cr2 = paddr;
             err->stage2 = S2_GPA;
             return false;
         }
 
         /* Merge stage1 & stage2 protection bits. */
-        prot &= out->prot;
+        prot &= full->prot;
 
         /* Re-verify resulting protection. */
         if ((prot & (1 << access_type)) == 0) {
             goto do_fault_protect;
         }
+
+        /* Merge stage1 & stage2 addresses to final physical address. */
+        nested_page_size = 1 << full->lg_page_size;
+        paddr = (full->phys_addr & ~(nested_page_size - 1))
+              | (paddr & (nested_page_size - 1));
+
+        /*
+         * Use the larger of stage1 & stage2 page sizes, so that
+         * invalidation works.
+         */
+        if (nested_page_size > page_size) {
+            page_size = nested_page_size;
+        }
     }
 
+    out->paddr = paddr;
     out->prot = prot;
     out->page_size = page_size;
     return true;
-- 
2.34.1


