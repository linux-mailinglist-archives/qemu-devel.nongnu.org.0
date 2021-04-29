Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB336EE4B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 18:41:08 +0200 (CEST)
Received: from localhost ([::1]:39778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc9it-0003BE-C2
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 12:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lc9Rh-0004tp-4K; Thu, 29 Apr 2021 12:23:21 -0400
Received: from [201.28.113.2] (port=34399 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lc9Rf-0004Gz-B2; Thu, 29 Apr 2021 12:23:20 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 29 Apr 2021 13:21:39 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 4EBBF80134B;
 Thu, 29 Apr 2021 13:21:39 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] target/ppc: isolated cpu init from translation logic
Date: Thu, 29 Apr 2021 13:21:30 -0300
Message-Id: <20210429162130.2412-8-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 29 Apr 2021 16:21:39.0446 (UTC)
 FILETIME=[BBC23960:01D73D13]
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
which may or may not call accelerator-specific code, as the
build options require, and is compiled separately.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/{translate_init.c.inc => cpu_init.c} | 12 +++++++++++-
 target/ppc/meson.build                          |  1 +
 target/ppc/translate.c                          |  4 +++-
 3 files changed, 15 insertions(+), 2 deletions(-)
 rename target/ppc/{translate_init.c.inc => cpu_init.c} (99%)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/cpu_init.c
similarity index 99%
rename from target/ppc/translate_init.c.inc
rename to target/ppc/cpu_init.c
index b329e953cb..f0f8fc481e 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/cpu_init.c
@@ -18,6 +18,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
 #include "disas/dis-asm.h"
 #include "exec/gdbstub.h"
 #include "kvm_ppc.h"
@@ -42,6 +43,10 @@
 #include "fpu/softfloat.h"
 #include "qapi/qapi-commands-machine-target.h"
 
+#include "helper_regs.h"
+#include "internal.h"
+#include "spr_tcg.h"
+
 /* #define PPC_DEBUG_SPR */
 /* #define USE_APPLE_GDB */
 
@@ -49,7 +54,12 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
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
 
 #ifdef CONFIG_TCG
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index bbfef90e08..ad53629298 100644
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
index a6e677fa6d..afb8a2aa27 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -38,6 +38,9 @@
 #include "qemu/atomic128.h"
 #include "internal.h"
 
+#include "qemu/qemu-print.h"
+#include "qapi/error.h"
+#include "internal.h"
 
 #define CPU_SINGLE_STEP 0x1
 #define CPU_BRANCH_STEP 0x2
@@ -7595,7 +7598,6 @@ GEN_HANDLER2_E(trechkpt, "trechkpt", 0x1F, 0x0E, 0x1F, 0x03FFF800, \
 
 #include "helper_regs.h"
 #include "spr_tcg.c.inc"
-#include "translate_init.c.inc"
 
 /*****************************************************************************/
 /* Misc PowerPC helpers */
-- 
2.17.1


