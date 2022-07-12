Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AE7572156
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 18:48:54 +0200 (CEST)
Received: from localhost ([::1]:50438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBJ49-0001yG-D9
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 12:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=V6zu=XR=zx2c4.com=Jason@kernel.org>)
 id 1oBJ28-0007D6-RS
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 12:46:49 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:35312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=V6zu=XR=zx2c4.com=Jason@kernel.org>)
 id 1oBJ26-0001eC-39
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 12:46:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8FD39B81A90;
 Tue, 12 Jul 2022 16:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63524C3411C;
 Tue, 12 Jul 2022 16:46:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="CKf/23T9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1657644399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iwsHLV9WNMrfaQc3DA7BC1+OCflXBbVPcxlPcTWXjMs=;
 b=CKf/23T9TE4KuI2cjN80lhm0FVRW/tY1qqZ3fpAQmTnNMybNqcDxl6SkaPEv1pxlRKIP5W
 X0b4DBqXhyxrp/vjLqCZG3/OIyTEisnRZO/P4JMsqB339UvwSfzDiQ+HT7SMPV4ZRgHyZK
 Ob7JHyjS1AG8bGyz6WWUW1dy1b0DVzQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f8d2426e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 12 Jul 2022 16:46:38 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-s390@vger.kernel.org,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: [PATCH qemu] target/s390x: support PRNO_TRNG instruction
Date: Tue, 12 Jul 2022 18:46:27 +0200
Message-Id: <20220712164627.581570-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=V6zu=XR=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

In order for hosts running inside of TCG to initialize the kernel's
random number generator, we should support the PRNO_TRNG instruction,
backed in the usual way with the qemu_guest_getrandom helper. This is
confirmed working on Linux 5.19-rc6.

Cc: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Harald Freudenberger <freude@linux.ibm.com>
Cc: Holger Dengler <dengler@linux.ibm.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 target/s390x/gen-features.c      |  2 ++
 target/s390x/tcg/crypto_helper.c | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index ad140184b9..3d333e2789 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -749,6 +749,8 @@ static uint16_t qemu_V7_0[] = {
  */
 static uint16_t qemu_MAX[] = {
     S390_FEAT_VECTOR_ENH2,
+    S390_FEAT_MSA_EXT_5,
+    S390_FEAT_PRNO_TRNG,
 };
 
 /****** END FEATURE DEFS ******/
diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
index 138d9e7ad9..cefdfd114e 100644
--- a/target/s390x/tcg/crypto_helper.c
+++ b/target/s390x/tcg/crypto_helper.c
@@ -12,12 +12,28 @@
 
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
+#include "qemu/guest-random.h"
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 
+static void fill_buf_random(CPUS390XState *env, uintptr_t ra,
+                            uint64_t buf, uint64_t len)
+{
+        uint64_t addr = wrap_address(env, buf);
+        uint8_t tmp[256];
+
+        while (len) {
+                size_t block = MIN(len, sizeof(tmp));
+                qemu_guest_getrandom_nofail(tmp, block);
+                for (size_t i = 0; i < block; ++i)
+                        cpu_stb_data_ra(env, addr++, tmp[i], ra);
+                len -= block;
+        }
+}
+
 uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
                      uint32_t type)
 {
@@ -52,6 +68,13 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
             cpu_stb_data_ra(env, param_addr, subfunc[i], ra);
         }
         break;
+    case 114: {
+        const uint64_t ucbuf = env->regs[r1], ucbuf_len = env->regs[r1 + 1];
+        const uint64_t cbuf = env->regs[r2], cbuf_len = env->regs[r2 + 1];
+        fill_buf_random(env, ra, ucbuf, ucbuf_len);
+        fill_buf_random(env, ra, cbuf, cbuf_len);
+        break;
+    }
     default:
         /* we don't implement any other subfunction yet */
         g_assert_not_reached();
-- 
2.35.1


