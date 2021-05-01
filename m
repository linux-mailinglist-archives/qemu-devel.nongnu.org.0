Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F499370505
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 04:31:17 +0200 (CEST)
Received: from localhost ([::1]:53110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcfPY-0000HS-3G
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 22:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcfNp-0007NP-U5
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 22:29:29 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcfNn-0007Jd-5z
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 22:29:29 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 z6-20020a17090a1706b0290155e8a752d8so2692300pjd.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 19:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vHJUijIYG+g2Aj4U0s3/IdjEIOP8gtldHrqrkSDN10c=;
 b=YibqeHLhmYpogZCLbkMHkHuxDdB8jBs/L4AfF+OtUTRCyv7jHKkvTz1zMeKpaupEK/
 AcbrzII9DoDbH9+7IDX3avtarg2H2xxm0bwD9Aj7hdO2A+AZTWuICqgAE4Nl3IwsAO2u
 1cb1crjBNox2x6nq846SnFRU23Uf1Igk3E1LwlEXf+UWBFD5dEXzDtUHRtRbT7d3ieKJ
 1w6K1jxfYZl1fO7smMRtxFeg5aaV+UIfEjSjl+4xTvC+Z0XCh+oOcC20I+P4adOcKZu5
 Q/2XK94g6Gj/GQPI4qciPEAkMMfCeVxHAzNCu3X/ivzR0E3tI/vs0F19ltZspIJykr+S
 wylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vHJUijIYG+g2Aj4U0s3/IdjEIOP8gtldHrqrkSDN10c=;
 b=rt+GF4MA2IGM4q3gbG52Pt91x2DfJVOAN8gX9XVX4v3yQB2YD/f3rf3+PeoxGI2RmR
 Fhfsc/HsldjFpOJoOXGSML8a1JAlvAjndCMzBApf2XVlpjh+SWM8rU8ts+3wwyI//ezC
 ad+3KCo00sD65EeCJj3YwGCHSBFWg8d0/a5XxdVvm8hv5YfPrAjVzyQEANIsQQ64KBe/
 ZYPSy/vR++FwIQ7iBt/knl9/nSBYKMoMRE1rESODr99XPu8iRJLnJG+SZpziFpuoMLrU
 igCIwAWubge/shPlEFaRJc0nOqrc9DCzfm+Fo93Je6iWl+w+xz4q7aAj9CSpyJRzJAF2
 aBKA==
X-Gm-Message-State: AOAM53190IR1DzSDDa3ZCeIvRpGxG6r6kIhqftICfRqQFxbHQXErhfXn
 7gf6jPfy23VZYTjNMryGZuweMLGb8zYwpw==
X-Google-Smtp-Source: ABdhPJw9o3e8GZfpmeqkTAmFddHtHhGnSXcFi6hD7wqYtOZpNCL0jRB310CxiTUrmzaEp5bhsexDQw==
X-Received: by 2002:a17:902:7284:b029:ee:a57c:1dc9 with SMTP id
 d4-20020a1709027284b02900eea57c1dc9mr4687219pll.36.1619836165915; 
 Fri, 30 Apr 2021 19:29:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id n6sm684905pgq.72.2021.04.30.19.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 19:29:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/ppc: Clean up _spr_register et al
Date: Fri, 30 Apr 2021 19:29:22 -0700
Message-Id: <20210501022923.1179736-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501022923.1179736-1-richard.henderson@linaro.org>
References: <20210501022923.1179736-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, luis.pires@eldorado.org.br,
 matheus.ferst@eldorado.org.br, bruno.larsen@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce 3 helper macros to elide arguments that we cannot supply.
This reduces the repetition required to get the job done.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate_init.c.inc | 154 +++++++++++++++-----------------
 1 file changed, 74 insertions(+), 80 deletions(-)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index c03a7c4f52..49a92b20b4 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -721,104 +721,98 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
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
+# define USR_ARG(X)
+# define SYS_ARG(X)
+#endif
+#ifdef CONFIG_KVM
+# define KVM_ARG(X)    X,
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
-#endif
+# define KVM_ARG(X)
 #endif
 
-#define spr_register(env, num, name, uea_read, uea_write,                      \
-                     oea_read, oea_write, initial_value)                       \
-    spr_register_kvm(env, num, name, uea_read, uea_write,                      \
-                     oea_read, oea_write, 0, initial_value)
+typedef void spr_callback(DisasContext *, int, int);
 
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
-
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
+#ifdef CONFIG_KVM
+    spr->one_reg_id = one_reg_id;
 #endif
-    env->spr[num] = spr->default_value = initial_value;
 }
 
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
+
 /* Generic PowerPC SPRs */
 static void gen_spr_generic(CPUPPCState *env)
 {
-- 
2.25.1


