Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF14751C9C4
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:58:31 +0200 (CEST)
Received: from localhost ([::1]:50218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhcN-0001O0-2r
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZT-0003ux-1U; Thu, 05 May 2022 14:51:27 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:37834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZR-0004rP-Ax; Thu, 05 May 2022 14:51:26 -0400
Received: by mail-oi1-x22d.google.com with SMTP id r1so5264945oie.4;
 Thu, 05 May 2022 11:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IhEq0lsFif+yk5UYMu9bvTazdbGyBbCEFAD4wBgfwZQ=;
 b=Eflgb+jAUeZmP3LeFx8Y8RunbWas4rATh1f03gx1jjFFtSO9s9ziaQyeq8NVV8XZkN
 0g3305m01JyXKBR/KLj9NUhf7T+804P8heg+BUBmHjCEP0uXxfqUA1d2Cgvem1gXUnV8
 UtcTCYjubuR4Yh31ok6Pyr5V1aiNrANOGfVr2WDni2IcKEohfLyVnk/91zrwnhPuG5Pf
 f54lEe7fAYhDs2b9XXX6xrSSAbjAQDs8mRhckc3lwcZ0m//w6b/Nk3kfDAFKscl+gkye
 j7X5Dn/+sfi8vHKvhAIDM6DovFiDma5Oi3nJjrHzzdAMyNgaHr2p2l9GtVNglRnvJewc
 BYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhEq0lsFif+yk5UYMu9bvTazdbGyBbCEFAD4wBgfwZQ=;
 b=PycVurj2GBM/+zVcl3ZB+i86YCGwEYDs55L9ryyZhaKmrPZQVR7RRkyPuz8fD4atPs
 LfFxjXTyuvPlXob/knRQtMm7Ufp7NcOZRX6SNzLa6IU9fDxJHK/CaYw5LwsC0SLdcRfG
 RQTp5HL/Yu8qsvcpo1a/V0CJS08XDuukDlbPmJN0R7BiP3xjcWBNhRKCJsZQtwNubqqx
 IhBrPthLX/vT7EoJHNje76JUJfdhcglUX/jdGd4TZTvcup9XuLdZhFwD5hpm7HVg35LW
 i9s21FR2nDY10JgbdLjCkbc5OfIIRD98HhPti5eb3+/rTyRCvs2vduzxOshu6RTN8chI
 ps1A==
X-Gm-Message-State: AOAM532Sih4tAS+0yE0rtQUT5/Rc3dANURxCKk4mYKxoedXk51UQVyzv
 lXCfpVjSap8CCFpQ0lhzl6CgrecvuzU=
X-Google-Smtp-Source: ABdhPJwf8W7JajKhxRtzq6nL6AEdt6tp7Ct89SjtI1jNcfEN6A9Y8mX2bIKaO5CGycgwm+g2RI2FnA==
X-Received: by 2002:a05:6808:1825:b0:326:3e14:f156 with SMTP id
 bh37-20020a056808182500b003263e14f156mr3300946oib.144.1651776683913; 
 Thu, 05 May 2022 11:51:23 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:51:23 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 25/30] target/ppc: Remove msr_fe0 and msr_fe1 macros
Date: Thu,  5 May 2022 15:49:33 -0300
Message-Id: <20220505184938.351866-26-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

msr_fe0 and msr_fe1 macros hide the usage of env->msr, which is a bad
behavior. Substitute it with FIELD_EX64 calls that explicitly use
env->msr as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-18-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         | 11 +++++++++--
 target/ppc/excp_helper.c | 18 ++++++------------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 5e804f0373..74a3c01f99 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -363,12 +363,21 @@ FIELD(MSR, EE, MSR_EE, 1)
 FIELD(MSR, PR, MSR_PR, 1)
 FIELD(MSR, FP, MSR_FP, 1)
 FIELD(MSR, ME, MSR_ME, 1)
+FIELD(MSR, FE0, MSR_FE0, 1)
+FIELD(MSR, FE1, MSR_FE1, 1)
 FIELD(MSR, EP, MSR_EP, 1)
 FIELD(MSR, IR, MSR_IR, 1)
 FIELD(MSR, DR, MSR_DR, 1)
 FIELD(MSR, DS, MSR_DS, 1)
 FIELD(MSR, LE, MSR_LE, 1)
 
+/*
+ * FE0 and FE1 bits are not side-by-side
+ * so we can't combine them using FIELD()
+ */
+#define FIELD_EX64_FE(msr) \
+    ((FIELD_EX64(msr, MSR, FE0) << 1) | FIELD_EX64(msr, MSR, FE1))
+
 /* PMU bits */
 #define MMCR0_FC     PPC_BIT(32)         /* Freeze Counters  */
 #define MMCR0_PMAO   PPC_BIT(56)         /* Perf Monitor Alert Ocurred */
@@ -484,9 +493,7 @@ FIELD(MSR, LE, MSR_LE, 1)
 #else
 #define msr_hv   (0)
 #endif
-#define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
 #define msr_de   ((env->msr >> MSR_DE)   & 1)
-#define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
 #define msr_ts   ((env->msr >> MSR_TS1)  & 3)
 
 #define DBCR0_ICMP (1 << 27)
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 30baad0489..aa201c63c6 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -478,8 +478,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
-                !FIELD_EX64(env->msr, MSR, FP)) {
+            if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -616,8 +615,7 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
-                !FIELD_EX64(env->msr, MSR, FP)) {
+            if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -790,8 +788,7 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
-                !FIELD_EX64(env->msr, MSR, FP)) {
+            if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -976,8 +973,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
-                !FIELD_EX64(env->msr, MSR, FP)) {
+            if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -1175,8 +1171,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
-                !FIELD_EX64(env->msr, MSR, FP)) {
+            if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -1439,8 +1434,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
-                !FIELD_EX64(env->msr, MSR, FP)) {
+            if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
-- 
2.32.0


