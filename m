Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECA6466B30
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 21:51:12 +0100 (CET)
Received: from localhost ([::1]:38188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mst2t-0002wC-Vg
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 15:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0w-00007b-O8
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:10 -0500
Received: from [2607:f8b0:4864:20::102a] (port=38806
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0u-0005Tz-PB
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:10 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so3443691pju.3
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 12:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Amn9xDCiJU2kDXsG3dRihkKCfyaF3Hk0fncLLUISY74=;
 b=jtnMCVoqYX3EE4a+EXd1jw9kz7YLgTnQFPbNDL+wWHP9sEFSe/fyUven0eRcj2gjP7
 QkNlq/kfuH37X+Jm996m9SH7dKjPXWf8JECO+M/GCy1+NIk2ndV0FViCC+q+G0yuc+Ag
 5ePJieqpj7nPh8z7vGIE9RVyDSbq1THSlmoWNBfTdZHG+TXVdhOSyUWGBhIXXyaOX9w9
 Fb0PlZEzkf10MZ+4PvQRX46dVjk5lm1n33vHK2d/oVUlNv6vZ4zE26aqfaORWEjMdPIT
 75BMmFo/Y+zvkQK59m26WlHo2+hkbLBVSRyfA1lEvOdg1sknzpTpMtwogVoGU8/OCW7B
 fuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Amn9xDCiJU2kDXsG3dRihkKCfyaF3Hk0fncLLUISY74=;
 b=vKH3zpX69yFB8tNHVcv0jaGMCBfU8LUSFxNwAS0BWfvQ66Mcql9h3cqO4m3bjciHfm
 PopRRA5b29seSbigklpu5qvnjr3B4PSWOvRZNKn4mReC9n3hu+dtPLEoDHus2JQsq1xT
 oRynIq8zzhHC/qjfQ39etK3KvBlpGl36v/qPvnFbFEeMwAicvGZfNNONZ+JKI90AgTjh
 fVl1hLuOwGZoFUi5n6iTjCDWw5bbCGbp6KIU6DZSfNt4gxstjfWwqefKxmstnT9TB++1
 CEZ6UBThFKrniWF+K6yav2KaLPjjCuePnxQdbp4Kf/AQ6OyAW7aokLvjHchS0Uhj3XBY
 RMow==
X-Gm-Message-State: AOAM532k71/SKRQCFqjfGX7Me51NeOO/SHK/ij29s5qWnO8iAj5Ia4Ij
 MFK7Jz8Mpi819lbNFOSDjwjtXoUTsLKVcQ==
X-Google-Smtp-Source: ABdhPJxXKQH+79e0uhiCs2RYHIPkS0SJI/Z49aDsWAiarYSWhfUw4OoqbaUx0kW77WZbJlh92GEchQ==
X-Received: by 2002:a17:90b:218:: with SMTP id
 fy24mr8625463pjb.187.1638478147589; 
 Thu, 02 Dec 2021 12:49:07 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pi17sm3721391pjb.34.2021.12.02.12.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 12:49:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/15] target/m68k: Fix address argument for EXCP_TRACE
Date: Thu,  2 Dec 2021 12:48:53 -0800
Message-Id: <20211202204900.50973-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202204900.50973-1-richard.henderson@linaro.org>
References: <20211202204900.50973-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the M68040 Users Manual, section 8.4.3,
Six word stack frame (format 2), Trace (and others) is
supposed to record the next insn in PC and the address
of the trapping instruction in ADDRESS.

Create gen_raise_exception_format2 to record the trapping
pc in env->mmu.ar.  Update m68k_interrupt_all to pass the
value to do_stack_frame.  Update cpu_loop to handle EXCP_TRACE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c |  3 +++
 target/m68k/op_helper.c    |  2 +-
 target/m68k/translate.c    | 27 ++++++++++++++++++---------
 3 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 267df05372..8e2b79550d 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -54,6 +54,9 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_DIV0:
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->mmu.ar);
             break;
+        case EXCP_TRACE:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_TRACE, env->mmu.ar);
+            break;
         case EXCP_TRAP0:
             {
                 abi_long ret;
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index a6e4f5719f..c9ea28bf68 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -396,13 +396,13 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
 
     case EXCP_ILLEGAL:
     case EXCP_TRAPCC:
-    case EXCP_TRACE:
         /* FIXME: addr is not only env->pc */
         do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
         break;
 
     case EXCP_CHK:
     case EXCP_DIV0:
+    case EXCP_TRACE:
         do_stack_frame(env, &sp, 2, oldsr, env->mmu.ar, env->pc);
         break;
 
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index ae9f5a5222..fc2b6a3085 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -298,6 +298,20 @@ static void gen_raise_exception(int nr)
     tcg_temp_free_i32(tmp);
 }
 
+static void gen_raise_exception_format2(DisasContext *s, int nr)
+{
+    /*
+     * Pass the address of the insn to the exception handler,
+     * for recording in the Format $2 (6-word) stack frame.
+     * Re-use mmu.ar for the purpose, since that's only valid
+     * after tlb_fill.
+     */
+    tcg_gen_st_i32(tcg_constant_i32(s->base.pc_next), cpu_env,
+                   offsetof(CPUM68KState, mmu.ar));
+    gen_raise_exception(nr);
+    s->base.is_jmp = DISAS_NORETURN;
+}
+
 static void gen_exception(DisasContext *s, uint32_t dest, int nr)
 {
     update_cc_op(s);
@@ -1499,7 +1513,7 @@ static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
     if (unlikely(s->ss_active)) {
         update_cc_op(s);
         tcg_gen_movi_i32(QREG_PC, dest);
-        gen_raise_exception(EXCP_TRACE);
+        gen_raise_exception_format2(s, EXCP_TRACE);
     } else if (translator_use_goto_tb(&s->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(QREG_PC, dest);
@@ -6225,17 +6239,12 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         break;
     case DISAS_TOO_MANY:
         update_cc_op(dc);
-        if (dc->ss_active) {
-            tcg_gen_movi_i32(QREG_PC, dc->pc);
-            gen_raise_exception(EXCP_TRACE);
-        } else {
-            gen_jmp_tb(dc, 0, dc->pc);
-        }
+        gen_jmp_tb(dc, 0, dc->pc);
         break;
     case DISAS_JUMP:
         /* We updated CC_OP and PC in gen_jmp/gen_jmp_im.  */
         if (dc->ss_active) {
-            gen_raise_exception(EXCP_TRACE);
+            gen_raise_exception_format2(dc, EXCP_TRACE);
         } else {
             tcg_gen_lookup_and_goto_ptr();
         }
@@ -6246,7 +6255,7 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
          * other state that may require returning to the main loop.
          */
         if (dc->ss_active) {
-            gen_raise_exception(EXCP_TRACE);
+            gen_raise_exception_format2(dc, EXCP_TRACE);
         } else {
             tcg_gen_exit_tb(NULL, 0);
         }
-- 
2.25.1


