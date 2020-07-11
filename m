Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC3D21C3F2
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jul 2020 13:19:17 +0200 (CEST)
Received: from localhost ([::1]:45822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juDXI-0005D7-LN
	for lists+qemu-devel@lfdr.de; Sat, 11 Jul 2020 07:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1juDMT-0004kL-BB
 for qemu-devel@nongnu.org; Sat, 11 Jul 2020 07:08:06 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1juDMR-0006Op-0R
 for qemu-devel@nongnu.org; Sat, 11 Jul 2020 07:08:05 -0400
Received: by mail-pg1-x541.google.com with SMTP id d4so3695906pgk.4
 for <qemu-devel@nongnu.org>; Sat, 11 Jul 2020 04:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=643YbMqUe3cU9Y3BkZ4lZoPyP5SXzuFH+wHJ5r5v8mE=;
 b=GY5O6pl+zitrLdEOSspjmWia7g/R1NcZleIx1bbamYGk7SN3qdTsFs85jg3Sp31Sen
 gvxQYyCFJ/+N9SFO08XvWmf/bVU/MdlR+HDRf8mCvswnN8Rf8kQuXfJrTVuTi6H6j5ql
 l7dSWEL4Qd9wDPp1fKBVLzy1nIrTaLGS32Gu644w5N3Mkwi4NtjO7E4b72SuclaU0nMj
 JbB9ruVbW/qEwX369rkwrlPTEezyHFRGQzS3fHw9xtM/D6tx6GSISCqvd9D03KLGXHaj
 kOkJ5/NJZe9YcG57eKdx9xpIRTvMH14W3l5C5GHvT+qaKJqVCtwHPjIpyCq/TlurPyQq
 PlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=643YbMqUe3cU9Y3BkZ4lZoPyP5SXzuFH+wHJ5r5v8mE=;
 b=Q0AQS7M5Oc4odktlaPioVr7kAaP5ulHZlqOnVGjcVntLG0fESm37232fjPS/DVkYuU
 RvJsIKN95oKhtibD/a3hm1qAdcp0JYq1fPeYdvFMjdcdesvw4aaUHVaCc2FlTDvEP09P
 XLh9Oz2owMZyKB1JAIcBHa/kcQTilB8FvHWoh+8NB5IxIO4PDq/yKeR5QlXfWewyM00b
 KUQaqeGOFxUda1gOMJhLchyvzN6241cRb2zR6Kp1bh1Ym0KBNbjBXnZ9AvNsZMftkZSu
 Q6SiruKOgDoXqtT40Dh+cWzjbdutMTaDBVt3HAAj5WPHkZMixAg+EOB2BqgWZ7jyz1Q6
 lbhw==
X-Gm-Message-State: AOAM530436Ek/MG52PiNYSNdjoYD5ZaNlCZwGzxo7B0ydP1t+gsw32vZ
 sbr20ucFQyr2aJsrX9kdm4NYje59
X-Google-Smtp-Source: ABdhPJzIqOR4x2mO3G0A7rbswqFOpIC8tF4/TuSRQIeDSWaRaznS+tLDqzKd2XUxLiqkbeuLfDYZaQ==
X-Received: by 2002:a63:182:: with SMTP id 124mr58137177pgb.288.1594465681303; 
 Sat, 11 Jul 2020 04:08:01 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id m31sm8925826pjb.52.2020.07.11.04.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2020 04:08:00 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/22] tests/tcg/xtensa: update test_fp0_conv for DFPU
Date: Sat, 11 Jul 2020 04:06:50 -0700
Message-Id: <20200711110655.20287-16-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200711110655.20287-1-jcmvbkbc@gmail.com>
References: <20200711110655.20287-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DFPU conversion opcodes update FSR flags. Add FSR parameters and
expected FSR register values for the conversion tests.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 tests/tcg/xtensa/test_fp0_conv.S | 299 ++++++++++++++++---------------
 1 file changed, 155 insertions(+), 144 deletions(-)

diff --git a/tests/tcg/xtensa/test_fp0_conv.S b/tests/tcg/xtensa/test_fp0_conv.S
index 147e3d5062df..cfee6e51790c 100644
--- a/tests/tcg/xtensa/test_fp0_conv.S
+++ b/tests/tcg/xtensa/test_fp0_conv.S
@@ -1,4 +1,5 @@
 #include "macros.inc"
+#include "fpu.h"
 
 test_suite fp0_conv
 
@@ -9,7 +10,7 @@ test_suite fp0_conv
     wfr     \fr, a2
 .endm
 
-.macro test_ftoi_ex op, r0, fr0, v, c, r
+.macro test_ftoi_ex op, r0, fr0, v, c, r, sr
     movi    a2, 0
     wur     a2, fsr
     movfp   \fr0, \v
@@ -18,20 +19,25 @@ test_suite fp0_conv
     movi    a3, \r
     assert  eq, \r0, a3
     rur     a2, fsr
+#if DFPU
+    movi    a3, \sr
+    assert  eq, a2, a3
+#else
     assert  eqi, a2, 0
+#endif
 .endm
 
-.macro test_ftoi op, r0, fr0, v, c, r
+.macro test_ftoi op, r0, fr0, v, c, r, sr
     movi    a2, 0
     wur     a2, fcr
-    test_ftoi_ex \op, \r0, \fr0, \v, \c, \r
+    test_ftoi_ex \op, \r0, \fr0, \v, \c, \r, \sr
     movi    a2, 0x7c
     wur     a2, fcr
-    test_ftoi_ex \op, \r0, \fr0, \v, \c, \r
+    test_ftoi_ex \op, \r0, \fr0, \v, \c, \r, \sr
 .endm
 
 
-.macro test_itof_ex op, fr0, ar0, v, c, r
+.macro test_itof_ex op, fr0, ar0, v, c, r, sr
     movi    a2, 0
     wur     a2, fsr
     movi    \ar0, \v
@@ -42,23 +48,28 @@ test_suite fp0_conv
     movi    a3, \r
     assert  eq, a2, a3
     rur     a2, fsr
+#if DFPU
+    movi    a3, \sr
+    assert  eq, a2, a3
+#else
     assert  eqi, a2, 0
+#endif
 .endm
 
-.macro test_itof_rm op, fr0, ar0, v, c, rm, r
+.macro test_itof_rm op, fr0, ar0, v, c, rm, r, sr
     movi    a2, \rm
     wur     a2, fcr
-    test_itof_ex \op, \fr0, \ar0, \v, \c, \r
+    test_itof_ex \op, \fr0, \ar0, \v, \c, \r, \sr
     movi    a2, (\rm) | 0x7c
     wur     a2, fcr
-    test_itof_ex \op, \fr0, \ar0, \v, \c, \r
+    test_itof_ex \op, \fr0, \ar0, \v, \c, \r, \sr
 .endm
 
-.macro test_itof op, fr0, ar0, v, c, r0, r1, r2, r3
-    test_itof_rm \op, \fr0, \ar0, \v, \c, 0, \r0
-    test_itof_rm \op, \fr0, \ar0, \v, \c, 1, \r1
-    test_itof_rm \op, \fr0, \ar0, \v, \c, 2, \r2
-    test_itof_rm \op, \fr0, \ar0, \v, \c, 3, \r3
+.macro test_itof op, fr0, ar0, v, c, r0, r1, r2, r3, sr
+    test_itof_rm \op, \fr0, \ar0, \v, \c, 0, \r0, \sr
+    test_itof_rm \op, \fr0, \ar0, \v, \c, 1, \r1, \sr
+    test_itof_rm \op, \fr0, \ar0, \v, \c, 2, \r2, \sr
+    test_itof_rm \op, \fr0, \ar0, \v, \c, 3, \r3, \sr
 .endm
 
 test round_s
@@ -66,237 +77,237 @@ test round_s
     wsr     a2, cpenable
 
     /* NaN */
-    test_ftoi round.s, a2, f0, 0xffc00001, 0, 0x7fffffff
-    test_ftoi round.s, a2, f0, 0xff800001, 0, 0x7fffffff
+    test_ftoi round.s, a2, f0, 0xffc00001, 0, 0x7fffffff, FSR_V
+    test_ftoi round.s, a2, f0, 0xff800001, 0, 0x7fffffff, FSR_V
 
     /* -inf */
-    test_ftoi round.s, a2, f0, 0xff800000, 0, 0x80000000
+    test_ftoi round.s, a2, f0, 0xff800000, 0, 0x80000000, FSR_V
 
     /* negative overflow */
-    test_ftoi round.s, a2, f0, 0xceffffff, 1, 0x80000000
-    test_ftoi round.s, a2, f0, 0xcf000000, 0, 0x80000000
-    test_ftoi round.s, a2, f0, 0xceffffff, 0, 0x80000080
+    test_ftoi round.s, a2, f0, 0xceffffff, 1, 0x80000000, FSR_V
+    test_ftoi round.s, a2, f0, 0xcf000000, 0, 0x80000000, FSR__
+    test_ftoi round.s, a2, f0, 0xceffffff, 0, 0x80000080, FSR__
 
     /* negative */
-    test_ftoi round.s, a2, f0, 0xbfa00000, 1, -2 /* -1.25 * 2 */
-    test_ftoi round.s, a2, f0, 0xbfc00000, 0, -2 /* -1.5 */
-    test_ftoi round.s, a2, f0, 0xbf800000, 1, -2 /* -1 * 2 */
-    test_ftoi round.s, a2, f0, 0xbf800000, 0, -1 /* -1 */
-    test_ftoi round.s, a2, f0, 0xbf400000, 0, -1 /* -0.75 */
-    test_ftoi round.s, a2, f0, 0xbf000000, 0, 0  /* -0.5 */
+    test_ftoi round.s, a2, f0, 0xbfa00000, 1, -2, FSR_I  /* -1.25 * 2 */
+    test_ftoi round.s, a2, f0, 0xbfc00000, 0, -2, FSR_I  /* -1.5 */
+    test_ftoi round.s, a2, f0, 0xbf800000, 1, -2, FSR__  /* -1 * 2 */
+    test_ftoi round.s, a2, f0, 0xbf800000, 0, -1, FSR__  /* -1 */
+    test_ftoi round.s, a2, f0, 0xbf400000, 0, -1, FSR_I  /* -0.75 */
+    test_ftoi round.s, a2, f0, 0xbf000000, 0,  0, FSR_I  /* -0.5 */
 
     /* positive */
-    test_ftoi round.s, a2, f0, 0x3f000000, 0, 0 /* 0.5 */
-    test_ftoi round.s, a2, f0, 0x3f400000, 0, 1 /* 0.75 */
-    test_ftoi round.s, a2, f0, 0x3f800000, 0, 1 /* 1 */
-    test_ftoi round.s, a2, f0, 0x3f800000, 1, 2 /* 1 * 2 */
-    test_ftoi round.s, a2, f0, 0x3fc00000, 0, 2 /* 1.5 */
-    test_ftoi round.s, a2, f0, 0x3fa00000, 1, 2 /* 1.25 * 2 */
+    test_ftoi round.s, a2, f0, 0x3f000000, 0, 0, FSR_I /* 0.5 */
+    test_ftoi round.s, a2, f0, 0x3f400000, 0, 1, FSR_I /* 0.75 */
+    test_ftoi round.s, a2, f0, 0x3f800000, 0, 1, FSR__ /* 1 */
+    test_ftoi round.s, a2, f0, 0x3f800000, 1, 2, FSR__ /* 1 * 2 */
+    test_ftoi round.s, a2, f0, 0x3fc00000, 0, 2, FSR_I /* 1.5 */
+    test_ftoi round.s, a2, f0, 0x3fa00000, 1, 2, FSR_I /* 1.25 * 2 */
 
     /* positive overflow */
-    test_ftoi round.s, a2, f0, 0x4effffff, 0, 0x7fffff80
-    test_ftoi round.s, a2, f0, 0x4f000000, 0, 0x7fffffff
-    test_ftoi round.s, a2, f0, 0x4effffff, 1, 0x7fffffff
+    test_ftoi round.s, a2, f0, 0x4effffff, 0, 0x7fffff80, FSR__
+    test_ftoi round.s, a2, f0, 0x4f000000, 0, 0x7fffffff, FSR_V
+    test_ftoi round.s, a2, f0, 0x4effffff, 1, 0x7fffffff, FSR_V
 
     /* +inf */
-    test_ftoi round.s, a2, f0, 0x7f800000, 0, 0x7fffffff
+    test_ftoi round.s, a2, f0, 0x7f800000, 0, 0x7fffffff, FSR_V
 
     /* NaN */
-    test_ftoi round.s, a2, f0, 0x7f800001, 0, 0x7fffffff
-    test_ftoi round.s, a2, f0, 0x7fc00000, 0, 0x7fffffff
+    test_ftoi round.s, a2, f0, 0x7f800001, 0, 0x7fffffff, FSR_V
+    test_ftoi round.s, a2, f0, 0x7fc00000, 0, 0x7fffffff, FSR_V
 test_end
 
 test trunc_s
     /* NaN */
-    test_ftoi trunc.s, a2, f0, 0xffc00001, 0, 0x7fffffff
-    test_ftoi trunc.s, a2, f0, 0xff800001, 0, 0x7fffffff
+    test_ftoi trunc.s, a2, f0, 0xffc00001, 0, 0x7fffffff, FSR_V
+    test_ftoi trunc.s, a2, f0, 0xff800001, 0, 0x7fffffff, FSR_V
 
     /* -inf */
-    test_ftoi trunc.s, a2, f0, 0xff800000, 0, 0x80000000
+    test_ftoi trunc.s, a2, f0, 0xff800000, 0, 0x80000000, FSR_V
 
     /* negative overflow */
-    test_ftoi trunc.s, a2, f0, 0xceffffff, 1, 0x80000000
-    test_ftoi trunc.s, a2, f0, 0xcf000000, 0, 0x80000000
-    test_ftoi trunc.s, a2, f0, 0xceffffff, 0, 0x80000080
+    test_ftoi trunc.s, a2, f0, 0xceffffff, 1, 0x80000000, FSR_V
+    test_ftoi trunc.s, a2, f0, 0xcf000000, 0, 0x80000000, FSR__
+    test_ftoi trunc.s, a2, f0, 0xceffffff, 0, 0x80000080, FSR__
 
     /* negative */
-    test_ftoi trunc.s, a2, f0, 0xbfa00000, 1, -2 /* -1.25 * 2 */
-    test_ftoi trunc.s, a2, f0, 0xbfc00000, 0, -1 /* -1.5 */
-    test_ftoi trunc.s, a2, f0, 0xbf800000, 1, -2 /* -1 * 2 */
-    test_ftoi trunc.s, a2, f0, 0xbf800000, 0, -1 /* -1 */
-    test_ftoi trunc.s, a2, f0, 0xbf400000, 0, 0  /* -0.75 */
-    test_ftoi trunc.s, a2, f0, 0xbf000000, 0, 0  /* -0.5 */
+    test_ftoi trunc.s, a2, f0, 0xbfa00000, 1, -2, FSR_I /* -1.25 * 2 */
+    test_ftoi trunc.s, a2, f0, 0xbfc00000, 0, -1, FSR_I /* -1.5 */
+    test_ftoi trunc.s, a2, f0, 0xbf800000, 1, -2, FSR__ /* -1 * 2 */
+    test_ftoi trunc.s, a2, f0, 0xbf800000, 0, -1, FSR__ /* -1 */
+    test_ftoi trunc.s, a2, f0, 0xbf400000, 0,  0, FSR_I /* -0.75 */
+    test_ftoi trunc.s, a2, f0, 0xbf000000, 0,  0, FSR_I /* -0.5 */
 
     /* positive */
-    test_ftoi trunc.s, a2, f0, 0x3f000000, 0, 0 /* 0.5 */
-    test_ftoi trunc.s, a2, f0, 0x3f400000, 0, 0 /* 0.75 */
-    test_ftoi trunc.s, a2, f0, 0x3f800000, 0, 1 /* 1 */
-    test_ftoi trunc.s, a2, f0, 0x3f800000, 1, 2 /* 1 * 2 */
-    test_ftoi trunc.s, a2, f0, 0x3fc00000, 0, 1 /* 1.5 */
-    test_ftoi trunc.s, a2, f0, 0x3fa00000, 1, 2 /* 1.25 * 2 */
+    test_ftoi trunc.s, a2, f0, 0x3f000000, 0, 0, FSR_I /* 0.5 */
+    test_ftoi trunc.s, a2, f0, 0x3f400000, 0, 0, FSR_I /* 0.75 */
+    test_ftoi trunc.s, a2, f0, 0x3f800000, 0, 1, FSR__ /* 1 */
+    test_ftoi trunc.s, a2, f0, 0x3f800000, 1, 2, FSR__ /* 1 * 2 */
+    test_ftoi trunc.s, a2, f0, 0x3fc00000, 0, 1, FSR_I /* 1.5 */
+    test_ftoi trunc.s, a2, f0, 0x3fa00000, 1, 2, FSR_I /* 1.25 * 2 */
 
     /* positive overflow */
-    test_ftoi trunc.s, a2, f0, 0x4effffff, 0, 0x7fffff80
-    test_ftoi trunc.s, a2, f0, 0x4f000000, 0, 0x7fffffff
-    test_ftoi trunc.s, a2, f0, 0x4effffff, 1, 0x7fffffff
+    test_ftoi trunc.s, a2, f0, 0x4effffff, 0, 0x7fffff80, FSR__
+    test_ftoi trunc.s, a2, f0, 0x4f000000, 0, 0x7fffffff, FSR_V
+    test_ftoi trunc.s, a2, f0, 0x4effffff, 1, 0x7fffffff, FSR_V
 
     /* +inf */
-    test_ftoi trunc.s, a2, f0, 0x7f800000, 0, 0x7fffffff
+    test_ftoi trunc.s, a2, f0, 0x7f800000, 0, 0x7fffffff, FSR_V
 
     /* NaN */
-    test_ftoi trunc.s, a2, f0, 0x7f800001, 0, 0x7fffffff
-    test_ftoi trunc.s, a2, f0, 0x7fc00000, 0, 0x7fffffff
+    test_ftoi trunc.s, a2, f0, 0x7f800001, 0, 0x7fffffff, FSR_V
+    test_ftoi trunc.s, a2, f0, 0x7fc00000, 0, 0x7fffffff, FSR_V
 test_end
 
 test floor_s
     /* NaN */
-    test_ftoi floor.s, a2, f0, 0xffc00001, 0, 0x7fffffff
-    test_ftoi floor.s, a2, f0, 0xff800001, 0, 0x7fffffff
+    test_ftoi floor.s, a2, f0, 0xffc00001, 0, 0x7fffffff, FSR_V
+    test_ftoi floor.s, a2, f0, 0xff800001, 0, 0x7fffffff, FSR_V
 
     /* -inf */
-    test_ftoi floor.s, a2, f0, 0xff800000, 0, 0x80000000
+    test_ftoi floor.s, a2, f0, 0xff800000, 0, 0x80000000, FSR_V
 
     /* negative overflow */
-    test_ftoi floor.s, a2, f0, 0xceffffff, 1, 0x80000000
-    test_ftoi floor.s, a2, f0, 0xcf000000, 0, 0x80000000
-    test_ftoi floor.s, a2, f0, 0xceffffff, 0, 0x80000080
+    test_ftoi floor.s, a2, f0, 0xceffffff, 1, 0x80000000, FSR_V
+    test_ftoi floor.s, a2, f0, 0xcf000000, 0, 0x80000000, FSR__
+    test_ftoi floor.s, a2, f0, 0xceffffff, 0, 0x80000080, FSR__
 
     /* negative */
-    test_ftoi floor.s, a2, f0, 0xbfa00000, 1, -3 /* -1.25 * 2 */
-    test_ftoi floor.s, a2, f0, 0xbfc00000, 0, -2 /* -1.5 */
-    test_ftoi floor.s, a2, f0, 0xbf800000, 1, -2 /* -1 * 2 */
-    test_ftoi floor.s, a2, f0, 0xbf800000, 0, -1 /* -1 */
-    test_ftoi floor.s, a2, f0, 0xbf400000, 0, -1 /* -0.75 */
-    test_ftoi floor.s, a2, f0, 0xbf000000, 0, -1 /* -0.5 */
+    test_ftoi floor.s, a2, f0, 0xbfa00000, 1, -3, FSR_I /* -1.25 * 2 */
+    test_ftoi floor.s, a2, f0, 0xbfc00000, 0, -2, FSR_I /* -1.5 */
+    test_ftoi floor.s, a2, f0, 0xbf800000, 1, -2, FSR__ /* -1 * 2 */
+    test_ftoi floor.s, a2, f0, 0xbf800000, 0, -1, FSR__ /* -1 */
+    test_ftoi floor.s, a2, f0, 0xbf400000, 0, -1, FSR_I /* -0.75 */
+    test_ftoi floor.s, a2, f0, 0xbf000000, 0, -1, FSR_I /* -0.5 */
 
     /* positive */
-    test_ftoi floor.s, a2, f0, 0x3f000000, 0, 0 /* 0.5 */
-    test_ftoi floor.s, a2, f0, 0x3f400000, 0, 0 /* 0.75 */
-    test_ftoi floor.s, a2, f0, 0x3f800000, 0, 1 /* 1 */
-    test_ftoi floor.s, a2, f0, 0x3f800000, 1, 2 /* 1 * 2 */
-    test_ftoi floor.s, a2, f0, 0x3fc00000, 0, 1 /* 1.5 */
-    test_ftoi floor.s, a2, f0, 0x3fa00000, 1, 2 /* 1.25 * 2 */
+    test_ftoi floor.s, a2, f0, 0x3f000000, 0, 0, FSR_I /* 0.5 */
+    test_ftoi floor.s, a2, f0, 0x3f400000, 0, 0, FSR_I /* 0.75 */
+    test_ftoi floor.s, a2, f0, 0x3f800000, 0, 1, FSR__ /* 1 */
+    test_ftoi floor.s, a2, f0, 0x3f800000, 1, 2, FSR__ /* 1 * 2 */
+    test_ftoi floor.s, a2, f0, 0x3fc00000, 0, 1, FSR_I /* 1.5 */
+    test_ftoi floor.s, a2, f0, 0x3fa00000, 1, 2, FSR_I /* 1.25 * 2 */
 
     /* positive overflow */
-    test_ftoi floor.s, a2, f0, 0x4effffff, 0, 0x7fffff80
-    test_ftoi floor.s, a2, f0, 0x4f000000, 0, 0x7fffffff
-    test_ftoi floor.s, a2, f0, 0x4effffff, 1, 0x7fffffff
+    test_ftoi floor.s, a2, f0, 0x4effffff, 0, 0x7fffff80, FSR__
+    test_ftoi floor.s, a2, f0, 0x4f000000, 0, 0x7fffffff, FSR_V
+    test_ftoi floor.s, a2, f0, 0x4effffff, 1, 0x7fffffff, FSR_V
 
     /* +inf */
-    test_ftoi floor.s, a2, f0, 0x7f800000, 0, 0x7fffffff
+    test_ftoi floor.s, a2, f0, 0x7f800000, 0, 0x7fffffff, FSR_V
 
     /* NaN */
-    test_ftoi floor.s, a2, f0, 0x7f800001, 0, 0x7fffffff
-    test_ftoi floor.s, a2, f0, 0x7fc00000, 0, 0x7fffffff
+    test_ftoi floor.s, a2, f0, 0x7f800001, 0, 0x7fffffff, FSR_V
+    test_ftoi floor.s, a2, f0, 0x7fc00000, 0, 0x7fffffff, FSR_V
 test_end
 
 test ceil_s
     /* NaN */
-    test_ftoi ceil.s, a2, f0, 0xffc00001, 0, 0x7fffffff
-    test_ftoi ceil.s, a2, f0, 0xff800001, 0, 0x7fffffff
+    test_ftoi ceil.s, a2, f0, 0xffc00001, 0, 0x7fffffff, FSR_V
+    test_ftoi ceil.s, a2, f0, 0xff800001, 0, 0x7fffffff, FSR_V
 
     /* -inf */
-    test_ftoi ceil.s, a2, f0, 0xff800000, 0, 0x80000000
+    test_ftoi ceil.s, a2, f0, 0xff800000, 0, 0x80000000, FSR_V
 
     /* negative overflow */
-    test_ftoi ceil.s, a2, f0, 0xceffffff, 1, 0x80000000
-    test_ftoi ceil.s, a2, f0, 0xcf000000, 0, 0x80000000
-    test_ftoi ceil.s, a2, f0, 0xceffffff, 0, 0x80000080
+    test_ftoi ceil.s, a2, f0, 0xceffffff, 1, 0x80000000, FSR_V
+    test_ftoi ceil.s, a2, f0, 0xcf000000, 0, 0x80000000, FSR__
+    test_ftoi ceil.s, a2, f0, 0xceffffff, 0, 0x80000080, FSR__
 
     /* negative */
-    test_ftoi ceil.s, a2, f0, 0xbfa00000, 1, -2 /* -1.25 * 2 */
-    test_ftoi ceil.s, a2, f0, 0xbfc00000, 0, -1 /* -1.5 */
-    test_ftoi ceil.s, a2, f0, 0xbf800000, 1, -2 /* -1 * 2 */
-    test_ftoi ceil.s, a2, f0, 0xbf800000, 0, -1 /* -1 */
-    test_ftoi ceil.s, a2, f0, 0xbf400000, 0, 0  /* -0.75 */
-    test_ftoi ceil.s, a2, f0, 0xbf000000, 0, 0  /* -0.5 */
+    test_ftoi ceil.s, a2, f0, 0xbfa00000, 1, -2, FSR_I /* -1.25 * 2 */
+    test_ftoi ceil.s, a2, f0, 0xbfc00000, 0, -1, FSR_I /* -1.5 */
+    test_ftoi ceil.s, a2, f0, 0xbf800000, 1, -2, FSR__ /* -1 * 2 */
+    test_ftoi ceil.s, a2, f0, 0xbf800000, 0, -1, FSR__ /* -1 */
+    test_ftoi ceil.s, a2, f0, 0xbf400000, 0,  0, FSR_I /* -0.75 */
+    test_ftoi ceil.s, a2, f0, 0xbf000000, 0,  0, FSR_I /* -0.5 */
 
     /* positive */
-    test_ftoi ceil.s, a2, f0, 0x3f000000, 0, 1 /* 0.5 */
-    test_ftoi ceil.s, a2, f0, 0x3f400000, 0, 1 /* 0.75 */
-    test_ftoi ceil.s, a2, f0, 0x3f800000, 0, 1 /* 1 */
-    test_ftoi ceil.s, a2, f0, 0x3f800000, 1, 2 /* 1 * 2 */
-    test_ftoi ceil.s, a2, f0, 0x3fc00000, 0, 2 /* 1.5 */
-    test_ftoi ceil.s, a2, f0, 0x3fa00000, 1, 3 /* 1.25 * 2 */
+    test_ftoi ceil.s, a2, f0, 0x3f000000, 0, 1, FSR_I /* 0.5 */
+    test_ftoi ceil.s, a2, f0, 0x3f400000, 0, 1, FSR_I /* 0.75 */
+    test_ftoi ceil.s, a2, f0, 0x3f800000, 0, 1, FSR__ /* 1 */
+    test_ftoi ceil.s, a2, f0, 0x3f800000, 1, 2, FSR__ /* 1 * 2 */
+    test_ftoi ceil.s, a2, f0, 0x3fc00000, 0, 2, FSR_I /* 1.5 */
+    test_ftoi ceil.s, a2, f0, 0x3fa00000, 1, 3, FSR_I /* 1.25 * 2 */
 
     /* positive overflow */
-    test_ftoi ceil.s, a2, f0, 0x4effffff, 0, 0x7fffff80
-    test_ftoi ceil.s, a2, f0, 0x4f000000, 0, 0x7fffffff
-    test_ftoi ceil.s, a2, f0, 0x4effffff, 1, 0x7fffffff
+    test_ftoi ceil.s, a2, f0, 0x4effffff, 0, 0x7fffff80, FSR__
+    test_ftoi ceil.s, a2, f0, 0x4f000000, 0, 0x7fffffff, FSR_V
+    test_ftoi ceil.s, a2, f0, 0x4effffff, 1, 0x7fffffff, FSR_V
 
     /* +inf */
-    test_ftoi ceil.s, a2, f0, 0x7f800000, 0, 0x7fffffff
+    test_ftoi ceil.s, a2, f0, 0x7f800000, 0, 0x7fffffff, FSR_V
 
     /* NaN */
-    test_ftoi ceil.s, a2, f0, 0x7f800001, 0, 0x7fffffff
-    test_ftoi ceil.s, a2, f0, 0x7fc00000, 0, 0x7fffffff
+    test_ftoi ceil.s, a2, f0, 0x7f800001, 0, 0x7fffffff, FSR_V
+    test_ftoi ceil.s, a2, f0, 0x7fc00000, 0, 0x7fffffff, FSR_V
 test_end
 
 test utrunc_s
     /* NaN */
-    test_ftoi utrunc.s, a2, f0, 0xffc00001, 0, 0xffffffff
-    test_ftoi utrunc.s, a2, f0, 0xff800001, 0, 0xffffffff
+    test_ftoi utrunc.s, a2, f0, 0xffc00001, 0, 0xffffffff, FSR_V
+    test_ftoi utrunc.s, a2, f0, 0xff800001, 0, 0xffffffff, FSR_V
 
     /* -inf */
-    test_ftoi utrunc.s, a2, f0, 0xff800000, 0, 0x80000000
+    test_ftoi utrunc.s, a2, f0, 0xff800000, 0, 0x80000000, FSR_V
 
     /* negative overflow */
-    test_ftoi utrunc.s, a2, f0, 0xceffffff, 1, 0x80000000
-    test_ftoi utrunc.s, a2, f0, 0xcf000000, 0, 0x80000000
-    test_ftoi utrunc.s, a2, f0, 0xceffffff, 0, 0x80000080
+    test_ftoi utrunc.s, a2, f0, 0xceffffff, 1, 0x80000000, FSR_V
+    test_ftoi utrunc.s, a2, f0, 0xcf000000, 0, 0x80000000, FSR_V
+    test_ftoi utrunc.s, a2, f0, 0xceffffff, 0, 0x80000080, FSR_V
 
     /* negative */
-    test_ftoi utrunc.s, a2, f0, 0xbfa00000, 1, -2 /* -1.25 * 2 */
-    test_ftoi utrunc.s, a2, f0, 0xbfc00000, 0, -1 /* -1.5 */
-    test_ftoi utrunc.s, a2, f0, 0xbf800000, 1, -2 /* -1 * 2 */
-    test_ftoi utrunc.s, a2, f0, 0xbf800000, 0, -1 /* -1 */
-    test_ftoi utrunc.s, a2, f0, 0xbf400000, 0, 0  /* -0.75 */
-    test_ftoi utrunc.s, a2, f0, 0xbf000000, 0, 0  /* -0.5 */
+    test_ftoi utrunc.s, a2, f0, 0xbfa00000, 1, -2, FSR_V /* -1.25 * 2 */
+    test_ftoi utrunc.s, a2, f0, 0xbfc00000, 0, -1, FSR_V /* -1.5 */
+    test_ftoi utrunc.s, a2, f0, 0xbf800000, 1, -2, FSR_V /* -1 * 2 */
+    test_ftoi utrunc.s, a2, f0, 0xbf800000, 0, -1, FSR_V /* -1 */
+    test_ftoi utrunc.s, a2, f0, 0xbf400000, 0,  0, FSR_I /* -0.75 */
+    test_ftoi utrunc.s, a2, f0, 0xbf000000, 0,  0, FSR_I /* -0.5 */
 
     /* positive */
-    test_ftoi utrunc.s, a2, f0, 0x3f000000, 0, 0 /* 0.5 */
-    test_ftoi utrunc.s, a2, f0, 0x3f400000, 0, 0 /* 0.75 */
-    test_ftoi utrunc.s, a2, f0, 0x3f800000, 0, 1 /* 1 */
-    test_ftoi utrunc.s, a2, f0, 0x3f800000, 1, 2 /* 1 * 2 */
-    test_ftoi utrunc.s, a2, f0, 0x3fc00000, 0, 1 /* 1.5 */
-    test_ftoi utrunc.s, a2, f0, 0x3fa00000, 1, 2 /* 1.25 * 2 */
+    test_ftoi utrunc.s, a2, f0, 0x3f000000, 0, 0, FSR_I /* 0.5 */
+    test_ftoi utrunc.s, a2, f0, 0x3f400000, 0, 0, FSR_I /* 0.75 */
+    test_ftoi utrunc.s, a2, f0, 0x3f800000, 0, 1, FSR__ /* 1 */
+    test_ftoi utrunc.s, a2, f0, 0x3f800000, 1, 2, FSR__ /* 1 * 2 */
+    test_ftoi utrunc.s, a2, f0, 0x3fc00000, 0, 1, FSR_I /* 1.5 */
+    test_ftoi utrunc.s, a2, f0, 0x3fa00000, 1, 2, FSR_I /* 1.25 * 2 */
 
     /* positive overflow */
-    test_ftoi utrunc.s, a2, f0, 0x4effffff, 0, 0x7fffff80
-    test_ftoi utrunc.s, a2, f0, 0x4f000000, 0, 0x80000000
-    test_ftoi utrunc.s, a2, f0, 0x4effffff, 1, 0xffffff00
-    test_ftoi utrunc.s, a2, f0, 0x4f800000, 1, 0xffffffff
+    test_ftoi utrunc.s, a2, f0, 0x4effffff, 0, 0x7fffff80, FSR__
+    test_ftoi utrunc.s, a2, f0, 0x4f000000, 0, 0x80000000, FSR__
+    test_ftoi utrunc.s, a2, f0, 0x4effffff, 1, 0xffffff00, FSR__
+    test_ftoi utrunc.s, a2, f0, 0x4f800000, 1, 0xffffffff, FSR_V
 
     /* +inf */
-    test_ftoi utrunc.s, a2, f0, 0x7f800000, 0, 0xffffffff
+    test_ftoi utrunc.s, a2, f0, 0x7f800000, 0, 0xffffffff, FSR_V
 
     /* NaN */
-    test_ftoi utrunc.s, a2, f0, 0x7f800001, 0, 0xffffffff
-    test_ftoi utrunc.s, a2, f0, 0x7fc00000, 0, 0xffffffff
+    test_ftoi utrunc.s, a2, f0, 0x7f800001, 0, 0xffffffff, FSR_V
+    test_ftoi utrunc.s, a2, f0, 0x7fc00000, 0, 0xffffffff, FSR_V
 test_end
 
 test float_s
     test_itof float.s, f0, a2, -1, 0, \
-        0xbf800000, 0xbf800000, 0xbf800000, 0xbf800000
-    test_itof float.s, f0, a2, 0, 0, 0, 0, 0, 0
+        0xbf800000, 0xbf800000, 0xbf800000, 0xbf800000, FSR__
+    test_itof float.s, f0, a2, 0, 0, 0, 0, 0, 0, FSR__
     test_itof float.s, f0, a2, 1, 1, \
-        0x3f000000, 0x3f000000, 0x3f000000, 0x3f000000
+        0x3f000000, 0x3f000000, 0x3f000000, 0x3f000000, FSR__
     test_itof float.s, f0, a2, 1, 0, \
-        0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000
+        0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000, FSR__
     test_itof float.s, f0, a2, 0x7fffffff, 0, \
-        0x4f000000, 0x4effffff, 0x4f000000, 0x4effffff
+        0x4f000000, 0x4effffff, 0x4f000000, 0x4effffff, FSR_I
 test_end
 
 test ufloat_s
-    test_itof ufloat.s, f0, a2, 0, 0, 0, 0, 0, 0
+    test_itof ufloat.s, f0, a2, 0, 0, 0, 0, 0, 0, FSR__
     test_itof ufloat.s, f0, a2, 1, 1, \
-        0x3f000000, 0x3f000000, 0x3f000000, 0x3f000000
+        0x3f000000, 0x3f000000, 0x3f000000, 0x3f000000, FSR__
     test_itof ufloat.s, f0, a2, 1, 0, \
-        0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000
+        0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000, FSR__
     test_itof ufloat.s, f0, a2, 0x7fffffff, 0, \
-        0x4f000000, 0x4effffff, 0x4f000000, 0x4effffff
+        0x4f000000, 0x4effffff, 0x4f000000, 0x4effffff, FSR_I
     test_itof ufloat.s, f0, a2, 0xffffffff, 0, \
-        0x4f800000, 0x4f7fffff, 0x4f800000, 0x4f7fffff
+        0x4f800000, 0x4f7fffff, 0x4f800000, 0x4f7fffff, FSR_I
 test_end
 
 #endif
-- 
2.20.1


