Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16A216297
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 01:52:55 +0200 (CEST)
Received: from localhost ([::1]:53458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsaus-0001JX-1o
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 19:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1jsaqE-0001DT-55
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 19:48:06 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:43185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1jsaqB-0000yE-SE
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 19:48:05 -0400
Received: by mail-pg1-x542.google.com with SMTP id w2so18317669pgg.10
 for <qemu-devel@nongnu.org>; Mon, 06 Jul 2020 16:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4jIV5omheeV0T3drxGexigxyJptxU+Y8G8xeDL3SRR8=;
 b=AQ3+anqLua6w9uuTptYIv9BWTW66dZ4d8yIN52NdR511htreAz/Q51QeLaS+rFFW7d
 dpTuTLEBh6ysQpQ5wtsUFJLpKTK+vO2VEdUSU99V6ZZFb0G8/0R6N2Dx6g9GDtt2ccMb
 6Y1qA4ldY0SQd55xH6uEgTBN5+JShqL+udc7ExlLoODkH+w+lDtmmpXVcYmi5+K5ebRr
 H/aIVunFaKigrrywN8LHNXJ/ujuEumi8uzJpiT8fHehpjUALVr2Bqy5IYjGYIIM+0RJZ
 wvczhr85IXYcVS4nWA+Prg61cPX5WuH9EE1G7BDxZGZ44EhhURKXm9bQ+/vLScDcMFYP
 Xu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4jIV5omheeV0T3drxGexigxyJptxU+Y8G8xeDL3SRR8=;
 b=Q70pEpSm2V53pF2x2NSdOi6WBF2ZUagjiQPFgNO4b5iA1LVidmIt36BxQxo85y81Uq
 S/RQIOZzauCBcIPUyYnvRHPgyN67b61CvCIMJh3yAtcBX+9WobenX5OmtqNfD+D3tW5T
 +pFKDBby6NzaZtLtWfA/r/ga+1Bql4cSGsfAe/5EN9+lEOUtw25goiZs1mqrHvPkJNtC
 8IQI5kd90HhGWms3VxLOD9dTxIK+K2+SBYJvJl/LY+VYuK1V7/DVljS2pnWIUe8Ees4q
 6twOJcUNYKZmQyTh62JSDD/lw3iS0AKODB/Y5UDzixjBYgwB9+oHq3DPFHGAf8YXk5EM
 K8Ug==
X-Gm-Message-State: AOAM531qm7NJj37hgIhVOzeGLp7MIoyw7hfSpXMFoilWdAXAVrGjh0uZ
 OVuMmWSb0LijD4Z38uCK/XxUcGns
X-Google-Smtp-Source: ABdhPJzRKWVU4biTAQe3bQbckRg+1aZxBofiVzIkz9meC4SWb4HVi4UqblXPkL2BPOv5m8FjTw2TNA==
X-Received: by 2002:aa7:8e0c:: with SMTP id c12mr5141111pfr.38.1594079282325; 
 Mon, 06 Jul 2020 16:48:02 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id e15sm19647649pgt.17.2020.07.06.16.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 16:48:01 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/21] tests/tcg/xtensa: update test_fp0_arith for DFPU
Date: Mon,  6 Jul 2020 16:47:28 -0700
Message-Id: <20200706234737.32378-13-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200706234737.32378-1-jcmvbkbc@gmail.com>
References: <20200706234737.32378-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DFPU arithmetic opcodes update FSR flags. Add FSR parameters and
expected FSR register values for the arithmetic tests.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 tests/tcg/xtensa/fpu.h            | 142 ++++++++++++++++++++++++
 tests/tcg/xtensa/test_fp0_arith.S | 178 ++++++++++++++----------------
 2 files changed, 223 insertions(+), 97 deletions(-)
 create mode 100644 tests/tcg/xtensa/fpu.h

diff --git a/tests/tcg/xtensa/fpu.h b/tests/tcg/xtensa/fpu.h
new file mode 100644
index 000000000000..42e321747304
--- /dev/null
+++ b/tests/tcg/xtensa/fpu.h
@@ -0,0 +1,142 @@
+#if XCHAL_HAVE_DFP || XCHAL_HAVE_FP_DIV
+#define DFPU 1
+#else
+#define DFPU 0
+#endif
+
+#define FCR_RM_NEAREST 0
+#define FCR_RM_TRUNC   1
+#define FCR_RM_CEIL    2
+#define FCR_RM_FLOOR   3
+
+#define FSR__ 0x00000000
+#define FSR_I 0x00000080
+#define FSR_U 0x00000100
+#define FSR_O 0x00000200
+#define FSR_Z 0x00000400
+#define FSR_V 0x00000800
+
+#define FSR_UI (FSR_U | FSR_I)
+#define FSR_OI (FSR_O | FSR_I)
+
+#define F32_0           0x00000000
+#define F32_0_5         0x3f000000
+#define F32_1           0x3f800000
+#define F32_MAX         0x7f7fffff
+#define F32_PINF        0x7f800000
+#define F32_NINF        0xff800000
+
+#define F32_DNAN        0x7fc00000
+#define F32_SNAN(v)     (0x7f800000 | (v))
+#define F32_QNAN(v)     (0x7fc00000 | (v))
+
+#define F32_MINUS       0x80000000
+
+#define F64_0           0x0000000000000000
+#define F64_MIN_NORM    0x0010000000000000
+#define F64_1           0x3ff0000000000000
+#define F64_MAX_2       0x7fe0000000000000
+#define F64_MAX         0x7fefffffffffffff
+#define F64_PINF        0x7ff0000000000000
+#define F64_NINF        0xfff0000000000000
+
+#define F64_DNAN        0x7ff8000000000000
+#define F64_SNAN(v)     (0x7ff0000000000000 | (v))
+#define F64_QNAN(v)     (0x7ff8000000000000 | (v))
+
+#define F64_MINUS       0x8000000000000000
+
+.macro test_op1_rm op, fr0, fr1, v0, r, sr
+    movi    a2, 0
+    wur     a2, fsr
+    movfp   \fr0, \v0
+    \op     \fr1, \fr0
+    check_res \fr1, \r, \sr
+.endm
+
+.macro test_op2_rm op, fr0, fr1, fr2, v0, v1, r, sr
+    movi    a2, 0
+    wur     a2, fsr
+    movfp   \fr0, \v0
+    movfp   \fr1, \v1
+    \op     \fr2, \fr0, \fr1
+    check_res \fr2, \r, \sr
+.endm
+
+.macro test_op3_rm op, fr0, fr1, fr2, fr3, v0, v1, v2, r, sr
+    movi    a2, 0
+    wur     a2, fsr
+    movfp   \fr0, \v0
+    movfp   \fr1, \v1
+    movfp   \fr2, \v2
+    \op     \fr0, \fr1, \fr2
+    check_res \fr3, \r, \sr
+.endm
+
+.macro test_op1_ex op, fr0, fr1, v0, rm, r, sr
+    movi    a2, \rm
+    wur     a2, fcr
+    test_op1_rm \op, \fr0, \fr1, \v0, \r, \sr
+    movi    a2, (\rm) | 0x7c
+    wur     a2, fcr
+    test_op1_rm \op, \fr0, \fr1, \v0, \r, \sr
+.endm
+
+.macro test_op2_ex op, fr0, fr1, fr2, v0, v1, rm, r, sr
+    movi    a2, \rm
+    wur     a2, fcr
+    test_op2_rm \op, \fr0, \fr1, \fr2, \v0, \v1, \r, \sr
+    movi    a2, (\rm) | 0x7c
+    wur     a2, fcr
+    test_op2_rm \op, \fr0, \fr1, \fr2, \v0, \v1, \r, \sr
+.endm
+
+.macro test_op3_ex op, fr0, fr1, fr2, fr3, v0, v1, v2, rm, r, sr
+    movi    a2, \rm
+    wur     a2, fcr
+    test_op3_rm \op, \fr0, \fr1, \fr2, \fr3, \v0, \v1, \v2, \r, \sr
+    movi    a2, (\rm) | 0x7c
+    wur     a2, fcr
+    test_op3_rm \op, \fr0, \fr1, \fr2, \fr3, \v0, \v1, \v2, \r, \sr
+.endm
+
+.macro test_op1 op, fr0, fr1, v0, r0, r1, r2, r3, sr0, sr1, sr2, sr3
+    test_op1_ex \op, \fr0, \fr1, \v0, 0, \r0, \sr0
+    test_op1_ex \op, \fr0, \fr1, \v0, 1, \r1, \sr1
+    test_op1_ex \op, \fr0, \fr1, \v0, 2, \r2, \sr2
+    test_op1_ex \op, \fr0, \fr1, \v0, 3, \r3, \sr3
+.endm
+
+.macro test_op2 op, fr0, fr1, fr2, v0, v1, r0, r1, r2, r3, sr0, sr1, sr2, sr3
+    test_op2_ex \op, \fr0, \fr1, \fr2, \v0, \v1, 0, \r0, \sr0
+    test_op2_ex \op, \fr0, \fr1, \fr2, \v0, \v1, 1, \r1, \sr1
+    test_op2_ex \op, \fr0, \fr1, \fr2, \v0, \v1, 2, \r2, \sr2
+    test_op2_ex \op, \fr0, \fr1, \fr2, \v0, \v1, 3, \r3, \sr3
+.endm
+
+.macro test_op3 op, fr0, fr1, fr2, fr3, v0, v1, v2, r0, r1, r2, r3, sr0, sr1, sr2, sr3
+    test_op3_ex \op, \fr0, \fr1, \fr2, \fr3, \v0, \v1, \v2, 0, \r0, \sr0
+    test_op3_ex \op, \fr0, \fr1, \fr2, \fr3, \v0, \v1, \v2, 1, \r1, \sr1
+    test_op3_ex \op, \fr0, \fr1, \fr2, \fr3, \v0, \v1, \v2, 2, \r2, \sr2
+    test_op3_ex \op, \fr0, \fr1, \fr2, \fr3, \v0, \v1, \v2, 3, \r3, \sr3
+.endm
+
+.macro test_op2_cpe op
+    set_vector  kernel, 2f
+    movi    a2, 0
+    wsr     a2, cpenable
+1:
+    \op     f2, f0, f1
+    test_fail
+2:
+    rsr     a2, excvaddr
+    movi    a3, 1b
+    assert  eq, a2, a3
+    rsr     a2, exccause
+    movi    a3, 32
+    assert  eq, a2, a3
+
+    set_vector  kernel, 0
+    movi    a2, 1
+    wsr     a2, cpenable
+.endm
diff --git a/tests/tcg/xtensa/test_fp0_arith.S b/tests/tcg/xtensa/test_fp0_arith.S
index 253d033a3398..df870eb7a013 100644
--- a/tests/tcg/xtensa/test_fp0_arith.S
+++ b/tests/tcg/xtensa/test_fp0_arith.S
@@ -1,4 +1,5 @@
 #include "macros.inc"
+#include "fpu.h"
 
 test_suite fp0_arith
 
@@ -9,84 +10,18 @@ test_suite fp0_arith
     wfr     \fr, a2
 .endm
 
-.macro check_res fr, r
+.macro check_res fr, r, sr
     rfr     a2, \fr
     dump    a2
     movi    a3, \r
     assert  eq, a2, a3
     rur     a2, fsr
-    assert  eqi, a2, 0
-.endm
-
-.macro test_op2_rm op, fr0, fr1, fr2, v0, v1, r
-    movi    a2, 0
-    wur     a2, fsr
-    movfp   \fr0, \v0
-    movfp   \fr1, \v1
-    \op     \fr2, \fr0, \fr1
-    check_res \fr2, \r
-.endm
-
-.macro test_op3_rm op, fr0, fr1, fr2, fr3, v0, v1, v2, r
-    movi    a2, 0
-    wur     a2, fsr
-    movfp   \fr0, \v0
-    movfp   \fr1, \v1
-    movfp   \fr2, \v2
-    \op     \fr0, \fr1, \fr2
-    check_res \fr3, \r
-.endm
-
-.macro test_op2_ex op, fr0, fr1, fr2, v0, v1, rm, r
-    movi    a2, \rm
-    wur     a2, fcr
-    test_op2_rm \op, \fr0, \fr1, \fr2, \v0, \v1, \r
-    movi    a2, (\rm) | 0x7c
-    wur     a2, fcr
-    test_op2_rm \op, \fr0, \fr1, \fr2, \v0, \v1, \r
-.endm
-
-.macro test_op3_ex op, fr0, fr1, fr2, fr3, v0, v1, v2, rm, r
-    movi    a2, \rm
-    wur     a2, fcr
-    test_op3_rm \op, \fr0, \fr1, \fr2, \fr3, \v0, \v1, \v2, \r
-    movi    a2, (\rm) | 0x7c
-    wur     a2, fcr
-    test_op3_rm \op, \fr0, \fr1, \fr2, \fr3, \v0, \v1, \v2, \r
-.endm
-
-.macro test_op2 op, fr0, fr1, fr2, v0, v1, r0, r1, r2, r3
-    test_op2_ex \op, \fr0, \fr1, \fr2, \v0, \v1, 0, \r0
-    test_op2_ex \op, \fr0, \fr1, \fr2, \v0, \v1, 1, \r1
-    test_op2_ex \op, \fr0, \fr1, \fr2, \v0, \v1, 2, \r2
-    test_op2_ex \op, \fr0, \fr1, \fr2, \v0, \v1, 3, \r3
-.endm
-
-.macro test_op3 op, fr0, fr1, fr2, fr3, v0, v1, v2, r0, r1, r2, r3
-    test_op3_ex \op, \fr0, \fr1, \fr2, \fr3, \v0, \v1, \v2, 0, \r0
-    test_op3_ex \op, \fr0, \fr1, \fr2, \fr3, \v0, \v1, \v2, 1, \r1
-    test_op3_ex \op, \fr0, \fr1, \fr2, \fr3, \v0, \v1, \v2, 2, \r2
-    test_op3_ex \op, \fr0, \fr1, \fr2, \fr3, \v0, \v1, \v2, 3, \r3
-.endm
-
-.macro test_op2_cpe op
-    set_vector  kernel, 2f
-    movi    a2, 0
-    wsr     a2, cpenable
-1:
-    \op     f2, f0, f1
-    test_fail
-2:
-    rsr     a2, excvaddr
-    movi    a3, 1b
+#if DFPU
+    movi    a3, \sr
     assert  eq, a2, a3
-    rsr     a2, exccause
-    movi    a3, 32
-    assert  eq, a2, a3
-
-    set_vector  kernel, 0
-    movi    a2, 1
-    wsr     a2, cpenable
+#else
+    assert  eqi, a2, 0
+#endif
 .endm
 
 test add_s
@@ -94,78 +29,127 @@ test add_s
     wsr     a2, cpenable
 
     test_op2 add.s, f0, f1, f2, 0x3fc00000, 0x34400000, \
-        0x3fc00002, 0x3fc00001, 0x3fc00002, 0x3fc00001
+        0x3fc00002, 0x3fc00001, 0x3fc00002, 0x3fc00001, \
+             FSR_I,      FSR_I,      FSR_I,      FSR_I
     test_op2 add.s, f3, f4, f5, 0x3fc00000, 0x34a00000, \
-        0x3fc00002, 0x3fc00002, 0x3fc00003, 0x3fc00002
+        0x3fc00002, 0x3fc00002, 0x3fc00003, 0x3fc00002, \
+             FSR_I,      FSR_I,      FSR_I,      FSR_I
 
     /* MAX_FLOAT + MAX_FLOAT = +inf/MAX_FLOAT  */
     test_op2 add.s, f6, f7, f8, 0x7f7fffff, 0x7f7fffff, \
-        0x7f800000, 0x7f7fffff, 0x7f800000, 0x7f7fffff
+        0x7f800000, 0x7f7fffff, 0x7f800000, 0x7f7fffff, \
+            FSR_OI,     FSR_OI,     FSR_OI,     FSR_OI
 test_end
 
 test add_s_inf
     /* 1 + +inf = +inf  */
     test_op2 add.s, f6, f7, f8, 0x3fc00000, 0x7f800000, \
-        0x7f800000, 0x7f800000, 0x7f800000, 0x7f800000
+        0x7f800000, 0x7f800000, 0x7f800000, 0x7f800000, \
+             FSR__,      FSR__,      FSR__,      FSR__
 
     /* +inf + -inf = default NaN */
     test_op2 add.s, f0, f1, f2, 0x7f800000, 0xff800000, \
-        0x7fc00000, 0x7fc00000, 0x7fc00000, 0x7fc00000
+        0x7fc00000, 0x7fc00000, 0x7fc00000, 0x7fc00000, \
+             FSR_V,      FSR_V,      FSR_V,      FSR_V
 test_end
 
-test add_s_nan
-    /* 1 + NaN = NaN  */
+#if DFPU
+test add_s_nan_dfpu
+    /* 1 + QNaN = QNaN  */
     test_op2 add.s, f9, f10, f11, 0x3fc00000, 0x7fc00001, \
-        0x7fc00001, 0x7fc00001, 0x7fc00001, 0x7fc00001
+        0x7fc00001, 0x7fc00001, 0x7fc00001, 0x7fc00001, \
+             FSR__,      FSR__,      FSR__,      FSR__
+    /* 1 + SNaN = QNaN  */
     test_op2 add.s, f12, f13, f14, 0x3fc00000, 0x7f800001, \
-        0x7f800001, 0x7f800001, 0x7f800001, 0x7f800001
+        0x7fc00001, 0x7fc00001, 0x7fc00001, 0x7fc00001, \
+             FSR_V,      FSR_V,      FSR_V,      FSR_V
 
-    /* NaN1 + NaN2 = NaN1 */
+    /* SNaN1 + SNaN2 = QNaN2 */
+    test_op2 add.s, f15, f0, f1, 0x7f800001, 0x7fbfffff, \
+        0x7fffffff, 0x7fffffff, 0x7fffffff, 0x7fffffff, \
+             FSR_V,      FSR_V,      FSR_V,      FSR_V
+    test_op2 add.s, f2, f3, f4, 0x7fbfffff, 0x7f800001, \
+        0x7fc00001, 0x7fc00001, 0x7fc00001, 0x7fc00001, \
+             FSR_V,      FSR_V,      FSR_V,      FSR_V
+    /* QNaN1 + SNaN2 = QNaN2 */
+    test_op2 add.s, f5, f6, f7, 0x7fc00001, 0x7fbfffff, \
+        0x7fffffff, 0x7fffffff, 0x7fffffff, 0x7fffffff, \
+             FSR_V,      FSR_V,      FSR_V,      FSR_V
+    /* SNaN1 + QNaN2 = QNaN2 */
+    test_op2 add.s, f8, f9, f10, 0x7fbfffff, 0x7fc00001, \
+        0x7fc00001, 0x7fc00001, 0x7fc00001, 0x7fc00001, \
+             FSR_V,      FSR_V,      FSR_V,      FSR_V
+test_end
+#else
+test add_s_nan_fpu2k
+    /* 1 + QNaN = QNaN  */
+    test_op2 add.s, f9, f10, f11, 0x3fc00000, 0x7fc00001, \
+        0x7fc00001, 0x7fc00001, 0x7fc00001, 0x7fc00001, \
+             FSR__,      FSR__,      FSR__,      FSR__
+    /* 1 + SNaN = SNaN  */
+    test_op2 add.s, f12, f13, f14, 0x3fc00000, 0x7f800001, \
+        0x7f800001, 0x7f800001, 0x7f800001, 0x7f800001, \
+             FSR__,      FSR__,      FSR__,      FSR__
+    /* SNaN1 + SNaN2 = SNaN1 */
     test_op2 add.s, f15, f0, f1, 0x7f800001, 0x7fbfffff, \
-        0x7f800001, 0x7f800001, 0x7f800001, 0x7f800001
+        0x7f800001, 0x7f800001, 0x7f800001, 0x7f800001, \
+             FSR__,      FSR__,      FSR__,      FSR__
     test_op2 add.s, f2, f3, f4, 0x7fbfffff, 0x7f800001, \
-        0x7fbfffff, 0x7fbfffff, 0x7fbfffff, 0x7fbfffff
+        0x7fbfffff, 0x7fbfffff, 0x7fbfffff, 0x7fbfffff, \
+             FSR__,      FSR__,      FSR__,      FSR__
+    /* QNaN1 + SNaN2 = QNaN1 */
     test_op2 add.s, f5, f6, f7, 0x7fc00001, 0x7fbfffff, \
-        0x7fc00001, 0x7fc00001, 0x7fc00001, 0x7fc00001
+        0x7fc00001, 0x7fc00001, 0x7fc00001, 0x7fc00001, \
+             FSR__,      FSR__,      FSR__,      FSR__
+    /* SNaN1 + QNaN2 = SNaN1 */
     test_op2 add.s, f8, f9, f10, 0x7fbfffff, 0x7fc00001, \
-        0x7fbfffff, 0x7fbfffff, 0x7fbfffff, 0x7fbfffff
+        0x7fbfffff, 0x7fbfffff, 0x7fbfffff, 0x7fbfffff, \
+             FSR__,      FSR__,      FSR__,      FSR__
 test_end
+#endif
 
 test sub_s
     test_op2 sub.s, f0, f1, f0, 0x3f800001, 0x33800000, \
-        0x3f800000, 0x3f800000, 0x3f800001, 0x3f800000
+        0x3f800000, 0x3f800000, 0x3f800001, 0x3f800000, \
+             FSR_I,      FSR_I,      FSR_I,      FSR_I
     test_op2 sub.s, f0, f1, f1, 0x3f800002, 0x33800000, \
-        0x3f800002, 0x3f800001, 0x3f800002, 0x3f800001
+        0x3f800002, 0x3f800001, 0x3f800002, 0x3f800001, \
+             FSR_I,      FSR_I,      FSR_I,      FSR_I
 
     /* norm - norm = denorm */
     test_op2 sub.s, f6, f7, f8, 0x00800001, 0x00800000, \
-        0x00000001, 0x00000001, 0x00000001, 0x00000001
+        0x00000001, 0x00000001, 0x00000001, 0x00000001, \
+             FSR__,      FSR__,      FSR__,      FSR__
 test_end
 
 test mul_s
     test_op2 mul.s, f0, f1, f2, 0x3f800001, 0x3f800001, \
-        0x3f800002, 0x3f800002, 0x3f800003, 0x3f800002
-
+        0x3f800002, 0x3f800002, 0x3f800003, 0x3f800002, \
+             FSR_I,      FSR_I,      FSR_I,      FSR_I
     /* MAX_FLOAT/2 * MAX_FLOAT/2 = +inf/MAX_FLOAT  */
     test_op2 mul.s, f6, f7, f8, 0x7f000000, 0x7f000000, \
-        0x7f800000, 0x7f7fffff, 0x7f800000, 0x7f7fffff
+        0x7f800000, 0x7f7fffff, 0x7f800000, 0x7f7fffff, \
+            FSR_OI,     FSR_OI,     FSR_OI,     FSR_OI
     /* min norm * min norm = 0/denorm */
     test_op2 mul.s, f6, f7, f8, 0x00800001, 0x00800000, \
-        0x00000000, 0x00000000, 0x00000001, 0x00000000
-
+        0x00000000, 0x00000000, 0x00000001, 0x00000000, \
+            FSR_UI,     FSR_UI,     FSR_UI,     FSR_UI
     /* inf * 0 = default NaN */
     test_op2 mul.s, f6, f7, f8, 0x7f800000, 0x00000000, \
-        0x7fc00000, 0x7fc00000, 0x7fc00000, 0x7fc00000
+        0x7fc00000, 0x7fc00000, 0x7fc00000, 0x7fc00000, \
+             FSR_V,      FSR_V,      FSR_V,      FSR_V
 test_end
 
 test madd_s
     test_op3 madd.s, f0, f1, f2, f0, 0, 0x3f800001, 0x3f800001, \
-        0x3f800002, 0x3f800002, 0x3f800003, 0x3f800002
+        0x3f800002, 0x3f800002, 0x3f800003, 0x3f800002, \
+             FSR_I,      FSR_I,      FSR_I,      FSR_I
 test_end
 
 test msub_s
     test_op3 msub.s, f0, f1, f2, f0, 0x3f800000, 0x3f800001, 0x3f800001, \
-        0xb4800000, 0xb4800000, 0xb4800000, 0xb4800001
+        0xb4800000, 0xb4800000, 0xb4800000, 0xb4800001, \
+             FSR_I,      FSR_I,      FSR_I,      FSR_I
 test_end
 
 #endif
-- 
2.20.1


