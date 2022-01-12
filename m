Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E68148CD7A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 22:13:01 +0100 (CET)
Received: from localhost ([::1]:59308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7kvT-0006dr-77
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 16:13:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1n7kqK-0003a4-NY
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 16:07:40 -0500
Received: from mout.gmx.net ([212.227.17.22]:55991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1n7kqH-0000em-GN
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 16:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642021652;
 bh=c/HUXD3pODxmdOnYXTDNVA/qWxdHm6PNsiaN9VgK1YM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=agj0STlyIfF3jkz5UkD4t8f/rNcH6fRI1bovjnnQyJYI8eAdijIr11IngDzVwxIHz
 8K2JBaZnRACDsTmSEyBZaIB2OeNbS878Wi8VsS0q4g0o9rXenqej4ELD4NQ2oXDTyR
 sEzboBhCtNVO7HGEvk3dbmeuF4x2QqMHd2xzzoLA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.184.198]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MyKHc-1m9MFs0ub6-00yfK1; Wed, 12
 Jan 2022 22:07:32 +0100
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 3/5] hppa: Add support for an emulated TOC/NMI button.
Date: Wed, 12 Jan 2022 22:07:28 +0100
Message-Id: <20220112210730.292775-4-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112210730.292775-1-deller@gmx.de>
References: <20220112210730.292775-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Z2ev3993dGaj/wfLN6HpBBjsrf3c1K+IikkAdnzRjr4kPlOm2jg
 zrhC6pWVLAw/UlDe5mpKI4UnxotAZ/FiNIf+dcISdDlnlpQeiqZWQwewDl39sH/421dJbvP
 KPGPscL5JmQrA/hGyonzHVrEOYyZCI8eFTHS8NR9TmHEMd6eGLjgcX8Js1nudxs3DhJdhAZ
 kMqgEqJaw6fyMjTjSMImg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bh0hn/h+0c0=:d/sjQirOj9xfXim5PDocnN
 UR6O/PqnD7b02z/NqszHcJi2ZKUVUi3XMKiVQfDHANOCKEflY/CjcLpwYVyUNhu/0Af4goU8g
 X6/mCAXSELjjpU/0Iq9qYFt1dBWKA0RtJI4KZakQO1QM6oir0oAWzlNnxreKk3hLdpi5A+LRP
 J04Cz1+D/Yrtr+NHMqZhp34JKo7ZPYzJYqW2fPiOg36LhiMeNSP+Cyb9GYcLvo/Mzb80a8bD3
 jx4U8Zl11HBqd8aMg7DPxAHsxEsaol2JgrgZJYU0lFc4AB+XQ8zhfR3aROtmr273sM2b5+uRI
 CpJQE5SX37+ZyCbkIao/f9CEOHv4wdD1mWt8f+k4/w6/NTbYQhLp7siWT7pvpoXAsqgkw4C5p
 PvkIIvr6njDfN4hxoqwQ49DJB8Q35GD390IBLflYctXT+X5VDOweaM//FJUj8ENJtWNv5kTVx
 SJSp6z6AQ0J0c/YVQD7Gc+YdYgpkchnv5UzyCMrU50AGD4jVrSTXIJeFK9Ofs3W391suTlVTl
 0w+yz4h7EJZOh8UagZ4AvwmcVqbd77o+XZSs5eXlklFuV/0FoBMHfbinv+FS6OIPLPnvk+HEH
 VtRGthccYLvmk+nZpM2PGPTBXq9kYkfNig5wxvP0DcOSVNjpXCOXBmFtNfURw/lDI4kb7VF3P
 OL+JSlJICxYgE1W3hON2EgaqMY68P8RaAFQEc7Ixpywnrc+moy8PvpUdHy5jYwgA/1oQh0LR9
 EanDXV1wKRIKXpDFzil2wi0lCeVWIdqzQXeP9Pfqzo2k3hZJYSsePdzUmlSmW0PSlIZUQHIPc
 CWNxR9USDRY2RDh2y3MQxZs3KNffsUK9sfdaabktNIw+/RxzhmIW4ffYVAiBALEQirHT6i37N
 5pbL/gwSQdzwxzRjTDPLIMjhmsknpWr6JBe3x/coqpIkEWIFNAzh4mRnnmVWLF2GH05F2mwLp
 bL/38dgmTffXmgx8O2N3GS15PVHACR3OPmNvnqQCupfZMZJBnjj8usnLlc2GUE7vptJLe8NFr
 x1cPjlDTMIQZPNNIMQUlLA8J3zRRxeCB0AJMdw2Wcofm78lJzZEQkNX0Egq5Gf9sU5Ezqqoqk
 GEL5QNS1bcm1Jw=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Almost all PA-RISC machines have either a button that is labeled with 'TOC=
' or
a BMC/GSP function to trigger a TOC.  TOC is a non-maskable interrupt that=
 is
sent to the processor.  This can be used for diagnostic purposes like obta=
ining
a stack trace/register dump or to enter KDB/KGDB in Linux.

This patch adds support for such an emulated TOC button.

It wires up the qemu monitor "nmi" command to trigger a TOC.  For that it
provides the hppa_nmi function which is assigned to the nmi_monitor_handle=
r
function pointer.  When called it raises the EXCP_TOC hardware interrupt i=
n the
hppa_cpu_do_interrupt() function.  The interrupt function then calls the
architecturally defined TOC function in SeaBIOS-hppa firmware (at fixed ad=
dress
0xf0000000).

According to the PA-RISC PDC specification, the SeaBIOS firmware then writ=
es
the CPU registers into PIM (processor internal memmory) for later analysis=
.  In
order to write all registers it needs to know the contents of the CPU "sha=
dow
registers" and the IASQ- and IAOQ-back values. The IAOQ/IASQ values are
provided by qemu in shadow registers when entering the SeaBIOS TOC functio=
n.
This patch adds a new aritificial opcode "getshadowregs" (0xfffdead2) whic=
h
restores the original values of the shadow registers. With this opcode Sea=
BIOS
can store those registers as well into PIM before calling an OS-provided T=
OC
handler.

To trigger a TOC, switch to the qemu monitor with Ctrl-A C, and type in th=
e
command "nmi".  After the TOC started the OS-debugger, exit the qemu monit=
or
with Ctrl-A C.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 hw/hppa/machine.c        | 35 ++++++++++++++++++++++++++++++++++-
 target/hppa/cpu.c        |  2 +-
 target/hppa/cpu.h        |  5 +++++
 target/hppa/helper.h     |  1 +
 target/hppa/insns.decode |  1 +
 target/hppa/int_helper.c | 19 ++++++++++++++++++-
 target/hppa/op_helper.c  |  7 ++++++-
 target/hppa/translate.c  | 10 ++++++++++
 8 files changed, 76 insertions(+), 4 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 2a46af5bc9..98b30e0395 100644
=2D-- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -17,6 +17,7 @@
 #include "hw/timer/i8254.h"
 #include "hw/char/serial.h"
 #include "hw/net/lasi_82596.h"
+#include "hw/nmi.h"
 #include "hppa_sys.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
@@ -355,6 +356,14 @@ static void hppa_machine_reset(MachineState *ms)
     cpu[0]->env.gr[19] =3D FW_CFG_IO_BASE;
 }

+static void hppa_nmi(NMIState *n, int cpu_index, Error **errp)
+{
+    CPUState *cs;
+
+    CPU_FOREACH(cs) {
+        cpu_interrupt(cs, CPU_INTERRUPT_NMI);
+    }
+}

 static void machine_hppa_machine_init(MachineClass *mc)
 {
@@ -371,4 +380,28 @@ static void machine_hppa_machine_init(MachineClass *m=
c)
     mc->default_ram_id =3D "ram";
 }

-DEFINE_MACHINE("hppa", machine_hppa_machine_init)
+static void machine_hppa_machine_init_class_init(ObjectClass *oc, void *d=
ata)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    machine_hppa_machine_init(mc);
+
+    NMIClass *nc =3D NMI_CLASS(oc);
+    nc->nmi_monitor_handler =3D hppa_nmi;
+}
+
+static const TypeInfo machine_hppa_machine_init_typeinfo =3D {
+    .name =3D ("hppa" "-machine"),
+    .parent =3D "machine",
+    .class_init =3D machine_hppa_machine_init_class_init,
+    .interfaces =3D (InterfaceInfo[]) {
+        { TYPE_NMI },
+        { }
+    },
+};
+
+static void machine_hppa_machine_init_register_types(void)
+{
+    type_register_static(&machine_hppa_machine_init_typeinfo);
+}
+
+type_init(machine_hppa_machine_init_register_types)
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 23eb254228..37b763fca0 100644
=2D-- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -62,7 +62,7 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,

 static bool hppa_cpu_has_work(CPUState *cs)
 {
-    return cs->interrupt_request & CPU_INTERRUPT_HARD;
+    return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NM=
I);
 }

 static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 45fd338b02..93c119532a 100644
=2D-- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -69,6 +69,11 @@
 #define EXCP_SYSCALL             30
 #define EXCP_SYSCALL_LWS         31

+/* Emulated hardware TOC button */
+#define EXCP_TOC                 32 /* TOC =3D Transfer of control (NMI) =
*/
+
+#define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3         /* TOC */
+
 /* Taken from Linux kernel: arch/parisc/include/asm/psw.h */
 #define PSW_I            0x00000001
 #define PSW_D            0x00000002
diff --git a/target/hppa/helper.h b/target/hppa/helper.h
index 0a629ffa7c..fe8a9ce493 100644
=2D-- a/target/hppa/helper.h
+++ b/target/hppa/helper.h
@@ -80,6 +80,7 @@ DEF_HELPER_FLAGS_0(read_interval_timer, TCG_CALL_NO_RWG,=
 tr)
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_1(halt, noreturn, env)
 DEF_HELPER_1(reset, noreturn, env)
+DEF_HELPER_1(getshadowregs, void, env)
 DEF_HELPER_1(rfi, void, env)
 DEF_HELPER_1(rfi_r, void, env)
 DEF_HELPER_FLAGS_2(write_interval_timer, TCG_CALL_NO_RWG, void, env, tr)
diff --git a/target/hppa/insns.decode b/target/hppa/insns.decode
index d4eefc0d48..c7a7e997f9 100644
=2D-- a/target/hppa/insns.decode
+++ b/target/hppa/insns.decode
@@ -111,6 +111,7 @@ rfi_r           000000 ----- ----- --- 01100101 00000
 # They are allocated from the unassigned instruction space.
 halt            1111 1111 1111 1101 1110 1010 1101 0000
 reset           1111 1111 1111 1101 1110 1010 1101 0001
+getshadowregs   1111 1111 1111 1101 1110 1010 1101 0010

 ####
 # Memory Management
diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
index 13073ae2bd..f599dccfff 100644
=2D-- a/target/hppa/int_helper.c
+++ b/target/hppa/int_helper.c
@@ -23,6 +23,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "hw/core/cpu.h"
+#include "hw/hppa/hppa_hardware.h"

 #ifndef CONFIG_USER_ONLY
 static void eval_interrupt(HPPACPU *cpu)
@@ -181,7 +182,14 @@ void hppa_cpu_do_interrupt(CPUState *cs)
     }

     /* step 7 */
-    env->iaoq_f =3D env->cr[CR_IVA] + 32 * i;
+    if (i =3D=3D EXCP_TOC) {
+        env->iaoq_f =3D FIRMWARE_START;
+        /* help SeaBIOS and provide iaoq_b and iasq_back in shadow regs *=
/
+        env->gr[24] =3D env->cr_back[0];
+        env->gr[25] =3D env->cr_back[1];
+    } else {
+        env->iaoq_f =3D env->cr[CR_IVA] + 32 * i;
+    }
     env->iaoq_b =3D env->iaoq_f + 4;
     env->iasq_f =3D 0;
     env->iasq_b =3D 0;
@@ -219,6 +227,7 @@ void hppa_cpu_do_interrupt(CPUState *cs)
             [EXCP_PER_INTERRUPT] =3D "performance monitor interrupt",
             [EXCP_SYSCALL]       =3D "syscall",
             [EXCP_SYSCALL_LWS]   =3D "syscall-lws",
+            [EXCP_TOC]           =3D "TOC (transfer of control)",
         };
         static int count;
         const char *name =3D NULL;
@@ -248,6 +257,14 @@ bool hppa_cpu_exec_interrupt(CPUState *cs, int interr=
upt_request)
     HPPACPU *cpu =3D HPPA_CPU(cs);
     CPUHPPAState *env =3D &cpu->env;

+    if (interrupt_request & CPU_INTERRUPT_NMI) {
+        /* Raise TOC (NMI) interrupt */
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_NMI);
+        cs->exception_index =3D EXCP_TOC;
+        hppa_cpu_do_interrupt(cs);
+        return true;
+    }
+
     /* If interrupts are requested and enabled, raise them.  */
     if ((env->psw & PSW_I) && (interrupt_request & CPU_INTERRUPT_HARD)) {
         cs->exception_index =3D EXCP_EXT_INTERRUPT;
diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index 1b86557d5d..b0dec4ebf4 100644
=2D-- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -694,7 +694,7 @@ void HELPER(rfi)(CPUHPPAState *env)
     cpu_hppa_put_psw(env, env->cr[CR_IPSW]);
 }

-void HELPER(rfi_r)(CPUHPPAState *env)
+void HELPER(getshadowregs)(CPUHPPAState *env)
 {
     env->gr[1] =3D env->shadow[0];
     env->gr[8] =3D env->shadow[1];
@@ -703,6 +703,11 @@ void HELPER(rfi_r)(CPUHPPAState *env)
     env->gr[17] =3D env->shadow[4];
     env->gr[24] =3D env->shadow[5];
     env->gr[25] =3D env->shadow[6];
+}
+
+void HELPER(rfi_r)(CPUHPPAState *env)
+{
+    helper_getshadowregs(env);
     helper_rfi(env);
 }
 #endif
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index c6195590f8..5c0b1eb274 100644
=2D-- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -2393,6 +2393,16 @@ static bool trans_reset(DisasContext *ctx, arg_rese=
t *a)
 #endif
 }

+static bool trans_getshadowregs(DisasContext *ctx, arg_getshadowregs *a)
+{
+    CHECK_MOST_PRIVILEGED(EXCP_PRIV_OPR);
+#ifndef CONFIG_USER_ONLY
+    nullify_over(ctx);
+    gen_helper_getshadowregs(cpu_env);
+    return nullify_end(ctx);
+#endif
+}
+
 static bool trans_nop_addrx(DisasContext *ctx, arg_ldst *a)
 {
     if (a->m) {
=2D-
2.31.1


