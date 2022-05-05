Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909E551C9AA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:53:32 +0200 (CEST)
Received: from localhost ([::1]:37918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhXX-00016x-Hp
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZ8-0003Ro-TC; Thu, 05 May 2022 14:51:06 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:42851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZ5-0004Uh-Nj; Thu, 05 May 2022 14:51:06 -0400
Received: by mail-oi1-x230.google.com with SMTP id w194so4040332oie.9;
 Thu, 05 May 2022 11:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l9mWrtPruW1hxZRc0VV0WVjuoWYnJjip3JU6QBbiMZY=;
 b=f+ycOlRY1zu3YuWkCWNEV7RzZFHKIQ5hTWj9uEDfP6emh3js7vKsvHmEPbDCAjSyas
 g8FykwJKFU993Ymub26a5L9pEHhIRwNzk8VkSpfDeH5oR9p6v3lSx1cY++hrU9gnQZ20
 9KHsWaMg0ZIE8WXunEkYTL5oex6w6KwkF1q0Oidn8Mh90SnOH5xpDMNJbikeZ3Yqizl8
 /8gIGc+C6BYFvKCjBE4o5JuIvPUP9PKql7FsZNDy0qE1H69S68RJCX9+PJJ2fn94XzFP
 //xSCW3w7x29sMMcuM7lWTE2XefQJOAg+4c/I8oUsUckJMc1IzmnHeAcw6pKyygcieQ9
 /uYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l9mWrtPruW1hxZRc0VV0WVjuoWYnJjip3JU6QBbiMZY=;
 b=4G4UGtCc1+U3fxxfiAUnkXnH64rkcVEaSetLCfqTkoYFEybH74irFteCZP5f4YFUZN
 fjKjVqCPSuf4qdMg3DlyLU2OtWbwskxzkBSm+7MEQtQ3QdrcDo16UVQCMW76eRcVaOkN
 ECDjYwaFATSFSx7EbaQ8pCCxurMIlhXsxnJU/GOrcQwox8Ch2HqvTlb8VK4UFK90T9T3
 RhuCSdtwICg06ZEPz0uNlTtNY9W+SzjpeN+wL1ExKjJ0JXUw7TdPP+SbQc3s2cXdgZO7
 LLDQ7mPv/51CN0ND3EgGEDqEb8Q40FOP9UhfMZHb3oqXHeCYKoDWsOUdh3wbbozDFrpa
 XNsA==
X-Gm-Message-State: AOAM530l1vYoH0dQfKCj6RZk8qbQsv9ln+xqJHdXfSzJvqw68lg1fU1g
 Sri1YHEB/XMN+xVniXT0xavndhw3OiM=
X-Google-Smtp-Source: ABdhPJy9qIYZRVi5gbdCB1t8Lu+GeldDxXvP0dJFQeeY1kigKYNGsfJwCf6eIfh8KQjGvfPJ0JAmUw==
X-Received: by 2002:a05:6808:98f:b0:325:d44d:62d6 with SMTP id
 a15-20020a056808098f00b00325d44d62d6mr3111314oic.145.1651776661869; 
 Thu, 05 May 2022 11:51:01 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:51:01 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 18/30] target/ppc: Remove msr_me macro
Date: Thu,  5 May 2022 15:49:26 -0300
Message-Id: <20220505184938.351866-19-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
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

msr_me macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-11-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         |  2 +-
 target/ppc/excp_helper.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 5a83c4b028..deb861f5f3 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -359,6 +359,7 @@ FIELD(MSR, CE, MSR_CE, 1)
 FIELD(MSR, ILE, MSR_ILE, 1)
 FIELD(MSR, EE, MSR_EE, 1)
 FIELD(MSR, PR, MSR_PR, 1)
+FIELD(MSR, ME, MSR_ME, 1)
 FIELD(MSR, DS, MSR_DS, 1)
 FIELD(MSR, LE, MSR_LE, 1)
 
@@ -480,7 +481,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define msr_cm   ((env->msr >> MSR_CM)   & 1)
 #define msr_gs   ((env->msr >> MSR_GS)   & 1)
 #define msr_fp   ((env->msr >> MSR_FP)   & 1)
-#define msr_me   ((env->msr >> MSR_ME)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
 #define msr_de   ((env->msr >> MSR_DE)   & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index ee63641dd0..e254ae806c 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -444,7 +444,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
         srr1 = SPR_40x_SRR3;
         break;
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
-        if (msr_me == 0) {
+        if (!FIELD_EX64(env->msr, MSR, ME)) {
             /*
              * Machine check exception is not enabled.  Enter
              * checkstop state.
@@ -575,7 +575,7 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_CRITICAL:    /* Critical input                         */
         break;
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
-        if (msr_me == 0) {
+        if (!FIELD_EX64(env->msr, MSR, ME)) {
             /*
              * Machine check exception is not enabled.  Enter
              * checkstop state.
@@ -748,7 +748,7 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
 
     switch (excp) {
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
-        if (msr_me == 0) {
+        if (!FIELD_EX64(env->msr, MSR, ME)) {
             /*
              * Machine check exception is not enabled.  Enter
              * checkstop state.
@@ -933,7 +933,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
 
     switch (excp) {
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
-        if (msr_me == 0) {
+        if (!FIELD_EX64(env->msr, MSR, ME)) {
             /*
              * Machine check exception is not enabled.  Enter
              * checkstop state.
@@ -1128,7 +1128,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
         srr1 = SPR_BOOKE_CSRR1;
         break;
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
-        if (msr_me == 0) {
+        if (!FIELD_EX64(env->msr, MSR, ME)) {
             /*
              * Machine check exception is not enabled.  Enter
              * checkstop state.
@@ -1366,7 +1366,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
 
     switch (excp) {
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
-        if (msr_me == 0) {
+        if (!FIELD_EX64(env->msr, MSR, ME)) {
             /*
              * Machine check exception is not enabled.  Enter
              * checkstop state.
-- 
2.32.0


