Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F0F68EAED
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:16:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgXL-0003OV-CO; Wed, 08 Feb 2023 04:14:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgXH-0003Mj-M9
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:14:39 -0500
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgXF-0007np-T0
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:14:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UNb0kyodFrefYuxVAkZHsrLmKe7JeqMhLflJkTsQNdI=; b=n0f43JeM1KSz9gpNA3+Uj6GuS6
 rPCJpacS3upAVJFDVAMqgLCTrezav6GzDj9aDEMVNMEe1ijIYkvAqEbYYecP35u+5c6dYWmDYnUCW
 BfU4FhuhshkE57CSMkrjWD/SBZeWM3O9BEfqLJzvkXhthofVmrLhevCrQdffg6IJIc9U=;
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 04/12] tests/tcg/tricore: Add test for OPC2_32_RCRW_INSERT
Date: Wed,  8 Feb 2023 10:14:14 +0100
Message-Id: <20230208091422.1243084-5-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208091422.1243084-1-kbastian@mail.uni-paderborn.de>
References: <20230208091422.1243084-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=84.154.177.181, fs=778822, da=163456738, mc=15, sc=0,
 hc=15, sp=0, fso=778822, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.8.90317, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2023.1.24.5960001
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::17;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=zuban.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DREG_RS2 and DREG_CALC_RESULT were mapped to the same register which
would not trigger https://gitlab.com/qemu-project/qemu/-/issues/653. So
let's make each register unique.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-Id: <20230202120432.1268-5-kbastian@mail.uni-paderborn.de>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/Makefile.softmmu-target |  1 +
 tests/tcg/tricore/macros.h                | 16 ++++++++++++----
 tests/tcg/tricore/test_insert.S           |  9 +++++++++
 3 files changed, 22 insertions(+), 4 deletions(-)
 create mode 100644 tests/tcg/tricore/test_insert.S

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index bc0cfae8d0..afabba8631 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -11,6 +11,7 @@ TESTS += test_fadd.tst
 TESTS += test_fmul.tst
 TESTS += test_ftoi.tst
 TESTS += test_imask.tst
+TESTS += test_insert.tst
 TESTS += test_madd.tst
 TESTS += test_msub.tst
 TESTS += test_muls.tst
diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index ceb7e9c0b7..4f2bc3cb0f 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -9,10 +9,10 @@
 /* Register definitions */
 #define DREG_RS1 %d0
 #define DREG_RS2 %d1
-#define DREG_RS3 %d4
-#define DREG_CALC_RESULT %d1
-#define DREG_CALC_PSW %d2
-#define DREG_CORRECT_PSW %d3
+#define DREG_RS3 %d2
+#define DREG_CALC_RESULT %d3
+#define DREG_CALC_PSW %d4
+#define DREG_CORRECT_PSW %d5
 #define DREG_TEMP_LI %d10
 #define DREG_TEMP %d11
 #define DREG_TEST_NUM %d14
@@ -103,6 +103,14 @@ test_ ## num:                                                      \
     insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2, imm;           \
     )
 
+#define TEST_D_DIDI(insn, num, result, rs1, imm1, rs2, imm2) \
+    TEST_CASE(num, DREG_CALC_RESULT, result,                 \
+    LI(DREG_RS1, rs1);                                       \
+    LI(DREG_RS2, rs1);                                       \
+    rstv;                                                    \
+    insn DREG_CALC_RESULT, DREG_RS1, imm1, DREG_RS2, imm2;   \
+    )
+
 #define TEST_E_ED(insn, num, res_hi, res_lo, rs1_hi, rs1_lo, rs2) \
     TEST_CASE_E(num, res_lo, res_hi,                              \
     LI(EREG_RS1_LO, rs1_lo);                                      \
diff --git a/tests/tcg/tricore/test_insert.S b/tests/tcg/tricore/test_insert.S
new file mode 100644
index 0000000000..d5fd2237e1
--- /dev/null
+++ b/tests/tcg/tricore/test_insert.S
@@ -0,0 +1,9 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+#                insn num    result        rs1    imm1   rs2  imm2
+#                 |     |      |            |       |     |    |
+    TEST_D_DIDI(insert, 1, 0x7fffffff, 0xffffffff, 0xa, 0x10, 0x8)
+
+    TEST_PASSFAIL
-- 
2.39.1


