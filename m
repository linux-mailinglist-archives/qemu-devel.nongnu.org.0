Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2414D37015B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 21:38:50 +0200 (CEST)
Received: from localhost ([::1]:41980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcYyL-0005u5-I9
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 15:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lcYvd-00057x-2S; Fri, 30 Apr 2021 15:35:57 -0400
Received: from [201.28.113.2] (port=57595 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lcYvb-0001AO-IF; Fri, 30 Apr 2021 15:35:56 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 30 Apr 2021 16:35:50 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 6E4BA8013C2;
 Fri, 30 Apr 2021 16:35:50 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] target/ppc: Created !TCG SPR registration macro
Date: Fri, 30 Apr 2021 16:35:27 -0300
Message-Id: <20210430193533.82136-2-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 30 Apr 2021 19:35:50.0579 (UTC)
 FILETIME=[06C9C830:01D73DF8]
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

moved RW callback parameters of _spr_register into an ifdef, to support
building without TCG in the future, and added definitions for
spr_register and spr_register_kvm, to keep the same call regardless of
build options

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/translate_init.c.inc | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 6235eb7536..22b23793fd 100644
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
+#else /* CONFIG_USER_ONLY */
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
+#error "Either TCG or KVM should be configured"
+#endif /* CONFIG_KVM */
+#endif /* CONFIG_TCG */
 
 #define spr_register(env, num, name, uea_read, uea_write,                      \
                      oea_read, oea_write, initial_value)                       \
@@ -768,6 +782,7 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
 
 static inline void _spr_register(CPUPPCState *env, int num,
                                  const char *name,
+#if defined(CONFIG_TCG)
                                  void (*uea_read)(DisasContext *ctx,
                                                   int gprn, int sprn),
                                  void (*uea_write)(DisasContext *ctx,
@@ -782,7 +797,8 @@ static inline void _spr_register(CPUPPCState *env, int num,
                                                   int gprn, int sprn),
                                  void (*hea_write)(DisasContext *opaque,
                                                    int sprn, int gprn),
-#endif
+#endif /* CONFIG_USER_ONLY */
+#endif /* CONFIG_TCG */
 #if defined(CONFIG_KVM)
                                  uint64_t one_reg_id,
 #endif
-- 
2.17.1


