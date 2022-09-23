Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AF75E775B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 11:40:21 +0200 (CEST)
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obfAQ-0003rA-LN
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 05:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Y8ci=Z2=zx2c4.com=Jason@kernel.org>)
 id 1obequ-000719-PL; Fri, 23 Sep 2022 05:20:16 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:56538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Y8ci=Z2=zx2c4.com=Jason@kernel.org>)
 id 1obeqq-0007Ki-TM; Fri, 23 Sep 2022 05:20:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0DB3B61D04;
 Fri, 23 Sep 2022 09:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F189C433D6;
 Fri, 23 Sep 2022 09:19:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FK3L8z2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663924790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gPYwYEb67pjplr4UpEOOowOAJzqi7SqorlQAz9104gg=;
 b=FK3L8z2fr98w1RnCtLHmkL9biiPv//mjcBTyDuWRUwHoImd6xyvc10rwSBRRtpuC1Ml/ew
 wE8rsPHwUxkTQPtg2gWsVu3hw+hB80mb3nMBaKCDkl/+hfjKfxZ9yEpPwIX0nVfzD6RACc
 kaNFrpplyb98saf1QM2L4O7aOH0qYo0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 532b88cb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 23 Sep 2022 09:19:50 +0000 (UTC)
Date: Fri, 23 Sep 2022 11:19:47 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH v8.1 1/2] target/s390x: support SHA-512 extensions
Message-ID: <Yy16Mz7+yLCV5jH8@zx2c4.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <20220922153820.221811-1-david@redhat.com>
 <abf6fbb6-14f4-8c65-f5ac-a75b9c8931dd@redhat.com>
 <98dcb657-8862-5868-3979-55fc49864904@redhat.com>
 <e8041184-cfdd-d429-0377-db6b46d4d0ef@redhat.com>
 <6bf799d5-18a1-f01c-b227-a7dc98c2c8cf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6bf799d5-18a1-f01c-b227-a7dc98c2c8cf@redhat.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=Y8ci=Z2=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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

Hi David & Thomas,

On Fri, Sep 23, 2022 at 08:37:50AM +0200, David Hildenbrand wrote:
> > But the point is that the "msa" helper is also called for other instructions
> > like PCKMO which can also be called with code 3. And there it means
> > something completely different. ... unless I completely misunderstood the
> > code, of course.
> 
> test_be_bit() fences everything off we don't support. Simply falling 
> through here and returning 0 at the end doesn't make any sense either.

Indeed you're right here, and also, there's this line in your code:

    g_assert(type == S390_FEAT_TYPE_KIMD || type == S390_FEAT_TYPE_KLMD);

which means things *are* bounded to just those types as Thomas wants
too.

> > I think I'll go with Jason's v8 (+ compat machine handling on top) for now,
> > so that we better record his state of the patch, and then we can do cleanup
> > patches on top later.

I think doing things in layered steps makes sense, so we actually have a
record of how this changes, rather than trying to sneak in huge changes
to a "v8.1" patch, which lore doesn't even understand. At the same time,
I think David's refactoring is for the most part a quite nice
improvement that we shouldn't forget about.

> 3) I won't follow up with additional cleanup patches because I already 
> spent more time on this than I originally planned.

What is this B.S.? I spent months on this code and had to poke you a
bunch to review it. You spend one afternoon with it and you're already
burnt out, apparently. Sorry to hear that. But also, something is amiss
when the volunteer completely outside his realm of expertise has a
greater commitment than the professional maintainer. Regardless, seeing
that kind of thing here doesn't make me enthusiastic about contributing
to s390 stuff in the future, in the sense that hearing "I won't work
more on this" from a maintainer is a contagious sentiment; leaders are
emulated.

The 2/2 patch doesn't even apply on top of your "v8.1 1/2", so your
submission isn't even easily apply-able.

So, here, to kick things off in the right direction, and hopefully
motivate you to send something afresh, below is a diff between v8 in its
entirety and your "v8.1 1/2" patch, so that you can send this in. It
sounds like Thomas may have already picked some of the machine version
handling stuff from that, so it might need a little readjustment, but
that's the general idea. It should be somewhat trivial to submit this
and justify the test_be_bit() stuff or that g_assert() or whatever else
separately.

Jason

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
index aaade67574..1e3b7c0dc9 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -744,13 +744,16 @@ static uint16_t qemu_V7_0[] = {
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
     S390_FEAT_MSA_EXT_5,
     S390_FEAT_KIMD_SHA_512,
     S390_FEAT_KLMD_SHA_512,
@@ -877,6 +880,7 @@ static FeatGroupDefSpec QemuFeatDef[] = {
     QEMU_FEAT_INITIALIZER(V6_0),
     QEMU_FEAT_INITIALIZER(V6_2),
     QEMU_FEAT_INITIALIZER(V7_0),
+    QEMU_FEAT_INITIALIZER(V7_1),
     QEMU_FEAT_INITIALIZER(MAX),
 };
 
diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
index 0daa9a2dd9..762b277884 100644
--- a/target/s390x/tcg/crypto_helper.c
+++ b/target/s390x/tcg/crypto_helper.c
@@ -21,13 +21,34 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 
-static uint64_t R(uint64_t x, int c) { return (x >> c) | (x << (64 - c)); }
-static uint64_t Ch(uint64_t x, uint64_t y, uint64_t z) { return (x & y) ^ (~x & z); }
-static uint64_t Maj(uint64_t x, uint64_t y, uint64_t z) { return (x & y) ^ (x & z) ^ (y & z); }
-static uint64_t Sigma0(uint64_t x) { return R(x, 28) ^ R(x, 34) ^ R(x, 39); }
-static uint64_t Sigma1(uint64_t x) { return R(x, 14) ^ R(x, 18) ^ R(x, 41); }
-static uint64_t sigma0(uint64_t x) { return R(x, 1) ^ R(x, 8) ^ (x >> 7); }
-static uint64_t sigma1(uint64_t x) { return R(x, 19) ^ R(x, 61) ^ (x >> 6); }
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
 
 static const uint64_t K[80] = {
     0x428a2f98d728ae22ULL, 0x7137449123ef65cdULL, 0xb5c0fbcfec4d3b2fULL,
@@ -59,119 +80,169 @@ static const uint64_t K[80] = {
     0x5fcb6fab3ad6faecULL, 0x6c44198c4a475817ULL
 };
 
-static int kimd_sha512(CPUS390XState *env, uintptr_t ra, uint64_t parameter_block,
-                       uint64_t *message_reg, uint64_t *len_reg, uint8_t *stack_buffer)
+/* a is icv/ocv, w is a single message block. w will get reused internally. */
+static void sha512_bda(uint64_t a[8], uint64_t w[16])
 {
-    enum { MAX_BLOCKS_PER_RUN = 64 }; /* This is arbitrary, just to keep interactivity. */
-    uint64_t z[8], b[8], a[8], w[16], t;
-    uint64_t message = message_reg ? *message_reg : 0;
-    uint64_t len = *len_reg, processed = 0, addr;
-    int i, j, message_reg_len = 64, blocks = 0, cc = 0;
+    uint64_t t, z[8], b[8];
+    int i, j;
 
-    if (!(env->psw.mask & PSW_MASK_64)) {
-        len = (uint32_t)len;
-        message_reg_len = (env->psw.mask & PSW_MASK_32) ? 32 : 24;
-    }
+    memcpy(z, a, sizeof(z));
+    for (i = 0; i < 80; i++) {
+        memcpy(b, a, sizeof(b));
 
-    for (i = 0; i < 8; ++i) {
-        addr = wrap_address(env, parameter_block + 8 * i);
-        z[i] = a[i] = cpu_ldq_be_data_ra(env, addr, ra);
-    }
-
-    while (len >= 128) {
-        if (++blocks > MAX_BLOCKS_PER_RUN) {
-            cc = 3;
-            break;
+        t = a[7] + Sigma1(a[4]) + Ch(a[4], a[5], a[6]) + K[i] + w[i % 16];
+        b[7] = t + Sigma0(a[0]) + Maj(a[0], a[1], a[2]);
+        b[3] += t;
+        for (j = 0; j < 8; ++j) {
+            a[(j + 1) % 8] = b[j];
         }
-
-        for (i = 0; i < 16; ++i) {
-            if (message) {
-                addr = wrap_address(env, message + 8 * i);
-                w[i] = cpu_ldq_be_data_ra(env, addr, ra);
-            } else {
-                w[i] = be64_to_cpu(((uint64_t *)stack_buffer)[i]);
+        if (i % 16 == 15) {
+            for (j = 0; j < 16; ++j) {
+                w[j] += w[(j + 9) % 16] + sigma0(w[(j + 1) % 16]) +
+                        sigma1(w[(j + 14) % 16]);
             }
         }
+    }
 
-        for (i = 0; i < 80; ++i) {
-            for (j = 0; j < 8; ++j) {
-                b[j] = a[j];
-            }
-            t = a[7] + Sigma1(a[4]) + Ch(a[4], a[5], a[6]) + K[i] + w[i % 16];
-            b[7] = t + Sigma0(a[0]) + Maj(a[0], a[1], a[2]);
-            b[3] += t;
-            for (j = 0; j < 8; ++j) {
-                a[(j + 1) % 8] = b[j];
-            }
-            if (i % 16 == 15) {
-                for (j = 0; j < 16; ++j) {
-                    w[j] += w[(j + 9) % 16] + sigma0(w[(j + 1) % 16]) + sigma1(w[(j + 14) % 16]);
-                }
-            }
-        }
+    for (i = 0; i < 8; i++) {
+        a[i] += z[i];
+    }
+}
 
-        for (i = 0; i < 8; ++i) {
-            a[i] += z[i];
-            z[i] = a[i];
-        }
+/* a is icv/ocv, w is a single message block that needs be64 conversion. */
+static void sha512_bda_be64(uint64_t a[8], uint64_t w[16])
+{
+    uint64_t t[16];
+    int i;
 
-        if (message) {
-            message += 128;
-        } else {
-            stack_buffer += 128;
-        }
-        len -= 128;
-        processed += 128;
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
     }
+}
+
+static void sha512_write_ocv(CPUS390XState *env, uint64_t addr,
+                             uint64_t a[8], uintptr_t ra)
+{
+    int i;
 
-    for (i = 0; i < 8; ++i) {
-        addr = wrap_address(env, parameter_block + 8 * i);
-        cpu_stq_be_data_ra(env, addr, z[i], ra);
+    for (i = 0; i < 8; i++, addr += 8) {
+        addr = wrap_address(env, addr);
+        cpu_stq_be_data_ra(env, addr, a[i], ra);
     }
+}
+
+static void sha512_read_block(CPUS390XState *env, uint64_t addr,
+                              uint64_t a[16], uintptr_t ra)
+{
+    int i;
 
-    if (message_reg) {
-        *message_reg = deposit64(*message_reg, 0, message_reg_len, message);
+    for (i = 0; i < 16; i++, addr += 8) {
+        addr = wrap_address(env, addr);
+        a[i] = cpu_ldq_be_data_ra(env, addr, ra);
     }
-    *len_reg -= processed;
-    return cc;
 }
 
-static int klmd_sha512(CPUS390XState *env, uintptr_t ra, uint64_t parameter_block,
-                        uint64_t *message_reg, uint64_t *len_reg)
+static void sha512_read_mbl_be64(CPUS390XState *env, uint64_t addr,
+                                 uint8_t a[16], uintptr_t ra)
 {
-    uint8_t x[256];
-    uint64_t i, message, len, addr;
-    int j, message_reg_len = 64, cc;
+    int i;
 
-    cc = kimd_sha512(env, ra, parameter_block, message_reg, len_reg, NULL);
-    if (cc) {
-        return cc;
+    for (i = 0; i < 16; i++, addr += 1) {
+        addr = wrap_address(env, addr);
+        a[i] = cpu_ldub_data_ra(env, addr, ra);
     }
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
 
-    message = *message_reg;
-    len = *len_reg;
     if (!(env->psw.mask & PSW_MASK_64)) {
         len = (uint32_t)len;
         message_reg_len = (env->psw.mask & PSW_MASK_32) ? 32 : 24;
     }
 
-    for (i = 0; i < len; ++i) {
-        addr = wrap_address(env, message + i);
-        x[i] = cpu_ldub_data_ra(env, addr, ra);
+    /* KIMD: length has to be properly aligned. */
+    if (type == S390_FEAT_TYPE_KIMD && !QEMU_IS_ALIGNED(len, 128)) {
+        tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
     }
-    memset(x + i, 0, sizeof(x) - i);
-    x[i] = 128;
-    i = i < 112 ? 128 : 256;
-    for (j = 0; j < 16; ++j) {
-        addr = wrap_address(env, parameter_block + 64 + j);
-        x[i - 16 + j] = cpu_ldub_data_ra(env, addr, ra);
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
     }
-    if (kimd_sha512(env, ra, parameter_block, NULL, &i, x)) {
-        g_assert_not_reached(); /* It must handle at least 2 blocks. */
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
     }
-    *message_reg = deposit64(*message_reg, 0, message_reg_len, message + len);
-    *len_reg -= len;
-    return 0;
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
 }
 
 static void fill_buf_random(CPUS390XState *env, uintptr_t ra,
@@ -234,13 +305,8 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
         }
         break;
     case 3: /* CPACF_*_SHA_512 */
-        switch (type) {
-        case S390_FEAT_TYPE_KIMD:
-            return kimd_sha512(env, ra, env->regs[1], &env->regs[r2], &env->regs[r2 + 1], NULL);
-        case S390_FEAT_TYPE_KLMD:
-            return klmd_sha512(env, ra, env->regs[1], &env->regs[r2], &env->regs[r2 + 1]);
-        }
-        break;
+        return cpacf_sha512(env, ra, env->regs[1], &env->regs[r2],
+                            &env->regs[r2 + 1], type);
     case 114: /* CPACF_PRNO_TRNG */
         fill_buf_random(env, ra, &env->regs[r1], &env->regs[r1 + 1]);
         fill_buf_random(env, ra, &env->regs[r2], &env->regs[r2 + 1]);

