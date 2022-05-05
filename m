Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED08A51C9BF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:57:10 +0200 (CEST)
Received: from localhost ([::1]:47338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhb4-0007nN-2i
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZ0-0003Na-BF; Thu, 05 May 2022 14:50:58 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:41496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYy-0004PM-RT; Thu, 05 May 2022 14:50:58 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-edf9ddb312so4160044fac.8; 
 Thu, 05 May 2022 11:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z+R3INB0Bexk+VUNnDpDQqvZUPfqPS6rXAwPFi+ssvw=;
 b=mcp7FNSO9da/4CkcqxZWFTcKYgpAVPyGXhke1xB2u8pc7pBVX7VmkLz1qQNU0ohC5v
 YURGfI1EJmthFzDQuzQgYagm2HY1H72K0pHDnnbZqAMAUeTMuLprWR3mVD1MfkbkEoP6
 g5bJMKucUlu/J46g83Ji7HbAnGG6UB0V9NmfSaQ2ncwjB9r8/9Ih2AOynbZhMcrMdmDc
 ivbsjXHy2EqMxaWsCmkmN1tPpWdgwmjxC9BOmAUtKupppG7ztzRGBC3M7ytKaBARQeME
 9MGFgbL8/GZF7qKk4gVw/u1d3ZFubV3+mMK04V1xc2LFL++oIgDE5m0lLarLzsPKLazN
 /dkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z+R3INB0Bexk+VUNnDpDQqvZUPfqPS6rXAwPFi+ssvw=;
 b=7QbcKbwNP2nCh0PBO5b9Ja0olbHyQEYYGdeQ2Fu/YCZLdtwS7SCEZyI7oPdXAQav86
 jNYFuzb8+TEdDcmZkGtDG5I9eNA33IYCiq0j4cchNqW6fB6iJCVL1z8djbGsmb6O9+wT
 2CFKRCfA+L1rilaQWaUCVUGRvFxcOhlkLP9OGoEuzWCsFMxL1QkBUJqdkx7lGWx2zhOJ
 4SxVgFxNgLH7WsG6jyL4HIw7YrTJccC/UlHhOagiEaHNENXnNeQ7i8zmPTW9zttTciRz
 gMpoeZvu6dQ8QL56hqCm9lUkjtUi16EuaIATbbOaSVLsNxjVwnolmtZ8jY6eQkn0rzVr
 gdkQ==
X-Gm-Message-State: AOAM530kswNAeLPKmzUZiMQD4YXDu7bAV/9t2+MNo45fTBztt3jtWl/a
 hzjDUIbqp8RbRjtKr++WaQN9zdOPLIQ=
X-Google-Smtp-Source: ABdhPJy2VqQky4KRn3EG6hg9853AXSbY7BcJW2IPAPWuyXUYBJlW0gZzcksfU0Yf6eepIjzJygBu5g==
X-Received: by 2002:a05:6870:1788:b0:e6:225:9841 with SMTP id
 r8-20020a056870178800b000e602259841mr2919242oae.152.1651776655670; 
 Thu, 05 May 2022 11:50:55 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 16/30] target/ppc: Remove msr_ce macro
Date: Thu,  5 May 2022 15:49:24 -0300
Message-Id: <20220505184938.351866-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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

msr_ce macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-9-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         | 2 +-
 target/ppc/excp_helper.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 06667c2c60..b1883b23e2 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,6 +354,7 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+FIELD(MSR, CE, MSR_CE, 1)
 FIELD(MSR, ILE, MSR_ILE, 1)
 FIELD(MSR, EE, MSR_EE, 1)
 FIELD(MSR, PR, MSR_PR, 1)
@@ -478,7 +479,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define msr_cm   ((env->msr >> MSR_CM)   & 1)
 #define msr_gs   ((env->msr >> MSR_GS)   & 1)
 #define msr_pow  ((env->msr >> MSR_POW)  & 1)
-#define msr_ce   ((env->msr >> MSR_CE)   & 1)
 #define msr_fp   ((env->msr >> MSR_FP)   & 1)
 #define msr_me   ((env->msr >> MSR_ME)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 4c206ba209..ca80c1ed63 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1749,7 +1749,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
             return;
         }
     }
-    if (msr_ce != 0) {
+    if (FIELD_EX64(env->msr, MSR, CE)) {
         /* External critical interrupt */
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_CEXT)) {
             powerpc_excp(cpu, POWERPC_EXCP_CRITICAL);
-- 
2.32.0


