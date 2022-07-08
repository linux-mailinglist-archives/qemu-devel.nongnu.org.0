Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FF556BE40
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:38:20 +0200 (CEST)
Received: from localhost ([::1]:49848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qzj-0002im-SC
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDC-000603-NR
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:12 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:45960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDA-0002TL-Mm
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:10 -0400
Received: by mail-pl1-x62a.google.com with SMTP id d5so16628722plo.12
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=loeSKEoq2daOdPkhNfaGpJOqptRl1Z7V1/Ub8FEvBaI=;
 b=yAWiX0IDExF2W3/az9f1pb9+g5X8j3M/IFU0SQUgjQIG5zT2TaQKlW0yTc1zKc5YaH
 MrKYR8cQFs59MdWDICOKzQEa0JcNe6NLG9RKf1Pp/nZYyKk+2EKCpLsj1Qd/TeBhwov+
 mYHQJBiFYHN+8h4nDeuYazoExfrv+RDF3Sh4Uq/914U4x75CjbB2fwL7MHbYJOooyfc7
 kCfcb0DxMSrpAmcdiWqYTyiu+Y/pA7dle1rYHB4zYBhYQmOLb+camM8+ZJ1aYh+wQPu6
 8BdF1qwy8EgC8aags+FeRCbmfC+cAtcV5/ESPB8sKecVSsNEpo0ZMprTpEV/b33M8JfB
 6ZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=loeSKEoq2daOdPkhNfaGpJOqptRl1Z7V1/Ub8FEvBaI=;
 b=wZA/bOhlrTUWWUpSBsOZFiGVfP7oaSRk1MBs7GTO8AN3w4hnl8TVj0rM1fkGP3/UlK
 whxGtmmUKfLsx57h4Soo+Wz4YpWIwQFzrwmCxASMo16WTWRkXcAo5E4bb7NXS8bFchG5
 i1/dU5O31IL+hDORAJoynP1vN2S25Xz/be6cuqVcVGC6xNd5HaRH44AP4jhxi8pvY7bL
 5CGNAJx1+GITqmx0H4eFDmovjldzmalwKB4inqKchsIcbzJrK5qCrxNi57AbBSOr5lug
 75Qes6kRX57RrBS5s1X6vyaE3+mpMDs8t1LGaCf2DFtgBTNv99bzSVJUnewT8pLFg7hZ
 i3Hw==
X-Gm-Message-State: AJIora99z4NONmS4bPn24D6i0TGd7Im1blKQjEUY9V2q3sRsOMJEJFA6
 Z10GmKxkFJSgaXFkoVYKdUvvGPA2nkyaKBbV
X-Google-Smtp-Source: AGRyM1ulhArIgeXbW2NGihSncptKukuLQEl4ZnH6+yWUaPIOmbqOQmE0/xpsgxJ6gdt1tDC7lYz+Uw==
X-Received: by 2002:a17:90a:6383:b0:1ef:c181:3777 with SMTP id
 f3-20020a17090a638300b001efc1813777mr556182pjj.50.1657295287871; 
 Fri, 08 Jul 2022 08:48:07 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:48:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 20/29] aarch64: Reorg sve reginfo to save space
Date: Fri,  8 Jul 2022 21:16:51 +0530
Message-Id: <20220708154700.18682-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Mirror the signal frame by storing all of the registers
as a lump.  Use the signal macros to pull out the values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu_reginfo_aarch64.h |  45 ++++++-----
 risu_reginfo_aarch64.c | 171 ++++++++++++++++++++---------------------
 2 files changed, 108 insertions(+), 108 deletions(-)

diff --git a/risu_reginfo_aarch64.h b/risu_reginfo_aarch64.h
index efbca56..536c12b 100644
--- a/risu_reginfo_aarch64.h
+++ b/risu_reginfo_aarch64.h
@@ -13,27 +13,17 @@
 #ifndef RISU_REGINFO_AARCH64_H
 #define RISU_REGINFO_AARCH64_H
 
-#include <signal.h> /* for SVE_MAGIC */
-
-struct simd_reginfo {
-    __uint128_t vregs[32];
-    char end[0];
-};
-
-struct sve_reginfo {
-    /* SVE */
-    uint16_t    vl; /* current VL */
-    __uint128_t zregs[SVE_NUM_ZREGS][SVE_VQ_MAX];
-    uint16_t    pregs[SVE_NUM_PREGS][SVE_VQ_MAX];
-    uint16_t    ffr[SVE_VQ_MAX];
-    char end[0];
-};
+#include <signal.h>
 
 /* The kernel headers set this based on future arch extensions.
    The current arch maximum is 16.  Save space below.  */
 #undef SVE_VQ_MAX
 #define SVE_VQ_MAX 16
 
+#define ROUND_UP(SIZE, POW2)    (((SIZE) + (POW2) - 1) & -(POW2))
+#define RISU_SVE_REGS_SIZE(VQ)  ROUND_UP(SVE_SIG_REGS_SIZE(VQ), 16)
+#define RISU_SIMD_REGS_SIZE     (32 * 16)
+
 struct reginfo {
     uint64_t fault_address;
     uint64_t regs[31];
@@ -45,11 +35,28 @@ struct reginfo {
     /* FP/SIMD */
     uint32_t fpsr;
     uint32_t fpcr;
+    uint16_t sve_vl;
+    uint16_t reserved;
 
-    union {
-        struct simd_reginfo simd;
-        struct sve_reginfo sve;
-    };
+    char extra[RISU_SVE_REGS_SIZE(SVE_VQ_MAX)]
+        __attribute__((aligned(16)));
 };
 
+static inline uint64_t *reginfo_vreg(struct reginfo *ri, int i)
+{
+    return (uint64_t *)&ri->extra[i * 16];
+}
+
+static inline uint64_t *reginfo_zreg(struct reginfo *ri, int vq, int i)
+{
+    return (uint64_t *)&ri->extra[SVE_SIG_ZREG_OFFSET(vq, i) -
+                                  SVE_SIG_REGS_OFFSET];
+}
+
+static inline uint16_t *reginfo_preg(struct reginfo *ri, int vq, int i)
+{
+    return (uint16_t *)&ri->extra[SVE_SIG_PREG_OFFSET(vq, i) -
+                                  SVE_SIG_REGS_OFFSET];
+}
+
 #endif /* RISU_REGINFO_AARCH64_H */
diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index 16a57ba..81a77ba 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -61,9 +61,13 @@ void process_arch_opt(int opt, const char *arg)
 
 int reginfo_size(struct reginfo *ri)
 {
-    int size = offsetof(struct reginfo, simd.end);
-    if (test_sve) {
-        size = offsetof(struct reginfo, sve.end);
+    int size = offsetof(struct reginfo, extra);
+
+    if (ri->sve_vl) {
+        int vq = sve_vq_from_vl(ri->sve_vl);
+        size += RISU_SVE_REGS_SIZE(vq);
+    } else {
+        size += RISU_SIMD_REGS_SIZE;
     }
     return size;
 }
@@ -128,6 +132,7 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
             fprintf(stderr, "risu_reginfo_aarch64: failed to get SVE state\n");
             return;
         }
+
         if (sve->vl != sve_vl_from_vq(vq)) {
             fprintf(stderr, "risu_reginfo_aarch64: "
                     "unexpected SVE state: %d != %d\n",
@@ -135,42 +140,22 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
             return;
         }
 
-        ri->sve.vl = sve->vl;
-
-        if (sve->head.size < SVE_SIG_CONTEXT_SIZE(vq)) {
-            if (sve->head.size == sizeof(*sve)) {
-                /* SVE state is empty -- not an error.  */
-            } else {
-                fprintf(stderr, "risu_reginfo_aarch64: "
-                        "failed to get complete SVE state\n");
-            }
+        if (sve->head.size <= SVE_SIG_CONTEXT_SIZE(0)) {
+            /* Only AdvSIMD state is present. */
+        } else if (sve->head.size < SVE_SIG_CONTEXT_SIZE(vq)) {
+            fprintf(stderr, "risu_reginfo_aarch64: "
+                    "failed to get complete SVE state\n");
+            return;
+        } else {
+            ri->sve_vl = sve->vl;
+            memcpy(reginfo_zreg(ri, vq, 0),
+                   (char *)sve + SVE_SIG_REGS_OFFSET,
+                   SVE_SIG_REGS_SIZE(vq));
             return;
         }
-
-        /* Copy ZREG's one at a time */
-        for (i = 0; i < SVE_NUM_ZREGS; i++) {
-            memcpy(&ri->sve.zregs[i],
-                   (void *)sve + SVE_SIG_ZREG_OFFSET(vq, i),
-                   SVE_SIG_ZREG_SIZE(vq));
-        }
-
-        /* Copy PREG's one at a time */
-        for (i = 0; i < SVE_NUM_PREGS; i++) {
-            memcpy(&ri->sve.pregs[i],
-                   (void *)sve + SVE_SIG_PREG_OFFSET(vq, i),
-                   SVE_SIG_PREG_SIZE(vq));
-        }
-
-        /* Finally the FFR */
-        memcpy(&ri->sve.ffr, (void *)sve + SVE_SIG_FFR_OFFSET(vq),
-               SVE_SIG_FFR_SIZE(vq));
-
-        return;
     }
 
-    for (i = 0; i < 32; i++) {
-        ri->simd.vregs[i] = fp->vregs[i];
-    }
+    memcpy(reginfo_vreg(ri, 0), fp->vregs, RISU_SIMD_REGS_SIZE);
 }
 
 /* reginfo_is_eq: compare the reginfo structs, returns nonzero if equal */
@@ -206,18 +191,20 @@ static void sve_dump_preg_diff(FILE *f, int vq, const uint16_t *p1,
     fprintf(f, "\n");
 }
 
-static void sve_dump_zreg_diff(FILE *f, int vq, const __uint128_t *z1,
-                               const __uint128_t *z2)
+static void sve_dump_zreg_diff(FILE *f, int vq, const uint64_t *za,
+                               const uint64_t *zb)
 {
     const char *pad = "";
     int q;
 
     for (q = 0; q < vq; ++q) {
-        if (z1[q] != z2[q]) {
+        uint64_t za0 = za[2 * q], za1 = za[2 * q + 1];
+        uint64_t zb0 = zb[2 * q], zb1 = zb[2 * q + 1];
+
+        if (za0 != zb0 || za1 != zb1) {
             fprintf(f, "%sq%-2d: %016" PRIx64 "%016" PRIx64
-                    " vs %016" PRIx64 "%016" PRIx64"\n", pad, q,
-                    (uint64_t)(z1[q] >> 64), (uint64_t)z1[q],
-                    (uint64_t)(z2[q] >> 64), (uint64_t)z2[q]);
+                    " vs %016" PRIx64 "%016" PRIx64"\n",
+                    pad, q, za1, za0, zb1, zb0);
             pad = "      ";
         }
     }
@@ -239,38 +226,41 @@ int reginfo_dump(struct reginfo *ri, FILE * f)
     fprintf(f, "  fpsr   : %08x\n", ri->fpsr);
     fprintf(f, "  fpcr   : %08x\n", ri->fpcr);
 
-    if (test_sve) {
-        int q, vq = test_sve;
+    if (ri->sve_vl) {
+        int vq = sve_vq_from_vl(ri->sve_vl);
+        int q;
 
-        fprintf(f, "  vl     : %d\n", ri->sve.vl);
+        fprintf(f, "  vl     : %d\n", ri->sve_vl);
 
-        for (i = 0; i < 32; i++) {
-            fprintf(f, "  Z%-2d q%-2d: %016" PRIx64 "%016" PRIx64 "\n", i, 0,
-                    (uint64_t)(ri->sve.zregs[i][0] >> 64),
-                    (uint64_t)ri->sve.zregs[i][0]);
+        for (i = 0; i < SVE_NUM_ZREGS; i++) {
+            uint64_t *z = reginfo_zreg(ri, vq, i);
+
+            fprintf(f, "  Z%-2d q%-2d: %016" PRIx64 "%016" PRIx64 "\n",
+                    i, 0, z[1], z[0]);
             for (q = 1; q < vq; ++q) {
-                fprintf(f, "      q%-2d: %016" PRIx64 "%016" PRIx64 "\n", q,
-                        (uint64_t)(ri->sve.zregs[i][q] >> 64),
-                        (uint64_t)ri->sve.zregs[i][q]);
+                fprintf(f, "      q%-2d: %016" PRIx64 "%016" PRIx64 "\n",
+                        q, z[q * 2 + 1], z[q * 2]);
             }
         }
 
-        for (i = 0; i < 16; i++) {
-            fprintf(f, "  P%-2d    : ", i);
-            sve_dump_preg(f, vq, &ri->sve.pregs[i][0]);
+        for (i = 0; i < SVE_NUM_PREGS + 1; i++) {
+            uint16_t *p = reginfo_preg(ri, vq, i);
+
+            if (i == SVE_NUM_PREGS) {
+                fprintf(f, "  FFR    : ");
+            } else {
+                fprintf(f, "  P%-2d    : ", i);
+            }
+            sve_dump_preg(f, vq, p);
             fprintf(f, "\n");
         }
-        fprintf(f, "  FFR    : ");
-        sve_dump_preg(f, vq, &ri->sve.ffr[0]);
-        fprintf(f, "\n");
-
         return !ferror(f);
     }
 
     for (i = 0; i < 32; i++) {
-        fprintf(f, "  V%-2d    : %016" PRIx64 "%016" PRIx64 "\n", i,
-                (uint64_t) (ri->simd.vregs[i] >> 64),
-                (uint64_t) (ri->simd.vregs[i]));
+        uint64_t *v = reginfo_vreg(ri, i);
+        fprintf(f, "  V%-2d    : %016" PRIx64 "%016" PRIx64 "\n",
+                i, v[1], v[0]);
     }
 
     return !ferror(f);
@@ -314,44 +304,47 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
         fprintf(f, "  fpcr   : %08x vs %08x\n", m->fpcr, a->fpcr);
     }
 
-    if (test_sve) {
-        int vq = sve_vq_from_vl(m->sve.vl);
+    if (m->sve_vl != a->sve_vl) {
+        fprintf(f, "  vl    : %d vs %d\n", m->sve_vl, a->sve_vl);
+    }
 
-        if (m->sve.vl != a->sve.vl) {
-            fprintf(f, "  vl    : %d vs %d\n", m->sve.vl, a->sve.vl);
-        }
+    if (m->sve_vl) {
+        int vq = sve_vq_from_vl(m->sve_vl);
 
         for (i = 0; i < SVE_NUM_ZREGS; i++) {
-            if (!sve_zreg_is_eq(vq, &m->sve.zregs[i], &a->sve.zregs[i])) {
-                fprintf(f, "  Z%-2d ", i);
-                sve_dump_zreg_diff(f, vq, &m->sve.zregs[i][0],
-                                   &a->sve.zregs[i][0]);
-            }
-        }
-        for (i = 0; i < SVE_NUM_PREGS; i++) {
-            if (!sve_preg_is_eq(vq, &m->sve.pregs[i], &a->sve.pregs[i])) {
-                fprintf(f, "  P%-2d    : ", i);
-                sve_dump_preg_diff(f, vq, &m->sve.pregs[i][0],
-                                   &a->sve.pregs[i][0]);
-            }
-        }
-        if (!sve_preg_is_eq(vq, &m->sve.ffr, &a->sve.ffr)) {
-            fprintf(f, "  FFR   : ");
-            sve_dump_preg_diff(f, vq, &m->sve.pregs[i][0], &a->sve.pregs[i][0]);
-        }
+            uint64_t *zm = reginfo_zreg(m, vq, i);
+            uint64_t *za = reginfo_zreg(a, vq, i);
 
+            if (!sve_zreg_is_eq(vq, zm, za)) {
+                fprintf(f, "  Z%-2d ", i);
+                sve_dump_zreg_diff(f, vq, zm, za);
+            }
+        }
+        for (i = 0; i < SVE_NUM_PREGS + 1; i++) {
+            uint16_t *pm = reginfo_preg(m, vq, i);
+            uint16_t *pa = reginfo_preg(a, vq, i);
+
+            if (!sve_preg_is_eq(vq, pm, pa)) {
+                if (i == SVE_NUM_PREGS) {
+                    fprintf(f, "  FFR   : ");
+                } else {
+                    fprintf(f, "  P%-2d    : ", i);
+                }
+                sve_dump_preg_diff(f, vq, pm, pa);
+            }
+        }
         return !ferror(f);
     }
 
     for (i = 0; i < 32; i++) {
-        if (m->simd.vregs[i] != a->simd.vregs[i]) {
+        uint64_t *mv = reginfo_vreg(m, i);
+        uint64_t *av = reginfo_vreg(a, i);
+
+        if (mv[0] != av[0] || mv[1] != av[1]) {
             fprintf(f, "  V%-2d    : "
                     "%016" PRIx64 "%016" PRIx64 " vs "
-                    "%016" PRIx64 "%016" PRIx64 "\n", i,
-                    (uint64_t) (m->simd.vregs[i] >> 64),
-                    (uint64_t) m->simd.vregs[i],
-                    (uint64_t) (a->simd.vregs[i] >> 64),
-                    (uint64_t) a->simd.vregs[i]);
+                    "%016" PRIx64 "%016" PRIx64 "\n",
+                    i, mv[1], mv[0], av[1], av[0]);
         }
     }
 
-- 
2.34.1


