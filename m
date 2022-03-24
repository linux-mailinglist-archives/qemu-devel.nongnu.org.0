Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CD94E6952
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 20:28:39 +0100 (CET)
Received: from localhost ([::1]:40060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXT8Q-0000ia-Tr
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 15:28:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nXSr5-0003FP-O8; Thu, 24 Mar 2022 15:10:43 -0400
Received: from [187.72.171.209] (port=8328 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nXSr4-0005Rq-7o; Thu, 24 Mar 2022 15:10:43 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 24 Mar 2022 16:09:19 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id A21378001D4;
 Thu, 24 Mar 2022 16:09:18 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 6/6] tests/tcg/ppc64: add rules to build PowerNV tests
Date: Thu, 24 Mar 2022 16:08:54 -0300
Message-Id: <20220324190854.156898-7-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
References: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Mar 2022 19:09:19.0077 (UTC)
 FILETIME=[A9ABD950:01D83FB2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 richard.henderson@linaro.org, groug@kaod.org, clg@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Each Microwatt/PowerNV test use its own head.S file and thus needs
different build rules.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 tests/tcg/ppc64/Makefile.softmmu-target | 33 +++++++++++++++++++------
 tests/tcg/ppc64/system/mmu-head.S       |  1 +
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/tests/tcg/ppc64/Makefile.softmmu-target b/tests/tcg/ppc64/Makefile.softmmu-target
index 511b6322df..47343d64aa 100644
--- a/tests/tcg/ppc64/Makefile.softmmu-target
+++ b/tests/tcg/ppc64/Makefile.softmmu-target
@@ -35,24 +35,43 @@ CFLAGS = -O -g -Wall -std=c99 -msoft-float -mno-vsx -mno-altivec \
          -I $(PPC64_SYSTEM_SRC)/include $(MINILIB_INC) \
          -mcpu=power8
 
+# Each Microwatt/PowerNV test use its own head.S file and thus needs
+# different rules.
+PPC64_PNV_TESTS = mmu
+PPC64_PNV_ELFS = $(addsuffix .elf,$(PPC64_PNV_TESTS))
+TESTS += $(PPC64_PNV_TESTS)
+
 # Leave the .elf files, to make debugging easier
 .PRECIOUS: $(CRT_OBJS) $(addsuffix .elf,$(TESTS))
 
-# Build CRT objects
+# Build CRT and test objects
 %.o: $(CRT_PATH)/%.S
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -x assembler-with-cpp -c $< -o $@
 
+%.o: %.S
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -x assembler-with-cpp -c $< -o $@
+
 %.o: $(CRT_PATH)/%.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c $< -o $@
 
-# Build and link the tests
+%.o: %.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c $< -o $@
+
+# Build .elf files for debugging
+%.elf: %.o $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -o $@ $< $(LDFLAGS)
+
+$(PPC64_PNV_ELFS): %.elf: %-head.o %.o $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -o $@ $< $*.o $(LDFLAGS)
 
-# The .elf files are just for debugging
-%.elf: %.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+# Build test binaries
+%: %.o $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS) %.elf
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -o $@ $< $(LDFLAGS) -Wl,--oformat=binary
 
-%: %.c %.elf $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) -Wl,--oformat=binary
+# NOTE: %-head.o replaces boot.o
+$(PPC64_PNV_TESTS): CRT_OBJS = console.o
+$(PPC64_PNV_TESTS): %: %-head.o %.o $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS) %.elf
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -o $@ $< $*.o $(LDFLAGS) -Wl,--oformat=binary
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
diff --git a/tests/tcg/ppc64/system/mmu-head.S b/tests/tcg/ppc64/system/mmu-head.S
index b7fb99c379..a3f23fcb17 100644
--- a/tests/tcg/ppc64/system/mmu-head.S
+++ b/tests/tcg/ppc64/system/mmu-head.S
@@ -65,6 +65,7 @@ FUNCTION(test_exec)
 
 #define EXCEPTION(nr)        \
     .= nr                   ;\
+    li      %r3, (nr >> 4)  ;\
     attn
 
     /* DSI vector - skip the failing instruction + the next one */
-- 
2.25.1


