Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D29E44248A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 01:18:35 +0100 (CET)
Received: from localhost ([::1]:59232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhVa-0001X8-8A
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 20:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhB3-0004Fl-Ge; Mon, 01 Nov 2021 19:57:21 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:35481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhB1-0006IL-FZ; Mon, 01 Nov 2021 19:57:21 -0400
Received: by mail-qv1-xf33.google.com with SMTP id u25so12307682qve.2;
 Mon, 01 Nov 2021 16:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uu/3ai+6mOsetwv3GNxX8tuGWr1HpPh+SYvB8NVaZdg=;
 b=F6YSAgfD9apz3p3C1PFS1MmsciTAIi0JJNmhb8Z10fvdW/nEfbKVzA25J7fXltsMY9
 lzPvJ5Cpzd838AwyriaIRmcBb+NhLJeSxJVhKAsYQW4giqGbTYn7QNAfqfc4hXfo6LrN
 gT6K8YasArLcHLBX3gT5mfhZQ64ZVJNNnVg4u0jIW2+16ZLB4NOn7wfgttjwiqPUU9vF
 8V19L+3mNwMo8m2Yluyh4Q7DhRvbv2sAZLKS2c8094qfBL6WYC5ioWnzJ+rCP0Yspao1
 tg9NO/QRn7DTCoiw5TLk100j0YMFWEY4F14yP32JD3snfWJ+CQ5Kb8sAuxzQswwbvQLp
 1+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uu/3ai+6mOsetwv3GNxX8tuGWr1HpPh+SYvB8NVaZdg=;
 b=oJQITbVrhBoROWN/1vearS1phDwSJ5+o4K0oyv3C7u5Aq9rkXRVteBnprNYCwMCVim
 Ye7T7VzJ27KInK9P8vnJtJmRc0vWWbhFe1v8aKsUiAZ9qPSAXmPdJ5XI+yvBYNNdBKiw
 ilYTmBn7OuTD3h4ZqTXBHY6K1hWomvAunwq/CQy621UjFV3AAIuO/STwKKedwVOW0RFB
 qGYkQABw3P1XHVPWmg5QNjQJ5fwD3hmqWT4A70LlXYHJWujSceq0FZkKj7M3MRqROcCf
 Uap3QLo4BdSEYia5JJJ87FWee/iYCCDZ6Hs/v9xmV1UtyyYx3r8avMYurGmmao0zvI32
 M8/A==
X-Gm-Message-State: AOAM530voMtAXj9MxLEryCiEASoZRV0kMq9V0ZxgX4+AKhHlmZD7/Wjb
 4s1z2YbcWzM6AlKSJ8GVZ3IxdzlGKsc=
X-Google-Smtp-Source: ABdhPJwwZ6GD8wDmwCQToIXAIn0adFGZ9qLesjdJy2rBSAgyBdYR7axIxlyTNzJQMgpkwgJ6NiUnCw==
X-Received: by 2002:ad4:49cd:: with SMTP id j13mr21399373qvy.20.1635811038165; 
 Mon, 01 Nov 2021 16:57:18 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.174])
 by smtp.gmail.com with ESMTPSA id p187sm10927212qkd.101.2021.11.01.16.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:57:17 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/10] target/ppc/power8-pmu.c: handle overflow bits when
 PMU is running
Date: Mon,  1 Nov 2021 20:56:39 -0300
Message-Id: <20211101235642.926773-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101235642.926773-1-danielhb413@gmail.com>
References: <20211101235642.926773-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf33.google.com
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
index d66266829f..aa10233b29 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -288,6 +288,30 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
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
+        pmu_update_cycles(env);
+
+        start_cycle_count_session(env);
     }
 }
 
-- 
2.31.1


