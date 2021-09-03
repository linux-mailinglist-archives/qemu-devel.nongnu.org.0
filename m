Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4F0400710
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:47:37 +0200 (CEST)
Received: from localhost ([::1]:34552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMG64-0006oL-NV
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqw-0002yx-Ai; Fri, 03 Sep 2021 16:31:58 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:39716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqu-0001jt-H7; Fri, 03 Sep 2021 16:31:58 -0400
Received: by mail-qv1-xf30.google.com with SMTP id dt3so367258qvb.6;
 Fri, 03 Sep 2021 13:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n5657r1c1ytpRQ2DAcGa9/0aAphGsPfcwntR/5Sbm+0=;
 b=bcPCmIxETFQ2iCMVCkl91wyLo1BxulM2JZEBB4nhwJdz90tBvQyUBzB0WiHF+s6Rbt
 1MT9xla8ApLdPS+r5RobTw+vBaiT6ummwon7EkJdoEW7qFrhHHsFfVxWcoTOmJ9Sw9cj
 UlmahFjvW6Z/U37u2yo5pQ0y0Zrgqy+JIwFMsZ9dlXLcdkMXYFtEVYPA3e19v/fZkmrs
 ZeZMRJuJNcmuPC3lOYioiA+Hve73MiGl9w2P9spFiMb0e892td7IaRkcKQfvE9SR/jmM
 4LKvIhUSIrvLhSM7xukpE82VjTbCXaIPkgj5I7TsFb0Xi/0l4CsorjwTWAbQkE6PFNru
 UVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n5657r1c1ytpRQ2DAcGa9/0aAphGsPfcwntR/5Sbm+0=;
 b=Gn6y8XVlhT1KevXDDdPpGGeZDLIkwk8nczgZnNUPANiMvnP7KDcMz6uhbVHs5n29Me
 TxlMsSC2X/+78kxPG4kdm+lWsOlCuuq4iAwo/LusRhk3JKsrgdO9I0GrJs0ljOjp0elU
 CwBUI+Ih9RntOTCLNKl/A73gfy9hODbC7Sgw9fABkAD/AVg8jDgjxWITu+nA0STQ9f12
 bSsrpRv1fbZJXfDzjygATasNnQpvZI2wZHkUnAAHKF2ctPnDRYuawpZPF77v3uCOBzYE
 Xyn5Ie9jbGuwPdZpW46QkH2oD3rNzOVu5zPXGxITpWxGxgBvMtt1YMzJLvae7eq/ZDD4
 uxQw==
X-Gm-Message-State: AOAM532en1PLFaXjA4UnXlAX7408ze24VRdiKLX1muGJKo+E7bHAJIJ8
 p7+aaFXmQJ33iWHhTgnjKg5xUTiqbLY=
X-Google-Smtp-Source: ABdhPJwNT+bTJZLMqzO+kw9cCZBivpY2D9D74DrHgawD4Z/EvaWEMeNFBQJ4xkwLF79/oVOoZPhTwQ==
X-Received: by 2002:a0c:f08f:: with SMTP id g15mr909891qvk.67.1630701113792;
 Fri, 03 Sep 2021 13:31:53 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id z6sm285613qtq.78.2021.09.03.13.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 13:31:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/15] target/ppc/excp_helper.c: EBB handling adjustments
Date: Fri,  3 Sep 2021 17:31:11 -0300
Message-Id: <20210903203116.80628-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903203116.80628-1-danielhb413@gmail.com>
References: <20210903203116.80628-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf30.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
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
index d20447f171..6d16c986af 100644
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


