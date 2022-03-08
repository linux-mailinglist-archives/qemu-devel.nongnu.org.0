Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3AD4D0E40
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 04:17:56 +0100 (CET)
Received: from localhost ([::1]:44338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRQMF-0002iE-1u
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 22:17:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRQLQ-00023I-T0
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 22:17:04 -0500
Received: from [2607:f8b0:4864:20::52c] (port=35690
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRQLN-0003hh-78
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 22:17:04 -0500
Received: by mail-pg1-x52c.google.com with SMTP id e6so15251886pgn.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 19:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WGpBiuxkYDy2QqVFmBdSCdMA/haDSHr6IWIkXWGMiDk=;
 b=l+flD66x/PNwDCPn2PDq/CWIsduFs0Z04vvDsfQYH64zWlcmdcJVEKpRu3o9CkEZeS
 uM8Q9jZRQ8UkwDmxKpJFssOcWG9KZzkQeZxI/e17kbtTLlN5S5GF3xfIqJLQD+lVvrZo
 LYRBHFknmRfPBGqCNLatgEK/8JdtoOIAIdB0Y9XIPggIS6g7OQkXkyQZSdUwesSeEeh1
 rRMV9R4BU7Qs6tfjAk/DrcvoXwYznnYIzv+kLgMbOHwmAyGAbkr+Etqjw01IIMDFaZ0V
 CVu+Xxq/JfoJG4hgu0nGLUQMATyn4+sZkjhRfB9AAvugjFXDyj7mmShp1scXyrJUHEa2
 YmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WGpBiuxkYDy2QqVFmBdSCdMA/haDSHr6IWIkXWGMiDk=;
 b=QEZzeVdhuYGI8U+3eXnB4V1P77F1v0omqO6JYb8dBz6/w6+eOkIbMzmIGmjgc/uVoY
 xI17CC/0HWeyn0TDzTDne3+zOes+/RL6kBR/Ykl0t5Sy3Ej3r5i6sz1E13a4JsLRksIS
 KpnCrvGYNAlunrSwSffw+n4UasOEsVtzIv8Y35rQ0SZRGQbeapr85E4vqjhYVES85baN
 35M+m8cstJanENMndaGvttqzETH7n3NQUDUpc/xbpQwVqSdUkhM9PywBb1ED4gTD/KeL
 me7VQekZAIB+zxWQYROAO4rle3BRQ3kxmd81BbyJTiKX2smgDETuyRAu2SESD3NWM7Z1
 NlPg==
X-Gm-Message-State: AOAM5332tL8o7xMff6PWYAJ2xxIiSWHPL1esvNSz/qMbk/wgrbeU4Z7K
 f/lkBrr6fDjOr6U4aRiwH6BcPlFH2WS5Rw==
X-Google-Smtp-Source: ABdhPJyD7RQcqsHegrxo1EvsisKWqJrqAFyeNJLJp/jjCiQKecYuJsVwld6aqqNCaG5uOG/qDzA+9w==
X-Received: by 2002:a63:2204:0:b0:378:9f08:206d with SMTP id
 i4-20020a632204000000b003789f08206dmr12666660pgi.3.1646709419521; 
 Mon, 07 Mar 2022 19:16:59 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 h5-20020a056a001a4500b004e177b8cbfdsm17801830pfv.197.2022.03.07.19.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 19:16:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] target/arm: Fix sve2 ldnt1 and stnt1
Date: Mon,  7 Mar 2022 17:16:55 -1000
Message-Id: <20220308031655.240710-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 target/arm/sve.decode             |  5 ++-
 target/arm/translate-sve.c        | 51 +++++++++++++++++++++++++++++--
 tests/tcg/aarch64/test-826.c      | 50 ++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  4 +++
 tests/tcg/configure.sh            |  4 +++
 5 files changed, 109 insertions(+), 5 deletions(-)
 create mode 100644 tests/tcg/aarch64/test-826.c

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index c60b9f0fec..0388cce3bd 100644
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
index 33ca1bcfac..2c23459e76 100644
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
index 0000000000..f59740a8c5
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
index ac07acde66..f7121cb4d8 100644
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
index ed4b5ccb1f..84f928f7f8 100755
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


