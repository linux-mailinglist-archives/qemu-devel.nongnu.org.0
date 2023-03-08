Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BDA6B0FA6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:03:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx84-0004IT-RF; Wed, 08 Mar 2023 11:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx82-0004Fr-82; Wed, 08 Mar 2023 11:59:02 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx80-00041r-6l; Wed, 08 Mar 2023 11:59:02 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id B814A400F2;
 Wed,  8 Mar 2023 19:58:21 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 71ACC1FE;
 Wed,  8 Mar 2023 19:58:20 +0300 (MSK)
Received: (nullmailer pid 2098292 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 20/47] tests/tcg/i386: Introduce and use reg_t consistently
Date: Wed,  8 Mar 2023 19:57:23 +0300
Message-Id: <20230308165815.2098148-20-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Define reg_t based on the actual register width.
Define the inlines using that type.  This will allow
input registers to 32-bit insns to be set to 64-bit
values on x86-64, which allows testing various edge cases.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230114230542.3116013-2-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit 5d62d6649cd367b5b4a3676e7514d2f9ca86cb03)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/tcg/i386/test-i386-bmi2.c | 182 ++++++++++++++++----------------
 1 file changed, 93 insertions(+), 89 deletions(-)

diff --git a/tests/tcg/i386/test-i386-bmi2.c b/tests/tcg/i386/test-i386-bmi2.c
index 5fadf47510..3c3ef85513 100644
--- a/tests/tcg/i386/test-i386-bmi2.c
+++ b/tests/tcg/i386/test-i386-bmi2.c
@@ -3,34 +3,40 @@
 #include <stdint.h>
 #include <stdio.h>
 
+#ifdef __x86_64
+typedef uint64_t reg_t;
+#else
+typedef uint32_t reg_t;
+#endif
+
 #define insn1q(name, arg0)                                                           \
-static inline uint64_t name##q(uint64_t arg0)                                        \
+static inline reg_t name##q(reg_t arg0)                                              \
 {                                                                                    \
-    uint64_t result64;                                                               \
+    reg_t result64;                                                                  \
     asm volatile (#name "q   %1, %0" : "=r"(result64) : "rm"(arg0));                 \
     return result64;                                                                 \
 }
 
 #define insn1l(name, arg0)                                                           \
-static inline uint32_t name##l(uint32_t arg0)                                        \
+static inline reg_t name##l(reg_t arg0)                                              \
 {                                                                                    \
-    uint32_t result32;                                                               \
+    reg_t result32;                                                                  \
     asm volatile (#name "l   %k1, %k0" : "=r"(result32) : "rm"(arg0));               \
     return result32;                                                                 \
 }
 
 #define insn2q(name, arg0, c0, arg1, c1)                                             \
-static inline uint64_t name##q(uint64_t arg0, uint64_t arg1)                         \
+static inline reg_t name##q(reg_t arg0, reg_t arg1)                                  \
 {                                                                                    \
-    uint64_t result64;                                                               \
+    reg_t result64;                                                                  \
     asm volatile (#name "q   %2, %1, %0" : "=r"(result64) : c0(arg0), c1(arg1));     \
     return result64;                                                                 \
 }
 
 #define insn2l(name, arg0, c0, arg1, c1)                                             \
-static inline uint32_t name##l(uint32_t arg0, uint32_t arg1)                         \
+static inline reg_t name##l(reg_t arg0, reg_t arg1)                                  \
 {                                                                                    \
-    uint32_t result32;                                                               \
+    reg_t result32;                                                                  \
     asm volatile (#name "l   %k2, %k1, %k0" : "=r"(result32) : c0(arg0), c1(arg1));  \
     return result32;                                                                 \
 }
@@ -65,130 +71,128 @@ insn1l(blsr, src)
 int main(int argc, char *argv[]) {
     uint64_t ehlo = 0x202020204f4c4845ull;
     uint64_t mask = 0xa080800302020001ull;
-    uint32_t result32;
+    reg_t result;
 
 #ifdef __x86_64
-    uint64_t result64;
-
     /* 64 bits */
-    result64 = andnq(mask, ehlo);
-    assert(result64 == 0x002020204d4c4844);
+    result = andnq(mask, ehlo);
+    assert(result == 0x002020204d4c4844);
 
-    result64 = pextq(ehlo, mask);
-    assert(result64 == 133);
+    result = pextq(ehlo, mask);
+    assert(result == 133);
 
-    result64 = pdepq(result64, mask);
-    assert(result64 == (ehlo & mask));
+    result = pdepq(result, mask);
+    assert(result == (ehlo & mask));
 
-    result64 = pextq(-1ull, mask);
-    assert(result64 == 511); /* mask has 9 bits set */
+    result = pextq(-1ull, mask);
+    assert(result == 511); /* mask has 9 bits set */
 
-    result64 = pdepq(-1ull, mask);
-    assert(result64 == mask);
+    result = pdepq(-1ull, mask);
+    assert(result == mask);
 
-    result64 = bextrq(mask, 0x3f00);
-    assert(result64 == (mask & ~INT64_MIN));
+    result = bextrq(mask, 0x3f00);
+    assert(result == (mask & ~INT64_MIN));
 
-    result64 = bextrq(mask, 0x1038);
-    assert(result64 == 0xa0);
+    result = bextrq(mask, 0x1038);
+    assert(result == 0xa0);
 
-    result64 = bextrq(mask, 0x10f8);
-    assert(result64 == 0);
+    result = bextrq(mask, 0x10f8);
+    assert(result == 0);
 
-    result64 = blsiq(0x30);
-    assert(result64 == 0x10);
+    result = blsiq(0x30);
+    assert(result == 0x10);
 
-    result64 = blsiq(0x30ull << 32);
-    assert(result64 == 0x10ull << 32);
+    result = blsiq(0x30ull << 32);
+    assert(result == 0x10ull << 32);
 
-    result64 = blsmskq(0x30);
-    assert(result64 == 0x1f);
+    result = blsmskq(0x30);
+    assert(result == 0x1f);
 
-    result64 = blsrq(0x30);
-    assert(result64 == 0x20);
+    result = blsrq(0x30);
+    assert(result == 0x20);
 
-    result64 = blsrq(0x30ull << 32);
-    assert(result64 == 0x20ull << 32);
+    result = blsrq(0x30ull << 32);
+    assert(result == 0x20ull << 32);
 
-    result64 = bzhiq(mask, 0x3f);
-    assert(result64 == (mask & ~INT64_MIN));
+    result = bzhiq(mask, 0x3f);
+    assert(result == (mask & ~INT64_MIN));
 
-    result64 = bzhiq(mask, 0x1f);
-    assert(result64 == (mask & ~(-1 << 30)));
+    result = bzhiq(mask, 0x1f);
+    assert(result == (mask & ~(-1 << 30)));
 
-    result64 = rorxq(0x2132435465768798, 8);
-    assert(result64 == 0x9821324354657687);
+    result = rorxq(0x2132435465768798, 8);
+    assert(result == 0x9821324354657687);
 
-    result64 = sarxq(0xffeeddccbbaa9988, 8);
-    assert(result64 == 0xffffeeddccbbaa99);
+    result = sarxq(0xffeeddccbbaa9988, 8);
+    assert(result == 0xffffeeddccbbaa99);
 
-    result64 = sarxq(0x77eeddccbbaa9988, 8 | 64);
-    assert(result64 == 0x0077eeddccbbaa99);
+    result = sarxq(0x77eeddccbbaa9988, 8 | 64);
+    assert(result == 0x0077eeddccbbaa99);
 
-    result64 = shrxq(0xffeeddccbbaa9988, 8);
-    assert(result64 == 0x00ffeeddccbbaa99);
+    result = shrxq(0xffeeddccbbaa9988, 8);
+    assert(result == 0x00ffeeddccbbaa99);
 
-    result64 = shrxq(0x77eeddccbbaa9988, 8 | 192);
-    assert(result64 == 0x0077eeddccbbaa99);
+    result = shrxq(0x77eeddccbbaa9988, 8 | 192);
+    assert(result == 0x0077eeddccbbaa99);
 
-    result64 = shlxq(0xffeeddccbbaa9988, 8);
-    assert(result64 == 0xeeddccbbaa998800);
+    result = shlxq(0xffeeddccbbaa9988, 8);
+    assert(result == 0xeeddccbbaa998800);
 #endif
 
     /* 32 bits */
-    result32 = andnl(mask, ehlo);
-    assert(result32 == 0x04d4c4844);
+    result = andnl(mask, ehlo);
+    assert(result == 0x04d4c4844);
 
-    result32 = pextl((uint32_t) ehlo, mask);
-    assert(result32 == 5);
+    result = pextl((uint32_t) ehlo, mask);
+    assert(result == 5);
 
-    result32 = pdepl(result32, mask);
-    assert(result32 == (uint32_t)(ehlo & mask));
+    result = pdepl(result, mask);
+    assert(result == (uint32_t)(ehlo & mask));
 
-    result32 = pextl(-1u, mask);
-    assert(result32 == 7); /* mask has 3 bits set */
+    result = pextl(-1u, mask);
+    assert(result == 7); /* mask has 3 bits set */
 
-    result32 = pdepl(-1u, mask);
-    assert(result32 == (uint32_t)mask);
+    result = pdepl(-1u, mask);
+    assert(result == (uint32_t)mask);
 
-    result32 = bextrl(mask, 0x1f00);
-    assert(result32 == (mask & ~INT32_MIN));
+    result = bextrl(mask, 0x1f00);
+    assert(result == (mask & ~INT32_MIN));
 
-    result32 = bextrl(ehlo, 0x1018);
-    assert(result32 == 0x4f);
+    result = bextrl(ehlo, 0x1018);
+    assert(result == 0x4f);
 
-    result32 = bextrl(mask, 0x1038);
-    assert(result32 == 0);
+    result = bextrl(mask, 0x1038);
+    assert(result == 0);
 
-    result32 = blsil(0xffff);
-    assert(result32 == 1);
+    result = blsil(0xffff);
+    assert(result == 1);
 
-    result32 = blsmskl(0x300);
-    assert(result32 == 0x1ff);
+    result = blsmskl(0x300);
+    assert(result == 0x1ff);
 
-    result32 = blsrl(0xffc);
-    assert(result32 == 0xff8);
+    result = blsrl(0xffc);
+    assert(result == 0xff8);
 
-    result32 = bzhil(mask, 0xf);
-    assert(result32 == 1);
+    result = bzhil(mask, 0xf);
+    assert(result == 1);
 
-    result32 = rorxl(0x65768798, 8);
-    assert(result32 == 0x98657687);
+    result = rorxl(0x65768798, 8);
+    assert(result == 0x98657687);
 
-    result32 = sarxl(0xffeeddcc, 8);
-    assert(result32 == 0xffffeedd);
+    result = sarxl(0xffeeddcc, 8);
+    assert(result == 0xffffeedd);
 
-    result32 = sarxl(0x77eeddcc, 8 | 32);
-    assert(result32 == 0x0077eedd);
+    result = sarxl(0x77eeddcc, 8 | 32);
+    assert(result == 0x0077eedd);
 
-    result32 = shrxl(0xffeeddcc, 8);
-    assert(result32 == 0x00ffeedd);
+    result = shrxl(0xffeeddcc, 8);
+    assert(result == 0x00ffeedd);
 
-    result32 = shrxl(0x77eeddcc, 8 | 128);
-    assert(result32 == 0x0077eedd);
+    result = shrxl(0x77eeddcc, 8 | 128);
+    assert(result == 0x0077eedd);
 
-    result32 = shlxl(0xffeeddcc, 8);
-    assert(result32 == 0xeeddcc00);
+    result = shlxl(0xffeeddcc, 8);
+    assert(result == 0xeeddcc00);
 
     return 0;
 }
-- 
2.30.2


