Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CF03144E6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:27:34 +0100 (CET)
Received: from localhost ([::1]:35876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GsP-0007CY-Oa
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9G7c-0004zX-Kk
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 18:39:12 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:35155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9G7a-0000zN-SI
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 18:39:12 -0500
Received: by mail-pg1-x530.google.com with SMTP id t25so11297101pga.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 15:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/4OvZ/z8zgs+Zk4nXR9BgeBunVL67Ul7jA+wIZOB714=;
 b=VG7PcQvJ4VX8D6VAVxKrn7wbhNBalrA3j8geyB01s1RBhwZWbE78HjedcQr9gD11JP
 fbid8Zx/iWO7nagnQtdPrKKxePAWqzuMDbGvxeEBZz+MwoNsuTAgnwP1Db+mm6rzAFL+
 WPy1K/yCByV8OM25Jvi7dCEnOEErPhHa2AsEybBMG7eJKWf0F76aJyMJM6Y6PGmNNmrp
 LEViBLo+RJnA9xxkFccbnMdWhq/uPDGqJ4+prhFQUBH/DXzhDdtikrcpToVZNdkFdPeC
 WzUU4++CihRqzNkFXOm++JuBYOcBr3uUIQd6IRLtbb+SmX56pGAD94oNOb9Ac9lt7/gU
 QfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/4OvZ/z8zgs+Zk4nXR9BgeBunVL67Ul7jA+wIZOB714=;
 b=VxMODxdrrfhNPfhlB44eE9VuYbN4DwTFSqfPwuzLuZ2SlIICM9quOk6t4mdKNiu4xA
 7zdDpDd667wShK6ixgWGkhxg5HhV1GNhJwzmO4LxjcJ9satNUNQF2li1I3dtAqfwdiZx
 n8REfkULaIg6aWkx/4dEd9iX9p2RzExwvsTpWB7GGOSTHINTgUBuq31PY6Jq3i+ujg82
 1wqv+k0g43a5RdoPGWN5W7Ari6oguH3PW514TlTo7L1RtaIGlOoUpVMJfwFi8oavlv0n
 ZUvs+QbP0xIktcLPXO0MzutZYO+s0PdzPvUEa6cZIOOjOnnvrBOrfOe6Oq7O6glhvHU7
 89rA==
X-Gm-Message-State: AOAM533JdS/ztGw5ozxOKiS/GpyLEz6LTf154XTDtDg9wkxjVAbnbmFg
 R4723+ytrYtOiFK79j4wlFwZBeLGWUEUjA==
X-Google-Smtp-Source: ABdhPJyTeWjbjqFteNmcmhWHc2ESCh4se9vJtkJWwHJo/zmwPuhCWS+/i7WfZhcztjVLdfCsief0JA==
X-Received: by 2002:a63:574c:: with SMTP id h12mr19467486pgm.79.1612827549574; 
 Mon, 08 Feb 2021 15:39:09 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k15sm13483489pgt.35.2021.02.08.15.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 15:39:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] exec: Move TranslationBlock typedef to qemu/typedefs.h
Date: Mon,  8 Feb 2021 15:39:03 -0800
Message-Id: <20210208233906.479571-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208233906.479571-1-richard.henderson@linaro.org>
References: <20210208233906.479571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

This also means we don't need an extra declaration of
the structure in hw/core/cpu.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/tb-context.h     | 1 -
 include/hw/core/cpu.h         | 4 +---
 include/hw/core/tcg-cpu-ops.h | 3 +--
 include/qemu/typedefs.h       | 1 +
 target/arm/internals.h        | 3 +--
 target/cris/translate.c       | 2 +-
 target/lm32/translate.c       | 2 +-
 target/moxie/translate.c      | 2 +-
 target/unicore32/translate.c  | 2 +-
 9 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/include/exec/tb-context.h b/include/exec/tb-context.h
index ec4c13b455..cc33979113 100644
--- a/include/exec/tb-context.h
+++ b/include/exec/tb-context.h
@@ -26,7 +26,6 @@
 #define CODE_GEN_HTABLE_BITS     15
 #define CODE_GEN_HTABLE_SIZE     (1 << CODE_GEN_HTABLE_BITS)
 
-typedef struct TranslationBlock TranslationBlock;
 typedef struct TBContext TBContext;
 
 struct TBContext {
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 38d813c389..c005d3dc2d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -74,8 +74,6 @@ typedef enum MMUAccessType {
 
 typedef struct CPUWatchpoint CPUWatchpoint;
 
-struct TranslationBlock;
-
 /* see tcg-cpu-ops.h */
 struct TCGCPUOps;
 
@@ -375,7 +373,7 @@ struct CPUState {
     IcountDecr *icount_decr_ptr;
 
     /* Accessed in parallel; all accesses must be atomic */
-    struct TranslationBlock *tb_jmp_cache[TB_JMP_CACHE_SIZE];
+    TranslationBlock *tb_jmp_cache[TB_JMP_CACHE_SIZE];
 
     struct GDBRegisterState *gdb_regs;
     int gdb_num_regs;
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index ccc97d1894..ac3bb051f2 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -30,8 +30,7 @@ struct TCGCPUOps {
      * If more state needs to be restored, the target must implement a
      * function to restore all the state, and register it here.
      */
-    void (*synchronize_from_tb)(CPUState *cpu,
-                                const struct TranslationBlock *tb);
+    void (*synchronize_from_tb)(CPUState *cpu, const TranslationBlock *tb);
     /** @cpu_exec_enter: Callback for cpu_exec preparation */
     void (*cpu_exec_enter)(CPUState *cpu);
     /** @cpu_exec_exit: Callback for cpu_exec cleanup */
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index dc39b05c30..ee60eb3de4 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -120,6 +120,7 @@ typedef struct ReservedRegion ReservedRegion;
 typedef struct SavedIOTLB SavedIOTLB;
 typedef struct SHPCDevice SHPCDevice;
 typedef struct SSIBus SSIBus;
+typedef struct TranslationBlock TranslationBlock;
 typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
 typedef struct VMChangeStateEntry VMChangeStateEntry;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 448982dd2f..7d26ce0c9d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -172,8 +172,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
 
 #ifdef CONFIG_TCG
-void arm_cpu_synchronize_from_tb(CPUState *cs,
-                                 const struct TranslationBlock *tb);
+void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
 
diff --git a/target/cris/translate.c b/target/cris/translate.c
index c893f877ab..65c168c0c7 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -132,7 +132,7 @@ typedef struct DisasContext {
 
     int delayed_branch;
 
-    struct TranslationBlock *tb;
+    TranslationBlock *tb;
     int singlestep_enabled;
 } DisasContext;
 
diff --git a/target/lm32/translate.c b/target/lm32/translate.c
index 030b232d66..20c70d03f1 100644
--- a/target/lm32/translate.c
+++ b/target/lm32/translate.c
@@ -93,7 +93,7 @@ typedef struct DisasContext {
     unsigned int tb_flags, synced_flags; /* tb dependent flags.  */
     int is_jmp;
 
-    struct TranslationBlock *tb;
+    TranslationBlock *tb;
     int singlestep_enabled;
 
     uint32_t features;
diff --git a/target/moxie/translate.c b/target/moxie/translate.c
index d5fb27dfb8..24a742b25e 100644
--- a/target/moxie/translate.c
+++ b/target/moxie/translate.c
@@ -36,7 +36,7 @@
 
 /* This is the state at translation time.  */
 typedef struct DisasContext {
-    struct TranslationBlock *tb;
+    TranslationBlock *tb;
     target_ulong pc, saved_pc;
     uint32_t opcode;
     uint32_t fp_status;
diff --git a/target/unicore32/translate.c b/target/unicore32/translate.c
index 962f9877a0..370709c9ea 100644
--- a/target/unicore32/translate.c
+++ b/target/unicore32/translate.c
@@ -34,7 +34,7 @@ typedef struct DisasContext {
     int condjmp;
     /* The label that will be jumped to when the instruction is skipped.  */
     TCGLabel *condlabel;
-    struct TranslationBlock *tb;
+    TranslationBlock *tb;
     int singlestep_enabled;
 #ifndef CONFIG_USER_ONLY
     int user;
-- 
2.25.1


