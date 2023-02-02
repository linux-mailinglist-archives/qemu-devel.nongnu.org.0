Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB00C687CFD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 13:13:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNYMI-00065a-VJ; Thu, 02 Feb 2023 07:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pNYL5-0005pn-SE
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:05:21 -0500
Received: from hoth.uni-paderborn.de ([2001:638:502:c003::19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pNYL0-0006Kq-4k
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zu+hono2xf6KX9fKdNyBcqkQIQZG59hTev5Y+mrPwno=; b=LuTuJra1YvMbByqWcvd8S5zwzp
 dfBbSGHsb5zkqU8mtWKffAFpZ8A2i+Ep2LWfNSla83tlp75lM1NORGoBAQUGTdne3RanPY3KDI+sr
 +kxTtpb2JZJgZiFhtm+NAHIms4t6bOIZdPTdTAPGcu0KWRGTPCl6NozqdZC3JWS/nwBU=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Cc: kbastian@mail.uni-paderborn.de, anton.kochkov@proton.me,
 richard.henderson@linaro.org
Subject: [PATCH v2 02/10] tests/tcg/tricore: Add test for OPC2_32_RCRW_IMASK
Date: Thu,  2 Feb 2023 13:04:24 +0100
Message-Id: <20230202120432.1268-3-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202120432.1268-1-kbastian@mail.uni-paderborn.de>
References: <20230202120432.1268-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Source: Intern
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.2.115717, AntiVirus-Engine: 5.97.0,
 AntiVirus-Data: 2023.2.2.5970001
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
---
 tests/tcg/tricore/Makefile.softmmu-target |  1 +
 tests/tcg/tricore/macros.h                |  7 +++++++
 tests/tcg/tricore/test_imask.S            | 10 ++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 tests/tcg/tricore/test_imask.S

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index 5007c60ce8..bc0cfae8d0 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -10,6 +10,7 @@ TESTS += test_dvstep.tst
 TESTS += test_fadd.tst
 TESTS += test_fmul.tst
 TESTS += test_ftoi.tst
+TESTS += test_imask.tst
 TESTS += test_madd.tst
 TESTS += test_msub.tst
 TESTS += test_muls.tst
diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index 0d76fc403a..ceb7e9c0b7 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -111,6 +111,13 @@ test_ ## num:                                                      \
     insn EREG_CALC_RESULT, EREG_RS1, DREG_RS2;                    \
     )
 
+#define TEST_E_IDI(insn, num, res_hi, res_lo, imm1, rs1, imm2) \
+    TEST_CASE_E(num, res_lo, res_hi,                           \
+    LI(DREG_RS1, rs1);                                         \
+    rstv;                                                      \
+    insn EREG_CALC_RESULT, imm1, DREG_RS1, imm2);              \
+    )
+
 /* Pass/Fail handling part */
 #define TEST_PASSFAIL                       \
         j pass;                             \
diff --git a/tests/tcg/tricore/test_imask.S b/tests/tcg/tricore/test_imask.S
new file mode 100644
index 0000000000..356cf398b8
--- /dev/null
+++ b/tests/tcg/tricore/test_imask.S
@@ -0,0 +1,10 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+#                                   res[31:0]
+#              insn  num  res[63:32]   |        imm1  rs1   imm2
+#                |    |       |        |          |    |     |
+    TEST_E_IDI(imask, 1, 0x000f0000, 0x00050000, 0x5, 0x10, 0x4)
+
+    TEST_PASSFAIL
-- 
2.39.1


