Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A423A4B76
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:56:47 +0200 (CEST)
Received: from localhost ([::1]:35822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrr14-000702-O3
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmk-0002ft-P1
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:58 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:39764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmg-0002e4-6d
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:58 -0400
Received: by mail-pf1-x429.google.com with SMTP id k15so5692617pfp.6
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rVXDKDz9VV+CueY0JW5pxfv4fXwklGCn3HdEg7Jb5yI=;
 b=Q9cfMLAuN8JYVME3XH38A1xn5P1ELwmFrcR7Xthz+RL2ccSYOIgmtoPa5UMiFoaHOg
 4IYUz/Ko6S2G6QzQoiOGu47IdGNFSu5Z4RWogXNEz2WK0z2lnfNjP1NSA/bcROncAZIh
 jIpaEgJY3oebgDu9RqdAyi4oFOPDWCwr5k4EHVGx+Zp08WP3WdNWKbOz/PCFQ8WeoJMy
 NSWJahdgLOcfwvk/A4IeIy6c9BqtdlNV4JXaxeuC35VItkNvLmurhQxnNQFDwMaCLauD
 PH1S5iY0F47+le5Jdc3lmJ8+7hA2/5C4sUstJkOpXcS7eJrG3VYRfRpWzxr/0kP9s+Q7
 +ebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rVXDKDz9VV+CueY0JW5pxfv4fXwklGCn3HdEg7Jb5yI=;
 b=R5++/nYACrzhvOKH/del64I7ijRr9ze3m4c4rwLVwyXR+nX12hZa6MCAp8OresycUg
 33tTHys0avv6oUBL9teAj2+eJjR7ksjYWvLJp7J41YlymmzE3cpnPPea9Oo4UZ9a4gVo
 iByvs5D/X12XRHGicqxbNKJpL13X+a5IHJYQGSVyAMTVWMYVuP7tOwG+EeSL292t2ALp
 6ExLvT7AIfpuQrn7UNU/bAy481V8GR3Pt6HXk4/9hgM56b8jnGRjYvS00iZf9DJaS1MI
 c/Pce1aVLf/hoH7PSTfL37hZ+JR2Gv9BrO2Z7xv4eRcHBWaDGJERkOCAM7Ses2DYWfmu
 OFMg==
X-Gm-Message-State: AOAM5302y9TzhRMJUzF9EnNn/sNjDmHuzqn32rbU/ATWs/mBav1T23ON
 vpflBLJdi2IlTCBegv/RqKRPCNHFja07zw==
X-Google-Smtp-Source: ABdhPJws6COZgDl+/kkR9IzdcK+Y3sp8HeemH6svWqqy9dLIrzZVIHaQhxArsLSV33OUU34TI6wAlw==
X-Received: by 2002:a65:6114:: with SMTP id z20mr5981132pgu.249.1623454912873; 
 Fri, 11 Jun 2021 16:41:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/34] accel/tcg: Merge tcg_exec_init into tcg_init_machine
Date: Fri, 11 Jun 2021 16:41:22 -0700
Message-Id: <20210611234144.653682-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is only one caller, and shortly we will need access
to the MachineState, which tcg_init_machine already has.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h      |  2 ++
 include/sysemu/tcg.h      |  2 --
 accel/tcg/tcg-all.c       | 16 +++++++++++++++-
 accel/tcg/translate-all.c | 21 ++-------------------
 bsd-user/main.c           |  2 +-
 5 files changed, 20 insertions(+), 23 deletions(-)

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
index 30d81ff7f5..e990180c4b 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -32,6 +32,7 @@
 #include "qemu/error-report.h"
 #include "qemu/accel.h"
 #include "qapi/qapi-builtin-visit.h"
+#include "internal.h"
 
 struct TCGState {
     AccelState parent_obj;
@@ -109,8 +110,21 @@ static int tcg_init_machine(MachineState *ms)
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
+    /*
+     * There's no guest base to take into account, so go ahead and
+     * initialize the prologue now.
+     */
+    tcg_prologue_init(tcg_ctx);
+#endif
+
     return 0;
 }
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4f563b8724..59609d62d5 100644
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
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 270cf2ca70..fe66204b6b 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -813,7 +813,7 @@ int main(int argc, char **argv)
     envlist_free(envlist);
 
     /*
-     * Now that page sizes are configured in tcg_exec_init() we can do
+     * Now that page sizes are configured we can do
      * proper page alignment for guest_base.
      */
     guest_base = HOST_PAGE_ALIGN(guest_base);
-- 
2.25.1


