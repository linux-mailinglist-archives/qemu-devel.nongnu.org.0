Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5620389570
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:33:23 +0200 (CEST)
Received: from localhost ([::1]:37254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljR0U-0006MJ-Q8
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyE-0003OQ-8y
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:02 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:34684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQy9-0005Wm-Tm
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:02 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso12655795ote.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0LXm7FUdAyY78wIi1+bFyfLTZfZQ4+PVm0Qu4rWwa4U=;
 b=xdAI+HU1BdrDvizhT7524k7QQvH31zYzQvBpsDJN5d50sp0sl6WxJctB1ZPYemEzSm
 ra/rLm1YlXg5lRM2sgNsTthGwyIsmqGrnoypDPWysTSvP1Cmk56fLZI5dVo3MoDlWVGP
 143wu+oL8K1mSUwgrg4QGNgAwgZvsvQ1qxLMHblXJleVU88YDXAUz6d7EZsfSI3tGJUe
 F1wKkoYpsswkkhwk7J3SibNU41EenzL1Bds0pU7eBikpmtIOpmOqz5JTE+PVR0CLhWdw
 GocAWsCixkLVQCP9aGwsFe+ZP7eDdnPQSuwGj/RfloPv4SDmwxXUJUb5l6vAw8rcGOmQ
 SRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0LXm7FUdAyY78wIi1+bFyfLTZfZQ4+PVm0Qu4rWwa4U=;
 b=ZXN6GXOz7wqbEZIedTFtABhKJu21eD1t66YBtp4XjeNMoYWH02dATy+aMACgHtEM9b
 ZhXvo3nw8dKBncBH5aEEAaAlOV6fnMo+cn8FuJHWMOmKtbPgNg+xxslZTz9icmhgiPkb
 /OwDt7LEBC5pUzORJK6JYkz+9n1vWsnKU/rzmYioP0DZ2N983Qta+VFeLt4PHrjCbvio
 LTu/Ac3uEcf3rW9voTAIKD8OitKlkqMPsxthDOEyecFfmjD18UB/5tRZ4bCqV9MdN0dS
 HJ2/XWOV6eddwYpkX667FEELkwp1rbUG/eWGs8sNkPmJnOBqy5pc2Acj5fN8WiHctPbU
 sODw==
X-Gm-Message-State: AOAM5332Jh3hlPpDd2elkSTj2wMCHOcQ4RD+cKInzf2QeXXJtDHrJW3e
 bYXR8L0Me1cg/FJDl45ZLeqNjgmr60B+qiBq
X-Google-Smtp-Source: ABdhPJyJS7K2DVJDtC5FTs2D9oGO8N/BQQXjC4rMMnWOLio+0dy8wFTltoEiFGxjeFDrpcDiyh1QxA==
X-Received: by 2002:a9d:be2:: with SMTP id 89mr630942oth.269.1621449056818;
 Wed, 19 May 2021 11:30:56 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:30:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/50] target/i386: Split out check_vm86_iopl
Date: Wed, 19 May 2021 13:30:04 -0500
Message-Id: <20210519183050.875453-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-5-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 0a15662949..74f6024f82 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -1292,6 +1292,16 @@ static bool check_cpl0(DisasContext *s)
     return false;
 }
 
+/* If vm86, check for iopl == 3; if not, raise #GP and return false. */
+static bool check_vm86_iopl(DisasContext *s)
+{
+    if (!s->vm86 || s->iopl == 3) {
+        return true;
+    }
+    gen_exception_gpf(s);
+    return false;
+}
+
 /* if d == OR_TMP0, it means memory operand (address in A0) */
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d)
 {
@@ -6579,8 +6589,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_IRET);
         if (!s->pe || s->vm86) {
             /* real mode or vm86 mode */
-            if (s->vm86 && s->iopl != 3) {
-                gen_exception_gpf(s);
+            if (!check_vm86_iopl(s)) {
                 break;
             }
             gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
@@ -6700,9 +6709,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         /* flags */
     case 0x9c: /* pushf */
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_PUSHF);
-        if (s->vm86 && s->iopl != 3) {
-            gen_exception_gpf(s);
-        } else {
+        if (check_vm86_iopl(s)) {
             gen_update_cc_op(s);
             gen_helper_read_eflags(s->T0, cpu_env);
             gen_push_v(s, s->T0);
@@ -6710,9 +6717,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x9d: /* popf */
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_POPF);
-        if (s->vm86 && s->iopl != 3) {
-            gen_exception_gpf(s);
-        } else {
+        if (check_vm86_iopl(s)) {
             ot = gen_pop_T0(s);
             if (s->cpl == 0) {
                 if (dflag != MO_16) {
@@ -7072,9 +7077,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0xcd: /* int N */
         val = x86_ldub_code(env, s);
-        if (s->vm86 && s->iopl != 3) {
-            gen_exception_gpf(s);
-        } else {
+        if (check_vm86_iopl(s)) {
             gen_interrupt(s, val, pc_start - s->cs_base, s->pc - s->cs_base);
         }
         break;
-- 
2.25.1


