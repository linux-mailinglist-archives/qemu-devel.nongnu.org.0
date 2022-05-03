Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529C35187B0
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:01:09 +0200 (CEST)
Received: from localhost ([::1]:60900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlu1U-0003gF-4A
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nltxz-0006V1-BK; Tue, 03 May 2022 10:57:31 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:38688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nltxw-00077p-U4; Tue, 03 May 2022 10:57:31 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-e5e433d66dso17399117fac.5; 
 Tue, 03 May 2022 07:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ovgyD6S1LbuZdBbQncbiHXUb4kz/dsxP0s5i8YxyRA=;
 b=eaa7ywnqEwESPh2RuB8nu/JB3ppST/i3Fr8Jd4nIufVW9W8m+HNtoiLh4BnLw3VuRW
 nEBya+p7ILf+Y/u+8ivaJy4K0HrbD8QvfUYm0OMYZ0Q+fguYHJDl0GyfHjpHoUFahHy0
 HR9p0sPBWtQ2WLUcLbDFw/BoWUfuelIw6p+V242UcoLAaG+J+tz69s2cKrr0vcfV9TTu
 7slM8AzDS0S1l3EDEtNWm+DqLVoZPVf0G6qAIxyZEFgYjJMHXxCBvKw3qK1V8aCeW/wB
 +FZ0b6sS+8M6dCr3fd1WfYnk7GkMmEuJfPNxQYkvxZOQBg+6NuIINfIXZhLxuaw9TrI0
 hDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ovgyD6S1LbuZdBbQncbiHXUb4kz/dsxP0s5i8YxyRA=;
 b=0eR4VXr/c1/OSFF2psTWELzQLpG1Tg0H4fHIkEh3Rdx36ErI5ORH2RyLzggdhAA9Ed
 gSDPQ05IkvOUeAn2AteLikDaPvpDxrJ3UC0m92Ogr8hFLbZDSUxwNZGjDG3v7celykhi
 loBdw3zEtDjMWeZsFKehpjFozDsnCYL3pjhZ21h94hJS08jZ0CW6/EDjLjAaCM6JPCXX
 UkrRt62HQHMsPIspCf5+phJT0z/KA9ms0S7qyxjvtPpCyJbCP9yPZInwMXVU958nXgis
 8eE4K7e/dt8KC14sgG+C8gg6/p1YGEUV/U1fPYh4nJ3glzCoANGAdbvLkThFNN73I9+w
 WZ7Q==
X-Gm-Message-State: AOAM530ecj3SeYxgWLa0cxytbDYgjrffBghYl7EiPWtmOLiZYAUyxTYe
 JQ+vARzF1KYH9eb6NK4J1FQHzMiBZHCnrPTuzbV1DNC3dOCuH7zo
X-Google-Smtp-Source: ABdhPJx3Q3TcmDjTq/tLwFd0YJisujos7tQLVxVcfrYTqO0ThN4738u+xZ6uHJeB5fHTYQ3BSc9TE6Ba5Fv7d0rEKxg=
X-Received: by 2002:a05:6870:d68c:b0:dd:e6e1:2c9f with SMTP id
 z12-20020a056870d68c00b000dde6e12c9fmr1818943oap.100.1651589846835; Tue, 03
 May 2022 07:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220428094708.84835-1-david@redhat.com>
 <97f9be15-4ccd-505b-a35e-8d95823df03a@redhat.com>
 <85dffe1d-a6d2-9e93-749b-29febb0b6dc5@redhat.com>
 <CAEgyohV9kjXUW_LMQM7YryQL1=0VW3pSCbffG2uFG7d5vNo5iw@mail.gmail.com>
 <348d3383-0bd4-1f18-2d14-08962be66c32@redhat.com>
 <CAEgyohUw8GBMaoKpVB4D0GCbKVQ1NTaT9px6LBX1BsS-ex-nxg@mail.gmail.com>
 <CAEgyohUk3cX32XXrecAKNbSxd9R8H-dvmesnAPPdW=Mz5Xi+7w@mail.gmail.com>
In-Reply-To: <CAEgyohUk3cX32XXrecAKNbSxd9R8H-dvmesnAPPdW=Mz5Xi+7w@mail.gmail.com>
From: David Miller <dmiller423@gmail.com>
Date: Tue, 3 May 2022 10:57:51 -0400
Message-ID: <CAEgyohWHp7tNZ2Ro0QhTih+9pGcc82AzT51BEgDWP_1VDo_9HQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] s390x/tcg: Implement Vector-Enhancements
 Facility 2
To: Thomas Huth <thuth@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dmiller423@gmail.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From bb6bf2f9529c4d76db9a9eff2ff7fa1235657103 Mon Sep 17 00:00:00 2001
From: David Miller <dmiller423@gmail.com>
Date: Mon, 21 Mar 2022 16:58:57 -0400
Subject: [PATCH v5 10/11] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2

Signed-off-by: David Miller <dmiller423@gmail.com>
---
 tests/tcg/s390x/Makefile.target |   8 ++
 tests/tcg/s390x/vx.h            |  19 +++++
 tests/tcg/s390x/vxeh2_vcvt.c    |  88 ++++++++++++++++++++
 tests/tcg/s390x/vxeh2_vlstr.c   | 139 ++++++++++++++++++++++++++++++++
 tests/tcg/s390x/vxeh2_vs.c      |  95 ++++++++++++++++++++++
 5 files changed, 349 insertions(+)
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
index 0000000000..2e46841ab5
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
+    asm volatile(".insn vrr, 0xE700000000C3, %[v1], %[v2], 0, %[m3],
%[m4], %[m5]\n"
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
+    asm volatile(".insn vrr, 0xE700000000C1, %[v1], %[v2], 0, %[m3],
%[m4], %[m5]\n"
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
+    asm volatile(".insn vrr, 0xE700000000C2, %[v1], %[v2], 0, %[m3],
%[m4], %[m5]\n"
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
+    asm volatile(".insn vrr, 0xE700000000C0, %[v1], %[v2], 0, %[m3],
%[m4], %[m5]\n"
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
index 0000000000..770691a4e8
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
+    asm volatile(".insn vrx, 0xE60000000007, %[v1], 0(%[va]), %[m3]\n"
+                : [v1] "+v" (v1->v)
+                : [va]  "d" (va)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vster(S390Vector *v1, const void *va, uint8_t m3)
+{
+    asm volatile(".insn vrx, 0xE6000000000F, %[v1], 0(%[va]), %[m3]\n"
+                : [va] "+d" (va)
+                : [v1]  "v" (v1->v)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vlbr(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile(".insn vrx, 0xE60000000006, %[v1], 0(%[va]), %[m3]\n"
+                : [v1] "+v" (v1->v)
+                : [va]  "d" (va)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vstbr(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile(".insn vrx, 0xE6000000000E, %[v1], 0(%[va]), %[m3]\n"
+                : [va] "+d" (va)
+                : [v1]  "v" (v1->v)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+
+static inline void vlebrh(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile(".insn vrx, 0xE60000000001, %[v1], 0(%[va]), %[m3]\n"
+                : [v1] "+v" (v1->v)
+                : [va]  "d" (va)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vstebrh(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile(".insn vrx, 0xE60000000009, %[v1], 0(%[va]), %[m3]\n"
+                : [va] "+d" (va)
+                : [v1]  "v" (v1->v)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vllebrz(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile(".insn vrx, 0xE60000000004, %[v1], 0(%[va]), %[m3]\n"
+                : [v1] "+v" (v1->v)
+                : [va]  "d" (va)
+                , [m3]  "i" (m3)
+                : "memory");
+}
+
+static inline void vlbrrep(S390Vector *v1, void *va, const uint8_t m3)
+{
+    asm volatile(".insn vrx, 0xE60000000005, %[v1], 0(%[va]), %[m3]\n"
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
index 0000000000..78f5c9a8be
--- /dev/null
+++ b/tests/tcg/s390x/vxeh2_vs.c
@@ -0,0 +1,95 @@
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
+    asm volatile(".insn vrr, 0xE70000000074, %[v1], %[v2], %[v3], 0,0,0\n"
+                : [v1] "=v" (v1->v)
+                : [v2]  "v" (v2->v)
+                , [v3]  "v" (v3->v));
+}
+
+static inline void vsra(S390Vector *v1, S390Vector *v2, S390Vector *v3)
+{
+    asm volatile(".insn vrr, 0xE7000000007E, %[v1], %[v2], %[v3], 0,0,0\n"
+                : [v1] "=v" (v1->v)
+                : [v2]  "v" (v2->v)
+                , [v3]  "v" (v3->v));
+}
+
+static inline void vsrl(S390Vector *v1, S390Vector *v2, S390Vector *v3)
+{
+    asm volatile(".insn vrr, 0xE7000000007C, %[v1], %[v2], %[v3], 0,0,0\n"
+                : [v1] "=v" (v1->v)
+                : [v2]  "v" (v2->v)
+                , [v3]  "v" (v3->v));
+}
+
+static inline void vsld(S390Vector *v1, S390Vector *v2,
+    S390Vector *v3, const uint8_t I)
+{
+    /* vri-d as vrr */
+    asm volatile(".insn vrr, 0xE70000000086, %[v1], %[v2], %[v3], 0, %[I], 0\n"
+                : [v1] "=v" (v1->v)
+                : [v2]  "v" (v2->v)
+                , [v3]  "v" (v3->v)
+                , [I]   "i" (I & 7));
+}
+
+static inline void vsrd(S390Vector *v1, S390Vector *v2,
+    S390Vector *v3, const uint8_t I)
+{
+    /* vri-d as vrr */
+    asm volatile(".insn vrr, 0xE70000000087, %[v1], %[v2], %[v3], 0, %[I], 0\n"
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
2.32.0

On Tue, May 3, 2022 at 10:57 AM David Miller <dmiller423@gmail.com> wrote:
>
> It looks like google killed allowing password access early, nothing
> makes it work anymore.
> They had plans to disable 'less secure app' in may,  but it thought it
> was the end of the month.
> I'll try copy/paste as plain text as well though I Know it will likely
> screw it up..
>
> On Tue, May 3, 2022 at 10:42 AM David Miller <dmiller423@gmail.com> wrote:
> >
> > Sorry,  It was in the discussion for v4 patches,  as an attachment .
> > mail thread:
> > [PATCH v4 10/11] tests/tcg/s390x: Tests for Vector Enhancements Facility 2
> > So it likely never made it to the mailing list.
> >
> > I've reattached and will forward the patch (by itself) to the mailing list.
> >
> > I think the other solution works just as well by ignoring if compiler
> > doesn't support z15.
> >
> > I just thought I'd bring it back up as I saw discussion about it.
> >
> > Thanks
> > - David Miller
> >
> >
> >
> >
> >
> >
> > On Tue, May 3, 2022 at 2:55 AM Thomas Huth <thuth@redhat.com> wrote:
> > >
> > >   Hi!
> > >
> > > On 02/05/2022 18.06, David Miller wrote:
> > > > There was also the patch that had them as .insn in the other series of emails.
> > >
> > > Sorry, I missed that patch, could you please point me to the mail on
> > > https://lore.kernel.org/qemu-devel/ ? I remember that there was a discussion
> > > about the vri-d encoding, but I apparently missed the patch that came out of
> > > this discussion...
> > >
> > >   Thomas
> > >
> > > > On Mon, May 2, 2022 at 11:52 AM David Hildenbrand <david@redhat.com> wrote:
> > > >>
> > > >> On 02.05.22 09:20, Thomas Huth wrote:
> > > >>> On 28/04/2022 11.46, David Hildenbrand wrote:
> > > >>>> Implement Vector-Enhancements Facility 2 for s390x
> > > >>>>
> > > >>>> resolves: https://gitlab.com/qemu-project/qemu/-/issues/738
> > > >>>>
> > > >>>> implements:
> > > >>>>       VECTOR LOAD ELEMENTS REVERSED               (VLER)
> > > >>>>       VECTOR LOAD BYTE REVERSED ELEMENTS          (VLBR)
> > > >>>>       VECTOR LOAD BYTE REVERSED ELEMENT           (VLEBRH, VLEBRF, VLEBRG)
> > > >>>>       VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO  (VLLEBRZ)
> > > >>>>       VECTOR LOAD BYTE REVERSED ELEMENT AND REPLICATE (VLBRREP)
> > > >>>>       VECTOR STORE ELEMENTS REVERSED              (VSTER)
> > > >>>>       VECTOR STORE BYTE REVERSED ELEMENTS         (VSTBR)
> > > >>>>       VECTOR STORE BYTE REVERSED ELEMENTS         (VSTEBRH, VSTEBRF, VSTEBRG)
> > > >>>>       VECTOR SHIFT LEFT DOUBLE BY BIT             (VSLD)
> > > >>>>       VECTOR SHIFT RIGHT DOUBLE BY BIT            (VSRD)
> > > >>>>       VECTOR STRING SEARCH                        (VSTRS)
> > > >>>>
> > > >>>>       modifies:
> > > >>>>       VECTOR FP CONVERT FROM FIXED                (VCFPS)
> > > >>>>       VECTOR FP CONVERT FROM LOGICAL              (VCFPL)
> > > >>>>       VECTOR FP CONVERT TO FIXED                  (VCSFP)
> > > >>>>       VECTOR FP CONVERT TO LOGICAL                (VCLFP)
> > > >>>>       VECTOR SHIFT LEFT                           (VSL)
> > > >>>>       VECTOR SHIFT RIGHT ARITHMETIC               (VSRA)
> > > >>>>       VECTOR SHIFT RIGHT LOGICAL                  (VSRL)
> > > >>>
> > > >>> Thanks, queued to my s390x-next branch now:
> > > >>>
> > > >>>    https://gitlab.com/thuth/qemu/-/commits/s390x-next/
> > > >>>
> > > >> Thanks for fixing up. At this point I would have suggested to exclude
> > > >> the tests for now.
> > > >>
> > > >> --
> > > >> Thanks,
> > > >>
> > > >> David / dhildenb
> > > >>
> > > >
> > >

