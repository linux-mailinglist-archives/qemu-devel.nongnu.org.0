Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1BB380CBB
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:18:53 +0200 (CEST)
Received: from localhost ([::1]:56150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZaW-0005l0-MD
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVf-0005AC-GE
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:51 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:46003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVd-0006tw-0i
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:51 -0400
Received: by mail-qt1-x836.google.com with SMTP id j11so22388562qtn.12
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cy6PLjMvnYjeMFXZ1nwqpvec9BRyqDaiLDpHPH5BvCE=;
 b=ZDF3J6/JFm/8yxZhVkCm3ZgEyI9bS1E9BbRsj17u4XtP5jSRXR7NZhfqwJpF7R2rMh
 XFpUThwUvZfreV6hHtFs1OuAAR5BXcex2PF0gFaxIVyfmUm3eLTCbL+ouXoA7NeK4zPm
 KJwBX6lOWFYBhk9rUNVLWbBvFVTz6fbzozLbMMNBNShPYSvnDfQEWOfzBrJXhB5hKbRw
 f9aTFOsd9dQ0JP2BKd2uYYWqGqYe4FVPf3I89fzlIkil4ejsjXACTDcd+11KaEdVY65v
 CMwr44Ib5TvmKjsLFtHDCbuFHCXD2807/KqI5sZbOHcm91BdQ0Vz3CpBAMAqLtr+cBkb
 gdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cy6PLjMvnYjeMFXZ1nwqpvec9BRyqDaiLDpHPH5BvCE=;
 b=nz7kDqYdNvH/rjr5IWG4/CweHPN8+YHnKb56+HJCRwwaRUhMUxBzcU0HfvC/67Z9wq
 g8NBvd4bL6hgCTbYFL6/ZEjaK03rkrCl6dYk6CIZBb2bSW60S0K4+vYD9fM6zwCQUgOJ
 OUsT/v62UYxrDwr4V5FZ4ujy6LcS2FWxdrlKkHx0Us0yy20IzD4ktJgCd6kwSpCSx8aQ
 uuaVR7L9yi9B8AupasutVwwiXe7s/T7WTokqUOkH+Z11++R5ns+tjrnjk4l4tpX/HYUT
 DU5/V8sLgAjZ0IuO1Fwiaazs5QPsNctRqz+Fm7/2jQ0fAxSVfg87n8eYda1EAiEKg/3l
 4Mhg==
X-Gm-Message-State: AOAM533MMGQp1VU6PAJpjEXp4AkEmErxZToVXo4lfl3nB/bjc7VmUgdf
 /dDAFdsPfEFfsoYJVrT+kRd+JxoaIHOq4lN5HTo=
X-Google-Smtp-Source: ABdhPJythT/UnsexBtAL4dd9EYvYUKG54Nbw2nFUKtCIEkDVJRipVzHjeD41te65z4/cPngPjAKGdw==
X-Received: by 2002:ac8:130a:: with SMTP id e10mr29244477qtj.5.1621005228091; 
 Fri, 14 May 2021 08:13:48 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:13:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/50] target/i386: Split out check_vm86_iopl
Date: Fri, 14 May 2021 10:12:56 -0500
Message-Id: <20210514151342.384376-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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


