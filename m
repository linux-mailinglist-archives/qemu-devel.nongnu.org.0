Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F9057B23D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 10:04:00 +0200 (CEST)
Received: from localhost ([::1]:57588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE4gZ-0005aq-NM
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 04:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oE4b2-00087u-9k
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:58:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oE4ay-0007px-Bp
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658303891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UqI+6F8Wi0yzU9SOBmvVgpNrmL8Kz82wjD903WHJtRs=;
 b=aNsPr2144rktGezv/Z2onuO5DBmiv9E1yu1FGTnE8YoZbyMWiK3KELgZNyd1tKqfppRBfU
 NaffnmEWaPStjAFSh3otdJCtRFxgDL7kB/N8hCHWVZ7DcG4wMOoV4o6uM+MesuNF9niZOd
 U3JU/tWR6mLvsHONA293PQqvIuzjOMU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-SIPStXB-P8eFm_TfyUYgqw-1; Wed, 20 Jul 2022 03:58:06 -0400
X-MC-Unique: SIPStXB-P8eFm_TfyUYgqw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AB7B811E7A;
 Wed, 20 Jul 2022 07:58:06 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A9C1492C3B;
 Wed, 20 Jul 2022 07:58:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 3/3] tests/tcg/s390x: test signed vfmin/vfmax
Date: Wed, 20 Jul 2022 09:57:56 +0200
Message-Id: <20220720075756.760404-4-thuth@redhat.com>
In-Reply-To: <20220720075756.760404-1-thuth@redhat.com>
References: <20220720075756.760404-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a test to prevent regressions. Try all floating point value sizes
and all combinations of floating point value classes. Verify the results
against PoP tables, which are represented as close to the original as
possible - this produces a lot of checkpatch complaints, but it seems
to be justified in this case.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220713182612.3780050-4-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/vfminmax.c      | 411 ++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |   7 +
 2 files changed, 418 insertions(+)
 create mode 100644 tests/tcg/s390x/vfminmax.c

diff --git a/tests/tcg/s390x/vfminmax.c b/tests/tcg/s390x/vfminmax.c
new file mode 100644
index 0000000000..22629df160
--- /dev/null
+++ b/tests/tcg/s390x/vfminmax.c
@@ -0,0 +1,411 @@
+#define _GNU_SOURCE
+#include <fenv.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+
+/*
+ * vfmin/vfmax instruction execution.
+ */
+#define VFMIN 0xEE
+#define VFMAX 0xEF
+
+extern char insn[6];
+asm(".pushsection .rwx,\"awx\",@progbits\n"
+    ".globl insn\n"
+    /* e7 89 a0 00 2e ef */
+    "insn: vfmaxsb %v24,%v25,%v26,0\n"
+    ".popsection\n");
+
+static void vfminmax(unsigned int op,
+                     unsigned int m4, unsigned int m5, unsigned int m6,
+                     void *v1, const void *v2, const void *v3)
+{
+   insn[3] = (m6 << 4) | m5;
+   insn[4] = (m4 << 4) | 0x0e;
+   insn[5] = op;
+
+    asm("vl %%v25,%[v2]\n"
+        "vl %%v26,%[v3]\n"
+        "ex 0,%[insn]\n"
+        "vst %%v24,%[v1]\n"
+        : [v1] "=m" (*(char (*)[16])v1)
+        : [v2] "m" (*(char (*)[16])v2)
+        , [v3] "m" (*(char (*)[16])v3)
+        , [insn] "m"(insn)
+        : "v24", "v25", "v26");
+}
+
+/*
+ * Floating-point value classes.
+ */
+#define N_FORMATS 3
+#define N_SIGNED_CLASSES 8
+static const size_t float_sizes[N_FORMATS] = {
+    /* M4 == 2: short    */ 4,
+    /* M4 == 3: long     */ 8,
+    /* M4 == 4: extended */ 16,
+};
+static const size_t e_bits[N_FORMATS] = {
+    /* M4 == 2: short    */ 8,
+    /* M4 == 3: long     */ 11,
+    /* M4 == 4: extended */ 15,
+};
+static const unsigned char signed_floats[N_FORMATS][N_SIGNED_CLASSES][2][16] = {
+    /* M4 == 2: short */
+    {
+        /* -inf */ {{0xff, 0x80, 0x00, 0x00},
+                    {0xff, 0x80, 0x00, 0x00}},
+        /* -Fn */  {{0xc2, 0x28, 0x00, 0x00},
+                    {0xc2, 0x29, 0x00, 0x00}},
+        /* -0 */   {{0x80, 0x00, 0x00, 0x00},
+                    {0x80, 0x00, 0x00, 0x00}},
+        /* +0 */   {{0x00, 0x00, 0x00, 0x00},
+                    {0x00, 0x00, 0x00, 0x00}},
+        /* +Fn */  {{0x42, 0x28, 0x00, 0x00},
+                    {0x42, 0x2a, 0x00, 0x00}},
+        /* +inf */ {{0x7f, 0x80, 0x00, 0x00},
+                    {0x7f, 0x80, 0x00, 0x00}},
+        /* QNaN */ {{0x7f, 0xff, 0xff, 0xff},
+                    {0x7f, 0xff, 0xff, 0xfe}},
+        /* SNaN */ {{0x7f, 0xbf, 0xff, 0xff},
+                    {0x7f, 0xbf, 0xff, 0xfd}},
+    },
+
+    /* M4 == 3: long */
+    {
+        /* -inf */ {{0xff, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0xff, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* -Fn */  {{0xc0, 0x45, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0xc0, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* -0 */   {{0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* +0 */   {{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* +Fn */  {{0x40, 0x45, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0x40, 0x47, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* +inf */ {{0x7f, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0x7f, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* QNaN */ {{0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
+                    {0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe}},
+        /* SNaN */ {{0x7f, 0xf7, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
+                    {0x7f, 0xf7, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfd}},
+    },
+
+    /* M4 == 4: extended */
+    {
+        /* -inf */ {{0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* -Fn */  {{0xc0, 0x04, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0xc0, 0x04, 0x51, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* -0 */   {{0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* +0 */   {{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* +Fn */  {{0x40, 0x04, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0x40, 0x04, 0x52, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* +inf */ {{0x7f, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0x7f, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* QNaN */ {{0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
+                    {0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe}},
+        /* SNaN */ {{0x7f, 0xff, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
+                    {0x7f, 0xff, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfd}},
+    },
+};
+
+/*
+ * PoP tables as close to the original as possible.
+ */
+struct signed_test {
+    int op;
+    int m6;
+    const char *m6_desc;
+    const char *table[N_SIGNED_CLASSES][N_SIGNED_CLASSES];
+} signed_tests[] = {
+    {
+        .op = VFMIN,
+        .m6 = 0,
+        .m6_desc = "IEEE MinNum",
+        .table = {
+             /*         -inf         -Fn          -0           +0           +Fn          +inf         QNaN         SNaN     */
+            {/* -inf */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* -Fn  */ "T(b)",      "T(M(a,b))", "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* -0   */ "T(b)",      "T(b)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* +0   */ "T(b)",      "T(b)",      "T(b)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* +Fn  */ "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(M(a,b))", "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* +inf */ "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* QNaN */ "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(a)",      "Xi: T(b*)"},
+            {/* SNaN */ "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)"},
+        },
+    },
+    {
+        .op = VFMIN,
+        .m6 = 1,
+        .m6_desc = "JAVA Math.Min()",
+        .table = {
+             /*         -inf         -Fn          -0           +0           +Fn          +inf         QNaN         SNaN     */
+            {/* -inf */ "T(b)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(b)",      "Xi: T(b*)"},
+            {/* -Fn  */ "T(b)",      "T(M(a,b))", "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(b)",      "Xi: T(b*)"},
+            {/* -0   */ "T(b)",      "T(b)",      "T(b)",      "T(a)",      "T(a)",      "T(a)",      "T(b)",      "Xi: T(b*)"},
+            {/* +0   */ "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(a)",      "T(a)",      "T(b)",      "Xi: T(b*)"},
+            {/* +Fn  */ "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(M(a,b))", "T(a)",      "T(b)",      "Xi: T(b*)"},
+            {/* +inf */ "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "Xi: T(b*)"},
+            {/* QNaN */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* SNaN */ "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)"},
+        },
+    },
+    {
+        .op = VFMIN,
+        .m6 = 2,
+        .m6_desc = "C-style Min Macro",
+        .table = {
+             /*         -inf        -Fn          -0          +0          +Fn          +inf        QNaN        SNaN    */
+            {/* -inf */ "T(b)",     "T(a)",      "T(a)",     "T(a)",     "T(a)",      "T(a)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* -Fn  */ "T(b)",     "T(M(a,b))", "T(a)",     "T(a)",     "T(a)",      "T(a)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* -0   */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(a)",      "T(a)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* +0   */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(a)",      "T(a)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* +Fn  */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(M(a,b))", "T(a)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* +inf */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(b)",      "T(a)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* QNaN */ "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)"},
+            {/* SNaN */ "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)"},
+        },
+    },
+    {
+        .op = VFMIN,
+        .m6 = 3,
+        .m6_desc = "C++ algorithm.min()",
+        .table = {
+             /*         -inf        -Fn          -0          +0          +Fn          +inf        QNaN        SNaN    */
+            {/* -inf */ "T(b)",     "T(a)",      "T(a)",     "T(a)",     "T(a)",      "T(a)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* -Fn  */ "T(b)",     "T(M(a,b))", "T(a)",     "T(a)",     "T(a)",      "T(a)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* -0   */ "T(b)",     "T(b)",      "T(a)",     "T(a)",     "T(a)",      "T(a)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* +0   */ "T(b)",     "T(b)",      "T(a)",     "T(a)",     "T(a)",      "T(a)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* +Fn  */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(M(a,b))", "T(a)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* +inf */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(b)",      "T(a)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* QNaN */ "Xi: T(a)", "Xi: T(a)",  "Xi: T(a)", "Xi: T(a)", "Xi: T(a)",  "Xi: T(a)", "Xi: T(a)", "Xi: T(a)"},
+            {/* SNaN */ "Xi: T(a)", "Xi: T(a)",  "Xi: T(a)", "Xi: T(a)", "Xi: T(a)",  "Xi: T(a)", "Xi: T(a)", "Xi: T(a)"},
+        },
+    },
+    {
+        .op = VFMIN,
+        .m6 = 4,
+        .m6_desc = "fmin()",
+        .table = {
+             /*         -inf        -Fn          -0          +0          +Fn          +inf        QNaN        SNaN    */
+            {/* -inf */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(a)",      "T(a)",     "T(a)",     "Xi: T(a)"},
+            {/* -Fn  */ "T(b)",     "T(M(a,b))", "T(a)",     "T(a)",     "T(a)",      "T(a)",     "T(a)",     "Xi: T(a)"},
+            {/* -0   */ "T(b)",     "T(b)",      "T(a)",     "T(a)",     "T(a)",      "T(a)",     "T(a)",     "Xi: T(a)"},
+            {/* +0   */ "T(b)",     "T(b)",      "T(b)",     "T(a)",     "T(a)",      "T(a)",     "T(a)",     "Xi: T(a)"},
+            {/* +Fn  */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(M(a,b))", "T(a)",     "T(a)",     "Xi: T(a)"},
+            {/* +inf */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(b)",      "T(a)",     "T(a)",     "Xi: T(a)"},
+            {/* QNaN */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(b)",      "T(b)",     "T(a)",     "Xi: T(a)"},
+            {/* SNaN */ "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(a)", "Xi: T(a)"},
+        },
+    },
+
+    {
+        .op = VFMAX,
+        .m6 = 0,
+        .m6_desc = "IEEE MaxNum",
+        .table = {
+             /*         -inf         -Fn          -0           +0           +Fn          +inf         QNaN         SNaN     */
+            {/* -inf */ "T(a)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(a)",      "Xi: T(b*)"},
+            {/* -Fn  */ "T(a)",      "T(M(a,b))", "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(a)",      "Xi: T(b*)"},
+            {/* -0   */ "T(a)",      "T(a)",      "T(a)",      "T(b)",      "T(b)",      "T(b)",      "T(a)",      "Xi: T(b*)"},
+            {/* +0   */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(b)",      "T(b)",      "T(a)",      "Xi: T(b*)"},
+            {/* +Fn  */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(M(a,b))", "T(b)",      "T(a)",      "Xi: T(b*)"},
+            {/* +inf */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* QNaN */ "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(a)",      "Xi: T(b*)"},
+            {/* SNaN */ "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)"},
+        },
+    },
+    {
+        .op = VFMAX,
+        .m6 = 1,
+        .m6_desc = "JAVA Math.Max()",
+        .table = {
+             /*         -inf         -Fn          -0           +0           +Fn          +inf         QNaN         SNaN     */
+            {/* -inf */ "T(a)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "Xi: T(b*)"},
+            {/* -Fn  */ "T(a)",      "T(M(a,b))", "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "Xi: T(b*)"},
+            {/* -0   */ "T(a)",      "T(a)",      "T(a)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "Xi: T(b*)"},
+            {/* +0   */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(b)",      "T(b)",      "T(b)",      "Xi: T(b*)"},
+            {/* +Fn  */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(M(a,b))", "T(b)",      "T(b)",      "Xi: T(b*)"},
+            {/* +inf */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(b)",      "Xi: T(b*)"},
+            {/* QNaN */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* SNaN */ "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)"},
+        },
+    },
+    {
+        .op = VFMAX,
+        .m6 = 2,
+        .m6_desc = "C-style Max Macro",
+        .table = {
+             /*         -inf        -Fn          -0          +0          +Fn          +inf        QNaN        SNaN    */
+            {/* -inf */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(b)",      "T(b)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* -Fn  */ "T(a)",     "T(M(a,b))", "T(b)",     "T(b)",     "T(b)",      "T(b)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* -0   */ "T(a)",     "T(a)",      "T(b)",     "T(b)",     "T(b)",      "T(b)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* +0   */ "T(a)",     "T(a)",      "T(b)",     "T(b)",     "T(b)",      "T(b)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* +Fn  */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(M(a,b))", "T(b)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* +inf */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(a)",      "T(b)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* QNaN */ "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)"},
+            {/* SNaN */ "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)"},
+        },
+    },
+    {
+        .op = VFMAX,
+        .m6 = 3,
+        .m6_desc = "C++ algorithm.max()",
+        .table = {
+             /*         -inf        -Fn          -0          +0          +Fn          +inf        QNaN        SNaN    */
+            {/* -inf */ "T(a)",     "T(b)",      "T(b)",     "T(b)",     "T(b)",      "T(b)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* -Fn  */ "T(a)",     "T(M(a,b))", "T(b)",     "T(b)",     "T(b)",      "T(b)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* -0   */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(b)",      "T(b)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* +0   */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(b)",      "T(b)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* +Fn  */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(M(a,b))", "T(b)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* +inf */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(a)",      "T(a)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* QNaN */ "Xi: T(a)", "Xi: T(a)",  "Xi: T(a)", "Xi: T(a)", "Xi: T(a)",  "Xi: T(a)", "Xi: T(a)", "Xi: T(a)"},
+            {/* SNaN */ "Xi: T(a)", "Xi: T(a)",  "Xi: T(a)", "Xi: T(a)", "Xi: T(a)",  "Xi: T(a)", "Xi: T(a)", "Xi: T(a)"},
+        },
+    },
+    {
+        .op = VFMAX,
+        .m6 = 4,
+        .m6_desc = "fmax()",
+        .table = {
+             /*         -inf        -Fn          -0          +0          +Fn          +inf        QNaN        SNaN    */
+            {/* -inf */ "T(a)",     "T(b)",      "T(b)",     "T(b)",     "T(b)",      "T(b)",     "T(a)",     "Xi: T(a)"},
+            {/* -Fn  */ "T(a)",     "T(M(a,b))", "T(b)",     "T(b)",     "T(b)",      "T(b)",     "T(a)",     "Xi: T(a)"},
+            {/* -0   */ "T(a)",     "T(a)",      "T(a)",     "T(b)",     "T(b)",      "T(b)",     "T(a)",     "Xi: T(a)"},
+            {/* +0   */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(b)",      "T(b)",     "T(a)",     "Xi: T(a)"},
+            {/* +Fn  */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(M(a,b))", "T(b)",     "T(a)",     "Xi: T(a)"},
+            {/* +inf */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(a)",      "T(a)",     "T(a)",     "Xi: T(a)"},
+            {/* QNaN */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(b)",      "T(b)",     "T(a)",     "Xi: T(a)"},
+            {/* SNaN */ "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(a)", "Xi: T(a)"},
+        },
+    },
+};
+
+static void dump_v(FILE *f, const void *v, size_t n)
+{
+    for (int i = 0; i < n; i++) {
+        fprintf(f, "%02x", ((const unsigned char *)v)[i]);
+    }
+}
+
+static int signed_test(struct signed_test *test, int m4, int m5,
+                       const void *v1_exp, bool xi_exp,
+                       const void *v2, const void *v3)
+{
+    size_t n = (m5 & 8) ? float_sizes[m4 - 2] : 16;
+    char v1[16];
+    bool xi;
+
+    feclearexcept(FE_ALL_EXCEPT);
+    vfminmax(test->op, m4, m5, test->m6, v1, v2, v3);
+    xi = fetestexcept(FE_ALL_EXCEPT) == FE_INVALID;
+
+    if (memcmp(v1, v1_exp, n) != 0 || xi != xi_exp) {
+        fprintf(stderr, "[  FAILED  ] %s ", test->m6_desc);
+        dump_v(stderr, v2, n);
+        fprintf(stderr, ", ");
+        dump_v(stderr, v3, n);
+        fprintf(stderr, ", %d, %d, %d: actual=", m4, m5, test->m6);
+        dump_v(stderr, v1, n);
+        fprintf(stderr, "/%d, expected=", (int)xi);
+        dump_v(stderr, v1_exp, n);
+        fprintf(stderr, "/%d\n", (int)xi_exp);
+        return 1;
+    }
+
+    return 0;
+}
+
+static void snan_to_qnan(char *v, int m4)
+{
+    size_t bit = 1 + e_bits[m4 - 2];
+    v[bit / 8] |= 1 << (7 - (bit % 8));
+}
+
+int main(void)
+{
+    int ret = 0;
+    size_t i;
+
+    for (i = 0; i < sizeof(signed_tests) / sizeof(signed_tests[0]); i++) {
+        struct signed_test *test = &signed_tests[i];
+        int m4;
+
+        for (m4 = 2; m4 <= 4; m4++) {
+            const unsigned char (*floats)[2][16] = signed_floats[m4 - 2];
+            size_t float_size = float_sizes[m4 - 2];
+            int m5;
+
+            for (m5 = 0; m5 <= 8; m5 += 8) {
+                char v1_exp[16], v2[16], v3[16];
+                bool xi_exp = false;
+                int pos = 0;
+                int i2;
+
+                for (i2 = 0; i2 < N_SIGNED_CLASSES * 2; i2++) {
+                    int i3;
+
+                    for (i3 = 0; i3 < N_SIGNED_CLASSES * 2; i3++) {
+                        const char *spec = test->table[i2 / 2][i3 / 2];
+
+                        memcpy(&v2[pos], floats[i2 / 2][i2 % 2], float_size);
+                        memcpy(&v3[pos], floats[i3 / 2][i3 % 2], float_size);
+                        if (strcmp(spec, "T(a)") == 0 ||
+                            strcmp(spec, "Xi: T(a)") == 0) {
+                            memcpy(&v1_exp[pos], &v2[pos], float_size);
+                        } else if (strcmp(spec, "T(b)") == 0 ||
+                                   strcmp(spec, "Xi: T(b)") == 0) {
+                            memcpy(&v1_exp[pos], &v3[pos], float_size);
+                        } else if (strcmp(spec, "Xi: T(a*)") == 0) {
+                            memcpy(&v1_exp[pos], &v2[pos], float_size);
+                            snan_to_qnan(&v1_exp[pos], m4);
+                        } else if (strcmp(spec, "Xi: T(b*)") == 0) {
+                            memcpy(&v1_exp[pos], &v3[pos], float_size);
+                            snan_to_qnan(&v1_exp[pos], m4);
+                        } else if (strcmp(spec, "T(M(a,b))") == 0) {
+                            /*
+                             * Comparing floats is risky, since the compiler
+                             * might generate the same instruction that we are
+                             * testing. Compare ints instead. This works,
+                             * because we get here only for +-Fn, and the
+                             * corresponding test values have identical
+                             * exponents.
+                             */
+                            int v2_int = *(int *)&v2[pos];
+                            int v3_int = *(int *)&v3[pos];
+
+                            if ((v2_int < v3_int) ==
+                                ((test->op == VFMIN) != (v2_int < 0))) {
+                                memcpy(&v1_exp[pos], &v2[pos], float_size);
+                            } else {
+                                memcpy(&v1_exp[pos], &v3[pos], float_size);
+                            }
+                        } else {
+                            fprintf(stderr, "Unexpected spec: %s\n", spec);
+                            return 1;
+                        }
+                        xi_exp |= spec[0] == 'X';
+                        pos += float_size;
+
+                        if ((m5 & 8) || pos == 16) {
+                            ret |= signed_test(test, m4, m5,
+                                               v1_exp, xi_exp, v2, v3);
+                            pos = 0;
+                            xi_exp = false;
+                        }
+                    }
+                }
+
+                if (pos != 0) {
+                    ret |= signed_test(test, m4, m5, v1_exp, xi_exp, v2, v3);
+                }
+            }
+        }
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 3124172736..1a7a4a2f59 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -17,6 +17,13 @@ TESTS+=trap
 TESTS+=signals-s390x
 TESTS+=branch-relative-long
 
+Z14_TESTS=vfminmax
+vfminmax: LDFLAGS+=-lm
+$(Z14_TESTS): CFLAGS+=-march=z14 -O2
+
+TESTS+=$(if $(shell $(CC) -march=z14 -S -o /dev/null -xc /dev/null \
+			 >/dev/null 2>&1 && echo OK),$(Z14_TESTS))
+
 VECTOR_TESTS=vxeh2_vs
 VECTOR_TESTS+=vxeh2_vcvt
 VECTOR_TESTS+=vxeh2_vlstr
-- 
2.31.1


