Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6A15F5F8D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:22:03 +0200 (CEST)
Received: from localhost ([::1]:44272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHSU-00062V-6B
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIC-0005FV-NR
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:24 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHI9-0006w3-Tb
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:23 -0400
Received: by mail-pf1-x436.google.com with SMTP id 204so841031pfx.10
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=764J2nU23cdJoOfmrYRPgvCCBrqv6qNC3BvDbeQIYOQ=;
 b=PHjpzG8rfue97AMar/CgW/bleEdc4lDiJDVst1X2QZOL+NfXkp/UdooUbE80Nsidvq
 0t/zrqDVq43x/yxFLHrdHa4J7c/jxAJk5qq3ylifPrTCjnMwpwK56SQqnJw3VHxY+QeX
 k+vB4D9iRofUNP7KOCzOCF2TnEQFFSE8g3p8MlE7/vyhoOgWz9aInYEEu41leEqaZmKk
 812CTwdEBxsk9feX/I5tQQgd65PgOOXvEMsf9y3b2qTvi+15ndKMYbpRg8KOCypqUHu6
 Iuc8GkBYtq7IoYzWO8cHofDbnTejokEmIK4bLUTVNvzQXnDFN0kxcki/FJPFvmZtidEA
 zHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=764J2nU23cdJoOfmrYRPgvCCBrqv6qNC3BvDbeQIYOQ=;
 b=edHtsc9z2128boD7pwExR1r9ALvdUDGZ+5406niw6xGcFQX4iH0SyvTCQbImRtHzN1
 J/f9W9eMARQRomJGjfDqW2m+V8dqBukjEyGrfbA8lltYvzvd4dv4Sd+zRoZ4rofM8mBy
 31S1OFIGUYyQyhASHMszh8BKIDGKvPI7+RMH5ZNJG/g2XnhmQHuSIuG/2iwyhRaKoHKQ
 O188YpdN/7B32Tn0/rXBd1uFKGOW+fH1suzXCZIaDluJLGykikbm9ON7NA1uTDLOg2Ir
 5EXXuWt20bCDjvsVd8JO2W/OQXpHlmAvaLq0+3DvqhI4USWYGpWte7ki8ojVm8luqoL6
 BYqA==
X-Gm-Message-State: ACrzQf35E3srmI80znBUs1Pu37SArk6oStXt2h9XE8AcpJP3tKGzI8VV
 //+u7auSweussNwycbDp9iQV2Djr9P2+Mg==
X-Google-Smtp-Source: AMsMyM4j4nXbaNlOznls0ZMcJ0nHjsJM4e7XMZql2T+P6dmKxeA1T4N44r3AGJQxjXy9pyOcusgztg==
X-Received: by 2002:a05:6a00:22d6:b0:543:7003:21ab with SMTP id
 f22-20020a056a0022d600b00543700321abmr2941791pfj.54.1665025880629; 
 Wed, 05 Oct 2022 20:11:20 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 04/24] accel/tcg: Split out PageDesc to internal.h
Date: Wed,  5 Oct 2022 20:10:53 -0700
Message-Id: <20221006031113.1139454-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h      | 31 +++++++++++++++++++++++++++++++
 accel/tcg/translate-all.c | 31 +------------------------------
 2 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index dc800fd485..62da49ed52 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -11,6 +11,37 @@
 
 #include "exec/exec-all.h"
 
+/*
+ * Access to the various translations structures need to be serialised
+ * via locks for consistency.  In user-mode emulation access to the
+ * memory related structures are protected with mmap_lock.
+ * In !user-mode we use per-page locks.
+ */
+#ifdef CONFIG_SOFTMMU
+#define assert_memory_lock()
+#else
+#define assert_memory_lock() tcg_debug_assert(have_mmap_lock())
+#endif
+
+typedef struct PageDesc {
+    /* list of TBs intersecting this ram page */
+    uintptr_t first_tb;
+#ifdef CONFIG_USER_ONLY
+    unsigned long flags;
+    void *target_data;
+#endif
+#ifdef CONFIG_SOFTMMU
+    QemuSpin lock;
+#endif
+} PageDesc;
+
+PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc);
+
+static inline PageDesc *page_find(tb_page_addr_t index)
+{
+    return page_find_alloc(index, false);
+}
+
 TranslationBlock *tb_gen_code(CPUState *cpu, target_ulong pc,
                               target_ulong cs_base, uint32_t flags,
                               int cflags);
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 42385fa032..86848c6743 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -65,30 +65,6 @@
 
 /* make various TB consistency checks */
 
-/* Access to the various translations structures need to be serialised via locks
- * for consistency.
- * In user-mode emulation access to the memory related structures are protected
- * with mmap_lock.
- * In !user-mode we use per-page locks.
- */
-#ifdef CONFIG_SOFTMMU
-#define assert_memory_lock()
-#else
-#define assert_memory_lock() tcg_debug_assert(have_mmap_lock())
-#endif
-
-typedef struct PageDesc {
-    /* list of TBs intersecting this ram page */
-    uintptr_t first_tb;
-#ifdef CONFIG_USER_ONLY
-    unsigned long flags;
-    void *target_data;
-#endif
-#ifdef CONFIG_SOFTMMU
-    QemuSpin lock;
-#endif
-} PageDesc;
-
 /**
  * struct page_entry - page descriptor entry
  * @pd:     pointer to the &struct PageDesc of the page this entry represents
@@ -445,7 +421,7 @@ void page_init(void)
 #endif
 }
 
-static PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
+PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
 {
     PageDesc *pd;
     void **lp;
@@ -511,11 +487,6 @@ static PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
     return pd + (index & (V_L2_SIZE - 1));
 }
 
-static inline PageDesc *page_find(tb_page_addr_t index)
-{
-    return page_find_alloc(index, false);
-}
-
 static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
                            PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc);
 
-- 
2.34.1


