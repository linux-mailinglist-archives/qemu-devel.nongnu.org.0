Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF73361583
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 00:32:37 +0200 (CEST)
Received: from localhost ([::1]:36668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXAXM-00012W-Pq
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 18:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lXATq-0007XA-Nn; Thu, 15 Apr 2021 18:28:58 -0400
Received: from [201.28.113.2] (port=9244 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lXATp-0007aM-3P; Thu, 15 Apr 2021 18:28:58 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 15 Apr 2021 18:41:50 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id E2D19801328;
 Thu, 15 Apr 2021 18:41:49 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/3] tests/tcg/ppc64le: load 33-bits constant with paddi
Date: Thu, 15 Apr 2021 18:41:37 -0300
Message-Id: <20210415214138.563795-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415214138.563795-1-matheus.ferst@eldorado.org.br>
References: <20210415214138.563795-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Apr 2021 21:41:50.0349 (UTC)
 FILETIME=[2490E3D0:01D73240]
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
Cc: thuth@redhat.com, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 gustavo.romero@protonmail.com, f4bug@amsat.org, wainersm@redhat.com,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

This test checks that we can correctly load a 33-bit constant and its
two's complement. At least until version 1.1-0, POWER10 Functional
Simulation fails this test, processing the immediate as if it were
32-bits instead of 34, so it's probably something to keep an eye on.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 tests/tcg/ppc64/Makefile.target   |  5 +++++
 tests/tcg/ppc64le/Makefile.target |  5 +++++
 tests/tcg/ppc64le/pli_33bits.c    | 22 ++++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 tests/tcg/ppc64le/pli_33bits.c

diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 0c6a4585fc..6eccd2c06f 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -10,4 +10,9 @@ PPC64_TESTS=bcdsub
 endif
 bcdsub: CFLAGS += -mpower8-vector
 
+ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+PPC64LE_TESTS += pli_33bits
+endif
+pli_33bits: CFLAGS += -mpower10
+
 TESTS += $(PPC64_TESTS)
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 1acfcff94a..2003eab2df 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -9,4 +9,9 @@ PPC64LE_TESTS=bcdsub
 endif
 bcdsub: CFLAGS += -mpower8-vector
 
+ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+PPC64LE_TESTS += pli_33bits
+endif
+pli_33bits: CFLAGS += -mpower10
+
 TESTS += $(PPC64LE_TESTS)
diff --git a/tests/tcg/ppc64le/pli_33bits.c b/tests/tcg/ppc64le/pli_33bits.c
new file mode 100644
index 0000000000..848cbce165
--- /dev/null
+++ b/tests/tcg/ppc64le/pli_33bits.c
@@ -0,0 +1,22 @@
+#include <assert.h>
+#include <unistd.h>
+#include <signal.h>
+
+int main(void)
+{
+    long int var;
+    struct sigaction action;
+
+    action.sa_handler = _exit;
+    sigaction(SIGABRT, &action, NULL);
+
+    asm(" pli %0,0x1FFFFFFFF\n"
+        : "=r"(var));
+    assert(var == 0x1FFFFFFFF);
+
+    asm(" pli %0,-0x1FFFFFFFF\n"
+       : "=r"(var));
+    assert(var == -0x1FFFFFFFF);
+
+    return 0;
+}
-- 
2.25.1


