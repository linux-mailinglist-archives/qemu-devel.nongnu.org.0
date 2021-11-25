Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1839745DD3C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:21:50 +0100 (CET)
Received: from localhost ([::1]:43572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGZI-0007NU-Po
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:21:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqGMm-0003Yz-Nv; Thu, 25 Nov 2021 10:08:52 -0500
Received: from [2607:f8b0:4864:20::92b] (port=44608
 helo=mail-ua1-x92b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqGMk-00024U-OU; Thu, 25 Nov 2021 10:08:52 -0500
Received: by mail-ua1-x92b.google.com with SMTP id p2so12868480uad.11;
 Thu, 25 Nov 2021 07:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wEhzjJ2tChIizKtHFKzSMHPFIqsyie4TVEusXUHYHu0=;
 b=aHRQSvR3uZOpdwAXuFXaXAS4XYu82M4H1IhsCwTg+cDcax+oNlYbMr0bEsWcC9IX9O
 LzMhUWbn0R/07nq3H+u96zBM6YNBnIk4YrqNzb0RHNftjroijnvrAGkvbStekkA9sNn1
 aiMDFSaMFO/uLDDAwJmUfHIOjLCPpBMaEDzzWul0B7G0HGLWb2uoPVZqPAFq5lmYGwFU
 WmoTIrPCFq3M+LtD/kDJKJFg2qRwFrF69HxDcPa1GF82Z1cBuTIeuzc6U5AUAQiH7K9Z
 kXzoGT8kHcwUoYUso8gqUFzvW2+VXE3D5SQogaJyvzwcX1nOLEv2XUGW20sffCmO1VH3
 XmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wEhzjJ2tChIizKtHFKzSMHPFIqsyie4TVEusXUHYHu0=;
 b=bGhEyA5QV9Y8zlDktuX6KHTag7Tgn8MQI0EmPDOo2CKH58Yhzp+82Obqj+xnjYnye9
 vS3i3pDedJZ8WdEo4cDNGHpatF5q6qKp0DPiAhvs2At0nhUzS6SXsedWpZ0YaWasmvpA
 9KZZLydsbMAnuV/GnE54EUS9+hfqohasd3TtYZCOvqbW+BsIl0X8PodCZzONBOceZWXn
 xvQLTwLmj7c9gFRPTPtFjm/MQu+dAr85JuM5etZwO9Y/W9tKytsHx+EsyOVKwd4RlC7/
 3F4+IjEHPSelauTRq58G55SiCNaE0excC8ItSSSxCMlvLUoDqBcsvzB564HqQ/Rbs1nL
 NLaQ==
X-Gm-Message-State: AOAM533rE3cz0z4ejWSkl9g/5Ub0fOaPKaI320Qci0EEHLf6cNaSU4L1
 lnWPnsLc1hg7c7gxmbIMSFZRNxhOQ+g=
X-Google-Smtp-Source: ABdhPJye7Hi1ij/ZPu/bNL6XIOv0cneWMnzDwRoIEoBS3SAxDRtzZoUhjVbNWhSQyZI9FHOix2hudg==
X-Received: by 2002:a67:df90:: with SMTP id x16mr10168845vsk.52.1637852929445; 
 Thu, 25 Nov 2021 07:08:49 -0800 (PST)
Received: from rekt.ibmuc.com ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id i27sm2081057uab.8.2021.11.25.07.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:08:49 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 10/10] target/ppc/excp_helper.c: EBB handling adjustments
Date: Thu, 25 Nov 2021 12:08:17 -0300
Message-Id: <20211125150817.573204-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211125150817.573204-1-danielhb413@gmail.com>
References: <20211125150817.573204-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92b.google.com
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


