Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC3732F1D6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:53:27 +0100 (CET)
Received: from localhost ([::1]:59712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEdi-0001Fc-9j
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDpK-0003m4-CV
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:23 -0500
Received: from hoth.uni-paderborn.de ([2001:638:502:c003::19]:52760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDpD-0001Bs-Hp
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YuZQWzNqF9YPym3ZMbFq0lx4hZpfQJVg/dNpSHiGfHk=; b=X2s5OsY28W6ZQW9+Gn5jKH4gst
 UT8NfVXlmdOpOU2z5JThX3okTOJ/aAe1kka9k+lwliUBqmZ4AWhwl6AujL0TDxja250u894L747sK
 Q3EaU7bXEovdob319hnEybHgkSYLEAc3xymkaoDQi4VFcphrDUtdEnTQ5B91naNpESvU=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/15] tests/tcg/tricore: Add fadd test
Date: Fri,  5 Mar 2021 18:00:40 +0100
Message-Id: <20210305170045.869437-11-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
References: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.5.165117, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=30601055, da=102572736,
 mc=547, sc=4, hc=543, sp=0, fso=30601055, re=0, sd=0, hd=0
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
 tests/tcg/tricore/test_fadd.S                  | 16 ++++++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 tests/tcg/tricore/test_fadd.S

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index 799b51191e..e7adb16af9 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -7,6 +7,7 @@ TESTS += test_abs.tst
 TESTS += test_bmerge.tst
 TESTS += test_clz.tst
 TESTS += test_dvstep.tst
+TESTS += test_fadd.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/Makefile.softmmu-target.orig b/tests/tcg/tricore/Makefile.softmmu-target.orig
index a9b81545e2..799b51191e 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target.orig
+++ b/tests/tcg/tricore/Makefile.softmmu-target.orig
@@ -6,6 +6,7 @@ ASFLAGS =
 TESTS += test_abs.tst
 TESTS += test_bmerge.tst
 TESTS += test_clz.tst
+TESTS += test_dvstep.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_fadd.S b/tests/tcg/tricore/test_fadd.S
new file mode 100644
index 0000000000..1a65054803
--- /dev/null
+++ b/tests/tcg/tricore/test_fadd.S
@@ -0,0 +1,16 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_DD_PSW(add.f, 1, 0x7fc00000, 0x00000b80, 0xffffff85, 0x00001234)
+    TEST_D_DD_PSW(add.f, 2, 0xf9c00000, 0x00000b80, 0xf9400000, 0xf9400000)
+    TEST_D_DD_PSW(add.f, 3, 0x8bb858ca, 0x00000b80, 0x8b3858ca, 0x8b3858ca)
+    TEST_D_DD_PSW(add.f, 4, 0x00000000, 0x00000b80, 0x000000ff, 0x00000000)
+    TEST_D_DD_PSW(add.f, 5, 0x7fc00000, 0x00000b80, 0xfffffe52, 0x0a4cf70c)
+    TEST_D_DD_PSW(add.f, 6, 0x9e6d5076, 0x84000b80, 0x9ded50ec, 0x9ded4fff)
+    TEST_D_DD_PSW(add.f, 7, 0x00000000, 0x04000b80, 0x0000e8bd, 0x00000000)
+    TEST_D_DD_PSW(add.f, 8, 0x7fc00000, 0xc4000b80, 0xffad546e, 0xffad546e)
+    TEST_D_DD_PSW(add.f, 9, 0x7fc00000, 0x04000b80, 0xfffe0000, 0x08130000)
+
+    TEST_PASSFAIL
+
-- 
2.30.1


