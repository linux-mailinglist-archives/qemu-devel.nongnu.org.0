Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B884768EAF6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:16:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgXN-0003PA-5F; Wed, 08 Feb 2023 04:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgXJ-0003Nc-3U
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:14:41 -0500
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgXH-0007oI-9C
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U+H99P/o3Yz3p+L9CSN3ysqLcKeDdjkkYhPd5M/a9WE=; b=PRZ2F03Qk/QUz6ybeEfRgoJa90
 XvFyFaxGnJh8uy03lFVRVD9tJEAMZiKeRQc92bwcWtTFkuNAB5yH2swZMFaruMkeqiBA7oYwx0TUD
 Vz/uO/XgOYg7HtunB1Vu+ztstSNl2g9oJghFFCzqbO1kdrPivmjBXRL8/vJ5w0JoA/S0=;
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 06/12] tests/tcg/tricore: Add tests for RRPW_DEXTR
Date: Wed,  8 Feb 2023 10:14:16 +0100
Message-Id: <20230208091422.1243084-7-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208091422.1243084-1-kbastian@mail.uni-paderborn.de>
References: <20230208091422.1243084-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=84.154.177.181, fs=778825, da=163456741, mc=17, sc=0,
 hc=17, sp=0, fso=778825, re=0, sd=0, hd=0
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

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-Id: <20230202120432.1268-7-kbastian@mail.uni-paderborn.de>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 tests/tcg/tricore/Makefile.softmmu-target |  1 +
 tests/tcg/tricore/macros.h                |  8 +++++
 tests/tcg/tricore/test_dextr.S            | 40 +++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 tests/tcg/tricore/test_dextr.S

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index afabba8631..e83cc4b7cd 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -6,6 +6,7 @@ ASFLAGS =
 TESTS += test_abs.tst
 TESTS += test_bmerge.tst
 TESTS += test_clz.tst
+TESTS += test_dextr.tst
 TESTS += test_dvstep.tst
 TESTS += test_fadd.tst
 TESTS += test_fmul.tst
diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index 4f2bc3cb0f..8bc0faf1e4 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -95,6 +95,14 @@ test_ ## num:                                                      \
     insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2, DREG_RS3;      \
     )
 
+#define TEST_D_DDI(insn, num, result, rs1, rs2, imm) \
+    TEST_CASE(num, DREG_CALC_RESULT, result,         \
+    LI(DREG_RS1, rs1);                               \
+    LI(DREG_RS2, rs2);                               \
+    rstv;                                            \
+    insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2, imm;  \
+    )
+
 #define TEST_D_DDI_PSW(insn, num, result, psw, rs1, rs2, imm) \
     TEST_CASE_PSW(num, DREG_CALC_RESULT, result, psw,         \
     LI(DREG_RS1, rs1);                                        \
diff --git a/tests/tcg/tricore/test_dextr.S b/tests/tcg/tricore/test_dextr.S
new file mode 100644
index 0000000000..c8a9fc453a
--- /dev/null
+++ b/tests/tcg/tricore/test_dextr.S
@@ -0,0 +1,40 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+#               insn  num    result      rs1          rs2    imm
+#                |     |       |          |            |      |
+    TEST_D_DDI(dextr,  1, 0xabcdef01, 0xabcdef01, 0x23456789, 0)
+    TEST_D_DDI(dextr,  2, 0x579bde02, 0xabcdef01, 0x23456789, 1)
+    TEST_D_DDI(dextr,  3, 0xaf37bc04, 0xabcdef01, 0x23456789, 2)
+    TEST_D_DDI(dextr,  4, 0x5e6f7809, 0xabcdef01, 0x23456789, 3)
+    TEST_D_DDI(dextr,  5, 0xbcdef012, 0xabcdef01, 0x23456789, 4)
+    TEST_D_DDI(dextr,  6, 0x79bde024, 0xabcdef01, 0x23456789, 5)
+    TEST_D_DDI(dextr,  7, 0xf37bc048, 0xabcdef01, 0x23456789, 6)
+    TEST_D_DDI(dextr,  8, 0xe6f78091, 0xabcdef01, 0x23456789, 7)
+    TEST_D_DDI(dextr,  9, 0xcdef0123, 0xabcdef01, 0x23456789, 8)
+    TEST_D_DDI(dextr, 10, 0x9bde0246, 0xabcdef01, 0x23456789, 9)
+    TEST_D_DDI(dextr, 11, 0x37bc048d, 0xabcdef01, 0x23456789, 10)
+    TEST_D_DDI(dextr, 12, 0x6f78091a, 0xabcdef01, 0x23456789, 11)
+    TEST_D_DDI(dextr, 13, 0xdef01234, 0xabcdef01, 0x23456789, 12)
+    TEST_D_DDI(dextr, 14, 0xbde02468, 0xabcdef01, 0x23456789, 13)
+    TEST_D_DDI(dextr, 15, 0x7bc048d1, 0xabcdef01, 0x23456789, 14)
+    TEST_D_DDI(dextr, 16, 0xf78091a2, 0xabcdef01, 0x23456789, 15)
+    TEST_D_DDI(dextr, 17, 0xef012345, 0xabcdef01, 0x23456789, 16)
+    TEST_D_DDI(dextr, 18, 0xde02468a, 0xabcdef01, 0x23456789, 17)
+    TEST_D_DDI(dextr, 19, 0xbc048d15, 0xabcdef01, 0x23456789, 18)
+    TEST_D_DDI(dextr, 20, 0x78091a2b, 0xabcdef01, 0x23456789, 19)
+    TEST_D_DDI(dextr, 21, 0xf0123456, 0xabcdef01, 0x23456789, 20)
+    TEST_D_DDI(dextr, 22, 0xe02468ac, 0xabcdef01, 0x23456789, 21)
+    TEST_D_DDI(dextr, 23, 0xc048d159, 0xabcdef01, 0x23456789, 22)
+    TEST_D_DDI(dextr, 24, 0x8091a2b3, 0xabcdef01, 0x23456789, 23)
+    TEST_D_DDI(dextr, 25, 0x01234567, 0xabcdef01, 0x23456789, 24)
+    TEST_D_DDI(dextr, 26, 0x02468acf, 0xabcdef01, 0x23456789, 25)
+    TEST_D_DDI(dextr, 27, 0x048d159e, 0xabcdef01, 0x23456789, 26)
+    TEST_D_DDI(dextr, 28, 0x091a2b3c, 0xabcdef01, 0x23456789, 27)
+    TEST_D_DDI(dextr, 29, 0x12345678, 0xabcdef01, 0x23456789, 28)
+    TEST_D_DDI(dextr, 30, 0x2468acf1, 0xabcdef01, 0x23456789, 29)
+    TEST_D_DDI(dextr, 31, 0x48d159e2, 0xabcdef01, 0x23456789, 30)
+    TEST_D_DDI(dextr, 32, 0x91a2b3c4, 0xabcdef01, 0x23456789, 31)
+
+    TEST_PASSFAIL
-- 
2.39.1


