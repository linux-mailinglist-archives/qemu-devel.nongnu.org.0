Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC3B5788C9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:50:59 +0200 (CEST)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUtW-0005ZS-5V
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSc-0008BB-82; Mon, 18 Jul 2022 13:23:10 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:43704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSa-0001rD-Hx; Mon, 18 Jul 2022 13:23:09 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 k8-20020a9d4b88000000b0061c7f8c4f77so8763293otf.10; 
 Mon, 18 Jul 2022 10:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uVfFFENSSuChvjRjR1F/q00A7ZvGxHAMTSPIY1zM1HM=;
 b=EMV1en0lmpMfSdEjxIqQUbxoxWJmv752G9ubWCSUETCvH4i6m5gY8yXkkHXNfKKHEP
 IUXHsITctvdPqlZvfH2gJRgrnoGAkPDEinD8Y13PqgPrHmKcOFoOFZKCGz1zjGtkF61G
 vxvieElh9bFtYYaHUCTWsDhg/Of5xiJmkQHwQzEyBLt46KJf0moSqvsP4uX/BSagVjns
 6ehCBozsScfogmHSRMGxHKs8cwDu4hhzXePfshG5V22t81By0wMzRKiDG9mzMHWyDH0a
 Vxu7zdefAeo6EOtSkGyLqAhnSqhl4r4up02M7AC6K0+OiOQW7B/kRWODttUkkEI1p9NR
 YReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uVfFFENSSuChvjRjR1F/q00A7ZvGxHAMTSPIY1zM1HM=;
 b=mjmqRcb+ECnY505764TzxjYRUxQ7na+LuAUGbV+NY1ZF/x2ItC/RUc1W4Kqp+HMmLu
 b8SPQMuWgHVdu7ZUVbd0ID2Mc0Ek+Njgtp0fylXDfeIMY6GzhiWJGAn2oO11E2Em7gn7
 mjNz+7I9LZvuzZ7G5ded44FxS7vlGNHvgnqEZwAIvnueiCibADzDX639jDfI6H+aR5cV
 Q00FP/xVAXthFqUgY97HWB5k5aZY9Dtsf6amVjmHzlusZDeTCv63IkeoX7wr2pSErbJg
 hFTno8jePJIjnvCzt2yJx1pPCmvfsGbRm41gktkmPu74qCrdEhPGmqCXdQBiZT6pVil4
 FdwA==
X-Gm-Message-State: AJIora+B+CIBEUhIn4+72VUNoCgEewb2kOoW4Jwcvl2WBy6s2gnlu5jg
 TDTXS5BggM+vsMxUFIG3dRwl7S+4mmc=
X-Google-Smtp-Source: AGRyM1ug6TQ6TqMHqrOy62je5PZ4LpYnrBNX8f6aE5y/cblPZTKb2xKcEm7ajkoVlSVuNXroe/L84g==
X-Received: by 2002:a05:6830:268f:b0:617:6a7:185f with SMTP id
 l15-20020a056830268f00b0061706a7185fmr11295125otu.344.1658164975442; 
 Mon, 18 Jul 2022 10:22:55 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:54 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PULL 17/30] target/ppc: add macros to check privilege level
Date: Mon, 18 Jul 2022 14:21:55 -0300
Message-Id: <20220718172208.1247624-18-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Equivalent to CHK_SV and CHK_HV, but can be used in decodetree methods.

Reviewed-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Message-Id: <20220701133507.740619-3-lucas.coutinho@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate.c                     | 21 +++++++++++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc |  7 ++-----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 8afc2e4691..e373c39fc8 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6559,6 +6559,27 @@ static int times_16(DisasContext *ctx, int x)
         }                                               \
     } while (0)
 
+#if !defined(CONFIG_USER_ONLY)
+#define REQUIRE_SV(CTX)             \
+    do {                            \
+        if (unlikely((CTX)->pr)) {  \
+            gen_priv_opc(CTX);      \
+            return true;            \
+        }                           \
+    } while (0)
+
+#define REQUIRE_HV(CTX)                         \
+    do {                                        \
+        if (unlikely((CTX)->pr || !(CTX)->hv))  \
+            gen_priv_opc(CTX);                  \
+            return true;                        \
+        }                                       \
+    } while (0)
+#else
+#define REQUIRE_SV(CTX) do { gen_priv_opc(CTX); return true; } while (0)
+#define REQUIRE_HV(CTX) do { gen_priv_opc(CTX); return true; } while (0)
+#endif
+
 /*
  * Helpers for implementing sets of trans_* functions.
  * Defer the implementation of NAME to FUNC, with optional extra arguments.
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index cb0097bedb..db14d3bebc 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -79,11 +79,8 @@ static bool do_ldst_quad(DisasContext *ctx, arg_D *a, bool store, bool prefixed)
     REQUIRE_INSNS_FLAGS(ctx, 64BX);
 
     if (!prefixed && !(ctx->insns_flags2 & PPC2_LSQ_ISA207)) {
-        if (ctx->pr) {
-            /* lq and stq were privileged prior to V. 2.07 */
-            gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
-            return true;
-        }
+        /* lq and stq were privileged prior to V. 2.07 */
+        REQUIRE_SV(ctx);
 
         if (ctx->le_mode) {
             gen_align_no_le(ctx);
-- 
2.36.1


