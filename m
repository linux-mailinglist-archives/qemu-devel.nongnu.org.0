Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C918430D65
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 03:19:04 +0200 (CEST)
Received: from localhost ([::1]:46320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcHIt-0007j8-NH
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 21:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2k-0006nx-1A; Sun, 17 Oct 2021 21:02:26 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:42531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2i-0002Xw-39; Sun, 17 Oct 2021 21:02:21 -0400
Received: by mail-ua1-x936.google.com with SMTP id j8so805911uak.9;
 Sun, 17 Oct 2021 18:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BMK2Tx+kwGAmYMCHy6MUgl+RIwVRP6pzB3y+fnPF6hY=;
 b=icT/EVpbpcNXR0M823a/RG3Ej3yu4qxx7VTmaq+YT20QlhdvJVEHzAAuBGcszzm6WX
 wZeIylInIJYXif8cl1HkC+2LoSjTKm+erG+cLdCTpvMVR7qwmUiO664ubbFKJHX42aiw
 ZWvLK6PQewIoOnkaWuZ+O3MwuAZIrpmkcBfYFwnuNJ2qcp/AQJj9tdrBdzefCSDix1K4
 mMWSebno84wHC13iJ2VrW9c6apqwGRUisHFb/pKsU1l/KeMsmPZY0AaDaJUmFn+E7/Up
 +iygZ8SD5g7kRWcLZH4MOzMor1s24+rEpX0Nq2x6vsVd7jj/lkkJLlEkI3evYEYBX/P8
 5myg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BMK2Tx+kwGAmYMCHy6MUgl+RIwVRP6pzB3y+fnPF6hY=;
 b=eqeiLr5nkG/ZP2NPuVTdm5v5YZdMF/tcz7Cj93QTOy5Hjo3sv8ULB0FH9UdeNQ8m3x
 GqNuOKpTc0c2qbyjA7XfRLxtWK6Uxr/vpGkrZT5Xn4pxNYPPSXhy6cS7bHzPwCHvYIua
 LWxXwwUghcLjPHANgNlKV+pb85jI2+f+LIpkuHy/u9aKFHj3GU36DXms1xR9spE7/zOH
 PPc8hzAJ9QHrh8pOYt/7thDtchJM8pud2RYQGaC7My4nXHWVFKDHFA2FczQWT9dY3dDN
 LcpMrg2Wa8vxX+vHkZKvcxPTbX8RJv493j9V2Z5QBopZDV4ENkhkIzaF2VBkiOy/duWt
 UhFQ==
X-Gm-Message-State: AOAM533NYikNQkIxwks7JrOCgahlFsLb3BIn4uhXmu5SMhIoCp83soZX
 mDhdRKW24fataF1Z4slwD+yVpWlWIIA=
X-Google-Smtp-Source: ABdhPJx1ujorHbSAaEgko4apiqqzbNdeIOfDDTYJ0t5l7LlxWAu/22RqCcW1Ct1CaGADX3gFweH9Ww==
X-Received: by 2002:a05:6102:274e:: with SMTP id
 p14mr24568449vsu.24.1634518938886; 
 Sun, 17 Oct 2021 18:02:18 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.137.170])
 by smtp.gmail.com with ESMTPSA id m15sm8271607vsh.31.2021.10.17.18.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 18:02:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/15] target/ppc/excp_helper.c: EBB handling adjustments
Date: Sun, 17 Oct 2021 22:01:33 -0300
Message-Id: <20211018010133.315842-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018010133.315842-1-danielhb413@gmail.com>
References: <20211018010133.315842-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x936.google.com
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


