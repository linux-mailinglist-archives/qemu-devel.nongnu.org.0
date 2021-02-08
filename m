Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEFB3144EB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:29:39 +0100 (CET)
Received: from localhost ([::1]:42670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GuQ-0001Xt-J4
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9G7i-00055q-UD
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 18:39:18 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9G7c-00010E-Dn
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 18:39:18 -0500
Received: by mail-pf1-x435.google.com with SMTP id q131so10719681pfq.10
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 15:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DqDS++ASKRz2BpCakcktMBnc/QXED2AN0Q9nieRwrbQ=;
 b=u3xF5UPOm10jLoMEaWGYABTmMgunkc7m3/+K++5qMoq96rTXD6k1fb4nX99eBixENC
 ZReNA5ERd4OEcuODIBuTYK8iE6KHG0sT6rtz2TPc63RPB0xmhsjNFHDFiUlZZAQFyYTT
 lC/9zIon4XDQtmJgq+3gh1ZsQf1U4ZpWlLnS4piKmZB02OviIIp5QPe3mduAN8Oa0qJg
 1xRkkcu2Gdil1PQmPw0LAiVMTSWW2nRC8cDjZSS9QaY1Lg/TdPC5CDumEMcdatOJy3QT
 Olg2PHq86RZ9EktDaIsn9aBpDWdP5/s2GIsxpoJbBUsofYtexvaX9KOjXJDFvkJ07yhU
 ZSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DqDS++ASKRz2BpCakcktMBnc/QXED2AN0Q9nieRwrbQ=;
 b=uXMl20JgH8ZmZkzA2bud4n9woWDlymi+wCz+OJspbEtJ6eudpI8NxVahVqIv111re3
 sFdZCiED10J7u/hlQHYOluHjwRBWcqgGBhuQHN+2xzKG1Fx4BABRdMTS+1Jmu3U0b/6B
 WU8sI06kB0ATwzx8gLVnlq949/B6jQ73TJBF15ZQ6B4RL7EHsliUzOHTvvS/e6eN3VXJ
 liae9oBVYY7JoKj4OS+Ipqqw/mwmVUffPrPdI8VUgAAS3IRWUrBjmv6ROY7M3yHTxMh8
 FSo6jOwPwYIe1FuXaD9e8u7prRFOlyyRSsosXDL0IUAZsN/L2UW+iRUXd92LQS0Mx/Gf
 9x4w==
X-Gm-Message-State: AOAM531tglxbwmDgJV8YkFuRStyFR1rydSesgLYpGJ0sIlC02aNpprV3
 QUG3n8F0/fuw/PCCVObOEjeHy3UeA1VBKQ==
X-Google-Smtp-Source: ABdhPJyU6FeshSrgguVtTQHQMFQqwPXwmu6qDIyVzIq7P6/sV9AvtqDP2Hkcr9vzARm4NFjWoBJ5Fw==
X-Received: by 2002:a63:1a1d:: with SMTP id a29mr5955497pga.236.1612827551111; 
 Mon, 08 Feb 2021 15:39:11 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k15sm13483489pgt.35.2021.02.08.15.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 15:39:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] accel/tcg: Create io_recompile_replay_branch hook
Date: Mon,  8 Feb 2021 15:39:04 -0800
Message-Id: <20210208233906.479571-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208233906.479571-1-richard.henderson@linaro.org>
References: <20210208233906.479571-1-richard.henderson@linaro.org>
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
Cc: alex.bennee@linaro.org, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a hook in which to split out the mips and
sh4 ifdefs from cpu_io_recompile.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 10 ++++++++++
 accel/tcg/translate-all.c     | 17 +++++++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index ac3bb051f2..ddf334411f 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -88,6 +88,16 @@ struct TCGCPUOps {
      */
     bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
 
+    /**
+     * @io_recompile_replay_branch: Callback for cpu_io_recompile.
+     *
+     * The cpu has been stoped, and cpu_restore_state_from_tb has been
+     * called.  If the faulting instruction is in a delay slot, and the
+     * target architecture requires re-execution of the branch, then
+     * adjust the cpu state as required and return true.
+     */
+    bool (*io_recompile_replay_branch)(CPUState *cpu,
+                                       const TranslationBlock *tb);
 #endif /* CONFIG_SOFTMMU */
 #endif /* NEED_CPU_H */
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 81d4c83f22..6eb37883bd 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -60,6 +60,7 @@
 #include "sysemu/cpu-timers.h"
 #include "sysemu/tcg.h"
 #include "qapi/error.h"
+#include "hw/core/tcg-cpu-ops.h"
 #include "internal.h"
 
 /* #define DEBUG_TB_INVALIDATE */
@@ -2420,6 +2421,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
     CPUArchState *env = cpu->env_ptr;
 #endif
     TranslationBlock *tb;
+    CPUClass *cc;
     uint32_t n;
 
     tb = tcg_tb_lookup(retaddr);
@@ -2429,11 +2431,18 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
     }
     cpu_restore_state_from_tb(cpu, tb, retaddr, true);
 
-    /* On MIPS and SH, delay slot instructions can only be restarted if
-       they were already the first instruction in the TB.  If this is not
-       the first instruction in a TB then re-execute the preceding
-       branch.  */
+    /*
+     * Some guests must re-execute the branch when re-executing a delay
+     * slot instruction.  When this is the case, adjust icount and N
+     * to account for the re-execution of the branch.
+     */
     n = 1;
+    cc = CPU_GET_CLASS(cpu);
+    if (cc->tcg_ops->io_recompile_replay_branch &&
+        cc->tcg_ops->io_recompile_replay_branch(cpu, tb)) {
+        cpu_neg(cpu)->icount_decr.u16.low++;
+        n = 2;
+    }
 #if defined(TARGET_MIPS)
     if ((env->hflags & MIPS_HFLAG_BMASK) != 0
         && env->active_tc.PC != tb->pc) {
-- 
2.25.1


