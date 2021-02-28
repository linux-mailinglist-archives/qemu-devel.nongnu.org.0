Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E66A327538
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:28:27 +0100 (CET)
Received: from localhost ([::1]:38194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVUA-0002Hl-DK
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPV-0005N0-Ez
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:39 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPL-0007fI-Rg
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:37 -0500
Received: by mail-pj1-x102c.google.com with SMTP id e9so7196681pjs.2
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZE0p78tg8cxpd5a+CooQGkZB6FVAM4mBBizGWXSKr3w=;
 b=ofqfcp149fg+tXklZk1tvv3QW/MRO1c0i5ZYWuW0YVC1ybeE9AhgrUg6Ojv0cbav+2
 14JV9Gd8j5MOoE4v9KpxMlNf07L18PDJBpWkvK8Sq3efLDf6DaYXgYJU5MBuO94+GpDO
 A4s10xhYuMLDSQKdGA7UAu+aZuh7GcsiRshi8ftt+YQ9IOEpS6e7YSLDKt0Aq2OlDO/u
 ZxoLAwM1V3N8CYQ9nUhGT5t0nffZrK5DEtPpuXFzS4MfmIDH5ExG283H8tiDIzFt3Lru
 5TvgtXHA4tNWm+H0aDdys9c/6uZvKVWy23RVdGLV8AuvDnjsJcS3ObPHhco/Zkl1+yoL
 3IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZE0p78tg8cxpd5a+CooQGkZB6FVAM4mBBizGWXSKr3w=;
 b=TM0poSvyDWljEkOp2CcnaPVJdv/EIrgelobUXcalFJb+y+sb6zd08V8YJ2lYezEr0z
 y2ZtzUwaq8eDecJRKMR6eZt5aRA46fPzsaHXQxQZWcEgYEXnNJRaX7Sc4erelRJ7ulZ9
 yypCEUSJim+8DFJUVaImL8baSvP4U50PqEXCjSWVYaq07zpF9HfAH30IO+D3ca9y/Q0f
 CVSFeXY+PriSkXf64NAz5Wi1Muh4v/2EElnc6PuWguumuX8IJGZSKQNlFStQKqtMhYQt
 6l8JhNaf+IS93/l8X9DMNc/iYEOEAmoqL3mLcMAV78NVD/iOmZr4CtKoDjDk6fdJr8tU
 BwCw==
X-Gm-Message-State: AOAM533w6ax6QiLDKmq0qd/AjRb5k2dnfIohCW2pxeWeSSDica/zpmtB
 I5hTYrI7w8+WYsZp8kOcnuqaX2o+f0QOFQ==
X-Google-Smtp-Source: ABdhPJx5whSrabdrhNhhoxuObVC2W/XiM5rGSKPwTKDN7lohyvtFS6pRzZ2jIsl1zSM3H5E/Zs2RGw==
X-Received: by 2002:a17:90b:253:: with SMTP id
 fz19mr7557602pjb.160.1614554606591; 
 Sun, 28 Feb 2021 15:23:26 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/50] target/i386: Split out check_vm86_iopl
Date: Sun, 28 Feb 2021 15:22:35 -0800
Message-Id: <20210228232321.322053-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 59c1212625..75ee87fe84 100644
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
@@ -6573,8 +6583,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_IRET);
         if (!s->pe || s->vm86) {
             /* real mode or vm86 mode */
-            if (s->vm86 && s->iopl != 3) {
-                gen_exception_gpf(s);
+            if (!check_vm86_iopl(s)) {
                 break;
             }
             gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
@@ -6694,9 +6703,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6704,9 +6711,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -7066,9 +7071,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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


