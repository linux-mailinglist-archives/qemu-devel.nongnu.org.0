Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0A0687CDE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 13:07:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNYMJ-00066B-Dx; Thu, 02 Feb 2023 07:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pNYL9-0005q7-Rr
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:05:21 -0500
Received: from doohan.uni-paderborn.de ([2001:638:502:c003::16])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pNYL3-0006N1-MA
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ydYUaKNtpsUo0ml2L2X5M2ytWSzCucX6qRZcNDc2J38=; b=bJzcDG6ErOY376AREDMA10P/FK
 XfzVeI0D9HgvG3pcQfzzB+ERQ2pOEne4ZbT97UgKm7oZeVQ+UsB4lpSKG2Pz28KYCvRAL0VlLUgxL
 467yuqbHOpboPZ0idQIB/M98KXrCLXRUl2iIAQmhoKx7S4tm0b0BNPjxP3ks/IW2kr1M=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Cc: kbastian@mail.uni-paderborn.de, anton.kochkov@proton.me,
 richard.henderson@linaro.org
Subject: [PATCH v2 08/10] tests/tcg/tricore: Add OPC2_32_RRRR_DEXTR tests
Date: Thu,  2 Feb 2023 13:04:30 +0100
Message-Id: <20230202120432.1268-9-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202120432.1268-1-kbastian@mail.uni-paderborn.de>
References: <20230202120432.1268-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Source: Intern
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.2.115717, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2023.1.24.5960001
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::16;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=doohan.uni-paderborn.de
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
---
 tests/tcg/tricore/macros.h     |  9 +++++++++
 tests/tcg/tricore/test_dextr.S | 35 ++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index 8bc0faf1e4..06bdbf83cb 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -78,6 +78,15 @@ test_ ## num:                                                      \
     insn DREG_CORRECT_RESULT, DREG_RS1;               \
     )
 
+#define TEST_D_DDD(insn, num, result, rs1, rs2, rs3)        \
+    TEST_CASE(num, DREG_CALC_RESULT, result,                \
+    LI(DREG_RS1, rs1);                                      \
+    LI(DREG_RS2, rs2);                                      \
+    LI(DREG_RS3, rs3);                                      \
+    rstv;                                                   \
+    insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2, DREG_RS3; \
+    )
+
 #define TEST_D_DD_PSW(insn, num, result, psw, rs1, rs2) \
     TEST_CASE_PSW(num, DREG_CALC_RESULT, result, psw,   \
     LI(DREG_RS1, rs1);                                  \
diff --git a/tests/tcg/tricore/test_dextr.S b/tests/tcg/tricore/test_dextr.S
index c8a9fc453a..82c8fe5185 100644
--- a/tests/tcg/tricore/test_dextr.S
+++ b/tests/tcg/tricore/test_dextr.S
@@ -37,4 +37,39 @@ _start:
     TEST_D_DDI(dextr, 31, 0x48d159e2, 0xabcdef01, 0x23456789, 30)
     TEST_D_DDI(dextr, 32, 0x91a2b3c4, 0xabcdef01, 0x23456789, 31)
 
+#               insn  num    result      rs1          rs2    rs3
+#                |     |       |          |            |      |
+    TEST_D_DDD(dextr, 33, 0xabcdef01, 0xabcdef01, 0x23456789, 0)
+    TEST_D_DDD(dextr, 34, 0x579bde02, 0xabcdef01, 0x23456789, 1)
+    TEST_D_DDD(dextr, 35, 0xaf37bc04, 0xabcdef01, 0x23456789, 2)
+    TEST_D_DDD(dextr, 36, 0x5e6f7809, 0xabcdef01, 0x23456789, 3)
+    TEST_D_DDD(dextr, 37, 0xbcdef012, 0xabcdef01, 0x23456789, 4)
+    TEST_D_DDD(dextr, 38, 0x79bde024, 0xabcdef01, 0x23456789, 5)
+    TEST_D_DDD(dextr, 39, 0xf37bc048, 0xabcdef01, 0x23456789, 6)
+    TEST_D_DDD(dextr, 40, 0xe6f78091, 0xabcdef01, 0x23456789, 7)
+    TEST_D_DDD(dextr, 41, 0xcdef0123, 0xabcdef01, 0x23456789, 8)
+    TEST_D_DDD(dextr, 42, 0x9bde0246, 0xabcdef01, 0x23456789, 9)
+    TEST_D_DDD(dextr, 43, 0x37bc048d, 0xabcdef01, 0x23456789, 10)
+    TEST_D_DDD(dextr, 44, 0x6f78091a, 0xabcdef01, 0x23456789, 11)
+    TEST_D_DDD(dextr, 45, 0xdef01234, 0xabcdef01, 0x23456789, 12)
+    TEST_D_DDD(dextr, 46, 0xbde02468, 0xabcdef01, 0x23456789, 13)
+    TEST_D_DDD(dextr, 47, 0x7bc048d1, 0xabcdef01, 0x23456789, 14)
+    TEST_D_DDD(dextr, 48, 0xf78091a2, 0xabcdef01, 0x23456789, 15)
+    TEST_D_DDD(dextr, 49, 0xef012345, 0xabcdef01, 0x23456789, 16)
+    TEST_D_DDD(dextr, 51, 0xde02468a, 0xabcdef01, 0x23456789, 17)
+    TEST_D_DDD(dextr, 52, 0xbc048d15, 0xabcdef01, 0x23456789, 18)
+    TEST_D_DDD(dextr, 53, 0x78091a2b, 0xabcdef01, 0x23456789, 19)
+    TEST_D_DDD(dextr, 54, 0xf0123456, 0xabcdef01, 0x23456789, 20)
+    TEST_D_DDD(dextr, 55, 0xe02468ac, 0xabcdef01, 0x23456789, 21)
+    TEST_D_DDD(dextr, 56, 0xc048d159, 0xabcdef01, 0x23456789, 22)
+    TEST_D_DDD(dextr, 57, 0x8091a2b3, 0xabcdef01, 0x23456789, 23)
+    TEST_D_DDD(dextr, 58, 0x01234567, 0xabcdef01, 0x23456789, 24)
+    TEST_D_DDD(dextr, 59, 0x02468acf, 0xabcdef01, 0x23456789, 25)
+    TEST_D_DDD(dextr, 60, 0x048d159e, 0xabcdef01, 0x23456789, 26)
+    TEST_D_DDD(dextr, 61, 0x091a2b3c, 0xabcdef01, 0x23456789, 27)
+    TEST_D_DDD(dextr, 62, 0x12345678, 0xabcdef01, 0x23456789, 28)
+    TEST_D_DDD(dextr, 63, 0x2468acf1, 0xabcdef01, 0x23456789, 29)
+    TEST_D_DDD(dextr, 64, 0x48d159e2, 0xabcdef01, 0x23456789, 30)
+    TEST_D_DDD(dextr, 65, 0x91a2b3c4, 0xabcdef01, 0x23456789, 31)
+
     TEST_PASSFAIL
-- 
2.39.1


