Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804665F5F59
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:14:14 +0200 (CEST)
Received: from localhost ([::1]:45060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHKv-0002PH-Dg
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIB-0005DG-0x
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:23 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHI8-0006vy-Mf
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:22 -0400
Received: by mail-pg1-x531.google.com with SMTP id 129so709141pgc.5
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1w8RFkCDZDZZBnVIiCx0QMrja2OHHbx0CNptzru5zOk=;
 b=HX9n+ztMBM6YxQK9yLEZcJDtgLnHnmUMk3oAch+wngbvtLrK9Zdn8isCieIj7KP+gt
 XzjdzRtBi7XY/LZhlsGGlV1XFECCzcBSiDUoXFSkkNp55M1r5GAhbU8S1DvS0CkodNHk
 rYLbuSPGPueQqDgmmG47VkG64cha7cp/zzQef1XKqTPplS7M5z6mOXLR635Up3pNihEb
 4NKwJXgfK6J4RTm1lb/8Ujtcv8+Ig3e0zprx1Lxf6Ti+My/wiNzfdEXm9ACLuvBosa5b
 stmgKAcjixThneB0KU9X3oH4MVTIFLL5VqRY2FxxedP0unVHuzvVOnIwAh7/qbnwpgjv
 HMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1w8RFkCDZDZZBnVIiCx0QMrja2OHHbx0CNptzru5zOk=;
 b=UaZGxLkmN/VokL04FHfXnCWfpEM2LbOg6Boy6ueRgvucRNhKCppkYk16J25GMd0WCs
 Lgwdg9hjz7z0A0A/nmsJ2xKVBlPEFu2pmGCw53YtOeWDCC5NqJpPxhGks5rL8rY+d8PV
 CZ0axSFSYqRSuG/uP9ZyJz3RVt4XFr4hAA0REIFDNuMT+6vKHggT53hT1KAdFKeuEpd0
 s0iffSaAWi7RejdCSREBBL+VTUeo5KSowIBV2BSc7HbnsWDhnxaO5Ycr7WFbdm9e09Ci
 uQ7TFy7sibyjMS7lxPRHj2pJamzjVioHhFMszzjWSM+l9zOT9ktOyyFNleM74Y8Y9BFe
 ZULA==
X-Gm-Message-State: ACrzQf17XaeY7Mf+GiY+l4YZ5F3sJqZxBF6yPoQd++P+UzB46NO7DLWl
 3aWquZRcIy6PF+45byEl981XnJ/De847Lg==
X-Google-Smtp-Source: AMsMyM4jwQp3Mcloeh/saxN7QrYWAIdPtdcJdW8HztNXo2fT4c2Dpavnur2x5syns9UcJ10RLYz8xA==
X-Received: by 2002:a63:89c3:0:b0:452:f2ad:52b9 with SMTP id
 v186-20020a6389c3000000b00452f2ad52b9mr2498054pgd.105.1665025879365; 
 Wed, 05 Oct 2022 20:11:19 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 03/24] accel/tcg: Remove disabled debug in translate-all.c
Date: Wed,  5 Oct 2022 20:10:52 -0700
Message-Id: <20221006031113.1139454-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

These items printf, and could be replaced with proper
tracepoints if we really cared.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 109 --------------------------------------
 1 file changed, 109 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 64a2601f9f..42385fa032 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -63,33 +63,7 @@
 #include "tb-context.h"
 #include "internal.h"
 
-/* #define DEBUG_TB_INVALIDATE */
-/* #define DEBUG_TB_FLUSH */
 /* make various TB consistency checks */
-/* #define DEBUG_TB_CHECK */
-
-#ifdef DEBUG_TB_INVALIDATE
-#define DEBUG_TB_INVALIDATE_GATE 1
-#else
-#define DEBUG_TB_INVALIDATE_GATE 0
-#endif
-
-#ifdef DEBUG_TB_FLUSH
-#define DEBUG_TB_FLUSH_GATE 1
-#else
-#define DEBUG_TB_FLUSH_GATE 0
-#endif
-
-#if !defined(CONFIG_USER_ONLY)
-/* TB consistency checks only implemented for usermode emulation.  */
-#undef DEBUG_TB_CHECK
-#endif
-
-#ifdef DEBUG_TB_CHECK
-#define DEBUG_TB_CHECK_GATE 1
-#else
-#define DEBUG_TB_CHECK_GATE 0
-#endif
 
 /* Access to the various translations structures need to be serialised via locks
  * for consistency.
@@ -940,15 +914,6 @@ static void page_flush_tb(void)
     }
 }
 
-static gboolean tb_host_size_iter(gpointer key, gpointer value, gpointer data)
-{
-    const TranslationBlock *tb = value;
-    size_t *size = data;
-
-    *size += tb->tc.size;
-    return false;
-}
-
 /* flush all the translation blocks */
 static void do_tb_flush(CPUState *cpu, run_on_cpu_data tb_flush_count)
 {
@@ -963,15 +928,6 @@ static void do_tb_flush(CPUState *cpu, run_on_cpu_data tb_flush_count)
     }
     did_flush = true;
 
-    if (DEBUG_TB_FLUSH_GATE) {
-        size_t nb_tbs = tcg_nb_tbs();
-        size_t host_size = 0;
-
-        tcg_tb_foreach(tb_host_size_iter, &host_size);
-        printf("qemu: flush code_size=%zu nb_tbs=%zu avg_tb_size=%zu\n",
-               tcg_code_size(), nb_tbs, nb_tbs > 0 ? host_size / nb_tbs : 0);
-    }
-
     CPU_FOREACH(cpu) {
         tcg_flush_jmp_cache(cpu);
     }
@@ -1005,57 +961,6 @@ void tb_flush(CPUState *cpu)
     }
 }
 
-/*
- * Formerly ifdef DEBUG_TB_CHECK. These debug functions are user-mode-only,
- * so in order to prevent bit rot we compile them unconditionally in user-mode,
- * and let the optimizer get rid of them by wrapping their user-only callers
- * with if (DEBUG_TB_CHECK_GATE).
- */
-#ifdef CONFIG_USER_ONLY
-
-static void do_tb_invalidate_check(void *p, uint32_t hash, void *userp)
-{
-    TranslationBlock *tb = p;
-    target_ulong addr = *(target_ulong *)userp;
-
-    if (!(addr + TARGET_PAGE_SIZE <= tb_pc(tb) ||
-          addr >= tb_pc(tb) + tb->size)) {
-        printf("ERROR invalidate: address=" TARGET_FMT_lx
-               " PC=%08lx size=%04x\n", addr, (long)tb_pc(tb), tb->size);
-    }
-}
-
-/* verify that all the pages have correct rights for code
- *
- * Called with mmap_lock held.
- */
-static void tb_invalidate_check(target_ulong address)
-{
-    address &= TARGET_PAGE_MASK;
-    qht_iter(&tb_ctx.htable, do_tb_invalidate_check, &address);
-}
-
-static void do_tb_page_check(void *p, uint32_t hash, void *userp)
-{
-    TranslationBlock *tb = p;
-    int flags1, flags2;
-
-    flags1 = page_get_flags(tb_pc(tb));
-    flags2 = page_get_flags(tb_pc(tb) + tb->size - 1);
-    if ((flags1 & PAGE_WRITE) || (flags2 & PAGE_WRITE)) {
-        printf("ERROR page flags: PC=%08lx size=%04x f1=%x f2=%x\n",
-               (long)tb_pc(tb), tb->size, flags1, flags2);
-    }
-}
-
-/* verify that all the pages have correct rights for code */
-static void tb_page_check(void)
-{
-    qht_iter(&tb_ctx.htable, do_tb_page_check, NULL);
-}
-
-#endif /* CONFIG_USER_ONLY */
-
 /*
  * user-mode: call with mmap_lock held
  * !user-mode: call with @pd->lock held
@@ -1339,12 +1244,6 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
         page_unlock(p2);
     }
     page_unlock(p);
-
-#ifdef CONFIG_USER_ONLY
-    if (DEBUG_TB_CHECK_GATE) {
-        tb_page_check();
-    }
-#endif
     return tb;
 }
 
@@ -2400,9 +2299,6 @@ void page_protect(tb_page_addr_t page_addr)
         }
         mprotect(g2h_untagged(page_addr), qemu_host_page_size,
                  (prot & PAGE_BITS) & ~PAGE_WRITE);
-        if (DEBUG_TB_INVALIDATE_GATE) {
-            printf("protecting code page: 0x" TB_PAGE_ADDR_FMT "\n", page_addr);
-        }
     }
 }
 
@@ -2458,11 +2354,6 @@ int page_unprotect(target_ulong address, uintptr_t pc)
                 /* and since the content will be modified, we must invalidate
                    the corresponding translated code. */
                 current_tb_invalidated |= tb_invalidate_phys_page(addr, pc);
-#ifdef CONFIG_USER_ONLY
-                if (DEBUG_TB_CHECK_GATE) {
-                    tb_invalidate_check(addr);
-                }
-#endif
             }
             mprotect((void *)g2h_untagged(host_start), qemu_host_page_size,
                      prot & PAGE_BITS);
-- 
2.34.1


