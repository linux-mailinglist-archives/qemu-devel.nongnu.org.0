Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFD332F155
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:36:15 +0100 (CET)
Received: from localhost ([::1]:35664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEN4-00041v-TO
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDpP-0003uW-GS
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:27 -0500
Received: from collins.uni-paderborn.de ([2001:638:502:c003::14]:43602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDpI-0001Cx-1P
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2rdnG2M2y1LxV4aD66y7NdZWtKU89FEgAHob2DD+25s=; b=OIZW+t7cDexYWL8RlgbukLflO+
 x5YUwEJM8C2XdfeD07cwYk7daI5QpSMlVM4omRjOFNIfoGAzrrWN5naB4x2KuJ4/56ly42W7mfEkW
 iT/hxEtIBZU+fDTAWJOyALb8tiei279A1ZlB3ISL2fHIWEa5D+5E23d27x9wDH82XPQ8=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/15] tests/tcg/tricore: Add msub test
Date: Fri,  5 Mar 2021 18:00:44 +0100
Message-Id: <20210305170045.869437-15-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
References: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.5.165117, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=30601061, da=102572742,
 mc=555, sc=4, hc=551, sp=0, fso=30601061, re=0, sd=0, hd=0
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
 tests/tcg/tricore/Makefile.softmmu-target      | 1 +
 tests/tcg/tricore/Makefile.softmmu-target.orig | 1 +
 tests/tcg/tricore/test_msub.S                  | 9 +++++++++
 3 files changed, 11 insertions(+)
 create mode 100644 tests/tcg/tricore/test_msub.S

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index 8de005523e..0fe6a86482 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -11,6 +11,7 @@ TESTS += test_fadd.tst
 TESTS += test_fmul.tst
 TESTS += test_ftoi.tst
 TESTS += test_madd.tst
+TESTS += test_msub.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/Makefile.softmmu-target.orig b/tests/tcg/tricore/Makefile.softmmu-target.orig
index fcc7b6c1c9..8de005523e 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target.orig
+++ b/tests/tcg/tricore/Makefile.softmmu-target.orig
@@ -10,6 +10,7 @@ TESTS += test_dvstep.tst
 TESTS += test_fadd.tst
 TESTS += test_fmul.tst
 TESTS += test_ftoi.tst
+TESTS += test_madd.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_msub.S b/tests/tcg/tricore/test_msub.S
new file mode 100644
index 0000000000..6dee87d99c
--- /dev/null
+++ b/tests/tcg/tricore/test_msub.S
@@ -0,0 +1,9 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_DDI_PSW(msub, 1, 0xd2fbe5e0, 0x00000b80,0x64003300, 0xff5420d4, -216)
+    TEST_D_DDI_PSW(msub, 2, 0xfffffc10, 0x00000b80,0xfffffe68, 0xfffffffd, -200)
+    TEST_D_DDD_PSW(msubs.u, 3, 0x0, 0x60000b80, 0x1, 0xffffffff, 0xffffffdb)
+    TEST_PASSFAIL
+
-- 
2.30.1


