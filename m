Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3D338720
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 11:35:30 +0200 (CEST)
Received: from localhost ([::1]:47504 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZBHV-0000IU-TK
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 05:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41371)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hZAuR-0000m4-6A
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:11:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hZAuO-0002qX-4I
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:11:39 -0400
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:41356)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hZAuN-0002ZG-O4
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:11:35 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail03.asahi-net.or.jp (Postfix) with ESMTPA id 9E273495FA;
 Fri,  7 Jun 2019 18:11:28 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 54C4B240085;
 Fri,  7 Jun 2019 18:11:28 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jun 2019 18:11:03 +0900
Message-Id: <20190607091116.49044-12-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190607091116.49044-1-ysato@users.sourceforge.jp>
References: <20190607091116.49044-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.15
Subject: [Qemu-devel] [PATCH v17 11/24] target/rx: Convert to
 CPUClass::tlb_fill
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The interface for tlb_fill has changed very recently.
Move the function into cpu.c so that it may be static
while assigning to the CPUClass methods.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 target/rx/cpu.c       | 14 ++++++++++++++
 target/rx/op_helper.c | 11 -----------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 4b96f2e463..3268077d08 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -143,6 +143,19 @@ static void rx_cpu_disas_set_info(CPUState *cpu, dis=
assemble_info *info)
     info->print_insn =3D print_insn_rx;
 }
=20
+static bool rx_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
+                            MMUAccessType access_type, int mmu_idx,
+                            bool probe, uintptr_t retaddr)
+{
+    uint32_t address, physical, prot;
+
+    /* Linear mapping */
+    address =3D physical =3D addr & TARGET_PAGE_MASK;
+    prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+    tlb_set_page(cs, address, physical, prot, mmu_idx, TARGET_PAGE_SIZE)=
;
+    return true;
+}
+
 static void rx_cpu_init(Object *obj)
 {
     CPUState *cs =3D CPU(obj);
@@ -177,6 +190,7 @@ static void rxcpu_class_init(ObjectClass *klass, void=
 *data)
     cc->get_phys_page_debug =3D rx_cpu_get_phys_page_debug;
     cc->disas_set_info =3D rx_cpu_disas_set_info;
     cc->tcg_initialize =3D rx_translate_init;
+    cc->tlb_fill =3D rx_cpu_tlb_fill;
=20
     cc->gdb_num_core_regs =3D 26;
 }
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 9a460070e9..fb7ae3c3ec 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -468,14 +468,3 @@ void QEMU_NORETURN helper_rxbrk(CPURXState *env)
 {
     raise_exception(env, 0x100, 0);
 }
-
-void tlb_fill(CPUState *cs, target_ulong addr, int size,
-              MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
-{
-    uint32_t address, physical, prot;
-
-    /* Linear mapping */
-    address =3D physical =3D addr & TARGET_PAGE_MASK;
-    prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-    tlb_set_page(cs, address, physical, prot, mmu_idx, TARGET_PAGE_SIZE)=
;
-}
--=20
2.11.0


