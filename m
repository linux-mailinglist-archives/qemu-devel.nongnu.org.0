Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF21560D921
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:16:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtf-0004sV-47; Tue, 25 Oct 2022 22:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtZ-0004s5-EM
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:53 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtX-00019J-NW
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:53 -0400
Received: by mail-pg1-x531.google.com with SMTP id 20so13456423pgc.5
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BPiDOXuJlTG0AgncYY09MVfeOS94NwO0enHpea3qlzk=;
 b=EmUxRxvV3dM6zYeIvTPiWxmehQUySmF4Eow8itRUX4BPO8AXhCauBjysF9qpwJvpW7
 bWh72I+eWCVxV+qZgV4JvNFLX8lRss0gYBGRaEBXoH+BVsRFHzlMYK6Gt9ZEm6raXzek
 pqQVa7iM+SFXxYwldqldxitm1ivHYvosgt+KrwzBrmaBGcZJp+dWkEllsT9/xsOUUGUi
 HGsFQ2vXsi8Z42uJq2Wu4OhMpOvoN/9pZkcg3ag9qAk+TDa/4dZiy5iIRIssnJj+GWQh
 9bPmp3nk7xaDKz+Dr1Gazrm9B4MwtEf0Z3n7i6UnAmKTYzMHue24PMcLNx5BmGU2M2f9
 z/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BPiDOXuJlTG0AgncYY09MVfeOS94NwO0enHpea3qlzk=;
 b=QeLxXmobquO+zpYQa3bvgHW3bodFZo5QWTouFa8Dm/8+Klr2dlzhGUz1RIz1itkGiY
 inbf03lMU32IGLP5qHfCdmiBhx1ad6oqMkLXVt+jYSv043//+dXGlClCeNrMbNxW/hCG
 3xuz4TPQA3dI+IK2Qpac+ngLStqZEBXtn6A1e14R3OEqcApoe/6gMCr33B5lGlBhZJt7
 R4DqlpcaiqDWifaBTe8Fli6/7PxBUluqudMN0SAs1875IAz8wsPto0qF4ixicK76pVFP
 fGBl1jbDvITicxKegNuNL5T6/GGF081r+Gali3AD5fc1an/XvyvvpxJAofZpFKVHLYho
 QFVg==
X-Gm-Message-State: ACrzQf3NBsmKZ1edGe3HawbyE/7TL8+SOkeRI3chkFGJZRQZB5znaSGD
 mLo4sq88lk3MPumQwaMYXXTiRBoQ+vFVZT3u
X-Google-Smtp-Source: AMsMyM4LsgTciDZGrim6Z5NyovjTD1Xy8H8TwLjVOOak175g2uY3P9dqmUq2wQtQji4ofs0ZFAQKhw==
X-Received: by 2002:a63:5b53:0:b0:462:7149:2c54 with SMTP id
 l19-20020a635b53000000b0046271492c54mr34642091pgm.527.1666750310201; 
 Tue, 25 Oct 2022 19:11:50 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:11:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 09/47] accel/tcg: Remove disabled debug in translate-all.c
Date: Wed, 26 Oct 2022 12:10:38 +1000
Message-Id: <20221026021116.1988449-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These items printf, and could be replaced with proper
tracepoints if we really cared.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


