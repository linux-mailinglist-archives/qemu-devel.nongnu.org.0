Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB0D56BE5F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 19:05:09 +0200 (CEST)
Received: from localhost ([::1]:55970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9rPg-0002pr-8m
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 13:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDQ-0006MG-DM
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:24 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDO-0002XV-Lu
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:24 -0400
Received: by mail-pl1-x62c.google.com with SMTP id y18so8656098plb.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KHCjODk+vnGajKdN8rNYoLNgAJ6Sd7+uxGwpqklP/xM=;
 b=NMEfns2BwCLb6OTZ9xSuMWVCZS6t/zVm7cN4YZ3Oqr8Hv6/XBGSA6h/dmCzS2cjtil
 76WKGeB9oNxaW35tW10OgsV/Vcn8UVrkIG6vRmzmC2DkTHnS3vL32hnDxX4aaEH7riXU
 pHm1FQtgc927o+jITFmqg3Yk/J898pnJY0gR3yyTcpkhBBpE7lcFmSyKtGoJvhFcbqGP
 ahtLXhS+8wpXQJc8nUDvWC/ueOB5woZRb4IBokFk2+A5b+7GM3AVMz/GvJw2QW39yASL
 nU3DemIPREZauSulb4tnkYSh3RS1/snVkQBLAtA9DowmprN+3dTa7sFBiJI7gGjPo9V+
 MwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KHCjODk+vnGajKdN8rNYoLNgAJ6Sd7+uxGwpqklP/xM=;
 b=UIA/KrOS8ZSLt16UAzA5zZLDs9gf0KVNLmPF+lVHe4g5lNKvkKWrZbXLbAnQA9HSEk
 KLKC48rL3fhLM0Aj80OiMN7dW/w81wnrTsObeor5mgePw+39h7vxftLHeQOiDN9oorK4
 XX4jY7hOf57YVYwMmNW4SoL3g1eJ123kYEW/EqSl0zuMFFenZ7KWxiX0Rqvu/cMe2jVH
 FEKOYEoMljakpTPtKnZoYhAWnV33FOuK/v+6FlyRNwzPd83pXE+wTWUlRCdwYjdrSIPl
 V2R6JOg2ybmCzI9bKEMUAEKgp9wS7dgQbHDpiueAvdJjx3Mk+EWCntuA9jdXVq2oD89h
 GKYQ==
X-Gm-Message-State: AJIora/so5FGOBbFMRguZWBCEL9A9sPR5zkFmNicAyeShICehMqeSM2s
 CL5rrCLC7oLYKW3IzHaoVOuiy35H+FjKJwKz
X-Google-Smtp-Source: AGRyM1tGO2N2ImkEzLvj0GJJcGo3kLPn/efOEZFrENjaPg7hy6GNJPruEJJCbTylPXa8w8ojDCpTYQ==
X-Received: by 2002:a17:90a:be0c:b0:1ef:accb:23a5 with SMTP id
 a12-20020a17090abe0c00b001efaccb23a5mr490128pjs.113.1657295301876; 
 Fri, 08 Jul 2022 08:48:21 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:48:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 25/29] Remove return value from reginfo_dump
Date: Fri,  8 Jul 2022 21:16:56 +0530
Message-Id: <20220708154700.18682-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

No uses actually checked the error indication.  Even if we wanted
to check ferror on the stream, we should do that generically rather
than per arch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.h                 | 4 ++--
 risu_reginfo_aarch64.c | 8 +++-----
 risu_reginfo_arm.c     | 6 ++----
 risu_reginfo_i386.c    | 6 ++----
 risu_reginfo_m68k.c    | 6 ++----
 risu_reginfo_ppc64.c   | 6 ++----
 6 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/risu.h b/risu.h
index 99f0d8e..6eceb9f 100644
--- a/risu.h
+++ b/risu.h
@@ -120,8 +120,8 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc);
 /* return 1 if structs are equal, 0 otherwise. */
 int reginfo_is_eq(struct reginfo *r1, struct reginfo *r2);
 
-/* print reginfo state to a stream, returns 1 on success, 0 on failure */
-int reginfo_dump(struct reginfo *ri, FILE * f);
+/* print reginfo state to a stream */
+void reginfo_dump(struct reginfo *ri, FILE *f);
 
 /* reginfo_dump_mismatch: print mismatch details to a stream */
 void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f);
diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index e0f80c0..b86864d 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -219,8 +219,8 @@ static void sve_dump_zreg_diff(FILE *f, int vq, const uint64_t *za,
     }
 }
 
-/* reginfo_dump: print state to a stream, returns nonzero on success */
-int reginfo_dump(struct reginfo *ri, FILE * f)
+/* reginfo_dump: print state to a stream */
+void reginfo_dump(struct reginfo *ri, FILE * f)
 {
     int i;
     fprintf(f, "  faulting insn %08x\n", ri->faulting_insn);
@@ -263,7 +263,7 @@ int reginfo_dump(struct reginfo *ri, FILE * f)
             sve_dump_preg(f, vq, p);
             fprintf(f, "\n");
         }
-        return !ferror(f);
+        return;
     }
 
     for (i = 0; i < 32; i++) {
@@ -271,8 +271,6 @@ int reginfo_dump(struct reginfo *ri, FILE * f)
         fprintf(f, "  V%-2d    : %016" PRIx64 "%016" PRIx64 "\n",
                 i, v[1], v[0]);
     }
-
-    return !ferror(f);
 }
 
 void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
diff --git a/risu_reginfo_arm.c b/risu_reginfo_arm.c
index ba1035e..09813c4 100644
--- a/risu_reginfo_arm.c
+++ b/risu_reginfo_arm.c
@@ -161,8 +161,8 @@ int reginfo_is_eq(struct reginfo *r1, struct reginfo *r2)
     return memcmp(r1, r2, sizeof(*r1)) == 0;    /* ok since we memset 0 */
 }
 
-/* reginfo_dump: print the state to a stream, returns nonzero on success */
-int reginfo_dump(struct reginfo *ri, FILE *f)
+/* reginfo_dump: print the state to a stream */
+void reginfo_dump(struct reginfo *ri, FILE *f)
 {
     int i;
     if (ri->faulting_insn_size == 2) {
@@ -179,8 +179,6 @@ int reginfo_dump(struct reginfo *ri, FILE *f)
                 i, (unsigned long long) ri->fpregs[i]);
     }
     fprintf(f, "  fpscr: %08x\n", ri->fpscr);
-
-    return !ferror(f);
 }
 
 void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
diff --git a/risu_reginfo_i386.c b/risu_reginfo_i386.c
index 57e4c00..37506fa 100644
--- a/risu_reginfo_i386.c
+++ b/risu_reginfo_i386.c
@@ -310,8 +310,8 @@ static char get_vecletter(uint64_t features)
     }
 }
 
-/* reginfo_dump: print state to a stream, returns nonzero on success */
-int reginfo_dump(struct reginfo *ri, FILE *f)
+/* reginfo_dump: print state to a stream */
+void reginfo_dump(struct reginfo *ri, FILE *f)
 {
     uint64_t features;
     int i, j, n, w;
@@ -345,8 +345,6 @@ int reginfo_dump(struct reginfo *ri, FILE *f)
             fprintf(f, "  k%-5d: %016" PRIx64 "\n", i, ri->kregs[i]);
         }
     }
-
-    return !ferror(f);
 }
 
 void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
diff --git a/risu_reginfo_m68k.c b/risu_reginfo_m68k.c
index 29edce9..38d7dd3 100644
--- a/risu_reginfo_m68k.c
+++ b/risu_reginfo_m68k.c
@@ -92,8 +92,8 @@ int reginfo_is_eq(struct reginfo *m, struct reginfo *a)
     return 1;
 }
 
-/* reginfo_dump: print state to a stream, returns nonzero on success */
-int reginfo_dump(struct reginfo *ri, FILE *f)
+/* reginfo_dump: print state to a stream */
+void reginfo_dump(struct reginfo *ri, FILE *f)
 {
     int i;
     fprintf(f, "  pc            \e[1;101;37m0x%08x\e[0m\n", ri->pc);
@@ -114,8 +114,6 @@ int reginfo_dump(struct reginfo *ri, FILE *f)
     }
 
     fprintf(f, "\n");
-
-    return !ferror(f);
 }
 
 void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
diff --git a/risu_reginfo_ppc64.c b/risu_reginfo_ppc64.c
index e96dc48..134a152 100644
--- a/risu_reginfo_ppc64.c
+++ b/risu_reginfo_ppc64.c
@@ -112,8 +112,8 @@ int reginfo_is_eq(struct reginfo *m, struct reginfo *a)
     return 1;
 }
 
-/* reginfo_dump: print state to a stream, returns nonzero on success */
-int reginfo_dump(struct reginfo *ri, FILE * f)
+/* reginfo_dump: print state to a stream */
+void reginfo_dump(struct reginfo *ri, FILE * f)
 {
     int i;
 
@@ -152,8 +152,6 @@ int reginfo_dump(struct reginfo *ri, FILE * f)
                 ri->vrregs.vrregs[i][0], ri->vrregs.vrregs[i][1],
                 ri->vrregs.vrregs[i][2], ri->vrregs.vrregs[i][3]);
     }
-
-    return !ferror(f);
 }
 
 void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
-- 
2.34.1


