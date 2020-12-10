Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7F52D5B06
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:57:39 +0100 (CET)
Received: from localhost ([::1]:39000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLVq-00077o-NF
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knKur-0001kl-W3
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:19:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knKum-0000Hw-0o
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607602759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8XaAqBgivGsQCrIvNp2L93XGAwDy2CNT3/3nnQeNLo=;
 b=WZofDsxypUEslPnxIKUhA1lfYwwC5ORfjLNauv8kBbmntReJM+TYSs69Yvtxa8f60MXoPg
 kqedwWkIfG+9r+8np7fh0qenRHjJRdgu3skd+A9wjtWKMvKpsSnmwT/4ZLG7wXFts7AJnG
 iLIy+qATJNsi9mPswky+MCmy7v+DIUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-Xw_zpawEMiedrT8--gTOXw-1; Thu, 10 Dec 2020 07:19:15 -0500
X-MC-Unique: Xw_zpawEMiedrT8--gTOXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96C0710054FF
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 12:19:14 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C0F960BF1
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 12:19:14 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 001/113] target/i386: fix operand order for PDEP and PEXT
Date: Thu, 10 Dec 2020 07:19:11 -0500
Message-Id: <20201210121913.531490-2-pbonzini@redhat.com>
In-Reply-To: <20201210121913.531490-1-pbonzini@redhat.com>
References: <20201210121913.531490-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For PDEP and PEXT, the mask is provided in the memory (mod+r/m)
operand, and therefore is loaded in s->T0 by gen_ldst_modrm.
The source is provided in the second source operand (VEX.vvvv)
and therefore is loaded in s->T1.  Fix the order in which
they are passed to the helpers.

Reported-by: Lenard Szolnoki <blog@lenardszolnoki.com>
Analyzed-by: Lenard Szolnoki <blog@lenardszolnoki.com>
Fixes: https://bugs.launchpad.net/qemu/+bug/1605123
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/translate.c         |  8 +++----
 tests/tcg/i386/Makefile.target  |  3 +++
 tests/tcg/i386/test-i386-bmi2.c | 41 +++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 4 deletions(-)
 create mode 100644 tests/tcg/i386/test-i386-bmi2.c

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 4c57307e42..e8f5f5803a 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -3936,14 +3936,14 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 }
                 ot = mo_64_32(s->dflag);
                 gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                /* Note that by zero-extending the mask operand, we
+                /* Note that by zero-extending the source operand, we
                    automatically handle zero-extending the result.  */
                 if (ot == MO_64) {
                     tcg_gen_mov_tl(s->T1, cpu_regs[s->vex_v]);
                 } else {
                     tcg_gen_ext32u_tl(s->T1, cpu_regs[s->vex_v]);
                 }
-                gen_helper_pdep(cpu_regs[reg], s->T0, s->T1);
+                gen_helper_pdep(cpu_regs[reg], s->T1, s->T0);
                 break;
 
             case 0x2f5: /* pext Gy, By, Ey */
@@ -3954,14 +3954,14 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 }
                 ot = mo_64_32(s->dflag);
                 gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                /* Note that by zero-extending the mask operand, we
+                /* Note that by zero-extending the source operand, we
                    automatically handle zero-extending the result.  */
                 if (ot == MO_64) {
                     tcg_gen_mov_tl(s->T1, cpu_regs[s->vex_v]);
                 } else {
                     tcg_gen_ext32u_tl(s->T1, cpu_regs[s->vex_v]);
                 }
-                gen_helper_pext(cpu_regs[reg], s->T0, s->T1);
+                gen_helper_pext(cpu_regs[reg], s->T1, s->T0);
                 break;
 
             case 0x1f6: /* adcx Gy, Ey */
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index a66232a67d..ad187cb2c9 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -18,6 +18,9 @@ test-i386-pcmpistri: CFLAGS += -msse4.2
 run-test-i386-pcmpistri: QEMU_OPTS += -cpu max
 run-plugin-test-i386-pcmpistri-%: QEMU_OPTS += -cpu max
 
+run-test-i386-bmi2: QEMU_OPTS += -cpu max
+run-plugin-test-i386-bmi2-%: QEMU_OPTS += -cpu max
+
 #
 # hello-i386 is a barebones app
 #
diff --git a/tests/tcg/i386/test-i386-bmi2.c b/tests/tcg/i386/test-i386-bmi2.c
new file mode 100644
index 0000000000..b61f05b69e
--- /dev/null
+++ b/tests/tcg/i386/test-i386-bmi2.c
@@ -0,0 +1,41 @@
+/* See if various BMI2 instructions give expected results */
+#include <assert.h>
+#include <stdint.h>
+
+int main(int argc, char *argv[]) {
+    uint64_t ehlo = 0x202020204f4c4845ull;
+    uint64_t mask = 0xa080800302020001ull;
+    uint64_t result64;
+    uint32_t result32;
+
+#ifdef __x86_64
+    /* 64 bits */
+    asm volatile ("pextq   %2, %1, %0" : "=r"(result64) : "r"(ehlo), "m"(mask));
+    assert(result64 == 133);
+
+    asm volatile ("pdepq   %2, %1, %0" : "=r"(result64) : "r"(result64), "m"(mask));
+    assert(result64 == (ehlo & mask));
+
+    asm volatile ("pextq   %2, %1, %0" : "=r"(result64) : "r"(-1ull), "m"(mask));
+    assert(result64 == 511); /* mask has 9 bits set */
+
+    asm volatile ("pdepq   %2, %1, %0" : "=r"(result64) : "r"(-1ull), "m"(mask));
+    assert(result64 == mask);
+#endif
+
+    /* 32 bits */
+    asm volatile ("pextl   %2, %k1, %k0" : "=r"(result32) : "r"((uint32_t) ehlo), "m"(mask));
+    assert(result32 == 5);
+
+    asm volatile ("pdepl   %2, %k1, %k0" : "=r"(result32) : "r"(result32), "m"(mask));
+    assert(result32 == (uint32_t)(ehlo & mask));
+
+    asm volatile ("pextl   %2, %k1, %k0" : "=r"(result32) : "r"(-1ull), "m"(mask));
+    assert(result32 == 7); /* mask has 3 bits set */
+
+    asm volatile ("pdepl   %2, %k1, %k0" : "=r"(result32) : "r"(-1ull), "m"(mask));
+    assert(result32 == (uint32_t)mask);
+
+    return 0;
+}
+
-- 
2.26.2



