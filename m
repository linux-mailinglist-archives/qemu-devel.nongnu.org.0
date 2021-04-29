Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B97636EE61
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 18:48:43 +0200 (CEST)
Received: from localhost ([::1]:46330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc9qD-0006GT-Lg
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 12:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lc9QG-0003sl-7x; Thu, 29 Apr 2021 12:21:52 -0400
Received: from [201.28.113.2] (port=29626 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lc9QE-0003ag-L3; Thu, 29 Apr 2021 12:21:52 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 29 Apr 2021 13:21:38 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id C613D80134B;
 Thu, 29 Apr 2021 13:21:38 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] target/ppc: Created !TCG SPR registration macro
Date: Thu, 29 Apr 2021 13:21:25 -0300
Message-Id: <20210429162130.2412-3-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 29 Apr 2021 16:21:38.0931 (UTC)
 FILETIME=[BB73A430:01D73D13]
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

Added macros for spr_register and spr_register_kvm that can
ignore SPR RW callbacks, in preparation to support building
without TCG.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/translate_init.c.inc | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 6235eb7536..3ddcfefb62 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -720,6 +720,7 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
     helper_mtvscr(env, val);
 }
 
+#ifdef CONFIG_TCG
 #ifdef CONFIG_USER_ONLY
 #define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
                          oea_read, oea_write, one_reg_id, initial_value)       \
@@ -728,7 +729,7 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
                             oea_read, oea_write, hea_read, hea_write,          \
                             one_reg_id, initial_value)                         \
     _spr_register(env, num, name, uea_read, uea_write, initial_value)
-#else
+#else /*CONFIG_USER_ONLY */
 #if !defined(CONFIG_KVM)
 #define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
                          oea_read, oea_write, one_reg_id, initial_value)       \
@@ -739,7 +740,7 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
                             one_reg_id, initial_value)                         \
     _spr_register(env, num, name, uea_read, uea_write,                         \
                   oea_read, oea_write, hea_read, hea_write, initial_value)
-#else
+#else /* CONFIG_KVM */
 #define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
                          oea_read, oea_write, one_reg_id, initial_value)       \
     _spr_register(env, num, name, uea_read, uea_write,                         \
@@ -751,8 +752,21 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
     _spr_register(env, num, name, uea_read, uea_write,                         \
                   oea_read, oea_write, hea_read, hea_write,                    \
                   one_reg_id, initial_value)
-#endif
-#endif
+#endif /* CONFIG_KVM */
+#endif /* CONFIG_USER_ONLY */
+#else /* CONFIG_TCG */
+#ifdef CONFIG_KVM /* sanity check. should always enter this */
+#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
+                         oea_read, oea_write, one_reg_id, initial_value)       \
+    _spr_register(env, num, name, one_reg_id, initial_value)
+#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
+                            oea_read, oea_write, hea_read, hea_write,          \
+                            one_reg_id, initial_value)                         \
+    _spr_register(env, num, name, one_reg_id, initial_value)
+#else /* CONFIG_KVM */
+#error "Either TCG or KVM should be condigured"
+#endif /* CONFIG_KVM */
+#endif /* CONFIG_TCG */
 
 #define spr_register(env, num, name, uea_read, uea_write,                      \
                      oea_read, oea_write, initial_value)                       \
-- 
2.17.1


