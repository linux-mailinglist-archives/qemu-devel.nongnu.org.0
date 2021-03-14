Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4C033A83E
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:33:20 +0100 (CET)
Received: from localhost ([::1]:39836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYMQ-00030L-U4
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH4-00066z-3l
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:46 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:42813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH0-0008Dj-65
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:45 -0400
Received: by mail-qt1-x832.google.com with SMTP id l13so7875378qtu.9
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fDUV0XaBa+zUybCathQxLsZ1yQJyGr4UGBPgHHGORw=;
 b=QIvcmaKpZKQ/ZRHiFP55X33t6SYtUlBY8skpo5ap4G+IZrC3boWK/Yk2ySPoCeW0ew
 QhXgqbOTDFzSriE1cOvHzF0g6/2dZ/Rdpx95/I8Fj+b+hIHmQbRVykn//eXa9AwJd2a1
 uHuT/5vTe/uJgwO2rNTowgcyTap05z4CcFNZErTQ8LD8ZYdaVjLKMRS9EQw5jeiVhn5n
 +dpwCA2g4vkl3pTfBgpY+4wSIpd0D/gJ+LgeZzZKcpwPmUozW0SszLBBiGCy8OfNUiFs
 CbVLTSo4sek6QGD5YKC2vWTqxgyw2LPtoWXwr5UuGUYtuJZ/MO6Jv3TUeFBA+U+apYhN
 CDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fDUV0XaBa+zUybCathQxLsZ1yQJyGr4UGBPgHHGORw=;
 b=klZlC/DmntZDrCrTPhDzS9UeMnhT9MdHayZvro7ziU12pCp9nHu18Lndt2iPDSGavy
 +atOXhmLb8IUVj+2Dq5VF8X0S6aYZs4v4jkGASvS025nUNRpcgQqctdjHWn3chXK3im0
 TIh3mljMTjoYnUs7rmel7YSUlwrN0nDdnviWGulV9zDZ3JBOmzEnn2E41nO6EtiNkWC/
 9dAQBBwQnkuH0bs0brpCuf4yMoF0FN1KszI+h1a7f1L/vgqREOL0x4DNQ3Hpcs9DeE4l
 loOHlg6V2jQtE92XQ8wi6G2oCiHIXYzPcYfH2hWNsiVESTf3IJ4v7AflqRRmmNWP+DR0
 3O+A==
X-Gm-Message-State: AOAM533DTaGd+zpsfEGb36zqz3DQ/eBpXrMFcaKMzb2OoJtaP1UOjPJC
 YKYAb/TLVpfnwj6mudE56pESY8vt7XCpWENc
X-Google-Smtp-Source: ABdhPJwdlRzJqCTV/E6IdrIWUIMxJwZusP+iqulNzDU0w8xdeBHKOyheTnvTq8n3t0sFSi83lhGxQA==
X-Received: by 2002:a05:622a:1115:: with SMTP id
 e21mr282033qty.192.1615757260787; 
 Sun, 14 Mar 2021 14:27:40 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/29] accel/tcg: Merge tcg_exec_init into tcg_init_machine
Date: Sun, 14 Mar 2021 15:27:07 -0600
Message-Id: <20210314212724.1917075-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is only one caller, and shortly we will need access
to the MachineState, which tcg_init_machine already has.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h      |  2 ++
 include/sysemu/tcg.h      |  2 --
 accel/tcg/tcg-all.c       | 14 +++++++++++++-
 accel/tcg/translate-all.c | 21 ++-------------------
 4 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index e9c145e0fb..881bc1ede0 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -16,5 +16,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu, target_ulong pc,
                               int cflags);
 
 void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
+void page_init(void);
+void tb_htable_init(void);
 
 #endif /* ACCEL_TCG_INTERNAL_H */
diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index 00349fb18a..53352450ff 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -8,8 +8,6 @@
 #ifndef SYSEMU_TCG_H
 #define SYSEMU_TCG_H
 
-void tcg_exec_init(unsigned long tb_size, int splitwx);
-
 #ifdef CONFIG_TCG
 extern bool tcg_allowed;
 #define tcg_enabled() (tcg_allowed)
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 30d81ff7f5..0e83acbfe5 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -32,6 +32,7 @@
 #include "qemu/error-report.h"
 #include "qemu/accel.h"
 #include "qapi/qapi-builtin-visit.h"
+#include "internal.h"
 
 struct TCGState {
     AccelState parent_obj;
@@ -109,8 +110,19 @@ static int tcg_init_machine(MachineState *ms)
 {
     TCGState *s = TCG_STATE(current_accel());
 
-    tcg_exec_init(s->tb_size * 1024 * 1024, s->splitwx_enabled);
+    tcg_allowed = true;
     mttcg_enabled = s->mttcg_enabled;
+
+    page_init();
+    tb_htable_init();
+    tcg_init(s->tb_size * 1024 * 1024, s->splitwx_enabled);
+
+#if defined(CONFIG_SOFTMMU)
+    /* There's no guest base to take into account, so go ahead and
+       initialize the prologue now.  */
+    tcg_prologue_init(tcg_ctx);
+#endif
+
     return 0;
 }
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 050b4bff46..40aeecf611 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -408,7 +408,7 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
     return false;
 }
 
-static void page_init(void)
+void page_init(void)
 {
     page_size_init();
     page_table_config_init();
@@ -907,30 +907,13 @@ static bool tb_cmp(const void *ap, const void *bp)
         a->page_addr[1] == b->page_addr[1];
 }
 
-static void tb_htable_init(void)
+void tb_htable_init(void)
 {
     unsigned int mode = QHT_MODE_AUTO_RESIZE;
 
     qht_init(&tb_ctx.htable, tb_cmp, CODE_GEN_HTABLE_SIZE, mode);
 }
 
-/* Must be called before using the QEMU cpus. 'tb_size' is the size
-   (in bytes) allocated to the translation buffer. Zero means default
-   size. */
-void tcg_exec_init(unsigned long tb_size, int splitwx)
-{
-    tcg_allowed = true;
-    page_init();
-    tb_htable_init();
-    tcg_init(tb_size, splitwx);
-
-#if defined(CONFIG_SOFTMMU)
-    /* There's no guest base to take into account, so go ahead and
-       initialize the prologue now.  */
-    tcg_prologue_init(tcg_ctx);
-#endif
-}
-
 /* call with @p->lock held */
 static inline void invalidate_page_bitmap(PageDesc *p)
 {
-- 
2.25.1


