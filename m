Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9961E4CB579
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 04:32:25 +0100 (CET)
Received: from localhost ([::1]:39412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPcCW-0006DU-Nx
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 22:32:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nPc36-0004We-RG; Wed, 02 Mar 2022 22:22:40 -0500
Received: from [2607:f8b0:4864:20::f2c] (port=35804
 helo=mail-qv1-xf2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nPc34-0006kI-RA; Wed, 02 Mar 2022 22:22:40 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id 8so3164574qvf.2;
 Wed, 02 Mar 2022 19:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P+m7zMOCH/LJFJNN4SG+oPfi+8ofisYtxuHQbvk7G7w=;
 b=TfG52yNSVsCgFGgWEbwSR7ZaslRa6EqONjCDmtqpyC3rY8ZINs8Epom5LyU0TOHyvS
 2AkcS5OEbVHsJDkkkAucv6+q2t+zIgrU4RHIRphXaEu3a96MUoHfebxGpDIinvSj+fsl
 EwfU0LQkn3TR9jD/V6QwEqqAi2TdKMF5N90uqeUwLZD2ov55KyP7iD4MGJdGWqu96hh8
 kYfd68wG4fuiY0dDsypGUijXuaVefF+OoThb/z+dv38lavYWsuTkNqC6X95te8f1o+bv
 m+aDAz6kyxYvWo59aRxz1RKgvx3ZR//lNA362Q7nUagnSTCncTPKmpF8I82vWQBeOdO7
 0y9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P+m7zMOCH/LJFJNN4SG+oPfi+8ofisYtxuHQbvk7G7w=;
 b=WzJRfR73gtDwY/OzgDVLJACcmtScBcDQOl6LGmmufW+uSUWVT/ybUeuF4xB1lT9RGi
 9KJe1I7Zv9yxvbsDJLIWPsT6mYe1CF8kUB/1RujVZTGrMdSzp0uKiAD8QMET6inmWxGt
 uMDPeIgNSN5EnwvRGSQTT+Tn9R6Shyw4lbV4sCYv5oo8p/ox6NxYYWbL7lSbawd4pA5+
 nKcUd1p6jwAjG6p/yknZOBnfdYwLoW0xt9XO8YU7gR6fJld7LCdkBNP27S2D6D2QVe0V
 7pGdhWA6NCX0BMY7P8nO6513pVLGD3CeyHrUtgfa9YEwmxN17fYhuTPrbBCSa+eD6ccj
 PiBQ==
X-Gm-Message-State: AOAM533EmnpE+tCPr9MNwMr62DM4OETQBAwaYJG3xT/azlTxN9vcC8EP
 pohhhU3PSrAjgoR+doRByA7mpPWqRgbMnNSkqI8=
X-Google-Smtp-Source: ABdhPJwRJaiNu8LWs0LYMMHb7ZGYczKvnys6KMi0zeQwtplJTDUPAesfp4PFqehDHxeLrd7BycQ9KA==
X-Received: by 2002:ad4:478b:0:b0:435:1162:5bd5 with SMTP id
 z11-20020ad4478b000000b0043511625bd5mr6643096qvy.18.1646277756599; 
 Wed, 02 Mar 2022 19:22:36 -0800 (PST)
Received: from localhost.localdomain (mont-dyn-147-183.pwrtc.com.
 [205.174.147.183]) by smtp.gmail.com with ESMTPSA id
 x15-20020a05622a000f00b002de2da5e5cdsm682213qtw.3.2022.03.02.19.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 19:22:36 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2
Date: Wed,  2 Mar 2022 22:22:19 -0500
Message-Id: <20220303032219.17631-3-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220303032219.17631-1-dmiller423@gmail.com>
References: <20220303032219.17631-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=dmiller423@gmail.com; helo=mail-qv1-xf2c.google.com
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

tests/tcg/s390x/vxeh2_vcvt.c
tests/tcg/s390x/vxeh2_vs.c
tests/tcg/s390x/vxeh2_vlstr.c

Signed-off-by: David Miller <dmiller423@gmail.com>
---
 tests/tcg/s390x/Makefile.target |   8 ++
 tests/tcg/s390x/vxeh2_vcvt.c    |  97 +++++++++++++++++++++
 tests/tcg/s390x/vxeh2_vlstr.c   | 146 ++++++++++++++++++++++++++++++++
 tests/tcg/s390x/vxeh2_vs.c      |  91 ++++++++++++++++++++
 4 files changed, 342 insertions(+)
 create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c
 create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c
 create mode 100644 tests/tcg/s390x/vxeh2_vs.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 54e67446aa..2a2b184056 100644
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
 
diff --git a/tests/tcg/s390x/vxeh2_vcvt.c b/tests/tcg/s390x/vxeh2_vcvt.c
new file mode 100644
index 0000000000..71ecbd77b0
--- /dev/null
+++ b/tests/tcg/s390x/vxeh2_vcvt.c
@@ -0,0 +1,97 @@
+/*
+ * vxeh2_vcvt: vector-enhancements facility 2 vector convert *
+ */
+#include <stdint.h>
+
+typedef union S390Vector {
+    uint64_t d[2];  /* doubleword */
+    uint32_t w[4];  /* word */
+    uint16_t h[8];  /* halfword */
+    uint8_t  b[16]; /* byte */
+    float    f[4];
+    double   fd[2];
+    __uint128_t v;
+} S390Vector;
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
index 0000000000..bf2954e86d
--- /dev/null
+++ b/tests/tcg/s390x/vxeh2_vlstr.c
@@ -0,0 +1,146 @@
+/*
+ * vxeh2_vlstr: vector-enhancements facility 2 vector load/store reversed *
+ */
+#include <stdint.h>
+
+typedef union S390Vector {
+    uint64_t d[2];  /* doubleword */
+    uint32_t w[4];  /* word */
+    uint16_t h[8];  /* halfword */
+    uint8_t  b[16]; /* byte */
+    __uint128_t v;
+} S390Vector;
+
+#define ES8  0
+#define ES16 1
+#define ES32 2
+#define ES64 3
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
+    vler (&vd, &vs, ES16);  vtst(vd, vt_v_er16);
+    vster(&vs, &vd, ES16);  vtst(vd, vt_v_er16);
+
+    vlbr (&vd, &vs, ES16);  vtst(vd, vt_v_br16);
+    vstbr(&vs, &vd, ES16);  vtst(vd, vt_v_br16);
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
index 0000000000..04a3d4d7bb
--- /dev/null
+++ b/tests/tcg/s390x/vxeh2_vs.c
@@ -0,0 +1,91 @@
+/*
+ * vxeh2_vs: vector-enhancements facility 2 vector shift
+ */
+#include <stdint.h>
+
+typedef union S390Vector {
+    uint64_t d[2];  /* doubleword */
+    uint32_t w[4];  /* word */
+    uint16_t h[8];  /* halfword */
+    uint8_t  b[16]; /* byte */
+    __uint128_t v;
+} S390Vector;
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
+    vsl (&vd, &vs, &vsi);       vtst(vd, vt_vsl);
+    vsra(&vd, &vs, &vsi);       vtst(vd, vt_vsra);
+    vsrl(&vd, &vs, &vsi);       vtst(vd, vt_vsrl);
+    vsld(&vd, &vs, &vsi, 3);  vtst(vd, vt_vsld);
+    vsrd(&vd, &vs, &vsi, 15); vtst(vd, vt_vsrd);
+
+    return 0;
+}
-- 
2.34.1


