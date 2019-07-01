Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5C658268
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 14:22:07 +0200 (CEST)
Received: from localhost ([::1]:50242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgTPi-0004ff-PN
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 08:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46661)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <hmka2@cl.cam.ac.uk>) id 1hgTMv-0002k5-7m
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 08:19:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hmka2@cl.cam.ac.uk>) id 1hgTMu-0000Hs-3g
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 08:19:13 -0400
Received: from mta2.cl.cam.ac.uk ([2001:630:212:200::25:2]:47513)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <hmka2@cl.cam.ac.uk>)
 id 1hgTMk-0008WD-L4; Thu, 27 Jun 2019 08:19:04 -0400
Received: from cassia.cl.cam.ac.uk ([2001:630:212:238:b26e:bfff:fe2f:c7d9])
 by mta2.cl.cam.ac.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.86_2) (envelope-from <hmka2@cl.cam.ac.uk>)
 id 1hgTMZ-000Sdw-7c; Thu, 27 Jun 2019 13:18:51 +0100
Received: from hmka2 by cassia.cl.cam.ac.uk with local (Exim 4.90_1)
 (envelope-from <hmka2@cl.cam.ac.uk>)
 id 1hgTMZ-0002Lk-61; Thu, 27 Jun 2019 13:18:51 +0100
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
To: qemu-riscv@nongnu.org
Date: Thu, 27 Jun 2019 13:18:26 +0100
Message-Id: <20190627121828.8376-4-Hesham.Almatary@cl.cam.ac.uk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190627121828.8376-1-Hesham.Almatary@cl.cam.ac.uk>
References: <20190627121828.8376-1-Hesham.Almatary@cl.cam.ac.uk>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:630:212:200::25:2
Subject: [Qemu-devel] [PATCHv4 4/6] RISC-V: Check PMP during Page Table Walks
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PMP should be checked when doing a page table walk, and report access
fault exception if the to-be-read PTE failed the PMP check.

Suggested-by: Jonathan Behrens <fintelia@gmail.com>
Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  1 +
 target/riscv/cpu_helper.c | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c17184f4e4..ab3ba3f15a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -94,6 +94,7 @@ enum {
 #define PRIV_VERSION_1_09_1 0x00010901
 #define PRIV_VERSION_1_10_0 0x00011000

+#define TRANSLATE_PMP_FAIL 2
 #define TRANSLATE_FAIL 1
 #define TRANSLATE_SUCCESS 0
 #define NB_MMU_MODES 4
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 5a1cd7cf96..00bc4f1712 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -211,6 +211,12 @@ restart:

         /* check that physical address of PTE is legal */
         target_ulong pte_addr = base + idx * ptesize;
+
+        if (riscv_feature(env, RISCV_FEATURE_PMP) &&
+            !pmp_hart_has_privs(env, pte_addr, sizeof(target_ulong),
+            1 << MMU_DATA_LOAD, PRV_S)) {
+            return TRANSLATE_PMP_FAIL;
+        }
 #if defined(TARGET_RISCV32)
         target_ulong pte = ldl_phys(cs->as, pte_addr);
 #elif defined(TARGET_RISCV64)
@@ -413,8 +419,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         (ret == TRANSLATE_SUCCESS) &&
         !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type,
         mode)) {
+        ret = TRANSLATE_PMP_FAIL;
+    }
+    if (ret == TRANSLATE_PMP_FAIL) {
         pmp_violation = true;
-        ret = TRANSLATE_FAIL;
     }
     if (ret == TRANSLATE_SUCCESS) {
         tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
--
2.17.1


