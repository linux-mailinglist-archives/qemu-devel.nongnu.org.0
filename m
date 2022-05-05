Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 996C951C9A6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:51:22 +0200 (CEST)
Received: from localhost ([::1]:32830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhVR-0005ut-M4
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZG-0003Wy-Kp; Thu, 05 May 2022 14:51:14 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:43903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZB-0004nM-Rf; Thu, 05 May 2022 14:51:14 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-ee1e7362caso995042fac.10; 
 Thu, 05 May 2022 11:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1D2DjExyeISuLI6HeMP/tlQJ+TmTLSoZ3TAYFtx218E=;
 b=FUV5z23KLoL2V4J2jmv6o9L1x8OKAivNc2jAuwFTZJm2PwiOKFoLEPkSI+qHSqYGm1
 fm/2OgPelji3Ospx/zv/JUqrF++IAwevE67ZfRGIWhJBIsaq0MQ5nTOybrKxAa5yv5ze
 /qcRf50JpuqTxmSu8qVbcg9iG148gpl+DYatRa6UXeGIAdQw3L96A98xI8iSefhxeF/Q
 o+OTXCkDm1nR6LgEKh3FxBmaRyDpaKedJA1XcQ1rcR4zLw2iBs+CPwuuCMrnNdu/VCY5
 ve5umLemV8KmNdaDn4lUwj5P4o80LAkfDS/jz7Z0izWVqkSL4twnlzjdd7wNZgGBhNta
 yrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1D2DjExyeISuLI6HeMP/tlQJ+TmTLSoZ3TAYFtx218E=;
 b=D/MuF2N/7ve+JW7ucBkZEORJoVmYuq9SxXVJK0TNtJ371lhK41OFc5NMnGb0pK7QS3
 4En8uzemRikCihUL/lno7USA0qgGvg+qDEOiWZtZtzHvUyHpcHQl8XBbF5PawL3l5nQ6
 j+cLti0nUqK3/xue4BU6nmik7o2u9TN95WCp0ilRbK4XY/S7xXkZ1XAzGyx3AbOzYuZq
 SlnkLZpI/lN+IcvQBNkqNiZw7KIKyxvEtnaEMWSUv6GV2MlxSkt1VlMilZQScvgQm0A7
 TLlrf4pjfNg3zsh4g6jNGe6dmxrWra1LIxbdC+4GHSuHU91jWSvSFGqTgnh5xT7Gl8O4
 XzzA==
X-Gm-Message-State: AOAM531DIhbUyD78bMAptDDhrC+cQzdCe3fiiIY90aQkAG9uh5Uoxa0n
 OQdmTeNl/FZru8pZVQJW12CYfbtFSwk=
X-Google-Smtp-Source: ABdhPJyHLCCoXjUhKMaDywf9viqM7Sx8t9lMOjM0JyFQRzczGCIEH5ZAh7IqI1XbwRTgVN1ByepUKA==
X-Received: by 2002:a05:6870:c20c:b0:ed:dbd5:59d2 with SMTP id
 z12-20020a056870c20c00b000eddbd559d2mr2813610oae.239.1651776668101; 
 Thu, 05 May 2022 11:51:08 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:51:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 20/30] target/ppc: Remove msr_fp macro
Date: Thu,  5 May 2022 15:49:28 -0300
Message-Id: <20220505184938.351866-21-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
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

msr_fp macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-13-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         |  2 +-
 target/ppc/excp_helper.c | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index bd5dffc9b1..17b7f5f6d9 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -360,6 +360,7 @@ FIELD(MSR, CE, MSR_CE, 1)
 FIELD(MSR, ILE, MSR_ILE, 1)
 FIELD(MSR, EE, MSR_EE, 1)
 FIELD(MSR, PR, MSR_PR, 1)
+FIELD(MSR, FP, MSR_FP, 1)
 FIELD(MSR, ME, MSR_ME, 1)
 FIELD(MSR, DS, MSR_DS, 1)
 FIELD(MSR, LE, MSR_LE, 1)
@@ -480,7 +481,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define msr_hv   (0)
 #endif
 #define msr_cm   ((env->msr >> MSR_CM)   & 1)
-#define msr_fp   ((env->msr >> MSR_FP)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
 #define msr_de   ((env->msr >> MSR_DE)   & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index e254ae806c..30baad0489 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -478,7 +478,8 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
+            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
+                !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -615,7 +616,8 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
+            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
+                !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -788,7 +790,8 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
+            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
+                !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -973,7 +976,8 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
+            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
+                !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -1171,7 +1175,8 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
+            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
+                !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -1434,7 +1439,8 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
+            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
+                !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
-- 
2.32.0


