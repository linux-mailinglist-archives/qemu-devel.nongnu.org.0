Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FD456BE4D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:44:09 +0200 (CEST)
Received: from localhost ([::1]:60750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9r5M-0002Ix-4Q
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDK-00063t-QG
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:20 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:42655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDJ-0002Z2-7i
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:18 -0400
Received: by mail-pg1-x533.google.com with SMTP id o18so21494706pgu.9
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=myUdBY5H3tCXb2rWK3d2K6+iu2kUnl6sA6mhAcxF+sg=;
 b=rCchghh7ehU5GXG+b3vmNZ3ff+p/FNFnmXx/WMgqVLAvfmjWeA4pmVn0blCirazz7C
 hH9MKyzDmBpDLN7oofbkhX17/Wowk4++60Kf8j9b2TPV5hhxEHqghQcm1nTELshNtpR/
 5Jsf1svcQQVj4jNAsrDsn5KPJOfcLT7lHtmF/57dw3DanFCj2xNRsm+NbgmPJEMVPkwK
 +sxSLC9KgD4QCtwNFf5X61uNMyBJB/+jSkURI/gezI2w//gW1Mi9o7OxBJE3GOszohHJ
 q/UBPZoYoszX2hfyQtQCZMm0ax6X9Bk9zIqMRAdlWGS9j1PYDqXVpeN6IDdO+mM3baxq
 8Jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=myUdBY5H3tCXb2rWK3d2K6+iu2kUnl6sA6mhAcxF+sg=;
 b=iIv4EAcK3vSS2qS2/x7owHBvZp54mcKuP7MZ0eM1RVih/5L3DWSfrWw5fgFyboCxRB
 GDEjnWgGTyJ56/JmaGMPt2qKaXKfLAczd3WGBdJYJvwmHQ4zHdli3Lf1FzmTu91Fq9IO
 txZvH5nkeI/AAHqOsOgectNLBIJIVO87AS5R/Duwtjfi+RwV8mwlBn4ueWznmSkq6PhJ
 zlWl6yQJmj1Z+MCys1/8TaCC1NTEitDjkJGCzNeiQ3d91KCpK9QCGsfj+WRVvcCmXccI
 mJSh2liswsAJG1zK/U1DS16qL1lWjyPE8d6vFQlA3FWLEoS4bUGzKBvHRXnJv6oAkTwH
 UDcQ==
X-Gm-Message-State: AJIora9eihz6TI1LHrgCZMj9BKNNwo5OCcfJtOQj+OOrdJaEbjuq/t+w
 jvR5W22l9LN+tfA4RhF64mphNi8cvXYua9NV
X-Google-Smtp-Source: AGRyM1ta4ZQ/vue6UPAOfiSZB1/mefwrgaSjjeaM83f+mWrbqwPdLYB2wVERUXOO8EYLieXBckx4Ww==
X-Received: by 2002:a05:6a00:1941:b0:50d:807d:530b with SMTP id
 s1-20020a056a00194100b0050d807d530bmr4354348pfk.17.1657295294218; 
 Fri, 08 Jul 2022 08:48:14 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:48:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 22/29] ppc64: Use uint64_t to represent double
Date: Fri,  8 Jul 2022 21:16:53 +0530
Message-Id: <20220708154700.18682-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

We want to do exact bitwise comparisons of the data,
not be held hostage to IEEE comparisons and NaNs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu_reginfo_ppc64.h |  3 ++-
 risu_reginfo_ppc64.c | 29 +++++++++--------------------
 2 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/risu_reginfo_ppc64.h b/risu_reginfo_ppc64.h
index 7f2c962..4b1d8bd 100644
--- a/risu_reginfo_ppc64.h
+++ b/risu_reginfo_ppc64.h
@@ -20,7 +20,8 @@ struct reginfo {
     uint64_t nip;
     uint64_t prev_addr;
     gregset_t gregs;
-    fpregset_t fpregs;
+    uint64_t fpregs[32];
+    uint64_t fpscr;
     vrregset_t vrregs;
 };
 
diff --git a/risu_reginfo_ppc64.c b/risu_reginfo_ppc64.c
index c80e387..9899b36 100644
--- a/risu_reginfo_ppc64.c
+++ b/risu_reginfo_ppc64.c
@@ -45,6 +45,7 @@ int reginfo_size(struct reginfo *ri)
 void reginfo_init(struct reginfo *ri, ucontext_t *uc)
 {
     int i;
+
     memset(ri, 0, sizeof(*ri));
 
     ri->faulting_insn = *((uint32_t *) uc->uc_mcontext.regs->nip);
@@ -54,16 +55,11 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
         ri->gregs[i] = uc->uc_mcontext.gp_regs[i];
     }
 
-    for (i = 0; i < NFPREG; i++) {
-        ri->fpregs[i] = uc->uc_mcontext.fp_regs[i];
-    }
+    memcpy(ri->fpregs, uc->uc_mcontext.fp_regs, 32 * sizeof(double));
+    ri->fpscr = uc->uc_mcontext.fp_regs[32];
 
-    for (i = 0; i < 32; i++) {
-        ri->vrregs.vrregs[i][0] = uc->uc_mcontext.v_regs->vrregs[i][0];
-        ri->vrregs.vrregs[i][1] = uc->uc_mcontext.v_regs->vrregs[i][1];
-        ri->vrregs.vrregs[i][2] = uc->uc_mcontext.v_regs->vrregs[i][2];
-        ri->vrregs.vrregs[i][3] = uc->uc_mcontext.v_regs->vrregs[i][3];
-    }
+    memcpy(ri->vrregs.vrregs, uc->uc_mcontext.v_regs->vrregs,
+           sizeof(ri->vrregs.vrregs[0]) * 32);
     ri->vrregs.vscr = uc->uc_mcontext.v_regs->vscr;
     ri->vrregs.vrsave = uc->uc_mcontext.v_regs->vrsave;
 }
@@ -91,10 +87,6 @@ int reginfo_is_eq(struct reginfo *m, struct reginfo *a)
     }
 
     for (i = 0; i < 32; i++) {
-        if (isnan(m->fpregs[i]) && isnan(a->fpregs[i])) {
-            continue;
-        }
-
         if (m->fpregs[i] != a->fpregs[i]) {
             return 0;
         }
@@ -141,10 +133,10 @@ int reginfo_dump(struct reginfo *ri, FILE * f)
     fprintf(f, "\tdscr   : %16lx\n\n", ri->gregs[44]);
 
     for (i = 0; i < 16; i++) {
-        fprintf(f, "\tf%2d: %.4f\tf%2d: %.4f\n", i, ri->fpregs[i],
+        fprintf(f, "\tf%2d: %016lx\tf%2d: %016lx\n", i, ri->fpregs[i],
                 i + 16, ri->fpregs[i + 16]);
     }
-    fprintf(f, "\tfpscr: %f\n\n", ri->fpregs[32]);
+    fprintf(f, "\tfpscr: %016lx\n\n", ri->fpscr);
 
     for (i = 0; i < 32; i++) {
         fprintf(f, "vr%02d: %8x, %8x, %8x, %8x\n", i,
@@ -181,13 +173,10 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
     }
 
     for (i = 0; i < 32; i++) {
-        if (isnan(m->fpregs[i]) && isnan(a->fpregs[i])) {
-            continue;
-        }
-
         if (m->fpregs[i] != a->fpregs[i]) {
             fprintf(f, "Mismatch: Register f%d\n", i);
-            fprintf(f, "m: [%f] != a: [%f]\n", m->fpregs[i], a->fpregs[i]);
+            fprintf(f, "m: [%016lx] != a: [%016lx]\n",
+                    m->fpregs[i], a->fpregs[i]);
         }
     }
 
-- 
2.34.1


