Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6837057B627
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 14:11:57 +0200 (CEST)
Received: from localhost ([::1]:44294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE8YW-0001Qs-3N
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 08:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org>)
 id 1oE8Vy-0007Qf-FO; Wed, 20 Jul 2022 08:09:19 -0400
Received: from sin.source.kernel.org ([145.40.73.55]:48800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org>)
 id 1oE8Vv-0001qm-Ks; Wed, 20 Jul 2022 08:09:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 48168CE1EC5;
 Wed, 20 Jul 2022 12:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B2EC3411E;
 Wed, 20 Jul 2022 12:09:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="lknQ6mza"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658318945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OadkDGb6jJ8NYn0bAy+e0CnP5mIlwTI/CuMAN1Qq/jo=;
 b=lknQ6mzafejgSR/iW9RBwEQGG1AyBdJop3XsCueesFjODaZgj/JKwSJSOBYVFzqW1tMk5t
 cTNm7P/utYrrsCv8QlrKkqrNJzE+eZ5LX+Iz6krrpxuIKwTyIRYwJd1zAfvo+lyPIRsbWW
 Nsc1uy2PbkN+8GQhH0Odv0EY/sgbxg4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id aa49ecb3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 20 Jul 2022 12:09:05 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: david@redhat.com,
	qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: [PATCH v3] target/s390x: support PRNO_TRNG instruction
Date: Wed, 20 Jul 2022 14:08:59 +0200
Message-Id: <20220720120859.339788-1-Jason@zx2c4.com>
In-Reply-To: <Ytft08S2eGaYVwC3@zx2c4.com>
References: <Ytft08S2eGaYVwC3@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.73.55;
 envelope-from=SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org;
 helo=sin.source.kernel.org
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
Cc: David Hildenbrand <david@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Harald Freudenberger <freude@linux.ibm.com>
Cc: Holger Dengler <dengler@linux.ibm.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 target/s390x/cpu_models.c        |  2 --
 target/s390x/gen-features.c      |  2 ++
 target/s390x/tcg/crypto_helper.c | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 1a562d2801..90aac3d795 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -421,8 +421,6 @@ static void check_consistency(const S390CPUModel *model)
         { S390_FEAT_DFP_FAST, S390_FEAT_DFP },
         { S390_FEAT_TRANSACTIONAL_EXE, S390_FEAT_STFLE_49 },
         { S390_FEAT_EDAT_2, S390_FEAT_EDAT},
-        { S390_FEAT_MSA_EXT_5, S390_FEAT_KIMD_SHA_512 },
-        { S390_FEAT_MSA_EXT_5, S390_FEAT_KLMD_SHA_512 },
         { S390_FEAT_MSA_EXT_4, S390_FEAT_MSA_EXT_3 },
         { S390_FEAT_SIE_CMMA, S390_FEAT_CMM },
         { S390_FEAT_SIE_CMMA, S390_FEAT_SIE_GSLS },
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
index 138d9e7ad9..afd29f9cf0 100644
--- a/target/s390x/tcg/crypto_helper.c
+++ b/target/s390x/tcg/crypto_helper.c
@@ -12,12 +12,38 @@
 
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
+#include "qemu/guest-random.h"
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 
+static void fill_buf_random(CPUS390XState *env, uintptr_t ra,
+                            uint64_t *buf_reg, uint64_t *len_reg)
+{
+        uint8_t tmp[256];
+        uint64_t len = *len_reg;
+        int reg_len = 64;
+
+        if (!(env->psw.mask & PSW_MASK_64)) {
+                len = (uint32_t)len;
+                reg_len = (env->psw.mask & PSW_MASK_32) ? 32 : 24;
+        }
+
+        while (len) {
+                size_t block = MIN(len, sizeof(tmp));
+
+                qemu_guest_getrandom_nofail(tmp, block);
+                for (size_t i = 0; i < block; ++i) {
+                        cpu_stb_data_ra(env, wrap_address(env, *buf_reg), tmp[i], ra);
+                        *buf_reg = deposit64(*buf_reg, 0, reg_len, *buf_reg + 1);
+                        --*len_reg;
+                }
+                len -= block;
+        }
+}
+
 uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
                      uint32_t type)
 {
@@ -52,6 +78,12 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
             cpu_stb_data_ra(env, param_addr, subfunc[i], ra);
         }
         break;
+    case 114:
+        if (r1 & 1 || !r1 || r2 & 1 || !r2)
+                tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
+        fill_buf_random(env, ra, &env->regs[r1], &env->regs[r1 + 1]);
+        fill_buf_random(env, ra, &env->regs[r2], &env->regs[r2 + 1]);
+        break;
     default:
         /* we don't implement any other subfunction yet */
         g_assert_not_reached();
-- 
2.35.1


