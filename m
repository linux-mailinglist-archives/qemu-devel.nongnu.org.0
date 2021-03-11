Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71578336898
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:28:44 +0100 (CET)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9Bz-0004px-CT
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95w-0004uS-CB
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:28 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:45044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95l-0001Mv-RZ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:28 -0500
Received: by mail-ot1-x32f.google.com with SMTP id p24so4410534ota.11
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fDUV0XaBa+zUybCathQxLsZ1yQJyGr4UGBPgHHGORw=;
 b=YD+3Dj53vQJLesx05Smk0yPUaAFzErwyetaODGfJbZrWv+ZpE4lndAQOvM/H7xB2w/
 2VItYxLZhDuvP0mejcmY1CBibsCu/eJGWhrmaIMhXBlX5fIPb/gFsBQvGd2g8UCx7PE6
 3JeDK0skSl7CqJ+vhqEBeDiG1szhUWJuoWLiK3ZUyHgNBNLPkUmlVV8gSQ7P2cfYZUiM
 0flL3CXf8O2Ut6pwcc7KoQ7YlketUKJA+fEbEIllWbUPgiRHTBYkdCn4Rtz0T1QaOaie
 Ep4xfn8WX4z2hK/9vtIc6+i9i1TwAClobRShK2lfAOH6sg+tC2Ds8dJzf81xuWZQivQE
 9k6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fDUV0XaBa+zUybCathQxLsZ1yQJyGr4UGBPgHHGORw=;
 b=K+M3s0bMBZXbjwUDaIfmkVuYFrkgb/zZNCReM0W3gRTSzzcoWtjrEMCm6OSKQvCNZW
 63sEYuKD6CFA+85i+RmhkU+M/lw3rW99E7WelL0ZbKqVSnJ2jul6ctd7O1+yUQbQomHb
 W31lLVjMT4mEtH/7CNVQ66njyVNLkNm8u3I3Uhh1fq70OD5K6laPZVJ8wvhgk6N0jXPS
 80x4PI78yAdOXeRCEuTZmLT4bNC/1nZF1KJwJqgLxrejyT7L9Sb6VW6OOyE8hE3VBeP4
 ds7CZEYCtrUZnieiEWdPb1paGL04S4gORRbaV5Ww1+P9Sk8LUqm6zhe8AYlNXZeUrpQC
 IRhg==
X-Gm-Message-State: AOAM532g3IOaTEnu2YTYniVO2ZdFRWxmqJ2SCc6YNC+ufPdAD02RVR9P
 BBefMSnQ90Lzb+DQURwKlam3P2K8mXtNEhAP
X-Google-Smtp-Source: ABdhPJwDxizErdJ7/NHgwGvyZMY5sRe7VcLlkmOndNu5XCpP8N9AMSXGCA786uzZzYK1ghzCHOo20A==
X-Received: by 2002:a9d:4d96:: with SMTP id u22mr4793421otk.106.1615422135534; 
 Wed, 10 Mar 2021 16:22:15 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/26] accel/tcg: Merge tcg_exec_init into tcg_init_machine
Date: Wed, 10 Mar 2021 18:21:43 -0600
Message-Id: <20210311002156.253711-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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


