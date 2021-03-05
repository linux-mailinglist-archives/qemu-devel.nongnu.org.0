Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7355432F12E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:30:14 +0100 (CET)
Received: from localhost ([::1]:46346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEHB-0005Ck-Cy
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDpI-0003lk-UY
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:22 -0500
Received: from collins.uni-paderborn.de ([2001:638:502:c003::14]:43522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDpB-0001BA-FW
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fGhBNoBc/rkWHgmav+IefnAVERZWTsQS0oqBp0XYbHw=; b=GtVSj7NOdO/6B/qhJZycdIjbhN
 0EDQPYQY/TVQ1deMjhhVoMvlUJEafVw/7elHMEHuDphXKPKfqLcBi3HBpEeR1YTCGwWnbvrUiQuve
 o7w0MlMEY3raZ5QC/oAKJZvlaYaqiXJbJjlTXAKejYaa9RlbpBFgHIkpdSoDESHYENU0=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/15] tests/tcg/tricore: Add dvstep test
Date: Fri,  5 Mar 2021 18:00:39 +0100
Message-Id: <20210305170045.869437-10-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
References: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.5.165117, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=30601053, da=102572734,
 mc=545, sc=4, hc=541, sp=0, fso=30601053, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::14;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=collins.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kbastian@mail.uni-paderborn.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/Makefile.softmmu-target     |  1 +
 .../tcg/tricore/Makefile.softmmu-target.orig  |  1 +
 tests/tcg/tricore/macros.h                    | 29 ++++++++++++++++++-
 tests/tcg/tricore/test_dvstep.S               | 15 ++++++++++
 4 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/tricore/test_dvstep.S

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index a9b81545e2..799b51191e 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -6,6 +6,7 @@ ASFLAGS =
 TESTS += test_abs.tst
 TESTS += test_bmerge.tst
 TESTS += test_clz.tst
+TESTS += test_dvstep.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/Makefile.softmmu-target.orig b/tests/tcg/tricore/Makefile.softmmu-target.orig
index de6a2cc88e..a9b81545e2 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target.orig
+++ b/tests/tcg/tricore/Makefile.softmmu-target.orig
@@ -5,6 +5,7 @@ ASFLAGS =
 
 TESTS += test_abs.tst
 TESTS += test_bmerge.tst
+TESTS += test_clz.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index 52aa936c56..59b4b9a352 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -19,6 +19,18 @@
 
 #define DREG_DEV_ADDR %a15
 
+#define EREG_RS1 %e6
+#define EREG_RS1_LO %d6
+#define EREG_RS1_HI %d7
+#define EREG_RS2 %e8
+#define EREG_RS2_LO %d8
+#define EREG_RS2_HI %d9
+#define EREG_CALC_RESULT %e8
+#define EREG_CALC_RESULT_HI %d9
+#define EREG_CALC_RESULT_LO %d8
+#define EREG_CORRECT_RESULT_LO %d0
+#define EREG_CORRECT_RESULT_HI %d1
+
 /* Test case wrappers */
 #define TEST_CASE(num, testreg, correct, code...) \
 test_ ## num:                                     \
@@ -27,6 +39,15 @@ test_ ## num:                                     \
     mov DREG_TEST_NUM, num;                       \
     jne testreg, DREG_CORRECT_RESULT, fail        \
 
+#define TEST_CASE_E(num, correct_lo, correct_hi, code...)  \
+test_ ## num:                                              \
+    code;                                                  \
+    mov DREG_TEST_NUM, num;                                \
+    LI(EREG_CORRECT_RESULT_LO, correct_lo)                 \
+    jne EREG_CALC_RESULT_LO, EREG_CORRECT_RESULT_LO, fail; \
+    LI(EREG_CORRECT_RESULT_HI, correct_hi)                 \
+    jne EREG_CALC_RESULT_HI, EREG_CORRECT_RESULT_HI, fail;
+
 #define TEST_CASE_PSW(num, testreg, correct, correct_psw, code...) \
 test_ ## num:                                                      \
     code;                                                          \
@@ -57,7 +78,13 @@ test_ ## num:                                                      \
     insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2;          \
     )
 
-
+#define TEST_E_ED(insn, num, res_hi, res_lo, rs1_hi, rs1_lo, rs2) \
+    TEST_CASE_E(num, res_lo, res_hi,                              \
+    LI(EREG_RS1_LO, rs1_lo);                                      \
+    LI(EREG_RS1_HI, rs1_hi);                                      \
+    LI(DREG_RS2, rs2);                                            \
+    insn EREG_CALC_RESULT, EREG_RS1, DREG_RS2;                    \
+    )
 
 /* Pass/Fail handling part */
 #define TEST_PASSFAIL                       \
diff --git a/tests/tcg/tricore/test_dvstep.S b/tests/tcg/tricore/test_dvstep.S
new file mode 100644
index 0000000000..858dbc62dd
--- /dev/null
+++ b/tests/tcg/tricore/test_dvstep.S
@@ -0,0 +1,15 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    #                              Result                   RS1            RS2
+    TEST_E_ED(dvstep,   1, 0x000001ff, 0xfffe5cff, 0x00000001, 0xfffffe5c, 0x0)
+    TEST_E_ED(dvstep,   2, 0x00000000, 0x000000ff, 0x00000000, 0x00000000, 0x0)
+    TEST_E_ED(dvstep,   3, 0x0000f000, 0x000000fd, 0x010000f0, 0x00000000, 0x0)
+    TEST_E_ED(dvstep,   4, 0xfffff000, 0x00000000, 0x7ffffff0, 0x00000000, 0x0)
+    TEST_E_ED(dvstep.u, 5, 0xffffff00, 0x100008ff, 0xffffffff, 0x00100008, 0x0)
+    TEST_E_ED(dvstep.u, 6, 0x00000100, 0x00000000, 0x08000001, 0x00000000, \
+                           0xffffff2d)
+
+    TEST_PASSFAIL
+
-- 
2.30.1


