Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE8F60D940
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:27:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtg-0004t1-6C; Tue, 25 Oct 2022 22:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtb-0004sX-93
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:58 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtZ-00010z-Nb
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:55 -0400
Received: by mail-pf1-x429.google.com with SMTP id w189so12449432pfw.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2O2lTkgF9rzGFGHASrYzq+88u+IS7lRPeNlhOf/ZoVg=;
 b=mNLHtAwwYwZa7OlV3Z1/fw7UTst7REdsks7oNNGZT5/pB2TgCxmqoPyMVfY07CAvRq
 Lkrw3TCmDqh5r361smbgM8CDVC5XIWIsAVpWgKMKvQe/KBpxQj2muAF1lYyotGdyKLbl
 Asy+JtGtGiw9jUgg6c8p4sSF9DmjP4UggjIrZL/pZFrI2lxR+skmknDyRelmWPqMFUtb
 6YlFr8QRfedH2vGUkHve0Xb7VVdoVI+xgEZDvAI0rfb2y6ntYFO49gF0yHapojH7eLpL
 Jz/cnacz3z1XkzHc4KardiVwR0zfwLvBT4642P89xtynb05dbMhuyE9Rx7SObwKKeYjA
 ciYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2O2lTkgF9rzGFGHASrYzq+88u+IS7lRPeNlhOf/ZoVg=;
 b=uFICcPGJi3ZVS4e7Fe3WxbcaTIeVEluOLjz02cRxrPuv6BYFPdEhHa82o+0VpYmIh6
 gpZaFmhwby0XQsFjFdzsdHfZ9jkfHunnGQQOWaexBs4U0gYJmWJl0kE7XksguGMGhLcT
 ELRCYaXJm4BsCOThdpu/E2y6eL/sG5muSRXXppqh4nmpEFzVM6islujcjsAMsfZiMrNu
 ZjlhIxapbYX9yKW7lqTIWKSdKGQM5pG02HKsZ19OnCWGPA7fRsbXeqSBpOcK8Jfr1YWP
 8cvRG88DvzDpHunGOXAE6S4vU7mPE09c6A+w9+AtOhoEoXuCS5zaHO6oCvqWYQnyihPP
 qpZA==
X-Gm-Message-State: ACrzQf0yDFC3SIoq8NYNRcQ1wegbBOcWHDv50qZ9Rr4uBxrtc1SrfCPM
 +GNN4813p7840IjfgVoAzVrn/6cTu7BPHMaG
X-Google-Smtp-Source: AMsMyM5CV1YoycRi/TuY9UtyaPi+GesRYBvNCx6Xs19TPASh3JfOaYPbdNsyK+uJYniZCRRJ+8rr1A==
X-Received: by 2002:a05:6a00:1414:b0:563:ae66:3103 with SMTP id
 l20-20020a056a00141400b00563ae663103mr41258678pfu.17.1666750312851; 
 Tue, 25 Oct 2022 19:11:52 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:11:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 10/47] accel/tcg: Split out PageDesc to internal.h
Date: Wed, 26 Oct 2022 12:10:39 +1000
Message-Id: <20221026021116.1988449-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


