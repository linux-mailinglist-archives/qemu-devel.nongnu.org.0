Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299F940DEA5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:51:00 +0200 (CEST)
Received: from localhost ([::1]:57434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtf9-0003VG-4p
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLZ-0001Q0-HY
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:46 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLT-0002Vo-H3
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:41 -0400
Received: by mail-pj1-x1029.google.com with SMTP id i19so4804122pjv.4
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lXET+xYBNc1lxlyCwf5bn3A4DBRHEif1uqzxMzBFnFs=;
 b=Q2M6igR1R6mGzSQo3coGw/qT5opTTCVsIUKm4TiseTLdufLRFPF0kLK9+F3aNcMXPc
 z8igq8Tz9bKMkXEdeFiotExifd9oywfb/q9v4fwsN1+6sCbcsTSBsmEEOsdz0Ul0R7Kl
 TAUftkB2eW9hpQXOSMqmJb5eSFL9uZfEwfkQGsFmvNk2fozZFpLDFb+WyHGoj+Q2sGXQ
 Y5uTlieXEUCT6tkhWbJbmjSiwgH8CDDpdaQO80pggpIMz2cpy785VmL5urusZ9s7HNXh
 aZrPtiwjG7iJzsa3weSGFlq5SnNmwP5QmYeccbMDkL1ThcdC8RnmB2d7Wyugbsd23YqG
 kDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lXET+xYBNc1lxlyCwf5bn3A4DBRHEif1uqzxMzBFnFs=;
 b=NHWVqd5JTUlC1dik0xuJx6OUgLXkfOUEPltqFQ9U04WKvq+57V3whb8MGpFq8Hsbny
 T7XkdzSFsbdTycSft9uLqoCbBi29FKWs9Dn056zy3jJNbvIg5ezck2g86DBa3orsAHly
 XFpoAyx/f46lpizURW1KndAln931RpwUdaF6/ttOKftGDCbxqaj4atg/E8sgHlv1VJ8Z
 tT2Fs4YDGXuaF+4yJ9sVp0Rt/MCQy9zNq9odiSyowTdVm1R7Eseb0TNU84KIjkYOzZ0g
 EJz5HoIRBEFBW05Pa3NHr3Uq/wEDcJ5GLXWk9lcILVOklXHPPC/h6SAoEjsdDq1NrET+
 mgmw==
X-Gm-Message-State: AOAM5331bNZSf9k1kXp0j6Dbrul6+GHdqlUfuIlBOyby7x5u/QIBeg+z
 HQ4l/ErBdu1qqIFPVMF+1Q0Ytssi4ivYtw==
X-Google-Smtp-Source: ABdhPJz7XBJVsjpdaIpU3JlCx79fValD4Q6fOtp6eUL1uEgSQkBu3Bz3ESQKmHja8LDRND0z1fQRqQ==
X-Received: by 2002:a17:90b:168a:: with SMTP id
 kv10mr15320695pjb.35.1631806236568; 
 Thu, 16 Sep 2021 08:30:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/35] target/i386: Restrict has_work() handler to sysemu and
 TCG
Date: Thu, 16 Sep 2021 08:30:05 -0700
Message-Id: <20210916153025.1944763-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-15-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu.c         | 6 ------
 target/i386/tcg/tcg-cpu.c | 8 +++++++-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6b029f1bdf..36a1c5f3fd 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6554,11 +6554,6 @@ int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
     return 0;
 }
 
-static bool x86_cpu_has_work(CPUState *cs)
-{
-    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
-}
-
 static void x86_disas_set_info(CPUState *cs, disassemble_info *info)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -6763,7 +6758,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = x86_cpu_class_by_name;
     cc->parse_features = x86_cpu_parse_featurestr;
-    cc->has_work = x86_cpu_has_work;
     cc->dump_state = x86_cpu_dump_state;
     cc->set_pc = x86_cpu_set_pc;
     cc->gdb_read_register = x86_cpu_gdb_read_register;
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 3ecfae34cb..aef050d089 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -55,6 +55,11 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
+static bool x86_cpu_has_work(CPUState *cs)
+{
+    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
+}
+
 static bool x86_debug_check_breakpoint(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -63,7 +68,7 @@ static bool x86_debug_check_breakpoint(CPUState *cs)
     /* RF disables all architectural breakpoints. */
     return !(env->eflags & RF_MASK);
 }
-#endif
+#endif /* CONFIG_USER_ONLY */
 
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -76,6 +81,7 @@ static const struct TCGCPUOps x86_tcg_ops = {
 #ifdef CONFIG_USER_ONLY
     .fake_user_interrupt = x86_cpu_do_interrupt,
 #else
+    .has_work = x86_cpu_has_work,
     .do_interrupt = x86_cpu_do_interrupt,
     .cpu_exec_interrupt = x86_cpu_exec_interrupt,
     .debug_excp_handler = breakpoint_handler,
-- 
2.25.1


