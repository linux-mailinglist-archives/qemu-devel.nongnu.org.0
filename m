Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8405372BD8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:18:29 +0200 (CEST)
Received: from localhost ([::1]:33532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldvsa-0008D4-RV
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ldvfr-0007H6-CJ; Tue, 04 May 2021 10:05:19 -0400
Received: from [201.28.113.2] (port=20951 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ldvfp-0004E5-3p; Tue, 04 May 2021 10:05:18 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 4 May 2021 11:02:37 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 393FB8012B4;
 Tue,  4 May 2021 11:02:37 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] target/ppc: isolated cpu init from translation logic
Date: Tue,  4 May 2021 11:01:57 -0300
Message-Id: <20210504140157.76066-6-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504140157.76066-1-bruno.larsen@eldorado.org.br>
References: <20210504140157.76066-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 04 May 2021 14:02:37.0369 (UTC)
 FILETIME=[238F0A90:01D740EE]
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

finished isolation of CPU initialization logic from
translation logic. CPU initialization now only has common code
and may or may not call accelerator-specific code, as the
build options require.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org> 
---
 target/ppc/{translate_init.c.inc => cpu_init.c} | 6 ++++++
 target/ppc/meson.build                          | 1 +
 target/ppc/spr_tcg.h                            | 2 ++
 target/ppc/translate.c                          | 4 ++--
 4 files changed, 11 insertions(+), 2 deletions(-)
 rename target/ppc/{translate_init.c.inc => cpu_init.c} (99%)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/cpu_init.c
similarity index 99%
rename from target/ppc/translate_init.c.inc
rename to target/ppc/cpu_init.c
index c913058170..0a1d67a98c 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/cpu_init.c
@@ -18,6 +18,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
 #include "disas/dis-asm.h"
 #include "exec/gdbstub.h"
 #include "kvm_ppc.h"
@@ -42,6 +43,11 @@
 #include "fpu/softfloat.h"
 #include "qapi/qapi-commands-machine-target.h"
 
+#include "exec/helper-proto.h"
+#include "helper_regs.h"
+#include "internal.h"
+#include "spr_tcg.h"
+
 /* #define PPC_DEBUG_SPR */
 /* #define USE_APPLE_GDB */
 
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
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 1d2890dea0..0be5f347d5 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -19,6 +19,8 @@
 #ifndef SPR_TCG_H
 #define SPR_TCG_H
 
+#define SPR_NOACCESS (&spr_noaccess)
+
 /* prototypes for readers and writers for SPRs */
 void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
 void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 0c7628657b..7958f2f7da 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -38,6 +38,8 @@
 #include "qemu/atomic128.h"
 #include "spr_tcg.h"
 
+#include "qemu/qemu-print.h"
+#include "qapi/error.h"
 
 #define CPU_SINGLE_STEP 0x1
 #define CPU_BRANCH_STEP 0x2
@@ -381,7 +383,6 @@ void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
     printf("ERROR: try to access SPR %d !\n", sprn);
 #endif
 }
-#define SPR_NOACCESS (&spr_noaccess)
 
 /* #define PPC_DUMP_SPR_ACCESSES */
 
@@ -8617,7 +8618,6 @@ GEN_HANDLER2_E(trechkpt, "trechkpt", 0x1F, 0x0E, 0x1F, 0x03FFF800, \
 };
 
 #include "helper_regs.h"
-#include "translate_init.c.inc"
 
 /*****************************************************************************/
 /* Misc PowerPC helpers */
-- 
2.17.1


