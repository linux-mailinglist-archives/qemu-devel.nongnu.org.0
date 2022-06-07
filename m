Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E8F53F420
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 04:53:31 +0200 (CEST)
Received: from localhost ([::1]:38222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPLW-0008Ra-Ft
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 22:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFz-0006lB-1H
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:47 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:42680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFv-0000Jc-KY
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:46 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so14214085pjs.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t3QqzZZIr7UgbN3ZekMQ8h5fse6DD+fMoam6hjgppWE=;
 b=CTmXMfS6FCWvfvnO5WPje6Oj9LPCpEKr1KhT25MLPj2UIBdFYDMmGH3xJ7DhED3peo
 /4LTy71tWBI7RWdTN5cQJ0+AVgposcFWpaPBDnQF1NaolNjx/gXvOkHrlKuDQuZxkPtT
 RQ0JPZPdZal7q3p5jZ8QduKRN6K/tsLd5LO52tUsfvZaZDd4QX9W7g7kAYXKa/W57QfI
 hqoyznEaXeA8JKEkRMyRKUm9nKXckupDbNlKXVjdkDNSTLwpsnvXmCSYT+r5lFYEneOx
 URlbNxeSoBZzlLd0kYlCkdktv3gkWSMyAo9VDk1/bPVYfr79H3d/jV3koQY8f4oLred+
 e6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t3QqzZZIr7UgbN3ZekMQ8h5fse6DD+fMoam6hjgppWE=;
 b=nN/F8d8zskAjiEn26miF2pxWTUTteQ7QjCYcBg8uIqrRCZxrAyMJo2aFALWcrBW58r
 uxaJpDVbdvvMY8giphMYywTm87PSGDesjd89L6nUDI7VUTMPTynVOKZvZthaZghm+O8e
 T5JfkPFL0VwDvFF+ZlZaTJC5bsC3B9rGd35ywReBSr5R7gKoPi9iSTZNeSYTU34gjUZU
 T1JnncSUYJCsc+bndbCkrT+z6peqtTqOaQtZdNV96RtdUJMSOzzquGGguUz5PlGF4/YX
 5cmkFDKt9bX6mjiRrRmVfiFGvAVfcuy6vvckv+vwryyak8LE2jgTE+7p6pBKz2POrYxu
 jEpQ==
X-Gm-Message-State: AOAM530wCWIzN0KOpK5h1IH5fQ6cDYyIcl389Byg/WrTykeKKiY/DxYg
 HGhxB0P7uWLfsjN53GmipyoaKI4oMPIxEQ==
X-Google-Smtp-Source: ABdhPJwwkeQvoE6xBsXy4mpGeT2It/cIkT/jmZDOrmNr5KXuHz/cKuYVSUF+IlLPuAwUjKEWSeYG8w==
X-Received: by 2002:a17:90b:380b:b0:1e6:67f6:f70c with SMTP id
 mq11-20020a17090b380b00b001e667f6f70cmr32040077pjb.120.1654570062385; 
 Mon, 06 Jun 2022 19:47:42 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 08/25] target/arm: Move exception_bkpt_insn to
 debug_helper.c
Date: Mon,  6 Jun 2022 19:47:17 -0700
Message-Id: <20220607024734.541321-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 31 +++++++++++++++++++++++++++++++
 target/arm/op_helper.c    | 29 -----------------------------
 2 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index a18a09a0c3..80dff0788b 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -430,6 +430,37 @@ void arm_debug_excp_handler(CPUState *cs)
     }
 }
 
+/*
+ * Raise an EXCP_BKPT with the specified syndrome register value,
+ * targeting the correct exception level for debug exceptions.
+ */
+void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
+{
+    int debug_el = arm_debug_target_el(env);
+    int cur_el = arm_current_el(env);
+
+    /* FSR will only be used if the debug target EL is AArch32. */
+    env->exception.fsr = arm_debug_exception_fsr(env);
+    /*
+     * FAR is UNKNOWN: clear vaddress to avoid potentially exposing
+     * values to the guest that it shouldn't be able to see at its
+     * exception/security level.
+     */
+    env->exception.vaddress = 0;
+    /*
+     * Other kinds of architectural debug exception are ignored if
+     * they target an exception level below the current one (in QEMU
+     * this is checked by arm_generate_debug_exceptions()). Breakpoint
+     * instructions are special because they always generate an exception
+     * to somewhere: if they can't go to the configured debug exception
+     * level they are taken to the current exception level.
+     */
+    if (debug_el < cur_el) {
+        debug_el = cur_el;
+    }
+    raise_exception(env, EXCP_BKPT, syndrome, debug_el);
+}
+
 #if !defined(CONFIG_USER_ONLY)
 
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 00a082d1f7..ae0009d1a3 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -413,35 +413,6 @@ void HELPER(exception_advsimdfp_access)(CPUARMState *env,
     raise_exception(env, EXCP_UDEF, syndrome, target_el);
 }
 
-/* Raise an EXCP_BKPT with the specified syndrome register value,
- * targeting the correct exception level for debug exceptions.
- */
-void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
-{
-    int debug_el = arm_debug_target_el(env);
-    int cur_el = arm_current_el(env);
-
-    /* FSR will only be used if the debug target EL is AArch32. */
-    env->exception.fsr = arm_debug_exception_fsr(env);
-    /* FAR is UNKNOWN: clear vaddress to avoid potentially exposing
-     * values to the guest that it shouldn't be able to see at its
-     * exception/security level.
-     */
-    env->exception.vaddress = 0;
-    /*
-     * Other kinds of architectural debug exception are ignored if
-     * they target an exception level below the current one (in QEMU
-     * this is checked by arm_generate_debug_exceptions()). Breakpoint
-     * instructions are special because they always generate an exception
-     * to somewhere: if they can't go to the configured debug exception
-     * level they are taken to the current exception level.
-     */
-    if (debug_el < cur_el) {
-        debug_el = cur_el;
-    }
-    raise_exception(env, EXCP_BKPT, syndrome, debug_el);
-}
-
 uint32_t HELPER(cpsr_read)(CPUARMState *env)
 {
     return cpsr_read(env) & ~CPSR_EXEC;
-- 
2.34.1


