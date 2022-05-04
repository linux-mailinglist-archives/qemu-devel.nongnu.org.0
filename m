Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90853519EF8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 14:09:32 +0200 (CEST)
Received: from localhost ([::1]:36622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDox-0002zL-MF
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 08:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmCpY-0001o5-UG
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:06:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmCpW-0001fN-Mb
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651662362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06wKC3CrIQQzX3QQuBoVG7P+jYxzb2A5zG8T18OMZPA=;
 b=JQ8vg7F+tyRl6SJMvuBFPnBM8MbF/mfe0/+T8OcX3qL64jwr0ZVRtN58G4zQXePfjFJdZW
 YGwMxlestvJ5yqkRjRIFhVoJbo5Y+QuJpHyhuFsBDrP2OhvNu4ajGji29eobqExsepbiMF
 hxxU3+opOJZiKLN7PnHQmczhsQEMTwU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-oDQFuEZoPw6wG9yu1IY2wA-1; Wed, 04 May 2022 07:05:59 -0400
X-MC-Unique: oDQFuEZoPw6wG9yu1IY2wA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96E903C977C2;
 Wed,  4 May 2022 11:05:58 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40495111E40B;
 Wed,  4 May 2022 11:05:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, David Miller <dmiller423@gmail.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 13/15] tests/tcg/s390x: Tests for Vector Enhancements Facility 2
Date: Wed,  4 May 2022 13:05:19 +0200
Message-Id: <20220504110521.343519-14-thuth@redhat.com>
In-Reply-To: <20220504110521.343519-1-thuth@redhat.com>
References: <20220504110521.343519-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: David Miller <dmiller423@gmail.com>

Signed-off-by: David Miller <dmiller423@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220428094708.84835-14-david@redhat.com>
[thuth: Only add test if -march=z15 is supported. Fix constraints for Clang]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/vx.h            |  19 +++++
 tests/tcg/s390x/vxeh2_vcvt.c    |  88 ++++++++++++++++++++
 tests/tcg/s390x/vxeh2_vlstr.c   | 139 ++++++++++++++++++++++++++++++++
 tests/tcg/s390x/vxeh2_vs.c      |  93 +++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |   8 ++
 5 files changed, 347 insertions(+)
 create mode 100644 tests/tcg/s390x/vx.h
 create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c
 create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c
 create mode 100644 tests/tcg/s390x/vxeh2_vs.c

diff --git a/tests/tcg/s390x/vx.h b/tests/tcg/s390x/vx.h
new file mode 100644
index 0000000000..02e7fd518a
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
+#endif /* QEMU_TESTS_S390X_VX_H */
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
index 0000000000..cf971150cf
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
+                : [va]  "a" (va)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vster(S390Vector *v1, const void *va, uint8_t m3)
+{
+    asm volatile("vster %[v1], 0(%[va]), %[m3]\n"
+                : [va] "+a" (va)
+                : [v1]  "v" (v1->v)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vlbr(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile("vlbr %[v1], 0(%[va]), %[m3]\n"
+                : [v1] "+v" (v1->v)
+                : [va]  "a" (va)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vstbr(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile("vstbr %[v1], 0(%[va]), %[m3]\n"
+                : [va] "+a" (va)
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
+                : [va]  "a" (va)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vstebrh(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile("vstebrh %[v1], 0(%[va]), %[m3]\n"
+                : [va] "+a" (va)
+                : [v1]  "v" (v1->v)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vllebrz(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile("vllebrz %[v1], 0(%[va]), %[m3]\n"
+                : [v1] "+v" (v1->v)
+                : [va]  "a" (va)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vlbrrep(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile("vlbrrep %[v1], 0(%[va]), %[m3]\n"
+                : [v1] "+v" (v1->v)
+                : [va]  "a" (va)
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
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index f0d474a245..3124172736 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -17,6 +17,14 @@ TESTS+=trap
 TESTS+=signals-s390x
 TESTS+=branch-relative-long
 
+VECTOR_TESTS=vxeh2_vs
+VECTOR_TESTS+=vxeh2_vcvt
+VECTOR_TESTS+=vxeh2_vlstr
+$(VECTOR_TESTS): CFLAGS+=-march=z15 -O2
+
+TESTS+=$(if $(shell $(CC) -march=z15 -S -o /dev/null -xc /dev/null \
+			 >/dev/null 2>&1 && echo OK),$(VECTOR_TESTS))
+
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
-- 
2.27.0


