Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F36515DC8
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:42:45 +0200 (CEST)
Received: from localhost ([::1]:48948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknMy-0005E0-4X
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAY-0004mD-H3
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:57 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAV-0006GV-Ik
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:53 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so12729370pjb.5
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IzZtboHFK51ahqSRhw7zz5hbdZTb6VGng4tHM8rPvXQ=;
 b=vKTw6K1pyFSug4fM4A/3IyP/LXCWnY1JVdPKc4B05vaZvr51SjTmv1l83Ej+KvrcRn
 mWycv+LB8rPMXPBZFZDHvYfsV0Iq36gyJ4EGn8gQXrEyyyizkcO5UTKhNJmV95JynyJY
 mrt7EXo98+g4y6QtF6NFuiyNEUvcSJLeAQ67YojzH1bRgwwiydBmE+s2ru1Zgoxc5kLo
 NuEcso9UCJACBsQi0a/+uDLS+EDFRmkbZhDACNwDrICSibx8/yv6xPOxconEPis5tNQH
 T8uNHeBzi6DDU3ngzhrz7cvevSvYzc5fO6xehlCWPmB7JWBUpeefzlA6vvXdZfKCncoI
 sqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IzZtboHFK51ahqSRhw7zz5hbdZTb6VGng4tHM8rPvXQ=;
 b=AOswZDJSl4GUxJV19n98ARbtOm4RuIjSp4XTtnw9tGdH0H5wdXGsoucL9bFnS7xwbo
 OUGznlHWozvbTPWfECAiiDRyZOKSIE4F9lfik97/H4SF5VFbbvKGSJyYMDy47NVQg9wZ
 05ZF0ti2e2QhfkFOC7p87aRT3YwUhNJ40Zv2YA2A1MZ/OvK6CfUpG0xaVcWb1DGwXiWD
 zbw0qbei+944KUa9ryTT972iqkwPYfOaDcjQP5BwR+bXup1a3/uDoP8VdNoglT2ZnOUV
 dQl47QhNDg72tqoO02juJteNfWg4NE8Ply4EfCgaZeD0mBXjNkwMa3LSjhUjBVlsDa+o
 TjiA==
X-Gm-Message-State: AOAM530/fEwdhBatztC67wWvGZdykStW8jT4HKk2+8WlOFDQLfpoDwJH
 aFmuV4TPOPyaI9wGPFiaQHt8jFk8pxDJdg==
X-Google-Smtp-Source: ABdhPJy2J3d0oMz14U+GLF6MGbejsMVwTw7iqY42jv6rQnZcQpRV7fkUuKuncKP3sBQxu3WBg45rOw==
X-Received: by 2002:a17:902:8698:b0:158:99d4:6256 with SMTP id
 g24-20020a170902869800b0015899d46256mr3982498plo.104.1651325390340; 
 Sat, 30 Apr 2022 06:29:50 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/43] semihosting: Split common_semi_flen_buf per target
Date: Sat, 30 Apr 2022 06:29:05 -0700
Message-Id: <20220430132932.324018-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have some larger ifdef blocks for ARM and RISCV;
split out common_semi_stack_bottom per target.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 44 +++++++++++++++++------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 7fc60e223a..b2816e9f66 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -217,6 +217,13 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
 {
     return is_a64(env);
 }
+
+static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    return is_a64(env) ? env->xregs[31] : env->regs[13];
+}
 #endif /* TARGET_ARM */
 
 #ifdef TARGET_RISCV
@@ -246,6 +253,13 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
 {
     return riscv_cpu_mxl(env) != MXL_RV32;
 }
+
+static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    return env->gpr[xSP];
+}
 #endif
 
 /*
@@ -301,31 +315,15 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
     common_semi_set_ret(cs, ret);
 }
 
+/*
+ * Return an address in target memory of 64 bytes where the remote
+ * gdb should write its stat struct. (The format of this structure
+ * is defined by GDB's remote protocol and is not target-specific.)
+ * We put this on the guest's stack just below SP.
+ */
 static target_ulong common_semi_flen_buf(CPUState *cs)
 {
-    target_ulong sp;
-#ifdef TARGET_ARM
-    /* Return an address in target memory of 64 bytes where the remote
-     * gdb should write its stat struct. (The format of this structure
-     * is defined by GDB's remote protocol and is not target-specific.)
-     * We put this on the guest's stack just below SP.
-     */
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    if (is_a64(env)) {
-        sp = env->xregs[31];
-    } else {
-        sp = env->regs[13];
-    }
-#endif
-#ifdef TARGET_RISCV
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-
-    sp = env->gpr[xSP];
-#endif
-
+    target_ulong sp = common_semi_stack_bottom(cs);
     return sp - 64;
 }
 
-- 
2.34.1


