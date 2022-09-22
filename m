Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5222A5E683F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:16:32 +0200 (CEST)
Received: from localhost ([::1]:53992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOsI-0006UO-NY
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obOHa-000324-H5
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:38:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obOHW-0001El-Qc
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663861110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVnpn8ydbcRwP9yvX46kbXQrsTQ+4T/JCWlwccpKF1c=;
 b=hkSyBWWrShVVLGGTHmFyLehICyKL+juCg+s0crcqFzc6h58cghslZJSPYiLm8lBCW+SsR4
 ZFnmRBlc+8JNrfn1AScaMDBPAZPzU6GCutjWBA8Nfn3TQsACgvE9BC+qxMhe2cpjyqHUJ/
 XKtL+Ns3g7huB4G9XOm8cQ6yC4SKsJk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-qxWbRNTBObyXye20gkhvFQ-1; Thu, 22 Sep 2022 11:38:26 -0400
X-MC-Unique: qxWbRNTBObyXye20gkhvFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68CE1185A78B;
 Thu, 22 Sep 2022 15:38:25 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E30E40C6EC2;
 Thu, 22 Sep 2022 15:38:21 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: [PATCH v8.1 1/2] target/s390x: support SHA-512 extensions
Date: Thu, 22 Sep 2022 17:38:20 +0200
Message-Id: <20220922153820.221811-1-david@redhat.com>
In-Reply-To: <20220921100729.2942008-1-Jason@zx2c4.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

In order to fully support MSA_EXT_5, we have to support the SHA-512
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
[ restructure, add missing exception, add comments, fixup CPU model ]
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/s390x/s390-virtio-ccw.c       |   3 +
 target/s390x/gen-features.c      |   9 +-
 target/s390x/tcg/crypto_helper.c | 229 +++++++++++++++++++++++++++++++
 3 files changed, 240 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 9a2467c889..e18b816aba 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -803,8 +803,11 @@ DEFINE_CCW_MACHINE(7_2, "7.2", true);
 
 static void ccw_machine_7_1_instance_options(MachineState *machine)
 {
+    static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V7_1 };
+
     ccw_machine_7_2_instance_options(machine);
     s390_cpudef_featoff_greater(16, 1, S390_FEAT_PAIE);
+    s390_set_qemu_cpu_model(0x8561, 15, 1, qemu_cpu_feat);
 }
 
 static void ccw_machine_7_1_class_options(MachineClass *mc)
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 1558c52626..baadbf4517 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -744,13 +744,19 @@ static uint16_t qemu_V7_0[] = {
     S390_FEAT_MISC_INSTRUCTION_EXT3,
 };
 
+static uint16_t qemu_V7_1[] = {
+    S390_FEAT_VECTOR_ENH2,
+};
+
 /*
  * Features for the "qemu" CPU model of the latest QEMU machine and the "max"
  * CPU model under TCG. Don't include features that are not part of the full
  * feature set of the current "max" CPU model generation.
  */
 static uint16_t qemu_MAX[] = {
-    S390_FEAT_VECTOR_ENH2,
+    S390_FEAT_MSA_EXT_5,
+    S390_FEAT_KIMD_SHA_512,
+    S390_FEAT_KLMD_SHA_512,
 };
 
 /****** END FEATURE DEFS ******/
@@ -873,6 +879,7 @@ static FeatGroupDefSpec QemuFeatDef[] = {
     QEMU_FEAT_INITIALIZER(V6_0),
     QEMU_FEAT_INITIALIZER(V6_2),
     QEMU_FEAT_INITIALIZER(V7_0),
+    QEMU_FEAT_INITIALIZER(V7_1),
     QEMU_FEAT_INITIALIZER(MAX),
 };
 
diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
index 138d9e7ad9..106c89fd2d 100644
--- a/target/s390x/tcg/crypto_helper.c
+++ b/target/s390x/tcg/crypto_helper.c
@@ -1,10 +1,12 @@
 /*
  *  s390x crypto helpers
  *
+ *  Copyright (C) 2022 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  *  Copyright (c) 2017 Red Hat Inc
  *
  *  Authors:
  *   David Hildenbrand <david@redhat.com>
+ *   Jason A. Donenfeld <Jason@zx2c4.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
@@ -18,6 +20,230 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 
+static uint64_t R(uint64_t x, int c)
+{
+    return (x >> c) | (x << (64 - c));
+}
+static uint64_t Ch(uint64_t x, uint64_t y, uint64_t z)
+{
+    return (x & y) ^ (~x & z);
+}
+static uint64_t Maj(uint64_t x, uint64_t y, uint64_t z)
+{
+    return (x & y) ^ (x & z) ^ (y & z);
+}
+static uint64_t Sigma0(uint64_t x)
+{
+    return R(x, 28) ^ R(x, 34) ^ R(x, 39);
+}
+static uint64_t Sigma1(uint64_t x)
+{
+    return R(x, 14) ^ R(x, 18) ^ R(x, 41);
+}
+static uint64_t sigma0(uint64_t x)
+{
+    return R(x, 1) ^ R(x, 8) ^ (x >> 7);
+}
+static uint64_t sigma1(uint64_t x)
+{
+    return R(x, 19) ^ R(x, 61) ^ (x >> 6);
+}
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
+/* a is icv/ocv, w is a single message block. w will get reused internally. */
+static void sha512_bda(uint64_t a[8], uint64_t w[16])
+{
+    uint64_t t, z[8], b[8];
+    int i, j;
+
+    memcpy(z, a, sizeof(z));
+    for (i = 0; i < 80; i++) {
+        memcpy(b, a, sizeof(b));
+
+        t = a[7] + Sigma1(a[4]) + Ch(a[4], a[5], a[6]) + K[i] + w[i % 16];
+        b[7] = t + Sigma0(a[0]) + Maj(a[0], a[1], a[2]);
+        b[3] += t;
+        for (j = 0; j < 8; ++j) {
+            a[(j + 1) % 8] = b[j];
+        }
+        if (i % 16 == 15) {
+            for (j = 0; j < 16; ++j) {
+                w[j] += w[(j + 9) % 16] + sigma0(w[(j + 1) % 16]) +
+                        sigma1(w[(j + 14) % 16]);
+            }
+        }
+    }
+
+    for (i = 0; i < 8; i++) {
+        a[i] += z[i];
+    }
+}
+
+/* a is icv/ocv, w is a single message block that needs be64 conversion. */
+static void sha512_bda_be64(uint64_t a[8], uint64_t w[16])
+{
+    uint64_t t[16];
+    int i;
+
+    for (i = 0; i < 16; i++) {
+        t[i] = be64_to_cpu(w[i]);
+    }
+    sha512_bda(a, t);
+}
+
+static void sha512_read_icv(CPUS390XState *env, uint64_t addr,
+                            uint64_t a[8], uintptr_t ra)
+{
+    int i;
+
+    for (i = 0; i < 8; i++, addr += 8) {
+        addr = wrap_address(env, addr);
+        a[i] = cpu_ldq_be_data_ra(env, addr, ra);
+    }
+}
+
+static void sha512_write_ocv(CPUS390XState *env, uint64_t addr,
+                             uint64_t a[8], uintptr_t ra)
+{
+    int i;
+
+    for (i = 0; i < 8; i++, addr += 8) {
+        addr = wrap_address(env, addr);
+        cpu_stq_be_data_ra(env, addr, a[i], ra);
+    }
+}
+
+static void sha512_read_block(CPUS390XState *env, uint64_t addr,
+                              uint64_t a[16], uintptr_t ra)
+{
+    int i;
+
+    for (i = 0; i < 16; i++, addr += 8) {
+        addr = wrap_address(env, addr);
+        a[i] = cpu_ldq_be_data_ra(env, addr, ra);
+    }
+}
+
+static void sha512_read_mbl_be64(CPUS390XState *env, uint64_t addr,
+                                 uint8_t a[16], uintptr_t ra)
+{
+    int i;
+
+    for (i = 0; i < 16; i++, addr += 1) {
+        addr = wrap_address(env, addr);
+        a[i] = cpu_ldub_data_ra(env, addr, ra);
+    }
+}
+
+static int cpacf_sha512(CPUS390XState *env, uintptr_t ra, uint64_t param_addr,
+                      uint64_t *message_reg, uint64_t *len_reg, uint32_t type)
+{
+    enum { MAX_BLOCKS_PER_RUN = 64 }; /* Arbitrary: keep interactivity. */
+    uint64_t len = *len_reg, a[8], processed = 0;
+    int i, message_reg_len = 64;
+
+    g_assert(type == S390_FEAT_TYPE_KIMD || type == S390_FEAT_TYPE_KLMD);
+
+    if (!(env->psw.mask & PSW_MASK_64)) {
+        len = (uint32_t)len;
+        message_reg_len = (env->psw.mask & PSW_MASK_32) ? 32 : 24;
+    }
+
+    /* KIMD: length has to be properly aligned. */
+    if (type == S390_FEAT_TYPE_KIMD && !QEMU_IS_ALIGNED(len, 128)) {
+        tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
+    }
+
+    sha512_read_icv(env, param_addr, a, ra);
+
+    /* Process full blocks first. */
+    for (; len >= 128; len -= 128, processed += 128) {
+        uint64_t w[16];
+
+        if (processed >= MAX_BLOCKS_PER_RUN * 128) {
+            break;
+        }
+
+        sha512_read_block(env, *message_reg + processed, w, ra);
+        sha512_bda(a, w);
+    }
+
+    /* KLMD: Process partial/empty block last. */
+    if (type == S390_FEAT_TYPE_KLMD && len < 128) {
+        uint8_t x[128];
+
+        /* Read the remainder of the message byte-per-byte. */
+        for (i = 0; i < len; i++) {
+            uint64_t addr = wrap_address(env, *message_reg + processed + i);
+
+            x[i] = cpu_ldub_data_ra(env, addr, ra);
+        }
+        /* Pad the remainder with zero and set the top bit. */
+        memset(x + len, 0, 128 - len);
+        x[len] = 128;
+
+        /*
+         * Place the MBL either into this block (if there is space left),
+         * or use an additional one.
+         */
+        if (len < 112) {
+            sha512_read_mbl_be64(env, param_addr + 64, x + 112, ra);
+        }
+        sha512_bda_be64(a, (uint64_t *)x);
+
+        if (len >= 112) {
+            memset(x, 0, 112);
+            sha512_read_mbl_be64(env, param_addr + 64, x + 112, ra);
+            sha512_bda_be64(a, (uint64_t *)x);
+        }
+
+        processed += len;
+        len = 0;
+    }
+
+    /*
+     * Modify memory after we read all inputs and modify registers only after
+     * writing memory succeeded.
+     *
+     * TODO: if writing fails halfway through (e.g., when crossing page
+     * boundaries), we're in trouble. We'd need something like access_prepare().
+     */
+    sha512_write_ocv(env, param_addr, a, ra);
+    *message_reg = deposit64(*message_reg, 0, message_reg_len,
+                             *message_reg + processed);
+    *len_reg -= processed;
+    return !len ? 0 : 3;
+}
+
 uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
                      uint32_t type)
 {
@@ -52,6 +278,9 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
             cpu_stb_data_ra(env, param_addr, subfunc[i], ra);
         }
         break;
+    case 3: /* CPACF_*_SHA_512 */
+        return cpacf_sha512(env, ra, env->regs[1], &env->regs[r2],
+                            &env->regs[r2 + 1], type);
     default:
         /* we don't implement any other subfunction yet */
         g_assert_not_reached();
-- 
2.37.3


