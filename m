Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8568F3B071A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 16:11:57 +0200 (CEST)
Received: from localhost ([::1]:46568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvh88-0004eF-D5
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 10:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lvh5u-0002eq-5K
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:09:38 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:46854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lvh5r-0000hX-UJ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:09:37 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-JYWdPGjVPl-Bq3LeFZ-rCw-1; Tue, 22 Jun 2021 10:09:31 -0400
X-MC-Unique: JYWdPGjVPl-Bq3LeFZ-rCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1159362F8;
 Tue, 22 Jun 2021 14:09:29 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A66E15C1CF;
 Tue, 22 Jun 2021 14:09:28 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/ppc: Introduce ppc_interrupts_little_endian()
Date: Tue, 22 Jun 2021 16:09:25 +0200
Message-Id: <20210622140926.677618-2-groug@kaod.org>
In-Reply-To: <20210622140926.677618-1-groug@kaod.org>
References: <20210622140926.677618-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PowerPC CPUs use big endian by default but starting with POWER7,
server grade CPUs use the ILE bit of the LPCR special purpose
register to decide on the endianness to use when handling
interrupts. This gives a clue to QEMU on the endianness the
guest kernel is running, which is needed when generating an
ELF dump of the guest or when delivering an FWNMI machine
check interrupt.

Commit 382d2db62bcb ("target-ppc: Introduce callback for interrupt
endianness") added a class method to PowerPCCPUClass to modelize
this : default implementation returns a fixed "big endian" value,
while POWER7 and newer do the LPCR_ILE check. This is suboptimal
as it forces to implement the method for every new CPU family, and
it is very unlikely that this will ever be different than what we
have today.

We basically only have three cases to consider:
a) CPU doesn't have an LPCR =3D> big endian
b) CPU has an LPCR but doesn't support the ILE bit =3D> big endian
c) CPU has an LPCR and supports the ILE bit =3D> little or big endian

Instead of class methods, introduce an inline helper that checks the
ILE bit in the LPCR_MASK to decide on the outcome. The new helper
words little endian instead of big endian. This allows to drop a !
operator in ppc_cpu_do_fwnmi_machine_check().

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 target/ppc/cpu.h         | 15 +++++++++++++++
 target/ppc/arch_dump.c   |  8 +++-----
 target/ppc/excp_helper.c |  3 +--
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index b4de0db7ff5c..93d308ac8f2d 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2643,6 +2643,21 @@ static inline bool ppc_has_spr(PowerPCCPU *cpu, int =
spr)
     return cpu->env.spr_cb[spr].name !=3D NULL;
 }
=20
+static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu)
+{
+    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
+
+    /*
+     * Only models that have an LPCR and know about LPCR_ILE can do little
+     * endian.
+     */
+    if (pcc->lpcr_mask & LPCR_ILE) {
+        return !!(cpu->env.spr[SPR_LPCR] & LPCR_ILE);
+    }
+
+    return false;
+}
+
 void dump_mmu(CPUPPCState *env);
=20
 void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len)=
;
diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index 9210e61ef463..bb392f6d8885 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -227,22 +227,20 @@ int cpu_get_dump_info(ArchDumpInfo *info,
                       const struct GuestPhysBlockList *guest_phys_blocks)
 {
     PowerPCCPU *cpu;
-    PowerPCCPUClass *pcc;
=20
     if (first_cpu =3D=3D NULL) {
         return -1;
     }
=20
     cpu =3D POWERPC_CPU(first_cpu);
-    pcc =3D POWERPC_CPU_GET_CLASS(cpu);
=20
     info->d_machine =3D PPC_ELF_MACHINE;
     info->d_class =3D ELFCLASS;
=20
-    if ((*pcc->interrupts_big_endian)(cpu)) {
-        info->d_endian =3D ELFDATA2MSB;
-    } else {
+    if (ppc_interrupts_little_endian(cpu)) {
         info->d_endian =3D ELFDATA2LSB;
+    } else {
+        info->d_endian =3D ELFDATA2MSB;
     }
     /* 64KB is the max page size for pseries kernel */
     if (strncmp(object_get_typename(qdev_get_machine()),
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index fd147e2a3766..a79a0ed465e5 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1099,7 +1099,6 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, tar=
get_ulong vector)
 {
     PowerPCCPU *cpu =3D POWERPC_CPU(cs);
     CPUPPCState *env =3D &cpu->env;
-    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
     target_ulong msr =3D 0;
=20
     /*
@@ -1108,7 +1107,7 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, tar=
get_ulong vector)
      */
     msr =3D (1ULL << MSR_ME);
     msr |=3D env->msr & (1ULL << MSR_SF);
-    if (!(*pcc->interrupts_big_endian)(cpu)) {
+    if (ppc_interrupts_little_endian(cpu)) {
         msr |=3D (1ULL << MSR_LE);
     }
=20
--=20
2.31.1


