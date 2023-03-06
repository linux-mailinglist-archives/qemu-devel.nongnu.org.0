Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809846AB3CB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:42:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYytj-0004P8-MZ; Sun, 05 Mar 2023 19:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyta-0004OJ-Qz
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:07 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytY-0006Xr-KG
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:06 -0500
Received: by mail-pl1-x633.google.com with SMTP id n6so8512123plf.5
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lu/MZw7ErbSjkoIgOh3qSUYCyDOhbQRRQ4HpBsx5cCU=;
 b=uNkumGI+scY6P1kw7RNVWOzqHpjzlnIOZI5Ceg+ctZdp4UkdBFL74kbONSfQ3guayd
 SvXdlUTRNYWPJ2WWgyJqYcFPgH0cnPaMc+4bJid5a5LR4T2sBSeawtuGCV7jDt99+lui
 gb7A26f7Zs8RgW12ojHPRXdwd3h+3hDNbd2yx9/o4QFB/og5ADwi3Tqri5yaJAV5kjab
 VoOLnGrZ4/G2k3309aT/IwXOCgJ6BkoK4E/0OnsuFR3pzk/Xx9B0zUxSchSnGyAJDm4f
 CntgVww3+vYblxZTzX7vn3hYKV828mcHikSpfy+hc5BXbjcbDAyfois5h0iLMW0RBEch
 gVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lu/MZw7ErbSjkoIgOh3qSUYCyDOhbQRRQ4HpBsx5cCU=;
 b=vKJa0ak2VUSJ2fUP+WJlgnURkB4RTdm+ZO2D6ajT+XZ8Pd29rkE5mt2dfMgR85XGRv
 bqCWXbFsdEgCDgr2szIcY1MzECW0DT4Q1paCpC8z7fgQXvDeFxJF8P82fkTkiLRy/qy1
 kGBs4Wt5rybAfDH6yfGUhQJTE14PiBHf2bRDV/bBNsSEid8gbZqI4qkJPuNO24PI47LZ
 4bRYBROWRl6NoOps3IBY+NV4ctKPiRd0a8LnIR5fnoR96L4UwRQ/eh9CKFRCQjJ2Ae6v
 7y2PuWMEbRKLhJ+V5FMZF3YSWzc9ZZ/4K5bNf8IfH1Ptx7GlNXayIGVWF3Z94i3vxQPS
 zCYw==
X-Gm-Message-State: AO0yUKWiEG6aR1AaDDZKAeDm53ZLizNViE4mNr9DfdmKM6D1hEJBApWL
 F6A4ykUwp7S1SHBVkbvIBPflwXRRe5twBUZLuNyTew==
X-Google-Smtp-Source: AK7set8qT7Gq/IwcXDdIxgP8lFOHwGpbAVSAfjrvcMHZJxEV+zojYfC9/bwzh3NmmTCxATKK2uuVmQ==
X-Received: by 2002:a17:90b:3a88:b0:237:b702:4958 with SMTP id
 om8-20020a17090b3a8800b00237b7024958mr9678127pjb.38.1678063203139; 
 Sun, 05 Mar 2023 16:40:03 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 08/84] accel/tcg: Trigger watchpoints from atomic_mmu_lookup
Date: Sun,  5 Mar 2023 16:38:38 -0800
Message-Id: <20230306003954.1866998-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fixes a bug in that we weren't reporting these changes.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b49fb0d754..e984a98dc4 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1767,6 +1767,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     CPUTLBEntry *tlbe;
     target_ulong tlb_addr;
     void *hostaddr;
+    CPUTLBEntryFull *full;
 
     tcg_debug_assert(mmu_idx < NB_MMU_MODES);
 
@@ -1805,17 +1806,26 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
             tlb_addr = tlb_addr_write(tlbe) & ~TLB_INVALID_MASK;
         }
 
-        /* Let the guest notice RMW on a write-only page.  */
-        if ((prot & PAGE_READ) &&
-            unlikely(tlbe->addr_read != (tlb_addr & ~TLB_NOTDIRTY))) {
-            tlb_fill(env_cpu(env), addr, size,
-                     MMU_DATA_LOAD, mmu_idx, retaddr);
+        if (prot & PAGE_READ) {
             /*
-             * Since we don't support reads and writes to different addresses,
-             * and we do have the proper page loaded for write, this shouldn't
-             * ever return.  But just in case, handle via stop-the-world.
+             * Let the guest notice RMW on a write-only page.
+             * We have just verified that the page is writable.
+             * Subpage lookups may have left TLB_INVALID_MASK set,
+             * but addr_read will only be -1 if PAGE_READ was unset.
              */
-            goto stop_the_world;
+            if (unlikely(tlbe->addr_read == -1)) {
+                tlb_fill(env_cpu(env), addr, size,
+                         MMU_DATA_LOAD, mmu_idx, retaddr);
+                /*
+                 * Since we don't support reads and writes to different
+                 * addresses, and we do have the proper page loaded for
+                 * write, this shouldn't ever return.  But just in case,
+                 * handle via stop-the-world.
+                 */
+                goto stop_the_world;
+            }
+            /* Collect TLB_WATCHPOINT for read. */
+            tlb_addr |= tlbe->addr_read;
         }
     } else /* if (prot & PAGE_READ) */ {
         tlb_addr = tlbe->addr_read;
@@ -1838,10 +1848,18 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     }
 
     hostaddr = (void *)((uintptr_t)addr + tlbe->addend);
+    full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
 
     if (unlikely(tlb_addr & TLB_NOTDIRTY)) {
-        notdirty_write(env_cpu(env), addr, size,
-                       &env_tlb(env)->d[mmu_idx].fulltlb[index], retaddr);
+        notdirty_write(env_cpu(env), addr, size, full, retaddr);
+    }
+
+    if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
+        QEMU_BUILD_BUG_ON(PAGE_READ != BP_MEM_READ);
+        QEMU_BUILD_BUG_ON(PAGE_WRITE != BP_MEM_WRITE);
+        /* therefore prot == watchpoint bits */
+        cpu_check_watchpoint(env_cpu(env), addr, size,
+                             full->attrs, prot, retaddr);
     }
 
     return hostaddr;
-- 
2.34.1


