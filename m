Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FB9388E7A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 14:59:10 +0200 (CEST)
Received: from localhost ([::1]:45584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLn3-0005Qk-5Y
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 08:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgc-0000hG-1M; Wed, 19 May 2021 08:52:34 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:57695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgY-00017g-7g; Wed, 19 May 2021 08:52:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnY2Jlnz9sj5; Wed, 19 May 2021 22:52:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428721;
 bh=LxnDMbWHgaMYAZXP6Rspl4W9c8ghGQnKEOQXJZnTS68=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z8wD07oaazlQReow1lyafsyWgnOk6WJIh+tSommYJdS49CqZvsNYdihAd3YLn+Pk0
 hQaTrw0s3XSDHpaNZUDED8Q82DFJFm2xNYdOQ+96Tytm/nI6YpvbB5oQbd6MJY3qKu
 CKB3bqvLJMsuZwO26dvg9tkT2Ne41qO1d0fPi13c=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 11/48] target/ppc: isolated cpu init from translation logic
Date: Wed, 19 May 2021 22:51:11 +1000
Message-Id: <20210519125148.27720-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

finished isolation of CPU initialization logic from
translation logic. CPU initialization now only has common code
and may or may not call accelerator-specific code, as the
build options require.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20210507115551.11436-1-bruno.larsen@eldorado.org.br>
[dwg: Fix compile error with clang linux-user builds]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/{translate_init.c.inc => cpu_init.c} | 8 ++++++++
 target/ppc/meson.build                          | 1 +
 target/ppc/spr_tcg.h                            | 2 ++
 target/ppc/translate.c                          | 4 ++--
 4 files changed, 13 insertions(+), 2 deletions(-)
 rename target/ppc/{translate_init.c.inc => cpu_init.c} (99%)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/cpu_init.c
similarity index 99%
rename from target/ppc/translate_init.c.inc
rename to target/ppc/cpu_init.c
index 2f4e463bb6..e7903e5f2a 100644
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
 
@@ -1171,6 +1177,7 @@ static void register_BookE_sprs(CPUPPCState *env, uint64_t ivor_mask)
                  0x00000000);
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static inline uint32_t register_tlbncfg(uint32_t assoc, uint32_t minsize,
                                    uint32_t maxsize, uint32_t flags,
                                    uint32_t nentries)
@@ -1180,6 +1187,7 @@ static inline uint32_t register_tlbncfg(uint32_t assoc, uint32_t minsize,
            (maxsize << TLBnCFG_MAXSIZE_SHIFT) |
            flags | nentries;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 /* BookE 2.06 storage control registers */
 static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index 4079d01ee3..d1aa7d5d39 100644
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
index aba9cf0a40..5e3495e018 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -38,6 +38,8 @@
 #include "qemu/atomic128.h"
 #include "spr_tcg.h"
 
+#include "qemu/qemu-print.h"
+#include "qapi/error.h"
 
 #define CPU_SINGLE_STEP 0x1
 #define CPU_BRANCH_STEP 0x2
@@ -380,7 +382,6 @@ void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
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
2.31.1


