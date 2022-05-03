Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470C0518F4E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:48:29 +0200 (CEST)
Received: from localhost ([::1]:53362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzRc-0008H6-9C
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZw-0000lg-Sk
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:53:01 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZt-0006Gc-5j
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:53:00 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so2552004pjb.0
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QUpRdJbpx7VQuY/FyAcpatmDIjI0TndHoNfi0QxhsFU=;
 b=d/t6hJXzAb5M3+WOQp7wV86NfCYE4d6AXt80oxmT0/PtOCtTZaGFvn5EyPZsU7kL6e
 NMFXNNBShL/4WHgcZo66j8qOeuua1B5uSr8wlRK78Up1XITVYml87OW8sh2Ugg1HW1lx
 JnRC98H+kKrbJrFhMSs1wsnNZNcwEKksJ/fLcUMAPqjZs05lbmxiJZ0eCvjw1otj6UG4
 2jeZbic3vK+8UKKIkLl8teG9T14Me69lpNB+McofFIAoDWAiMbcQlQRURwA1mHZuLzbT
 4Np8MwmbGb/TBkoe/Baz7lYTnQaMri9mC5uOiZSs65yRM9gOvZTaKVsoeTF3kay6U3+u
 4cWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QUpRdJbpx7VQuY/FyAcpatmDIjI0TndHoNfi0QxhsFU=;
 b=jGP4Z069Xr3qjWYN93oEMOw0Dt+7Pf6n3cd3RgszIXNJezvfEWT8nHoFntt89VzkHx
 KFnl8HqQYiW9rso9ANfMddCNMFiJUOfAv0IfmMYN2NKR9mYPUFrPa7U8vHlyvl2wnFMc
 b2N5Xm1neAF+nJHtd0bkM4cotWCmU3Ar7lUUzdcA+g5L0LmjsgVlp79n8mIEQfy2nOOm
 nLCXI3mmfm2oD9Wh+p4Jhp0s/blGbQqIb1WgNqftNr/J5blv0Y8ldJnG2fuPAGvMFFob
 fLg8CdefOl3RvIMH08pA2rPqTs8Ne2Q7OwBDPeiZKZL7A1JiuI+xhnUvmSsfcoqn+44e
 WRvw==
X-Gm-Message-State: AOAM531Jlr79kdHr3izZzQz9wDBRrr2zJ6eE6Uie2d1Jd+03Hs3tw57H
 x90SUubPKj1DPg9ss+DFjMr04N+bsuxmVA==
X-Google-Smtp-Source: ABdhPJzoBMptAFdareiMR6gabpEobGoqTQiEdpZCa96QRlNhC3FigvkSrxMnRQLJewexO2xhyma2Fw==
X-Received: by 2002:a17:90b:3e8d:b0:1dc:3db4:920a with SMTP id
 rj13-20020a17090b3e8d00b001dc3db4920amr6470883pjb.161.1651607575518; 
 Tue, 03 May 2022 12:52:55 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 70/74] target/rx: Name the exceptions
Date: Tue,  3 May 2022 12:48:39 -0700
Message-Id: <20220503194843.1379101-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Provide EXCP_* names to the fixed and relocatable
vector table entries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/cpu.h       | 20 ++++++++++++++++++++
 target/rx/helper.c    | 25 ++++++++++++++++---------
 target/rx/op_helper.c | 15 +++++++--------
 3 files changed, 43 insertions(+), 17 deletions(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 5655dffeff..99e28fb70f 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -66,6 +66,26 @@ enum {
     NUM_REGS = 16,
 };
 
+enum {
+    /*
+     * The Fixed Vector Table begins at 0xffffff80 and contains 32 entries,
+     * most of which are reserved.
+     */
+    EXCP_PRIVILEGED  = 20,
+    EXCP_ACCESS      = 21,
+    EXCP_UNDEFINED   = 23,
+    EXCP_FPU         = 25,
+    EXCP_NMI         = 30,
+    EXCP_RESET       = 31,
+
+    /*
+     * The Relocatable Vector Table begins at env->intb and
+     * contains 256 entries.
+     */
+    EXCP_INTB_0      = 0x100,
+    EXCP_INTB_255    = EXCP_INTB_0 + 255,
+};
+
 typedef struct CPUArchState {
     /* CPU registers */
     uint32_t regs[NUM_REGS];    /* general registers */
diff --git a/target/rx/helper.c b/target/rx/helper.c
index c6e285657e..29a4b075fa 100644
--- a/target/rx/helper.c
+++ b/target/rx/helper.c
@@ -83,36 +83,43 @@ void rx_cpu_do_interrupt(CPUState *cs)
         }
     } else {
         uint32_t vec = cs->exception_index;
-        const char *expname = "unknown exception";
+        const char *expname;
 
         env->isp -= 4;
         cpu_stl_data(env, env->isp, save_psw);
         env->isp -= 4;
         cpu_stl_data(env, env->isp, env->pc);
 
-        if (vec < 0x100) {
+        if (vec < EXCP_INTB_0) {
             env->pc = cpu_ldl_data(env, 0xffffff80 + vec * 4);
         } else {
-            env->pc = cpu_ldl_data(env, env->intb + (vec & 0xff) * 4);
+            env->pc = cpu_ldl_data(env, env->intb + (vec - EXCP_INTB_0) * 4);
         }
         switch (vec) {
-        case 20:
+        case EXCP_PRIVILEGED:
             expname = "privilege violation";
             break;
-        case 21:
+        case EXCP_ACCESS:
             expname = "access exception";
             break;
-        case 23:
+        case EXCP_UNDEFINED:
             expname = "illegal instruction";
             break;
-        case 25:
+        case EXCP_FPU:
             expname = "fpu exception";
             break;
-        case 30:
+        case EXCP_NMI:
             expname = "non-maskable interrupt";
             break;
-        case 0x100 ... 0x1ff:
+        case EXCP_RESET:
+            expname = "reset interrupt";
+            break;
+        case EXCP_INTB_0 ... EXCP_INTB_255:
             expname = "unconditional trap";
+            break;
+        default:
+            expname = "unknown exception";
+            break;
         }
         qemu_log_mask(CPU_LOG_INT, "exception 0x%02x [%s] raised\n",
                       (vec & 0xff), expname);
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 9ca32dcc82..6ab7b070bd 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -114,7 +114,7 @@ static void update_fpsw(CPURXState *env, float32 ret, uintptr_t retaddr)
         enable = FIELD_EX32(env->fpsw, FPSW, ENABLE);
         enable |= 1 << 5; /* CE always enabled */
         if (cause & enable) {
-            raise_exception(env, 21, retaddr);
+            raise_exception(env, EXCP_FPU, retaddr);
         }
     }
 }
@@ -420,8 +420,7 @@ uint32_t helper_divu(CPURXState *env, uint32_t num, uint32_t den)
 
 /* exception */
 static inline G_NORETURN
-void raise_exception(CPURXState *env, int index,
-                     uintptr_t retaddr)
+void raise_exception(CPURXState *env, int index, uintptr_t retaddr)
 {
     CPUState *cs = env_cpu(env);
 
@@ -431,17 +430,17 @@ void raise_exception(CPURXState *env, int index,
 
 G_NORETURN void helper_raise_privilege_violation(CPURXState *env)
 {
-    raise_exception(env, 20, GETPC());
+    raise_exception(env, EXCP_PRIVILEGED, GETPC());
 }
 
 G_NORETURN void helper_raise_access_fault(CPURXState *env)
 {
-    raise_exception(env, 21, GETPC());
+    raise_exception(env, EXCP_ACCESS, GETPC());
 }
 
 G_NORETURN void helper_raise_illegal_instruction(CPURXState *env)
 {
-    raise_exception(env, 23, GETPC());
+    raise_exception(env, EXCP_UNDEFINED, GETPC());
 }
 
 G_NORETURN void helper_wait(CPURXState *env)
@@ -456,10 +455,10 @@ G_NORETURN void helper_wait(CPURXState *env)
 
 G_NORETURN void helper_rxint(CPURXState *env, uint32_t vec)
 {
-    raise_exception(env, 0x100 + vec, 0);
+    raise_exception(env, EXCP_INTB_0 + vec, 0);
 }
 
 G_NORETURN void helper_rxbrk(CPURXState *env)
 {
-    raise_exception(env, 0x100, 0);
+    raise_exception(env, EXCP_INTB_0, 0);
 }
-- 
2.34.1


