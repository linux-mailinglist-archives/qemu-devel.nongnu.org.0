Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED03669EDEE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 05:33:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUgne-0001OY-JU; Tue, 21 Feb 2023 23:32:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pUgnb-0001Nz-TB
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 23:32:12 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pUgnZ-0004Vj-HU
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 23:32:11 -0500
Received: by mail-oi1-x22c.google.com with SMTP id y8so6746710oiy.6
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 20:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8XHAw8+hd/fO/nzfmHG5Eaz1DiGEmPSSMFZV0sqLNW0=;
 b=NZoUjMNImzBbnUDWq2zxctSkqbcyQrUN+e6JSeNAkY/Nut40+1cbE1y03+S3RBhCHj
 1BbpS3x4InU+R4x2jXleYiuo1AeFHEg98bXR8KNz74zjQvurnuAICbBp+kqkJcGZVOUj
 PfB7Oh4YEOxnrPntt8nyQgT8ysPYKf1VWIJ6BihDhBaOp8RBYHahX86MaAui1MsIq/2g
 8U2bTt5nUSx83tqYfd6lSMehazSoJACqFbd7HRxRQ3CHQnrscUTUXXLb0OcdSFM2fp34
 sSCKuIiRo9czIvE1GKcG0p3hk4HJTF997h26WrOf3pt61o0I/WgQ6ImrrjOXdMqBohhf
 x6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8XHAw8+hd/fO/nzfmHG5Eaz1DiGEmPSSMFZV0sqLNW0=;
 b=CSqa6ydgL0HGetmZLnBbm7oF1tfKE07BF0gWDolijTgr82ISMt+7vy9a6mbzrvFCfI
 UTd8izhKafSG0f5Ch/Kv9oWekVSHqYSEerpbBMAlNgs899ukXuuJ/W8eYGRAprD7/n2N
 RXfEAIubxK5MDjSzb+o+78sP5BIkc55gIn36ERave85pMRO1SKCqryJGX48eTXo8DQAk
 c8nBsLSfybCdTaTa9hCUxBgFAmPldrBr6AfGQzHMEtgcgLvbr3OViYS+meAWbEtuV7Bm
 CIv2dfJu/U74bSwCFjXJ0I+9WOjWyvJXeN4nZdopwkJswvUTmXrEBRrFJ20aJXOs6Yyw
 sMzg==
X-Gm-Message-State: AO0yUKUT+z7L5af0WgXnXp25tsJdX2GbLyeRkDSWlKqUkZCkRk3VcadA
 hqgor4/TIYUcXiKDJ2VogSiNwotDgh+DQsNd
X-Google-Smtp-Source: AK7set+yS+/2/UMmWQpWceV2ui8kaR5Ma4NZ61xvsNKwegc1MfHA8TGIMfVnRMs59uMXDGF/4ItDEQ==
X-Received: by 2002:a05:6808:3a98:b0:36a:8422:d962 with SMTP id
 fb24-20020a0568083a9800b0036a8422d962mr2602623oib.2.1677040326967; 
 Tue, 21 Feb 2023 20:32:06 -0800 (PST)
Received: from localhost ([37.19.221.166]) by smtp.gmail.com with ESMTPSA id
 bm38-20020a0568081aa600b0037d8148cf04sm1089301oib.46.2023.02.21.20.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 20:32:06 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 "Eli G. Boling" <eboling@draper.com>, Emilio Cota <cota@braap.org>
Subject: [PATCH] plugin: fix clearing of plugin_mem_cbs before TB exit
Date: Tue, 21 Feb 2023 23:32:04 -0500
Message-Id: <20230222043204.941336-1-cota@braap.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::22c;
 envelope-from=cota@braap.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently we are wrongly accessing plugin_tb->mem_helper at
translation time from plugin_gen_disable_mem_helpers, which is
called before generating a TB exit, e.g. with exit_tb.

Recall that it is only during TB finalisation, i.e. when we go over
the TB post-translation to inject or remove plugin instrumentation,
when plugin_tb->mem_helper is set. This means that we never clear
plugin_mem_cbs when calling plugin_gen_disable_mem_helpers since
mem_helper is always false. Therefore a guest instruction that uses
helpers and emits an explicit TB exit results in plugin_mem_cbs being
set upon exiting, which is caught by an assertion as reported in
the reopening of issue #1381 and replicated below.

Fix this by (1) adding an insertion point before exiting a TB
("before_exit"), and (2) deciding whether or not to emit the
clearing of plugin_mem_cbs at this newly-added insertion point
during TB finalisation.

While at it, suffix plugin_gen_disable_mem_helpers with _before_exit
to make its intent more clear.

- Before:
$ ./qemu-system-riscv32 -M spike -nographic -plugin contrib/plugins/libexeclog.so -d plugin,in_asm,op
IN:
Priv: 3; Virt: 0
0x00001000:  00000297          auipc                   t0,0                    # 0x1000
0x00001004:  02828613          addi                    a2,t0,40
0x00001008:  f1402573          csrrs                   a0,mhartid,zero

OP:
 ld_i32 tmp1,env,$0xfffffffffffffff0
 brcond_i32 tmp1,$0x0,lt,$L0

 ---- 00001000 00000000
 mov_i64 tmp2,$0x7ff9940152e0
 ld_i32 tmp1,env,$0xffffffffffffef80
 call plugin(0x7ff9edbcb6f0),$0x11,$0,tmp1,tmp2
 mov_i32 x5/t0,$0x1000

 ---- 00001004 00000000
 mov_i64 tmp2,$0x7ff9940153e0
 ld_i32 tmp1,env,$0xffffffffffffef80
 call plugin(0x7ff9edbcb6f0),$0x11,$0,tmp1,tmp2
 add_i32 x12/a2,x5/t0,$0x28

 ---- 00001008 f1402573
 mov_i64 tmp2,$0x7ff9940136c0
 st_i64 tmp2,env,$0xffffffffffffef68
 mov_i64 tmp2,$0x7ff994015530
 ld_i32 tmp1,env,$0xffffffffffffef80
 call plugin(0x7ff9edbcb6f0),$0x11,$0,tmp1,tmp2 <-- sets plugin_mem_cbs
 call csrr,$0x0,$1,x10/a0,env,$0xf14  <-- helper that might access memory
 mov_i32 pc,$0x100c
 exit_tb $0x0  <-- exit_tb right after the helper; missing clearing of plugin_mem_cbs
 mov_i64 tmp2,$0x0
 st_i64 tmp2,env,$0xffffffffffffef68 <-- after_insn clearing: dead due to exit_tb above
 set_label $L0
 exit_tb $0x7ff9a4000043 <-- again, missing clearing (doesn't matter due to $L0 label)

0, 0x1000, 0x297, "00000297          auipc                   t0,0                    # 0x1000"
0, 0x1004, 0x2828613, "02828613          addi                    a2,t0,40"
**
ERROR:../accel/tcg/cpu-exec.c:983:cpu_exec_loop: assertion failed: (cpu->plugin_mem_cbs == ((void *)0))
Bail out! ERROR:../accel/tcg/cpu-exec.c:983:cpu_exec_loop: assertion failed: (cpu->plugin_mem_cbs == ((void *)0))
Aborted (core dumped)

- After:
$ ./qemu-system-riscv32 -M spike -nographic -plugin contrib/plugins/libexeclog.so -d plugin,in_asm,op
(snip)
 call plugin(0x7f19bc9e36f0),$0x11,$0,tmp1,tmp2 <-- sets plugin_mem_cbs
 call csrr,$0x0,$1,x10/a0,env,$0xf14
 mov_i32 pc,$0x100c
 mov_i64 tmp2,$0x0
 st_i64 tmp2,env,$0xffffffffffffef68 <-- before_exit clearing of plugin_mem_cbs
 exit_tb $0x0
 mov_i64 tmp2,$0x0
 st_i64 tmp2,env,$0xffffffffffffef68 <-- after_insn clearing (dead)
 set_label $L0
 mov_i64 tmp2,$0x0
 st_i64 tmp2,env,$0xffffffffffffef68 <-- before_exit clearing (doesn't matter due to $L0)
 exit_tb $0x7f38c8000043
[...]

Fixes: #1381
Signed-off-by: Emilio Cota <cota@braap.org>
---
 accel/tcg/plugin-gen.c    | 44 ++++++++++++++++++++-------------------
 include/exec/plugin-gen.h |  4 ++--
 include/qemu/plugin.h     |  3 ---
 tcg/tcg-op.c              |  6 +++---
 4 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 17a686bd9e..b4fc171b8e 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -67,6 +67,7 @@ enum plugin_gen_from {
     PLUGIN_GEN_FROM_INSN,
     PLUGIN_GEN_FROM_MEM,
     PLUGIN_GEN_AFTER_INSN,
+    PLUGIN_GEN_BEFORE_EXIT,
     PLUGIN_GEN_N_FROMS,
 };
 
@@ -177,6 +178,7 @@ static void plugin_gen_empty_callback(enum plugin_gen_from from)
 {
     switch (from) {
     case PLUGIN_GEN_AFTER_INSN:
+    case PLUGIN_GEN_BEFORE_EXIT:
         gen_wrapped(from, PLUGIN_GEN_DISABLE_MEM_HELPER,
                     gen_empty_mem_helper);
         break;
@@ -575,7 +577,7 @@ static void inject_mem_helper(TCGOp *begin_op, GArray *arr)
  * that we can read them at run-time (i.e. when the helper executes).
  * This run-time access is performed from qemu_plugin_vcpu_mem_cb.
  *
- * Note that plugin_gen_disable_mem_helpers undoes (2). Since it
+ * Note that inject_mem_disable_helper undoes (2). Since it
  * is possible that the code we generate after the instruction is
  * dead, we also add checks before generating tb_exit etc.
  */
@@ -600,7 +602,6 @@ static void inject_mem_enable_helper(struct qemu_plugin_tb *ptb,
         rm_ops(begin_op);
         return;
     }
-    ptb->mem_helper = true;
 
     arr = g_array_sized_new(false, false,
                             sizeof(struct qemu_plugin_dyn_cb), n_cbs);
@@ -623,27 +624,25 @@ static void inject_mem_disable_helper(struct qemu_plugin_insn *plugin_insn,
     inject_mem_helper(begin_op, NULL);
 }
 
-/* called before finishing a TB with exit_tb, goto_tb or goto_ptr */
-void plugin_gen_disable_mem_helpers(void)
+/*
+ * Called before finishing a TB with exit_tb, goto_tb or goto_ptr.
+ *
+ * Most helpers that access memory are wrapped by before/after_insn
+ * instrumentation, which enables/disables mem callbacks. Some of these
+ * helpers, however, finish a TB early (e.g. call exit_tb), which means
+ * the after_insn instrumentation never gets called.
+ *
+ * To ensure that mem callbacks are disabled, here we add an
+ * instrumentation point ("before_exit") so that when finalising the
+ * translation we can disable mem callbacks before exiting, if needed.
+ */
+void plugin_gen_disable_mem_helpers_before_exit(void)
 {
-    TCGv_ptr ptr;
-
-    /*
-     * We could emit the clearing unconditionally and be done. However, this can
-     * be wasteful if for instance plugins don't track memory accesses, or if
-     * most TBs don't use helpers. Instead, emit the clearing iff the TB calls
-     * helpers that might access guest memory.
-     *
-     * Note: we do not reset plugin_tb->mem_helper here; a TB might have several
-     * exit points, and we want to emit the clearing from all of them.
-     */
-    if (!tcg_ctx->plugin_tb->mem_helper) {
+    /* If no plugins are enabled, do not generate anything */
+    if (tcg_ctx->plugin_insn == NULL) {
         return;
     }
-    ptr = tcg_const_ptr(NULL);
-    tcg_gen_st_ptr(ptr, cpu_env, offsetof(CPUState, plugin_mem_cbs) -
-                                 offsetof(ArchCPU, env));
-    tcg_temp_free_ptr(ptr);
+    plugin_gen_empty_callback(PLUGIN_GEN_BEFORE_EXIT);
 }
 
 static void plugin_gen_tb_udata(const struct qemu_plugin_tb *ptb,
@@ -730,6 +729,9 @@ static void pr_ops(void)
             case PLUGIN_GEN_AFTER_INSN:
                 name = "after insn";
                 break;
+            case PLUGIN_GEN_BEFORE_EXIT:
+                name = "before exit";
+                break;
             default:
                 break;
             }
@@ -830,6 +832,7 @@ static void plugin_gen_inject(struct qemu_plugin_tb *plugin_tb)
                 break;
             }
             case PLUGIN_GEN_AFTER_INSN:
+            case PLUGIN_GEN_BEFORE_EXIT:
             {
                 g_assert(insn_idx >= 0);
 
@@ -879,7 +882,6 @@ bool plugin_gen_tb_start(CPUState *cpu, const DisasContextBase *db,
         ptb->haddr1 = db->host_addr[0];
         ptb->haddr2 = NULL;
         ptb->mem_only = mem_only;
-        ptb->mem_helper = false;
 
         plugin_gen_empty_callback(PLUGIN_GEN_FROM_TB);
     }
diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
index 5f5506f1cc..f9f10c5fac 100644
--- a/include/exec/plugin-gen.h
+++ b/include/exec/plugin-gen.h
@@ -26,7 +26,7 @@ void plugin_gen_tb_end(CPUState *cpu);
 void plugin_gen_insn_start(CPUState *cpu, const struct DisasContextBase *db);
 void plugin_gen_insn_end(void);
 
-void plugin_gen_disable_mem_helpers(void);
+void plugin_gen_disable_mem_helpers_before_exit(void);
 void plugin_gen_empty_mem_callback(TCGv addr, uint32_t info);
 
 static inline void plugin_insn_append(abi_ptr pc, const void *from, size_t size)
@@ -66,7 +66,7 @@ static inline void plugin_gen_insn_end(void)
 static inline void plugin_gen_tb_end(CPUState *cpu)
 { }
 
-static inline void plugin_gen_disable_mem_helpers(void)
+static inline void plugin_gen_disable_mem_helpers_before_exit(void)
 { }
 
 static inline void plugin_gen_empty_mem_callback(TCGv addr, uint32_t info)
diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index fb338ba576..f6d10aae50 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -164,9 +164,6 @@ struct qemu_plugin_tb {
     void *haddr2;
     bool mem_only;
 
-    /* if set, the TB calls helpers that might access guest memory */
-    bool mem_helper;
-
     GArray *cbs[PLUGIN_N_CB_SUBTYPES];
 };
 
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index c581ae77c4..f7c0d90862 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2797,7 +2797,7 @@ void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx)
         tcg_debug_assert(idx == TB_EXIT_REQUESTED);
     }
 
-    plugin_gen_disable_mem_helpers();
+    plugin_gen_disable_mem_helpers_before_exit();
     tcg_gen_op1i(INDEX_op_exit_tb, val);
 }
 
@@ -2812,7 +2812,7 @@ void tcg_gen_goto_tb(unsigned idx)
     tcg_debug_assert((tcg_ctx->goto_tb_issue_mask & (1 << idx)) == 0);
     tcg_ctx->goto_tb_issue_mask |= 1 << idx;
 #endif
-    plugin_gen_disable_mem_helpers();
+    plugin_gen_disable_mem_helpers_before_exit();
     tcg_gen_op1i(INDEX_op_goto_tb, idx);
 }
 
@@ -2825,7 +2825,7 @@ void tcg_gen_lookup_and_goto_ptr(void)
         return;
     }
 
-    plugin_gen_disable_mem_helpers();
+    plugin_gen_disable_mem_helpers_before_exit();
     ptr = tcg_temp_new_ptr();
     gen_helper_lookup_tb_ptr(ptr, cpu_env);
     tcg_gen_op1i(INDEX_op_goto_ptr, tcgv_ptr_arg(ptr));
-- 
2.34.1


