Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1899032F1EE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:56:18 +0100 (CET)
Received: from localhost ([::1]:40148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEgT-0004uJ-28
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDpL-0003mU-Qn
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:23 -0500
Received: from hoth.uni-paderborn.de ([2001:638:502:c003::19]:52766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDpF-0001C3-DL
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=udtjmUdRPeSYkelc3bG6ecXN06UpNnBsS3zVUDttzVc=; b=pta9WACnHV9InL2u79A7qd0sal
 0PwmVeuxKRidl7Apedj5kqZYu+SaitD/ptKJ2+Al8PiqkNM6JgP00WoF7I/3o9fw3ENRPlvuyEHY9
 X7dvuqBut46jvwoikGVhRKszQeigrk3+6PeOoNIdoYpovpE7gOdh35BiqH/tdtPDEQlA=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/15] tests/tcg/tricore: Add ftoi test
Date: Fri,  5 Mar 2021 18:00:42 +0100
Message-Id: <20210305170045.869437-13-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
References: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.5.165117, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800002
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=30601058, da=102572739,
 mc=551, sc=4, hc=547, sp=0, fso=30601058, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::19;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=hoth.uni-paderborn.de
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
 tests/tcg/tricore/Makefile.softmmu-target      |  1 +
 tests/tcg/tricore/Makefile.softmmu-target.orig |  1 +
 tests/tcg/tricore/macros.h                     |  7 +++++++
 tests/tcg/tricore/test_ftoi.S                  | 10 ++++++++++
 4 files changed, 19 insertions(+)
 create mode 100644 tests/tcg/tricore/test_ftoi.S

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index 34da1f37de..fcc7b6c1c9 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -9,6 +9,7 @@ TESTS += test_clz.tst
 TESTS += test_dvstep.tst
 TESTS += test_fadd.tst
 TESTS += test_fmul.tst
+TESTS += test_ftoi.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/Makefile.softmmu-target.orig b/tests/tcg/tricore/Makefile.softmmu-target.orig
index e7adb16af9..34da1f37de 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target.orig
+++ b/tests/tcg/tricore/Makefile.softmmu-target.orig
@@ -8,6 +8,7 @@ TESTS += test_bmerge.tst
 TESTS += test_clz.tst
 TESTS += test_dvstep.tst
 TESTS += test_fadd.tst
+TESTS += test_fmul.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index 59b4b9a352..e6a41cd1a2 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -70,6 +70,13 @@ test_ ## num:                                                      \
     insn DREG_CALC_RESULT, DREG_RS1;          \
     )
 
+#define TEST_D_D_PSW(insn, num, result, psw, rs1)     \
+    TEST_CASE_PSW(num, DREG_CALC_RESULT, result, psw, \
+    LI(DREG_RS1, rs1);                                \
+    rstv;                                             \
+    insn DREG_CORRECT_RESULT, DREG_RS1;               \
+    )
+
 #define TEST_D_DD_PSW(insn, num, result, psw, rs1, rs2) \
     TEST_CASE_PSW(num, DREG_CALC_RESULT, result, psw,   \
     LI(DREG_RS1, rs1);                                  \
diff --git a/tests/tcg/tricore/test_ftoi.S b/tests/tcg/tricore/test_ftoi.S
new file mode 100644
index 0000000000..fb4af6b5aa
--- /dev/null
+++ b/tests/tcg/tricore/test_ftoi.S
@@ -0,0 +1,10 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_D_PSW(ftoi, 1, 0x0, 0x84000b80, 0x05f6e605)
+    TEST_D_D_PSW(ftoi, 2, 0x0, 0x04000b80, 0x00012200)
+    TEST_D_D_PSW(ftoi, 3, 0x0, 0xc4000b80, 0xffffffff)
+
+    TEST_PASSFAIL
+
-- 
2.30.1


