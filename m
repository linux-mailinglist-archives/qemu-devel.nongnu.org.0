Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE03B66AEFF
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 02:22:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGrhx-0007Dq-Pc; Sat, 14 Jan 2023 20:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGrhw-0007D7-Kx
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 20:21:12 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGrht-0002Ct-5H
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 20:21:12 -0500
Received: by mail-pg1-x534.google.com with SMTP id s67so17376385pgs.3
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 17:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+4lg7eradCYPVsrMRZCCKNQC6F+FnSFuqVVZBIJoIWA=;
 b=mM1JOI5LcPOEfxkTxe7m/P4llx7yijlwQ+MkuUwtWgZmqYHxVR80VaEGkBsQ0N90kr
 WL4LHpMX0Su2QlSJfNV9vZGoifJ73S0SumVhiL1M1eXWLr9fD+kuMMG6SxMuhL/SV437
 Byc0zk3r7raqwhi63324c5/3q3qe7g6Sdl77dlCqfPtrkAViQKQntDqPWvPYxNtspYAC
 VI/D1jlSfVs74vuFBwFPMJQYLgztTJh2PdSO9GtZD7/6q0pwXdIXptc0Bo50z+mF7aHn
 M8cA+ulGRAY9o15gJJ27qwqAwBhGld2FUhgcoN5Oeivywi+6clYH1+iDVEsw0xdCB6B4
 Xb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+4lg7eradCYPVsrMRZCCKNQC6F+FnSFuqVVZBIJoIWA=;
 b=ze5+SIMb+bzCAb6waNwpG3W/UGomNVD9EdEvLpOg6Dws+54ZdCGGWCHQm5V+dXjGLg
 aW8Pi/Gd8NWEkEoWBaGjEChubXx5bKqpBPZi5I6pv5Ve7Dze7KLT6cvWWEOlW7wQT0w6
 jW7DE0Avl2DHo1qCAM0bl2VeOimZg/asqSzUH2vBIyZSccCG/NT4VYp9gdFkpZnnjzgi
 NZztEr0r75u35iQBpLavCAfKYip9LL/DtSY23rHyEt18UPaEDlIQBjvyKutFqaGoRvca
 gIcWFKRRid5Er7Zqo/vXu6rzVv4II+4jsWzhDda9h469nNjJr6sNB5vr1VUVe3EUV7Cm
 aXyQ==
X-Gm-Message-State: AFqh2kojxXVx0tRTuXiusamZdh1I7t1yAe7/tgB1Kx2jh6vNk84ZQtdD
 GIUPuxt7mnd4i8B/heyW/SGrymwmnztYmX7R
X-Google-Smtp-Source: AMrXdXvAYStqzrE8gZf+dzoxK4/GHcoVb4ZGCNJ/7kp/PSEY9QHwCrP0aVHCjGNh/cECxeVwPzH5IQ==
X-Received: by 2002:a62:870f:0:b0:582:bb80:58d7 with SMTP id
 i15-20020a62870f000000b00582bb8058d7mr16247883pfe.26.1673745667023; 
 Sat, 14 Jan 2023 17:21:07 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 5-20020a621505000000b005772d55df03sm15704260pfv.35.2023.01.14.17.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 17:21:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH] target/i386: Fix 32-bit AD[CO]X insns in 64-bit mode
Date: Sat, 14 Jan 2023 15:21:03 -1000
Message-Id: <20230115012103.3131796-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Failure to truncate the inputs results in garbage for the carry-out.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1373
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/x86_64/adox.c          | 69 ++++++++++++++++++++++++++++++++
 target/i386/tcg/emit.c.inc       |  2 +
 tests/tcg/x86_64/Makefile.target |  3 ++
 3 files changed, 74 insertions(+)
 create mode 100644 tests/tcg/x86_64/adox.c

diff --git a/tests/tcg/x86_64/adox.c b/tests/tcg/x86_64/adox.c
new file mode 100644
index 0000000000..36be644c8b
--- /dev/null
+++ b/tests/tcg/x86_64/adox.c
@@ -0,0 +1,69 @@
+/* See if ADOX give expected results */
+
+#include <assert.h>
+#include <stdint.h>
+#include <stdbool.h>
+
+static uint64_t adoxq(bool *c_out, uint64_t a, uint64_t b, bool c)
+{
+    asm ("addl $0x7fffffff, %k1\n\t"
+         "adoxq %2, %0\n\t"
+         "seto %b1"
+         : "+r"(a), "=&r"(c) : "r"(b), "1"((int)c));
+    *c_out = c;
+    return a;
+}
+
+static uint64_t adoxl(bool *c_out, uint64_t a, uint64_t b, bool c)
+{
+    asm ("addl $0x7fffffff, %k1\n\t"
+         "adoxl %k2, %k0\n\t"
+         "seto %b1"
+         : "+r"(a), "=&r"(c) : "r"(b), "1"((int)c));
+    *c_out = c;
+    return a;
+}
+
+int main()
+{
+    uint64_t r;
+    bool c;
+
+    r = adoxq(&c, 0, 0, 0);
+    assert(r == 0);
+    assert(c == 0);
+
+    r = adoxl(&c, 0, 0, 0);
+    assert(r == 0);
+    assert(c == 0);
+
+    r = adoxl(&c, 0x100000000, 0, 0);
+    assert(r == 0);
+    assert(c == 0);
+
+    r = adoxq(&c, 0, 0, 1);
+    assert(r == 1);
+    assert(c == 0);
+
+    r = adoxl(&c, 0, 0, 1);
+    assert(r == 1);
+    assert(c == 0);
+
+    r = adoxq(&c, -1, -1, 0);
+    assert(r == -2);
+    assert(c == 1);
+
+    r = adoxl(&c, -1, -1, 0);
+    assert(r == 0xfffffffe);
+    assert(c == 1);
+
+    r = adoxq(&c, -1, -1, 1);
+    assert(r == -1);
+    assert(c == 1);
+
+    r = adoxl(&c, -1, -1, 1);
+    assert(r == 0xffffffff);
+    assert(c == 1);
+
+    return 0;
+}
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 1eace1231a..d44c51209d 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1042,6 +1042,8 @@ static void gen_ADCOX(DisasContext *s, CPUX86State *env, MemOp ot, int cc_op)
 #ifdef TARGET_X86_64
     case MO_32:
         /* If TL is 64-bit just do everything in 64-bit arithmetic.  */
+        tcg_gen_ext32u_tl(s->T0, s->T0);
+        tcg_gen_ext32u_tl(s->T1, s->T1);
         tcg_gen_add_i64(s->T0, s->T0, s->T1);
         tcg_gen_add_i64(s->T0, s->T0, carry_in);
         tcg_gen_shri_i64(carry_out, s->T0, 32);
diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index 4eac78293f..e64aab1b81 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -12,11 +12,14 @@ ifeq ($(filter %-linux-user, $(TARGET)),$(TARGET))
 X86_64_TESTS += vsyscall
 X86_64_TESTS += noexec
 X86_64_TESTS += cmpxchg
+X86_64_TESTS += adox
 TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
 else
 TESTS=$(MULTIARCH_TESTS)
 endif
 
+adox: CFLAGS=-O2
+
 run-test-i386-ssse3: QEMU_OPTS += -cpu max
 run-plugin-test-i386-ssse3-%: QEMU_OPTS += -cpu max
 
-- 
2.34.1


