Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C004360D928
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:18:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtz-0004xm-8M; Tue, 25 Oct 2022 22:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtx-0004xI-8P
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:17 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtv-0001AU-L2
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:17 -0400
Received: by mail-pj1-x1033.google.com with SMTP id m2so8713816pjr.3
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eijG0kSDPpiRBm8vllHxEuHeocUFGDghO4DAqpTBKuY=;
 b=Vn+XFUIqnxMIwC+VG0Di9Emya12isVwomC/eP9ULFaGbVe8ICDvZIFCjjm2HHyPFnk
 dQNVMylxuqIdxRxsKVFnjKwokkJsW4VJmZVphsQBOrE9fWwOUhYo9JFkAB2QtDvysKWt
 nwt89XJv6k84WHOZrMHbCpnTZ2VfxjVU2fKrWDOJpSqh3rN/tDfkoaLPH9tfoG7u3Hks
 qHZ19CU5LrpqrSSJehLVq/I8oCygOr6enkwfaO9IJv2lQGQyuLWmlJFc6ePBj7Q/xxlw
 s2tJ180TBXKyNnAzzVVyt8o4JGT3wsOQsWSpK5OH7wm+Zme6Gg5wSyZXd2VAGkkAZxBG
 19Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eijG0kSDPpiRBm8vllHxEuHeocUFGDghO4DAqpTBKuY=;
 b=jLnYqCFCStLIYxZ8JMeErvkgGr3Z6epDUNcsHcLnmXRNJQe7jM7fjaj3tzn+p5qrY0
 PohoTnRlR8xD3jtfjNipmSgkietqYAKPnGnStmDMESfqMP4o92V1OMWOGqYGcITfxD71
 hnAv4KJk84K4MvPeMZJ4N7KZCEooQxV3YxKX86ajE0xQZVhj++WEq6WhBw02zSYJVsev
 Z3Rsdshru4HwqiMahE2t64mOIEqnhUoO0EAazsKx1fid1HLNUSS/PCaffjp9iSOn8rlq
 wKAszxbTyHq7J1wgR+cuJ8AcxNj8oorcCAafKfBcma9sDXoyG43cq/StLR4ATrYayuhk
 cz5w==
X-Gm-Message-State: ACrzQf2UAgeZ3t5BECZf5E1TI4yZ/AsHnFlmj3tosmuJpk8lOlfJFcFb
 fR5c6/ckKRRTZURt/o14cjapOiJuM33kmciW
X-Google-Smtp-Source: AMsMyM53SfQ0nk/ZfLIAwQWf4zhO/SqquZwhvXJQ5al87ARcwRJPLF4mcxQk9cXLH6SSil1GzHu1tA==
X-Received: by 2002:a17:902:b20a:b0:178:6f5b:f903 with SMTP id
 t10-20020a170902b20a00b001786f5bf903mr42806853plr.39.1666750334896; 
 Tue, 25 Oct 2022 19:12:14 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 18/47] accel/tcg: Unify declarations of tb_invalidate_phys_range
Date: Wed, 26 Oct 2022 12:10:47 +1000
Message-Id: <20221026021116.1988449-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

We missed this function when we introduced tb_page_addr_t.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h |  2 +-
 include/exec/ram_addr.h |  2 --
 accel/tcg/tb-maint.c    | 13 ++-----------
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 5900f4637b..5ae484e34d 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -638,12 +638,12 @@ uint32_t curr_cflags(CPUState *cpu);
 /* TranslationBlock invalidate API */
 #if defined(CONFIG_USER_ONLY)
 void tb_invalidate_phys_addr(target_ulong addr);
-void tb_invalidate_phys_range(target_ulong start, target_ulong end);
 #else
 void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
 #endif
 void tb_flush(CPUState *cpu);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
+void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end);
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
 
 /* GETPC is the true target of the return instruction that we'll execute.  */
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index f3e0c78161..1500680458 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -147,8 +147,6 @@ static inline void qemu_ram_block_writeback(RAMBlock *block)
 #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
 #define DIRTY_CLIENTS_NOCODE  (DIRTY_CLIENTS_ALL & ~(1 << DIRTY_MEMORY_CODE))
 
-void tb_invalidate_phys_range(ram_addr_t start, ram_addr_t end);
-
 static inline bool cpu_physical_memory_get_dirty(ram_addr_t start,
                                                  ram_addr_t length,
                                                  unsigned client)
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index bac43774c0..c8e921089d 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "exec/cputlb.h"
 #include "exec/log.h"
+#include "exec/exec-all.h"
 #include "exec/translate-all.h"
 #include "sysemu/tcg.h"
 #include "tcg/tcg.h"
@@ -27,12 +28,6 @@
 #include "tb-context.h"
 #include "internal.h"
 
-/* FIXME: tb_invalidate_phys_range is declared in different places. */
-#ifdef CONFIG_USER_ONLY
-#include "exec/exec-all.h"
-#else
-#include "exec/ram_addr.h"
-#endif
 
 static bool tb_cmp(const void *ap, const void *bp)
 {
@@ -599,11 +594,7 @@ void tb_invalidate_phys_page(tb_page_addr_t addr)
  *
  * Called with mmap_lock held for user-mode emulation.
  */
-#ifdef CONFIG_SOFTMMU
-void tb_invalidate_phys_range(ram_addr_t start, ram_addr_t end)
-#else
-void tb_invalidate_phys_range(target_ulong start, target_ulong end)
-#endif
+void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
 {
     struct page_collection *pages;
     tb_page_addr_t next;
-- 
2.34.1


