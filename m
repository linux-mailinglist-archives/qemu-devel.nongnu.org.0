Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1721692216
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 16:25:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVG2-0002Ju-MR; Fri, 10 Feb 2023 10:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pQVG1-0002Gt-2S
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:24:13 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pQVFy-0002wq-81
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:24:12 -0500
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
 by mta-01.yadro.com (Proxmox) with ESMTP id CCCBD341BDC
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 18:24:04 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
 :content-transfer-encoding:content-type:content-type:date:from
 :from:message-id:mime-version:reply-to:subject:subject:to:to; s=
 mta-01; bh=YyK57QLoeS0/xlloaa5WxNR7pHRCRxSKS51Hs/ftDEI=; b=lWurs
 sMaqohgkRLK+WoaxIkUvIndDW3y31oqSkSeNcIUM2yVZzh80zNZCdfvM8oafw5Pg
 i5AYO1PcIfH+qXIW1acqTNgyqSbL9ph5jmy2sA1LsLc9PiuywhpAocak1haRaqiv
 PbFXImRwr+lV5zZstap126nNAf/Th5sbcMgOTo=
Received: from T-EXCH-07.corp.yadro.com (unknown [172.17.10.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Proxmox) with ESMTPS id C27B1341BAF
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 18:24:04 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-07.corp.yadro.com (172.17.11.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.9; Fri, 10 Feb 2023 18:24:04 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Fri,
 10 Feb 2023 18:24:04 +0300
From: Mikhail Tyutin <m.tyutin@yadro.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [PATCH] Adding ability to change disassembler syntax in TCG plugins
Thread-Topic: [PATCH] Adding ability to change disassembler syntax in TCG
 plugins
Thread-Index: Adk9Ytj+mzbZHC9XRGOgcDMHokyEkw==
Date: Fri, 10 Feb 2023 15:24:04 +0000
Message-ID: <7d17f0cbb5ed4c90bbadd3992429006f@yadro.com>
Accept-Language: en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.178.120.230]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=89.207.88.252; envelope-from=m.tyutin@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch adds new function qemu_plugin_insn_disas_with_syntax() that allo=
ws TCG plugins to get disassembler string with non-default syntax if it wan=
ts to.

Signed-off-by: Mikhail Tyutin <m.tyutin@yadro.com>
---
 contrib/plugins/execlog.c    |  2 +-
 disas.c                      |  4 +++-
 disas/capstone.c             |  9 ++++++++-
 include/disas/dis-asm.h      |  2 ++
 include/disas/disas.h        |  4 +++-
 include/qemu/qemu-plugin.h   | 17 +++++++++++++++++
 plugins/api.c                | 10 ++++++++--
 plugins/qemu-plugins.symbols |  1 +
 8 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index e255bd21fd..6006490b1d 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -121,7 +121,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct q=
emu_plugin_tb *tb)
          * a limitation for CISC architectures.
          */
         insn =3D qemu_plugin_tb_get_insn(tb, i);
-        insn_disas =3D qemu_plugin_insn_disas(insn);
+        insn_disas =3D qemu_plugin_insn_disas_with_syntax(insn, QEMU_PLUGI=
N_DISAS_SYNTAX_INTEL);
         insn_vaddr =3D qemu_plugin_insn_vaddr(insn);
=20
         /*
diff --git a/disas.c b/disas.c
index b087c12c47..19b0f9d15f 100644
--- a/disas.c
+++ b/disas.c
@@ -267,7 +267,8 @@ static void plugin_print_address(bfd_vma addr, struct d=
isassemble_info *info)
  * there is left over it usually indicates the front end has read more
  * bytes than it needed.
  */
-char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size)
+char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size,
+                   enum qemu_plugin_disas_syntax syntax)
 {
     CPUDebug s;
     GString *ds =3D g_string_new(NULL);
@@ -278,6 +279,7 @@ char *plugin_disas(CPUState *cpu, uint64_t addr, size_t=
 size)
     s.info.buffer_vma =3D addr;
     s.info.buffer_length =3D size;
     s.info.print_address_func =3D plugin_print_address;
+    s.info.dis_syntax =3D syntax;
=20
     if (s.info.cap_arch >=3D 0 && cap_disas_plugin(&s.info, addr, size)) {
         ; /* done */
diff --git a/disas/capstone.c b/disas/capstone.c
index fe3efb0d3c..7476ee4044 100644
--- a/disas/capstone.c
+++ b/disas/capstone.c
@@ -5,6 +5,7 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/bswap.h"
+#include "qemu/plugin.h"
 #include "disas/dis-asm.h"
 #include "disas/capstone.h"
=20
@@ -87,7 +88,13 @@ static cs_err cap_disas_start(disassemble_info *info, cs=
h *handle)
          * is compiled without AT&T syntax); the user will just have
          * to deal with the Intel syntax.
          */
-        cs_option(*handle, CS_OPT_SYNTAX, CS_OPT_SYNTAX_ATT);
+
+        size_t cs_opt_syntax =3D CS_OPT_SYNTAX_ATT;
+        if (info->dis_syntax =3D=3D QEMU_PLUGIN_DISAS_SYNTAX_INTEL) {
+            cs_opt_syntax =3D CS_OPT_SYNTAX_INTEL;
+        }
+
+        cs_option(*handle, CS_OPT_SYNTAX, cs_opt_syntax);
         break;
     }
=20
diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 64247ecb11..0153165ca2 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -409,6 +409,8 @@ typedef struct disassemble_info {
   int cap_insn_unit;
   int cap_insn_split;
=20
+  int dis_syntax;
+
 } disassemble_info;
=20
 /* Standard disassemblers.  Disassemble one instruction at the given
diff --git a/include/disas/disas.h b/include/disas/disas.h
index d363e95ede..f8e4f97ab1 100644
--- a/include/disas/disas.h
+++ b/include/disas/disas.h
@@ -2,6 +2,7 @@
 #define QEMU_DISAS_H
=20
 #include "exec/hwaddr.h"
+#include "qemu/plugin.h"
=20
 #ifdef NEED_CPU_H
 #include "cpu.h"
@@ -14,7 +15,8 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong =
code,
 void monitor_disas(Monitor *mon, CPUState *cpu,
                    target_ulong pc, int nb_insn, int is_physical);
=20
-char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size);
+char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size,
+                   enum qemu_plugin_disas_syntax syntax);
=20
 /* Look up symbol for debugging purpose.  Returns "" if unknown. */
 const char *lookup_symbol(target_ulong orig_addr);
diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index d0e9d03adf..a4bd543579 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -233,6 +233,12 @@ enum qemu_plugin_mem_rw {
     QEMU_PLUGIN_MEM_RW,
 };
=20
+enum qemu_plugin_disas_syntax {
+    QEMU_PLUGIN_DISAS_SYNTAX_DEFAULT,
+    QEMU_PLUGIN_DISAS_SYNTAX_ATT,
+    QEMU_PLUGIN_DISAS_SYNTAX_INTEL,
+};
+
 /**
  * typedef qemu_plugin_vcpu_tb_trans_cb_t - translation callback
  * @id: unique plugin id
@@ -526,6 +532,17 @@ qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_i=
d_t id,
=20
 char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn);
=20
+#define QEMU_PLUGIN_DISAS_SYNTAX_ENABLED
+/**
+ * qemu_plugin_insn_disas_with_syntax() - return disassembly string for in=
struction
+ * @insn: instruction reference
+ * @syntax: syntax style
+ *
+ * Returns an allocated string containing the disassembly
+ */
+char *qemu_plugin_insn_disas_with_syntax(const struct qemu_plugin_insn *in=
sn,
+                                         enum qemu_plugin_disas_syntax syn=
tax);
+
 /**
  * qemu_plugin_insn_symbol() - best effort symbol lookup
  * @insn: instruction reference
diff --git a/plugins/api.c b/plugins/api.c
index 2078b16edb..579dcaa0e3 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -232,10 +232,16 @@ void *qemu_plugin_insn_haddr(const struct qemu_plugin=
_insn *insn)
     return insn->haddr;
 }
=20
-char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn)
+char *qemu_plugin_insn_disas_with_syntax(const struct qemu_plugin_insn *in=
sn,
+                                         enum qemu_plugin_disas_syntax syn=
tax)
 {
     CPUState *cpu =3D current_cpu;
-    return plugin_disas(cpu, insn->vaddr, insn->data->len);
+    return plugin_disas(cpu, insn->vaddr, insn->data->len, syntax);
+}
+
+char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn)
+{
+    return qemu_plugin_insn_disas_with_syntax(insn, QEMU_PLUGIN_DISAS_SYNT=
AX_DEFAULT);
 }
=20
 const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn)
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 71f6c90549..895526ff74 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -8,6 +8,7 @@
   qemu_plugin_hwaddr_phys_addr;
   qemu_plugin_insn_data;
   qemu_plugin_insn_disas;
+  qemu_plugin_insn_disas_with_syntax;
   qemu_plugin_insn_haddr;
   qemu_plugin_insn_size;
   qemu_plugin_insn_symbol;
--=20
2.34.1



