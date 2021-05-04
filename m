Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098663725FF
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:54:46 +0200 (CEST)
Received: from localhost ([::1]:59380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoxB-0002QZ-1P
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo16-0006oK-Ft; Tue, 04 May 2021 01:54:45 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:44789 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo13-0005EE-Iv; Tue, 04 May 2021 01:54:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CP65Xnz9t14; Tue,  4 May 2021 15:53:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107601;
 bh=lUbT/DZcYFCJPzC2E2B5W4lA3dAQag7zWEMrPssETfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GBwhDkUtUd3A4KGb6Ht2V2sqNxs0GDZ6F4j2grs1H1SIRme67Qyiapk25baerH1fM
 XDgnwvmsYMx/7x7C1OEljb4nn1G0zmGGl+gCzbQpTBborZ+f5celHsfAFRANZcBoF2
 Z+ZhECR/YBDius31r/PDkA6LhOJMhiswHHWP7znk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 41/46] target/ppc: Clean up _spr_register et al
Date: Tue,  4 May 2021 15:53:07 +1000
Message-Id: <20210504055312.306823-42-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Introduce 3 helper macros to elide arguments that we cannot supply.
This reduces the repetition required to get the job done.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210501022923.1179736-2-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate_init.c.inc | 158 +++++++++++++++-----------------
 1 file changed, 76 insertions(+), 82 deletions(-)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index f92656b2f2..5cee94f16d 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -720,103 +720,97 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
     helper_mtvscr(env, val);
 }
 
-#ifdef CONFIG_USER_ONLY
-#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
-                         oea_read, oea_write, one_reg_id, initial_value)       \
-    _spr_register(env, num, name, uea_read, uea_write, initial_value)
-#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
-                            oea_read, oea_write, hea_read, hea_write,          \
-                            one_reg_id, initial_value)                         \
-    _spr_register(env, num, name, uea_read, uea_write, initial_value)
-#else
-#if !defined(CONFIG_KVM)
-#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
-                         oea_read, oea_write, one_reg_id, initial_value)       \
-    _spr_register(env, num, name, uea_read, uea_write,                         \
-                  oea_read, oea_write, oea_read, oea_write, initial_value)
-#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
-                            oea_read, oea_write, hea_read, hea_write,          \
-                            one_reg_id, initial_value)                         \
-    _spr_register(env, num, name, uea_read, uea_write,                         \
-                  oea_read, oea_write, hea_read, hea_write, initial_value)
+/**
+ * _spr_register
+ *
+ * Register an SPR with all the callbacks required for tcg,
+ * and the ID number for KVM.
+ *
+ * The reason for the conditional compilation is that the tcg functions
+ * may be compiled out, and the system kvm header may not be available
+ * for supplying the ID numbers.  This is ugly, but the best we can do.
+ */
+
+#ifdef CONFIG_TCG
+# define USR_ARG(X)    X,
+# ifdef CONFIG_USER_ONLY
+#  define SYS_ARG(X)
+# else
+#  define SYS_ARG(X)   X,
+# endif
 #else
-#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
-                         oea_read, oea_write, one_reg_id, initial_value)       \
-    _spr_register(env, num, name, uea_read, uea_write,                         \
-                  oea_read, oea_write, oea_read, oea_write,                    \
-                  one_reg_id, initial_value)
-#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
-                            oea_read, oea_write, hea_read, hea_write,          \
-                            one_reg_id, initial_value)                         \
-    _spr_register(env, num, name, uea_read, uea_write,                         \
-                  oea_read, oea_write, hea_read, hea_write,                    \
-                  one_reg_id, initial_value)
+# define USR_ARG(X)
+# define SYS_ARG(X)
 #endif
+#ifdef CONFIG_KVM
+# define KVM_ARG(X)    X,
+#else
+# define KVM_ARG(X)
 #endif
 
-#define spr_register(env, num, name, uea_read, uea_write,                      \
-                     oea_read, oea_write, initial_value)                       \
-    spr_register_kvm(env, num, name, uea_read, uea_write,                      \
-                     oea_read, oea_write, 0, initial_value)
-
-#define spr_register_hv(env, num, name, uea_read, uea_write,                   \
-                        oea_read, oea_write, hea_read, hea_write,              \
-                        initial_value)                                         \
-    spr_register_kvm_hv(env, num, name, uea_read, uea_write,                   \
-                        oea_read, oea_write, hea_read, hea_write,              \
-                        0, initial_value)
-
-static inline void _spr_register(CPUPPCState *env, int num,
-                                 const char *name,
-                                 void (*uea_read)(DisasContext *ctx,
-                                                  int gprn, int sprn),
-                                 void (*uea_write)(DisasContext *ctx,
-                                                   int sprn, int gprn),
-#if !defined(CONFIG_USER_ONLY)
+typedef void spr_callback(DisasContext *, int, int);
 
-                                 void (*oea_read)(DisasContext *ctx,
-                                                  int gprn, int sprn),
-                                 void (*oea_write)(DisasContext *ctx,
-                                                   int sprn, int gprn),
-                                 void (*hea_read)(DisasContext *opaque,
-                                                  int gprn, int sprn),
-                                 void (*hea_write)(DisasContext *opaque,
-                                                   int sprn, int gprn),
-#endif
-#if defined(CONFIG_KVM)
-                                 uint64_t one_reg_id,
-#endif
-                                 target_ulong initial_value)
+static void _spr_register(CPUPPCState *env, int num, const char *name,
+                          USR_ARG(spr_callback *uea_read)
+                          USR_ARG(spr_callback *uea_write)
+                          SYS_ARG(spr_callback *oea_read)
+                          SYS_ARG(spr_callback *oea_write)
+                          SYS_ARG(spr_callback *hea_read)
+                          SYS_ARG(spr_callback *hea_write)
+                          KVM_ARG(uint64_t one_reg_id)
+                          target_ulong initial_value)
 {
-    ppc_spr_t *spr;
+    ppc_spr_t *spr = &env->spr_cb[num];
+
+    /* No SPR should be registered twice. */
+    assert(spr->name == NULL);
+    assert(name != NULL);
 
-    spr = &env->spr_cb[num];
-    if (spr->name != NULL || env->spr[num] != 0x00000000 ||
-#if !defined(CONFIG_USER_ONLY)
-        spr->oea_read != NULL || spr->oea_write != NULL ||
-#endif
-        spr->uea_read != NULL || spr->uea_write != NULL) {
-        printf("Error: Trying to register SPR %d (%03x) twice !\n", num, num);
-        exit(1);
-    }
-#if defined(PPC_DEBUG_SPR)
-    printf("*** register spr %d (%03x) %s val " TARGET_FMT_lx "\n", num, num,
-           name, initial_value);
-#endif
     spr->name = name;
+    spr->default_value = initial_value;
+    env->spr[num] = initial_value;
+
+#ifdef CONFIG_TCG
     spr->uea_read = uea_read;
     spr->uea_write = uea_write;
-#if !defined(CONFIG_USER_ONLY)
+# ifndef CONFIG_USER_ONLY
     spr->oea_read = oea_read;
     spr->oea_write = oea_write;
     spr->hea_read = hea_read;
     spr->hea_write = hea_write;
+# endif
 #endif
-#if defined(CONFIG_KVM)
-    spr->one_reg_id = one_reg_id,
-#endif
-    env->spr[num] = spr->default_value = initial_value;
-}
+#ifdef CONFIG_KVM
+    spr->one_reg_id = one_reg_id;
+#endif
+}
+
+/* spr_register_kvm_hv passes all required arguments. */
+#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,             \
+                            oea_read, oea_write, hea_read, hea_write,        \
+                            one_reg_id, initial_value)                       \
+    _spr_register(env, num, name,                                            \
+                  USR_ARG(uea_read) USR_ARG(uea_write)                       \
+                  SYS_ARG(oea_read) SYS_ARG(oea_write)                       \
+                  SYS_ARG(hea_read) SYS_ARG(hea_write)                       \
+                  KVM_ARG(one_reg_id) initial_value)
+
+/* spr_register_kvm duplicates the oea callbacks to the hea callbacks. */
+#define spr_register_kvm(env, num, name, uea_read, uea_write,                \
+                         oea_read, oea_write, one_reg_id, ival)              \
+    spr_register_kvm_hv(env, num, name, uea_read, uea_write, oea_read,       \
+                        oea_write, oea_read, oea_write, one_reg_id, ival)
+
+/* spr_register_hv and spr_register are similar, except there is no kvm id. */
+#define spr_register_hv(env, num, name, uea_read, uea_write,                 \
+                        oea_read, oea_write, hea_read, hea_write, ival)      \
+    spr_register_kvm_hv(env, num, name, uea_read, uea_write, oea_read,       \
+                        oea_write, hea_read, hea_write, 0, ival)
+
+#define spr_register(env, num, name, uea_read, uea_write,                    \
+                     oea_read, oea_write, ival)                              \
+    spr_register_kvm(env, num, name, uea_read, uea_write,                    \
+                     oea_read, oea_write, 0, ival)
 
 /* Generic PowerPC SPRs */
 static void gen_spr_generic(CPUPPCState *env)
-- 
2.31.1


