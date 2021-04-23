Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A792C369AE0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 21:25:10 +0200 (CEST)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la1QL-0005h5-MZ
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 15:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1la1LP-0003K5-QX; Fri, 23 Apr 2021 15:20:03 -0400
Received: from [201.28.113.2] (port=41032 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1la1LO-0000eq-1c; Fri, 23 Apr 2021 15:20:03 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 23 Apr 2021 16:18:33 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 2471480139F;
 Fri, 23 Apr 2021 16:18:33 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/4] target/ppc: isolated cpu init from translation logic
Date: Fri, 23 Apr 2021 16:18:07 -0300
Message-Id: <20210423191807.77963-5-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>
References: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 23 Apr 2021 19:18:33.0264 (UTC)
 FILETIME=[739BD300:01D73875]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

finished isolation of CPU initialization logic from
translation logic. CPU initialization now only has common code
and may or may not call accelerator-specific code, as the
build options require.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/{translate_init.c.inc => cpu_init.c} | 11 ++++++++++-
 target/ppc/meson.build                          |  1 +
 target/ppc/translate.c                          |  4 +++-
 3 files changed, 14 insertions(+), 2 deletions(-)
 rename target/ppc/{translate_init.c.inc => cpu_init.c} (99%)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/cpu_init.c
similarity index 99%
rename from target/ppc/translate_init.c.inc
rename to target/ppc/cpu_init.c
index 33e44f1363..38e4c87aa5 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/cpu_init.c
@@ -18,6 +18,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
 #include "disas/dis-asm.h"
 #include "exec/gdbstub.h"
 #include "kvm_ppc.h"
@@ -42,6 +43,9 @@
 #include "fpu/softfloat.h"
 #include "qapi/qapi-commands-machine-target.h"
 
+#include "helper_regs.h"
+#include "internal.h"
+
 /* #define PPC_DUMP_CPU */
 /* #define PPC_DEBUG_SPR */
 /* #define PPC_DUMP_SPR_ACCESSES */
@@ -51,7 +55,12 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
 {
     /* Altivec always uses round-to-nearest */
     set_float_rounding_mode(float_round_nearest_even, &env->vec_status);
-    helper_mtvscr(env, val);
+    /*
+     * This comment is here just so the project will build.
+     * The current solution is in another patch and will be
+     * added when we figure out an internal fork of qemu
+     */
+    /* helper_mtvscr(env, val); */
 }
 
 /*
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index aaee5e7c0c..14f0ba5d48 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -2,6 +2,7 @@ ppc_ss = ss.source_set()
 ppc_ss.add(files(
   'cpu-models.c',
   'cpu.c',
+  'cpu_init.c',
   'dfp_helper.c',
   'excp_helper.c',
   'fpu_helper.c',
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index bb893be928..a4d9fb8d54 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -37,6 +37,9 @@
 #include "exec/log.h"
 #include "qemu/atomic128.h"
 
+#include "qemu/qemu-print.h"
+#include "qapi/error.h"
+#include "internal.h"
 
 #define CPU_SINGLE_STEP 0x1
 #define CPU_BRANCH_STEP 0x2
@@ -7593,7 +7596,6 @@ GEN_HANDLER2_E(trechkpt, "trechkpt", 0x1F, 0x0E, 0x1F, 0x03FFF800, \
 };
 
 #include "helper_regs.h"
-#include "translate_init.c.inc"
 
 /*****************************************************************************/
 /* Misc PowerPC helpers */
-- 
2.17.1


