Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B81CB7DD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 12:06:19 +0200 (CEST)
Received: from localhost ([::1]:44380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGKTZ-0006bO-7P
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 06:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52467)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2L-0004yY-Q7
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2K-00058c-2M
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57501 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK2J-00053e-IC; Fri, 04 Oct 2019 05:38:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YH10r8z9sRN; Fri,  4 Oct 2019 19:37:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181875;
 bh=iAhEVGL4zAQy2b2SNPtrcxo6ut1E3Y9YBbav2lZpwHI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gssjBKUaWnrzjI/gfqL3c5MBQ8ZJNX6jkDE+yu2cOjMx18SgvmnFC8dcx0XwR8a6u
 A/Wki09ME6vTwPd5rfasDKLOBFc1hNO1K5f2uXPcCf4O+kvJbB/ZvFQm9QSZOcudJs
 tFVwUQn/+w93rkQawR8HgyBNRO2/hwcPskLRMDMA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 14/53] ppc/kvm: Skip writing DPDES back when in run time state
Date: Fri,  4 Oct 2019 19:37:08 +1000
Message-Id: <20191004093747.31350-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004093747.31350-1-david@gibson.dropbear.id.au>
References: <20191004093747.31350-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

On POWER8 systems the Directed Privileged Door-bell Exception State
register (DPDES) stores doorbell pending status, one bit per a thread
of a core, set by "msgsndp" instruction. The register is shared among
threads of the same core and KVM on POWER9 emulates it in a similar way
(POWER9 does not have DPDES).

DPDES is shared but QEMU assumes all SPRs are per thread so the only safe
way to write DPDES back to VCPU before running a guest is doing so
while all threads are pulled out of the guest so DPDES cannot change.
There is only one situation when this condition is met: incoming migratio=
n
when all threads are stopped. Otherwise any QEMU HMP/QMP command causing
kvm_arch_put_registers() (for example printing registers or dumping memor=
y)
can clobber DPDES in a race with other vcpu threads.

This changes DPDES handling so it is not written to KVM at runtime.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-Id: <20190923084110.34643-1-aik@ozlabs.ru>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/kvm.c                | 5 +++++
 target/ppc/translate_init.inc.c | 9 ++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 8c5b1f25cc..820724cc7d 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -993,6 +993,10 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         }
=20
         kvm_set_one_reg(cs, KVM_REG_PPC_TB_OFFSET, &env->tb_env->tb_offs=
et);
+
+        if (level > KVM_PUT_RUNTIME_STATE) {
+            kvm_put_one_spr(cs, KVM_REG_PPC_DPDES, SPR_DPDES);
+        }
 #endif /* TARGET_PPC64 */
     }
=20
@@ -1297,6 +1301,7 @@ int kvm_arch_get_registers(CPUState *cs)
         }
=20
         kvm_get_one_reg(cs, KVM_REG_PPC_TB_OFFSET, &env->tb_env->tb_offs=
et);
+        kvm_get_one_spr(cs, KVM_REG_PPC_DPDES, SPR_DPDES);
 #endif
     }
=20
diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.=
inc.c
index 0fb11c7ac6..ba726dec4d 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -8200,11 +8200,10 @@ static void gen_spr_power8_dpdes(CPUPPCState *env=
)
 {
 #if !defined(CONFIG_USER_ONLY)
     /* Directed Privileged Door-bell Exception State, used for IPI */
-    spr_register_kvm_hv(env, SPR_DPDES, "DPDES",
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        &spr_read_generic, SPR_NOACCESS,
-                        &spr_read_generic, &spr_write_generic,
-                        KVM_REG_PPC_DPDES, 0x00000000);
+    spr_register(env, SPR_DPDES, "DPDES",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
 #endif
 }
=20
--=20
2.21.0


