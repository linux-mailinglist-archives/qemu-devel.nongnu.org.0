Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDE051C9C0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:57:25 +0200 (CEST)
Received: from localhost ([::1]:47574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhbI-0007xn-Po
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZd-0003xa-D0; Thu, 05 May 2022 14:51:40 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:45992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZb-0004tg-PY; Thu, 05 May 2022 14:51:37 -0400
Received: by mail-oi1-x234.google.com with SMTP id n24so5241483oie.12;
 Thu, 05 May 2022 11:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HodvTr3B4YWOvMygizk75ypRfURZqF5htRLu+QyFfAw=;
 b=eeCJxwdFflV7c0TwG7s+AnnHS1Hwy/+9HdbWsqU4OXDbVv+Eelj/36N0H0LtyuI0sI
 z/YFjTSO+wSzTmhpube1DvXx+vui/Jg/VpajMQYr61KWtCTneo2vlqaHXR3YjGktq+I7
 cZ7paPkc3c0KCWuXkrVFirSITjn66O8eFiBPwPsowU5JO8NhfKlfbETCmP3stYHLeDqS
 7/wK/5YHHmFIlYymR8PfQDQD2NDbBmi/50lXqqtKi3k9eMPCjaZ8CkWonrqa6vfiSLrG
 akrKSCGCfhmUs4h7amMvjFiV8x0J7YJ7BAo2Gz72/INmhWkkTJsj6dW/Jtb7fYZtSH41
 Ijrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HodvTr3B4YWOvMygizk75ypRfURZqF5htRLu+QyFfAw=;
 b=OPpM6wEAOsje6IZF1Ddt41qPx995GxsmEn8be8KkRL4BjmpQmjNOuFaqboTVx5Xqrk
 EiFPyqZXDh6V5QaEyYtxkhpDd5vWgciEpjxr63vYUzTUyNUjWmWm296C3MqAbNW7uCq2
 OcONP4F109O1atDo8tszyOtCKqMXqqVCtJ6TJeiR1AJAJxHID26hvyGvRqUK8DAdDL8G
 ZROBNQNrXg4OZeODo4fTdK1AU7ees/Cy0GswSI+Gvsagvy5bxb98ptoOb/aHggarMKdv
 /lA5866PXGlHzjkpYxzdx6djsoXOZq5nQhckagl2jzmhmXiXGhrePuNkBsasWeo+eLRQ
 40AQ==
X-Gm-Message-State: AOAM533PuMLymuQWsd7+PMesp7HgJXJKjK0eupvApk/mC6NUH/W+jP4Q
 0IrgygjeYU35tOdyaW4dGIZ0TQ540q8=
X-Google-Smtp-Source: ABdhPJwRe1Y4JIzkMNJ0q1jAlq/OBtlSUOyKd0tN1//ANzmD0FMUcdvjK8MgWLEFDB68XQ23XpfRnQ==
X-Received: by 2002:a05:6808:120f:b0:325:bc53:2150 with SMTP id
 a15-20020a056808120f00b00325bc532150mr3266103oil.139.1651776693488; 
 Thu, 05 May 2022 11:51:33 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:51:33 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 28/30] target/ppc: Remove msr_de macro
Date: Thu,  5 May 2022 15:49:36 -0300
Message-Id: <20220505184938.351866-29-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
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

msr_de macro hides the usage of env->msr, which is a bad
behavior. Substitute it with FIELD_EX64 calls that explicitly use
env->msr as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-21-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         | 3 +--
 target/ppc/helper_regs.c | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 9f19b3c0a8..af249239d5 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -371,6 +371,7 @@ FIELD(MSR, PR, MSR_PR, 1)
 FIELD(MSR, FP, MSR_FP, 1)
 FIELD(MSR, ME, MSR_ME, 1)
 FIELD(MSR, FE0, MSR_FE0, 1)
+FIELD(MSR, DE, MSR_DE, 1)
 FIELD(MSR, FE1, MSR_FE1, 1)
 FIELD(MSR, EP, MSR_EP, 1)
 FIELD(MSR, IR, MSR_IR, 1)
@@ -495,8 +496,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define HFSCR_MSGP     PPC_BIT(53) /* Privileged Message Send Facilities */
 #define HFSCR_IC_MSGP  0xA
 
-#define msr_de   ((env->msr >> MSR_DE)   & 1)
-
 #define DBCR0_ICMP (1 << 27)
 #define DBCR0_BRT (1 << 26)
 #define DBSR_ICMP (1 << 27)
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 97cd263131..6159a15b7b 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -63,10 +63,10 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
 
     if (ppc_flags & POWERPC_FLAG_DE) {
         target_ulong dbcr0 = env->spr[SPR_BOOKE_DBCR0];
-        if ((dbcr0 & DBCR0_ICMP) && msr_de) {
+        if ((dbcr0 & DBCR0_ICMP) && FIELD_EX64(env->msr, MSR, DE)) {
             hflags |= 1 << HFLAGS_SE;
         }
-        if ((dbcr0 & DBCR0_BRT) && msr_de) {
+        if ((dbcr0 & DBCR0_BRT) && FIELD_EX64(env->msr, MSR, DE)) {
             hflags |= 1 << HFLAGS_BE;
         }
     } else {
-- 
2.32.0


