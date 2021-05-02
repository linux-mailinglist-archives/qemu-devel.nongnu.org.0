Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D963370FC5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:25:54 +0200 (CEST)
Received: from localhost ([::1]:52404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLTF-0000Iz-4h
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMc-0008Ki-88
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:02 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMW-0002vJ-Ao
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:01 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 x7-20020a17090a5307b02901589d39576eso170895pjh.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2nk/Vuj2SdpJZ1YLzrc/VRv2Wt05fw7xVDCD8BqAg9c=;
 b=BxYNy4PlDmNZzBWOeGz1kIKFJLqs7yN4ayJ1KwfKvBvPPXRwWGWAXq4Pus0C+mv19q
 R6F3qEJe3SGgwnPLendiYid0A+5iu2QQ/JOfj3DT8P8/iiY26dNwgSRmAFunatCvJXLX
 UVjEUSXm1GwrzAcH/PM+dkur91kEa9rAkrReVl3i8YX31zDX7t9qVdZgRuhiW5BJtQeU
 DlcAeK5sNeMm3KIj8ccXY4eqnbXj/ZlVXegCW6JI0yNraDYAI7pA5wo6Sb7ZhWF8G+0s
 xJdCxRqNrvGMOqW4qj/Aqt/PT+aqouvgHFXZ6BA0qyDPoEao9ppdSeN1p3z3DQtcWhw7
 TYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2nk/Vuj2SdpJZ1YLzrc/VRv2Wt05fw7xVDCD8BqAg9c=;
 b=i9ePDCRJDx6Gdm4whXIG0ZUg5nhwcpW741XU8tjlGw080WjB+L5U55M32lDhdnZsgr
 GB4XYbHBH8aPtOZj0ujbYEiljqGTo0Z2JncVQYSQxSGX3rSKwfqzlK6KtOBW6iHn4ZXe
 cU17Jpe83xetSgTHtIK8Cedu1KTPhULqK4eQHgCj1uhwWdweOJxzTKI34h0uTCDG3Xpi
 3kM5OboTQZOtHlY24J0x3bmBrYBk/bb7f1gKQ7rPt1nhjacemVeWif6bHuKFLa/gZGQI
 zbuHttjkNoibA/jhH9A32iRP4GHK0GNZ35dSZyrIHzfl1KI7qk56VLpVxT3xaT2gAuEs
 +leA==
X-Gm-Message-State: AOAM531E89X2EGCTbMnF6qniXZrNuyQgvZFozM6VA3q/TbhDSP5EfuWZ
 DUDojY+2613sdAyFxN9jonTbLqR5D2XE3A==
X-Google-Smtp-Source: ABdhPJxoztoEZcx8VT+RwkIJziMcNFppvwSDfg3vgeS5uvdHqqBeyJ2oFWnBW7chY9ApKYsWatN4rg==
X-Received: by 2002:a17:902:dccc:b029:ed:32ed:e7d0 with SMTP id
 t12-20020a170902dcccb02900ed32ede7d0mr17415097pll.79.1619997534926; 
 Sun, 02 May 2021 16:18:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/28] accel/tcg: Merge tcg_exec_init into tcg_init_machine
Date: Sun,  2 May 2021 16:18:28 -0700
Message-Id: <20210502231844.1977630-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
index bebb3366c0..0c818c3618 100644
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


