Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1966B588243
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 21:07:57 +0200 (CEST)
Received: from localhost ([::1]:32994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIxFE-0004hJ-8H
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 15:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org>)
 id 1oIx8M-00038c-Rw; Tue, 02 Aug 2022 15:00:51 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:59032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org>)
 id 1oIx8K-0000vw-V4; Tue, 02 Aug 2022 15:00:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8EB07B82028;
 Tue,  2 Aug 2022 19:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6C1C433D6;
 Tue,  2 Aug 2022 19:00:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="SkCt7q5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659466837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1ys2bGy+k+9n9xhnl9X/W6pXDNeBCtJSXviMTPKi/4=;
 b=SkCt7q5yqL/xltoKM8olQjnRS28WHPEAqOK9qwEabXpb7+lEj7jf3EyFEbYRwZ7IfpYzzr
 4pLyO+4DlSO4605PULMbVt4j3bHZgdBhVJALaPugmNxH73YrC0xb+y+neC8zJZ+qHogUc2
 kvxiZVwcCjDn2SrdTka7xmXynXDAf6A=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 56df90cc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 2 Aug 2022 19:00:36 +0000 (UTC)
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
Subject: [PATCH v4 2/2] target/s390x: support SHA-512 extensions
Date: Tue,  2 Aug 2022 21:00:11 +0200
Message-Id: <20220802190011.458871-3-Jason@zx2c4.com>
In-Reply-To: <20220802190011.458871-1-Jason@zx2c4.com>
References: <Yul0G2YCKLXiypvv@zx2c4.com>
 <20220802190011.458871-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org;
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

In order to fully support MSA_EXT_5, we have to also support the SHA-512
special instructions. So implement those.

The implementation began as something TweetNacl-like, and then was
adjusted to be useful here. It's not very beautiful, but it is quite
short and compact, which is what we're going for.

Cc: Thomas Huth <thuth@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Harald Freudenberger <freude@linux.ibm.com>
Cc: Holger Dengler <dengler@linux.ibm.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 target/s390x/gen-features.c      |   2 +
 target/s390x/tcg/crypto_helper.c | 116 +++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 3d333e2789..b6d804fa6d 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -751,6 +751,8 @@ static uint16_t qemu_MAX[] = {
     S390_FEAT_VECTOR_ENH2,
     S390_FEAT_MSA_EXT_5,
     S390_FEAT_PRNO_TRNG,
+    S390_FEAT_KIMD_SHA_512,
+    S390_FEAT_KLMD_SHA_512,
 };
 
 /****** END FEATURE DEFS ******/
diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
index 8ad4ef1ace..475627aa83 100644
--- a/target/s390x/tcg/crypto_helper.c
+++ b/target/s390x/tcg/crypto_helper.c
@@ -19,6 +19,112 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 
+static uint64_t R(uint64_t x, int c) { return (x >> c) | (x << (64 - c)); }
+static uint64_t Ch(uint64_t x, uint64_t y, uint64_t z) { return (x & y) ^ (~x & z); }
+static uint64_t Maj(uint64_t x, uint64_t y, uint64_t z) { return (x & y) ^ (x & z) ^ (y & z); }
+static uint64_t Sigma0(uint64_t x) { return R(x, 28) ^ R(x, 34) ^ R(x, 39); }
+static uint64_t Sigma1(uint64_t x) { return R(x, 14) ^ R(x, 18) ^ R(x, 41); }
+static uint64_t sigma0(uint64_t x) { return R(x, 1) ^ R(x, 8) ^ (x >> 7); }
+static uint64_t sigma1(uint64_t x) { return R(x, 19) ^ R(x, 61) ^ (x >> 6); }
+
+static const uint64_t K[80] = {
+    0x428a2f98d728ae22ULL, 0x7137449123ef65cdULL, 0xb5c0fbcfec4d3b2fULL,
+    0xe9b5dba58189dbbcULL, 0x3956c25bf348b538ULL, 0x59f111f1b605d019ULL,
+    0x923f82a4af194f9bULL, 0xab1c5ed5da6d8118ULL, 0xd807aa98a3030242ULL,
+    0x12835b0145706fbeULL, 0x243185be4ee4b28cULL, 0x550c7dc3d5ffb4e2ULL,
+    0x72be5d74f27b896fULL, 0x80deb1fe3b1696b1ULL, 0x9bdc06a725c71235ULL,
+    0xc19bf174cf692694ULL, 0xe49b69c19ef14ad2ULL, 0xefbe4786384f25e3ULL,
+    0x0fc19dc68b8cd5b5ULL, 0x240ca1cc77ac9c65ULL, 0x2de92c6f592b0275ULL,
+    0x4a7484aa6ea6e483ULL, 0x5cb0a9dcbd41fbd4ULL, 0x76f988da831153b5ULL,
+    0x983e5152ee66dfabULL, 0xa831c66d2db43210ULL, 0xb00327c898fb213fULL,
+    0xbf597fc7beef0ee4ULL, 0xc6e00bf33da88fc2ULL, 0xd5a79147930aa725ULL,
+    0x06ca6351e003826fULL, 0x142929670a0e6e70ULL, 0x27b70a8546d22ffcULL,
+    0x2e1b21385c26c926ULL, 0x4d2c6dfc5ac42aedULL, 0x53380d139d95b3dfULL,
+    0x650a73548baf63deULL, 0x766a0abb3c77b2a8ULL, 0x81c2c92e47edaee6ULL,
+    0x92722c851482353bULL, 0xa2bfe8a14cf10364ULL, 0xa81a664bbc423001ULL,
+    0xc24b8b70d0f89791ULL, 0xc76c51a30654be30ULL, 0xd192e819d6ef5218ULL,
+    0xd69906245565a910ULL, 0xf40e35855771202aULL, 0x106aa07032bbd1b8ULL,
+    0x19a4c116b8d2d0c8ULL, 0x1e376c085141ab53ULL, 0x2748774cdf8eeb99ULL,
+    0x34b0bcb5e19b48a8ULL, 0x391c0cb3c5c95a63ULL, 0x4ed8aa4ae3418acbULL,
+    0x5b9cca4f7763e373ULL, 0x682e6ff3d6b2b8a3ULL, 0x748f82ee5defb2fcULL,
+    0x78a5636f43172f60ULL, 0x84c87814a1f0ab72ULL, 0x8cc702081a6439ecULL,
+    0x90befffa23631e28ULL, 0xa4506cebde82bde9ULL, 0xbef9a3f7b2c67915ULL,
+    0xc67178f2e372532bULL, 0xca273eceea26619cULL, 0xd186b8c721c0c207ULL,
+    0xeada7dd6cde0eb1eULL, 0xf57d4f7fee6ed178ULL, 0x06f067aa72176fbaULL,
+    0x0a637dc5a2c898a6ULL, 0x113f9804bef90daeULL, 0x1b710b35131c471bULL,
+    0x28db77f523047d84ULL, 0x32caab7b40c72493ULL, 0x3c9ebe0a15c9bebcULL,
+    0x431d67c49c100d4cULL, 0x4cc5d4becb3e42b6ULL, 0x597f299cfc657e2aULL,
+    0x5fcb6fab3ad6faecULL, 0x6c44198c4a475817ULL
+};
+
+static void kimd_sha512(CPUS390XState *env, uintptr_t ra, uint64_t parameter_block,
+                        uint64_t *message_reg, uint64_t *len_reg, uint8_t *stack_buffer)
+{
+    uint64_t z[8], b[8], a[8], w[16], t;
+    int i, j;
+
+    for (i = 0; i < 8; ++i)
+        z[i] = a[i] = cpu_ldq_be_data_ra(env, wrap_address(env, parameter_block + 8 * i), ra);
+
+    while (*len_reg >= 128) {
+        for (i = 0; i < 16; ++i) {
+            if (message_reg)
+                w[i] = cpu_ldq_be_data_ra(env, wrap_address(env, *message_reg + 8 * i), ra);
+            else
+                w[i] = be64_to_cpu(((uint64_t *)stack_buffer)[i]);
+        }
+
+        for (i = 0; i < 80; ++i) {
+            for (j = 0; j < 8; ++j)
+                b[j] = a[j];
+            t = a[7] + Sigma1(a[4]) + Ch(a[4], a[5], a[6]) + K[i] + w[i % 16];
+            b[7] = t + Sigma0(a[0]) + Maj(a[0], a[1], a[2]);
+            b[3] += t;
+            for (j = 0; j < 8; ++j)
+                a[(j + 1) % 8] = b[j];
+            if (i % 16 == 15) {
+                for (j = 0; j < 16; ++j)
+                    w[j] += w[(j + 9) % 16] + sigma0(w[(j + 1) % 16]) +
+                            sigma1(w[(j + 14) % 16]);
+            }
+        }
+
+        for (i = 0; i < 8; ++i) {
+            a[i] += z[i];
+            z[i] = a[i];
+        }
+
+        if (message_reg)
+            *message_reg += 128;
+        else
+            stack_buffer += 128;
+        *len_reg -= 128;
+    }
+
+    for (i = 0; i < 8; ++i)
+        cpu_stq_be_data_ra(env, wrap_address(env, parameter_block + 8 * i), z[i], ra);
+}
+
+static void klmd_sha512(CPUS390XState *env, uintptr_t ra, uint64_t parameter_block,
+                        uint64_t *message_reg, uint64_t *len_reg)
+{
+    uint8_t x[256];
+    uint64_t i;
+    int j;
+
+    kimd_sha512(env, ra, parameter_block, message_reg, len_reg, NULL);
+    for (i = 0; i < *len_reg; ++i)
+        x[i] = cpu_ldub_data_ra(env, wrap_address(env, *message_reg + i), ra);
+    *message_reg += *len_reg;
+    *len_reg = 0;
+    memset(x + i, 0, sizeof(x) - i);
+    x[i] = 128;
+    i = i < 112 ? 128 : 256;
+    for (j = 0; j < 16; ++j)
+        x[i - 16 + j] = cpu_ldub_data_ra(env, wrap_address(env, parameter_block + 64 + j), ra);
+    kimd_sha512(env, ra, parameter_block, NULL, &i, x);
+}
+
 static void fill_buf_random(CPUS390XState *env, uintptr_t ra,
                             uint64_t *buf_reg, uint64_t *len_reg)
 {
@@ -78,6 +184,16 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
             cpu_stb_data_ra(env, param_addr, subfunc[i], ra);
         }
         break;
+    case 3: /* CPACF_*_SHA_512 */
+        switch (type) {
+        case S390_FEAT_TYPE_KIMD:
+            kimd_sha512(env, ra, env->regs[1], &env->regs[r2], &env->regs[r2 + 1], NULL);
+            break;
+        case S390_FEAT_TYPE_KLMD:
+            klmd_sha512(env, ra, env->regs[1], &env->regs[r2], &env->regs[r2 + 1]);
+            break;
+        }
+        break;
     case 114: /* CPACF_PRNO_TRNG */
         fill_buf_random(env, ra, &env->regs[r1], &env->regs[r1 + 1]);
         fill_buf_random(env, ra, &env->regs[r2], &env->regs[r2 + 1]);
-- 
2.35.1


