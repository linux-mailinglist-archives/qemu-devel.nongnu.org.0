Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810735BFC0C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 12:11:41 +0200 (CEST)
Received: from localhost ([::1]:45358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oawhg-0008Dm-6V
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 06:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org>)
 id 1oawdy-0004Qk-Dv; Wed, 21 Sep 2022 06:07:50 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:35190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org>)
 id 1oawdw-0007hL-1c; Wed, 21 Sep 2022 06:07:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C3D91B81626;
 Wed, 21 Sep 2022 10:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B36DC433D7;
 Wed, 21 Sep 2022 10:07:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="X7I7z6qS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663754863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hc092amw+y9CyW9KezwzhfEn/tJS4YAaEknmeH8Jc2Y=;
 b=X7I7z6qSKZM7q+/rB0HpPotQaPBq6WL71hLUp3+c6lwHSZgHcLWZHnNMmuen1I1F1XpUb7
 00IQ0zzcf9Q5swdw85XwxAfTv0uRGbh3+o5XY3GEXNf0iSVUNEd5i+LFMaVatIeUSRes3G
 wQQSwL9L04jGiKCL6wDbq7eri9fcfB4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b1119fb9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 21 Sep 2022 10:07:43 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: [PATCH v8 2/2] target/s390x: support PRNO_TRNG instruction
Date: Wed, 21 Sep 2022 12:07:29 +0200
Message-Id: <20220921100729.2942008-2-Jason@zx2c4.com>
In-Reply-To: <20220921100729.2942008-1-Jason@zx2c4.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order for hosts running inside of TCG to initialize the kernel's
random number generator, we should support the PRNO_TRNG instruction,
backed in the usual way with the qemu_guest_getrandom helper. This is
confirmed working on Linux 5.19.

Cc: Thomas Huth <thuth@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Harald Freudenberger <freude@linux.ibm.com>
Cc: Holger Dengler <dengler@linux.ibm.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 target/s390x/gen-features.c      |  1 +
 target/s390x/tcg/crypto_helper.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 14a7f2ae90..aaade67574 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -754,6 +754,7 @@ static uint16_t qemu_MAX[] = {
     S390_FEAT_MSA_EXT_5,
     S390_FEAT_KIMD_SHA_512,
     S390_FEAT_KLMD_SHA_512,
+    S390_FEAT_PRNO_TRNG,
 };
 
 /****** END FEATURE DEFS ******/
diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
index 02073ec70b..0daa9a2dd9 100644
--- a/target/s390x/tcg/crypto_helper.c
+++ b/target/s390x/tcg/crypto_helper.c
@@ -14,6 +14,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
+#include "qemu/guest-random.h"
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/helper-proto.h"
@@ -173,6 +174,31 @@ static int klmd_sha512(CPUS390XState *env, uintptr_t ra, uint64_t parameter_bloc
     return 0;
 }
 
+static void fill_buf_random(CPUS390XState *env, uintptr_t ra,
+                            uint64_t *buf_reg, uint64_t *len_reg)
+{
+    uint8_t tmp[256];
+    uint64_t len = *len_reg;
+    int buf_reg_len = 64;
+
+    if (!(env->psw.mask & PSW_MASK_64)) {
+        len = (uint32_t)len;
+        buf_reg_len = (env->psw.mask & PSW_MASK_32) ? 32 : 24;
+    }
+
+    while (len) {
+        size_t block = MIN(len, sizeof(tmp));
+
+        qemu_guest_getrandom_nofail(tmp, block);
+        for (size_t i = 0; i < block; ++i) {
+            cpu_stb_data_ra(env, wrap_address(env, *buf_reg), tmp[i], ra);
+            *buf_reg = deposit64(*buf_reg, 0, buf_reg_len, *buf_reg + 1);
+            --*len_reg;
+        }
+        len -= block;
+    }
+}
+
 uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
                      uint32_t type)
 {
@@ -215,6 +241,10 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
             return klmd_sha512(env, ra, env->regs[1], &env->regs[r2], &env->regs[r2 + 1]);
         }
         break;
+    case 114: /* CPACF_PRNO_TRNG */
+        fill_buf_random(env, ra, &env->regs[r1], &env->regs[r1 + 1]);
+        fill_buf_random(env, ra, &env->regs[r2], &env->regs[r2 + 1]);
+        break;
     default:
         /* we don't implement any other subfunction yet */
         g_assert_not_reached();
-- 
2.37.3


