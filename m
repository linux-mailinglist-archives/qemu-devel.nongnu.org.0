Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893C44E53F8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:07:27 +0100 (CET)
Received: from localhost ([::1]:38936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1e2-0005iL-JT
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:07:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Uo-0007XX-FK; Wed, 23 Mar 2022 09:57:56 -0400
Received: from [2607:f8b0:4864:20::f2d] (port=44822
 helo=mail-qv1-xf2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Uk-0000xa-TR; Wed, 23 Mar 2022 09:57:53 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id ke15so1217226qvb.11;
 Wed, 23 Mar 2022 06:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZXUE88pvIH0NoI+C8Ferp7KJUPPEDur7NtEs3aeqGpI=;
 b=qa52Z4UweY9HzIx39heT6B5JKIk2Mssoc53SXtvpIk//wTYQXX/EWR4VFN+LL8LxNv
 eSDmPn5cTHCDyh6XWEbJZo5hYO7emGc3k91Th6OkbF/J4Vhe8ic8Pu4cVxxTX2NxsW4+
 ndrMml+oCF0dpEZA1Y1hufLKWlBagSAb8DO1mNVxTdiSz3+uWVGBUf3/m0BXQ+VSq7I+
 Dr4kFxbIDxTrcXvqrgaRtwDIBwhUyLKXiK4um8EqkADAnPF61hCS8+0kxzRN2TIqXIUU
 UFi/d4xYaweO2XO6jO1GA8vCHQsyzXf6ugoujvb3gaHfRMG2YOikVYuDaQhfjYXzkelC
 7rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXUE88pvIH0NoI+C8Ferp7KJUPPEDur7NtEs3aeqGpI=;
 b=u7L05w1jvfHkBsP00h5GXRI/VYYuBilZUjUDe5Fw9WCLCJZhZ/jyEHFQj5witH7tBh
 6qc6ZjiqaDyiwuXcB5IXdTh3uJQSts6jqiD0amzqv3h33BO5TqsRX7ClbYpuifgi409L
 hMh98eXmL6gnKJ9qxZ+V/Sd+fPv3Rg3eEEkWS8NZBM/C23HLidU/Hzt1Q9c3pI7TwhoE
 ogF/vmWLISTXOa9ItF1ZdVt3KGJ7YXkmFvG+d9fiBQt19nsoFvPqZyonI64xUi/Qi8eR
 PttmE8yreY4VvMghunS4gHz4oLjNkjfiY5BVqGq+ffLeKw6FUCmoa2CG7kRq9ZmjDDxl
 FFhQ==
X-Gm-Message-State: AOAM5313mAlSNqHh8k2LHl+UM3TC0e169HvyeujDIv49C4HmqKLVAi4U
 j/iYcJPEzoeQo8pOsm49kqhC/rWQnmbrcA==
X-Google-Smtp-Source: ABdhPJwVjC1DTaxE8VIVFtAwVNyda6J8fFAnAeSEgm3aY5YdxwBrPS7r6axDELawROwyLGM3TgUEYg==
X-Received: by 2002:a05:6214:2509:b0:435:7443:2dad with SMTP id
 gf9-20020a056214250900b0043574432dadmr23688654qvb.47.1648043869410; 
 Wed, 23 Mar 2022 06:57:49 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 t128-20020a37aa86000000b0060ddf2dc3ecsm20907qke.104.2022.03.23.06.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:57:49 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 10/11] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2
Date: Wed, 23 Mar 2022 09:57:21 -0400
Message-Id: <20220323135722.1623-11-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323135722.1623-1-dmiller423@gmail.com>
References: <20220323135722.1623-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=dmiller423@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: David Miller <dmiller423@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/Makefile.target |   8 ++
 tests/tcg/s390x/vx.h            |  19 +++++
 tests/tcg/s390x/vxeh2_vcvt.c    |  88 ++++++++++++++++++++
 tests/tcg/s390x/vxeh2_vlstr.c   | 139 ++++++++++++++++++++++++++++++++
 tests/tcg/s390x/vxeh2_vs.c      |  93 +++++++++++++++++++++
 5 files changed, 347 insertions(+)
 create mode 100644 tests/tcg/s390x/vx.h
 create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c
 create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c
 create mode 100644 tests/tcg/s390x/vxeh2_vs.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 8c9b6a13ce..921a056dd1 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -16,6 +16,14 @@ TESTS+=shift
 TESTS+=trap
 TESTS+=signals-s390x
 
+VECTOR_TESTS=vxeh2_vs
+VECTOR_TESTS+=vxeh2_vcvt
+VECTOR_TESTS+=vxeh2_vlstr
+
+TESTS+=$(VECTOR_TESTS)
+
+$(VECTOR_TESTS): CFLAGS+=-march=z15 -O2
+
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
diff --git a/tests/tcg/s390x/vx.h b/tests/tcg/s390x/vx.h
new file mode 100644
index 0000000000..2e66f8b714
--- /dev/null
+++ b/tests/tcg/s390x/vx.h
@@ -0,0 +1,19 @@
+#ifndef QEMU_TESTS_S390X_VX_H
+#define QEMU_TESTS_S390X_VX_H
+
+typedef union S390Vector {
+    uint64_t d[2];  /* doubleword */
+    uint32_t w[4];  /* word */
+    uint16_t h[8];  /* halfword */
+    uint8_t  b[16]; /* byte */
+    float    f[4];  /* float32 */
+    double   fd[2]; /* float64 */
+    __uint128_t v;
+} S390Vector;
+
+#define ES8  0
+#define ES16 1
+#define ES32 2
+#define ES64 3
+
+#endif
\ No newline at end of file
diff --git a/tests/tcg/s390x/vxeh2_vcvt.c b/tests/tcg/s390x/vxeh2_vcvt.c
new file mode 100644
index 0000000000..d6e551c16e
--- /dev/null
+++ b/tests/tcg/s390x/vxeh2_vcvt.c
@@ -0,0 +1,88 @@
+/*
+ * vxeh2_vcvt: vector-enhancements facility 2 vector convert *
+ */
+#include <stdint.h>
+#include "vx.h"
+
+#define M_S 8
+#define M4_XxC 4
+#define M4_def M4_XxC
+
+static inline void vcfps(S390Vector *v1, S390Vector *v2,
+    const uint8_t m3,  const uint8_t m4,  const uint8_t m5)
+{
+    asm volatile("vcfps %[v1], %[v2], %[m3], %[m4], %[m5]\n"
+                : [v1] "=v" (v1->v)
+                : [v2]  "v" (v2->v)
+                , [m3]  "i" (m3)
+                , [m4]  "i" (m4)
+                , [m5]  "i" (m5));
+}
+
+static inline void vcfpl(S390Vector *v1, S390Vector *v2,
+    const uint8_t m3,  const uint8_t m4,  const uint8_t m5)
+{
+    asm volatile("vcfpl %[v1], %[v2], %[m3], %[m4], %[m5]\n"
+                : [v1] "=v" (v1->v)
+                : [v2]  "v" (v2->v)
+                , [m3]  "i" (m3)
+                , [m4]  "i" (m4)
+                , [m5]  "i" (m5));
+}
+
+static inline void vcsfp(S390Vector *v1, S390Vector *v2,
+    const uint8_t m3,  const uint8_t m4,  const uint8_t m5)
+{
+    asm volatile("vcsfp %[v1], %[v2], %[m3], %[m4], %[m5]\n"
+                : [v1] "=v" (v1->v)
+                : [v2]  "v" (v2->v)
+                , [m3]  "i" (m3)
+                , [m4]  "i" (m4)
+                , [m5]  "i" (m5));
+}
+
+static inline void vclfp(S390Vector *v1, S390Vector *v2,
+    const uint8_t m3,  const uint8_t m4,  const uint8_t m5)
+{
+    asm volatile("vclfp %[v1], %[v2], %[m3], %[m4], %[m5]\n"
+                : [v1] "=v" (v1->v)
+                : [v2]  "v" (v2->v)
+                , [m3]  "i" (m3)
+                , [m4]  "i" (m4)
+                , [m5]  "i" (m5));
+}
+
+int main(int argc, char *argv[])
+{
+    S390Vector vd;
+    S390Vector vs_i32 = { .w[0] = 1, .w[1] = 64, .w[2] = 1024, .w[3] = -10 };
+    S390Vector vs_u32 = { .w[0] = 2, .w[1] = 32, .w[2] = 4096, .w[3] = 8888 };
+    S390Vector vs_f32 = { .f[0] = 3.987, .f[1] = 5.123,
+                          .f[2] = 4.499, .f[3] = 0.512 };
+
+    vd.d[0] = vd.d[1] = 0;
+    vcfps(&vd, &vs_i32, 2, M4_def, 0);
+    if (1 != vd.f[0] || 1024 != vd.f[2] || 64 != vd.f[1] || -10 != vd.f[3]) {
+        return 1;
+    }
+
+    vd.d[0] = vd.d[1] = 0;
+    vcfpl(&vd, &vs_u32, 2, M4_def, 0);
+    if (2 != vd.f[0] || 4096 != vd.f[2] || 32 != vd.f[1] || 8888 != vd.f[3]) {
+        return 1;
+    }
+
+    vd.d[0] = vd.d[1] = 0;
+    vcsfp(&vd, &vs_f32, 2, M4_def, 0);
+    if (4 != vd.w[0] || 4 != vd.w[2] || 5 != vd.w[1] || 1 != vd.w[3]) {
+        return 1;
+    }
+
+    vd.d[0] = vd.d[1] = 0;
+    vclfp(&vd, &vs_f32, 2, M4_def, 0);
+    if (4 != vd.w[0] || 4 != vd.w[2] || 5 != vd.w[1] || 1 != vd.w[3]) {
+        return 1;
+    }
+
+    return 0;
+}
diff --git a/tests/tcg/s390x/vxeh2_vlstr.c b/tests/tcg/s390x/vxeh2_vlstr.c
new file mode 100644
index 0000000000..5677bf7c29
--- /dev/null
+++ b/tests/tcg/s390x/vxeh2_vlstr.c
@@ -0,0 +1,139 @@
+/*
+ * vxeh2_vlstr: vector-enhancements facility 2 vector load/store reversed *
+ */
+#include <stdint.h>
+#include "vx.h"
+
+#define vtst(v1, v2) \
+    if (v1.d[0] != v2.d[0] || v1.d[1] != v2.d[1]) { \
+        return 1;     \
+    }
+
+static inline void vler(S390Vector *v1, const void *va, uint8_t m3)
+{
+    asm volatile("vler %[v1], 0(%[va]), %[m3]\n"
+                : [v1] "+v" (v1->v)
+                : [va]  "d" (va)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vster(S390Vector *v1, const void *va, uint8_t m3)
+{
+    asm volatile("vster %[v1], 0(%[va]), %[m3]\n"
+                : [va] "+d" (va)
+                : [v1]  "v" (v1->v)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vlbr(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile("vlbr %[v1], 0(%[va]), %[m3]\n"
+                : [v1] "+v" (v1->v)
+                : [va]  "d" (va)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vstbr(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile("vstbr %[v1], 0(%[va]), %[m3]\n"
+                : [va] "+d" (va)
+                : [v1]  "v" (v1->v)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+
+static inline void vlebrh(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile("vlebrh %[v1], 0(%[va]), %[m3]\n"
+                : [v1] "+v" (v1->v)
+                : [va]  "d" (va)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vstebrh(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile("vstebrh %[v1], 0(%[va]), %[m3]\n"
+                : [va] "+d" (va)
+                : [v1]  "v" (v1->v)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vllebrz(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile("vllebrz %[v1], 0(%[va]), %[m3]\n"
+                : [v1] "+v" (v1->v)
+                : [va]  "d" (va)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vlbrrep(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile("vlbrrep %[v1], 0(%[va]), %[m3]\n"
+                : [v1] "+v" (v1->v)
+                : [va]  "d" (va)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+int main(int argc, char *argv[])
+{
+    S390Vector vd = { .d[0] = 0, .d[1] = 0 };
+    S390Vector vs = { .d[0] = 0x8FEEDDCCBBAA9988ull,
+                      .d[1] = 0x7766554433221107ull };
+
+    const S390Vector vt_v_er16 = {
+        .h[0] = 0x1107, .h[1] = 0x3322, .h[2] = 0x5544, .h[3] = 0x7766,
+        .h[4] = 0x9988, .h[5] = 0xBBAA, .h[6] = 0xDDCC, .h[7] = 0x8FEE };
+
+    const S390Vector vt_v_br16 = {
+        .h[0] = 0xEE8F, .h[1] = 0xCCDD, .h[2] = 0xAABB, .h[3] = 0x8899,
+        .h[4] = 0x6677, .h[5] = 0x4455, .h[6] = 0x2233, .h[7] = 0x0711 };
+
+    int ix;
+    uint64_t ss64 = 0xFEEDFACE0BADBEEFull, sd64 = 0;
+
+    vler(&vd, &vs, ES16);
+    vtst(vd, vt_v_er16);
+
+    vster(&vs, &vd, ES16);
+    vtst(vd, vt_v_er16);
+
+    vlbr(&vd, &vs, ES16);
+    vtst(vd, vt_v_br16);
+
+    vstbr(&vs, &vd, ES16);
+    vtst(vd, vt_v_br16);
+
+    vlebrh(&vd, &ss64, 5);
+    if (0xEDFE != vd.h[5]) {
+        return 1;
+    }
+
+    vstebrh(&vs, (uint8_t *)&sd64 + 4, 7);
+    if (0x0000000007110000ull != sd64) {
+        return 1;
+    }
+
+    vllebrz(&vd, (uint8_t *)&ss64 + 3, 2);
+    for (ix = 0; ix < 4; ix++) {
+        if (vd.w[ix] != (ix != 1 ? 0 : 0xBEAD0BCE)) {
+            return 1;
+        }
+    }
+
+    vlbrrep(&vd, (uint8_t *)&ss64 + 4, 1);
+    for (ix = 0; ix < 8; ix++) {
+        if (0xAD0B != vd.h[ix]) {
+            return 1;
+        }
+    }
+
+    return 0;
+}
diff --git a/tests/tcg/s390x/vxeh2_vs.c b/tests/tcg/s390x/vxeh2_vs.c
new file mode 100644
index 0000000000..b7ef419d79
--- /dev/null
+++ b/tests/tcg/s390x/vxeh2_vs.c
@@ -0,0 +1,93 @@
+/*
+ * vxeh2_vs: vector-enhancements facility 2 vector shift
+ */
+#include <stdint.h>
+#include "vx.h"
+
+#define vtst(v1, v2) \
+    if (v1.d[0] != v2.d[0] || v1.d[1] != v2.d[1]) { \
+        return 1;     \
+    }
+
+static inline void vsl(S390Vector *v1, S390Vector *v2, S390Vector *v3)
+{
+    asm volatile("vsl %[v1], %[v2], %[v3]\n"
+                : [v1] "=v" (v1->v)
+                : [v2]  "v" (v2->v)
+                , [v3]  "v" (v3->v));
+}
+
+static inline void vsra(S390Vector *v1, S390Vector *v2, S390Vector *v3)
+{
+    asm volatile("vsra %[v1], %[v2], %[v3]\n"
+                : [v1] "=v" (v1->v)
+                : [v2]  "v" (v2->v)
+                , [v3]  "v" (v3->v));
+}
+
+static inline void vsrl(S390Vector *v1, S390Vector *v2, S390Vector *v3)
+{
+    asm volatile("vsrl %[v1], %[v2], %[v3]\n"
+                : [v1] "=v" (v1->v)
+                : [v2]  "v" (v2->v)
+                , [v3]  "v" (v3->v));
+}
+
+static inline void vsld(S390Vector *v1, S390Vector *v2,
+    S390Vector *v3, const uint8_t I)
+{
+    asm volatile("vsld %[v1], %[v2], %[v3], %[I]\n"
+                : [v1] "=v" (v1->v)
+                : [v2]  "v" (v2->v)
+                , [v3]  "v" (v3->v)
+                , [I]   "i" (I & 7));
+}
+
+static inline void vsrd(S390Vector *v1, S390Vector *v2,
+    S390Vector *v3, const uint8_t I)
+{
+    asm volatile("vsrd %[v1], %[v2], %[v3], %[I]\n"
+                : [v1] "=v" (v1->v)
+                : [v2]  "v" (v2->v)
+                , [v3]  "v" (v3->v)
+                , [I]   "i" (I & 7));
+}
+
+int main(int argc, char *argv[])
+{
+    const S390Vector vt_vsl  = { .d[0] = 0x7FEDBB32D5AA311Dull,
+                                 .d[1] = 0xBB65AA10912220C0ull };
+    const S390Vector vt_vsra = { .d[0] = 0xF1FE6E7399AA5466ull,
+                                 .d[1] = 0x0E762A5188221044ull };
+    const S390Vector vt_vsrl = { .d[0] = 0x11FE6E7399AA5466ull,
+                                 .d[1] = 0x0E762A5188221044ull };
+    const S390Vector vt_vsld = { .d[0] = 0x7F76EE65DD54CC43ull,
+                                 .d[1] = 0xBB32AA2199108838ull };
+    const S390Vector vt_vsrd = { .d[0] = 0x0E060802040E000Aull,
+                                 .d[1] = 0x0C060802040E000Aull };
+    S390Vector vs  = { .d[0] = 0x8FEEDDCCBBAA9988ull,
+                       .d[1] = 0x7766554433221107ull };
+    S390Vector  vd = { .d[0] = 0, .d[1] = 0 };
+    S390Vector vsi = { .d[0] = 0, .d[1] = 0 };
+
+    for (int ix = 0; ix < 16; ix++) {
+        vsi.b[ix] = (1 + (5 ^ ~ix)) & 7;
+    }
+
+    vsl(&vd, &vs, &vsi);
+    vtst(vd, vt_vsl);
+
+    vsra(&vd, &vs, &vsi);
+    vtst(vd, vt_vsra);
+
+    vsrl(&vd, &vs, &vsi);
+    vtst(vd, vt_vsrl);
+
+    vsld(&vd, &vs, &vsi, 3);
+    vtst(vd, vt_vsld);
+
+    vsrd(&vd, &vs, &vsi, 15);
+    vtst(vd, vt_vsrd);
+
+    return 0;
+}
-- 
2.34.1


