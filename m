Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D0F3E4677
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:23:45 +0200 (CEST)
Received: from localhost ([::1]:47876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5FU-0007XM-1m
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD546-00037z-6D; Mon, 09 Aug 2021 09:11:38 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:36461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD544-0001WG-KX; Mon, 09 Aug 2021 09:11:37 -0400
Received: by mail-qk1-x72a.google.com with SMTP id e14so18238745qkg.3;
 Mon, 09 Aug 2021 06:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fm2eH3QhN9BmC5GgFxLqoJOE2nw58BgY9Tkg4LF4Mk8=;
 b=g8mqje3/GTI+oDIKg/RHfIfCs4cKT4ueeZ/Pxt1m2jo2wuU5Ypm3S5ApFc7RUm6xRA
 ljQcn/8EjkKeNUtXv8tYSxMHHCuktN9Ucb4cMYmnwr361LPBWNuABdQYSkEQvKA+DojM
 C141b/7NYFHHHtaxUKKV1WxUq+h50bcoevUrWqxgIRgBnspmqgdcdDQuIpiV6F06Rff4
 CJ32Y8U+BgvVFPhHdayYG61RXkTlJOPuUw9lIjSyw0KObv+iFPRmu3hg42HmCq1viRIm
 Ko1TFLgSUuSMTTDYJ/5EycKL22l9q6pIyFld96sS0Rarf3VJQtMEKczLZBWgOwrWiA/S
 PaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fm2eH3QhN9BmC5GgFxLqoJOE2nw58BgY9Tkg4LF4Mk8=;
 b=G1j7Tf+k21QaqO0qZSheylpf4U9uZgk4Vjpokps4Je+6nnl80K7GtJ+cY1mYOC/lU1
 p1slsANOVsDGNA/PDB6+WmDkAS3O8VFdrXmQgvgiYXX0gWF9K6ISKtISH9QeNqJ97Cpe
 d5O2Vh/hBUdYQkL4wrNhOvBRfCjLzdoG31EcUcpD1AkGpcdBHQNBYbU86ZZjFUJm+BuY
 9IpvwYrv1t97iqextFGRiGWO4+PjH/SLaU3+sVo+SfpBBPDtPSIU4faIwyKCZFoQqel+
 OAhq+vY2ljXl4VAVQJQRT50sjAZSNtEstPIDkS0GRtvwrEOC5A7V8FDZykhh0xrgSovX
 4Vhw==
X-Gm-Message-State: AOAM530IZnjr8QWMXW3RO0wC9eUJT60+e2seF/9c77irxks2F/zM+aYv
 FLk5SthPrL+FuWDRrR9rmyFJbT25VjujQA==
X-Google-Smtp-Source: ABdhPJxsSDLXb9+lw/MNDBHR/q9Pl7owJBVj5W7zSoFW+kC4oDx7mCpuEL9aWkRniRV2+2XrHpNlwg==
X-Received: by 2002:a05:620a:e81:: with SMTP id
 w1mr22975476qkm.473.1628514694320; 
 Mon, 09 Aug 2021 06:11:34 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:34 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/19] target/ppc/excp_helper.c: POWERPC_EXCP_EBB adjustments
Date: Mon,  9 Aug 2021 10:10:49 -0300
Message-Id: <20210809131057.1694145-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72a.google.com
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
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
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
index b866209b6e..504b3130f2 100644
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


