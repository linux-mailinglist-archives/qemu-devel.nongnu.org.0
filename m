Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5408FAD7
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 08:22:04 +0200 (CEST)
Received: from localhost ([::1]:49638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyVch-00073x-J4
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 02:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56285)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1hyVYy-0005Oe-Tf
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 02:18:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1hyVYx-00045e-3z
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 02:18:12 -0400
Received: from ozlabs.ru ([107.173.13.209]:52610)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1hyVYw-00043b-Ut; Fri, 16 Aug 2019 02:18:11 -0400
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id A7A32AE8001D;
 Fri, 16 Aug 2019 02:17:19 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 16:17:33 +1000
Message-Id: <20190816061733.53572-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 107.173.13.209
Subject: [Qemu-devel] [PATCH qemu] target/ppc: Add Directed Privileged
 Door-bell Exception State (DPDES) SPR
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Paul Mackerras <paulus@samba.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DPDES stores a status of a doorbell message and if it is lost in
migration, the destination CPU won't receive it. This does not hit us
much as IPIs complete too quick to catch a pending one and even if
we missed one, broadcasts happen often enough to wake that CPU.

This defines DPDES and registers with KVM for migration.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 target/ppc/cpu.h                |  1 +
 target/ppc/translate_init.inc.c | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 64799386f9ab..f0521a435d2d 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1466,6 +1466,7 @@ typedef PowerPCCPU ArchCPU;
 #define SPR_MPC_ICTRL         (0x09E)
 #define SPR_MPC_BAR           (0x09F)
 #define SPR_PSPB              (0x09F)
+#define SPR_DPDES             (0x0B0)
 #define SPR_DAWR              (0x0B4)
 #define SPR_RPR               (0x0BA)
 #define SPR_CIABR             (0x0BB)
diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.inc.c
index c9fcd87095f5..7e41ae145600 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -8198,6 +8198,18 @@ static void gen_spr_power8_pspb(CPUPPCState *env)
                      KVM_REG_PPC_PSPB, 0);
 }
 
+static void gen_spr_power8_dpdes(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    /* Directed Privileged Door-bell Exception State, used for IPI */
+    spr_register_kvm_hv(env, SPR_DPDES, "DPDES",
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        &spr_read_generic, SPR_NOACCESS,
+                        &spr_read_generic, &spr_write_generic,
+                        KVM_REG_PPC_DPDES, 0x00000000);
+#endif
+}
+
 static void gen_spr_power8_ic(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -8629,6 +8641,7 @@ static void init_proc_POWER8(CPUPPCState *env)
     gen_spr_power8_pmu_user(env);
     gen_spr_power8_tm(env);
     gen_spr_power8_pspb(env);
+    gen_spr_power8_dpdes(env);
     gen_spr_vtb(env);
     gen_spr_power8_ic(env);
     gen_spr_power8_book4(env);
@@ -8817,6 +8830,7 @@ static void init_proc_POWER9(CPUPPCState *env)
     gen_spr_power8_pmu_user(env);
     gen_spr_power8_tm(env);
     gen_spr_power8_pspb(env);
+    gen_spr_power8_dpdes(env);
     gen_spr_vtb(env);
     gen_spr_power8_ic(env);
     gen_spr_power8_book4(env);
-- 
2.17.1


