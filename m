Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E769F3F62D7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:41:14 +0200 (CEST)
Received: from localhost ([::1]:60392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZU9-0007vN-Tt
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKZ-0008KG-7r; Tue, 24 Aug 2021 12:31:20 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:37758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKV-00007g-PH; Tue, 24 Aug 2021 12:31:18 -0400
Received: by mail-qk1-x729.google.com with SMTP id 14so23826111qkc.4;
 Tue, 24 Aug 2021 09:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ORiTLnbxZLQQTsbKnYOYP8vCJ1EvBG5qtuoOspPdhp4=;
 b=o95D02QmNDbHWtwBqC62wMxX33/2EMjkdVTmMjQaetHQjkNKCajGjngxLF54sy2zFz
 1EBsgxx2Dl1GIfON6qbefm8i5k8Em+8AdoOMYPVFuo0TPUVC1MwVkDp65ov5do0u9pgU
 kx+WeUBxF6AqiiqZDriBml7CsLeMBFXpROLQsyZQ8e7Q6Tf5XV9H1JojOSi558bkrkH1
 MVQw4jtOTAZ1NalZbsNwF8khgjb2rODY9t8Nx7fqDfyAcXQiiqGKb7DVL/jQpQRzVyKy
 uRGu8KqNOJrxXkONtocz7dOVg8UD1qo0O6/avJqbORtBc+tYZVLZjxvKTa2qPGguGO18
 kAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ORiTLnbxZLQQTsbKnYOYP8vCJ1EvBG5qtuoOspPdhp4=;
 b=bDLntaIyYqOsZc8xz9YKP/nXhXQZSBnNSNHBX6I7Khz2IvcKMbEZiOKD3t5co3m0ei
 kX0UWD+dTTPvsB5/8XYzwV8kxlovn0/t9sRNVNN8s5XeOTSebAPkVxhJ2m/yg8EzS08w
 OafkDGHWLyjyTkdx9RhJpIgWu9aWvphg/q23JhA0Yc7H5dLUSGNqax+yO8vtHT1ztgoo
 K5YRC1Mg1jAlRJIde4ZFUBHpHLE4NGddvIPD2/zbTZ4aMgBCtvj5Owwx3lMrWq/v/eZL
 MJ8hLRvS0gOioYFfh0vluLEW23x5DnVjZFbhRN3bx5un28glZETPAu6IvY2S/CVh4VkA
 2o8Q==
X-Gm-Message-State: AOAM5338o7OC7uk1KIghrTIdZj8hj5my4HIesu7h1uWVF4426V282++T
 MCEuecTk1abCKFeB+epc9qe4+b81Pow=
X-Google-Smtp-Source: ABdhPJy4dFujBGjER0KX7CJzrXYIRYtvKX4MnxK7C6VaQvGi8IAFLKS6IaZBXnbTAhl/ySrZxmFLlA==
X-Received: by 2002:a37:9cc8:: with SMTP id
 f191mr26787773qke.113.1629822674484; 
 Tue, 24 Aug 2021 09:31:14 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:31:14 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/16] target/ppc/excp_helper.c: EBB handling adjustments
Date: Tue, 24 Aug 2021 13:30:27 -0300
Message-Id: <20210824163032.394099-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824163032.394099-1-danielhb413@gmail.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: gustavo.romero@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
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
index e97898c5f4..b1e803034e 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -822,14 +822,47 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
                   "is not implemented yet !\n");
         break;
     case POWERPC_EXCP_EBB:       /* Event-based branch exception             */
-        if ((env->spr[SPR_BESCR] & BESCR_GE) &&
-            (env->spr[SPR_BESCR] & BESCR_PME)) {
+        if (env->spr[SPR_BESCR] & BESCR_GE) {
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


