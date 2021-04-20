Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E07F364FF2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 03:42:44 +0200 (CEST)
Received: from localhost ([::1]:48082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYfPX-0008Tk-EK
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 21:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lYfGY-0004X8-92; Mon, 19 Apr 2021 21:33:26 -0400
Received: from [201.28.113.2] (port=21420 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lYfGW-0007Au-OR; Mon, 19 Apr 2021 21:33:26 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 19 Apr 2021 22:33:13 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 0DEAF801107;
 Mon, 19 Apr 2021 22:33:13 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tests/tcg/ppc64le: tests for brh/brw/brd
Date: Mon, 19 Apr 2021 22:33:08 -0300
Message-Id: <20210420013308.813323-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420013308.813323-1-matheus.ferst@eldorado.org.br>
References: <20210420013308.813323-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Apr 2021 01:33:13.0399 (UTC)
 FILETIME=[21293470:01D73585]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 gustavo.romero@protonmail.com, f4bug@amsat.org, qemu-ppc@nongnu.org,
 bruno.larsen@eldorado.org.br, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Tests for Byte-Reverse Halfword, Word and Doubleword

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 tests/tcg/ppc64/Makefile.target   |  7 +++++++
 tests/tcg/ppc64le/Makefile.target |  7 +++++++
 tests/tcg/ppc64le/byte_reverse.c  | 22 ++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 tests/tcg/ppc64le/byte_reverse.c

diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 0c6a4585fc..55c690c8ad 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -10,4 +10,11 @@ PPC64_TESTS=bcdsub
 endif
 bcdsub: CFLAGS += -mpower8-vector
 
+ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+POWER10_TESTS=byte_reverse
+RUN_POWER10_TESTS=$(patsubst %, run-%, $(POWER10_TESTS))
+$(RUN_POWER10_TESTS): QEMU_OPTS+=-cpu POWER10
+PPC64_TESTS += $(POWER10_TESTS)
+endif
+
 TESTS += $(PPC64_TESTS)
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 1acfcff94a..517d290b1a 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -9,4 +9,11 @@ PPC64LE_TESTS=bcdsub
 endif
 bcdsub: CFLAGS += -mpower8-vector
 
+ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+POWER10_TESTS=byte_reverse
+RUN_POWER10_TESTS=$(patsubst %, run-%, $(POWER10_TESTS))
+$(RUN_POWER10_TESTS): QEMU_OPTS+=-cpu POWER10
+PPC64LE_TESTS += $(POWER10_TESTS)
+endif
+
 TESTS += $(PPC64LE_TESTS)
diff --git a/tests/tcg/ppc64le/byte_reverse.c b/tests/tcg/ppc64le/byte_reverse.c
new file mode 100644
index 0000000000..553b9870ae
--- /dev/null
+++ b/tests/tcg/ppc64le/byte_reverse.c
@@ -0,0 +1,22 @@
+#include <stdio.h>
+#include <assert.h>
+
+int main(void)
+{
+    unsigned long var;
+
+    var = 0xFEDCBA9876543210;
+    asm("brh %0, %0" : "=r"(var));
+    assert(var == 0xDCFE98BA54761032);
+
+    var = 0xFEDCBA9876543210;
+    asm("brw %0, %0" : "=r"(var));
+    assert(var == 0x98BADCFE10325476);
+
+    var = 0xFEDCBA9876543210;
+    asm("brd %0, %0" : "=r"(var));
+    assert(var == 0x1032547698BADCFE);
+
+    return 0;
+}
+
-- 
2.25.1


