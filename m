Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07604DDA71
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:25:40 +0100 (CET)
Received: from localhost ([::1]:52306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCbr-0000QE-Of
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:25:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZX-00065W-Gz
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:15 -0400
Received: from [2a00:1450:4864:20::42e] (port=33498
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZV-0002AA-Ft
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:15 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q8so375064wrc.0
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sZcL+Wbj6slBsTzTO2VnzoIMTdTpCTOv2c0DRnm/DMk=;
 b=W6z2TYK0zbETR2UpVmVS9zpyUfTBhJG5XpzZhLispiIp/JFVFC2SRuKsjoN7yWq2o0
 h+5fhjCAqHAxPR+N4inVN0N97OIKxOnzWkPufJ70qAQFkyJ/32/+zWbBiR0jmde2SN9O
 9uMvigBSrHWGvGCoAoDAG4MhV1t7/UjYcIVN7EHMhBR6GFy2aBaihiCjKKzdKq16Voxy
 EWkNf4AtPKyk6agkeozErGo0CAYkWjZbr/aaVEHvXN1mUMZWwgfyfJUl8ymGfVzjPiP5
 1y52v4BHThgYQ9OpTpEJgOnZoDt/Tt5exj1eHIX6vffgguUJd68t+qTQRlvtYi9U6P2O
 gH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sZcL+Wbj6slBsTzTO2VnzoIMTdTpCTOv2c0DRnm/DMk=;
 b=zaMbHWBzahEDul5YCUS4LUba3YvpHYwk3dgsd0tq4yHdnO2Dp1VQn69wzURkDfF639
 bOywM+pb7Y/kqspHN3IAUT3fP5ZXzwPbTpjpFqbgXj7xrl1BuZIWGIi5sfDOR78Tx0+R
 j2EXA8VLgLNDboAapwuLmlIaSO4vpvv8oAKK8lVh+40tl1Q5YBBfOjtqm1kf5sYH22bY
 HgYuv9tpkDaygVbKxsJWb/7YzijyNloL0wdiq8g1Yf0AHodcgPFHg6Et2bc3VJA4Cxe2
 XA1mn7cVnb4CFh8/0tk/vqJsA1VCw/Y3Ssa6N0uwAtGnBMqQE8tHW1Aj2DzcEgEta861
 uqjA==
X-Gm-Message-State: AOAM532xvhdQcLEHyeKqpIm+0sfXyIawqL5rdR9r6eO1Ca4x7THRNgMv
 SmcH4htkTcbD5P6WWDCm4tSCcYp0A3pedw==
X-Google-Smtp-Source: ABdhPJxAXW6pfMY3LMAeOaEvElquZJrAFP++VB17JKlS6h26N4/EAmM3NN1WxCDwtkQt1q736iSsZA==
X-Received: by 2002:a5d:47a7:0:b0:203:d1b4:8f6 with SMTP id
 7-20020a5d47a7000000b00203d1b408f6mr8346983wrb.36.1647609792104; 
 Fri, 18 Mar 2022 06:23:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/21] target/arm: Fix sve2 ldnt1 and stnt1
Date: Fri, 18 Mar 2022 13:22:46 +0000
Message-Id: <20220318132306.3254960-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

For both ldnt1 and stnt1, the meaning of the Rn and Rm are different
from ld1 and st1: the vector and integer registers are reversed, and
the integer register 31 refers to XZR instead of SP.

Secondly, the 64-bit version of ldnt1 was being interpreted as
32-bit unpacked unscaled offset instead of 64-bit unscaled offset,
which discarded the upper 32 bits of the address coming from
the vector argument.

Thirdly, validate that the memory element size is in range for the
vector element size for ldnt1.  For ld1, we do this via independent
decode patterns, but for ldnt1 we need to do it manually.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/826
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220308031655.240710-1-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode             |  5 ++-
 target/arm/translate-sve.c        | 51 +++++++++++++++++++++++++++++--
 tests/tcg/aarch64/test-826.c      | 50 ++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  4 +++
 tests/tcg/configure.sh            |  4 +++
 5 files changed, 109 insertions(+), 5 deletions(-)
 create mode 100644 tests/tcg/aarch64/test-826.c

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index c60b9f0fec5..0388cce3bd9 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1575,10 +1575,9 @@ USDOT_zzzz      01000100 .. 0 ..... 011 110 ..... .....  @rda_rn_rm
 
 ### SVE2 Memory Gather Load Group
 
-# SVE2 64-bit gather non-temporal load
-#   (scalar plus unpacked 32-bit unscaled offsets)
+# SVE2 64-bit gather non-temporal load (scalar plus 64-bit unscaled offsets)
 LDNT1_zprz      1100010 msz:2 00 rm:5 1 u:1 0 pg:3 rn:5 rd:5 \
-                &rprr_gather_load xs=0 esz=3 scale=0 ff=0
+                &rprr_gather_load xs=2 esz=3 scale=0 ff=0
 
 # SVE2 32-bit gather non-temporal load (scalar plus 32-bit unscaled offsets)
 LDNT1_zprz      1000010 msz:2 00 rm:5 10 u:1 pg:3 rn:5 rd:5 \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 33ca1bcfac3..2c23459e768 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6487,10 +6487,33 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
 
 static bool trans_LDNT1_zprz(DisasContext *s, arg_LD1_zprz *a)
 {
+    gen_helper_gvec_mem_scatter *fn = NULL;
+    bool be = s->be_data == MO_BE;
+    bool mte = s->mte_active[0];
+
+    if (a->esz < a->msz + !a->u) {
+        return false;
+    }
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return trans_LD1_zprz(s, a);
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    switch (a->esz) {
+    case MO_32:
+        fn = gather_load_fn32[mte][be][0][0][a->u][a->msz];
+        break;
+    case MO_64:
+        fn = gather_load_fn64[mte][be][0][2][a->u][a->msz];
+        break;
+    }
+    assert(fn != NULL);
+
+    do_mem_zpz(s, a->rd, a->pg, a->rn, 0,
+               cpu_reg(s, a->rm), a->msz, false, fn);
+    return true;
 }
 
 /* Indexed by [mte][be][xs][msz].  */
@@ -6647,10 +6670,34 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
 
 static bool trans_STNT1_zprz(DisasContext *s, arg_ST1_zprz *a)
 {
+    gen_helper_gvec_mem_scatter *fn;
+    bool be = s->be_data == MO_BE;
+    bool mte = s->mte_active[0];
+
+    if (a->esz < a->msz) {
+        return false;
+    }
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return trans_ST1_zprz(s, a);
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    switch (a->esz) {
+    case MO_32:
+        fn = scatter_store_fn32[mte][be][0][a->msz];
+        break;
+    case MO_64:
+        fn = scatter_store_fn64[mte][be][2][a->msz];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    do_mem_zpz(s, a->rd, a->pg, a->rn, 0,
+               cpu_reg(s, a->rm), a->msz, true, fn);
+    return true;
 }
 
 /*
diff --git a/tests/tcg/aarch64/test-826.c b/tests/tcg/aarch64/test-826.c
new file mode 100644
index 00000000000..f59740a8c50
--- /dev/null
+++ b/tests/tcg/aarch64/test-826.c
@@ -0,0 +1,50 @@
+#include <sys/mman.h>
+#include <unistd.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <assert.h>
+
+static void *expected;
+
+void sigsegv(int sig, siginfo_t *info, void *vuc)
+{
+    ucontext_t *uc = vuc;
+
+    assert(info->si_addr == expected);
+    uc->uc_mcontext.pc += 4;
+}
+
+int main()
+{
+    struct sigaction sa = {
+        .sa_sigaction = sigsegv,
+        .sa_flags = SA_SIGINFO
+    };
+
+    void *page;
+    long ofs;
+
+    if (sigaction(SIGSEGV, &sa, NULL) < 0) {
+        perror("sigaction");
+        return EXIT_FAILURE;
+    }
+
+    page = mmap(0, getpagesize(), PROT_NONE, MAP_PRIVATE | MAP_ANON, -1, 0);
+    if (page == MAP_FAILED) {
+        perror("mmap");
+        return EXIT_FAILURE;
+    }
+
+    ofs = 0x124;
+    expected = page + ofs;
+
+    asm("ptrue p0.d, vl1\n\t"
+        "dup z0.d, %0\n\t"
+        "ldnt1h {z1.d}, p0/z, [z0.d, %1]\n\t"
+        "dup z1.d, %1\n\t"
+        "ldnt1h {z0.d}, p0/z, [z1.d, %0]"
+        : : "r"(page), "r"(ofs) : "v0", "v1");
+
+    return EXIT_SUCCESS;
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index ac07acde66d..f7121cb4d88 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -86,7 +86,11 @@ run-gdbstub-sve-ioctls: sve-ioctls
 
 EXTRA_RUNS += run-gdbstub-sysregs run-gdbstub-sve-ioctls
 endif
+endif
 
+ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_SVE2),)
+AARCH64_TESTS += test-826
+test-826: CFLAGS+=-march=armv8.1-a+sve2
 endif
 
 TESTS += $(AARCH64_TESTS)
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index ed4b5ccb1f0..84f928f7f87 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -299,6 +299,10 @@ for target in $target_list; do
                              -march=armv8.1-a+sve -o $TMPE $TMPC; then
                   echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
               fi
+              if do_compiler "$target_compiler" $target_compiler_cflags \
+                             -march=armv8.1-a+sve2 -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_SVE2=y" >> $config_target_mak
+              fi
               if do_compiler "$target_compiler" $target_compiler_cflags \
                              -march=armv8.3-a -o $TMPE $TMPC; then
                   echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
-- 
2.25.1


