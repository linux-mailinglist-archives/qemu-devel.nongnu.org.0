Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF925E928A
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:08:28 +0200 (CEST)
Received: from localhost ([::1]:58540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPUp-0002pB-Bl
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEu-0002uf-Fw
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:52:00 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:33396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEs-0000N2-QQ
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:52:00 -0400
Received: by mail-qk1-x730.google.com with SMTP id h28so2688013qka.0
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uJaGAPcwwlUk8jVTMwaUD6ZS8B8CAq3MDEsOkQA/P4A=;
 b=eAYm//azLcJ9aOigAPChANL5y9rwh4L9hgT99wU/ML4Nuz/EGmgaBujHEZDEhU2NJw
 hXid4k4nCSnKaZQ4iKe/+JUQY/MloD3AKncbE5PfZgj2aZG4yklEMfJo97PXt/KXJtSM
 bPD+AGGQzYYeInTlOaRDIg14s5VC/tgkGwm4bSz6N4T1UjpIbWCxcOV0X8mZkk+NkvM/
 RpMALEYPh7V3vAqZNbT4ztRwogRJm8cgqG2GC29B+VluUe9mg6ZNxl8HqWl1qafQe0LT
 9OQ4+pkskq2JqPz0KOGY88QnKnYtLV1vpZGYJ21WOo/4QZqPjAkzfEWnxD5XOnPz95Ov
 QDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uJaGAPcwwlUk8jVTMwaUD6ZS8B8CAq3MDEsOkQA/P4A=;
 b=uT5mWSznbR3hTAQrjpNY1SI/zkeTGv75K5L/WUVlV4W/yB+cvIy2+tEXu0dQdUCxlg
 LL/25xpI32mhPMev9rfYfZNcUFeoojAl93J5TwFg9qRS5LYfnPPL4gteSXnuQABf+AZy
 q1+Z0hCIwBh4oQ3DsImz5eF8W7mtmwoazWonhePxqIKoPBkz/91L/ee0SOK/RrJ/GRd0
 4r2rr+wEHMIJDpwycpnZwTet5varoONIHtpPOzx9RnErmzQOEpAQxlihjcpt66d7V9Eg
 DsotAvDhgSD3bzSunMSVmONVzMqND/jkUmPFFc0I7CSpVudwh2MvJFtRjBmSzV1TNPkF
 zzKQ==
X-Gm-Message-State: ACrzQf3HrT0mfLnGlVeiNaUnJgfUb4bEq2a3AeXb23s9W4LyiVlEjWpG
 TixYJ7fGH8uCayAVYlhpjwGd1ylUxG1o+g==
X-Google-Smtp-Source: AMsMyM4K/9t+WYap5ZUrQCcPPGGAIa47H9iw8/lnu4y6u5CGj9plBKro7BjPSxIz1J/9B4khoc9X9w==
X-Received: by 2002:a05:620a:2951:b0:6ce:c55e:102a with SMTP id
 n17-20020a05620a295100b006cec55e102amr10996543qkp.134.1664103117639; 
 Sun, 25 Sep 2022 03:51:57 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a9:5c0e:1ec2:d482:4986:8538])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a0c4f00b006cf19068261sm10061132qki.116.2022.09.25.03.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 03:51:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v5 08/17] accel/tcg: Move byte_swap from MemTxAttrs to
 CPUTLBEntryFull
Date: Sun, 25 Sep 2022 10:51:15 +0000
Message-Id: <20220925105124.82033-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925105124.82033-1-richard.henderson@linaro.org>
References: <20220925105124.82033-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
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

We had previously placed this bit in MemTxAttrs because we had
no other way to communicate that information to tlb_set_page*.
The bit is not relevant to memory transactions, only page table
entries, and now we do have a way to pass in the bit.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h    | 6 +++---
 include/exec/cpu-defs.h   | 3 +++
 include/exec/memattrs.h   | 2 --
 accel/tcg/cputlb.c        | 8 ++++----
 target/sparc/mmu_helper.c | 2 +-
 5 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 491629b9ba..064aa5aee8 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -384,8 +384,8 @@ CPUArchState *cpu_copy(CPUArchState *env);
 #define TLB_MMIO            (1 << (TARGET_PAGE_BITS_MIN - 3))
 /* Set if TLB entry contains a watchpoint.  */
 #define TLB_WATCHPOINT      (1 << (TARGET_PAGE_BITS_MIN - 4))
-/* Set if TLB entry requires byte swap.  */
-#define TLB_BSWAP           (1 << (TARGET_PAGE_BITS_MIN - 5))
+/* Set if TLB entry requires slow path handling.  */
+#define TLB_SLOW_PATH       (1 << (TARGET_PAGE_BITS_MIN - 5))
 /* Set if TLB entry writes ignored.  */
 #define TLB_DISCARD_WRITE   (1 << (TARGET_PAGE_BITS_MIN - 6))
 
@@ -394,7 +394,7 @@ CPUArchState *cpu_copy(CPUArchState *env);
  */
 #define TLB_FLAGS_MASK \
     (TLB_INVALID_MASK | TLB_NOTDIRTY | TLB_MMIO \
-    | TLB_WATCHPOINT | TLB_BSWAP | TLB_DISCARD_WRITE)
+    | TLB_WATCHPOINT | TLB_SLOW_PATH | TLB_DISCARD_WRITE)
 
 /**
  * tlb_hit_page: return true if page aligned @addr is a hit against the
diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 67239b4e5e..7c0ba93826 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -164,6 +164,9 @@ typedef struct CPUTLBEntryFull {
     /* @lg_page_size contains the log2 of the page size. */
     uint8_t lg_page_size;
 
+    /* @byte_swap indicates that all accesses use inverted endianness. */
+    bool byte_swap;
+
     /*
      * Allow target-specific additions to this structure.
      * This may be used to cache items from the guest cpu
diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..570e73c06f 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -45,8 +45,6 @@ typedef struct MemTxAttrs {
     unsigned int memory:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
-    /* Invert endianness for this page */
-    unsigned int byte_swap:1;
     /*
      * The following are target-specific page-table bits.  These are not
      * related to actual memory transactions at all.  However, this structure
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 382c5d3109..1a5a6bd98b 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1146,8 +1146,8 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
         /* Repeat the MMU check and TLB fill on every access.  */
         address |= TLB_INVALID_MASK;
     }
-    if (full->attrs.byte_swap) {
-        address |= TLB_BSWAP;
+    if (full->byte_swap) {
+        address |= TLB_SLOW_PATH;
     }
 
     is_ram = memory_region_is_ram(section->mr);
@@ -1961,7 +1961,7 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
                                  full->attrs, BP_MEM_READ, retaddr);
         }
 
-        need_swap = size > 1 && (tlb_addr & TLB_BSWAP);
+        need_swap = size > 1 && full->byte_swap;
 
         /* Handle I/O access.  */
         if (likely(tlb_addr & TLB_MMIO)) {
@@ -2366,7 +2366,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
                                  full->attrs, BP_MEM_WRITE, retaddr);
         }
 
-        need_swap = size > 1 && (tlb_addr & TLB_BSWAP);
+        need_swap = size > 1 && full->byte_swap;
 
         /* Handle I/O access.  */
         if (tlb_addr & TLB_MMIO) {
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 08f656cbb6..a857bd9569 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -577,7 +577,7 @@ static int get_physical_address_data(CPUSPARCState *env, CPUTLBEntryFull *full,
             int do_fault = 0;
 
             if (TTE_IS_IE(env->dtlb[i].tte)) {
-                full->attrs.byte_swap = true;
+                full->byte_swap = true;
             }
 
             /* access ok? */
-- 
2.34.1


