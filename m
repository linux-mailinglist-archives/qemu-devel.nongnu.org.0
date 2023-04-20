Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C586E9DDB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 23:29:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbqB-0007F0-1q; Thu, 20 Apr 2023 17:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ppbq8-0007E7-SH
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:29:17 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ppbq6-0005Y1-H5
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P9PkkO3XsNjdeyVkHRW+EI3jWcWAWr17Qg2rftt0LLU=; b=T48EmDXKq81kFTNDR2WmnX2wVR
 f86leGogU83QVfGgnUbQLIWWZQKj8gY+veMYr6Z+q/2tkUZbLpEXao9qMHX/U949vRiGVb84MpMOe
 l36nbpYMlAwtMA/WJPIB7l73N4MVM8ejkuJe7Y9Onu1MtxuKeMya1bnM8IhPosr1qwtE=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com
Subject: [PATCH 5/8] accel/tcg: Replace target_ulong with vaddr in
 translator_*()
Date: Thu, 20 Apr 2023 23:28:47 +0200
Message-Id: <20230420212850.20400-6-anjo@rev.ng>
In-Reply-To: <20230420212850.20400-1-anjo@rev.ng>
References: <20230420212850.20400-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use vaddr for guest virtual address in translator_use_goto_tb() and
translator_loop().

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 accel/tcg/translator.c    | 10 +++++-----
 include/exec/translator.h |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 7bda43ff61..58737eff97 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -18,7 +18,7 @@
 #include "exec/plugin-gen.h"
 #include "exec/replay-core.h"
 
-bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
+bool translator_use_goto_tb(DisasContextBase *db, vaddr dest)
 {
     /* Suppress goto_tb if requested. */
     if (tb_cflags(db->tb) & CF_NO_GOTO_TB) {
@@ -30,8 +30,8 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
 }
 
 void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
-                     target_ulong pc, void *host_pc,
-                     const TranslatorOps *ops, DisasContextBase *db)
+                     vaddr pc, void *host_pc, const TranslatorOps *ops,
+                     DisasContextBase *db)
 {
     uint32_t cflags = tb_cflags(tb);
     bool plugin_enabled;
@@ -137,10 +137,10 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
 }
 
 static void *translator_access(CPUArchState *env, DisasContextBase *db,
-                               target_ulong pc, size_t len)
+                               vaddr pc, size_t len)
 {
     void *host;
-    target_ulong base, end;
+    vaddr base, end;
     TranslationBlock *tb;
 
     tb = db->tb;
diff --git a/include/exec/translator.h b/include/exec/translator.h
index 797fef7515..fa3c2ba529 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -147,8 +147,8 @@ typedef struct TranslatorOps {
  * - When too many instructions have been translated.
  */
 void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
-                     target_ulong pc, void *host_pc,
-                     const TranslatorOps *ops, DisasContextBase *db);
+                     vaddr pc, void *host_pc, const TranslatorOps *ops,
+                     DisasContextBase *db);
 
 /**
  * translator_use_goto_tb
@@ -158,7 +158,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
  * Return true if goto_tb is allowed between the current TB
  * and the destination PC.
  */
-bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest);
+bool translator_use_goto_tb(DisasContextBase *db, vaddr dest);
 
 /*
  * Translator Load Functions
-- 
2.39.1


