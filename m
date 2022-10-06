Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F975F5F9E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:27:35 +0200 (CEST)
Received: from localhost ([::1]:45984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHXq-0007Gz-KG
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIM-0005lJ-BR
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:34 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIJ-0006xx-Lh
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:33 -0400
Received: by mail-pf1-x435.google.com with SMTP id v186so835268pfv.11
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ULPvu65y7cKgYxJ4IWHn+ywuUWPFC8b08pn8/4qmNEE=;
 b=MtiqkBOI22xSrSSjkzdV6NySrX5QpdEqBEfwSnB/9CLp90Rb/VbntibIgK74D7UGtk
 SurOo7sARKsniunb5IpiQwW1ijVkcb6OHwP2Wd7gXArGxeoyZ6Jpv0JOGMDnAhLfxMxc
 7fGLXqb/SwpERp7qU2PFwmI0DCBxNFSeFrpT2cqxa7tSOquOFcJgBMm7NApmSsBFo1m3
 CgSKq2q3h83R1DhCkD1F+t84l1dy2C4wxpTO+G5IZeE/b4IftoRa+8+eHdZugQk1kC5Z
 /1Boe8x2PNVLa9oHoCAdJidvue61Tp+GQo977ZXCyNvAfw/NVPRvVhk6BKM6WWN7Mlo8
 WISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ULPvu65y7cKgYxJ4IWHn+ywuUWPFC8b08pn8/4qmNEE=;
 b=SUtF+WdXTDdVjSl3YlJzUIIbu9C2nJDo15qTuHqVQGobdDnk3C1uCLUTEV4Z85liQ4
 e6DyPRyY8Mrm5NmNg61JMHNdCddGVI8g6q/MGiEPYy5skCodZRZ/I8PQKdZ2Xi8bk8me
 x2+ertYHXn67iqSN0wWb3wWj+2vpcVnGdommbSMePd+8stF50jK3BnEicNrOQkwUVbLd
 KMOv7fwH0HKzZbVCiK2eePQ4qWIsdbFwDgc+T/2auQvl1XpsVp79gv5jLzk0kZ0k70Fm
 c/BE4GgJtLEDwYDM0NgZDevL48mAuwsuwcOyWrqq8N4j3cn3dtvQm0RXfBRvJg5qiOE3
 C8cg==
X-Gm-Message-State: ACrzQf3WyVsZQuZrOdgGQEjv8oYAK1inqE+w5cOevehnO/kGjKCF+w21
 Y3e8QwztdCVdub9MqMkXF6a+71QvZgBbBQ==
X-Google-Smtp-Source: AMsMyM5SoKQGjPX+HOObekiT6U8HuXkFmgdFzSgbCkfXAb6CVotRZrmzj8rt90plZBQtDRjlvTRS/Q==
X-Received: by 2002:a05:6a00:2314:b0:546:ce91:89a3 with SMTP id
 h20-20020a056a00231400b00546ce9189a3mr2803311pfh.77.1665025890166; 
 Wed, 05 Oct 2022 20:11:30 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 12/24] accel/tcg: Unify declarations of
 tb_invalidate_phys_range
Date: Wed,  5 Oct 2022 20:11:01 -0700
Message-Id: <20221006031113.1139454-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

We missed this function when we introduced tb_page_addr_t.

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


