Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E67442495
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 01:22:20 +0100 (CET)
Received: from localhost ([::1]:37828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhZD-0006ZK-01
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 20:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhBB-0004Nx-Tp; Mon, 01 Nov 2021 19:57:29 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:33351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhBA-0006LX-0m; Mon, 01 Nov 2021 19:57:29 -0400
Received: by mail-qv1-xf35.google.com with SMTP id bu11so4402446qvb.0;
 Mon, 01 Nov 2021 16:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BMK2Tx+kwGAmYMCHy6MUgl+RIwVRP6pzB3y+fnPF6hY=;
 b=m7pSbUJCZT7bUe53Fq+0qC8xQ+l3sOZcgEh5YBYQMz7gIp+iFKZI81ur5xFC7+weKp
 qq8LY0zGjzdHLEXBu6x3RqV60Oc9tqwtr8eVgsMYZnjbKYJBoPwmIQGcEq2ExQSu4IOO
 HFIlYheQF2KUs4ly7N1iDDWGeqTJwt6kB7eqRVkrl2fnzyci4Em9smnOR/zKvyPjzLSF
 5aYlv1Q6M/EZeZBCn1b5FrHNgfq2gPqk4K3C5vYXtFqnhw4aALx1Drm479pnRNxN6vZN
 WU7/VTEDj3ZLv2P/AWsi3FDyttBQJhoVernkAe5s9KnAx/dGX+wngb+TinnrkuskYoc+
 LwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BMK2Tx+kwGAmYMCHy6MUgl+RIwVRP6pzB3y+fnPF6hY=;
 b=Hx/nwzjBEifQnacyXe6+RFfd29w9/B1Dh1NiW+EhUNtVfaYKMgjq8pjNjkYGGbx6V0
 kQRmbDqs6P1Ewq2XaKFRkPYi6XScqJv2Q2rzSAPUCeBJ0Vda+62oJDQ7AOVCgx+TpJBD
 aURpQFij7wkqB9tWsiCRzfHPX+02z0I5idBUC2lxp+l4ZC7a3ksmw5hjK52BqeQFFhUa
 YZyJBFZBL3eQAffAHofNO9gaMb2Kir4Y/AA5+x/5/4j9YjQeFlMHq+jrt0L7XfNhPSok
 CRrbqmN48lczxrXSrIuh9zRijbOh91n5dXE3ARmw4UB25x5eV5gF2KlH7QZIKyd4ncX9
 CDOQ==
X-Gm-Message-State: AOAM532G1eR6geTB8Ma7nQa8/qOd/Jlyc0hjZqSCHBoxRO2P6l5/FgJ2
 Qg1gPwHMz5ae6yc+FMExKEvmIjArcuI=
X-Google-Smtp-Source: ABdhPJxXauyeCAkLpp2QUC0KZ56hDSh/JlUFIa2PCS4Bbya385nco7Q54BHWQCiY6J2LlRrssQblQg==
X-Received: by 2002:a05:6214:d8b:: with SMTP id
 e11mr15587696qve.10.1635811046615; 
 Mon, 01 Nov 2021 16:57:26 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.174])
 by smtp.gmail.com with ESMTPSA id p187sm10927212qkd.101.2021.11.01.16.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:57:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/10] target/ppc/excp_helper.c: EBB handling adjustments
Date: Mon,  1 Nov 2021 20:56:42 -0300
Message-Id: <20211101235642.926773-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101235642.926773-1-danielhb413@gmail.com>
References: <20211101235642.926773-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf35.google.com
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
index 88aa0a84f8..d30020d991 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -798,14 +798,47 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
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


