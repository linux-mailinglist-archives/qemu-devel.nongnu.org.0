Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AE9449ECB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 23:54:13 +0100 (CET)
Received: from localhost ([::1]:54952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkDWm-00051x-7D
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 17:54:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkDUR-0001lz-SH; Mon, 08 Nov 2021 17:51:48 -0500
Received: from [2607:f8b0:4864:20::229] (port=41972
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkDUP-0000Z1-Tv; Mon, 08 Nov 2021 17:51:47 -0500
Received: by mail-oi1-x229.google.com with SMTP id u74so9051249oie.8;
 Mon, 08 Nov 2021 14:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wEhzjJ2tChIizKtHFKzSMHPFIqsyie4TVEusXUHYHu0=;
 b=DTsUqCB+CuerGJmdXEbgXae/BhCnepWj239tWTaGuBVTowCQTFfXp9JxeLg9SjoOcl
 74om6wIpNJMbQilTPjEmAMNhB9waly+QgvaWn7keSe9ipWlDd8KwRDdgZbgfwIqIfHkv
 Uc142oLHj0PZwtmPGBjrXIRiZS58l76mvpJKZ7esEsW5uJhwSFrh+6KqcPJGViS23C5h
 X/S9SI5BQygwiQG+K/iZRn/Q0DADte1kxkgG0t1m35L7KX1BCCWznKs2oPDmOZbyEvtN
 /d3qqACw08qIHxr5xYZ1lPYBnUj2k/Gt/k/7hW2tzfXglDp8XmizhSoHrv9h1DsCiUhH
 qiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wEhzjJ2tChIizKtHFKzSMHPFIqsyie4TVEusXUHYHu0=;
 b=5+U64K7N1vuT67ZSnc2uY4KGeAw+guisHtx67P+JV/+fl1UDF2Nj0KU/9vb56pPcNp
 lESM71p3oZO3aXhEpaujvZqV/n+9Q7bVjZRuMhuRJrx25Ibnku8WbW116qm0aKrfY8BQ
 9SoEfqt/y5ByWc9sGsFDLOqYRyNRVmpUZCasUhmfqpFYQS/ygkFNiEJDMISpvv0SaDYd
 qazXMraj1JT21dNQF+87PJ8ZPPVQZ100nNtSBX8uJj0LNLbUu3hyct1NRw/BfSIhYClw
 9vw1aIh/TMDSu/yu+0ecXYIdSKB+O6c2d4R8TnSOIEt3vnjrtwmbM9fGla+If2VETvoi
 SYpg==
X-Gm-Message-State: AOAM533MbxDL7kQ9Bm0Ga3c+8VQXJRsBkZn77OTy8wlItVuPTxa6pfJZ
 44+ZI5g9lo8muo9Sqf07JIcQwyLpSGo=
X-Google-Smtp-Source: ABdhPJyLcRQUNtg7pXG1o93S6K9veiyqcQ/ZO0fQMkBpoHgHuNuP6hsQra6A6s9wcf9KBnr2Hvl3tQ==
X-Received: by 2002:a54:4486:: with SMTP id v6mr1748550oiv.90.1636411898995;
 Mon, 08 Nov 2021 14:51:38 -0800 (PST)
Received: from rekt.ibmuc.com ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id h3sm6487249oih.23.2021.11.08.14.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 14:51:38 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/10] target/ppc/excp_helper.c: EBB handling adjustments
Date: Mon,  8 Nov 2021 19:50:47 -0300
Message-Id: <20211108225047.1733607-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211108225047.1733607-1-danielhb413@gmail.com>
References: <20211108225047.1733607-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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


