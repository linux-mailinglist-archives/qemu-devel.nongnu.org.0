Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B493314E8C8
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 07:26:03 +0100 (CET)
Received: from localhost ([::1]:48976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixPkg-0001OM-O5
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 01:26:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59784)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPVQ-00081I-P4
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:10:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPVP-00019N-Ax
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:10:16 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:33673 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ixPVO-0000fN-VM; Fri, 31 Jan 2020 01:10:15 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4886Hw579Kz9sSr; Fri, 31 Jan 2020 17:09:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580450972;
 bh=W4NiEDR/AFqbp4X4jXnBnkJsZydyt4U2Uc5GDM2GCFg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WFQQ4p57+qk4fRjApHeSbyYtkEQxkFZAf5ZLXlKSxMoMus/agbfYX9IVoYhQ2YhJl
 oqasfEHGugI2TuXQIdFMoab1HB/PYKLZvYdjmTE6MB6AJa2o91cUzlNGg1iYqh9dyU
 7spLnIe/A96p1mxWQw5vl2zogKmeTsCXL3R9F2GU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 28/34] ppc: spapr: Handle "ibm, nmi-register" and "ibm,
 nmi-interlock" RTAS calls
Date: Fri, 31 Jan 2020 17:09:18 +1100
Message-Id: <20200131060924.147449-29-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131060924.147449-1-david@gibson.dropbear.id.au>
References: <20200131060924.147449-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, Aravinda Prasad <arawinda.p@gmail.com>,
 qemu-devel@nongnu.org, groug@kaod.org, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aravinda Prasad <arawinda.p@gmail.com>

This patch adds support in QEMU to handle "ibm,nmi-register"
and "ibm,nmi-interlock" RTAS calls.

The machine check notification address is saved when the
OS issues "ibm,nmi-register" RTAS call.

This patch also handles the case when multiple processors
experience machine check at or about the same time by
handling "ibm,nmi-interlock" call. In such cases, as per
PAPR, subsequent processors serialize waiting for the first
processor to issue the "ibm,nmi-interlock" call. The second
processor that also received a machine check error waits
till the first processor is done reading the error log.
The first processor issues "ibm,nmi-interlock" call
when the error log is consumed.

Signed-off-by: Aravinda Prasad <arawinda.p@gmail.com>
[Register fwnmi RTAS calls in core_rtas_register_types()
 where other RTAS calls are registered]
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
Message-Id: <20200130184423.20519-6-ganeshgr@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_caps.c    | 10 +++++++
 hw/ppc/spapr_rtas.c    | 59 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr.h |  4 ++-
 3 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 393ee6845e..8b27d3ac09 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -515,6 +515,16 @@ static void cap_fwnmi_mce_apply(SpaprMachineState *s=
papr, uint8_t val,
     if (!val) {
         return; /* Disabled by default */
     }
+
+    if (tcg_enabled()) {
+        warn_report("Firmware Assisted Non-Maskable Interrupts(FWNMI) no=
t "
+                    "supported in TCG");
+    } else if (kvm_enabled()) {
+        if (kvmppc_set_fwnmi() < 0) {
+            error_setg(errp, "Firmware Assisted Non-Maskable Interrupts(=
FWNMI) "
+                             "not supported by KVM");
+        }
+    }
 }
=20
 SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] =3D {
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 89b7eb6c54..35d91260e6 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -399,6 +399,61 @@ static void rtas_get_power_level(PowerPCCPU *cpu, Sp=
aprMachineState *spapr,
     rtas_st(rets, 1, 100);
 }
=20
+static void rtas_ibm_nmi_register(PowerPCCPU *cpu,
+                                  SpaprMachineState *spapr,
+                                  uint32_t token, uint32_t nargs,
+                                  target_ulong args,
+                                  uint32_t nret, target_ulong rets)
+{
+    hwaddr rtas_addr;
+
+    if (spapr_get_cap(spapr, SPAPR_CAP_FWNMI_MCE) =3D=3D SPAPR_CAP_OFF) =
{
+        rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
+        return;
+    }
+
+    rtas_addr =3D spapr_get_rtas_addr();
+    if (!rtas_addr) {
+        rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
+        return;
+    }
+
+    spapr->guest_machine_check_addr =3D rtas_ld(args, 1);
+    rtas_st(rets, 0, RTAS_OUT_SUCCESS);
+}
+
+static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
+                                   SpaprMachineState *spapr,
+                                   uint32_t token, uint32_t nargs,
+                                   target_ulong args,
+                                   uint32_t nret, target_ulong rets)
+{
+    if (spapr_get_cap(spapr, SPAPR_CAP_FWNMI_MCE) =3D=3D SPAPR_CAP_OFF) =
{
+        rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
+        return;
+    }
+
+    if (spapr->guest_machine_check_addr =3D=3D -1) {
+        /* NMI register not called */
+        rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
+        return;
+    }
+
+    if (spapr->mc_status !=3D cpu->vcpu_id) {
+        /* The vCPU that hit the NMI should invoke "ibm,nmi-interlock" *=
/
+        rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
+        return;
+    }
+
+    /*
+     * vCPU issuing "ibm,nmi-interlock" is done with NMI handling,
+     * hence unset mc_status.
+     */
+    spapr->mc_status =3D -1;
+    qemu_cond_signal(&spapr->mc_delivery_cond);
+    rtas_st(rets, 0, RTAS_OUT_SUCCESS);
+}
+
 static struct rtas_call {
     const char *name;
     spapr_rtas_fn fn;
@@ -527,6 +582,10 @@ static void core_rtas_register_types(void)
                         rtas_set_power_level);
     spapr_rtas_register(RTAS_GET_POWER_LEVEL, "get-power-level",
                         rtas_get_power_level);
+    spapr_rtas_register(RTAS_IBM_NMI_REGISTER, "ibm,nmi-register",
+                        rtas_ibm_nmi_register);
+    spapr_rtas_register(RTAS_IBM_NMI_INTERLOCK, "ibm,nmi-interlock",
+                        rtas_ibm_nmi_interlock);
 }
=20
 type_init(core_rtas_register_types)
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 652a5514e8..f6f82d88aa 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -656,8 +656,10 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, target=
_ulong opcode,
 #define RTAS_IBM_REMOVE_PE_DMA_WINDOW           (RTAS_TOKEN_BASE + 0x28)
 #define RTAS_IBM_RESET_PE_DMA_WINDOW            (RTAS_TOKEN_BASE + 0x29)
 #define RTAS_IBM_SUSPEND_ME                     (RTAS_TOKEN_BASE + 0x2A)
+#define RTAS_IBM_NMI_REGISTER                   (RTAS_TOKEN_BASE + 0x2B)
+#define RTAS_IBM_NMI_INTERLOCK                  (RTAS_TOKEN_BASE + 0x2C)
=20
-#define RTAS_TOKEN_MAX                          (RTAS_TOKEN_BASE + 0x2B)
+#define RTAS_TOKEN_MAX                          (RTAS_TOKEN_BASE + 0x2D)
=20
 /* RTAS ibm,get-system-parameter token values */
 #define RTAS_SYSPARM_SPLPAR_CHARACTERISTICS      20
--=20
2.24.1


