Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AD4457669
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 19:29:42 +0100 (CET)
Received: from localhost ([::1]:54800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo8dp-0005a0-Tf
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 13:29:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mo8XV-0004OM-3C; Fri, 19 Nov 2021 13:23:09 -0500
Received: from [2607:f8b0:4864:20::a35] (port=39677
 helo=mail-vk1-xa35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mo8XR-0001qH-Pw; Fri, 19 Nov 2021 13:23:08 -0500
Received: by mail-vk1-xa35.google.com with SMTP id 84so6399303vkc.6;
 Fri, 19 Nov 2021 10:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wEhzjJ2tChIizKtHFKzSMHPFIqsyie4TVEusXUHYHu0=;
 b=JrkG/it9EeM7frjETcmcPhEfespsTaCtd/uL09MJ/74gxkpz2QqcNNYwPEquH0CjyG
 XLoaCiVckCDPVlo8A3mTZWAHHl3qT+Hj8VjzRJoWG5BSCuU17Ap3sNyqOe7uEFxJ0vkA
 yZoWW8OewjYiryvCk5i2K2t7czBY+slHQFFgWT+aGRP0eogO1zHJHfvy5e8CWjwm+8t3
 xzbiuj688mRweqqbJbg0VVqwIEHnDF7rF2hxKipCZ702UZnfVxs51ECqsi5GFb2HVqt2
 BWkJ3ERjze4GJu/RrOwzPmPk3vlbx73b2NvIE3x4Obmlw4IjjGWESKWl2ahLTifY7d6W
 bx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wEhzjJ2tChIizKtHFKzSMHPFIqsyie4TVEusXUHYHu0=;
 b=zWGHyzzz6uIseS4hgmaoC8C9kbwj0L/Pg+ZrLTcbAwJXm0qa+D3s3it4PPiQh3NEUv
 hJp7HEAWuTxlmkQAsSXBmy+UUTRKcKHIWWvg3DU3gEQak4zCbbK6M7+GRdKUYlMt3RSo
 AkYkiEoUP/jIW0a7JAThA7IHEeUM1g1oyIC389gCFGlAO36MEI9rMr7zIslKBh1IsfBv
 hGvSol8853s9z3s3UBtWnWMFpV+B1uhKeRnv5yzruEc86MIybH3luhlVFr36GGh8cA12
 mAgRzn/piBV5zehs0JD6q9eXmHg81oiPj0E2Teu/0r74lTEZ/2qCD+ooli2Pte63HZIM
 dW3g==
X-Gm-Message-State: AOAM532vCghxexeEa7fV6gey5r8voOfXhb44ZNhlkgbX8bpjEGpFkQMK
 V0H8c5i6PfuGHeOhmixJL9OGJ8sh1z6hrA==
X-Google-Smtp-Source: ABdhPJzclwEFG9ZqibFgs558cyZTbCUsuOyYg3NTI5kpEaNspt4MHciqXXbG4tFFI6QXnlVaDuJb8g==
X-Received: by 2002:a05:6122:214e:: with SMTP id
 m14mr97974972vkd.19.1637346181109; 
 Fri, 19 Nov 2021 10:23:01 -0800 (PST)
Received: from rekt.ibmuc.com ([152.250.208.89])
 by smtp.gmail.com with ESMTPSA id x142sm339871vsx.15.2021.11.19.10.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 10:23:00 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v7 10/10] target/ppc/excp_helper.c: EBB handling
 adjustments
Date: Fri, 19 Nov 2021 15:22:16 -0300
Message-Id: <20211119182216.628676-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119182216.628676-1-danielhb413@gmail.com>
References: <20211119182216.628676-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa35.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current logic is only considering event-based exceptions triggered
by the performance monitor. This is true now, but we might want to add
support for external event-based exceptions in the future.

Let's make it a bit easier to do so by adding the bit logic that would
happen in case we were dealing with an external event-based exception.

While we're at it, add a few comments explaining why we're setting and
clearing BESCR bits.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 45 ++++++++++++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a26d266fe6..42e2fee9c8 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -801,14 +801,47 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         break;
     case POWERPC_EXCP_EBB:       /* Event-based branch exception             */
         if ((env->spr[SPR_FSCR] & (1ull << FSCR_EBB)) &&
-            (env->spr[SPR_BESCR] & BESCR_GE) &&
-            (env->spr[SPR_BESCR] & BESCR_PME)) {
+            (env->spr[SPR_BESCR] & BESCR_GE)) {
             target_ulong nip;
 
-            env->spr[SPR_BESCR] &= ~BESCR_GE;   /* Clear GE */
-            env->spr[SPR_BESCR] |= BESCR_PMEO;  /* Set PMEO */
-            env->spr[SPR_EBBRR] = env->nip;     /* Save NIP for rfebb insn */
-            nip = env->spr[SPR_EBBHR];          /* EBB handler */
+            /*
+             * If we have Performance Monitor Event-Based exception
+             * enabled (BESCR_PME) and a Performance Monitor alert
+             * occurred (MMCR0_PMAO), clear BESCR_PME and set BESCR_PMEO
+             * (Performance Monitor Event-Based Exception Occurred).
+             *
+             * Software is responsible for clearing both BESCR_PMEO and
+             * MMCR0_PMAO after the event has been handled.
+             */
+            if ((env->spr[SPR_BESCR] & BESCR_PME) &&
+                (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAO)) {
+                env->spr[SPR_BESCR] &= ~BESCR_PME;
+                env->spr[SPR_BESCR] |= BESCR_PMEO;
+            }
+
+            /*
+             * In the case of External Event-Based exceptions, do a
+             * similar logic with BESCR_EE and BESCR_EEO. BESCR_EEO must
+             * also be cleared by software.
+             *
+             * PowerISA 3.1 considers that we'll not have BESCR_PMEO and
+             * BESCR_EEO set at the same time. We can check for BESCR_PMEO
+             * being not set in step above to see if this exception was
+             * trigged by an external event.
+             */
+            if (env->spr[SPR_BESCR] & BESCR_EE &&
+                !(env->spr[SPR_BESCR] & BESCR_PMEO)) {
+                env->spr[SPR_BESCR] &= ~BESCR_EE;
+                env->spr[SPR_BESCR] |= BESCR_EEO;
+            }
+
+            /*
+             * Clear BESCR_GE, save NIP for 'rfebb' and point the
+             * execution to the event handler (SPR_EBBHR) address.
+             */
+            env->spr[SPR_BESCR] &= ~BESCR_GE;
+            env->spr[SPR_EBBRR] = env->nip;
+            nip = env->spr[SPR_EBBHR];
             powerpc_set_excp_state(cpu, nip, env->msr);
         }
         /*
-- 
2.31.1


