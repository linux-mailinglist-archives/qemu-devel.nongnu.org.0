Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DD556BE4E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:44:28 +0200 (CEST)
Received: from localhost ([::1]:33994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9r5f-0003Ii-N1
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qD7-0005yd-PG
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:08 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qD5-0002X2-EK
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:05 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso2313765pjc.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cT93Lxc9mPWCnChsVCUCuYS7cifJUMOpzXauTBVN+y4=;
 b=kLncZh2cCRZ0gNjwCfYl6p1PQyezmnZItOPl8xO95pu1Ti/hLdJbXVrou1ysqmXazB
 7PH9ENNq2Q5B4DeJMpxogBK0l9MYkeHiCoSBZRhkcmK9VEMZJQAetH+5Luc3G4n0inb9
 LARN+uSTx4uiUHwup0IrGD6hc5c5iEwp35LUboyTZJLxBrlWbxIBv34Qpf5aoFe0hpqw
 C4tp7+sNjjLemzpJZ9JnbnTPg5lfeeyADPfE8iDUbLEcgKmjKPNMJhauhx+Z6rOoRp9G
 Wz9bi7yTWfEIMMcehYPdAIKBTtok6KK1GAbp5ntrwgD7JOUg4Go66lcXxxsC3xnC9f9+
 uhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cT93Lxc9mPWCnChsVCUCuYS7cifJUMOpzXauTBVN+y4=;
 b=56ty48uOle20mumGwG7910h2faCvekxIYN2KGZ7xmkX2227Rcop4sBQu+zTpC/24Me
 wQVmU+tDPgAVORsxr0nsK8u/0siLtUC+KBiLLSbnuukFR7u9at9yya6Va79Ojn7/U+Pi
 Jt/kgf27+vMHemtGajckMtiD9ryVq6mNBA4DYRDT8BDQQbB0sScU5bixgP3LDJMJypAP
 1wYUCn1YDYuVZTJ+wlf0iDm1c2WSuHoqdnEeBgI6qk2xWeVCNeJSlI9GP7W5qWjEo7N1
 Vm1UsVG1Wt51+JG38ei8uLagAPH/jvPbpai+VzL1MeuN0GH8x828aXXN3TcZdi2OzFE/
 Qg7g==
X-Gm-Message-State: AJIora+5AXlNjQ0mbgA0rtzfUZ7ijKTUqpOO2PK3GHwNQYaQyt9Mm45n
 WDkDBHtrcmtKGc0pt4hvQNrSPs5Dws2rRmnN
X-Google-Smtp-Source: AGRyM1vC1D3OQuYhedlWbfVEMIdO+2Xk+WTKFGbADRqykgVDIfdnUMmDOgIvwMG3CRXwMLqIgGdxAA==
X-Received: by 2002:a17:902:7402:b0:16c:9e2:3b1c with SMTP id
 g2-20020a170902740200b0016c09e23b1cmr4179855pll.128.1657295282168; 
 Fri, 08 Jul 2022 08:48:02 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:48:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 18/29] Compute reginfo_size based on the reginfo
Date: Fri,  8 Jul 2022 21:16:49 +0530
Message-Id: <20220708154700.18682-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

This will allow dumping of SVE frames without having
to know the SVE vector length beforehand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.h                 | 2 +-
 risu.c                 | 9 +++++++--
 risu_reginfo_aarch64.c | 4 ++--
 risu_reginfo_arm.c     | 4 ++--
 risu_reginfo_i386.c    | 4 ++--
 risu_reginfo_m68k.c    | 4 ++--
 risu_reginfo_ppc64.c   | 4 ++--
 7 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/risu.h b/risu.h
index bfcf0af..3cad3d5 100644
--- a/risu.h
+++ b/risu.h
@@ -126,6 +126,6 @@ int reginfo_dump(struct reginfo *ri, FILE * f);
 int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f);
 
 /* return size of reginfo */
-const int reginfo_size(void);
+int reginfo_size(struct reginfo *ri);
 
 #endif /* RISU_H */
diff --git a/risu.c b/risu.c
index a248db1..a70b778 100644
--- a/risu.c
+++ b/risu.c
@@ -125,7 +125,7 @@ static RisuResult send_register_info(void *uc)
     case OP_TESTEND:
     case OP_COMPARE:
     case OP_SIGILL:
-        header.size = reginfo_size();
+        header.size = reginfo_size(&ri[MASTER]);
         extra = &ri[MASTER];
         break;
     case OP_COMPAREMEM:
@@ -209,7 +209,12 @@ static RisuResult recv_register_info(struct reginfo *ri)
             return RES_BAD_SIZE;
         }
         respond(RES_OK);
-        return read_buffer(ri, header.size);
+        res = read_buffer(ri, header.size);
+        if (res == RES_OK && header.size != reginfo_size(ri)) {
+            /* The payload size is not self-consistent with the data. */
+            return RES_BAD_SIZE;
+        }
+        return res;
 
     case OP_COMPAREMEM:
         if (header.size != MEMBLOCKLEN) {
diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index 028c690..7044648 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -69,7 +69,7 @@ void process_arch_opt(int opt, const char *arg)
 #endif
 }
 
-const int reginfo_size(void)
+int reginfo_size(struct reginfo *ri)
 {
     int size = offsetof(struct reginfo, simd.end);
 #ifdef SVE_MAGIC
@@ -194,7 +194,7 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
 /* reginfo_is_eq: compare the reginfo structs, returns nonzero if equal */
 int reginfo_is_eq(struct reginfo *r1, struct reginfo *r2)
 {
-    return memcmp(r1, r2, reginfo_size()) == 0;
+    return memcmp(r1, r2, reginfo_size(r1)) == 0;
 }
 
 #ifdef SVE_MAGIC
diff --git a/risu_reginfo_arm.c b/risu_reginfo_arm.c
index 3662f12..47c52e8 100644
--- a/risu_reginfo_arm.c
+++ b/risu_reginfo_arm.c
@@ -36,9 +36,9 @@ void process_arch_opt(int opt, const char *arg)
     abort();
 }
 
-const int reginfo_size(void)
+int reginfo_size(struct reginfo *ri)
 {
-    return sizeof(struct reginfo);
+    return sizeof(*ri);
 }
 
 static void reginfo_init_vfp(struct reginfo *ri, ucontext_t *uc)
diff --git a/risu_reginfo_i386.c b/risu_reginfo_i386.c
index 60fc239..50505ab 100644
--- a/risu_reginfo_i386.c
+++ b/risu_reginfo_i386.c
@@ -74,9 +74,9 @@ void process_arch_opt(int opt, const char *arg)
     }
 }
 
-const int reginfo_size(void)
+int reginfo_size(struct reginfo *ri)
 {
-    return sizeof(struct reginfo);
+    return sizeof(*ri);
 }
 
 static void *xsave_feature_buf(struct _xstate *xs, int feature)
diff --git a/risu_reginfo_m68k.c b/risu_reginfo_m68k.c
index 32b28c8..4eb30cd 100644
--- a/risu_reginfo_m68k.c
+++ b/risu_reginfo_m68k.c
@@ -23,9 +23,9 @@ void process_arch_opt(int opt, const char *arg)
     abort();
 }
 
-const int reginfo_size(void)
+int reginfo_size(struct reginfo *ri)
 {
-    return sizeof(struct reginfo);
+    return sizeof(*ri);
 }
 
 /* reginfo_init: initialize with a ucontext */
diff --git a/risu_reginfo_ppc64.c b/risu_reginfo_ppc64.c
index 071c951..39e8f1c 100644
--- a/risu_reginfo_ppc64.c
+++ b/risu_reginfo_ppc64.c
@@ -32,9 +32,9 @@ void process_arch_opt(int opt, const char *arg)
     abort();
 }
 
-const int reginfo_size(void)
+int reginfo_size(struct reginfo *ri)
 {
-    return sizeof(struct reginfo);
+    return sizeof(*ri);
 }
 
 /* reginfo_init: initialize with a ucontext */
-- 
2.34.1


