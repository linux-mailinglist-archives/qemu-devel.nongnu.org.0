Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F4F430D5A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 03:14:09 +0200 (CEST)
Received: from localhost ([::1]:35720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcHE8-0000Uu-Tz
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 21:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2f-0006mG-07; Sun, 17 Oct 2021 21:02:17 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:43953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2d-0001rs-Gx; Sun, 17 Oct 2021 21:02:16 -0400
Received: by mail-ua1-x934.google.com with SMTP id i22so882490ual.10;
 Sun, 17 Oct 2021 18:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cIBxAEzk03kgT4b2tUQ2VAzjElnv0mZD6r9v+To1Y7E=;
 b=R0pQozuDIN0i4f42Bwyivb3MA+tlh0oszDRBEeMwy4++/K3C/rD/Pjf2t7le/+IFmS
 Yz0Y/Qh/vqdXF9TU6nz+3I8MKy8P7StQ+y45GwDgXZmrASqdtvmMFoFBKgFEWddeZXoQ
 dhbKTqERIJmBMMqjx5xGg/JgfITaNEmbk5BQYtwgtvSRuRQbAYr+5RqlKJ8bvYgbD3wX
 FjK7b6cZrYY0ogDlIanW7fkfn89RV84PPybtwbLUSd1Hkt6exu4w6uriusIO5kT1xHx7
 jRfuxbj0xqWv6weGVaiQ6dGFDm2hX7JdBpJE3HpBqHeM9qcMBRp5ZaMGZwTyQXIpdMD3
 0/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cIBxAEzk03kgT4b2tUQ2VAzjElnv0mZD6r9v+To1Y7E=;
 b=yalL1/rSmH7lioJVZLD5PQJWaIjtZvRg2rUnSUgd/E91apxnXTSG6d59gvWcUeyste
 TgfD5NXcEYP8d9i9aYWyeIm+Jf+DVJJuc07eaNrGRV0GvO6pVpqdIWVDYJKylMhdtw22
 RJcLAR3ShERxTHv2N+Ru068gcv1k4ofvR/k+QG0XeUiZIZc2XsFeBVwv+nTGlZSygdeX
 bCuI4FUph9OHWnZ6cIWdSXw3qNE1ELjHaRCNW4bvclAclheIGHFOHGf6KI6e9/54X6Nd
 fxSbI1+DutaFjKB45YJwhCnvFEue1DzreeUUYKDPb5DhMNiCeNrB3xAbfKLlRJOfN97O
 RsOQ==
X-Gm-Message-State: AOAM533KRXolgEuaYORrD3efSAaXEoh3NCNXLb+PMzj+peS2Nn6Qk8y2
 eyll6E+6KVb/e3yHJnZvGvtWey30QIs=
X-Google-Smtp-Source: ABdhPJyEgliJv8x66rRw7Now8bFw3jXmmx50omK7taSadiy9Yje4ygaUJBOgiFei0ydyd5EnPqZV1A==
X-Received: by 2002:a05:6102:32d6:: with SMTP id
 o22mr12565091vss.32.1634518931889; 
 Sun, 17 Oct 2021 18:02:11 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.137.170])
 by smtp.gmail.com with ESMTPSA id m15sm8271607vsh.31.2021.10.17.18.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 18:02:11 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/15] target/ppc/power8-pmu.c: handle overflow bits when
 PMU is running
Date: Sun, 17 Oct 2021 22:01:30 -0300
Message-Id: <20211018010133.315842-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018010133.315842-1-danielhb413@gmail.com>
References: <20211018010133.315842-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x934.google.com
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

Up until this moment we were assuming that the counter negative
enabled bits, PMC1CE and PMCjCE, would never be changed when the
PMU is already started.

Turns out that there is no such restriction in the PowerISA v3.1,
and software can enable/disable overflow conditions of the counters
at any time.

To support this scenario, track the overflow bits state when a
write in MMCR0 is made in which the run state of the PMU (MMCR0_FC
bit) didn't change and, if some overflow bit were changed in the
middle of a cycle count session, restart it.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8-pmu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 3fc09cebe4..4bd07ba865 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -277,6 +277,30 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
         } else {
             start_cycle_count_session(env);
         }
+    } else {
+        /*
+         * No change in MMCR0_FC state, but if the PMU is running and
+         * a change in the counter negative overflow bits is made,
+         * we need to restart a new cycle count session to restart
+         * the appropriate overflow timers.
+         */
+        if (curr_FC) {
+            return;
+        }
+
+        bool pmc1ce_curr = curr_value & MMCR0_PMC1CE;
+        bool pmc1ce_new  = value & MMCR0_PMC1CE;
+        bool pmcjce_curr = curr_value & MMCR0_PMCjCE;
+        bool pmcjce_new  = value & MMCR0_PMCjCE;
+
+        if (pmc1ce_curr == pmc1ce_new && pmcjce_curr == pmcjce_new) {
+            return;
+        }
+
+        /* Update the counter with the events counted so far */
+        pmu_events_update_cycles(env);
+
+        start_cycle_count_session(env);
     }
 }
 
-- 
2.31.1


